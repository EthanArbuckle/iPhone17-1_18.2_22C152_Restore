unint64_t sub_248771518(char a1)
{
  unint64_t result;

  result = 0xD000000000000010;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD00000000000002FLL;
    }
    else {
      return 0xD000000000000025;
    }
  }
  return result;
}

uint64_t sub_248771578(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_248774588(*a1, *a2);
}

uint64_t sub_248771584()
{
  return sub_24877158C();
}

uint64_t sub_24877158C()
{
  return sub_2487A6928();
}

uint64_t sub_248771638()
{
  return sub_248771640();
}

uint64_t sub_248771640()
{
  sub_2487A63E8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2487716D4()
{
  return sub_2487716DC();
}

uint64_t sub_2487716DC()
{
  return sub_2487A6928();
}

uint64_t sub_248771784@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_248771A48();
  *a1 = result;
  return result;
}

unint64_t sub_2487717B4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_248771518(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Entitlement(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Entitlement(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24877194CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_248771974(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_248771980(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Entitlement()
{
  return &type metadata for Entitlement;
}

void type metadata accessor for STAskForTimeAnswer()
{
  if (!qword_269327300)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269327300);
    }
  }
}

unint64_t sub_2487719F4()
{
  unint64_t result = qword_269327308;
  if (!qword_269327308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327308);
  }
  return result;
}

uint64_t sub_248771A48()
{
  unint64_t v0 = sub_2487A6838();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

BOOL sub_248771A94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_248771AA8()
{
  return sub_2487A6928();
}

uint64_t sub_248771AF0()
{
  return sub_2487A6918();
}

uint64_t sub_248771B1C()
{
  return sub_2487A6928();
}

uint64_t sub_248771B70(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 248) = a3;
  *(void *)(v4 + 256) = v3;
  *(void *)(v4 + 240) = a2;
  *(unsigned char *)(v4 + 424) = a1;
  *(void *)(v4 + 264) = *v3;
  return MEMORY[0x270FA2498](sub_248771BC0, 0, 0);
}

uint64_t sub_248771BC0()
{
  uint64_t v1 = *(void *)(v0 + 256);
  char v2 = *(unsigned char *)(v0 + 424);
  *(void *)(v1 + 32) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v1 + 88) = 0;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(unsigned char *)(v1 + 16) = v2 & 1;
  if (v2)
  {
    sub_2487A6178();
  }
  else
  {
    if (MEMORY[0x263F5D180]) {
      BOOL v3 = MEMORY[0x263F5D190] == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3 && MEMORY[0x263F5D188] != 0) {
      sub_2487A60B8();
    }
  }
  id v5 = objc_allocWithZone(MEMORY[0x263F04DE8]);
  unsigned int v6 = (void *)sub_2487A63A8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithExtensionPointIdentifier_, v6);
  *(void *)(v0 + 272) = v7;

  int v8 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693274A0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2487A73B0;
  *(void *)(v9 + 32) = v7;
  sub_2487A64D8();
  sub_2487741E0(0, &qword_2693274A8);
  id v10 = v7;
  uint64_t v11 = sub_2487A64A8();
  *(void *)(v0 + 280) = v11;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 216;
  *(void *)(v0 + 24) = sub_248771E24;
  uint64_t v12 = swift_continuation_init();
  *(void *)(v0 + 176) = MEMORY[0x263EF8330];
  *(void *)(v0 + 184) = 0x40000000;
  *(void *)(v0 + 192) = sub_248772E10;
  *(void *)(v0 + 200) = &block_descriptor_2;
  *(void *)(v0 + 208) = v12;
  objc_msgSend(v8, sel_executeQueries_completionHandler_, v11, v0 + 176);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_248771E24()
{
  return MEMORY[0x270FA2498](sub_248771F04, 0, 0);
}

uint64_t sub_248771F04()
{
  uint64_t v63 = v0;
  unint64_t v1 = *(void *)(v0 + 216);

  if (qword_269327238 != -1) {
LABEL_49:
  }
    swift_once();
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_269329200);
  swift_bridgeObjectRetain_n();
  BOOL v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  unint64_t v5 = v1 >> 62;
  v60 = (id *)v1;
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v56 = v4;
    log = v3;
    char v6 = *(unsigned char *)(v59 + 424);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    uint64_t v61 = v55;
    *(_DWORD *)uint64_t v7 = 136315394;
    if (v6) {
      uint64_t v8 = 0xD00000000000002ALL;
    }
    else {
      uint64_t v8 = 0xD000000000000033;
    }
    if (v6) {
      unint64_t v9 = 0x80000002487A86B0;
    }
    else {
      unint64_t v9 = 0x80000002487A8700;
    }
    *(void *)(v59 + 224) = sub_2487A24A8(v8, v9, &v61);
    uint64_t v54 = v59 + 232;
    sub_2487A6698();
    swift_bridgeObjectRelease();
    v57 = (uint8_t *)v7;
    *(_WORD *)(v7 + 12) = 2080;
    if (v5)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_2487A67E8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v11 = MEMORY[0x263F8EE78];
    if (v10)
    {
      uint64_t v62 = MEMORY[0x263F8EE78];
      uint64_t v12 = sub_248774030(0, v10 & ~(v10 >> 63), 0);
      if (v10 < 0)
      {
        __break(1u);
        return MEMORY[0x270EEB850](v12, v13);
      }
      uint64_t v14 = 0;
      uint64_t v11 = v62;
      do
      {
        if ((v1 & 0xC000000000000001) != 0) {
          id v15 = (id)MEMORY[0x24C57F1A0](v14, v1);
        }
        else {
          id v15 = *(id *)(v1 + 8 * v14 + 32);
        }
        v16 = v15;
        id v17 = objc_msgSend(v15, sel_bundleIdentifier, v54);
        uint64_t v18 = sub_2487A63B8();
        uint64_t v20 = v19;

        uint64_t v62 = v11;
        unint64_t v22 = *(void *)(v11 + 16);
        unint64_t v21 = *(void *)(v11 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_248774030(v21 > 1, v22 + 1, 1);
          uint64_t v11 = v62;
        }
        ++v14;
        *(void *)(v11 + 16) = v22 + 1;
        uint64_t v23 = v11 + 16 * v22;
        *(void *)(v23 + 32) = v18;
        *(void *)(v23 + 40) = v20;
      }
      while (v10 != v14);
    }
    uint64_t v24 = MEMORY[0x24C57EEE0](v11, MEMORY[0x263F8D310]);
    unint64_t v26 = v25;
    swift_bridgeObjectRelease();
    *(void *)(v59 + 232) = sub_2487A24A8(v24, v26, &v61);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, log, v56, "Extension bundleId: %s ; Found identities %s", v57, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v55, -1, -1);
    MEMORY[0x24C57FA90](v57, -1, -1);

    unint64_t v5 = v1 >> 62;
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2487A67E8();
    if (v27)
    {
LABEL_25:
      uint64_t v28 = 0;
      unint64_t v29 = v1 & 0xC000000000000001;
      if (*(unsigned char *)(v59 + 424)) {
        unint64_t v30 = 0xD00000000000002ALL;
      }
      else {
        unint64_t v30 = 0xD000000000000033;
      }
      if (*(unsigned char *)(v59 + 424)) {
        unint64_t v31 = 0x80000002487A86B0;
      }
      else {
        unint64_t v31 = 0x80000002487A8700;
      }
      while (1)
      {
        if (v29) {
          v32 = (id *)MEMORY[0x24C57F1A0](v28, v1);
        }
        else {
          v32 = (id *)*(id *)(v1 + 8 * v28 + 32);
        }
        unint64_t v1 = (unint64_t)v32;
        *(void *)(v59 + 288) = v32;
        uint64_t v33 = v28 + 1;
        if (__OFADD__(v28, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        id v34 = objc_msgSend(v32, sel_bundleIdentifier);
        uint64_t v35 = sub_2487A63B8();
        uint64_t v37 = v36;

        if (v35 == v30 && v37 == v31) {
          break;
        }
        char v39 = sub_2487A6868();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v39) {
          goto LABEL_45;
        }

        ++v28;
        unint64_t v1 = (unint64_t)v60;
        if (v33 == v27) {
          goto LABEL_41;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_45:
      swift_bridgeObjectRelease_n();
      uint64_t v45 = sub_2487A5F28();
      *(void *)(v59 + 296) = v45;
      uint64_t v46 = *(void *)(v45 - 8);
      *(void *)(v59 + 304) = v46;
      *(void *)(v59 + 312) = swift_task_alloc();
      v47 = (id *)(id)v1;
      sub_2487A5F38();
      uint64_t v48 = sub_2487A5EE8();
      *(void *)(v59 + 320) = v48;
      uint64_t v49 = *(void *)(v48 - 8);
      *(void *)(v59 + 328) = v49;
      *(void *)(v59 + 336) = swift_task_alloc();
      swift_task_alloc();
      (*(void (**)(void))(v46 + 16))();
      sub_2487A5ED8();
      swift_task_dealloc();
      uint64_t v50 = sub_2487A5F18();
      *(void *)(v59 + 344) = v50;
      *(void *)(v59 + 352) = *(void *)(v50 - 8);
      uint64_t v51 = swift_task_alloc();
      *(void *)(v59 + 360) = v51;
      uint64_t v52 = swift_task_alloc();
      *(void *)(v59 + 368) = v52;
      (*(void (**)(void))(v49 + 16))();
      v53 = (void *)swift_task_alloc();
      *(void *)(v59 + 376) = v53;
      void *v53 = v59;
      v53[1] = sub_2487726E0;
      uint64_t v12 = v51;
      uint64_t v13 = v52;
      return MEMORY[0x270EEB850](v12, v13);
    }
  }
  else
  {
    uint64_t v27 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_41:
  v40 = *(void **)(v59 + 272);
  swift_bridgeObjectRelease_n();
  sub_248773F5C();
  swift_allocError();
  unsigned char *v41 = 0;
  swift_willThrow();

  uint64_t v42 = *(void *)(v59 + 256);
  sub_248773FB0(v42 + 24);

  sub_248773FD8(*(void *)(v42 + 64));
  sub_248773FD8(*(void *)(v42 + 80));
  swift_deallocPartialClassInstance();
  v43 = *(uint64_t (**)(void))(v59 + 8);
  return v43();
}

uint64_t sub_2487726E0()
{
  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_248772CEC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2487727FC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2487727FC()
{
  uint64_t v1 = *(void *)(v0 + 384);
  uint64_t v2 = *(void *)(v0 + 256);
  *(void *)(v0 + 392) = MEMORY[0x24C57E8E0]();
  *(_DWORD *)(v0 + 400) = v3;
  *(_DWORD *)(v0 + 404) = v4;
  *(_DWORD *)(v0 + 408) = v5;
  *(_DWORD *)(v0 + 412) = v6;
  *(_DWORD *)(v0 + 416) = v7;
  *(_DWORD *)(v0 + 420) = v8;
  *(_DWORD *)(v2 + 40) = audit_token_to_pid((audit_token_t *)(v0 + 392));
  uint64_t v9 = sub_2487A5F08();
  if (v1)
  {
    uint64_t v11 = *(void *)(v0 + 352);
    uint64_t v10 = *(void *)(v0 + 360);
    uint64_t v12 = *(void *)(v0 + 336);
    uint64_t v13 = *(void *)(v0 + 344);
    uint64_t v14 = *(void *)(v0 + 320);
    uint64_t v15 = *(void *)(v0 + 328);
    uint64_t v16 = *(void *)(v0 + 304);
    uint64_t v17 = *(void *)(v0 + 312);
    uint64_t v42 = *(void *)(v0 + 296);
    uint64_t v18 = *(void **)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v13);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v42);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(void *)(v0 + 256);
    sub_248773FB0(v22 + 24);

    sub_248773FD8(*(void *)(v22 + 64));
    sub_248773FD8(*(void *)(v22 + 80));
    swift_deallocPartialClassInstance();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
  else
  {
    uint64_t v19 = (void *)v9;
    if (*(unsigned char *)(v0 + 424)) {
      unint64_t v20 = 0xD00000000000002ALL;
    }
    else {
      unint64_t v20 = 0xD000000000000033;
    }
    if (*(unsigned char *)(v0 + 424)) {
      unint64_t v21 = 0x80000002487A86B0;
    }
    else {
      unint64_t v21 = 0x80000002487A8700;
    }
    (*(void (**)(uint64_t, unint64_t, unint64_t))(v0 + 240))(v9, v20, v21);
    uint64_t v25 = *(void *)(v0 + 352);
    uint64_t v38 = *(void *)(v0 + 344);
    uint64_t v39 = *(void *)(v0 + 360);
    uint64_t v26 = *(void *)(v0 + 328);
    uint64_t v40 = *(void *)(v0 + 320);
    uint64_t v41 = *(void *)(v0 + 336);
    uint64_t v27 = *(void *)(v0 + 304);
    uint64_t v43 = *(void *)(v0 + 296);
    uint64_t v44 = *(void *)(v0 + 312);
    uint64_t v36 = *(void **)(v0 + 288);
    uint64_t v37 = *(void **)(v0 + 272);
    uint64_t v28 = *(void *)(v0 + 256);
    swift_bridgeObjectRelease();
    *(void *)(v28 + 48) = v19;
    uint64_t v29 = swift_allocObject();
    swift_weakInit();
    *(void *)(v0 + 112) = sub_248774020;
    *(void *)(v0 + 120) = v29;
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 1107296256;
    *(void *)(v0 + 96) = sub_24878D134;
    *(void *)(v0 + 104) = &block_descriptor_6;
    unint64_t v30 = _Block_copy((const void *)(v0 + 80));
    id v31 = v19;
    swift_release();
    objc_msgSend(v31, sel_setInterruptionHandler_, v30);
    _Block_release(v30);
    uint64_t v32 = swift_allocObject();
    swift_weakInit();
    *(void *)(v0 + 160) = sub_248774028;
    *(void *)(v0 + 168) = v32;
    *(void *)(v0 + 128) = MEMORY[0x263EF8330];
    *(void *)(v0 + 136) = 1107296256;
    *(void *)(v0 + 144) = sub_24878D134;
    *(void *)(v0 + 152) = &block_descriptor_10;
    uint64_t v33 = _Block_copy((const void *)(v0 + 128));
    swift_release();
    objc_msgSend(v31, sel_setInvalidationHandler_, v33);
    _Block_release(v33);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v39, v38);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v41, v40);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v44, v43);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v34 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v35 = *(void *)(v0 + 256);
    return v34(v35);
  }
}

uint64_t sub_248772CEC()
{
  uint64_t v2 = *(void *)(v0 + 328);
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 320);
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v6 = *(void *)(v0 + 304);
  int v7 = *(void **)(v0 + 272);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v0 + 256);
  sub_248773FB0(v8 + 24);

  sub_248773FD8(*(void *)(v8 + 64));
  sub_248773FD8(*(void *)(v8 + 80));
  swift_deallocPartialClassInstance();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_248772E10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_2487741E0(0, &qword_2693274B0);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_2487A64B8();

  return MEMORY[0x270FA2400](v1);
}

uint64_t sub_248772E88()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = *(void (**)(uint64_t))(result + 64);
    if (v1)
    {
      uint64_t v2 = swift_retain();
      v1(v2);
      sub_248773FD8((uint64_t)v1);
    }
    sub_248772F14();
    return swift_release();
  }
  return result;
}

id sub_248772F14()
{
  uint64_t v1 = v0;
  if (qword_269327238 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_269329200);
  swift_retain_n();
  uint64_t v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 67109378;
    sub_2487A6698();
    *(_WORD *)(v5 + 8) = 2080;
    if (*(unsigned char *)(v1 + 16)) {
      uint64_t v7 = 0xD00000000000002ALL;
    }
    else {
      uint64_t v7 = 0xD000000000000033;
    }
    if (*(unsigned char *)(v1 + 16)) {
      unint64_t v8 = 0x80000002487A86B0;
    }
    else {
      unint64_t v8 = 0x80000002487A8700;
    }
    sub_2487A24A8(v7, v8, &v12);
    sub_2487A6698();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v3, v4, "Invalidating assertion for extension with PID %d and bundleId %s", (uint8_t *)v5, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v6, -1, -1);
    MEMORY[0x24C57FA90](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v9 = *(void **)(v1 + 56);
  if (v9)
  {
    objc_msgSend(v9, sel_invalidate);
    uint64_t v10 = *(void **)(v1 + 56);
  }
  else
  {
    uint64_t v10 = 0;
  }
  *(void *)(v1 + 56) = 0;

  return objc_msgSend(*(id *)(v1 + 48), sel_invalidate);
}

uint64_t sub_248773140()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = *(void (**)(uint64_t))(result + 80);
    if (v1)
    {
      uint64_t v2 = swift_retain();
      v1(v2);
      sub_248773FD8((uint64_t)v1);
    }
    sub_248772F14();
    return swift_release();
  }
  return result;
}

void sub_2487731CC()
{
  objc_msgSend(*(id *)(v0 + 48), sel_activate);
  uint64_t v1 = *(void **)(v0 + 56);
  if (v1 && objc_msgSend(v1, sel_valid))
  {
    if (qword_269327238 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2487A5F68();
    __swift_project_value_buffer(v2, (uint64_t)qword_269329200);
    uint64_t v3 = sub_2487A5F48();
    os_log_type_t v4 = sub_2487A6598();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = v6;
      *(_DWORD *)uint64_t v5 = 136315138;
      sub_2487A24A8(0x6574617669746361, 0xEA00000000002928, &v7);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v3, v4, "%s was called, but there was already a valid assertion for the extension process", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v6, -1, -1);
      MEMORY[0x24C57FA90](v5, -1, -1);
    }
  }
  else
  {
    sub_248773384();
  }
}

void sub_248773384()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000033;
  if (*(unsigned char *)(v0 + 16)) {
    unint64_t v2 = 0xD00000000000002ALL;
  }
  uint64_t v26 = v2;
  if (*(unsigned char *)(v0 + 16)) {
    unint64_t v3 = 0x80000002487A86B0;
  }
  else {
    unint64_t v3 = 0x80000002487A8700;
  }
  if (qword_269327238 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2487A5F68();
  __swift_project_value_buffer(v4, (uint64_t)qword_269329200);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_2487A5F48();
  os_log_type_t v6 = sub_2487A65B8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v27 = v8;
    *(_DWORD *)uint64_t v7 = 67109378;
    swift_release();
    sub_2487A6698();
    swift_release();
    *(_WORD *)(v7 + 8) = 2080;
    swift_bridgeObjectRetain();
    sub_2487A24A8(v26, v3, &v27);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v5, v6, "Initializing assertion for extension with PID %d and bundleId %s", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v8, -1, -1);
    MEMORY[0x24C57FA90](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v9 = *(unsigned int *)(v0 + 40);
  id v10 = objc_allocWithZone(MEMORY[0x263F28180]);
  uint64_t v11 = (void *)sub_2487A63A8();
  id v12 = objc_msgSend(v10, sel_initWithPID_flags_reason_name_, v9, 10, 13, v11);

  if (v12)
  {
    id v13 = v12;
    unsigned __int8 v14 = objc_msgSend(v13, sel_acquire);
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_2487A5F48();
    if (v14)
    {
      os_log_type_t v16 = sub_2487A65B8();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v25 = v13;
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v27 = v18;
        *(_DWORD *)uint64_t v17 = 136315138;
        swift_bridgeObjectRetain();
        sub_2487A24A8(v26, v3, &v27);
        sub_2487A6698();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v15, v16, "Successfully acquired assertion for extension with bundleId %s", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v18, -1, -1);
        MEMORY[0x24C57FA90](v17, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v23 = *(void **)(v1 + 56);
      *(void *)(v1 + 56) = v12;
    }
    else
    {
      os_log_type_t v20 = sub_2487A6598();
      if (os_log_type_enabled(v15, v20))
      {
        unint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v27 = v22;
        *(_DWORD *)unint64_t v21 = 136315138;
        swift_bridgeObjectRetain();
        sub_2487A24A8(v26, v3, &v27);
        sub_2487A6698();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v15, v20, "Failed to acquire assertion for extension with bundleId %s", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v22, -1, -1);
        MEMORY[0x24C57FA90](v21, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_248773F5C();
      swift_allocError();
      *uint64_t v24 = 5;
      swift_willThrow();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_248773F5C();
    swift_allocError();
    *uint64_t v19 = 4;
    swift_willThrow();
  }
}

void sub_248773904()
{
  uint64_t v1 = *(void **)(v0 + 48);
  aBlock[4] = sub_248773C08;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248773DE4;
  aBlock[3] = &block_descriptor_1;
  unint64_t v2 = _Block_copy(aBlock);
  id v3 = objc_msgSend(v1, sel_remoteObjectProxyWithErrorHandler_, v2);
  _Block_release(v2);
  sub_2487A66C8();
  swift_unknownObjectRelease();
  uint64_t v4 = *(void **)(v0 + 56);
  if (!v4 || (objc_msgSend(v4, sel_valid) & 1) == 0)
  {
    if (qword_269327238 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_2487A5F68();
    __swift_project_value_buffer(v5, (uint64_t)qword_269329200);
    os_log_type_t v6 = sub_2487A5F48();
    os_log_type_t v7 = sub_2487A6598();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24876F000, v6, v7, "Trying to obtain a remote proxy without a valid assertion. Re-acquiring assertion.", v8, 2u);
      MEMORY[0x24C57FA90](v8, -1, -1);
    }

    sub_248773384();
  }
}

void sub_248773C08(void *a1)
{
  if (qword_269327238 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_269329200);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_2487A5F48();
  os_log_type_t v5 = sub_2487A6598();
  if (os_log_type_enabled(oslog, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 138412290;
    id v8 = a1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    sub_2487A6698();
    *os_log_type_t v7 = v10;

    _os_log_impl(&dword_24876F000, oslog, v5, "Error obtaining remote proxy: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v7, -1, -1);
    MEMORY[0x24C57FA90](v6, -1, -1);
  }
  else
  {
  }
}

void sub_248773DE4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_248773E4C()
{
  sub_248773FB0(v0 + 24);

  sub_248773FD8(*(void *)(v0 + 64));
  sub_248773FD8(*(void *)(v0 + 80));

  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for AppExtensionConnection()
{
  return self;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_248773F5C()
{
  unint64_t result = qword_269327490;
  if (!qword_269327490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269327490);
  }
  return result;
}

uint64_t sub_248773FB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_248773FD8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_248773FE8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_248774020()
{
  return sub_248772E88();
}

uint64_t sub_248774028()
{
  return sub_248773140();
}

uint64_t sub_248774030(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_248774070(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_248774050(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24877421C(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_248774070(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327AB0);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  unsigned __int8 v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2487A6828();
  __break(1u);
  return result;
}

uint64_t sub_2487741E0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24877421C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693274B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  unsigned __int8 v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2487A6828();
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for ExtensionConnectionError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
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
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ExtensionConnectionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2487744E8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionConnectionError()
{
  return &type metadata for ExtensionConnectionError;
}

unint64_t sub_248774524()
{
  unint64_t result = qword_2693274C0;
  if (!qword_2693274C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693274C0);
  }
  return result;
}

uint64_t sub_248774588(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x80000002487A8410;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD00000000000002FLL;
    }
    else {
      unint64_t v5 = 0xD000000000000025;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x80000002487A8430;
    }
    else {
      unint64_t v6 = 0x80000002487A8460;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000010;
  unint64_t v6 = 0x80000002487A8410;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0xD00000000000002FLL;
    }
    else {
      unint64_t v2 = 0xD000000000000025;
    }
    if (v7 == 1) {
      unint64_t v3 = 0x80000002487A8430;
    }
    else {
      unint64_t v3 = 0x80000002487A8460;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2487A6868();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_248774688(unint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  switch(a3 >> 6)
  {
    case 1:
      sub_2487A6758();
      sub_2487A6408();
      sub_2487A6068();
      sub_2487A6408();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    case 2:
      sub_2487A6758();
      sub_2487A6408();
      sub_2487A6408();
      sub_2487A6408();
      sub_2487A67A8();
LABEL_8:
      sub_2487A6408();
      return 0;
    case 3:
      if (!(a2 | a1) && a3 == 192) {
        return 0xD000000000000056;
      }
      BOOL v9 = a1 == 1 && a2 == 0;
      if (v9 && a3 == 192) {
        return 0xD000000000000047;
      }
      else {
        return 0xD000000000000029;
      }
    default:
      id v6 = (id)a1;
      sub_2487A6758();
      sub_2487A6408();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2693274E8);
      sub_2487A67A8();
      sub_24877736C((void *)a1, a2, a3);
      return 0;
  }
}

uint64_t sub_24877492C()
{
  return sub_248774688(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_248774938()
{
  return sub_2487A5DC8();
}

uint64_t sub_248774950()
{
  return sub_2487A5DD8();
}

uint64_t sub_248774968()
{
  return sub_2487A5DB8();
}

uint64_t sub_248774980(uint64_t a1, uint64_t a2)
{
  return sub_248776E84(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_24877499C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for IDSLookupController();
  MEMORY[0x270FA5388](v4);
  id v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_248797D60((uint64_t)v6);
  v16[3] = v4;
  v16[4] = (uint64_t)&off_26FC7ED20;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  sub_248774B24((uint64_t)v6, (uint64_t)boxed_opaque_existential_1);
  unsigned __int8 v14 = &type metadata for MessagesSPI;
  uint64_t v15 = &off_26FC7E008;
  uint64_t v10 = 0;
  swift_unknownObjectWeakInit();
  uint64_t v10 = a1;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  sub_2487770FC((uint64_t)v16, (uint64_t)&v11, &qword_2693274C8);
  sub_248777284(&v13, (uint64_t)&v12);
  sub_248774B88((uint64_t)v9, a2);
  return sub_248774BEC((uint64_t)v6);
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

uint64_t sub_248774B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IDSLookupController();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248774B88(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakTakeInit();
  *(void *)(a2 + 8) = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 48) = v4;
  long long v6 = *(_OWORD *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  *(void *)(a2 + 88) = *(void *)(a1 + 88);
  *(_OWORD *)(a2 + 56) = v7;
  *(_OWORD *)(a2 + 72) = v6;
  return a2;
}

uint64_t sub_248774BEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IDSLookupController();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248774C48(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 320) = a4;
  *(void *)(v5 + 328) = v4;
  *(unsigned char *)(v5 + 424) = a3;
  *(void *)(v5 + 304) = a1;
  *(void *)(v5 + 312) = a2;
  return MEMORY[0x270FA2498](sub_248774C70, 0, 0);
}

uint64_t sub_248774C70()
{
  uint64_t v81 = v0;
  uint64_t v1 = *(void *)(*(void *)(v0 + 312) + 32);
  *(void *)(v0 + 336) = v1;
  if (!*(void *)(v1 + 16))
  {
    if (qword_269327240 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2487A5F68();
    __swift_project_value_buffer(v17, (uint64_t)qword_269329218);
    swift_retain_n();
    uint64_t v18 = sub_2487A5F48();
    os_log_type_t v19 = sub_2487A6598();
    if (os_log_type_enabled(v18, v19))
    {
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v80[0] = v21;
      *(_DWORD *)os_log_type_t v20 = 136315138;
      uint64_t v22 = sub_2487A6068();
      *(void *)(v0 + 272) = sub_2487A24A8(v22, v23, v80);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24876F000, v18, v19, "There were no ids handles in the privledged recipient group derived from  \"%s\"", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v21, -1, -1);
      MEMORY[0x24C57FA90](v20, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v32 = *(unsigned __int16 *)(*(void *)(v0 + 312) + 26);
    sub_2487770A8();
    swift_allocError();
    *(void *)uint64_t v33 = v32;
    *(void *)(v33 + 8) = 0;
    char v34 = 64;
    goto LABEL_55;
  }
  int v2 = *(unsigned __int8 *)(v0 + 424);
  unint64_t v3 = *(void **)(v0 + 304);
  *(void *)(v0 + 344) = v3[7];
  *(void *)(v0 + 352) = v3[8];
  *(void *)(v0 + 360) = v3[9];
  MEMORY[0x24C57EC90]();
  if (v2 == 1)
  {
    uint64_t v4 = MEMORY[0x24C57FB80](*(void *)(v0 + 328));
    *(void *)(v0 + 368) = v4;
    if (v4)
    {
      uint64_t v5 = v4;
      if (sub_248790ABC(0xD00000000000002FLL, 0x80000002487A8430))
      {
        long long v6 = (long long *)(v0 + 56);
        if (qword_269327240 != -1) {
          swift_once();
        }
        long long v7 = *(uint64_t **)(v0 + 304);
        uint64_t v8 = sub_2487A5F68();
        *(void *)(v0 + 376) = __swift_project_value_buffer(v8, (uint64_t)qword_269329218);
        sub_2487768CC(v7);
        sub_2487768CC(v7);
        BOOL v9 = sub_2487A5F48();
        os_log_type_t v10 = sub_2487A65B8();
        BOOL v11 = os_log_type_enabled(v9, v10);
        uint64_t v12 = *(uint64_t **)(v0 + 304);
        if (v11)
        {
          log = v9;
          long long v13 = (uint8_t *)swift_slowAlloc();
          uint64_t v78 = swift_slowAlloc();
          v80[0] = v78;
          *(_DWORD *)long long v13 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v14 = sub_2487A6568();
          unint64_t v16 = v15;
          swift_bridgeObjectRelease();
          *(void *)(v0 + 288) = sub_2487A24A8(v14, v16, v80);
          sub_2487A6698();
          long long v6 = (long long *)(v0 + 56);
          swift_bridgeObjectRelease();
          sub_2487769A8(v12);
          sub_2487769A8(v12);
          BOOL v9 = log;
          _os_log_impl(&dword_24876F000, log, v10, "Looking for IDS endpoints that don't support the following reg caps: %s", v13, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C57FA90](v78, -1, -1);
          MEMORY[0x24C57FA90](v13, -1, -1);
        }
        else
        {
          sub_2487769A8(*(uint64_t **)(v0 + 304));
          sub_2487769A8(v12);
        }

        sub_2487771BC(*(void *)(v0 + 328) + 16, (uint64_t)v6);
        if (*(void *)(v0 + 80))
        {
          uint64_t v50 = *(void *)(v0 + 304);
          sub_248777284(v6, v0 + 16);
          __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
          uint64_t v51 = *(void *)(v50 + 48);
          *(void *)(v0 + 384) = v51;
          uint64_t v52 = (void *)swift_task_alloc();
          *(void *)(v0 + 392) = v52;
          *uint64_t v52 = v0;
          v52[1] = sub_2487759AC;
          return sub_24879A29C(v51, v1);
        }
        sub_248777224((uint64_t)v6);
        uint64_t v59 = sub_2487A5F48();
        os_log_type_t v60 = sub_2487A6598();
        if (os_log_type_enabled(v59, v60))
        {
          uint64_t v61 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v61 = 0;
          _os_log_impl(&dword_24876F000, v59, v60, "Needed to lookup unsupported destinations, but idsLookupController was nil.", v61, 2u);
          MEMORY[0x24C57FA90](v61, -1, -1);
        }

        sub_2487770A8();
        swift_allocError();
        *(void *)uint64_t v57 = 0;
        *(void *)(v57 + 8) = 0;
        char v58 = -64;
      }
      else
      {
        if (qword_269327240 != -1) {
          swift_once();
        }
        uint64_t v41 = sub_2487A5F68();
        __swift_project_value_buffer(v41, (uint64_t)qword_269329218);
        uint64_t v42 = sub_2487A5F48();
        os_log_type_t v43 = sub_2487A6598();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          uint64_t v45 = swift_slowAlloc();
          v80[0] = v45;
          *(_DWORD *)uint64_t v44 = 136315138;
          *(void *)(v0 + 224) = sub_2487A24A8(0xD00000000000002FLL, 0x80000002487A8430, v80);
          sub_2487A6698();
          _os_log_impl(&dword_24876F000, v42, v43, "Missing entitlement %s. Ignoring IDS destinations that don't support.", v44, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C57FA90](v45, -1, -1);
          MEMORY[0x24C57FA90](v44, -1, -1);
        }

        uint64_t v46 = *(void *)(v5 + 64);
        if (v46)
        {
          uint64_t v47 = *(void *)(v5 + 56);
          sub_2487770A8();
          swift_allocError();
          *(void *)uint64_t v48 = v47;
          *(void *)(v48 + 8) = v46;
          *(unsigned char *)(v48 + 16) = -127;
          swift_bridgeObjectRetain();
LABEL_44:
          swift_willThrow();
          swift_unknownObjectRelease();
LABEL_56:
          v77 = *(uint64_t (**)(void))(v0 + 8);
          goto LABEL_57;
        }
        *(_DWORD *)(v0 + 420) = objc_msgSend(*(id *)(v5 + 32), sel_processIdentifier);
        uint64_t v54 = sub_2487A6848();
        uint64_t v56 = v55;
        sub_2487770A8();
        swift_allocError();
        *(void *)uint64_t v57 = v54;
        *(void *)(v57 + 8) = v56;
        char v58 = -127;
      }
      *(unsigned char *)(v57 + 16) = v58;
      goto LABEL_44;
    }
    if (qword_269327240 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_2487A5F68();
    __swift_project_value_buffer(v35, (uint64_t)qword_269329218);
    uint64_t v36 = sub_2487A5F48();
    os_log_type_t v37 = sub_2487A6598();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v80[0] = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      *(void *)(v0 + 240) = sub_2487A24A8(0xD00000000000002FLL, 0x80000002487A8430, v80);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v36, v37, "Unable to to check for %s entitlement because caller is nil. Bailing from send.", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v39, -1, -1);
      MEMORY[0x24C57FA90](v38, -1, -1);
    }

    sub_2487770A8();
    swift_allocError();
    long long v40 = xmmword_2487A7560;
    goto LABEL_54;
  }
  MEMORY[0x24C57EC90](*(void *)(v0 + 344), *(void *)(v0 + 352), *(void *)(v0 + 360), 1700);
  if (qword_269327240 != -1) {
    swift_once();
  }
  uint64_t v24 = *(uint64_t **)(v0 + 304);
  uint64_t v25 = sub_2487A5F68();
  __swift_project_value_buffer(v25, (uint64_t)qword_269329218);
  swift_retain();
  sub_2487768CC(v24);
  swift_retain();
  uint64_t v26 = sub_2487A5F48();
  os_log_type_t v27 = sub_2487A65B8();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = *(void *)(v0 + 304);
    uint64_t v29 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v80[0] = v30;
    *(_DWORD *)uint64_t v29 = 134218242;
    sub_2487770FC(v28, v0 + 208, &qword_2693274E0);
    sub_2487770FC(v0 + 208, v0 + 160, &qword_2693274E0);
    if (*(void *)(v0 + 168) >> 60 == 15)
    {
      uint64_t v31 = 0;
    }
    else
    {
      *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 160);
      sub_248777160(v0 + 176, v0 + 192);
      sub_248777160(v0 + 192, v0 + 144);
      unint64_t v49 = *(void *)(v0 + 152);
      uint64_t v31 = 0;
      switch(v49 >> 62)
      {
        case 1uLL:
          *(void *)(v0 + 152) = v49 & 0x3FFFFFFFFFFFFFFFLL;
          int v62 = *(_DWORD *)(v0 + 144);
          int v63 = *(_DWORD *)(v0 + 148);
          BOOL v64 = __OFSUB__(v63, v62);
          LODWORD(v31) = v63 - v62;
          if (v64)
          {
            __break(1u);
LABEL_61:
            __break(1u);
            JUMPOUT(0x24877599CLL);
          }
          uint64_t v31 = (int)v31;
          break;
        case 2uLL:
          *(void *)(v0 + 152) = v49 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t v65 = *(void *)(*(void *)(v0 + 144) + 16);
          uint64_t v66 = *(void *)(*(void *)(v0 + 144) + 24);
          BOOL v64 = __OFSUB__(v66, v65);
          uint64_t v31 = v66 - v65;
          if (!v64) {
            break;
          }
          goto LABEL_61;
        case 3uLL:
          break;
        default:
          *(void *)(v0 + 152) = v49 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t v31 = BYTE6(v49);
          break;
      }
    }
    v67 = *(uint64_t **)(v0 + 304);
    *(void *)(v0 + 280) = v31;
    sub_2487A6698();
    sub_2487769A8(v67);
    *(_WORD *)(v29 + 12) = 2080;
    uint64_t v68 = swift_bridgeObjectRetain();
    uint64_t v69 = MEMORY[0x24C57EEE0](v68, MEMORY[0x263F8D310]);
    unint64_t v71 = v70;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 248) = sub_2487A24A8(v69, v71, v80);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24876F000, v26, v27, "Sending message of %ld bytes to %s", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v30, -1, -1);
    MEMORY[0x24C57FA90](v29, -1, -1);
  }
  else
  {
    sub_2487769A8(*(uint64_t **)(v0 + 304));
    swift_release_n();
  }
  uint64_t v72 = *(void *)(v0 + 304);
  char v73 = sub_248778048(*(void *)v72, *(void *)(v72 + 8), *(void *)(v0 + 336), *(void *)(v72 + 16), *(void *)(v72 + 24), 0, 0xE000000000000000, *(void *)(v72 + 32), *(void *)(v72 + 40));
  v74 = sub_2487A5F48();
  os_log_type_t v75 = sub_2487A65B8();
  if (os_log_type_enabled(v74, v75))
  {
    v76 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v76 = 67109120;
    *(_DWORD *)(v0 + 416) = v73 & 1;
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v74, v75, "Result of call to send message is %{BOOL}d", v76, 8u);
    MEMORY[0x24C57FA90](v76, -1, -1);
  }

  if ((v73 & 1) == 0)
  {
    sub_2487770A8();
    swift_allocError();
    long long v40 = xmmword_2487A7550;
LABEL_54:
    *(_OWORD *)uint64_t v33 = v40;
    char v34 = -64;
LABEL_55:
    *(unsigned char *)(v33 + 16) = v34;
    swift_willThrow();
    goto LABEL_56;
  }
  MEMORY[0x24C57EC90](*(void *)(v0 + 344), *(void *)(v0 + 352), *(void *)(v0 + 360), 1800);
  v77 = *(uint64_t (**)(void))(v0 + 8);
LABEL_57:
  return v77();
}

uint64_t sub_2487759AC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 400) = a1;
  *(void *)(v3 + 408) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_248776208;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_248775ACC;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_248775ACC()
{
  uint64_t v51 = v0;
  *(void *)(v0 + 232) = MEMORY[0x263F8EE78];
  uint64_t v1 = v0 + 232;
  unint64_t v2 = *(void *)(v0 + 400);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2487A67E8();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    JUMPOUT(0x2487761F8);
  }
  uint64_t v4 = 0;
  unint64_t v5 = v2 & 0xC000000000000001;
  uint64_t v48 = *(void *)(v49 + 400) + 32;
  do
  {
    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x24C57F1A0](v4, *(void *)(v49 + 400));
    }
    else
    {
      uint64_t v6 = *(void **)(v48 + 8 * v4);
      swift_unknownObjectRetain();
    }
    ++v4;
    id v7 = objc_msgSend(v6, sel_destinationURIs);
    uint64_t v8 = sub_2487A6558();

    sub_248776500(v8);
    swift_unknownObjectRelease();
  }
  while (v3 != v4);
LABEL_10:
  uint64_t v9 = v0 + 16;
  os_log_type_t v10 = (void *)v49;
  swift_bridgeObjectRelease();
  BOOL v11 = sub_2487A5F48();
  os_log_type_t v12 = sub_2487A65B8();
  if (os_log_type_enabled(v11, v12))
  {
    long long v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v50[0] = v14;
    *(_DWORD *)long long v13 = 136315138;
    swift_beginAccess();
    uint64_t v15 = swift_bridgeObjectRetain();
    uint64_t v16 = MEMORY[0x24C57EEE0](v15, MEMORY[0x263F8D310]);
    unint64_t v18 = v17;
    uint64_t v9 = v1 - 216;
    swift_bridgeObjectRelease();
    *(void *)(v49 + 296) = sub_2487A24A8(v16, v18, v50);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v11, v12, "The following destinations don't support the required reg caps: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v14, -1, -1);
    MEMORY[0x24C57FA90](v13, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
  os_log_type_t v19 = *(void **)(v49 + 320);
  swift_beginAccess();
  *os_log_type_t v19 = *(void *)(v49 + 232);
  __swift_destroy_boxed_opaque_existential_1(v9);
  MEMORY[0x24C57EC90](*(void *)(v49 + 344), *(void *)(v49 + 352), *(void *)(v49 + 360), 1700);
  if (qword_269327240 != -1) {
    swift_once();
  }
  os_log_type_t v20 = *(uint64_t **)(v49 + 304);
  uint64_t v21 = sub_2487A5F68();
  __swift_project_value_buffer(v21, (uint64_t)qword_269329218);
  swift_retain();
  sub_2487768CC(v20);
  swift_retain();
  uint64_t v22 = sub_2487A5F48();
  os_log_type_t v23 = sub_2487A65B8();
  if (os_log_type_enabled(v22, v23))
  {
    os_log_type_t v47 = v23;
    uint64_t v24 = *(void *)(v49 + 304);
    uint64_t v25 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v50[0] = v46;
    *(_DWORD *)uint64_t v25 = 134218242;
    sub_2487770FC(v24, v1 - 24, &qword_2693274E0);
    sub_2487770FC(v1 - 24, v1 - 72, &qword_2693274E0);
    if (*(void *)(v49 + 168) >> 60 == 15)
    {
      uint64_t v26 = 0;
    }
    else
    {
      *(_OWORD *)(v1 - 56) = *(_OWORD *)(v1 - 72);
      sub_248777160(v1 - 56, v1 - 40);
      sub_248777160(v1 - 40, v1 - 88);
      unint64_t v27 = *(void *)(v49 + 152);
      uint64_t v26 = 0;
      switch(v27 >> 62)
      {
        case 1uLL:
          *(void *)(v49 + 152) = v27 & 0x3FFFFFFFFFFFFFFFLL;
          int v28 = *(_DWORD *)(v49 + 144);
          int v29 = *(_DWORD *)(v49 + 148);
          BOOL v30 = __OFSUB__(v29, v28);
          LODWORD(v26) = v29 - v28;
          if (v30) {
            goto LABEL_34;
          }
          uint64_t v26 = (int)v26;
          break;
        case 2uLL:
          *(void *)(v49 + 152) = v27 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t v31 = *(void *)(*(void *)(v49 + 144) + 16);
          uint64_t v32 = *(void *)(*(void *)(v49 + 144) + 24);
          BOOL v30 = __OFSUB__(v32, v31);
          uint64_t v26 = v32 - v31;
          if (!v30) {
            break;
          }
          goto LABEL_35;
        case 3uLL:
          break;
        default:
          *(void *)(v49 + 152) = v27 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t v26 = BYTE6(v27);
          break;
      }
    }
    uint64_t v33 = *(uint64_t **)(v49 + 304);
    *(void *)(v49 + 280) = v26;
    sub_2487A6698();
    sub_2487769A8(v33);
    *(_WORD *)(v25 + 12) = 2080;
    uint64_t v34 = swift_bridgeObjectRetain();
    uint64_t v35 = MEMORY[0x24C57EEE0](v34, MEMORY[0x263F8D310]);
    unint64_t v37 = v36;
    swift_bridgeObjectRelease();
    *(void *)(v49 + 248) = sub_2487A24A8(v35, v37, v50);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24876F000, v22, v47, "Sending message of %ld bytes to %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v46, -1, -1);
    MEMORY[0x24C57FA90](v25, -1, -1);
  }
  else
  {
    sub_2487769A8(*(uint64_t **)(v49 + 304));
    swift_release_n();
  }
  uint64_t v38 = *(void *)(v49 + 304);
  char v39 = sub_248778048(*(void *)v38, *(void *)(v38 + 8), *(void *)(v49 + 336), *(void *)(v38 + 16), *(void *)(v38 + 24), 0, 0xE000000000000000, *(void *)(v38 + 32), *(void *)(v38 + 40));
  long long v40 = sub_2487A5F48();
  os_log_type_t v41 = sub_2487A65B8();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 67109120;
    *(_DWORD *)(v49 + 416) = v39 & 1;
    os_log_type_t v10 = (void *)v49;
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v40, v41, "Result of call to send message is %{BOOL}d", v42, 8u);
    MEMORY[0x24C57FA90](v42, -1, -1);
  }

  if (v39)
  {
    MEMORY[0x24C57EC90](v10[43], v10[44], v10[45], 1800);
  }
  else
  {
    sub_2487770A8();
    swift_allocError();
    *(_OWORD *)uint64_t v44 = xmmword_2487A7550;
    *(unsigned char *)(v44 + 16) = -64;
    swift_willThrow();
  }
  os_log_type_t v43 = (uint64_t (*)(void))v10[1];
  return v43();
}

uint64_t sub_248776208()
{
  uint64_t v25 = v0;
  uint64_t v1 = (void *)v0[51];
  unint64_t v2 = (uint64_t *)v0[38];
  sub_2487768CC(v2);
  id v3 = v1;
  sub_2487768CC(v2);
  id v4 = v1;
  unint64_t v5 = sub_2487A5F48();
  os_log_type_t v6 = sub_2487A6598();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (void *)v0[51];
    uint64_t v8 = (uint64_t *)v0[38];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = v23;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2487A6568();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    v0[32] = sub_2487A24A8(v10, v12, &v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    sub_2487769A8(v8);
    sub_2487769A8(v8);
    *(_WORD *)(v9 + 12) = 2112;
    id v13 = v7;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[33] = v14;
    sub_2487A6698();
    *uint64_t v22 = v14;

    _os_log_impl(&dword_24876F000, v5, v6, "Error looking up endpoints without required registration capabilities %s. error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v22, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v23, -1, -1);
    MEMORY[0x24C57FA90](v9, -1, -1);
  }
  else
  {
    uint64_t v15 = (void *)v0[51];
    uint64_t v16 = (uint64_t *)v0[38];
    sub_2487769A8(v16);
    sub_2487769A8(v16);
  }
  unint64_t v17 = (void *)v0[51];
  sub_2487770A8();
  swift_allocError();
  *(void *)uint64_t v18 = v17;
  *(void *)(v18 + 8) = 0;
  *(unsigned char *)(v18 + 16) = 0;
  id v19 = v17;
  swift_willThrow();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  os_log_type_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_248776500(uint64_t result)
{
  uint64_t v3 = *(void *)(result + 16);
  id v4 = *(void **)v1;
  int64_t v5 = *(void *)(*(void *)v1 + 16);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = result;
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6) {
      int64_t v10 = v5 + v3;
    }
    else {
      int64_t v10 = v5;
    }
    id v4 = sub_24879FB50(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    int64_t v9 = v4[3] >> 1;
  }
  uint64_t v11 = v4[2];
  uint64_t v12 = v9 - v11;
  unint64_t result = sub_248776A84((uint64_t)v38, &v4[2 * v11 + 4], v9 - v11, v7);
  if (result < v3) {
    goto LABEL_15;
  }
  if (result)
  {
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, result);
    uint64_t v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    v4[2] = v16;
  }
  if (result != v12)
  {
LABEL_13:
    unint64_t result = sub_248777330();
    *(void *)uint64_t v1 = v4;
    return result;
  }
LABEL_16:
  int64_t v2 = v4[2];
  uint64_t v3 = v38[0];
  uint64_t v37 = v38[1];
  uint64_t v13 = v39;
  int64_t v6 = v40;
  if (v41)
  {
    unint64_t v17 = (v41 - 1) & v41;
    unint64_t v18 = __clz(__rbit64(v41)) | (v40 << 6);
    int64_t v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  int64_t v32 = v6 + 1;
  if (__OFADD__(v6, 1)) {
    goto LABEL_66;
  }
  int64_t v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36) {
    goto LABEL_13;
  }
  unint64_t v33 = *(void *)(v37 + 8 * v32);
  int64_t v34 = v6 + 1;
  if (!v33)
  {
    int64_t v34 = v6 + 2;
    if (v6 + 2 >= v36) {
      goto LABEL_13;
    }
    unint64_t v33 = *(void *)(v37 + 8 * v34);
    if (!v33)
    {
      int64_t v34 = v6 + 3;
      if (v6 + 3 >= v36) {
        goto LABEL_13;
      }
      unint64_t v33 = *(void *)(v37 + 8 * v34);
      if (!v33)
      {
        int64_t v34 = v6 + 4;
        if (v6 + 4 >= v36) {
          goto LABEL_13;
        }
        unint64_t v33 = *(void *)(v37 + 8 * v34);
        if (!v33)
        {
          int64_t v34 = v6 + 5;
          if (v6 + 5 >= v36) {
            goto LABEL_13;
          }
          unint64_t v33 = *(void *)(v37 + 8 * v34);
          if (!v33)
          {
            int64_t v35 = v6 + 6;
            do
            {
              if (v36 == v35) {
                goto LABEL_13;
              }
              unint64_t v33 = *(void *)(v37 + 8 * v35++);
            }
            while (!v33);
            int64_t v34 = v35 - 1;
          }
        }
      }
    }
  }
  unint64_t v17 = (v33 - 1) & v33;
  unint64_t v18 = __clz(__rbit64(v33)) + (v34 << 6);
  int64_t v6 = v34;
LABEL_18:
  id v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v18);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  unint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v22 = v4[3];
    int64_t v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1) {
      break;
    }
    if (v2 < v23) {
      goto LABEL_23;
    }
LABEL_20:
    v4[2] = v2;
  }
  unint64_t result = (uint64_t)sub_24879FB50((void *)(v22 > 1), v2 + 1, 1, v4);
  id v4 = (void *)result;
  int64_t v23 = *(void *)(result + 24) >> 1;
  if (v2 >= v23) {
    goto LABEL_20;
  }
  while (1)
  {
LABEL_23:
    uint64_t v24 = &v4[2 * v2 + 4];
    *uint64_t v24 = v21;
    v24[1] = v20;
    ++v2;
    if (v17)
    {
      unint64_t v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    int64_t v27 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v27 >= v36) {
      goto LABEL_45;
    }
    unint64_t v28 = *(void *)(v37 + 8 * v27);
    int64_t v29 = v6 + 1;
    if (!v28)
    {
      int64_t v29 = v6 + 2;
      if (v6 + 2 >= v36) {
        goto LABEL_45;
      }
      unint64_t v28 = *(void *)(v37 + 8 * v29);
      if (!v28)
      {
        int64_t v29 = v6 + 3;
        if (v6 + 3 >= v36) {
          goto LABEL_45;
        }
        unint64_t v28 = *(void *)(v37 + 8 * v29);
        if (!v28)
        {
          int64_t v29 = v6 + 4;
          if (v6 + 4 >= v36) {
            goto LABEL_45;
          }
          unint64_t v28 = *(void *)(v37 + 8 * v29);
          if (!v28)
          {
            int64_t v29 = v6 + 5;
            if (v6 + 5 >= v36) {
              goto LABEL_45;
            }
            unint64_t v28 = *(void *)(v37 + 8 * v29);
            if (!v28)
            {
              int64_t v30 = v6 + 6;
              while (v36 != v30)
              {
                unint64_t v28 = *(void *)(v37 + 8 * v30++);
                if (v28)
                {
                  int64_t v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              v4[2] = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    unint64_t v17 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v29 << 6);
    int64_t v6 = v29;
LABEL_41:
    uint64_t v31 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v26);
    uint64_t v21 = *v31;
    uint64_t v20 = v31[1];
    if (v2 >= v23)
    {
      unint64_t result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    unint64_t result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t *sub_2487768CC(uint64_t *a1)
{
  int64_t v2 = (void *)a1[9];
  sub_24877693C(*a1, a1[1]);
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24877693C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_248776950(a1, a2);
  }
  return a1;
}

uint64_t sub_248776950(uint64_t a1, unint64_t a2)
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

uint64_t *sub_2487769A8(uint64_t *a1)
{
  int64_t v2 = (void *)a1[9];
  sub_248776A18(*a1, a1[1]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_248776A18(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_248776A2C(a1, a2);
  }
  return a1;
}

uint64_t sub_248776A2C(uint64_t a1, unint64_t a2)
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

uint64_t sub_248776A84(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  int64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *int64_t v5 = a4;
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
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_248776C84(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  int64_t v5 = (void *)result;
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
    *int64_t v5 = a4;
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
    uint64_t result = swift_bridgeObjectRetain();
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

uint64_t sub_248776E84(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  switch(a3 >> 6)
  {
    case 1:
      if ((a6 & 0xC0) != 0x40) {
        goto LABEL_28;
      }
      int v14 = (unsigned __int16)sub_2487A6088();
      uint64_t result = v14 == (unsigned __int16)sub_2487A6088();
      break;
    case 2:
      if ((a6 & 0xC0) != 0x80) {
        goto LABEL_28;
      }
      if (a1 == a4 && a2 == a5 || (v8 = sub_2487A6868(), uint64_t result = 0, (v8 & 1) != 0))
      {
        unint64_t v10 = 0xD000000000000010;
        unint64_t v11 = 0x80000002487A8410;
        if ((a3 & 0x3F) != 0)
        {
          if ((a3 & 0x3F) == 1)
          {
            unint64_t v12 = 0xD00000000000002FLL;
            uint64_t v13 = "com.apple.asktod.receiveUnsupportedIDSEndpoints";
          }
          else
          {
            unint64_t v12 = 0xD000000000000025;
            uint64_t v13 = "com.apple.asktod.liveOnRecipientGroup";
          }
          unint64_t v15 = (unint64_t)(v13 - 32) | 0x8000000000000000;
        }
        else
        {
          unint64_t v12 = 0xD000000000000010;
          unint64_t v15 = 0x80000002487A8410;
        }
        if ((a6 & 0x3F) != 0)
        {
          if ((a6 & 0x3F) == 1)
          {
            unint64_t v10 = 0xD00000000000002FLL;
            unint64_t v16 = "com.apple.asktod.receiveUnsupportedIDSEndpoints";
          }
          else
          {
            unint64_t v10 = 0xD000000000000025;
            unint64_t v16 = "com.apple.asktod.liveOnRecipientGroup";
          }
          unint64_t v11 = (unint64_t)(v16 - 32) | 0x8000000000000000;
        }
        if (v12 == v10 && v15 == v11)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_40;
        }
        char v17 = sub_2487A6868();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = v17 & 1;
      }
      break;
    case 3:
      if (a2 | a1 || a3 != 192)
      {
        if (a1 == 1 && !a2 && a3 == 192)
        {
          if (a6 < 0xC0u || a4 != 1) {
            goto LABEL_28;
          }
        }
        else if (a6 <= 0xBFu || a4 != 2)
        {
          goto LABEL_28;
        }
        if (a5) {
          goto LABEL_28;
        }
      }
      else if (a6 < 0xC0u || a5 | a4)
      {
        goto LABEL_28;
      }
      if (a6 == 192) {
        goto LABEL_40;
      }
      goto LABEL_28;
    default:
      if (a6 >= 0x40u) {
LABEL_28:
      }
        uint64_t result = 0;
      else {
LABEL_40:
      }
        uint64_t result = 1;
      break;
  }
  return result;
}

unint64_t sub_2487770A8()
{
  unint64_t result = qword_2693274D8;
  if (!qword_2693274D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693274D8);
  }
  return result;
}

uint64_t sub_2487770FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_248777160(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2487771BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693274C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248777224(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693274C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248777284(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_248777330()
{
  return swift_release();
}

id sub_24877733C(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >> 6 == 2) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!(a3 >> 6)) {
    return result;
  }
  return result;
}

void destroy for iMessageSender.Error(uint64_t a1)
{
}

void sub_24877736C(void *a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >> 6 == 2)
  {
    swift_bridgeObjectRelease();
  }
  else if (!(a3 >> 6))
  {
  }
}

uint64_t _s11AskToDaemon14iMessageSenderV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24877733C(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for iMessageSender.Error(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24877733C(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24877736C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for iMessageSender.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24877736C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for iMessageSender.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3D && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 61);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 16) & 0x3C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x3F;
  if (v3 >= 0x3C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for iMessageSender.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3C)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 61;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3D) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3D) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_248777530(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 16) >> 6;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_24877754C(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_24877755C(uint64_t result, unsigned int a2)
{
  if (a2 < 3)
  {
    *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 3 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = -64;
  }
  return result;
}

ValueMetadata *type metadata accessor for iMessageSender.Error()
{
  return &type metadata for iMessageSender.Error;
}

uint64_t initializeBufferWithCopyOfBuffer for iMessageSender(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for iMessageSender(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }

  return __swift_destroy_boxed_opaque_existential_1(a1 + 56);
}

uint64_t initializeWithCopy for iMessageSender(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakCopyInit();
  *(void *)(v4 + 8) = *(void *)(a2 + 8);
  uint64_t v5 = v4 + 16;
  unsigned __int8 v6 = (_OWORD *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 40);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v8;
    (**(void (***)(uint64_t, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    long long v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)uint64_t v5 = *v6;
    *(_OWORD *)(v5 + 16) = v9;
    *(void *)(v5 + 32) = *(void *)(a2 + 48);
  }
  long long v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 56, a2 + 56);
  return a1;
}

void *assignWithCopy for iMessageSender(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_unknownObjectWeakCopyAssign();
  v4[1] = *(void *)(a2 + 8);
  uint64_t v5 = v4 + 2;
  uint64_t v6 = *(void *)(a2 + 40);
  if (!v4[5])
  {
    if (v6)
    {
      a1[5] = v6;
      a1[6] = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(v4 + 2), a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v7 = *(_OWORD *)(a2 + 16);
    long long v8 = *(_OWORD *)(a2 + 32);
    v5[4] = *(void *)(a2 + 48);
    *(_OWORD *)uint64_t v5 = v7;
    *((_OWORD *)v5 + 1) = v8;
    goto LABEL_8;
  }
  if (!v6)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v4 + 2));
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1(v4 + 2, (uint64_t *)(a2 + 16));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1(a1 + 7, (uint64_t *)(a2 + 56));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        __n128 result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        unint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *__n128 result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for iMessageSender(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeInit();
  *(void *)(v3 + 8) = *(void *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = v4;
  *(void *)(v3 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a2 + 56);
  __n128 result = *(__n128 *)(a2 + 72);
  *(__n128 *)(v3 + 72) = result;
  *(void *)(v3 + 88) = *(void *)(a2 + 88);
  return result;
}

uint64_t assignWithTake for iMessageSender(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakTakeAssign();
  *(void *)(v4 + 8) = *(void *)(a2 + 8);
  uint64_t v5 = v4 + 16;
  if (*(void *)(v4 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(v4 + 16);
  }
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for iMessageSender(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 8) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for iMessageSender(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      *(void *)(result + 8) = 1;
      return result;
    }
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for iMessageSender()
{
  return &type metadata for iMessageSender;
}

void sub_248777B64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  v24[1] = *MEMORY[0x263EF8340];
  if (qword_269327270 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2487A5F68();
  __swift_project_value_buffer(v8, (uint64_t)qword_2693292A8);
  swift_bridgeObjectRetain_n();
  int v9 = sub_2487A5F48();
  os_log_type_t v10 = sub_2487A65B8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v22 = a3;
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v11 = 138412290;
    if (a2)
    {
      sub_2487783D8();
      swift_allocError();
      *uint64_t v13 = a1;
      v13[1] = a2;
      swift_bridgeObjectRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      v24[0] = v14;
      sub_2487A6698();
    }
    else
    {
      v24[0] = 0;
      sub_2487A6698();
      uint64_t v14 = 0;
    }
    *uint64_t v12 = v14;
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v9, v10, "sentMessageGUID is %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v12, -1, -1);
    MEMORY[0x24C57FA90](v11, -1, -1);

    a3 = v22;
    if (!a2) {
      goto LABEL_13;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a2)
    {
LABEL_13:
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      unint64_t v15 = sub_2487A5F48();
      os_log_type_t v16 = sub_2487A6598();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v23 = a3;
        uint64_t v17 = swift_slowAlloc();
        unint64_t v18 = (void *)swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        v24[0] = v19;
        *(_DWORD *)uint64_t v17 = 138412546;
        if (a2)
        {
          sub_2487783D8();
          swift_allocError();
          *uint64_t v20 = a1;
          v20[1] = a2;
          swift_bridgeObjectRetain();
          uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
          sub_2487A6698();
        }
        else
        {
          sub_2487A6698();
          uint64_t v21 = 0;
        }
        *unint64_t v18 = v21;
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v17 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_2487A24A8(v23, a4, v24);
        sub_2487A6698();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v15, v16, "sentMessageGUID %@ does not equal payload messageGUID %s", (uint8_t *)v17, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v18, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v19, -1, -1);
        MEMORY[0x24C57FA90](v17, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      return;
    }
  }
  if ((a1 != a3 || a4 != a2) && (sub_2487A6868() & 1) == 0) {
    goto LABEL_13;
  }
}

uint64_t sub_248777FCC(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v3 = sub_2487A63B8();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_retain();
  v2(v3, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_248778048(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (qword_269327270 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2487A5F68();
  __swift_project_value_buffer(v11, (uint64_t)qword_2693292A8);
  uint64_t v12 = sub_2487A5F48();
  os_log_type_t v13 = sub_2487A65B8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    sub_2487A24A8(0xD000000000000077, 0x80000002487A89B0, aBlock);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v12, v13, "%s called", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v15, -1, -1);
    MEMORY[0x24C57FA90](v14, -1, -1);
  }

  if (a2 >> 60 == 15) {
    os_log_type_t v16 = 0;
  }
  else {
    os_log_type_t v16 = (void *)sub_2487A5E48();
  }
  uint64_t v17 = (void *)sub_2487A64A8();
  unint64_t v18 = (void *)sub_2487A63A8();
  uint64_t v19 = (void *)sub_2487A63A8();
  uint64_t v20 = (void *)sub_2487A63A8();
  uint64_t v21 = (void *)sub_2487A64A8();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a8;
  *(void *)(v22 + 24) = a9;
  aBlock[4] = (uint64_t)sub_2487783B8;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_248777FCC;
  aBlock[3] = (uint64_t)&block_descriptor_2;
  uint64_t v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v24 = IMSPISendMSMessagePayloadReturningGUID();
  _Block_release(v23);

  return v24;
}

uint64_t sub_248778380()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2487783B8(uint64_t a1, uint64_t a2)
{
  sub_248777B64(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
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

unint64_t sub_2487783D8()
{
  unint64_t result = qword_2693274F0;
  if (!qword_2693274F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693274F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesSPI()
{
  return &type metadata for MessagesSPI;
}

ValueMetadata *type metadata accessor for BiomeController()
{
  return &type metadata for BiomeController;
}

uint64_t sub_248778440()
{
  id v1 = sub_2487A315C(1, v0, (uint64_t)&off_26BA8D728);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693274F8);
  swift_allocObject();
  id v2 = v1;
  uint64_t v3 = sub_2487787FC((uint64_t)v2);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v3 + 24) = &off_26BA8D710;
  swift_unknownObjectWeakAssign();
  swift_retain();
  sub_24877899C();
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2487A5F68();
  __swift_project_value_buffer(v5, (uint64_t)qword_269329278);
  long long v6 = sub_2487A5F48();
  os_log_type_t v7 = sub_2487A65B8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v11 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v11);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v6, v7, "%s init complete", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v9, -1, -1);
    MEMORY[0x24C57FA90](v8, -1, -1);

    swift_release();
  }
  else
  {

    swift_release();
  }
  return v4;
}

unint64_t sub_248778670(uint64_t a1)
{
  if (BYTE4(a1) && BYTE4(a1) != 1)
  {
    if (a1) {
      return 0xD00000000000002FLL;
    }
    else {
      return 0xD00000000000002DLL;
    }
  }
  else
  {
    sub_2487A6758();
    sub_2487A6408();
    sub_2487A6848();
    sub_2487A6408();
    swift_bridgeObjectRelease();
    sub_2487A6408();
    return 0;
  }
}

unint64_t sub_248778790()
{
  return sub_248778670(*v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32));
}

uint64_t sub_2487787A0()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ScreenTimeRequestBiomeEventHandler()
{
  return self;
}

uint64_t sub_2487787FC(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v1 + 40) = 0;
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2487A5F68();
  __swift_project_value_buffer(v4, (uint64_t)qword_269329278);
  uint64_t v5 = sub_2487A5F48();
  os_log_type_t v6 = sub_2487A65B8();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v10);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v5, v6, "BiomeStreamListener create for %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v8, -1, -1);
    MEMORY[0x24C57FA90](v7, -1, -1);
  }

  *(void *)(v2 + 32) = a1;
  return v2;
}

void sub_24877899C()
{
  id v1 = objc_msgSend(self, sel_screenTimeRequestStream);
  id v2 = objc_msgSend(v1, sel_publisher);

  id v3 = objc_msgSend(v2, sel_subscribeOn_, *(void *)(v0 + 32));
  uint64_t v12 = sub_248779930;
  uint64_t v13 = v0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_248778D24;
  uint64_t v11 = &block_descriptor_3;
  uint64_t v4 = _Block_copy(&v8);
  swift_retain();
  swift_release();
  uint64_t v12 = sub_248779950;
  uint64_t v13 = v0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_248778D8C;
  uint64_t v11 = &block_descriptor_6_0;
  uint64_t v5 = _Block_copy(&v8);
  swift_retain();
  swift_release();
  id v6 = objc_msgSend(v3, sel_sinkWithCompletion_receiveInput_, v4, v5);

  _Block_release(v5);
  _Block_release(v4);
  os_log_type_t v7 = *(void **)(v0 + 40);
  *(void *)(v0 + 40) = v6;
}

void sub_248778B60()
{
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2487A5F68();
  __swift_project_value_buffer(v0, (uint64_t)qword_269329278);
  swift_retain();
  id v1 = sub_2487A5F48();
  os_log_type_t v2 = sub_2487A65B8();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = v4;
    *(_DWORD *)id v3 = 136315138;
    sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v5);
    sub_2487A6698();
    swift_release();
    _os_log_impl(&dword_24876F000, v1, v2, "Biome stream sunk for %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v4, -1, -1);
    MEMORY[0x24C57FA90](v3, -1, -1);
  }
  else
  {

    swift_release();
  }
}

void sub_248778D24(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_248778D8C(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_248778DEC()
{
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2487A5F68();
  __swift_project_value_buffer(v1, (uint64_t)qword_269329278);
  swift_retain();
  uint64_t v2 = sub_2487A5F48();
  os_log_type_t v3 = sub_2487A65B8();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v20 = v5;
    *(_DWORD *)id v4 = 136315138;
    sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v20);
    sub_2487A6698();
    swift_release();
    _os_log_impl(&dword_24876F000, v2, v3, "%s receive input", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v5, -1, -1);
    MEMORY[0x24C57FA90](v4, -1, -1);
  }
  else
  {

    swift_release();
  }
  swift_unknownObjectRetain();
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    os_log_type_t v7 = (void *)v6;
    if (MEMORY[0x24C57FB80](v0 + 16))
    {
      sub_24877A8F0(v7);
      swift_unknownObjectRelease();
    }
    else
    {
      swift_retain();
      os_log_type_t v16 = sub_2487A5F48();
      os_log_type_t v17 = sub_2487A6598();
      if (os_log_type_enabled(v16, v17))
      {
        unint64_t v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        uint64_t v20 = v19;
        *(_DWORD *)unint64_t v18 = 136315138;
        sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v20);
        sub_2487A6698();
        swift_release();
        _os_log_impl(&dword_24876F000, v16, v17, "%s received event, but has no delegate to notify", v18, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v19, -1, -1);
        MEMORY[0x24C57FA90](v18, -1, -1);
      }
      else
      {

        swift_release();
      }
    }
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_retain_n();
    swift_unknownObjectRetain_n();
    uint64_t v8 = sub_2487A5F48();
    os_log_type_t v9 = sub_2487A6598();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v20 = v11;
      *(_DWORD *)uint64_t v10 = 136315650;
      swift_release();
      sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v20);
      sub_2487A6698();
      swift_release();
      *(_WORD *)(v10 + 12) = 2080;
      swift_unknownObjectRetain();
      uint64_t v12 = sub_2487A63C8();
      sub_2487A24A8(v12, v13, &v20);
      sub_2487A6698();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 22) = 2080;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327500);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327508);
      uint64_t v14 = sub_2487A63C8();
      sub_2487A24A8(v14, v15, &v20);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v8, v9, "%s has the wrong type: %s, expected: %s", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v11, -1, -1);
      MEMORY[0x24C57FA90](v10, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_release_n();
    }
  }
}

uint64_t sub_248779318()
{
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2487A5F68();
  __swift_project_value_buffer(v0, (uint64_t)qword_269329278);
  uint64_t v1 = sub_2487A5F48();
  os_log_type_t v2 = sub_2487A65B8();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v7 = v4;
    *(_DWORD *)os_log_type_t v3 = 136315138;
    sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v7);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v1, v2, "%s completing transaction", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v4, -1, -1);
    MEMORY[0x24C57FA90](v3, -1, -1);
  }

  return MEMORY[0x24C57E8C0](v5);
}

uint64_t sub_2487794A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 64) = a6;
  uint64_t v10 = (uint64_t (*)(uint64_t))&aXE[*(int *)aXE];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 72) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_24877954C;
  return v10(a5);
}

uint64_t sub_24877954C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_2487796C0;
  }
  else {
    os_log_type_t v2 = sub_248779660;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248779660()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2487796C0()
{
  uint64_t v16 = v0;
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 80);
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_269329278);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2487A5F48();
  os_log_type_t v6 = sub_2487A6598();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 80);
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v0 + 40) = sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v15);
    sub_2487A6698();
    *(_WORD *)(v9 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v11 = sub_2487A68B8();
    *(void *)(v0 + 56) = sub_2487A24A8(v11, v12, &v15);
    sub_2487A6698();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24876F000, v5, v6, "%s event error: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v10, -1, -1);
    MEMORY[0x24C57FA90](v9, -1, -1);
  }
  else
  {
  }
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  unint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

void sub_248779930()
{
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_248779954(int a1, unsigned int a2)
{
  if (a1 == 2) {
    return 0;
  }
  if (a1 == 3)
  {
    uint64_t result = a2;
    switch(a2)
    {
      case 0u:
        if (qword_269327260 != -1) {
          swift_once();
        }
        uint64_t v5 = sub_2487A5F68();
        __swift_project_value_buffer(v5, (uint64_t)qword_269329278);
        os_log_type_t v6 = sub_2487A5F48();
        os_log_type_t v7 = sub_2487A6598();
        if (os_log_type_enabled(v6, v7))
        {
          uint64_t v8 = swift_slowAlloc();
          uint64_t v9 = swift_slowAlloc();
          uint64_t v22 = v9;
          *(_DWORD *)uint64_t v8 = 67109378;
          sub_2487A6698();
          *(_WORD *)(v8 + 8) = 2080;
          sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v22);
          sub_2487A6698();
          _os_log_impl(&dword_24876F000, v6, v7, "Unknown approval time %d for %s", (uint8_t *)v8, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x24C57FA90](v9, -1, -1);
          MEMORY[0x24C57FA90](v8, -1, -1);
        }

        sub_24877AF10();
        swift_allocError();
        *(_DWORD *)uint64_t v10 = 0;
        goto LABEL_20;
      case 1u:
        return result;
      case 2u:
        return 2;
      case 3u:
        return 3;
      default:
        if (qword_269327260 != -1) {
          swift_once();
        }
        uint64_t v17 = sub_2487A5F68();
        __swift_project_value_buffer(v17, (uint64_t)qword_269329278);
        unint64_t v18 = sub_2487A5F48();
        os_log_type_t v19 = sub_2487A6598();
        if (os_log_type_enabled(v18, v19))
        {
          uint64_t v20 = swift_slowAlloc();
          uint64_t v21 = swift_slowAlloc();
          uint64_t v22 = v21;
          *(_DWORD *)uint64_t v20 = 67109378;
          sub_2487A6698();
          *(_WORD *)(v20 + 8) = 2080;
          sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v22);
          sub_2487A6698();
          _os_log_impl(&dword_24876F000, v18, v19, "Unknown approval time %d for %s", (uint8_t *)v20, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x24C57FA90](v21, -1, -1);
          MEMORY[0x24C57FA90](v20, -1, -1);
        }

        sub_24877AF10();
        swift_allocError();
        *(_DWORD *)uint64_t v10 = a2;
LABEL_20:
        char v16 = 1;
        goto LABEL_21;
    }
  }
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2487A5F68();
  __swift_project_value_buffer(v11, (uint64_t)qword_269329278);
  unint64_t v12 = sub_2487A5F48();
  os_log_type_t v13 = sub_2487A6598();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = v15;
    *(_DWORD *)uint64_t v14 = 67109378;
    sub_2487A6698();
    *(_WORD *)(v14 + 8) = 2080;
    sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v22);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v12, v13, "Invalid status %d for %s", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v15, -1, -1);
    MEMORY[0x24C57FA90](v14, -1, -1);
  }

  sub_24877AF10();
  swift_allocError();
  char v16 = 0;
  *(_DWORD *)uint64_t v10 = a1;
LABEL_21:
  *(unsigned char *)(v10 + 4) = v16;
  return swift_willThrow();
}

uint64_t sub_248779E98(uint64_t a1)
{
  *(void *)(v1 + 104) = a1;
  return MEMORY[0x270FA2498](sub_248779EB8, 0, 0);
}

uint64_t sub_248779EB8()
{
  uint64_t v48 = v0;
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2487A5F68();
  __swift_project_value_buffer(v1, (uint64_t)qword_269329278);
  uint64_t v2 = sub_2487A5F48();
  os_log_type_t v3 = sub_2487A65B8();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    v47[0] = v5;
    *(_DWORD *)id v4 = 136315138;
    *(void *)(v0 + 96) = sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, v47);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v2, v3, "Handling %s biome event", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v5, -1, -1);
    MEMORY[0x24C57FA90](v4, -1, -1);
  }

  id v6 = objc_msgSend(*(id *)(v0 + 104), sel_eventBody);
  *(void *)(v0 + 112) = v6;
  if (!v6)
  {
    os_log_type_t v13 = sub_2487A5F48();
    os_log_type_t v14 = sub_2487A6598();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v47[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v0 + 56) = sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, v47);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v13, v14, "No event body for %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v16, -1, -1);
      MEMORY[0x24C57FA90](v15, -1, -1);
    }

    sub_24877AF10();
    swift_allocError();
    *(_DWORD *)uint64_t v17 = 0;
    *(unsigned char *)(v17 + 4) = 2;
    swift_willThrow();
    goto LABEL_19;
  }
  os_log_type_t v7 = v6;
  if (objc_msgSend(v6, sel_status) == 1)
  {
    id v8 = v7;
    uint64_t v9 = sub_2487A5F48();
    os_log_type_t v10 = sub_2487A65B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      v47[0] = swift_slowAlloc();
      uint64_t v12 = v47[0];
      *(_DWORD *)uint64_t v11 = 67109378;
      *(_DWORD *)(v0 + 152) = objc_msgSend(v8, sel_status);
      sub_2487A6698();

      *(_WORD *)(v11 + 8) = 2080;
      *(void *)(v0 + 88) = sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, v47);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v9, v10, "Status was %d (pending) for %s. Ignoring biome event.", (uint8_t *)v11, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v12, -1, -1);
      MEMORY[0x24C57FA90](v11, -1, -1);
    }
    else
    {
    }
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_20;
  }
  id v18 = objc_msgSend(v7, sel_responderDSID);
  if (!v18)
  {
    uint64_t v23 = sub_2487A5F48();
    os_log_type_t v24 = sub_2487A6598();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl(&dword_24876F000, v23, v24, "Event body did not contain a DSID.", v25, 2u);
      MEMORY[0x24C57FA90](v25, -1, -1);
    }

    sub_24877AF10();
    swift_allocError();
    *(_DWORD *)uint64_t v26 = 1;
    *(unsigned char *)(v26 + 4) = 2;
    swift_willThrow();

LABEL_19:
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
LABEL_20:
    return v22();
  }
  os_log_type_t v19 = v18;
  uint64_t v46 = sub_2487A63B8();
  unint64_t v21 = v20;

  *(void *)(v0 + 120) = v21;
  uint64_t v28 = sub_248779954((int)objc_msgSend(v7, sel_status), objc_msgSend(v7, sel_approvalTime));
  id v29 = objc_msgSend(v7, sel_requestID);
  uint64_t v30 = sub_2487A63B8();
  uint64_t v32 = v31;

  *(void *)(v0 + 128) = v32;
  *(void *)(v0 + 16) = v30;
  *(void *)(v0 + 24) = v32;
  *(void *)(v0 + 32) = v46;
  *(void *)(v0 + 40) = v21;
  *(void *)(v0 + 48) = v28;
  swift_bridgeObjectRetain_n();
  id v33 = v7;
  int64_t v34 = sub_2487A5F48();
  os_log_type_t v35 = sub_2487A65B8();
  os_log_type_t v36 = v35;
  if (os_log_type_enabled(v34, v35))
  {
    os_log_type_t type = v36;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v47[0] = v45;
    *(_DWORD *)uint64_t v37 = 136315650;
    id v38 = [v33 (SEL)0x26523EA98];
    log = v34;
    uint64_t v39 = sub_2487A63B8();
    unint64_t v41 = v40;

    *(void *)(v0 + 64) = sub_2487A24A8(v39, v41, v47);
    sub_2487A6698();
    swift_bridgeObjectRelease();

    *(_WORD *)(v37 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 72) = sub_2487A24A8(v46, v21, v47);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 22) = 2048;
    *(void *)(v0 + 80) = v28;
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, log, type, "Calling into ScreenTimeAnswerHandler with requestID %s, responderDSID: %s, answer: %ld", (uint8_t *)v37, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v45, -1, -1);
    MEMORY[0x24C57FA90](v37, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v42 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v42;
  *uint64_t v42 = v0;
  v42[1] = sub_24877A6F4;
  return sub_24877BF9C();
}

uint64_t sub_24877A6F4()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24877A87C;
  }
  else {
    uint64_t v2 = sub_24877A808;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24877A808()
{
  uint64_t v1 = *(void **)(v0 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24877A87C()
{
  uint64_t v1 = *(void **)(v0 + 112);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24877A8F0(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693278B0);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2487A5F68();
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_269329278);
  id v8 = sub_2487A5F48();
  os_log_type_t v9 = sub_2487A65B8();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v23[1] = v7;
    uint64_t v12 = v11;
    uint64_t v25 = v11;
    *(_DWORD *)os_log_type_t v10 = 136315138;
    uint64_t v24 = sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v25);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v8, v9, "%s event consume", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v12, -1, -1);
    MEMORY[0x24C57FA90](v10, -1, -1);
  }

  sub_2487A5EB8();
  swift_allocObject();
  sub_2487A5E98();
  os_log_type_t v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  uint64_t v14 = sub_2487A6548();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v2;
  v15[5] = a1;
  v15[6] = v13;
  swift_retain();
  id v16 = a1;
  uint64_t v17 = v13;
  sub_2487940E4((uint64_t)v5, (uint64_t)&unk_269327518, (uint64_t)v15);
  swift_release();
  sub_2487A65D8();
  id v18 = sub_2487A5F48();
  os_log_type_t v19 = sub_2487A65B8();
  if (os_log_type_enabled(v18, v19))
  {
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v25 = v21;
    *(_DWORD *)unint64_t v20 = 136315138;
    uint64_t v24 = sub_2487A24A8(0xD000000000000011, 0x80000002487A8490, &v25);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v18, v19, "%s eventHandler complete", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v21, -1, -1);
    MEMORY[0x24C57FA90](v20, -1, -1);
  }
  else
  {
  }
  sub_248779318();
  return swift_release();
}

uint64_t sub_24877ACD4()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24877AD24()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24877AE1C;
  v4[8] = v3;
  uint64_t v7 = (uint64_t (*)(uint64_t))&aXE[*(int *)aXE];
  uint64_t v5 = (void *)swift_task_alloc();
  v4[9] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24877954C;
  return v7(v2);
}

uint64_t sub_24877AE1C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_24877AF10()
{
  unint64_t result = qword_269327528;
  if (!qword_269327528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327528);
  }
  return result;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScreenTimeRequestBiomeEventHandler.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeRequestBiomeEventHandler.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24877B004(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 4) <= 1u) {
    return *(unsigned __int8 *)(a1 + 4);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24877B01C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_DWORD *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 4) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeRequestBiomeEventHandler.Error()
{
  return &type metadata for ScreenTimeRequestBiomeEventHandler.Error;
}

uint64_t sub_24877B054()
{
  return swift_initClassMetadata2();
}

void sub_24877B0B4(void *a1)
{
  unsigned int v3 = (void *)(*MEMORY[0x263F8EED0] & *v1);
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2487A5F68();
  __swift_project_value_buffer(v4, (uint64_t)qword_2693291E8);
  uint64_t v5 = v1;
  id v6 = a1;
  uint64_t v7 = sub_2487A5F48();
  os_log_type_t v8 = sub_2487A65B8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t aBlock = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v12 = *(void *)((char *)v5 + *(void *)asc_269327530);
    unint64_t v11 = *(void *)((char *)v5 + *(void *)asc_269327530 + 8);
    swift_bridgeObjectRetain();
    sub_2487A24A8(v12, v11, &aBlock);
    sub_2487A6698();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 1024;
    objc_msgSend(v6, sel_processIdentifier);
    sub_2487A6698();

    _os_log_impl(&dword_24876F000, v7, v8, "Configuring XPC connection for %s from PID %d", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v10, -1, -1);
    MEMORY[0x24C57FA90](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = v3[11];
  uint64_t aBlock = (uint64_t)v6;
  uint64_t v14 = v3[13];
  uint64_t v15 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v14 + 48);
  id v16 = v6;
  uint64_t v17 = v15(&aBlock, v13, v14);
  uint64_t v18 = v3[10];
  uint64_t aBlock = v17;
  uint64_t v19 = v3[12];
  unint64_t v20 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v19 + 24);
  swift_unknownObjectRetain();
  uint64_t v21 = v20(&aBlock, v18, v19);
  uint64_t v22 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
  uint64_t v23 = self;
  id v24 = objc_msgSend(v23, sel_interfaceWithProtocol_, v22);

  uint64_t v39 = v24;
  objc_msgSend(v16, sel_setExportedInterface_, v24);
  objc_msgSend(v16, sel_setExportedObject_, v21);
  uint64_t v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 40))(v13, v14);
  id v26 = objc_msgSend(v23, sel_interfaceWithProtocol_, v25);

  id v38 = v26;
  objc_msgSend(v16, sel_setRemoteObjectInterface_, v26);
  int64_t v27 = (void *)swift_allocObject();
  v27[2] = v16;
  v27[3] = v5;
  v27[4] = v17;
  uint64_t v44 = sub_24877BEB8;
  uint64_t v45 = v27;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v41 = 1107296256;
  uint64_t v42 = sub_24878D134;
  os_log_type_t v43 = &block_descriptor_4;
  uint64_t v28 = _Block_copy(&aBlock);
  id v29 = v5;
  id v30 = v16;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v30, sel_setInterruptionHandler_, v28);
  _Block_release(v28);
  uint64_t v31 = (void *)swift_allocObject();
  v31[2] = v30;
  v31[3] = v29;
  v31[4] = v17;
  uint64_t v44 = sub_24877BF58;
  uint64_t v45 = v31;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v41 = 1107296256;
  uint64_t v42 = sub_24878D134;
  os_log_type_t v43 = &block_descriptor_10_0;
  uint64_t v32 = _Block_copy(&aBlock);
  v29;
  id v33 = v30;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v33, sel_setInvalidationHandler_, v32);
  _Block_release(v32);
  (*(void (**)(uint64_t, uint64_t))(v14 + 56))(v13, v14);
  sub_248797984(v17);
  id v34 = v33;
  os_log_type_t v35 = sub_2487A5F48();
  os_log_type_t v36 = sub_2487A65B8();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v37 = 67109120;
    LODWORD(aBlock) = objc_msgSend(v34, sel_processIdentifier);
    sub_2487A6698();

    _os_log_impl(&dword_24876F000, v35, v36, "Activated connection for PID %d", v37, 8u);
    MEMORY[0x24C57FA90](v37, -1, -1);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_24877B6E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t (*a5)(uint64_t))
{
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2487A5F68();
  __swift_project_value_buffer(v9, (uint64_t)qword_2693291E8);
  id v10 = a1;
  unint64_t v11 = sub_2487A5F48();
  os_log_type_t v12 = sub_2487A65B8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 67109120;
    objc_msgSend(v10, sel_processIdentifier);
    sub_2487A6698();

    _os_log_impl(&dword_24876F000, v11, v12, a4, v13, 8u);
    MEMORY[0x24C57FA90](v13, -1, -1);
  }
  else
  {
  }
  return a5(a3);
}

uint64_t sub_24877B860(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  char v9 = sub_24877BCA8(v7);

  return v9 & 1;
}

void sub_24877B8C0()
{
}

id sub_24877B92C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24877B964(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t type metadata accessor for XPCClientConnectionListener()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24877B9DC(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 104);
}

uint64_t sub_24877B9E4(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (1)
  {
    int v6 = *(unsigned __int8 *)(a2 + v5++ + 32);
    unint64_t v7 = 0xD00000000000002FLL;
    if (v6 == 1)
    {
      unint64_t v8 = 0x80000002487A8430;
    }
    else
    {
      unint64_t v7 = 0xD000000000000025;
      unint64_t v8 = 0x80000002487A8460;
    }
    uint64_t v9 = v6 ? v7 : 0xD000000000000010;
    unint64_t v10 = v6 ? v8 : 0x80000002487A8410;
    char v11 = sub_248790ABC(v9, v10);
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0) {
      break;
    }
    if (v2 == v5)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2487A5F68();
  __swift_project_value_buffer(v13, (uint64_t)qword_2693291E8);
  id v14 = a1;
  uint64_t v15 = sub_2487A5F48();
  os_log_type_t v16 = sub_2487A6598();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v23 = v18;
    *(_DWORD *)uint64_t v17 = 67109378;
    objc_msgSend(v14, sel_processIdentifier);
    sub_2487A6698();

    *(_WORD *)(v17 + 8) = 2080;
    unint64_t v19 = 0xD00000000000002FLL;
    unint64_t v20 = 0x80000002487A8430;
    if (v6 != 1)
    {
      unint64_t v19 = 0xD000000000000025;
      unint64_t v20 = 0x80000002487A8460;
    }
    if (v6) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = 0xD000000000000010;
    }
    if (v6) {
      unint64_t v22 = v20;
    }
    else {
      unint64_t v22 = 0x80000002487A8410;
    }
    sub_2487A24A8(v21, v22, &v23);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v15, v16, "Rejecting connection to PID %d. Missing entitlement: %s", (uint8_t *)v17, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v18, -1, -1);
    MEMORY[0x24C57FA90](v17, -1, -1);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_24877BCA8(void *a1)
{
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2487A5F68();
  __swift_project_value_buffer(v3, (uint64_t)qword_2693291E8);
  uint64_t v4 = v1;
  uint64_t v5 = sub_2487A5F48();
  os_log_type_t v6 = sub_2487A65B8();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)unint64_t v7 = 136315138;
    uint64_t v9 = *(void *)&v4[*(void *)asc_269327530];
    unint64_t v10 = *(void *)&v4[*(void *)asc_269327530 + 8];
    swift_bridgeObjectRetain();
    sub_2487A24A8(v9, v10, &v13);
    sub_2487A6698();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v5, v6, "Incoming XPC connection for %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v8, -1, -1);
    MEMORY[0x24C57FA90](v7, -1, -1);
  }
  else
  {
  }
  char v11 = sub_24877B9E4(a1, (uint64_t)&unk_26FC7DBB0);
  if (v11) {
    sub_24877B0B4(a1);
  }
  return v11 & 1;
}

void sub_24877BE84()
{
}

uint64_t sub_24877BEB8()
{
  return sub_24877B6E4(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "Connection interrupted for PID %d", (uint64_t (*)(uint64_t))sub_2487975DC);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24877BF58()
{
  return sub_24877B6E4(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "Connection invalidated for PID %d", (uint64_t (*)(uint64_t))sub_2487975DC);
}

uint64_t sub_24877BF9C()
{
  v1[33] = v0;
  uint64_t v2 = sub_2487A5F68();
  v1[34] = v2;
  v1[35] = *(void *)(v2 - 8);
  v1[36] = swift_task_alloc();
  uint64_t v3 = sub_2487A6258();
  v1[37] = v3;
  v1[38] = *(void *)(v3 - 8);
  v1[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24877C0B8, 0, 0);
}

uint64_t sub_24877C0B8()
{
  unint64_t v19 = v0;
  v0[16] = *(void *)(v0[33] + 32);
  uint64_t v1 = sub_2487A6848();
  unint64_t v3 = v2;
  v0[40] = v1;
  v0[41] = v2;
  if (qword_269327268 != -1) {
    swift_once();
  }
  v0[42] = __swift_project_value_buffer(v0[34], (uint64_t)qword_269329290);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_2487A5F48();
  os_log_type_t v5 = sub_2487A65B8();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = v1;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v18 = v8;
    *(_DWORD *)os_log_type_t v6 = 136315138;
    swift_bridgeObjectRetain();
    v0[32] = sub_2487A24A8(v7, v3, &v18);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v4, v5, "ScreenTime answer ID was %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v8, -1, -1);
    MEMORY[0x24C57FA90](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v9 = (uint64_t *)v0[33];
  uint64_t v10 = *v9;
  v0[43] = *v9;
  unint64_t v11 = v9[1];
  v0[44] = v11;
  v0[45] = v9[2];
  v0[46] = v9[3];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v12 = sub_2487A5F48();
  os_log_type_t v13 = sub_2487A65B8();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v18 = v15;
    *(_DWORD *)id v14 = 136315138;
    swift_bridgeObjectRetain();
    v0[31] = sub_2487A24A8(v10, v11, &v18);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v12, v13, "Looking for Messages messages with request ID %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v15, -1, -1);
    MEMORY[0x24C57FA90](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  os_log_type_t v16 = (void *)swift_task_alloc();
  v0[47] = v16;
  void *v16 = v0;
  v16[1] = sub_24877C494;
  v16[7] = v10;
  v16[8] = v11;
  return MEMORY[0x270FA2498](sub_2487827CC, 0, 0);
}

uint64_t sub_24877C494(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 384) = a1;
  *(void *)(v3 + 392) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24877DB38;
  }
  else {
    uint64_t v4 = sub_24877C5A8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24877C5A8()
{
  uint64_t v126 = v0;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_2487A5F48();
  os_log_type_t v2 = sub_2487A65B8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 384);
    uint64_t v5 = *(void *)(v0 + 344);
    unint64_t v4 = *(void *)(v0 + 352);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134218242;
    *(void *)(v0 + 232) = *(void *)(v3 + 16);
    v125[0] = v7;
    sub_2487A6698();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 240) = sub_2487A24A8(v5, v4, v125);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v1, v2, "Found %ld Messages messages matching request ID %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v7, -1, -1);
    MEMORY[0x24C57FA90](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v8 = *(void *)(v0 + 384);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327638);
  *(void *)(v0 + 400) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v0 + 408) = *(void *)(v10 + 64);
  uint64_t v11 = swift_task_alloc();
  *(void *)(v0 + 416) = v11;
  uint64_t v12 = *(void *)(v8 + 16);
  *(void *)(v0 + 424) = v12;
  if (!v12)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v40 = *(uint64_t (**)(void))(v0 + 8);
LABEL_46:
    return v40();
  }
  os_log_type_t v13 = (uint64_t *)v11;
  uint64_t v115 = v0 + 136;
  uint64_t v14 = *(int *)(v9 + 48);
  *(_DWORD *)(v0 + 608) = v14;
  *(void *)(v0 + 432) = sub_2487A6318();
  int v15 = *(_DWORD *)(v10 + 80);
  *(_DWORD *)(v0 + 612) = v15;
  v116 = *(objc_class **)(v0 + 392);
  *(void *)(v0 + 440) = *(void *)(v10 + 72);
  *(void *)(v0 + 448) = 0;
  v123 = (char *)v13 + v14;
  sub_248784D20(v8 + ((v15 + 32) & ~(unint64_t)v15), (uint64_t)v13, &qword_269327638);
  os_log_type_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v16;
  uint64_t v17 = *(int *)(v9 + 48);
  *(_DWORD *)(v0 + 616) = v17;
  uint64_t v18 = (char *)v16 + v17;
  v121 = (char *)v16 + v17;
  uint64_t v19 = *v13;
  *(void *)(v0 + 464) = *v13;
  uint64_t v20 = v13[1];
  *(void *)(v0 + 472) = v20;
  uint64_t v108 = v19;
  void *v16 = v19;
  v16[1] = v20;
  uint64_t v110 = (uint64_t)v16;
  uint64_t v21 = sub_2487A5E38();
  *(void *)(v0 + 480) = v21;
  unint64_t v22 = *(void **)(v21 - 8);
  *(void *)(v0 + 488) = v22;
  v111 = (void (*)(char *, char *, uint64_t))v22[4];
  v111(v18, v123, v21);
  unint64_t v109 = (v22[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = swift_task_alloc();
  *(void *)(v0 + 496) = v23;
  uint64_t v24 = swift_task_alloc() + *(int *)(v9 + 48);
  v120 = v22;
  uint64_t v25 = (void (*)(uint64_t, char *, uint64_t))v22[2];
  *(void *)(v0 + 504) = v25;
  *(void *)(v0 + 512) = (unint64_t)(v22 + 2) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v25(v24, v121, v21);
  uint64_t v122 = v21;
  v111((char *)v23, (char *)v24, v21);
  id v26 = (Class *)(v0 + 136);
  swift_task_dealloc();
  uint64_t v112 = v20;
  swift_bridgeObjectRetain();
  sub_2487A6248();
  sub_248783280(&qword_269327640);
  sub_248783280(&qword_269327648);
  sub_2487A6238();
  uint64_t v124 = v23;
  if (v116)
  {
    Class v27 = v116;
    uint64_t v28 = swift_task_alloc();
    v25(v28, (char *)v23, v21);
    id v29 = v116;
    id v30 = v116;
    uint64_t v31 = sub_2487A5F48();
    os_log_type_t v32 = sub_2487A6598();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      v113 = (void *)swift_slowAlloc();
      uint64_t v117 = swift_slowAlloc();
      v125[0] = v117;
      *(_DWORD *)uint64_t v33 = 136315394;
      id v34 = v27;
      sub_248784C30(&qword_269327668, MEMORY[0x270FA8E48]);
      uint64_t v35 = sub_2487A6848();
      *(void *)(v0 + 216) = sub_2487A24A8(v35, v36, v125);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      uint64_t v37 = (void (*)(uint64_t, uint64_t))v22[1];
      v37(v28, v122);
      *(_WORD *)(v33 + 12) = 2112;
      id v38 = v27;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 224) = v39;
      sub_2487A6698();
      void *v113 = v39;
      Class v27 = v34;

      _os_log_impl(&dword_24876F000, v31, v32, "Could not parse ATPayload from messagesPayloadURL %s. error: %@", (uint8_t *)v33, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v113, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v117, -1, -1);
      MEMORY[0x24C57FA90](v33, -1, -1);
    }
    else
    {
      uint64_t v37 = (void (*)(uint64_t, uint64_t))v22[1];
      v37(v28, v122);
    }
    swift_task_dealloc();
    uint64_t v48 = sub_2487A5DA8();
    uint64_t v49 = *(void *)(v48 - 8);
    unint64_t v44 = swift_task_alloc();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327650);
    uint64_t v50 = swift_task_alloc();
    sub_2487A5D88();
    v119 = v37;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v50, 1, v48) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_248784D84(v50, &qword_269327650);
      swift_task_dealloc();
      swift_task_dealloc();
      if (qword_269327260 != -1) {
        swift_once();
      }
      Class v51 = v27;
      __swift_project_value_buffer(*(void *)(v0 + 272), (uint64_t)qword_269329278);
      uint64_t v52 = sub_2487A5F48();
      os_log_type_t v53 = sub_2487A6598();
      uint64_t v54 = v110;
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v55 = (uint8_t *)swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        v125[0] = v56;
        *(_DWORD *)uint64_t v55 = 136315138;
        *(void *)(v0 + 144) = sub_2487A24A8(0x2928656C646E6168, 0xE800000000000000, v125);
        sub_2487A6698();
        _os_log_impl(&dword_24876F000, v52, v53, "%s URL components was nil", v55, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v56, -1, -1);
        MEMORY[0x24C57FA90](v55, -1, -1);
      }

      uint64_t v58 = *(void *)(v0 + 304);
      uint64_t v57 = *(void *)(v0 + 312);
      uint64_t v59 = *(void *)(v0 + 296);
      sub_2487832C4();
      swift_allocError();
      *(void *)uint64_t v60 = v51;
      *(void *)(v60 + 8) = 0;
      *(unsigned char *)(v60 + 16) = 3;
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
      v37(v124, v122);
      goto LABEL_44;
    }
    v107 = (uint64_t *)(v0 + 168);
    uint64_t v115 = v49;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v49 + 32))(v44, v50, v48);
    swift_task_dealloc();
    uint64_t v61 = sub_2487A6138();
    uint64_t v62 = *(void *)(v61 - 8);
    id v26 = (Class *)swift_task_alloc();
    uint64_t v63 = swift_task_alloc();
    sub_2487A60E8();
    (*(void (**)(Class *, uint64_t, uint64_t))(v62 + 32))(v26, v63, v61);
    swift_task_dealloc();
    uint64_t v78 = sub_248783E4C(v26, v108, v112);
    if (!v78)
    {
      uint64_t v108 = v62;
      unint64_t v109 = v48;
      v118 = (void *)v61;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_269327260 == -1)
      {
LABEL_36:
        unint64_t v114 = v44;
        Class v80 = v27;
        __swift_project_value_buffer(*(void *)(v0 + 272), (uint64_t)qword_269329278);
        uint64_t v81 = sub_2487A5F48();
        os_log_type_t v82 = sub_2487A6598();
        if (os_log_type_enabled(v81, v82))
        {
          v83 = (uint8_t *)swift_slowAlloc();
          uint64_t v84 = swift_slowAlloc();
          v125[0] = v84;
          *(_DWORD *)v83 = 136315138;
          uint64_t *v107 = sub_2487A24A8(0x2928656C646E6168, 0xE800000000000000, v125);
          sub_2487A6698();
          _os_log_impl(&dword_24876F000, v81, v82, "%s derivedPayload was nil", v83, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C57FA90](v84, -1, -1);
          MEMORY[0x24C57FA90](v83, -1, -1);
        }

        uint64_t v86 = *(void *)(v0 + 304);
        uint64_t v85 = *(void *)(v0 + 312);
        uint64_t v87 = *(void *)(v0 + 296);
        sub_2487832C4();
        swift_allocError();
        *(void *)uint64_t v88 = v80;
        *(void *)(v88 + 8) = 0;
        *(unsigned char *)(v88 + 16) = 3;
        swift_willThrow();
        (*(void (**)(Class *, void *))(v108 + 8))(v26, v118);
        (*(void (**)(unint64_t, unint64_t))(v115 + 8))(v114, v109);
        (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v87);
        v119(v124, v122);
        sub_248784D84(v110, &qword_269327638);
        swift_task_dealloc();
        swift_task_dealloc();
        goto LABEL_45;
      }
LABEL_50:
      swift_once();
      goto LABEL_36;
    }
    v79 = (objc_class *)v78;

    (*(void (**)(Class *, uint64_t))(v62 + 8))(v26, v61);
    (*(void (**)(unint64_t, uint64_t))(v49 + 8))(v44, v48);
    swift_task_dealloc();
    swift_task_dealloc();
    Class v27 = v79;
  }
  else
  {
    Class v27 = *v26;
  }
  *(void *)(v0 + 520) = v27;
  uint64_t v42 = *(void *)(v0 + 320);
  uint64_t v41 = *(void *)(v0 + 328);
  os_log_type_t v43 = (void *)sub_2487A62F8();
  unint64_t v44 = sub_2487A5F88();

  swift_bridgeObjectRetain();
  uint64_t v45 = sub_248782640(v44, v42, v41);
  *(void *)(v0 + 528) = v45;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v45)
  {
    v119 = (void (*)(uint64_t, uint64_t))v0;
    swift_bridgeObjectRelease();
    BOOL v64 = (void *)sub_2487A62F8();
    unint64_t v65 = sub_2487A5F88();

    if (v65 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v0 = sub_2487A67E8();
      swift_bridgeObjectRelease();
      v118 = v27;
      if (v0) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v0 = *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v118 = v27;
      if (v0)
      {
LABEL_24:
        v125[0] = MEMORY[0x263F8EE78];
        sub_248774030(0, v0 & ~(v0 >> 63), 0);
        if ((v0 & 0x8000000000000000) == 0)
        {
          uint64_t v66 = 0;
          uint64_t v67 = v125[0];
          unint64_t v68 = v65 & 0xC000000000000001;
          unint64_t v69 = v65;
          do
          {
            if (v68) {
              id v70 = (id)MEMORY[0x24C57F1A0](v66, v65);
            }
            else {
              id v70 = *(id *)(v65 + 8 * v66 + 32);
            }
            unint64_t v71 = v70;
            uint64_t v72 = sub_2487A6038();
            uint64_t v74 = v73;

            v125[0] = v67;
            unint64_t v76 = *(void *)(v67 + 16);
            unint64_t v75 = *(void *)(v67 + 24);
            if (v76 >= v75 >> 1)
            {
              sub_248774030(v75 > 1, v76 + 1, 1);
              uint64_t v67 = v125[0];
            }
            ++v66;
            *(void *)(v67 + 16) = v76 + 1;
            uint64_t v77 = v67 + 16 * v76;
            *(void *)(v77 + 32) = v72;
            *(void *)(v77 + 40) = v74;
            unint64_t v65 = v69;
          }
          while (v0 != v66);
          goto LABEL_40;
        }
        __break(1u);
        goto LABEL_50;
      }
    }
LABEL_40:
    uint64_t v0 = (uint64_t)v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v89 = sub_2487A5F48();
    os_log_type_t v90 = sub_2487A6598();
    BOOL v91 = os_log_type_enabled(v89, v90);
    unint64_t v92 = *((void *)v119 + 41);
    if (v91)
    {
      uint64_t v93 = *((void *)v119 + 40);
      uint64_t v94 = swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      v125[0] = v95;
      *(_DWORD *)uint64_t v94 = 136315394;
      swift_bridgeObjectRetain();
      *((void *)v119 + 22) = sub_2487A24A8(v93, v92, v125);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v94 + 12) = 2080;
      uint64_t v96 = swift_bridgeObjectRetain();
      uint64_t v97 = MEMORY[0x24C57EEE0](v96, MEMORY[0x263F8D310]);
      unint64_t v99 = v98;
      swift_bridgeObjectRelease();
      *((void *)v119 + 23) = sub_2487A24A8(v97, v99, v125);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v89, v90, "No answer choice in the original question had id %s. originalAnswerIds: %s", (uint8_t *)v94, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v95, -1, -1);
      MEMORY[0x24C57FA90](v94, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v54 = v110;
    uint64_t v101 = *((void *)v119 + 40);
    uint64_t v100 = *((void *)v119 + 41);
    uint64_t v103 = *((void *)v119 + 38);
    uint64_t v102 = *((void *)v119 + 39);
    uint64_t v104 = *((void *)v119 + 37);
    sub_2487832C4();
    swift_allocError();
    *(void *)uint64_t v105 = v101;
    *(void *)(v105 + 8) = v100;
    *(unsigned char *)(v105 + 16) = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v102, v104);
    ((void (*)(uint64_t, uint64_t))v120[1])(v124, v122);
LABEL_44:
    sub_248784D84(v54, &qword_269327638);
LABEL_45:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v40 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_46;
  }
  uint64_t v46 = (void *)swift_task_alloc();
  *(void *)(v0 + 536) = v46;
  *uint64_t v46 = v0;
  v46[1] = sub_24877DBB0;
  uint64_t v47 = *(void *)(v0 + 368);
  v46[16] = *(void *)(v0 + 360);
  v46[17] = v47;
  return MEMORY[0x270FA2498](sub_2487833A8, 0, 0);
}

uint64_t sub_24877DB38()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24877DBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 544) = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_24877DF98;
  }
  else
  {
    *(void *)(v6 + 552) = a2;
    *(void *)(v6 + 560) = a1;
    uint64_t v7 = sub_24877DCFC;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_24877DCFC()
{
  uint64_t v1 = (void *)v0[66];
  uint64_t v2 = (void *)v0[65];
  sub_2487A62F8();
  id v3 = objc_allocWithZone((Class)sub_2487A61B8());
  id v4 = v1;
  uint64_t v5 = (void *)sub_2487A61A8();
  v0[71] = v5;
  id v6 = v2;
  id v7 = v5;
  uint64_t v8 = sub_2487A62A8();
  v0[72] = v8;
  type metadata accessor for AppExtensionProxy();
  uint64_t v9 = swift_allocObject();
  v0[73] = v9;
  *(void *)(v9 + 24) = sub_24878DFF4(MEMORY[0x263F8EE78]);
  *(_WORD *)(v9 + 16) = 768;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[74] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_24877DE64;
  return sub_24879CF0C((uint64_t)(v0 + 2), v8);
}

uint64_t sub_24877DE64()
{
  *(void *)(*(void *)v1 + 600) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24877FAD4;
  }
  else
  {
    uint64_t v2 = sub_24877E0A8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24877DF98()
{
  uint64_t v1 = *(void **)(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 488);
  uint64_t v2 = *(void *)(v0 + 496);
  uint64_t v4 = *(void *)(v0 + 480);
  uint64_t v5 = *(void *)(v0 + 456);
  uint64_t v7 = *(void *)(v0 + 304);
  uint64_t v6 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 296);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_248784D84(v5, &qword_269327638);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_24877E0A8()
{
  uint64_t v183 = v0;
  v178 = (uint64_t *)(v0 + 16);
  sub_2487770FC(v0 + 16, v0 + 112, &qword_2693274E0);
  sub_2487770FC(v0 + 112, v0 + 96, &qword_2693274E0);
  if (*(void *)(v0 + 104) >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v1 = sub_2487A5F48();
    os_log_type_t v2 = sub_2487A6598();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_24876F000, v1, v2, "The data for the messages paylaod obtained from the People extension was nil.", v3, 2u);
      MEMORY[0x24C57FA90](v3, -1, -1);
    }
    uint64_t v4 = *(void **)(v0 + 576);
    uint64_t v5 = *(void **)(v0 + 568);
    uint64_t v6 = *(void **)(v0 + 528);
    v169 = *(void **)(v0 + 520);
    uint64_t v7 = *(void *)(v0 + 488);
    uint64_t v174 = *(void *)(v0 + 496);
    uint64_t v171 = *(void *)(v0 + 480);
    uint64_t v176 = *(void *)(v0 + 456);
    uint64_t v8 = *(void *)(v0 + 304);
    uint64_t v158 = *(void *)(v0 + 296);
    *(void *)os_log_type_t type = *(void *)(v0 + 312);

    sub_2487832C4();
    swift_allocError();
    *(_OWORD *)uint64_t v9 = xmmword_2487A7550;
    *(unsigned char *)(v9 + 16) = 7;
    swift_willThrow();
    swift_release();

    sub_2487769A8(v178);
    (*(void (**)(os_log_type_t *, uint64_t))(v8 + 8))(*(os_log_type_t **)type, v158);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v174, v171);
    uint64_t v10 = v176;
    goto LABEL_5;
  }
  v159 = *(void **)(v0 + 568);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 504);
  uint64_t v13 = *(void *)(v0 + 472);
  uint64_t v14 = *(void *)(v0 + 480);
  uint64_t v15 = *(void *)(v0 + 464);
  uint64_t v16 = *(void *)(v0 + 400);
  uint64_t v17 = *(void *)(v0 + 456) + *(int *)(v0 + 616);
  uint64_t v18 = (void *)swift_task_alloc();
  uint64_t v19 = (char *)v18 + *(int *)(v16 + 48);
  *uint64_t v18 = v15;
  v18[1] = v13;
  v12(v19, v17, v14);
  uint64_t v20 = (uint64_t *)swift_task_alloc();
  sub_248784D20((uint64_t)v18, (uint64_t)v20, &qword_269327638);
  uint64_t v21 = swift_task_alloc();
  sub_2487770FC((uint64_t)v18, v21, &qword_269327638);
  id v22 = v159;
  swift_bridgeObjectRetain();
  id v23 = v22;
  sub_248784B90(v0 + 112);
  uint64_t v24 = sub_2487A5F48();
  os_log_type_t v25 = sub_2487A65B8();
  BOOL v26 = os_log_type_enabled(v24, v25);
  Class v27 = *(void **)(v0 + 568);
  if (v26)
  {
    v140 = *(void (**)(char *, char *, uint64_t))(v0 + 504);
    uint64_t v148 = v21;
    uint64_t v29 = *(void *)(v0 + 480);
    uint64_t v28 = *(void *)(v0 + 488);
    os_log_type_t typea = v25;
    uint64_t v30 = *(void *)(v0 + 400);
    uint64_t v31 = swift_slowAlloc();
    v151 = (void *)swift_slowAlloc();
    uint64_t v160 = swift_slowAlloc();
    v182[0] = v160;
    *(_DWORD *)uint64_t v31 = 136315394;
    os_log_type_t v32 = (char *)swift_task_alloc();
    uint64_t v33 = *(int *)(v30 + 48);
    id v34 = &v32[v33];
    uint64_t v35 = *v20;
    unint64_t v36 = v20[1];
    *(void *)os_log_type_t v32 = *v20;
    *((void *)v32 + 1) = v36;
    v140(&v32[v33], (char *)v20 + v33, v29);
    uint64_t v142 = (uint64_t)v20;
    uint64_t v37 = *(void (**)(char *, uint64_t))(v28 + 8);
    swift_bridgeObjectRetain();
    v37(v34, v29);
    swift_task_dealloc();
    *(void *)(v0 + 200) = sub_2487A24A8(v35, v36, v182);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    sub_248784D84(v148, &qword_269327638);
    sub_248784D84(v142, &qword_269327638);
    *(_WORD *)(v31 + 12) = 2112;
    *(void *)(v0 + 208) = v27;
    id v38 = v27;
    sub_2487A6698();
    void *v151 = v27;

    _os_log_impl(&dword_24876F000, v24, typea, "Updating message with GUID %s in Messages with response: %@", (uint8_t *)v31, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v151, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v160, -1, -1);
    MEMORY[0x24C57FA90](v31, -1, -1);

    swift_task_dealloc();
  }
  else
  {
    sub_248784D84(v21, &qword_269327638);
    swift_task_dealloc();
    sub_248784D84((uint64_t)v20, &qword_269327638);
  }
  swift_task_dealloc();
  v141 = *(uint64_t **)(v0 + 576);
  v143 = *(void **)(v0 + 568);
  v146 = *(void **)(v0 + 528);
  v149 = *(void **)(v0 + 520);
  v138 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 504);
  uint64_t v39 = *(void *)(v0 + 488);
  uint64_t v41 = *(void *)(v0 + 472);
  uint64_t v40 = *(void *)(v0 + 480);
  uint64_t v42 = *(void *)(v0 + 464);
  uint64_t v152 = *(void *)(v0 + 456);
  os_log_t loga = *(os_log_t *)(v0 + 496);
  *(void *)typeb = *(void *)(v0 + 424);
  uint64_t v43 = *(void *)(v0 + 400);
  uint64_t v44 = *(void *)(v0 + 304);
  uint64_t v144 = *(void *)(v0 + 312);
  uint64_t v45 = v152 + *(int *)(v0 + 616);
  uint64_t v161 = *(void *)(v0 + 448) + 1;
  uint64_t v139 = *(void *)(v0 + 296);
  swift_task_dealloc();
  uint64_t v46 = (void *)swift_task_alloc();
  uint64_t v47 = (char *)v46 + *(int *)(v43 + 48);
  *uint64_t v46 = v42;
  v46[1] = v41;
  v138(v47, v45, v40);
  uint64_t v48 = (void *)sub_2487A63A8();
  swift_bridgeObjectRelease();
  uint64_t v49 = *(void (**)(char *, uint64_t))(v39 + 8);
  v49(v47, v40);
  swift_task_dealloc();
  uint64_t v50 = (void *)sub_2487A5E48();
  IMSPIUpdatePluginMessageWithGUID();
  sub_248784BC0(v0 + 112);

  swift_release();
  sub_2487769A8(v178);
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v144, v139);
  v49((char *)loga, v40);
  sub_248784D84(v152, &qword_269327638);
  swift_task_dealloc();
  swift_task_dealloc();
  if (v161 == *(void *)typeb)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_12;
  }
  v179 = *(void **)(v0 + 600);
  uint64_t v52 = *(void *)(v0 + 440);
  uint64_t v53 = *(void *)(v0 + 448) + 1;
  *(void *)(v0 + 448) = v53;
  uint64_t v54 = *(uint64_t **)(v0 + 416);
  uint64_t v55 = *(void *)(v0 + 400);
  uint64_t v162 = v55;
  v172 = (char *)v54 + *(int *)(v0 + 608);
  sub_248784D20(*(void *)(v0 + 384)+ ((*(unsigned __int8 *)(v0 + 612) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 612))+ v52 * v53, (uint64_t)v54, &qword_269327638);
  uint64_t v56 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v56;
  uint64_t v57 = *(int *)(v55 + 48);
  *(_DWORD *)(v0 + 616) = v57;
  uint64_t v58 = (char *)v56 + v57;
  v153 = (char *)v56 + v57;
  uint64_t v59 = *v54;
  *(void *)(v0 + 464) = *v54;
  uint64_t v60 = v54[1];
  *(void *)(v0 + 472) = v60;
  uint64_t v145 = v59;
  *uint64_t v56 = v59;
  v56[1] = v60;
  uint64_t v177 = (uint64_t)v56;
  uint64_t v61 = sub_2487A5E38();
  *(void *)(v0 + 480) = v61;
  uint64_t v62 = *(void *)(v61 - 8);
  *(void *)(v0 + 488) = v62;
  os_log_t log = *(os_log_t *)(v62 + 32);
  ((void (*)(char *, char *, uint64_t))log)(v58, v172, v61);
  uint64_t v63 = swift_task_alloc();
  *(void *)(v0 + 496) = v63;
  uint64_t v64 = swift_task_alloc() + *(int *)(v162 + 48);
  uint64_t v173 = v62;
  uint64_t v65 = v62 + 16;
  uint64_t v66 = *(Class **)(v62 + 16);
  *(void *)(v0 + 504) = v66;
  *(void *)(v0 + 512) = (v62 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  ((void (*)(uint64_t, char *, uint64_t))v66)(v64, v153, v61);
  ((void (*)(uint64_t, uint64_t, uint64_t))log)(v63, v64, v61);
  swift_task_dealloc();
  uint64_t v163 = v60;
  swift_bridgeObjectRetain();
  sub_2487A6248();
  sub_248783280(&qword_269327640);
  sub_248783280(&qword_269327648);
  sub_2487A6238();
  uint64_t v150 = v61;
  if (v179)
  {
    uint64_t v67 = swift_task_alloc();
    ((void (*)(uint64_t, uint64_t, uint64_t))v66)(v67, v63, v61);
    id v68 = v179;
    id v69 = v179;
    id v70 = sub_2487A5F48();
    uint64_t v71 = v61;
    os_log_type_t v72 = sub_2487A6598();
    if (os_log_type_enabled(v70, v72))
    {
      uint64_t v73 = swift_slowAlloc();
      v154 = (void *)swift_slowAlloc();
      uint64_t typec = swift_slowAlloc();
      v182[0] = typec;
      *(_DWORD *)uint64_t v73 = 136315394;
      sub_248784C30(&qword_269327668, MEMORY[0x270FA8E48]);
      uint64_t v74 = sub_2487A6848();
      *(void *)(v0 + 216) = sub_2487A24A8(v74, v75, v182);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      v170 = *(void (**)(uint64_t, uint64_t))(v173 + 8);
      v170(v67, v71);
      *(_WORD *)(v73 + 12) = 2112;
      id v76 = v179;
      uint64_t v77 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 224) = v77;
      sub_2487A6698();
      void *v154 = v77;

      _os_log_impl(&dword_24876F000, v70, v72, "Could not parse ATPayload from messagesPayloadURL %s. error: %@", (uint8_t *)v73, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v154, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](typec, -1, -1);
      MEMORY[0x24C57FA90](v73, -1, -1);
    }
    else
    {
      v170 = *(void (**)(uint64_t, uint64_t))(v173 + 8);
      v170(v67, v71);
    }
    swift_task_dealloc();
    uint64_t v65 = sub_2487A5DA8();
    uint64_t v87 = *(void *)(v65 - 8);
    unint64_t v88 = swift_task_alloc();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327650);
    uint64_t v89 = swift_task_alloc();
    sub_2487A5D88();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v89, 1, v65) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_248784D84(v89, &qword_269327650);
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v10 = v177;
      if (qword_269327260 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(*(void *)(v0 + 272), (uint64_t)qword_269329278);
      os_log_type_t v90 = sub_2487A5F48();
      os_log_type_t v91 = sub_2487A6598();
      if (os_log_type_enabled(v90, v91))
      {
        unint64_t v92 = (uint8_t *)swift_slowAlloc();
        uint64_t v93 = swift_slowAlloc();
        v182[0] = v93;
        *(_DWORD *)unint64_t v92 = 136315138;
        *(void *)(v0 + 144) = sub_2487A24A8(0x2928656C646E6168, 0xE800000000000000, v182);
        sub_2487A6698();
        _os_log_impl(&dword_24876F000, v90, v91, "%s URL components was nil", v92, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v93, -1, -1);
        MEMORY[0x24C57FA90](v92, -1, -1);
      }

      uint64_t v95 = *(void *)(v0 + 304);
      uint64_t v94 = *(void *)(v0 + 312);
      uint64_t v96 = *(void *)(v0 + 296);
      sub_2487832C4();
      swift_allocError();
      *(void *)uint64_t v97 = v179;
      *(void *)(v97 + 8) = 0;
      *(unsigned char *)(v97 + 16) = 3;
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v94, v96);
      v170(v63, v150);
      goto LABEL_5;
    }
    v141 = (uint64_t *)(v0 + 168);
    os_log_t log = (os_log_t)v87;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v87 + 32))(v88, v89, v65);
    swift_task_dealloc();
    uint64_t v98 = sub_2487A6138();
    uint64_t v79 = *(void *)(v98 - 8);
    uint64_t v66 = (Class *)swift_task_alloc();
    uint64_t v99 = swift_task_alloc();
    sub_2487A60E8();
    (*(void (**)(Class *, uint64_t, uint64_t))(v79 + 32))(v66, v99, v98);
    swift_task_dealloc();
    uint64_t v113 = sub_248783E4C(v66, v145, v163);
    if (!v113)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_269327260 == -1)
      {
LABEL_45:
        v147 = v66;
        uint64_t v164 = v65;
        unint64_t v155 = v88;
        __swift_project_value_buffer(*(void *)(v0 + 272), (uint64_t)qword_269329278);
        unint64_t v114 = sub_2487A5F48();
        os_log_type_t v115 = sub_2487A6598();
        if (os_log_type_enabled(v114, v115))
        {
          v116 = (uint8_t *)swift_slowAlloc();
          uint64_t v117 = swift_slowAlloc();
          v182[0] = v117;
          *(_DWORD *)v116 = 136315138;
          uint64_t *v141 = sub_2487A24A8(0x2928656C646E6168, 0xE800000000000000, v182);
          sub_2487A6698();
          _os_log_impl(&dword_24876F000, v114, v115, "%s derivedPayload was nil", v116, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C57FA90](v117, -1, -1);
          MEMORY[0x24C57FA90](v116, -1, -1);
        }

        uint64_t v119 = *(void *)(v0 + 304);
        uint64_t v118 = *(void *)(v0 + 312);
        uint64_t v120 = *(void *)(v0 + 296);
        sub_2487832C4();
        swift_allocError();
        *(void *)uint64_t v121 = v179;
        *(void *)(v121 + 8) = 0;
        *(unsigned char *)(v121 + 16) = 3;
        swift_willThrow();
        (*(void (**)(Class *, uint64_t))(v79 + 8))(v147, v98);
        ((void (*)(unint64_t, uint64_t))log[1].isa)(v155, v164);
        (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v118, v120);
        v170(v63, v150);
        sub_248784D84(v177, &qword_269327638);
        swift_task_dealloc();
        swift_task_dealloc();
        goto LABEL_6;
      }
LABEL_55:
      swift_once();
      goto LABEL_45;
    }
    uint64_t v78 = v113;

    (*(void (**)(Class *, uint64_t))(v79 + 8))(v66, v98);
    ((void (*)(unint64_t, uint64_t))log[1].isa)(v88, v65);
    swift_task_dealloc();
    swift_task_dealloc();
  }
  else
  {
    uint64_t v78 = *(void *)(v0 + 136);
  }
  *(void *)(v0 + 520) = v78;
  uint64_t v80 = *(void *)(v0 + 320);
  uint64_t v79 = *(void *)(v0 + 328);
  uint64_t v81 = (void (*)(uint64_t, uint64_t))v78;
  os_log_type_t v82 = (void *)sub_2487A62F8();
  unint64_t v83 = sub_2487A5F88();

  swift_bridgeObjectRetain();
  uint64_t v84 = sub_248782640(v83, v80, v79);
  *(void *)(v0 + 528) = v84;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v84)
  {
    swift_bridgeObjectRelease();
    v170 = v81;
    uint64_t v100 = (void *)sub_2487A62F8();
    unint64_t v88 = sub_2487A5F88();

    if (v88 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v98 = sub_2487A67E8();
      swift_bridgeObjectRelease();
      if (v98) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v98 = *(void *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v98)
      {
LABEL_33:
        uint64_t v175 = v63;
        v182[0] = MEMORY[0x263F8EE78];
        sub_248774030(0, v98 & ~(v98 >> 63), 0);
        if ((v98 & 0x8000000000000000) == 0)
        {
          uint64_t v101 = 0;
          uint64_t v102 = v182[0];
          unint64_t v180 = v88 & 0xC000000000000001;
          unint64_t v103 = v88;
          uint64_t v104 = v98;
          do
          {
            if (v180) {
              id v105 = (id)MEMORY[0x24C57F1A0](v101, v88);
            }
            else {
              id v105 = *(id *)(v88 + 8 * v101 + 32);
            }
            v106 = v105;
            uint64_t v107 = sub_2487A6038();
            uint64_t v109 = v108;

            v182[0] = v102;
            unint64_t v111 = *(void *)(v102 + 16);
            unint64_t v110 = *(void *)(v102 + 24);
            if (v111 >= v110 >> 1)
            {
              sub_248774030(v110 > 1, v111 + 1, 1);
              uint64_t v102 = v182[0];
            }
            ++v101;
            *(void *)(v102 + 16) = v111 + 1;
            uint64_t v112 = v102 + 16 * v111;
            *(void *)(v112 + 32) = v107;
            *(void *)(v112 + 40) = v109;
            unint64_t v88 = v103;
          }
          while (v104 != v101);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v63 = v175;
          goto LABEL_50;
        }
        __break(1u);
        goto LABEL_55;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_50:
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v122 = sub_2487A5F48();
    os_log_type_t v123 = sub_2487A6598();
    BOOL v124 = os_log_type_enabled(v122, v123);
    unint64_t v125 = *(void *)(v0 + 328);
    if (v124)
    {
      uint64_t v126 = *(void *)(v0 + 320);
      uint64_t v127 = swift_slowAlloc();
      uint64_t v181 = swift_slowAlloc();
      v182[0] = v181;
      *(_DWORD *)uint64_t v127 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 176) = sub_2487A24A8(v126, v125, v182);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v127 + 12) = 2080;
      uint64_t v128 = swift_bridgeObjectRetain();
      uint64_t v129 = MEMORY[0x24C57EEE0](v128, MEMORY[0x263F8D310]);
      unint64_t v131 = v130;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 184) = sub_2487A24A8(v129, v131, v182);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v122, v123, "No answer choice in the original question had id %s. originalAnswerIds: %s", (uint8_t *)v127, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v181, -1, -1);
      MEMORY[0x24C57FA90](v127, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v10 = v177;
    uint64_t v133 = *(void *)(v0 + 320);
    uint64_t v132 = *(void *)(v0 + 328);
    uint64_t v135 = *(void *)(v0 + 304);
    uint64_t v134 = *(void *)(v0 + 312);
    uint64_t v136 = *(void *)(v0 + 296);
    sub_2487832C4();
    swift_allocError();
    *(void *)uint64_t v137 = v133;
    *(void *)(v137 + 8) = v132;
    *(unsigned char *)(v137 + 16) = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v134, v136);
    (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v63, v150);
LABEL_5:
    sub_248784D84(v10, &qword_269327638);
LABEL_6:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
LABEL_12:
    return v11();
  }
  uint64_t v85 = (void *)swift_task_alloc();
  *(void *)(v0 + 536) = v85;
  *uint64_t v85 = v0;
  v85[1] = sub_24877DBB0;
  uint64_t v86 = *(void *)(v0 + 368);
  v85[16] = *(void *)(v0 + 360);
  v85[17] = v86;
  return MEMORY[0x270FA2498](sub_2487833A8, 0, 0);
}

uint64_t sub_24877FAD4()
{
  uint64_t v1 = (void *)v0[75];
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_2487A5F48();
  os_log_type_t v5 = sub_2487A6598();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[75];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v10;
    sub_2487A6698();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_24876F000, v4, v5, "Failed to get the new Messages payload from the People extension. error: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v8, -1, -1);
    MEMORY[0x24C57FA90](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[75];
  }
  uint64_t v12 = (void *)v0[75];
  uint64_t v13 = (void *)v0[72];
  id v22 = (void *)v0[71];
  id v23 = (void *)v0[66];
  uint64_t v15 = v0[61];
  uint64_t v14 = v0[62];
  BOOL v26 = (void *)v0[65];
  uint64_t v27 = v0[60];
  uint64_t v16 = v0[57];
  uint64_t v17 = v0[38];
  uint64_t v24 = v0[37];
  uint64_t v25 = v0[39];

  sub_2487832C4();
  swift_allocError();
  *(void *)uint64_t v18 = v12;
  *(void *)(v18 + 8) = 0;
  *(unsigned char *)(v18 + 16) = 4;
  id v19 = v12;
  swift_willThrow();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v25, v24);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v27);
  sub_248784D84(v16, &qword_269327638);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_24877FD8C(id a1, void *a2, char a3)
{
  switch(a3)
  {
    case 3:
      unint64_t v12 = 0;
      id v5 = a1;
      sub_2487A6758();
      sub_2487A6408();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2693274E8);
      sub_2487A67A8();
      id v6 = a1;
      uint64_t v7 = a2;
      char v8 = 3;
      goto LABEL_8;
    case 4:
      unint64_t v12 = 0;
      id v9 = a1;
      sub_2487A6758();
      sub_2487A6408();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2693274E8);
      sub_2487A67A8();
      id v6 = a1;
      uint64_t v7 = a2;
      char v8 = 4;
      goto LABEL_8;
    case 5:
      unint64_t v12 = 0;
      id v11 = a1;
      sub_2487A6758();
      sub_2487A6408();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2693274E8);
      sub_2487A67A8();
      id v6 = a1;
      uint64_t v7 = a2;
      char v8 = 5;
LABEL_8:
      sub_2487853C0(v6, v7, v8);
      return v12;
    case 6:
      sub_2487A6758();
      swift_bridgeObjectRelease();
      unint64_t v12 = 0xD00000000000002DLL;
      goto LABEL_10;
    case 7:
      uint64_t result = 0xD000000000000060;
      switch((unint64_t)a1)
      {
        case 1uLL:
          uint64_t result = 0xD000000000000021;
          break;
        case 2uLL:
          uint64_t result = 0xD000000000000043;
          break;
        case 3uLL:
          uint64_t result = 0xD00000000000003BLL;
          break;
        default:
          return result;
      }
      return result;
    default:
      unint64_t v12 = 0;
      sub_2487A6758();
      sub_2487A6408();
      sub_2487A6408();
LABEL_10:
      sub_2487A6408();
      return v12;
  }
}

uint64_t sub_2487801C4()
{
  return sub_24877FD8C(*(id *)v0, *(void **)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_2487801D0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693274E8);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_248780290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = MEMORY[0x263F8EE78];
  id v8 = (void *)sub_2487A63A8();
  id v9 = (void *)swift_allocObject();
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = v7;
  aBlock[4] = (uint64_t)sub_248784CFC;
  aBlock[5] = (uint64_t)v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2487819BC;
  aBlock[3] = (uint64_t)&block_descriptor_11;
  uint64_t v10 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  IMSPIBatchFetchMessageGUIDsWithBalloonBundleID();
  _Block_release(v10);

  if (qword_269327268 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2487A5F68();
  __swift_project_value_buffer(v11, (uint64_t)qword_269329290);
  swift_bridgeObjectRetain_n();
  unint64_t v12 = sub_2487A5F48();
  os_log_type_t v13 = sub_2487A6588();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_2487A24A8(a4, a5, aBlock);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v12, v13, "Resuming continuation for query with request ID %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v15, -1, -1);
    MEMORY[0x24C57FA90](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327690);
  sub_2487A6528();
  return swift_release();
}

uint64_t sub_248780588(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t *a6)
{
  if (!a2)
  {
    if (qword_269327268 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2487A5F68();
    __swift_project_value_buffer(v19, (uint64_t)qword_269329290);
    uint64_t v20 = sub_2487A5F48();
    os_log_type_t v21 = sub_2487A6598();
    if (!os_log_type_enabled(v20, v21)) {
      goto LABEL_15;
    }
    id v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v22 = 0;
    _os_log_impl(&dword_24876F000, v20, v21, "Got back nil message GUID from IMSPI", v22, 2u);
    id v23 = v22;
LABEL_14:
    MEMORY[0x24C57FA90](v23, -1, -1);
LABEL_15:

    return 0;
  }
  uint64_t v12 = qword_269327268;
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2487A5F68();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_269329290);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_2487A5F48();
  os_log_type_t v16 = sub_2487A6588();
  uint64_t v136 = (uint64_t *)v14;
  unint64_t v137 = a2;
  uint64_t v135 = a1;
  unint64_t v131 = a5;
  uint64_t v132 = (unint64_t *)a4;
  unint64_t v130 = a6;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v138[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v139 = sub_2487A24A8(a1, a2, v138);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v139 = sub_2487A24A8(a4, a5, v138);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v15, v16, "Inspecting ScreenTime request message with GUID %s in Messages DB to see if it matches with request ID %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v18, -1, -1);
    MEMORY[0x24C57FA90](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = sub_2487A5E38();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(void *)(v25 + 64);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v115 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327698);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)&v115 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248784D20(a3, (uint64_t)v30, &qword_269327698);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v30, 1, v24) == 1)
  {
    sub_248784D84((uint64_t)v30, &qword_269327698);
    unint64_t v31 = v137;
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2487A5F48();
    os_log_type_t v32 = sub_2487A6598();
    if (!os_log_type_enabled(v20, v32))
    {

      swift_bridgeObjectRelease_n();
      return 0;
    }
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v138[0] = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v139 = sub_2487A24A8(v135, v31, v138);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v20, v32, "Payload URL for message with GUID %s was nil. Skipping.", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v34, -1, -1);
    id v23 = v33;
    goto LABEL_14;
  }
  uint64_t v129 = &v115;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))((char *)&v115 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0), v30, v24);
  uint64_t v35 = sub_2487A5DA8();
  uint64_t v36 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  id v38 = (char *)&v115 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327650);
  MEMORY[0x270FA5388](v39 - 8);
  uint64_t v41 = (char *)&v115 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487A5D88();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v41, 1, v35) == 1)
  {
    sub_248784D84((uint64_t)v41, &qword_269327650);
    unint64_t v42 = v137;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_2487A5F48();
    os_log_type_t v44 = sub_2487A6598();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v128 = v27;
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      v138[0] = v46;
      *(_DWORD *)uint64_t v45 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_2487A24A8(v135, v42, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v43, v44, "URL components for message with GUID %s was nil. Skipping.", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v46, -1, -1);
      MEMORY[0x24C57FA90](v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v25 + 8))(v128, v24);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v38, v41, v35);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693276A0);
  MEMORY[0x270FA5388](v47 - 8);
  BOOL v124 = (char *)&v115 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v125 = v38;
  uint64_t v49 = sub_2487A5D68();
  uint64_t v126 = v25;
  uint64_t v127 = v35;
  uint64_t v128 = (char *)&v115 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v49) {
    goto LABEL_36;
  }
  uint64_t v50 = v49;
  uint64_t v118 = v26;
  uint64_t v122 = v24;
  uint64_t v123 = v36;
  uint64_t v51 = *(void *)(v49 + 16);
  uint64_t v120 = &v115;
  uint64_t v121 = &v115;
  if (v51)
  {
    uint64_t v52 = sub_2487A5D58();
    uint64_t v53 = *(void *)(v52 - 8);
    uint64_t v54 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v134 = *(unint64_t **)(v53 + 16);
    uint64_t v133 = *(void *)(v53 + 72);
    uint64_t v55 = *(void *)(v53 + 64);
    uint64_t v117 = (v52 - 8) & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
    uint64_t v56 = v50 + ((v54 + 32) & ~v54);
    uint64_t v116 = v53;
    uint64_t v57 = (uint64_t (**)(char *, uint64_t))(v53 + 8);
    uint64_t v119 = v50;
    uint64_t v58 = swift_bridgeObjectRetain();
    while (1)
    {
      MEMORY[0x270FA5388](v58);
      uint64_t v59 = (char *)&v115 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
      ((void (*)(char *, uint64_t, uint64_t))v134)(v59, v56, v52);
      if (sub_2487A5D38() == 0x4974736575716572 && v60 == 0xE900000000000044) {
        break;
      }
      char v62 = sub_2487A6868();
      swift_bridgeObjectRelease();
      if (v62) {
        goto LABEL_33;
      }
      uint64_t v58 = (*v57)((char *)&v115 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0), v52);
      v56 += v133;
      if (!--v51)
      {
        swift_bridgeObjectRelease();
        uint64_t v35 = v127;
        uint64_t v27 = v128;
        goto LABEL_30;
      }
    }
    swift_bridgeObjectRelease();
LABEL_33:
    swift_bridgeObjectRelease();
    uint64_t v65 = v116;
    uint64_t v63 = (uint64_t)v124;
    (*(void (**)(char *, char *, uint64_t))(v116 + 32))(v124, v59, v52);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v65 + 56))(v63, 0, 1, v52);
    swift_bridgeObjectRelease();
    uint64_t v24 = v122;
    uint64_t v35 = v127;
    uint64_t v27 = v128;
    uint64_t v64 = v135;
  }
  else
  {
LABEL_30:
    uint64_t v52 = sub_2487A5D58();
    uint64_t v63 = (uint64_t)v124;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v124, 1, 1, v52);
    swift_bridgeObjectRelease();
    uint64_t v24 = v122;
    uint64_t v64 = v135;
  }
  sub_2487A5D58();
  uint64_t v66 = *(void *)(v52 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v63, 1, v52) == 1)
  {
    sub_248784D84(v63, &qword_2693276A0);
    uint64_t v36 = v123;
    goto LABEL_36;
  }
  uint64_t v73 = (unint64_t *)sub_2487A5D48();
  unint64_t v75 = v74;
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v63, v52);
  uint64_t v36 = v123;
  if (!v75)
  {
LABEL_36:
    unint64_t v67 = v137;
    swift_bridgeObjectRetain();
    id v68 = sub_2487A5F48();
    os_log_type_t v69 = sub_2487A6598();
    if (os_log_type_enabled(v68, v69))
    {
      id v70 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      v138[0] = v71;
      *(_DWORD *)id v70 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_2487A24A8(v135, v67, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v68, v69, "URL had no request ID for message with GUID %s. Skipping.", v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v71, -1, -1);
      MEMORY[0x24C57FA90](v70, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v125, v127);
      (*(void (**)(char *, uint64_t))(v126 + 8))(v128, v24);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v36 + 8))(v125, v127);
      (*(void (**)(char *, uint64_t))(v126 + 8))(v27, v24);
    }
    return 0;
  }
  unint64_t v77 = v131;
  uint64_t v76 = (uint64_t)v132;
  if (v73 == v132 && v75 == v131 || (sub_2487A6868() & 1) != 0)
  {
    uint64_t v78 = v76;
    uint64_t v134 = (unint64_t *)(v130 + 2);
    uint64_t v79 = swift_bridgeObjectRelease();
    unint64_t v130 = &v115;
    MEMORY[0x270FA5388](v79);
    uint64_t v81 = (char *)&v115 - ((v80 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v82 = v126;
    uint64_t v133 = *(void *)(v126 + 16);
    ((void (*)(char *, char *, uint64_t))v133)(v81, v27, v24);
    unint64_t v83 = v137;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v84 = sub_2487A5F48();
    os_log_type_t v85 = sub_2487A65B8();
    int v86 = v85;
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v87 = swift_slowAlloc();
      uint64_t v136 = (uint64_t *)swift_slowAlloc();
      v138[0] = (uint64_t)v136;
      *(_DWORD *)uint64_t v87 = 136315650;
      LODWORD(v124) = v86;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_2487A24A8(v78, v77, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      unint64_t v88 = v84;
      *(_WORD *)(v87 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v89 = v135;
      uint64_t v139 = sub_2487A24A8(v135, v83, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v87 + 22) = 2080;
      sub_248784C30(&qword_269327668, MEMORY[0x270FA8E48]);
      uint64_t v90 = sub_2487A6848();
      uint64_t v139 = sub_2487A24A8(v90, v91, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      uint64_t v92 = v24;
      uint64_t v93 = *(void (**)(char *, uint64_t))(v126 + 8);
      v93(v81, v92);
      _os_log_impl(&dword_24876F000, v84, (os_log_type_t)v124, "Found a match! Request with ID %s has message GUID %s. Payload URL: %s", (uint8_t *)v87, 0x20u);
      uint64_t v94 = v136;
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v94, -1, -1);
      MEMORY[0x24C57FA90](v87, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v92 = v24;
      uint64_t v93 = *(void (**)(char *, uint64_t))(v82 + 8);
      v93(v81, v92);

      uint64_t v89 = v135;
    }
    uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327638);
    uint64_t v136 = &v115;
    uint64_t v96 = *(void *)(v95 - 8);
    uint64_t v97 = MEMORY[0x270FA5388](v95 - 8);
    uint64_t v99 = (uint64_t *)((char *)&v115 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v100 = (char *)v99 + *(int *)(v97 + 56);
    *uint64_t v99 = v89;
    v99[1] = v83;
    ((void (*)(char *, char *, uint64_t))v133)(v100, v128, v92);
    uint64_t v101 = v134;
    swift_beginAccess();
    unint64_t v102 = *v101;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v101 = v102;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v102 = sub_24879FC60(0, *(void *)(v102 + 16) + 1, 1, v102);
      *uint64_t v134 = v102;
    }
    uint64_t v104 = v123;
    id v105 = v125;
    unint64_t v107 = *(void *)(v102 + 16);
    unint64_t v106 = *(void *)(v102 + 24);
    if (v107 >= v106 >> 1)
    {
      unint64_t v102 = sub_24879FC60(v106 > 1, v107 + 1, 1, v102);
      *uint64_t v134 = v102;
    }
    *(void *)(v102 + 16) = v107 + 1;
    sub_2487770FC((uint64_t)v99, v102+ ((*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80))+ *(void *)(v96 + 72) * v107, &qword_269327638);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v127);
    v93(v128, v122);
  }
  else
  {
    uint64_t v134 = v73;
    swift_bridgeObjectRetain_n();
    unint64_t v108 = v137;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v109 = sub_2487A5F48();
    os_log_type_t v110 = sub_2487A6588();
    int v111 = v110;
    if (os_log_type_enabled(v109, v110))
    {
      uint64_t v112 = swift_slowAlloc();
      LODWORD(v136) = v111;
      uint64_t v113 = v112;
      uint64_t v133 = swift_slowAlloc();
      v138[0] = v133;
      *(_DWORD *)uint64_t v113 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_2487A24A8(v64, v108, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v113 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_2487A24A8((uint64_t)v134, v75, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v113 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v139 = sub_2487A24A8((uint64_t)v132, v77, v138);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v109, (os_log_type_t)v136, "Message with GUID %s has request ID %s, is not for request with ID %s", (uint8_t *)v113, 0x20u);
      uint64_t v114 = v133;
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v114, -1, -1);
      MEMORY[0x24C57FA90](v113, -1, -1);

      (*(void (**)(char *, uint64_t))(v123 + 8))(v125, v127);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v123 + 8))(v125, v35);
    }
    (*(void (**)(char *, uint64_t))(v126 + 8))(v27, v24);
  }
  return 0;
}

uint64_t sub_2487819BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_2487A63B8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327698);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2487A5E28();
    uint64_t v11 = sub_2487A5E38();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_2487A5E38();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  swift_retain();
  char v13 = v4(v5, v7, v10);
  swift_release();
  swift_bridgeObjectRelease();
  sub_248784D84((uint64_t)v10, &qword_269327698);
  return v13 & 1;
}

void *sub_248781B24(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693276A8);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_248781B8C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2487A6468();
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
    uint64_t v5 = MEMORY[0x24C57EE50](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_248781C08(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_248781D08(a1, a2, a3);
}

unsigned __int8 *sub_248781C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2487A6478();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_248781F84();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_2487A6798();
  }
LABEL_7:
  uint64_t v11 = sub_248781D08(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_248781D08(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_248781F84()
{
  unint64_t v0 = sub_2487A6488();
  uint64_t v4 = sub_248782004(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_248782004(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_24878215C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_248781B24(v9, 0);
      unint64_t v12 = sub_24878225C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_2487A6798();
LABEL_4:
        JUMPOUT(0x24C57EDF0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x24C57EDF0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24C57EDF0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_24878215C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_248781B8C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_248781B8C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_24878225C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_248781B8C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_2487A6458();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_2487A6798();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_248781B8C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_2487A6428();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void *sub_248782470(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_2487A67E8())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C57F1A0](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v11 = objc_msgSend(v8, sel_dsid);
      if (v11)
      {
        unint64_t v12 = v11;
        uint64_t v22 = v9;
        uint64_t v13 = a2;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v11, sel_stringValue);

        uint64_t v16 = sub_2487A63B8();
        uint64_t v18 = v17;

        a3 = v14;
        if (v16 == v13 && v18 == v14)
        {
          swift_bridgeObjectRelease();
          uint64_t v9 = v22;
LABEL_18:
          swift_bridgeObjectRelease();
          return v9;
        }
        a2 = v13;
        char v20 = sub_2487A6868();
        swift_bridgeObjectRelease();
        uint64_t v9 = v22;
        if (v20) {
          goto LABEL_18;
        }
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_248782640(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_2487A67E8())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C57F1A0](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      if (sub_2487A6038() == a2 && v11 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_14:
        swift_bridgeObjectRelease();
        return v9;
      }
      char v12 = sub_2487A6868();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_14;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_17:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2487827AC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return MEMORY[0x270FA2498](sub_2487827CC, 0, 0);
}

uint64_t sub_2487827CC()
{
  unint64_t v23 = v0;
  if (qword_269327268 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2487A5F68();
  v0[9] = __swift_project_value_buffer(v1, (uint64_t)qword_269329290);
  uint64_t v2 = sub_2487A5F48();
  os_log_type_t v3 = sub_2487A65B8();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v22 = v5;
    *(_DWORD *)unint64_t v4 = 136315138;
    v0[6] = sub_2487A24A8(0xD00000000000002CLL, 0x80000002487A8D40, &v22);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v5, -1, -1);
    MEMORY[0x24C57FA90](v4, -1, -1);
  }

  id v6 = (id)IMBalloonExtensionIDWithSuffix();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v9 = v0[7];
    uint64_t v8 = v0[8];
    uint64_t v10 = sub_2487A63B8();
    uint64_t v12 = v11;

    v0[10] = v12;
    uint64_t v13 = (void *)swift_task_alloc();
    v0[11] = v13;
    v13[2] = v10;
    v13[3] = v12;
    v13[4] = v9;
    v13[5] = v8;
    uint64_t v14 = (void *)swift_task_alloc();
    v0[12] = v14;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327688);
    *uint64_t v14 = v0;
    v14[1] = sub_248782B3C;
    return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD00000000000002CLL, 0x80000002487A8D40, sub_248784C78, v13, v15);
  }
  else
  {
    uint64_t v16 = sub_2487A5F48();
    os_log_type_t v17 = sub_2487A6598();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_24876F000, v16, v17, "ScreenTime request messages extension bundle identifier was nil", v18, 2u);
      MEMORY[0x24C57FA90](v18, -1, -1);
    }

    sub_2487832C4();
    swift_allocError();
    *(void *)uint64_t v19 = 0;
    *(void *)(v19 + 8) = 0;
    *(unsigned char *)(v19 + 16) = 7;
    swift_willThrow();
    char v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
}

uint64_t sub_248782B3C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248782C70, 0, 0);
}

uint64_t sub_248782C70()
{
  uint64_t v51 = v0;
  uint64_t v1 = v0[2];
  if (*(void *)(v1 + 16))
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_2487A5F48();
    os_log_type_t v3 = sub_2487A65B8();
    BOOL v4 = os_log_type_enabled(v2, v3);
    unint64_t v5 = v0[8];
    if (v4)
    {
      uint64_t v6 = v0[7];
      uint64_t v7 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t v49 = v46;
      *(_DWORD *)uint64_t v7 = 136315394;
      swift_bridgeObjectRetain();
      v0[3] = sub_2487A24A8(v6, v5, &v49);
      uint64_t v45 = v0 + 4;
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v7 + 12) = 2080;
      int64_t v8 = *(void *)(v1 + 16);
      uint64_t v9 = MEMORY[0x263F8EE78];
      if (v8)
      {
        os_log_type_t v40 = v3;
        uint64_t v41 = v7;
        unint64_t v42 = v2;
        os_log_type_t v44 = v0;
        uint64_t v50 = MEMORY[0x263F8EE78];
        sub_248774030(0, v8, 0);
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327638);
        uint64_t v43 = v1;
        uint64_t v10 = v1
            + ((*(unsigned __int8 *)(*(void *)(v48 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v48 - 8) + 80));
        uint64_t v47 = *(void *)(*(void *)(v48 - 8) + 72);
        do
        {
          uint64_t v11 = (uint64_t *)swift_task_alloc();
          sub_248784D20(v10, (uint64_t)v11, &qword_269327638);
          uint64_t v12 = (void *)swift_task_alloc();
          uint64_t v13 = *(int *)(v48 + 48);
          uint64_t v14 = (char *)v12 + v13;
          uint64_t v15 = (char *)v11 + v13;
          uint64_t v17 = *v11;
          uint64_t v16 = v11[1];
          *uint64_t v12 = *v11;
          v12[1] = v16;
          uint64_t v18 = sub_2487A5E38();
          uint64_t v19 = *(void *)(v18 - 8);
          (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v14, v15, v18);
          char v20 = *(void (**)(char *, uint64_t))(v19 + 8);
          swift_bridgeObjectRetain();
          v20(v14, v18);
          swift_task_dealloc();
          sub_248784D84((uint64_t)v11, &qword_269327638);
          swift_task_dealloc();
          uint64_t v9 = v50;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_248774030(0, *(void *)(v9 + 16) + 1, 1);
            uint64_t v9 = v50;
          }
          unint64_t v22 = *(void *)(v9 + 16);
          unint64_t v21 = *(void *)(v9 + 24);
          if (v22 >= v21 >> 1)
          {
            sub_248774030(v21 > 1, v22 + 1, 1);
            uint64_t v9 = v50;
          }
          *(void *)(v9 + 16) = v22 + 1;
          uint64_t v23 = v9 + 16 * v22;
          *(void *)(v23 + 32) = v17;
          *(void *)(v23 + 40) = v16;
          v10 += v47;
          --v8;
        }
        while (v8);
        uint64_t v1 = v43;
        unint64_t v0 = v44;
        uint64_t v7 = v41;
        uint64_t v2 = v42;
        os_log_type_t v3 = v40;
      }
      uint64_t v31 = MEMORY[0x24C57EEE0](v9, MEMORY[0x263F8D310]);
      unint64_t v33 = v32;
      swift_bridgeObjectRelease();
      *uint64_t v45 = sub_2487A24A8(v31, v33, &v49);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v2, v3, "Matching messages for request ID %s have message GUIDs %s", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v46, -1, -1);
      MEMORY[0x24C57FA90](v7, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v34 = (uint64_t (*)(uint64_t))v0[1];
    return v34(v1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_2487A5F48();
    os_log_type_t v25 = sub_2487A6598();
    BOOL v26 = os_log_type_enabled(v24, v25);
    unint64_t v27 = v0[8];
    if (v26)
    {
      uint64_t v28 = v0[7];
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v50 = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_bridgeObjectRetain();
      v0[5] = sub_2487A24A8(v28, v27, &v50);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v24, v25, "No ScreenTime request message in the Messages DB matched request ID %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v30, -1, -1);
      MEMORY[0x24C57FA90](v29, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v37 = v0[7];
    uint64_t v36 = v0[8];
    sub_2487832C4();
    swift_allocError();
    *(void *)uint64_t v38 = v37;
    *(void *)(v38 + 8) = v36;
    *(unsigned char *)(v38 + 16) = 2;
    swift_bridgeObjectRetain();
    swift_willThrow();
    uint64_t v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
}

uint64_t sub_248783280(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2487A6318();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2487832C4()
{
  unint64_t result = qword_269327658;
  if (!qword_269327658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269327658);
  }
  return result;
}

uint64_t sub_248783318(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return MEMORY[0x270FA2498](sub_2487833A8, 0, 0);
}

uint64_t sub_2487833A8()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BF48]), sel_init);
  v0[18] = v1;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_2487834F8;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2487801D0;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_startRequestWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2487834F8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_248783BF8;
  }
  else {
    uint64_t v2 = sub_248783634;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248783634()
{
  uint64_t v45 = v0;
  v44[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  os_log_type_t v3 = (void *)v0[15];
  id v4 = objc_msgSend(v3, sel_members);
  sub_248784BF0();
  unint64_t v5 = sub_2487A64B8();

  swift_bridgeObjectRetain();
  uint64_t v6 = sub_248782470(v5, v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6 && (id v7 = objc_msgSend(v6, sel_appleID)) != 0)
  {
    int64_t v8 = v7;
    uint64_t v9 = (void *)v0[18];
    uint64_t v10 = sub_2487A63B8();
    uint64_t v12 = v11;

    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v13(v10, v12);
  }
  else
  {
    uint64_t v43 = v3;
    if (qword_269327268 != -1) {
      swift_once();
    }
    uint64_t v15 = v0 + 10;
    uint64_t v42 = sub_2487A5F68();
    __swift_project_value_buffer(v42, (uint64_t)qword_269329290);
    id v16 = v6;
    swift_bridgeObjectRetain_n();
    id v17 = v16;
    uint64_t v18 = sub_2487A5F48();
    os_log_type_t v19 = sub_2487A6598();
    BOOL v20 = os_log_type_enabled(v18, v19);
    unint64_t v21 = v0[17];
    if (v20)
    {
      uint64_t v22 = v0[16];
      uint64_t v23 = swift_slowAlloc();
      os_log_type_t v40 = (void *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v44[0] = v41;
      *(_DWORD *)uint64_t v23 = 136315394;
      swift_bridgeObjectRetain();
      v0[10] = sub_2487A24A8(v22, v21, v44);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v23 + 12) = 2112;
      if (v6)
      {
        *uint64_t v15 = v17;
        id v24 = v17;
      }
      else
      {
        *uint64_t v15 = 0;
      }
      sub_2487A6698();
      void *v40 = v6;

      _os_log_impl(&dword_24876F000, v18, v19, "Responder lacked Apple ID. DSID: %s, member: %@", (uint8_t *)v23, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v40, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v41, -1, -1);
      MEMORY[0x24C57FA90](v23, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    uint64_t v26 = v0[17];
    os_log_type_t v25 = (void *)v0[18];
    uint64_t v27 = v0[16];
    sub_2487832C4();
    uint64_t v28 = (void *)swift_allocError();
    *(void *)uint64_t v29 = v27;
    *(void *)(v29 + 8) = v26;
    *(unsigned char *)(v29 + 16) = 6;
    swift_bridgeObjectRetain();
    swift_willThrow();

    if (qword_269327268 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v42, (uint64_t)qword_269329290);
    id v30 = v28;
    id v31 = v28;
    unint64_t v32 = sub_2487A5F48();
    os_log_type_t v33 = sub_2487A6598();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 138412290;
      id v36 = v28;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      v0[10] = v37;
      sub_2487A6698();
      *uint64_t v35 = v37;

      _os_log_impl(&dword_24876F000, v32, v33, "Failed to fetch family members. error: %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v35, -1, -1);
      MEMORY[0x24C57FA90](v34, -1, -1);
    }
    else
    {
    }
    swift_allocError();
    *(void *)uint64_t v38 = v28;
    *(void *)(v38 + 8) = 0;
    *(unsigned char *)(v38 + 16) = 5;
    swift_willThrow();
    uint64_t v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
}

uint64_t sub_248783BF8()
{
  uint64_t v1 = (void *)v0[18];
  swift_willThrow();

  uint64_t v2 = (void *)v0[19];
  if (qword_269327268 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2487A5F68();
  __swift_project_value_buffer(v3, (uint64_t)qword_269329290);
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_2487A5F48();
  os_log_type_t v7 = sub_2487A6598();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v8 = 138412290;
    id v10 = v2;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v11;
    sub_2487A6698();
    *uint64_t v9 = v11;

    _os_log_impl(&dword_24876F000, v6, v7, "Failed to fetch family members. error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v9, -1, -1);
    MEMORY[0x24C57FA90](v8, -1, -1);
  }
  else
  {
  }
  sub_2487832C4();
  swift_allocError();
  *(void *)uint64_t v12 = v2;
  *(void *)(v12 + 8) = 0;
  *(unsigned char *)(v12 + 16) = 5;
  swift_willThrow();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_248783E4C(Class *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v79 = a2;
  uint64_t v82 = a1;
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2487A5F68();
  id v81 = (id)__swift_project_value_buffer(v4, (uint64_t)qword_269329278);
  id v5 = sub_2487A5F48();
  os_log_type_t v6 = sub_2487A65B8();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_24876F000, v5, v6, "Trying to derive ATPayload from MessageDetails", v7, 2u);
    MEMORY[0x24C57FA90](v7, -1, -1);
  }

  uint64_t v8 = sub_2487A60D8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (char *)&v73 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327678);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v14 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487A60F8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_248784D84((uint64_t)v14, &qword_269327678);
LABEL_9:
    unint64_t v21 = sub_2487A5F48();
    os_log_type_t v22 = sub_2487A6598();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_24876F000, v21, v22, "MessageDetails.eventSource was unknown", v23, 2u);
      MEMORY[0x24C57FA90](v23, -1, -1);
    }

    return 0;
  }
  uint64_t v78 = a3;
  uint64_t v80 = &v73;
  uint64_t v15 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))((char *)&v73 - v11, v14, v8);
  MEMORY[0x270FA5388](v15);
  id v16 = (char *)&v73 - v11;
  int v17 = *MEMORY[0x263F5D218];
  (*(void (**)(char *, void, uint64_t))(v9 + 104))((char *)&v73 - v11, *MEMORY[0x263F5D218], v8);
  sub_248784C30(&qword_269327680, MEMORY[0x270FBDC38]);
  char v18 = sub_2487A6398();
  os_log_type_t v19 = v12;
  BOOL v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v16, v8);
  if (v18)
  {
    v20(v12, v8);
    goto LABEL_9;
  }
  uint64_t v76 = v20;
  uint64_t v77 = v9 + 8;
  uint64_t v26 = sub_2487A6128();
  unint64_t v28 = v27;
  uint64_t v29 = swift_bridgeObjectRelease();
  uint64_t v30 = HIBYTE(v28) & 0xF;
  if ((v28 & 0x2000000000000000) == 0) {
    uint64_t v30 = v26 & 0xFFFFFFFFFFFFLL;
  }
  if (!v30)
  {
    uint64_t v41 = sub_2487A5F48();
    os_log_type_t v42 = sub_2487A6598();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_24876F000, v41, v42, "MessageDetails.requestID was empty", v43, 2u);
      MEMORY[0x24C57FA90](v43, -1, -1);
    }

    v76(v19, v8);
    return 0;
  }
  MEMORY[0x270FA5388](v29);
  id v31 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v31((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v8);
  uint64_t v32 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  if (MEMORY[0x263F5D218] && v32 == v17 || MEMORY[0x263F5D220] && v32 == *MEMORY[0x263F5D220])
  {
    MEMORY[0x270FA5388](v32);
    os_log_type_t v33 = v12;
    v31((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v8);
    uint64_t v34 = sub_2487A5F48();
    os_log_type_t v35 = sub_2487A6598();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      unint64_t v84 = v37;
      *(_DWORD *)id v36 = 136315138;
      uint64_t v82 = &v73;
      uint64_t v38 = sub_2487A60C8();
      uint64_t v83 = sub_2487A24A8(v38, v39, (uint64_t *)&v84);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      os_log_type_t v40 = v76;
      v76((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      _os_log_impl(&dword_24876F000, v34, v35, "MessageDetails.eventSource was unsupported \"%s\"", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v37, -1, -1);
      MEMORY[0x24C57FA90](v36, -1, -1);

      v40(v33, v8);
    }
    else
    {

      uint64_t v58 = v76;
      v76((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      v58(v12, v8);
    }
    return 0;
  }
  unint64_t v75 = &v73;
  if (!MEMORY[0x263F5D210] || v32 != *MEMORY[0x263F5D210])
  {
    uint64_t v82 = (Class *)((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
    MEMORY[0x270FA5388](v32);
    uint64_t v59 = v12;
    uint64_t v60 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    v31(v60, v19, v8);
    uint64_t v61 = sub_2487A5F48();
    os_log_type_t v62 = sub_2487A6598();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      unint64_t v84 = v64;
      *(_DWORD *)uint64_t v63 = 136315138;
      id v81 = v63 + 4;
      uint64_t v65 = sub_2487A60C8();
      uint64_t v83 = sub_2487A24A8(v65, v66, (uint64_t *)&v84);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      unint64_t v67 = v60;
      id v68 = v76;
      v76(v67, v8);
      _os_log_impl(&dword_24876F000, v61, v62, "MessageDetails.eventSource was unsupported \"%s\"", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v64, -1, -1);
      MEMORY[0x24C57FA90](v63, -1, -1);
    }
    else
    {

      id v68 = v76;
      v76((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    }
    v68(v59, v8);
    v68((char *)v82, v8);
    return 0;
  }
  id v44 = objc_allocWithZone((Class)sub_2487A5FF8());
  uint64_t v45 = (void *)sub_2487A5FD8();
  id v81 = (id)sub_2487A6018();
  sub_2487A6128();
  id v46 = v45;
  sub_2487A63F8();
  sub_2487A6108();
  id v74 = v46;
  uint64_t v47 = (void *)sub_2487A5FA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693274A0);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_2487A7810;
  unint64_t v84 = 1;
  id v81 = v47;
  sub_2487A6848();
  sub_2487A63F8();
  uint64_t v49 = (objc_class *)sub_2487A6058();
  id v50 = objc_allocWithZone(v49);
  *(void *)(v48 + 32) = sub_2487A6028();
  unint64_t v84 = 2;
  sub_2487A6848();
  sub_2487A63F8();
  id v51 = objc_allocWithZone(v49);
  *(void *)(v48 + 40) = sub_2487A6028();
  unint64_t v84 = 3;
  sub_2487A6848();
  sub_2487A63F8();
  Class v73 = v49;
  id v52 = objc_allocWithZone(v49);
  *(void *)(v48 + 48) = sub_2487A6028();
  unint64_t v84 = v48;
  sub_2487A64D8();
  unint64_t v53 = v84;
  if (v84 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2487A67E8();
    uint64_t v54 = result;
    if (!result) {
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v54 = *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v54) {
      goto LABEL_42;
    }
  }
  if (v54 >= 1)
  {
    for (uint64_t i = 0; i != v54; ++i)
    {
      if ((v53 & 0xC000000000000001) != 0) {
        id v56 = (id)MEMORY[0x24C57F1A0](i, v53);
      }
      else {
        id v56 = *(id *)(v53 + 8 * i + 32);
      }
      uint64_t v57 = v56;
      sub_2487A6048();
    }
LABEL_42:
    swift_bridgeObjectRelease();
    unint64_t v84 = 0;
    sub_2487A6848();
    sub_2487A63F8();
    id v69 = objc_allocWithZone(v73);
    id v70 = (void *)sub_2487A6028();
    sub_2487A6048();
    unint64_t v84 = v53;
    id v71 = v70;
    MEMORY[0x24C57EEB0]();
    if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2487A64E8();
    }
    sub_2487A64F8();
    sub_2487A64D8();

    os_log_type_t v72 = v81;
    sub_2487A5F98();
    sub_2487A6118();
    sub_2487A5FC8();

    sub_2487A6318();
    swift_bridgeObjectRetain();
    sub_2487A6088();
    uint64_t v24 = sub_2487A62B8();

    v76(v12, v8);
    return v24;
  }
  __break(1u);
  return result;
}

uint64_t sub_248784B90(uint64_t a1)
{
  return a1;
}

uint64_t sub_248784BC0(uint64_t a1)
{
  return a1;
}

unint64_t sub_248784BF0()
{
  unint64_t result = qword_269327670;
  if (!qword_269327670)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269327670);
  }
  return result;
}

uint64_t sub_248784C30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_248784C78(uint64_t a1)
{
  return sub_248780290(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_248784C84()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_248784CBC()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_248784CFC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_248780588(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(uint64_t **)(v3 + 32));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_248784D20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_248784D84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_248784DE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, void *a6@<X8>)
{
  uint64_t result = sub_2487A6038();
  uint64_t v14 = v13;
  uint64_t v15 = HIBYTE(v13) & 0xF;
  uint64_t v16 = result & 0xFFFFFFFFFFFFLL;
  if ((v14 & 0x2000000000000000) != 0) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = result & 0xFFFFFFFFFFFFLL;
  }
  if (v17)
  {
    uint64_t v47 = a1;
    if ((v14 & 0x1000000000000000) != 0)
    {
      uint64_t v18 = a3;
      uint64_t v20 = (uint64_t)sub_248781C20(result, v14, 10);
      char v22 = v46;
      goto LABEL_33;
    }
    if ((v14 & 0x2000000000000000) == 0)
    {
      uint64_t v18 = a3;
      if ((result & 0x1000000000000000) != 0) {
        os_log_type_t v19 = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        os_log_type_t v19 = (unsigned __int8 *)sub_2487A6798();
      }
      uint64_t v20 = (uint64_t)sub_248781D08(v19, v16, 10);
      char v22 = v21 & 1;
      goto LABEL_33;
    }
    v49[0] = result;
    v49[1] = v14 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v15) {
        goto LABEL_65;
      }
      if (v15 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v20 = (BYTE1(result) - 48);
      if (v15 == 2) {
        goto LABEL_43;
      }
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v18 = a3;
      uint64_t v20 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
      uint64_t v23 = v15 - 3;
      if (v23)
      {
        uint64_t v24 = (unsigned __int8 *)v49 + 3;
        while (1)
        {
          unsigned int v25 = *v24 - 48;
          if (v25 > 9) {
            goto LABEL_32;
          }
          uint64_t v26 = 10 * v20;
          if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
            goto LABEL_32;
          }
          uint64_t v20 = v26 + v25;
          if (__OFADD__(v26, v25)) {
            goto LABEL_32;
          }
          char v22 = 0;
          ++v24;
          if (!--v23) {
            goto LABEL_33;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v15)
        {
          if (v15 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            if (v15 == 2)
            {
              uint64_t v18 = a3;
              char v22 = 0;
              uint64_t v20 = -(uint64_t)(BYTE1(result) - 48);
LABEL_33:
              uint64_t result = swift_bridgeObjectRelease();
              if ((v22 & 1) == 0)
              {
                *a6 = v47;
                a6[1] = a2;
                a6[2] = v18;
                a6[3] = a4;
                a6[4] = v20;
                return result;
              }
              swift_bridgeObjectRelease();
              goto LABEL_36;
            }
            if ((BYTE2(result) - 48) <= 9u)
            {
              uint64_t v18 = a3;
              uint64_t v20 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
              uint64_t v42 = v15 - 3;
              if (!v42) {
                goto LABEL_54;
              }
              uint64_t v43 = (unsigned __int8 *)v49 + 3;
              while (1)
              {
                unsigned int v44 = *v43 - 48;
                if (v44 > 9) {
                  break;
                }
                uint64_t v45 = 10 * v20;
                if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
                  break;
                }
                uint64_t v20 = v45 - v44;
                if (__OFSUB__(v45, v44)) {
                  break;
                }
                char v22 = 0;
                ++v43;
                if (!--v42) {
                  goto LABEL_33;
                }
              }
LABEL_32:
              uint64_t v20 = 0;
              char v22 = 1;
              goto LABEL_33;
            }
          }
LABEL_31:
          uint64_t v18 = a3;
          goto LABEL_32;
        }
        __break(1u);
LABEL_65:
        __break(1u);
        return result;
      }
      if (!v15 || (result - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v20 = (result - 48);
      if (v15 == 1)
      {
LABEL_43:
        uint64_t v18 = a3;
        char v22 = 0;
        goto LABEL_33;
      }
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v18 = a3;
      uint64_t v20 = 10 * (result - 48) + (BYTE1(result) - 48);
      uint64_t v38 = v15 - 2;
      if (v38)
      {
        unint64_t v39 = (unsigned __int8 *)v49 + 2;
        while (1)
        {
          unsigned int v40 = *v39 - 48;
          if (v40 > 9) {
            goto LABEL_32;
          }
          uint64_t v41 = 10 * v20;
          if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
            goto LABEL_32;
          }
          uint64_t v20 = v41 + v40;
          if (__OFADD__(v41, v40)) {
            goto LABEL_32;
          }
          char v22 = 0;
          ++v39;
          if (!--v38) {
            goto LABEL_33;
          }
        }
      }
    }
LABEL_54:
    char v22 = 0;
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_36:
  swift_bridgeObjectRelease();
  if (qword_269327268 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_2487A5F68();
  __swift_project_value_buffer(v27, (uint64_t)qword_269329290);
  id v28 = a5;
  uint64_t v29 = sub_2487A5F48();
  os_log_type_t v30 = sub_2487A6598();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    v49[0] = v48;
    *(_DWORD *)uint64_t v31 = 136315394;
    uint64_t v50 = sub_2487A24A8(0xD000000000000025, 0x80000002487A8D90, v49);
    sub_2487A6698();
    *(_WORD *)(v31 + 12) = 2112;
    uint64_t v50 = (uint64_t)v28;
    id v33 = v28;
    sub_2487A6698();
    void *v32 = v28;

    _os_log_impl(&dword_24876F000, v29, v30, "%s Unable to derive STAskForTimeAnswer from AskTo answer choice: %@", (uint8_t *)v31, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v32, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v48, -1, -1);
    MEMORY[0x24C57FA90](v31, -1, -1);
  }
  else
  {
  }
  uint64_t v34 = sub_2487A6038();
  uint64_t v36 = v35;
  sub_2487832C4();
  swift_allocError();
  *(void *)uint64_t v37 = v34;
  *(void *)(v37 + 8) = v36;
  *(unsigned char *)(v37 + 16) = 0;
  return swift_willThrow();
}

id sub_248785354(id result, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      uint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 3:
    case 4:
    case 5:
      uint64_t result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for ScreenTimeAnswerHandler.Error(uint64_t a1)
{
}

void sub_2487853C0(void *a1, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      swift_bridgeObjectRelease();
      break;
    case 3:
    case 4:
    case 5:

      break;
    default:
      return;
  }
}

uint64_t _s11AskToDaemon23ScreenTimeAnswerHandlerV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_248785354(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ScreenTimeAnswerHandler.Error(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_248785354(*(id *)a2, v4, v5);
  os_log_type_t v6 = *(void **)a1;
  os_log_type_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2487853C0(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ScreenTimeAnswerHandler.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2487853C0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeAnswerHandler.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 7) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeAnswerHandler.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 249;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_248785594(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 6u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_2487855AC(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(void *)uint64_t result = a2 - 7;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 7;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeAnswerHandler.Error()
{
  return &type metadata for ScreenTimeAnswerHandler.Error;
}

void sub_2487855D8()
{
  qword_2693276B0 = 0x6C7070612E6D6F63;
  *(void *)algn_2693276B8 = 0xEF6F546B73412E65;
}

uint64_t sub_248785608(uint64_t a1)
{
  return sub_248785884(a1, qword_2693291D0);
}

uint64_t sub_248785624(uint64_t a1)
{
  return sub_2487857A4(a1, qword_2693291E8);
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

uint64_t sub_2487856AC(uint64_t a1)
{
  return sub_2487857A4(a1, qword_269329200);
}

uint64_t sub_2487856D0(uint64_t a1)
{
  return sub_2487857A4(a1, qword_269329218);
}

uint64_t sub_2487856FC(uint64_t a1)
{
  return sub_2487857A4(a1, qword_269329230);
}

uint64_t sub_248785720(uint64_t a1)
{
  return sub_2487857A4(a1, qword_269329248);
}

uint64_t sub_248785744(uint64_t a1)
{
  return sub_248785884(a1, qword_269329260);
}

uint64_t sub_248785764(uint64_t a1)
{
  return sub_248785884(a1, qword_269329278);
}

uint64_t sub_248785780(uint64_t a1)
{
  return sub_2487857A4(a1, qword_269329290);
}

uint64_t sub_2487857A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2487A5F68();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269327220 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_2487A5F58();
}

uint64_t sub_24878585C(uint64_t a1)
{
  return sub_248785884(a1, qword_2693292A8);
}

uint64_t sub_248785884(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2487A5F68();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269327220 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_2487A5F58();
}

uint64_t sub_24878593C(id a1, uint64_t a2, char a3)
{
  if (a3)
  {
    id v5 = a1;
    sub_2487A6758();
    sub_2487A6408();
    swift_getErrorValue();
    sub_2487A68B8();
    sub_2487A6408();
    swift_bridgeObjectRelease();
    sub_24878CB64(a1, a2, 1);
  }
  else
  {
    sub_2487A6758();
    sub_2487A6408();
    sub_2487A6408();
    sub_2487A6408();
  }
  return 0;
}

uint64_t sub_248785A68()
{
  return sub_24878593C(*(id *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void *sub_248785A74()
{
  qword_2693292C0 = (uint64_t)&unk_26FC821F8;
  return &unk_26FC821F8;
}

uint64_t sub_248785A88(uint64_t a1, uint64_t a2)
{
  v3[31] = a2;
  v3[32] = v2;
  v3[30] = a1;
  return MEMORY[0x270FA2498](sub_248785AAC, 0, 0);
}

uint64_t sub_248785AAC()
{
  uint64_t v23 = v0;
  uint64_t v1 = (void *)(v0 + 136);
  uint64_t v2 = (void *)(v0 + 176);
  Strong = (void *)swift_weakLoadStrong();
  if (Strong && (uint64_t v4 = Strong[6], v5 = Strong[8], sub_24878C78C(v4, Strong[7], v5), swift_release(), v5))
  {
    int v6 = v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v2 = 0;
    if (v4 != 4)
    {
      uint64_t v7 = type metadata accessor for AppExtensionProxy();
      uint64_t v8 = swift_allocObject();
      unint64_t v9 = sub_24878DFF4(MEMORY[0x263F8EE78]);
      char v10 = 0;
      *(void *)(v8 + 24) = v9;
      *(unsigned char *)(v8 + 16) = v6 != 3;
      goto LABEL_7;
    }
  }
  else
  {
    *uint64_t v2 = 0;
  }
  uint64_t v7 = type metadata accessor for AppExtensionProxy();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 24) = sub_24878DFF4(MEMORY[0x263F8EE78]);
  char v10 = 1;
  *(unsigned char *)(v8 + 16) = 1;
  LOBYTE(v6) = 4;
LABEL_7:
  *(unsigned char *)(v0 + 321) = v10;
  *(unsigned char *)(v0 + 320) = v6;
  *(unsigned char *)(v8 + 17) = v6;
  *(void *)(v0 + 160) = v7;
  *(void *)(v0 + 168) = sub_24878CA84();
  *(void *)(v0 + 136) = v8;
  if (qword_269327228 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2487A5F68();
  *(void *)(v0 + 264) = __swift_project_value_buffer(v11, (uint64_t)qword_2693291D0);
  sub_24878CADC(v0 + 136, v0 + 96);
  uint64_t v12 = sub_2487A5F48();
  os_log_type_t v13 = sub_2487A65B8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v15 = v22;
    *(_DWORD *)uint64_t v14 = 136315138;
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
    uint64_t v16 = sub_2487A6848();
    *(void *)(v0 + 232) = sub_2487A24A8(v16, v17, &v22);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 96);
    _os_log_impl(&dword_24876F000, v12, v13, "Calling into app extension to get Messages data payload. messagesPayloadProvider: %s", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v15;
    uint64_t v1 = (void *)(v0 + 136);
    MEMORY[0x24C57FA90](v18, -1, -1);
    MEMORY[0x24C57FA90](v14, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  }

  __swift_project_boxed_opaque_existential_1(v1, *(void *)(v0 + 160));
  os_log_type_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v19;
  *os_log_type_t v19 = v0;
  v19[1] = sub_248785DFC;
  uint64_t v20 = *(void *)(v0 + 240);
  return sub_24879CF0C(v0 + 16, v20);
}

uint64_t sub_248785DFC()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_2487862A4;
  }
  else
  {
    uint64_t v2 = sub_248785F18;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248785F18()
{
  uint64_t v23 = v0;
  Strong = (uint64_t *)swift_weakLoadStrong();
  if (Strong
    && (v2 = Strong[8], uint64_t v4 = Strong[9], v3 = Strong[10], sub_24878C78C(Strong[6], Strong[7], v2), swift_release(), v2))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  uint64_t v5 = (void *)sub_2487A62F8();
  int v6 = (void *)sub_2487A6008();

  MEMORY[0x24C57EC90](v4, v3, v6, 1500);
  swift_bridgeObjectRelease();
  swift_retain_n();
  sub_2487768CC((uint64_t *)(v0 + 16));
  uint64_t v7 = sub_2487A5F48();
  os_log_type_t v8 = sub_2487A65B8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = *(void *)(v0 + 32);
    unint64_t v11 = *(void *)(v0 + 40);
    swift_bridgeObjectRetain();
    *(void *)(v0 + 216) = sub_2487A24A8(v10, v11, &v22);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    sub_2487769A8((uint64_t *)(v0 + 16));
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v12 = sub_2487A6068();
    *(void *)(v0 + 224) = sub_2487A24A8(v12, v13, &v22);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24876F000, v7, v8, "Sending message with Messages extension bundle identifier \"%s\" to %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v21, -1, -1);
    MEMORY[0x24C57FA90](v9, -1, -1);
  }
  else
  {
    sub_2487769A8((uint64_t *)(v0 + 16));
    swift_release_n();
  }

  if ((*(unsigned char *)(v0 + 321) & 1) != 0
    || !sub_248786E4C(*(unsigned char *)(v0 + 320), *(void *)(*(void *)(v0 + 256) + 16)))
  {
    __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 256) + 32), *(void *)(*(void *)(v0 + 256) + 56));
    *(void *)(v0 + 208) = 0;
    os_log_type_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 304) = v19;
    *os_log_type_t v19 = v0;
    v19[1] = sub_248786A10;
    uint64_t v15 = *(void *)(v0 + 248);
    uint64_t v16 = v0 + 16;
    char v17 = 0;
    uint64_t v18 = v0 + 208;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 256) + 32), *(void *)(*(void *)(v0 + 256) + 56));
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_248786588;
    uint64_t v15 = *(void *)(v0 + 248);
    uint64_t v16 = v0 + 16;
    char v17 = 1;
    uint64_t v18 = v0 + 176;
  }
  return sub_248774C48(v16, v15, v17, v18);
}

uint64_t sub_2487862A4()
{
  unsigned int v25 = v0;
  uint64_t v1 = (void *)v0[35];
  uint64_t v2 = (void *)v0[30];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  swift_retain();
  id v3 = v2;
  id v4 = v1;
  swift_retain();
  id v5 = v3;
  id v6 = v1;
  uint64_t v7 = sub_2487A5F48();
  os_log_type_t v8 = sub_2487A6598();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (void *)v0[30];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v24[0] = v23;
    *(_DWORD *)uint64_t v10 = 136315650;
    unint64_t v11 = (void *)sub_2487A62F8();
    uint64_t v12 = sub_2487A5F78();
    unint64_t v14 = v13;

    v0[23] = sub_2487A24A8(v12, v14, v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v15 = sub_2487A6068();
    v0[24] = sub_2487A24A8(v15, v16, v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v10 + 22) = 2112;
    id v17 = v1;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[25] = v18;
    sub_2487A6698();
    *uint64_t v22 = v18;

    _os_log_impl(&dword_24876F000, v7, v8, "Failed to send payload over Messages. question: %s recipientGroup: \"%s\" error: %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v22, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v23, -1, -1);
    MEMORY[0x24C57FA90](v10, -1, -1);
  }
  else
  {
    os_log_type_t v19 = (void *)v0[30];

    swift_release_n();
  }

  swift_willThrow();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_248786588()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_248786710;
  }
  else {
    uint64_t v2 = sub_24878669C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24878669C()
{
  sub_2487769A8(v0 + 2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  uint64_t v1 = v0[22];
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_248786710()
{
  unsigned int v25 = v0;
  swift_bridgeObjectRelease();
  sub_2487769A8(v0 + 2);
  uint64_t v1 = (void *)v0[37];
  uint64_t v2 = (void *)v0[30];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  swift_retain();
  id v3 = v2;
  id v4 = v1;
  swift_retain();
  id v5 = v3;
  id v6 = v1;
  uint64_t v7 = sub_2487A5F48();
  os_log_type_t v8 = sub_2487A6598();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (void *)v0[30];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v24[0] = v23;
    *(_DWORD *)uint64_t v10 = 136315650;
    unint64_t v11 = (void *)sub_2487A62F8();
    uint64_t v12 = sub_2487A5F78();
    unint64_t v14 = v13;

    v0[23] = sub_2487A24A8(v12, v14, v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v15 = sub_2487A6068();
    v0[24] = sub_2487A24A8(v15, v16, v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v10 + 22) = 2112;
    id v17 = v1;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[25] = v18;
    sub_2487A6698();
    *uint64_t v22 = v18;

    _os_log_impl(&dword_24876F000, v7, v8, "Failed to send payload over Messages. question: %s recipientGroup: \"%s\" error: %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v22, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v23, -1, -1);
    MEMORY[0x24C57FA90](v10, -1, -1);
  }
  else
  {
    os_log_type_t v19 = (void *)v0[30];

    swift_release_n();
  }

  swift_willThrow();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_248786A10()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_248786B44;
  }
  else {
    uint64_t v2 = sub_24878669C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248786B44()
{
  unsigned int v25 = v0;
  swift_bridgeObjectRelease();
  sub_2487769A8(v0 + 2);
  uint64_t v1 = (void *)v0[39];
  uint64_t v2 = (void *)v0[30];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  swift_retain();
  id v3 = v2;
  id v4 = v1;
  swift_retain();
  id v5 = v3;
  id v6 = v1;
  uint64_t v7 = sub_2487A5F48();
  os_log_type_t v8 = sub_2487A6598();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (void *)v0[30];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v24[0] = v23;
    *(_DWORD *)uint64_t v10 = 136315650;
    unint64_t v11 = (void *)sub_2487A62F8();
    uint64_t v12 = sub_2487A5F78();
    unint64_t v14 = v13;

    v0[23] = sub_2487A24A8(v12, v14, v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v15 = sub_2487A6068();
    v0[24] = sub_2487A24A8(v15, v16, v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v10 + 22) = 2112;
    id v17 = v1;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[25] = v18;
    sub_2487A6698();
    *uint64_t v22 = v18;

    _os_log_impl(&dword_24876F000, v7, v8, "Failed to send payload over Messages. question: %s recipientGroup: \"%s\" error: %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v22, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v23, -1, -1);
    MEMORY[0x24C57FA90](v10, -1, -1);
  }
  else
  {
    os_log_type_t v19 = (void *)v0[30];

    swift_release_n();
  }

  swift_willThrow();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

BOOL sub_248786E4C(unsigned __int8 a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  int v3 = a1;
  sub_2487A6908();
  sub_2487A6918();
  uint64_t v4 = sub_2487A6928();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(unsigned __int8 *)(v8 + v6) == v3) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(unsigned __int8 *)(v8 + v11);
    BOOL result = v12 == v3;
    if (v12 == v3) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_248786F3C(uint64_t a1, __int16 a2)
{
  *(_WORD *)(v3 + 220) = a2;
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = v2;
  uint64_t v4 = sub_2487A5F68();
  *(void *)(v3 + 88) = v4;
  *(void *)(v3 + 96) = *(void *)(v4 - 8);
  *(void *)(v3 + 104) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_248787000, 0, 0);
}

uint64_t sub_248787000()
{
  uint64_t v40 = v0;
  Strong = (uint64_t *)swift_weakLoadStrong();
  if (Strong
    && (v2 = Strong[8], v3 = Strong[9], uint64_t v4 = Strong[10], sub_24878C78C(Strong[6], Strong[7], v2), swift_release(), v2))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  uint64_t v5 = (void *)sub_2487A6008();
  MEMORY[0x24C57EC90](v3, v4, v5, 200);

  swift_bridgeObjectRelease();
  if (qword_269327228 != -1) {
    swift_once();
  }
  uint64_t v7 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 104);
  *(void *)(v0 + 112) = __swift_project_value_buffer(*(void *)(v0 + 88), (uint64_t)qword_2693291D0);
  (*(void (**)(uint64_t))(v7 + 16))(v6);
  swift_retain_n();
  uint64_t v8 = sub_2487A5F48();
  os_log_type_t v9 = sub_2487A65B8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v39 = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v0 + 56) = sub_2487A24A8(0xD000000000000012, 0x80000002487A93D0, &v39);
    sub_2487A6698();
    *(_WORD *)(v10 + 12) = 2080;
    int v12 = (uint64_t *)swift_weakLoadStrong();
    if (!v12
      || (v13 = v12[8], uint64_t v14 = v12[9], v15 = v12[10], sub_24878C78C(v12[6], v12[7], v13), swift_release(), !v13)
      || (swift_bridgeObjectRelease(), !v15))
    {
      swift_bridgeObjectRelease();
      unint64_t v15 = 0xE300000000000000;
      uint64_t v14 = 7104878;
    }
    uint64_t v16 = *(void *)(v0 + 96);
    uint64_t v36 = *(void *)(v0 + 88);
    uint64_t v37 = *(void *)(v0 + 104);
    *(void *)(v0 + 40) = sub_2487A24A8(v14, v15, &v39);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24876F000, v8, v9, "%s called by client with bundle ID %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v11, -1, -1);
    MEMORY[0x24C57FA90](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v37, v36);
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 96);
    uint64_t v17 = *(void *)(v0 + 104);
    uint64_t v19 = *(void *)(v0 + 88);
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  uint64_t v20 = (uint64_t *)swift_weakLoadStrong();
  if (v20)
  {
    uint64_t v21 = v20[8];
    sub_24878C78C(v20[6], v20[7], v21);
    swift_release();
    if (v21) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v22 = (uint64_t *)swift_weakLoadStrong();
  if (v22)
  {
    uint64_t v23 = v22[8];
    sub_24878C78C(v22[6], v22[7], v23);
    swift_release();
    if (v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v24 = *(void **)(v0 + 72);
  sub_2487A6318();
  sub_2487A6088();
  sub_2487A6078();
  id v25 = v24;
  *(void *)(v0 + 120) = sub_2487A62C8();
  uint64_t v26 = sub_2487A5F48();
  os_log_type_t v27 = sub_2487A65B8();
  if (os_log_type_enabled(v26, v27))
  {
    id v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v39 = v29;
    *(_DWORD *)id v28 = 136315138;
    uint64_t v30 = sub_2487A6068();
    *(void *)(v0 + 64) = sub_2487A24A8(v30, v31, &v39);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v26, v27, "Attempting to inflate recipient group \"%s\"", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v29, -1, -1);
    MEMORY[0x24C57FA90](v28, -1, -1);
  }

  uint64_t v32 = swift_weakLoadStrong();
  *(void *)(v0 + 128) = v32;
  uint64_t v38 = (uint64_t (*)(uint64_t, __int16, __int16))((char *)&dword_269327C98 + dword_269327C98);
  swift_retain();
  id v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v33;
  *id v33 = v0;
  v33[1] = sub_2487875F4;
  __int16 v34 = *(_WORD *)(v0 + 220);
  return v38(v32, 0, v34);
}

uint64_t sub_2487875F4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 144) = a1;
  *(void *)(v3 + 152) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1) {
    uint64_t v4 = sub_248787974;
  }
  else {
    uint64_t v4 = sub_248787730;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_248787730()
{
  Strong = (uint64_t *)swift_weakLoadStrong();
  if (Strong
    && (v2 = Strong[8], uint64_t v4 = Strong[9], v3 = Strong[10], sub_24878C78C(Strong[6], Strong[7], v2), swift_release(), v2))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  uint64_t v5 = (void *)sub_2487A6008();
  MEMORY[0x24C57EC90](v4, v3, v5, 300);

  swift_bridgeObjectRelease();
  uint64_t v6 = sub_2487A5F48();
  os_log_type_t v7 = sub_2487A65B8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_24876F000, v6, v7, "Checking if send destinations are valid for sending", v8, 2u);
    MEMORY[0x24C57FA90](v8, -1, -1);
  }
  uint64_t v9 = *(void *)(v0 + 128);

  if (v9 && (uint64_t v10 = *(void *)(v0 + 128), *(void *)(v10 + 64)) && *(unsigned char *)(v10 + 48) == 3)
  {
    uint64_t v11 = (void *)sub_2487A6008();
    uint64_t v12 = sub_2487A5FE8();
    uint64_t v14 = v13;

    if (v12 == 0xD00000000000001DLL && v14 == 0x80000002487A8C60)
    {
      swift_bridgeObjectRelease();
      char v15 = 0;
    }
    else
    {
      char v18 = sub_2487A6868();
      swift_bridgeObjectRelease();
      char v15 = v18 ^ 1;
    }
  }
  else
  {
    char v15 = 1;
  }
  *(unsigned char *)(v0 + 223) = v15 & 1;
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v16;
  void *v16 = v0;
  v16[1] = sub_2487879E4;
  return sub_2487A35A8();
}

uint64_t sub_248787974()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2487879E4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 224) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248787AE4, 0, 0);
}

uint64_t sub_248787AE4()
{
  int v1 = *(unsigned __int8 *)(v0 + 224);
  *(unsigned char *)(v0 + 222) = v1;
  if (v1 != 1 || (*(unsigned char *)(v0 + 223) & 1) != 0)
  {
    swift_beginAccess();
    if (*(unsigned char *)(v0 + 222) == 1)
    {
      Strong = (uint64_t *)swift_weakLoadStrong();
      if (Strong
        && (uint64_t v4 = Strong[8], v6 = Strong[9],
                            uint64_t v5 = Strong[10],
                            sub_24878C78C(Strong[6], Strong[7], v4),
                            swift_release(),
                            v4))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v5 = 0;
      }
      uint64_t v10 = (void *)sub_2487A6008();
      MEMORY[0x24C57EC90](v6, v5, v10, 1400);

      swift_bridgeObjectRelease();
      uint64_t v11 = sub_2487A5F48();
      os_log_type_t v12 = sub_2487A65B8();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_24876F000, v11, v12, "Send destinations are valid", v13, 2u);
        MEMORY[0x24C57FA90](v13, -1, -1);
      }

      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 192) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_2487882F0;
      uint64_t v15 = *(void *)(v0 + 120);
      uint64_t v16 = *(void *)(v0 + 80);
      v14[31] = *(void *)(v0 + 144);
      v14[32] = v16;
      v14[30] = v15;
      return MEMORY[0x270FA2498](sub_248785AAC, 0, 0);
    }
    else
    {
      os_log_type_t v7 = *(void **)(v0 + 120);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
      sub_24878C9E0();
      swift_allocError();
      *uint64_t v8 = 4;
      swift_willThrow();
      swift_release();
      swift_release();

      swift_task_dealloc();
      uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
      return v9();
    }
  }
  else
  {
    *(void *)(v0 + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5D360]), sel_init);
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_248787E08;
    return MEMORY[0x270F53570]();
  }
}

uint64_t sub_248787E08(char a1)
{
  uint64_t v3 = *v2;
  *(unsigned char *)(v3 + 225) = a1;
  *(void *)(v3 + 184) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_2487884A4;
  }
  else {
    uint64_t v4 = sub_248787F20;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_248787F20()
{
  *(unsigned char *)(v0 + 222) = *(unsigned char *)(v0 + 225);
  uint64_t v1 = sub_2487A5F48();
  os_log_type_t v2 = sub_2487A65B8();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = *(unsigned __int8 *)(v0 + 225);
    uint64_t v4 = *(void **)(v0 + 168);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    *(_DWORD *)(v0 + 216) = v3;
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v1, v2, "People returned %{BOOL}d for PeopleClient.canSendFamilyScreenTimeRequestIMessage()", v5, 8u);
    MEMORY[0x24C57FA90](v5, -1, -1);
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 168);
  }

  Strong = (uint64_t *)swift_weakLoadStrong();
  if (Strong
    && (uint64_t v7 = Strong[8], v9 = Strong[9], v8 = Strong[10], sub_24878C78C(Strong[6], Strong[7], v7), swift_release(), v7))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v10 = (void *)sub_2487A6008();
  MEMORY[0x24C57EC90](v9, v8, v10, 1300);

  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(unsigned char *)(v0 + 222) == 1)
  {
    uint64_t v11 = (uint64_t *)swift_weakLoadStrong();
    if (v11 && (uint64_t v12 = v11[8], v14 = v11[9], v13 = v11[10], sub_24878C78C(v11[6], v11[7], v12), swift_release(), v12))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v13 = 0;
    }
    uint64_t v19 = (void *)sub_2487A6008();
    MEMORY[0x24C57EC90](v14, v13, v19, 1400);

    swift_bridgeObjectRelease();
    uint64_t v20 = sub_2487A5F48();
    os_log_type_t v21 = sub_2487A65B8();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_24876F000, v20, v21, "Send destinations are valid", v22, 2u);
      MEMORY[0x24C57FA90](v22, -1, -1);
    }

    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_2487882F0;
    uint64_t v24 = *(void *)(v0 + 120);
    uint64_t v25 = *(void *)(v0 + 80);
    v23[31] = *(void *)(v0 + 144);
    v23[32] = v25;
    v23[30] = v24;
    return MEMORY[0x270FA2498](sub_248785AAC, 0, 0);
  }
  else
  {
    uint64_t v15 = *(void **)(v0 + 120);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
    sub_24878C9E0();
    swift_allocError();
    void *v16 = 4;
    swift_willThrow();
    swift_release();
    swift_release();

    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
}

uint64_t sub_2487882F0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_248788924;
  }
  else
  {
    *(void *)(v4 + 208) = a1;
    uint64_t v5 = sub_248788418;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_248788418()
{
  uint64_t v1 = (void *)v0[15];
  swift_release();
  swift_release();

  swift_task_dealloc();
  os_log_type_t v2 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v3 = v0[26];
  return v2(v3);
}

uint64_t sub_2487884A4()
{
  uint64_t v1 = *(void **)(v0 + 184);

  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_2487A5F48();
  os_log_type_t v5 = sub_2487A6598();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 184);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v10;
    sub_2487A6698();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_24876F000, v4, v5, "People threw error for PeopleClient.canSendFamilyScreenTimeRequestIMessage(): %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v8, -1, -1);
    MEMORY[0x24C57FA90](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 184);
  }
  *(unsigned char *)(v0 + 222) = 0;
  Strong = (uint64_t *)swift_weakLoadStrong();
  if (Strong
    && (uint64_t v13 = Strong[8],
        uint64_t v15 = Strong[9],
        uint64_t v14 = Strong[10],
        sub_24878C78C(Strong[6], Strong[7], v13),
        swift_release(),
        v13))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v16 = (void *)sub_2487A6008();
  MEMORY[0x24C57EC90](v15, v14, v16, 1300);

  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (*(unsigned char *)(v0 + 222) == 1)
  {
    uint64_t v17 = (uint64_t *)swift_weakLoadStrong();
    if (v17 && (uint64_t v18 = v17[8], v20 = v17[9], v19 = v17[10], sub_24878C78C(v17[6], v17[7], v18), swift_release(), v18))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v19 = 0;
    }
    uint64_t v25 = (void *)sub_2487A6008();
    MEMORY[0x24C57EC90](v20, v19, v25, 1400);

    swift_bridgeObjectRelease();
    uint64_t v26 = sub_2487A5F48();
    os_log_type_t v27 = sub_2487A65B8();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v28 = 0;
      _os_log_impl(&dword_24876F000, v26, v27, "Send destinations are valid", v28, 2u);
      MEMORY[0x24C57FA90](v28, -1, -1);
    }

    uint64_t v29 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v29;
    *uint64_t v29 = v0;
    v29[1] = sub_2487882F0;
    uint64_t v30 = *(void *)(v0 + 120);
    uint64_t v31 = *(void *)(v0 + 80);
    v29[31] = *(void *)(v0 + 144);
    v29[32] = v31;
    v29[30] = v30;
    return MEMORY[0x270FA2498](sub_248785AAC, 0, 0);
  }
  else
  {
    os_log_type_t v21 = *(void **)(v0 + 120);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
    sub_24878C9E0();
    swift_allocError();
    *uint64_t v22 = 4;
    swift_willThrow();

    swift_release();
    swift_release();
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
}

uint64_t sub_248788924()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_release();
  swift_release();

  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_248788B28(void *a1, __int16 a2, void *aBlock, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v7 = a1;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v4[5] = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_248788BF4;
  return sub_248786F3C((uint64_t)v7, a2);
}

uint64_t sub_248788BF4(uint64_t a1)
{
  id v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  swift_release();
  if (v3)
  {
    a1 = sub_2487A5DE8();

    uint64_t v8 = 0;
    id v9 = (void *)a1;
  }
  else if (a1)
  {
    uint64_t v8 = sub_2487A64A8();
    swift_bridgeObjectRelease();
    a1 = 0;
    id v9 = (void *)v8;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = 0;
  }
  uint64_t v10 = *(void (***)(void, void, void))(v5 + 32);
  v10[2](v10, v8, a1);

  _Block_release(v10);
  uint64_t v11 = *(uint64_t (**)(void))(v7 + 8);
  return v11();
}

uint64_t sub_248788F3C(void *a1, int a2, void *aBlock, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  id v9 = (uint64_t (*)(uint64_t))((char *)&dword_269327738 + dword_269327738);
  id v6 = a1;
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v4[5] = v7;
  *uint64_t v7 = v4;
  v7[1] = sub_248789014;
  return v9((uint64_t)v6);
}

uint64_t sub_248789014()
{
  id v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_release();
  uint64_t v7 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v8 = (void *)sub_2487A5DE8();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  id v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_248789350(void *a1, int a2, int a3, void *aBlock, uint64_t a5)
{
  v5[2] = a1;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  uint64_t v7 = sub_2487A63B8();
  uint64_t v9 = v8;
  v5[5] = v8;
  uint64_t v10 = sub_2487A63B8();
  uint64_t v12 = v11;
  v5[6] = v11;
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269327710 + dword_269327710);
  id v13 = a1;
  swift_retain();
  uint64_t v14 = (void *)swift_task_alloc();
  v5[7] = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_248789478;
  return v16((uint64_t)v13, v7, v9, v10, v12);
}

uint64_t sub_248789478()
{
  id v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v8 = (void *)sub_2487A5DE8();

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(void, void))(v7 + 16))(*(void *)(v3 + 32), 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_248789658()
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);

  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t type metadata accessor for Server()
{
  return self;
}

id sub_2487896CC()
{
  if (qword_269327278 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2693292C0;

  return v0;
}

void *sub_248789728(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_retain();
  sub_24877499C((uint64_t)&off_26FC7E7A8, (uint64_t)v5);
  sub_248789798((uint64_t)v5, (uint64_t)v4);
  id v2 = sub_248789E48(v1, (uint64_t)v4);
  swift_release();
  sub_24878A074((uint64_t)v5);
  return v2;
}

uint64_t sub_248789798(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2487897F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24878CD14;
  return v6();
}

uint64_t sub_2487898C0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24878CD14;
  return v7();
}

uint64_t sub_24878998C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487A6548();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2487A6538();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24878C4F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2487A6508();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_248789B30(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248789C0C;
  return v6(a1);
}

uint64_t sub_248789C0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248789D04(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693276C0);
    uint64_t v3 = sub_2487A6748();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      int v7 = *(unsigned __int8 *)(v6 + v4);
      sub_2487A6908();
      sub_2487A6918();
      uint64_t result = sub_2487A6928();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(unsigned __int8 *)(v14 + v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(unsigned __int8 *)(v14 + v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(unsigned char *)(v14 + v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void *sub_248789E48(uint64_t a1, uint64_t a2)
{
  v15[3] = &type metadata for iMessageSender;
  v15[4] = &off_26FC7DF80;
  v15[0] = swift_allocObject();
  sub_248774B88(a2, v15[0] + 16);
  uint64_t v13 = &type metadata for ClientResponseTaskMapper;
  uint64_t v14 = &off_26FC7F168;
  type metadata accessor for Server();
  uint64_t v3 = (void *)swift_allocObject();
  uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, (uint64_t)&type metadata for iMessageSender);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *))(v7 + 16))(v6);
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, (uint64_t)&type metadata for ClientResponseTaskMapper);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(void))(v9 + 16))();
  v3[7] = &type metadata for iMessageSender;
  v3[8] = &off_26FC7DF80;
  uint64_t v10 = swift_allocObject();
  v3[4] = v10;
  sub_248774B88((uint64_t)v6, v10 + 16);
  v3[12] = &type metadata for ClientResponseTaskMapper;
  v3[13] = &off_26FC7F168;
  v3[2] = sub_248789D04((uint64_t)&unk_26FC7DB60);
  swift_weakInit();
  swift_weakAssign();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v3;
}

uint64_t sub_24878A074(uint64_t a1)
{
  return a1;
}

uint64_t sub_24878A0C8()
{
  swift_unknownObjectWeakDestroy();
  if (*(void *)(v0 + 56)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);

  return MEMORY[0x270FA0238](v0, 112, 7);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_24878A168(uint64_t a1)
{
  v2[38] = a1;
  v2[39] = v1;
  uint64_t v3 = sub_2487A5F68();
  v2[40] = v3;
  v2[41] = *(void *)(v3 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24878A238, 0, 0);
}

uint64_t sub_24878A238()
{
  uint64_t v107 = v0;
  Strong = (void *)swift_weakLoadStrong();
  if (!Strong || (uint64_t v2 = Strong[6], v3 = Strong[8], sub_24878C78C(v2, Strong[7], v3), swift_release(), !v3))
  {
    LOBYTE(v2) = 4;
LABEL_7:
    unsigned __int8 v102 = v2;
    __int16 v4 = 0;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2 != 1)
  {
    if (v2 == 2)
    {
      __int16 v4 = 2;
      unsigned __int8 v102 = 2;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  unsigned __int8 v102 = v2;
  __int16 v4 = 1;
LABEL_8:
  *(_WORD *)(v0 + 400) = v4;
  sub_2487A62D8();
  uint64_t v5 = (void *)sub_2487A62F8();
  uint64_t v6 = (void *)sub_2487A6008();

  sub_2487A6288();
  swift_bridgeObjectRelease();
  if (qword_269327228 != -1) {
    swift_once();
  }
  uint64_t v7 = *(void *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 320);
  uint64_t v9 = *(void *)(v0 + 328);
  uint64_t v10 = __swift_project_value_buffer(v8, (uint64_t)qword_2693291D0);
  *(void *)(v0 + 352) = v10;
  uint64_t v99 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v99(v7, v10, v8);
  swift_retain_n();
  unint64_t v11 = sub_2487A5F48();
  os_log_type_t v12 = sub_2487A65B8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v95 = v10;
    __int16 v97 = v4;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v106[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v0 + 288) = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, v106);
    sub_2487A6698();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v15 = (uint64_t *)swift_weakLoadStrong();
    if (!v15
      || (v16 = v15[8], v18 = v15[9], unint64_t v17 = v15[10], sub_24878C78C(v15[6], v15[7], v16), swift_release(), !v16)
      || (swift_bridgeObjectRelease(), !v17))
    {
      swift_bridgeObjectRelease();
      unint64_t v17 = 0xE300000000000000;
      uint64_t v18 = 7104878;
    }
    uint64_t v19 = *(void *)(v0 + 328);
    uint64_t v91 = *(void *)(v0 + 320);
    uint64_t v93 = *(void *)(v0 + 344);
    *(void *)(v0 + 296) = sub_2487A24A8(v18, v17, v106);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24876F000, v11, v12, "%s called by client with bundle ID %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v14, -1, -1);
    MEMORY[0x24C57FA90](v13, -1, -1);

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v20(v93, v91);
    __int16 v4 = v97;
    uint64_t v10 = v95;
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 344);
    uint64_t v22 = *(void *)(v0 + 320);
    uint64_t v23 = *(void *)(v0 + 328);
    swift_release_n();

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v20(v21, v22);
  }
  uint64_t v24 = sub_248789D04((uint64_t)&unk_26FC7DBD8);
  if (v102 == 4)
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  BOOL v25 = sub_248786E4C(v102, v24);
  swift_bridgeObjectRelease();
  if (!v25)
  {
LABEL_26:
    uint64_t v36 = (uint64_t *)swift_weakLoadStrong();
    if (!v36
      || (uint64_t v37 = v36[8], v39 = v36[9], v38 = v36[10], sub_24878C78C(v36[6], v36[7], v37), swift_release(), !v37)
      || (swift_bridgeObjectRelease(), !v38))
    {
      swift_bridgeObjectRelease();
      unint64_t v38 = 0xE300000000000000;
      uint64_t v39 = 7104878;
    }
    swift_bridgeObjectRetain_n();
    uint64_t v40 = sub_2487A5F48();
    os_log_type_t v41 = sub_2487A6598();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v106[0] = v43;
      *(_DWORD *)uint64_t v42 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 232) = sub_2487A24A8(v39, v38, v106);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v42 + 12) = 2080;
      *(void *)(v0 + 200) = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, v106);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v40, v41, "Client with bundle ID %s was not in the allowlist for %s. Bailing.", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v43, -1, -1);
      MEMORY[0x24C57FA90](v42, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_24878C7D0();
    swift_allocError();
    *(void *)uint64_t v44 = v39;
    *(void *)(v44 + 8) = v38;
    *(unsigned char *)(v44 + 16) = 0;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_34;
  }
  unint64_t v103 = v20;
  sub_2487A62D8();
  uint64_t v26 = (void *)sub_2487A62F8();
  os_log_type_t v27 = (void *)sub_2487A6008();

  sub_2487A6288();
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_2487A62D8();
  if (v29)
  {
    uint64_t v30 = v28;
    uint64_t v31 = v29;
    if (qword_269327288 != -1) {
      swift_once();
    }
    uint64_t v32 = off_269327798;
    if (*((void *)off_269327798 + 2) && (unint64_t v33 = sub_24878E5F4(v30, v31), (v34 & 1) != 0)) {
      int v35 = *(unsigned __int8 *)(v32[7] + v33);
    }
    else {
      int v35 = 4;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    int v35 = 4;
  }
  *(unsigned char *)(v0 + 402) = v35;
  uint64_t v47 = *(void **)(v0 + 304);
  v99(*(void *)(v0 + 336), v10, *(void *)(v0 + 320));
  id v48 = v47;
  uint64_t v49 = sub_2487A5F48();
  os_log_type_t v50 = sub_2487A65B8();
  BOOL v51 = os_log_type_enabled(v49, v50);
  uint64_t v100 = *(void *)(v0 + 320);
  uint64_t v101 = *(void *)(v0 + 336);
  id v52 = *(void **)(v0 + 304);
  uint64_t v94 = (uint64_t *)(v0 + 240);
  if (v51)
  {
    __int16 v98 = v4;
    uint64_t v53 = swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    v106[0] = v92;
    *(_DWORD *)uint64_t v53 = 136315394;
    *(void *)(v0 + 272) = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, v106);
    sub_2487A6698();
    *(_WORD *)(v53 + 12) = 2080;
    uint64_t v54 = sub_2487A62D8();
    if (v55)
    {
      unint64_t v56 = v55;
    }
    else
    {
      uint64_t v54 = 7104878;
      unint64_t v56 = 0xE300000000000000;
    }
    *(void *)(v0 + 280) = sub_2487A24A8(v54, v56, v106);
    sub_2487A6698();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24876F000, v49, v50, "%s Client that originated the request has bundle ID %s", (uint8_t *)v53, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v92, -1, -1);
    uint64_t v57 = v53;
    __int16 v4 = v98;
    MEMORY[0x24C57FA90](v57, -1, -1);
  }
  else
  {
  }
  v103(v101, v100);
  if (v35 == 4)
  {
LABEL_65:
    sub_2487A62D8();
    uint64_t v89 = (void *)sub_2487A62F8();
    uint64_t v90 = (void *)sub_2487A6008();

    sub_2487A6288();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
LABEL_34:
    return v45();
  }
  uint64_t v58 = sub_2487A5B14(v35, v4);
  *(void *)(v0 + 360) = v58;
  uint64_t v59 = sub_2487A5F48();
  os_log_type_t v60 = sub_2487A65B8();
  if (os_log_type_enabled(v59, v60))
  {
    char v96 = v35;
    uint64_t v61 = swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    v106[0] = v62;
    *(_DWORD *)uint64_t v61 = 136315650;
    *(void *)(v0 + 248) = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, v106);
    sub_2487A6698();
    *(_WORD *)(v61 + 12) = 2048;
    *(void *)(v0 + 256) = *(void *)(v58 + 16);
    sub_2487A6698();
    *(_WORD *)(v61 + 22) = 2080;
    unint64_t v63 = sub_24878DB64(v96);
    *(void *)(v0 + 264) = sub_2487A24A8(v63, v64, v106);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v59, v60, "%s Performing %ld response tasks for known client %s", (uint8_t *)v61, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v62, -1, -1);
    MEMORY[0x24C57FA90](v61, -1, -1);
  }

  uint64_t v65 = *(void *)(v58 + 16);
  *(void *)(v0 + 368) = v65;
  uint64_t result = swift_bridgeObjectRetain();
  if (v65)
  {
    uint64_t v66 = *(void *)(v0 + 360);
    if (!*(void *)(v66 + 16))
    {
      __break(1u);
      goto LABEL_67;
    }
    sub_24878CADC(v66 + 32, v0 + 24);
    *(void *)(v0 + 112) = 0;
    sub_248777284((long long *)(v0 + 24), v0 + 120);
    uint64_t v67 = 1;
  }
  else
  {
    uint64_t v67 = 0;
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  *(void *)(v0 + 376) = v67;
  sub_24878C824(v0 + 112, v0 + 64);
  if (!*(void *)(v0 + 96))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_2487A5F48();
    os_log_type_t v81 = sub_2487A65B8();
    BOOL v82 = os_log_type_enabled(v80, v81);
    uint64_t v83 = *(void *)(v0 + 360);
    if (v82)
    {
      char v105 = *(unsigned char *)(v0 + 402);
      uint64_t v84 = swift_slowAlloc();
      uint64_t v85 = swift_slowAlloc();
      v106[0] = v85;
      *(_DWORD *)uint64_t v84 = 136315650;
      *(void *)(v0 + 208) = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, v106);
      sub_2487A6698();
      *(_WORD *)(v84 + 12) = 2048;
      uint64_t v86 = *(void *)(v83 + 16);
      swift_bridgeObjectRelease();
      *(void *)(v0 + 216) = v86;
      sub_2487A6698();
      swift_bridgeObjectRelease();
      *(_WORD *)(v84 + 22) = 2080;
      unint64_t v87 = sub_24878DB64(v105);
      *(void *)(v0 + 224) = sub_2487A24A8(v87, v88, v106);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v80, v81, "%s Successfully performed all %ld response tasks for known client %s", (uint8_t *)v84, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v85, -1, -1);
      MEMORY[0x24C57FA90](v84, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_65;
  }
  uint64_t v68 = *(void *)(v0 + 64);
  sub_248777284((long long *)(v0 + 72), v0 + 160);
  id v69 = sub_2487A5F48();
  os_log_type_t v70 = sub_2487A65B8();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v71 = swift_slowAlloc();
    uint64_t v72 = swift_slowAlloc();
    *uint64_t v94 = v72;
    *(_DWORD *)uint64_t v71 = 136315650;
    uint64_t result = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, v94);
    *(void *)(v71 + 4) = result;
    *(_WORD *)(v71 + 12) = 2048;
    if (!__OFADD__(v68, 1))
    {
      *(void *)(v71 + 14) = v68 + 1;
      *(_WORD *)(v71 + 22) = 2080;
      unint64_t v73 = sub_24878DB64(*(unsigned char *)(v0 + 402));
      *(void *)(v71 + 24) = sub_2487A24A8(v73, v74, v94);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v69, v70, "%s Performing response task #%ld for known client %s", (uint8_t *)v71, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v72, -1, -1);
      MEMORY[0x24C57FA90](v71, -1, -1);
      goto LABEL_58;
    }
LABEL_67:
    __break(1u);
    return result;
  }
LABEL_58:

  unint64_t v75 = __swift_project_boxed_opaque_existential_1((void *)(v0 + 160), *(void *)(v0 + 184));
  int v76 = *(unsigned __int8 *)v75;
  uint64_t v104 = (uint64_t (*)(uint64_t, int))((char *)&dword_269327808 + dword_269327808);
  int v77 = *((unsigned __int16 *)v75 + 1);
  uint64_t v78 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v78;
  *uint64_t v78 = v0;
  v78[1] = sub_24878B128;
  uint64_t v79 = *(void *)(v0 + 304);
  return v104(v79, v76 | (v77 << 16));
}

uint64_t sub_24878B128()
{
  *(void *)(*(void *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v2 = sub_24878B728;
  }
  else
  {
    uint64_t v2 = sub_24878B248;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24878B248()
{
  uint64_t v31 = v0;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  unint64_t v2 = *(void *)(v0 + 376);
  if (v2 == *(void *)(v0 + 368))
  {
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 360);
    if (v2 >= *(void *)(v3 + 16))
    {
      __break(1u);
      goto LABEL_19;
    }
    sub_24878CADC(v3 + 40 * v2 + 32, v0 + 24);
    *(void *)(v0 + 112) = v2;
    sub_248777284((long long *)(v0 + 24), v0 + 120);
    ++v2;
  }
  *(void *)(v0 + 376) = v2;
  sub_24878C824(v0 + 112, v0 + 64);
  if (*(void *)(v0 + 96))
  {
    uint64_t v4 = *(void *)(v0 + 64);
    sub_248777284((long long *)(v0 + 72), v0 + 160);
    uint64_t v5 = sub_2487A5F48();
    os_log_type_t v6 = sub_2487A65B8();
    if (!os_log_type_enabled(v5, v6))
    {
LABEL_9:

      unint64_t v11 = __swift_project_boxed_opaque_existential_1((void *)(v0 + 160), *(void *)(v0 + 184));
      int v12 = *(unsigned __int8 *)v11;
      uint64_t v28 = (uint64_t (*)(uint64_t, int))((char *)&dword_269327808 + dword_269327808);
      int v13 = *((unsigned __int16 *)v11 + 1);
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 384) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_24878B128;
      uint64_t v15 = *(void *)(v0 + 304);
      return v28(v15, v12 | (v13 << 16));
    }
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(void *)(v0 + 240) = v8;
    *(_DWORD *)uint64_t v7 = 136315650;
    uint64_t result = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, (uint64_t *)(v0 + 240));
    *(void *)(v7 + 4) = result;
    *(_WORD *)(v7 + 12) = 2048;
    if (!__OFADD__(v4, 1))
    {
      *(void *)(v7 + 14) = v4 + 1;
      *(_WORD *)(v7 + 22) = 2080;
      unint64_t v9 = sub_24878DB64(*(unsigned char *)(v0 + 402));
      *(void *)(v7 + 24) = sub_2487A24A8(v9, v10, (uint64_t *)(v0 + 240));
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v5, v6, "%s Performing response task #%ld for known client %s", (uint8_t *)v7, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v8, -1, -1);
      MEMORY[0x24C57FA90](v7, -1, -1);
      goto LABEL_9;
    }
LABEL_19:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_2487A5F48();
  os_log_type_t v17 = sub_2487A65B8();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v19 = *(void *)(v0 + 360);
  if (v18)
  {
    char v29 = *(unsigned char *)(v0 + 402);
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v30 = v21;
    *(_DWORD *)uint64_t v20 = 136315650;
    *(void *)(v0 + 208) = sub_2487A24A8(0xD000000000000013, 0x80000002487A93B0, &v30);
    sub_2487A6698();
    *(_WORD *)(v20 + 12) = 2048;
    uint64_t v22 = *(void *)(v19 + 16);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 216) = v22;
    sub_2487A6698();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2080;
    unint64_t v23 = sub_24878DB64(v29);
    *(void *)(v0 + 224) = sub_2487A24A8(v23, v24, &v30);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v16, v17, "%s Successfully performed all %ld response tasks for known client %s", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v21, -1, -1);
    MEMORY[0x24C57FA90](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_2487A62D8();
  BOOL v25 = (void *)sub_2487A62F8();
  uint64_t v26 = (void *)sub_2487A6008();

  sub_2487A6288();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v27 = *(uint64_t (**)(void))(v0 + 8);
  return v27();
}

uint64_t sub_24878B728()
{
  uint64_t v1 = *(void *)(v0 + 392);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  sub_24878C7D0();
  swift_allocError();
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24878B7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[25] = a4;
  v5[26] = a5;
  v5[23] = a2;
  v5[24] = a3;
  v5[22] = a1;
  return MEMORY[0x270FA2498](sub_24878B80C, 0, 0);
}

uint64_t sub_24878B80C()
{
  os_log_type_t v41 = v0;
  if (qword_269327228 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_2693291D0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v3 = v1;
  uint64_t v4 = sub_2487A5F48();
  os_log_type_t v5 = sub_2487A65B8();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = v0[26];
  if (v6)
  {
    uint64_t v32 = v0[25];
    os_log_type_t type = v5;
    unint64_t v8 = v0[24];
    uint64_t v31 = v0[23];
    int v35 = (void *)v0[22];
    uint64_t v9 = swift_slowAlloc();
    unint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v40[0] = v38;
    *(_DWORD *)uint64_t v9 = 136315906;
    v0[18] = sub_2487A24A8(0xD00000000000003DLL, 0x80000002487A9370, v40);
    sub_2487A6698();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[19] = sub_2487A24A8(v31, v8, v40);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 22) = 2080;
    swift_bridgeObjectRetain();
    v0[20] = sub_2487A24A8(v32, v7, v40);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 32) = 2112;
    v0[21] = v35;
    id v10 = v35;
    sub_2487A6698();
    *unint64_t v33 = v35;

    _os_log_impl(&dword_24876F000, v4, type, "%s called with requestID %s, responderDSID: %s, answer: %@", (uint8_t *)v9, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v33, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v38, -1, -1);
    MEMORY[0x24C57FA90](v9, -1, -1);
  }
  else
  {
    unint64_t v11 = (void *)v0[22];
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = v0[25];
  uint64_t v13 = v0[26];
  uint64_t v15 = v0[23];
  uint64_t v14 = v0[24];
  uint64_t v16 = (void *)v0[22];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_248784DE0(v15, v14, v12, v13, v16, v0 + 2);
  os_log_type_t v17 = (void *)v0[22];

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v18 = v17;
  uint64_t v19 = sub_2487A5F48();
  os_log_type_t v20 = sub_2487A65B8();
  BOOL v21 = os_log_type_enabled(v19, v20);
  unint64_t v22 = v0[26];
  if (v21)
  {
    unint64_t v23 = v0[24];
    uint64_t v34 = v0[25];
    unint64_t v24 = (void *)v0[22];
    uint64_t v25 = v0[23];
    uint64_t v26 = swift_slowAlloc();
    os_log_type_t typea = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v40[0] = v39;
    *(_DWORD *)uint64_t v26 = 136315650;
    swift_bridgeObjectRetain();
    v0[15] = sub_2487A24A8(v25, v23, v40);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[16] = sub_2487A24A8(v34, v22, v40);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 22) = 2112;
    v0[17] = v24;
    id v27 = v24;
    sub_2487A6698();
    *os_log_type_t typea = v24;

    _os_log_impl(&dword_24876F000, v19, v20, "Calling into ScreenTimeAnswerHandler with requestID %s, responderDSID: %s, answer: %@", (uint8_t *)v26, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](typea, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v39, -1, -1);
    MEMORY[0x24C57FA90](v26, -1, -1);
  }
  else
  {
    uint64_t v28 = (void *)v0[22];
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  char v29 = (void *)swift_task_alloc();
  v0[27] = v29;
  *char v29 = v0;
  v29[1] = sub_24878BE8C;
  return sub_24877BF9C();
}

uint64_t sub_24878BE8C()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24878C020;
  }
  else {
    uint64_t v2 = sub_24878BFA0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24878BFA0()
{
  *(_OWORD *)(v0 + 88) = *(_OWORD *)(v0 + 16);
  sub_24878C648(v0 + 88);
  *(_OWORD *)(v0 + 104) = *(_OWORD *)(v0 + 32);
  sub_24878C648(v0 + 104);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24878C020()
{
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 16);
  sub_24878C648(v0 + 56);
  *(_OWORD *)(v0 + 72) = *(_OWORD *)(v0 + 32);
  sub_24878C648(v0 + 72);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24878C0A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693276C8);
    uint64_t v3 = sub_2487A6748();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      BOOL v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_2487A6908();
      swift_bridgeObjectRetain();
      sub_2487A63E8();
      uint64_t result = sub_2487A6928();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_2487A6868(), (result & 1) != 0))
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
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_2487A6868();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      BOOL v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *BOOL v21 = v8;
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
  return MEMORY[0x263F8EE88];
}

uint64_t sub_24878C244()
{
  _Block_release(*(const void **)(v0 + 40));
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24878C29C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_24878CD14;
  uint64_t v8 = (uint64_t (*)(void *, int, int, void *, uint64_t))((char *)&dword_2693276D0 + dword_2693276D0);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_24878C368()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24878CD14;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2693276E0 + dword_2693276E0);
  return v6(v2, v3, v4);
}

uint64_t sub_24878C42C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24878CD14;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2693276F0 + dword_2693276F0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24878C4F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693278B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24878C558()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24878C590(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24877AE1C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269327700 + dword_269327700);
  return v6(a1, v4);
}

uint64_t sub_24878C648(uint64_t a1)
{
  return a1;
}

uint64_t sub_24878C674()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24878C6C4()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24877AE1C;
  uint64_t v7 = (uint64_t (*)(void *, int, void *, uint64_t))((char *)&dword_269327718 + dword_269327718);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_24878C78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_24878C7D0()
{
  unint64_t result = qword_269327740;
  if (!qword_269327740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327740);
  }
  return result;
}

uint64_t sub_24878C824(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24878C88C()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24878C8D4()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  __int16 v5 = *(_WORD *)(v0 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24878CD14;
  uint64_t v7 = (uint64_t (*)(void *, __int16, void *, uint64_t))((char *)&dword_269327750 + dword_269327750);
  return v7(v2, v5, v3, v4);
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_24878C9E0()
{
  unint64_t result = qword_269327780;
  if (!qword_269327780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269327778);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269327780);
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

unint64_t sub_24878CA84()
{
  unint64_t result = qword_269327790;
  if (!qword_269327790)
  {
    type metadata accessor for AppExtensionProxy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327790);
  }
  return result;
}

uint64_t sub_24878CADC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_24878CB44(void *a1, uint64_t a2, char a3)
{
  if (a3) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

void destroy for ResponseError(uint64_t a1)
{
}

void sub_24878CB64(void *a1, uint64_t a2, char a3)
{
  if (a3) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t _s11AskToDaemon13ResponseErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24878CB44(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ResponseError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24878CB44(*(void **)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24878CB64(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ResponseError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24878CB64(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResponseError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ResponseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
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

uint64_t sub_24878CCEC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24878CCF4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ResponseError()
{
  return &type metadata for ResponseError;
}

void destroy for MessagesPayload(uint64_t *a1)
{
  unint64_t v2 = a1[1];
  if (v2 >> 60 != 15) {
    sub_248776A2C(*a1, v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unsigned int v3 = (void *)a1[9];
}

uint64_t initializeWithCopy for MessagesPayload(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    sub_248776950(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  uint64_t v6 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = a2[7];
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = v8;
  uint64_t v10 = a2[8];
  uint64_t v9 = (void *)a2[9];
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v9;
  return a1;
}

uint64_t *assignWithCopy for MessagesPayload(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v6 = *a2;
      sub_248776950(*a2, a2[1]);
      uint64_t v7 = *a1;
      unint64_t v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_248776A2C(v7, v8);
      goto LABEL_8;
    }
    sub_24878CF5C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v5 = *a2;
  sub_248776950(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)a2[9];
  uint64_t v10 = (void *)a1[9];
  a1[9] = (uint64_t)v9;
  id v11 = v9;

  return a1;
}

uint64_t sub_24878CF5C(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t *assignWithTake for MessagesPayload(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_248776A2C(v6, v4);
      goto LABEL_6;
    }
    sub_24878CF5C((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[8];
  a1[7] = a2[7];
  a1[8] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)a1[9];
  a1[9] = a2[9];

  return a1;
}

uint64_t getEnumTagSinglePayload for MessagesPayload(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MessagesPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesPayload()
{
  return &type metadata for MessagesPayload;
}

uint64_t sub_24878D134(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void *sub_24878D178()
{
  qword_2693292C8 = (uint64_t)&unk_26FC82298;
  return &unk_26FC82298;
}

uint64_t sub_24878D18C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2487A5E88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487A5E78();
  uint64_t v8 = sub_2487A5E68();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(v2 + 16) = v8;
  *(void *)(v2 + 24) = v10;
  *(unsigned char *)(v2 + 40) = 0;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(unsigned char *)(v2 + 96) = 0;
  *(void *)(v2 + 32) = a1;
  id v11 = a1;
  unint64_t v12 = (uint64_t (*)())objc_msgSend(v11, sel_interruptionHandler);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    unint64_t v12 = sub_248790AA8;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v12;
  v15[3] = v13;
  v15[4] = v14;
  id v27 = sub_248790AB8;
  uint64_t v28 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v24 = 1107296256;
  uint64_t v25 = sub_24878D134;
  uint64_t v26 = &block_descriptor_5;
  uint64_t v16 = _Block_copy(&aBlock);
  sub_2487909E4((uint64_t)v12);
  swift_release();
  objc_msgSend(v11, sel_setInterruptionHandler_, v16);
  _Block_release(v16);
  BOOL v17 = (uint64_t (*)())objc_msgSend(v11, sel_invalidationHandler);
  if (v17)
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v17;
    BOOL v17 = sub_248790A98;
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  os_log_type_t v20 = (void *)swift_allocObject();
  v20[2] = v17;
  v20[3] = v18;
  v20[4] = v19;
  id v27 = sub_248790A40;
  uint64_t v28 = v20;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v24 = 1107296256;
  uint64_t v25 = sub_24878D134;
  uint64_t v26 = &block_descriptor_18;
  BOOL v21 = _Block_copy(&aBlock);
  sub_2487909E4((uint64_t)v17);
  swift_release();
  objc_msgSend(v11, sel_setInvalidationHandler_, v21);

  _Block_release(v21);
  sub_248773FD8((uint64_t)v17);
  sub_248773FD8((uint64_t)v12);
  return v2;
}

uint64_t sub_24878D514(void (*a1)(void))
{
  if (a1) {
    a1();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v2 = result;
    *(unsigned char *)(result + 40) = 0;
    uint64_t v3 = *(void *)(result + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = *(void *)(v2 + 64);
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 80) = 0u;
    *(unsigned char *)(v2 + 96) = 0;
    sub_24879094C(v3, v4, v5);
    return swift_release();
  }
  return result;
}

void sub_24878D5A4()
{
  if ((*(unsigned char *)(v0 + 40) & 1) == 0)
  {
    uint64_t v1 = *(void **)(v0 + 32);
    objc_msgSend(v1, sel_activate);
    sub_24878FD7C(v1, v9);
    uint64_t v2 = v10;
    uint64_t v3 = v11;
    uint64_t v4 = v13;
    char v5 = v14;
    uint64_t v6 = *(void *)(v0 + 48);
    uint64_t v7 = *(void *)(v0 + 56);
    uint64_t v8 = *(void *)(v0 + 64);
    *(void *)(v0 + 48) = v9[0];
    *(void *)(v0 + 56) = v2;
    *(void *)(v0 + 64) = v3;
    *(_OWORD *)(v0 + 72) = v12;
    *(void *)(v0 + 88) = v4;
    *(unsigned char *)(v0 + 96) = v5;
    sub_24879094C(v6, v7, v8);
    *(unsigned char *)(v0 + 40) = 1;
  }
}

uint64_t sub_24878D634()
{
  swift_bridgeObjectRelease();

  sub_24879094C(*(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64));

  return MEMORY[0x270FA0228](v0, 97, 7);
}

uint64_t type metadata accessor for Client()
{
  return self;
}

uint64_t destroy for Client.Metadata()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Client.Metadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Client.Metadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Client.Metadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for Client.Metadata(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Client.Metadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Client.Metadata()
{
  return &type metadata for Client.Metadata;
}

uint64_t getEnumTagSinglePayload for Client.Known(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Client.Known(unsigned char *result, unsigned int a2, unsigned int a3)
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
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24878DA48);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Client.Known()
{
  return &type metadata for Client.Known;
}

id sub_24878DA80()
{
  if (qword_269327280 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2693292C8;

  return v0;
}

uint64_t sub_24878DADC(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = swift_allocObject();
  sub_24878D18C(v1);
  return v2;
}

uint64_t sub_24878DB20@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *a1 = *(void *)(*(void *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24878DB30()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_24878DB64(char a1)
{
  unint64_t v1 = 0xD000000000000026;
  switch(a1)
  {
    case 1:
      sub_2487A6758();
      swift_bridgeObjectRelease();
      unint64_t v1 = 0xD00000000000004BLL;
      break;
    case 2:
      sub_2487A6758();
      swift_bridgeObjectRelease();
      unint64_t v1 = 0xD00000000000005DLL;
      break;
    case 3:
      return v1;
    default:
      sub_2487A6758();
      swift_bridgeObjectRelease();
      unint64_t v1 = 0xD00000000000002DLL;
      break;
  }
  return v1;
}

void *sub_24878DC60()
{
  __n128 result = sub_24878DC80();
  off_269327798 = result;
  return result;
}

void *sub_24878DC80()
{
  uint64_t v0 = (void *)sub_24878E000(MEMORY[0x263F8EE78]);
  unint64_t v1 = 0;
  do
  {
    if (v1 >= qword_26FC7DB98)
    {
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      sub_2487A68A8();
      __break(1u);
      JUMPOUT(0x24878DEC8);
    }
    uint64_t v2 = *((unsigned __int8 *)&unk_26FC7DB88 + v1++ + 32);
    uint64_t v3 = 0xD00000000000001ALL;
    uint64_t v4 = 0x80000002487A95E0;
    switch(v2)
    {
      case 1:
        uint64_t v3 = 0xD000000000000032;
        uint64_t v4 = 0x80000002487A95A0;
        break;
      case 2:
        uint64_t v3 = 0xD000000000000037;
        uint64_t v4 = 0x80000002487A9560;
        break;
      case 3:
        uint64_t v4 = 0x80000002487A8D20;
        uint64_t v3 = 0xD000000000000019;
        break;
      default:
        break;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v7 = sub_24878E5F4(v3, v4);
    uint64_t v8 = v0[2];
    BOOL v9 = (v6 & 1) == 0;
    uint64_t v10 = v8 + v9;
    if (__OFADD__(v8, v9)) {
      goto LABEL_22;
    }
    char v11 = v6;
    if (v0[3] >= v10)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v6) {
          goto LABEL_2;
        }
      }
      else
      {
        sub_24878F4E0();
        if (v11) {
          goto LABEL_2;
        }
      }
    }
    else
    {
      sub_24878E6BC(v10, isUniquelyReferenced_nonNull_native);
      unint64_t v12 = sub_24878E5F4(v3, v4);
      if ((v11 & 1) != (v13 & 1)) {
        goto LABEL_24;
      }
      unint64_t v7 = v12;
      if (v11)
      {
LABEL_2:
        *(unsigned char *)(v0[7] + v7) = v2;
        goto LABEL_3;
      }
    }
    v0[(v7 >> 6) + 8] |= 1 << v7;
    char v14 = (uint64_t *)(v0[6] + 16 * v7);
    *char v14 = v3;
    v14[1] = v4;
    *(unsigned char *)(v0[7] + v7) = v2;
    uint64_t v15 = v0[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_23;
    }
    v0[2] = v17;
    swift_bridgeObjectRetain();
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  while (v1 != 4);
  return v0;
}

unint64_t sub_24878DED8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277E0);
  uint64_t v2 = (void *)sub_2487A6818();
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
    unint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24878E5F4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v11 = (uint64_t *)(v2[6] + 16 * result);
    *char v11 = v5;
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

unint64_t sub_24878DFF4(uint64_t a1)
{
  return sub_24878E358(a1, &qword_2693277D0);
}

unint64_t sub_24878E000(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277C8);
  uint64_t v2 = (void *)sub_2487A6818();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24878E5F4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

unint64_t sub_24878E114(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277E8);
  uint64_t v2 = (void *)sub_2487A6818();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_24878E66C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_24878E220(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277D8);
  uint64_t v2 = (void *)sub_2487A6818();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_24878E5F4(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_24878E34C(uint64_t a1)
{
  return sub_24878E358(a1, &qword_2693277F8);
}

unint64_t sub_24878E358(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_2487A6818();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_24878E5F4(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

void sub_24878E470(void *a1@<X8>)
{
  *a1 = &unk_26FC7DC00;
}

unint64_t sub_24878E480()
{
  return sub_24878DB64(*v0);
}

unint64_t sub_24878E48C()
{
  unint64_t result = qword_2693277A0;
  if (!qword_2693277A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693277A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693277A0);
  }
  return result;
}

unint64_t sub_24878E4EC()
{
  unint64_t result = qword_2693277B0;
  if (!qword_2693277B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693277B0);
  }
  return result;
}

uint64_t sub_24878E540()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_24878E54C(uint64_t a1)
{
  *(void *)(a1 + 16) = sub_24878E5B4(&qword_2693277B8);
  uint64_t result = sub_24878E5B4(&qword_2693277C0);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_24878E5B4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Client();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24878E5F4(uint64_t a1, uint64_t a2)
{
  sub_2487A6908();
  sub_2487A63E8();
  uint64_t v4 = sub_2487A6928();

  return sub_24878F2E4(a1, a2, v4);
}

unint64_t sub_24878E66C(uint64_t a1)
{
  uint64_t v2 = sub_2487A6678();

  return sub_24878F3C8(a1, v2);
}

uint64_t sub_24878E6B0(uint64_t a1, char a2)
{
  return sub_24878EFD0(a1, a2, &qword_2693277D0);
}

uint64_t sub_24878E6BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277C8);
  char v37 = a2;
  uint64_t v6 = sub_2487A6808();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2487A6908();
    sub_2487A63E8();
    uint64_t result = sub_2487A6928();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
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

uint64_t sub_24878E9C8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277E8);
  uint64_t v6 = sub_2487A6808();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v35 = v2;
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
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_2487A6678();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24878ECA0(uint64_t a1, char a2)
{
  return sub_24878ECB8(a1, a2, &qword_2693277F0);
}

uint64_t sub_24878ECAC(uint64_t a1, char a2)
{
  return sub_24878ECB8(a1, a2, &qword_2693277E0);
}

uint64_t sub_24878ECB8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_2487A6808();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    id v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_2487A6908();
    sub_2487A63E8();
    uint64_t result = sub_2487A6928();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  unint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_24878EFC4(uint64_t a1, char a2)
{
  return sub_24878EFD0(a1, a2, &qword_2693277F8);
}

uint64_t sub_24878EFD0(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_2487A6808();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_2487A6908();
    sub_2487A63E8();
    uint64_t result = sub_2487A6928();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

unint64_t sub_24878F2E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2487A6868() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2487A6868() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24878F3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_248784BF0();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_2487A6688();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_2487A6688();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

void *sub_24878F4D4()
{
  return sub_24878FBCC(&qword_2693277D0);
}

void *sub_24878F4E0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2487A67F8();
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *uint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24878F68C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2487A67F8();
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24878F838()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693277D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2487A67F8();
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
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

id sub_24878F9FC()
{
  return sub_24878FA14(&qword_2693277F0);
}

id sub_24878FA08()
{
  return sub_24878FA14(&qword_2693277E0);
}

id sub_24878FA14(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2487A67F8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    unint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24878FBC0()
{
  return sub_24878FBCC(&qword_2693277F8);
}

void *sub_24878FBCC(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2487A67F8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_24878FD7C(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v98 = *MEMORY[0x263EF8340];
  uint64_t v93 = sub_2487A5F68();
  uint64_t v89 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  unint64_t v88 = (char *)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  token.val[0] = objc_msgSend(a1, sel_processIdentifier);
  uint64_t v92 = sub_2487A6848();
  unint64_t v5 = v4;
  uint64_t v6 = a1;
  objc_msgSend(a1, sel_auditToken);
  unsigned int v7 = token.val[0];
  unsigned int v8 = token.val[1];
  unsigned int v9 = token.val[2];
  unsigned int v10 = token.val[3];
  unsigned int v11 = token.val[4];
  LODWORD(a1) = token.val[5];
  unsigned int v13 = token.val[6];
  unsigned int v12 = token.val[7];
  int64_t v14 = self;
  id v95 = 0;
  token.val[0] = v7;
  token.val[1] = v8;
  unsigned int v86 = v10;
  unsigned int v87 = v9;
  token.val[2] = v9;
  token.val[3] = v10;
  unsigned int v84 = a1;
  unsigned int v85 = v11;
  token.val[4] = v11;
  token.val[5] = a1;
  unsigned int v82 = v12;
  unsigned int v83 = v13;
  token.val[6] = v13;
  token.val[7] = v12;
  id v15 = objc_msgSend(v14, sel_bundleRecordForAuditToken_error_, &token, &v95);
  id v16 = v95;
  unint64_t v90 = v5;
  if (v15)
  {
    uint64_t v17 = v15;
    self;
    uint64_t v18 = (void *)swift_dynamicCastObjCClass();
    id v19 = v16;
    if (v18)
    {
      id v95 = 0;
      uint64_t v96 = 0;
      uint64_t v20 = qword_269327230;
      id v21 = v18;
      int64_t v22 = v6;
      if (v20 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v93, (uint64_t)qword_2693291E8);
      swift_bridgeObjectRetain_n();
      int64_t v23 = sub_2487A5F48();
      os_log_type_t v24 = sub_2487A65B8();
      if (os_log_type_enabled(v23, v24))
      {
        int64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(void *)token.val = v26;
        *(_DWORD *)int64_t v25 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v94 = sub_2487A24A8(v92, v5, (uint64_t *)&token);
        sub_2487A6698();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v23, v24, "Got LSApplicationRecord for process with PID %s", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v26, -1, -1);
        MEMORY[0x24C57FA90](v25, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      id v40 = objc_msgSend(v21, sel_bundleIdentifier);
      if (v40)
      {
        os_log_type_t v41 = v40;
        uint64_t v42 = (void *)sub_2487A63B8();
        uint64_t v44 = v43;
      }
      else
      {
        uint64_t v42 = 0;
        uint64_t v44 = 0;
      }
      id v95 = v42;
      uint64_t v96 = v44;
      id v63 = objc_msgSend(v21, sel_iTunesMetadata);
      id v61 = objc_msgSend(v63, sel_storeItemIdentifier);

      char v62 = 0;
      goto LABEL_38;
    }
    unsigned int v80 = v7;

    int64_t v22 = v6;
  }
  else
  {
    unsigned int v80 = v7;
    LODWORD(v81) = v8;
    id v27 = v95;
    BOOL v28 = (void *)sub_2487A5DF8();

    swift_willThrow();
    if (qword_269327230 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v93, (uint64_t)qword_2693291E8);
    swift_bridgeObjectRetain();
    id v29 = v28;
    swift_bridgeObjectRetain();
    id v30 = v28;
    uint64_t v31 = sub_2487A5F48();
    os_log_type_t v32 = sub_2487A6598();
    int64_t v22 = v6;
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = (void *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v79 = v6;
      uint64_t v36 = v35;
      *(void *)token.val = v35;
      *(_DWORD *)uint64_t v33 = 136315394;
      swift_bridgeObjectRetain();
      id v95 = (id)sub_2487A24A8(v92, v5, (uint64_t *)&token);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2112;
      id v37 = v28;
      unint64_t v38 = v5;
      char v39 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v95 = v39;
      sub_2487A6698();
      *uint64_t v34 = v39;
      unint64_t v5 = v38;

      _os_log_impl(&dword_24876F000, v31, v32, "Error obtaining bundle record for connection to PID %s: %@", (uint8_t *)v33, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v34, -1, -1);
      swift_arrayDestroy();
      int64_t v22 = v79;
      MEMORY[0x24C57FA90](v36, -1, -1);
      MEMORY[0x24C57FA90](v33, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unsigned int v8 = v81;
  }
  id v95 = 0;
  uint64_t v96 = 0;
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v45 = __swift_project_value_buffer(v93, (uint64_t)qword_2693291E8);
  swift_bridgeObjectRetain_n();
  uint64_t v81 = v45;
  char v46 = sub_2487A5F48();
  os_log_type_t v47 = sub_2487A6598();
  if (os_log_type_enabled(v46, v47))
  {
    id v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(void *)token.val = v49;
    *(_DWORD *)id v48 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v94 = sub_2487A24A8(v92, v5, (uint64_t *)&token);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v46, v47, "Could not get LSApplicationRecord for process with PID %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v49, -1, -1);
    MEMORY[0x24C57FA90](v48, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  token.val[0] = v80;
  token.val[1] = v8;
  token.val[2] = v87;
  token.val[3] = v86;
  token.val[4] = v85;
  token.val[5] = v84;
  token.val[6] = v83;
  token.val[7] = v82;
  SecTaskRef v50 = SecTaskCreateWithAuditToken(0, &token);
  if (v50)
  {
    BOOL v51 = v50;
    swift_bridgeObjectRelease();
    CFStringRef v52 = SecTaskCopySigningIdentifier(v51, 0);
    uint64_t v79 = v22;
    if (v52)
    {
      uint64_t v53 = (__CFString *)v52;
      uint64_t v54 = sub_2487A63B8();
      unint64_t v56 = v55;
    }
    else
    {
      uint64_t v54 = 0;
      unint64_t v56 = 0;
    }
    id v95 = (id)v54;
    uint64_t v96 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v88, v81, v93);
    swift_bridgeObjectRetain_n();
    unint64_t v64 = sub_2487A5F48();
    os_log_type_t v65 = sub_2487A65B8();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(void *)token.val = v67;
      *(_DWORD *)uint64_t v66 = 136315138;
      if (v56)
      {
        unint64_t v68 = v56;
      }
      else
      {
        uint64_t v54 = 7104878;
        unint64_t v68 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_2487A24A8(v54, v68, (uint64_t *)&token);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v64, v65, "Bundle identifier from signing identity is %s", v66, 0xCu);
      char v62 = 1;
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v67, -1, -1);
      MEMORY[0x24C57FA90](v66, -1, -1);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v88, v93);
      id v21 = 0;
      id v61 = 0;
      int64_t v22 = v79;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v89 + 8))(v88, v93);
      id v21 = 0;
      id v61 = 0;
      char v62 = 1;
      int64_t v22 = v79;
    }
  }
  else
  {
    swift_bridgeObjectRetain_n();
    uint64_t v57 = sub_2487A5F48();
    os_log_type_t v58 = sub_2487A6598();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      *(void *)token.val = v60;
      *(_DWORD *)uint64_t v59 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_2487A24A8(v92, v5, (uint64_t *)&token);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v57, v58, "Failed to get signing info for connection to PID %s", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v60, -1, -1);
      MEMORY[0x24C57FA90](v59, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v21 = 0;
    id v61 = 0;
    char v62 = 1;
  }
LABEL_38:
  swift_beginAccess();
  uint64_t v70 = (uint64_t)v95;
  uint64_t v69 = v96;
  if (!v96)
  {

    goto LABEL_46;
  }
  uint64_t v71 = qword_269327288;
  swift_bridgeObjectRetain();
  if (v71 != -1) {
    swift_once();
  }
  uint64_t v72 = off_269327798;
  if (!*((void *)off_269327798 + 2) || (unint64_t v73 = sub_24878E5F4(v70, v69), (v74 & 1) == 0))
  {

    swift_bridgeObjectRelease();
LABEL_46:
    char v75 = 4;
    goto LABEL_47;
  }
  char v75 = *(unsigned char *)(v72[7] + v73);

  swift_bridgeObjectRelease();
LABEL_47:
  int v76 = v91;
  uint64_t v77 = v92;
  *uint64_t v91 = v75;
  unint64_t v78 = v90;
  *((void *)v76 + 1) = v77;
  *((void *)v76 + 2) = v78;
  *((void *)v76 + 3) = v70;
  *((void *)v76 + 4) = v69;
  *((void *)v76 + 5) = v61;
  v76[48] = v62;
}

uint64_t sub_24879094C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_248790990()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_2487909E4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t objectdestroy_10Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_248790A40()
{
  return sub_24878D514(*(void (**)(void))(v0 + 16));
}

uint64_t sub_248790A60()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_248790A98()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_248790ABC(uint64_t a1, unint64_t a2)
{
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2487A5F68();
  __swift_project_value_buffer(v5, (uint64_t)qword_2693291E8);
  swift_bridgeObjectRetain_n();
  id v6 = v2;
  unsigned int v7 = sub_2487A5F48();
  os_log_type_t v8 = sub_2487A65B8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v17[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    DWORD1(v16[0]) = (unint64_t)sub_2487A24A8(a1, a2, v17) >> 32;
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 1024;
    unsigned int v11 = objc_msgSend(v6, sel_processIdentifier);

    LODWORD(v16[0]) = v11;
    sub_2487A6698();

    _os_log_impl(&dword_24876F000, v7, v8, "Checking entitlement \"%s\" for connection with PID %d", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v10, -1, -1);
    MEMORY[0x24C57FA90](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unsigned int v12 = (void *)sub_2487A63A8();
  id v13 = objc_msgSend(v6, sel_valueForEntitlement_, v12);

  if (v13)
  {
    sub_2487A66C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_248790D64((uint64_t)v16, (uint64_t)v17);
  if (v17[3])
  {
    uint64_t result = swift_dynamicCast();
    if (result) {
      return v15;
    }
  }
  else
  {
    sub_248790DCC((uint64_t)v17);
    return 0;
  }
  return result;
}

uint64_t sub_248790D64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248790DCC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327800);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_248790E2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_248790E44()
{
  if (*v0) {
    return 0xD000000000000041;
  }
  else {
    return 0xD00000000000002DLL;
  }
}

uint64_t sub_248790E84(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + 32) = a2;
  *(void *)(v2 + 24) = a1;
  return MEMORY[0x270FA2498](sub_248790F18, 0, 0);
}

uint64_t sub_248790F18()
{
  unsigned int v82 = v0;
  v81[2] = *MEMORY[0x263EF8340];
  if (qword_269327228 != -1) {
    swift_once();
  }
  unint64_t v1 = (uint64_t *)(v0 + 16);
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_2693291D0);
  uint64_t v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = *((_DWORD *)v0 + 8);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v81[0] = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    *((void *)v0 + 2) = sub_2487A24A8(0xD00000000000001BLL, 0x80000002487A9740, v81);
    sub_2487A6698();
    *(_WORD *)(v6 + 12) = 2080;
    unint64_t v8 = sub_24878DB64(v5);
    *((void *)v0 + 2) = sub_2487A24A8(v8, v9, v81);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v3, v4, "%s called for client %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v7, -1, -1);
    MEMORY[0x24C57FA90](v6, -1, -1);
  }

  uint64_t v10 = (id *)(v0 + 24);
  uint64_t v11 = sub_2487A6308();
  if (!v11)
  {
    id v24 = *v10;
    int64_t v25 = sub_2487A5F48();
    os_log_type_t v26 = sub_2487A65A8();
    BOOL v27 = os_log_type_enabled(v25, v26);
    id v28 = *v10;
    if (v27)
    {
      uint64_t v29 = swift_slowAlloc();
      id v30 = (void *)swift_slowAlloc();
      unsigned int v80 = v0;
      uint64_t v31 = swift_slowAlloc();
      v81[0] = v31;
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t *v1 = sub_2487A24A8(0xD00000000000001BLL, 0x80000002487A9740, v81);
      sub_2487A6698();
      *(_WORD *)(v29 + 12) = 2112;
      uint64_t *v1 = (uint64_t)v28;
      id v32 = v28;
      sub_2487A6698();
      *id v30 = v28;

      _os_log_impl(&dword_24876F000, v25, v26, "%s The AskTo payload doesn't have a response attached: %@", (uint8_t *)v29, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v30, -1, -1);
      swift_arrayDestroy();
      uint64_t v33 = v31;
      uint64_t v0 = v80;
      MEMORY[0x24C57FA90](v33, -1, -1);
      MEMORY[0x24C57FA90](v29, -1, -1);
    }
    else
    {
    }
    sub_248791B5C();
    swift_allocError();
    *uint64_t v34 = 0;
    swift_willThrow();
    goto LABEL_72;
  }
  unsigned int v12 = (void *)v11;
  id v13 = (uint64_t *)(v0 + 16);
  sub_2487A62D8();
  int64_t v14 = (void *)sub_2487A62F8();
  unsigned __int8 v15 = (void *)sub_2487A6008();

  sub_2487A6288();
  swift_bridgeObjectRelease();
  id v79 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F670B8]), sel_init);
  id v16 = (void *)sub_2487A6188();
  uint64_t v17 = sub_2487A6038();
  unint64_t v19 = v18;

  uint64_t v20 = HIBYTE(v19) & 0xF;
  uint64_t v21 = v17 & 0xFFFFFFFFFFFFLL;
  if ((v19 & 0x2000000000000000) != 0) {
    uint64_t v22 = HIBYTE(v19) & 0xF;
  }
  else {
    uint64_t v22 = v17 & 0xFFFFFFFFFFFFLL;
  }
  if (!v22)
  {
    swift_bridgeObjectRelease();
    goto LABEL_68;
  }
  if ((v19 & 0x1000000000000000) != 0)
  {
    uint64_t v35 = (uint64_t)sub_248781C20(v17, v19, 10);
    char v66 = v65;
    swift_bridgeObjectRelease();
    if ((v66 & 1) == 0) {
      goto LABEL_44;
    }
LABEL_68:
    id v67 = v12;
    unint64_t v68 = sub_2487A5F48();
    os_log_type_t v69 = sub_2487A6598();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = swift_slowAlloc();
      int v76 = (void *)swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      v81[0] = v78;
      *(_DWORD *)uint64_t v70 = 136315394;
      *id v13 = sub_2487A24A8(0xD00000000000001BLL, 0x80000002487A9740, v81);
      sub_2487A6698();
      *(_WORD *)(v70 + 12) = 2112;
      *id v13 = (uint64_t)v67;
      id v71 = v67;
      sub_2487A6698();
      void *v76 = v12;

      _os_log_impl(&dword_24876F000, v68, v69, "%s Unable to derive STAskForTimeAnswer from AskTo response. response: %@", (uint8_t *)v70, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v76, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v78, -1, -1);
      MEMORY[0x24C57FA90](v70, -1, -1);
    }
    else
    {
    }
    sub_248791B5C();
    swift_allocError();
    *uint64_t v72 = 1;
    swift_willThrow();

    goto LABEL_72;
  }
  if ((v19 & 0x2000000000000000) != 0)
  {
    v81[0] = v17;
    v81[1] = v19 & 0xFFFFFFFFFFFFFFLL;
    if (v17 == 43)
    {
      if (!v20) {
        goto LABEL_78;
      }
      if (v20 != 1 && (BYTE1(v17) - 48) <= 9u)
      {
        uint64_t v35 = (BYTE1(v17) - 48);
        if (v20 == 2) {
          goto LABEL_42;
        }
        if ((BYTE2(v17) - 48) <= 9u)
        {
          uint64_t v35 = 10 * (BYTE1(v17) - 48) + (BYTE2(v17) - 48);
          uint64_t v38 = v20 - 3;
          if (v38)
          {
            char v39 = (unsigned __int8 *)v81 + 3;
            while (1)
            {
              unsigned int v40 = *v39 - 48;
              if (v40 > 9) {
                goto LABEL_40;
              }
              uint64_t v41 = 10 * v35;
              if ((unsigned __int128)(v35 * (__int128)10) >> 64 != (10 * v35) >> 63) {
                goto LABEL_40;
              }
              uint64_t v35 = v41 + v40;
              if (__OFADD__(v41, v40)) {
                goto LABEL_40;
              }
              char v37 = 0;
              ++v39;
              if (!--v38) {
                goto LABEL_43;
              }
            }
          }
          goto LABEL_42;
        }
      }
    }
    else
    {
      if (v17 == 45)
      {
        if (v20)
        {
          if (v20 == 1 || (BYTE1(v17) - 48) > 9u) {
            goto LABEL_40;
          }
          if (v20 == 2)
          {
            char v37 = 0;
            uint64_t v35 = -(uint64_t)(BYTE1(v17) - 48);
            goto LABEL_43;
          }
          if ((BYTE2(v17) - 48) > 9u) {
            goto LABEL_40;
          }
          uint64_t v35 = -10 * (BYTE1(v17) - 48) - (BYTE2(v17) - 48);
          uint64_t v61 = v20 - 3;
          if (v61)
          {
            char v62 = (unsigned __int8 *)v81 + 3;
            while (1)
            {
              unsigned int v63 = *v62 - 48;
              if (v63 > 9) {
                goto LABEL_40;
              }
              uint64_t v64 = 10 * v35;
              if ((unsigned __int128)(v35 * (__int128)10) >> 64 != (10 * v35) >> 63) {
                goto LABEL_40;
              }
              uint64_t v35 = v64 - v63;
              if (__OFSUB__(v64, v63)) {
                goto LABEL_40;
              }
              char v37 = 0;
              ++v62;
              if (!--v61) {
                goto LABEL_43;
              }
            }
          }
LABEL_42:
          char v37 = 0;
          goto LABEL_43;
        }
        __break(1u);
LABEL_78:
        __break(1u);
      }
      if (v20 && (v17 - 48) <= 9u)
      {
        uint64_t v35 = (v17 - 48);
        if (v20 == 1) {
          goto LABEL_42;
        }
        if ((BYTE1(v17) - 48) <= 9u)
        {
          uint64_t v35 = 10 * (v17 - 48) + (BYTE1(v17) - 48);
          uint64_t v57 = v20 - 2;
          if (v57)
          {
            os_log_type_t v58 = (unsigned __int8 *)v81 + 2;
            while (1)
            {
              unsigned int v59 = *v58 - 48;
              if (v59 > 9) {
                goto LABEL_40;
              }
              uint64_t v60 = 10 * v35;
              if ((unsigned __int128)(v35 * (__int128)10) >> 64 != (10 * v35) >> 63) {
                goto LABEL_40;
              }
              uint64_t v35 = v60 + v59;
              if (__OFADD__(v60, v59)) {
                goto LABEL_40;
              }
              char v37 = 0;
              ++v58;
              if (!--v57) {
                goto LABEL_43;
              }
            }
          }
          goto LABEL_42;
        }
      }
    }
LABEL_40:
    uint64_t v35 = 0;
    char v37 = 1;
    goto LABEL_43;
  }
  if ((v17 & 0x1000000000000000) != 0) {
    int64_t v23 = (unsigned __int8 *)((v19 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    int64_t v23 = (unsigned __int8 *)sub_2487A6798();
  }
  uint64_t v35 = (uint64_t)sub_248781C08(v23, v21, 10);
  char v37 = v36 & 1;
LABEL_43:
  swift_bridgeObjectRelease();
  if (v37) {
    goto LABEL_68;
  }
LABEL_44:
  sub_2487A62D8();
  uint64_t v42 = (void *)sub_2487A62F8();
  uint64_t v43 = (void *)sub_2487A6008();

  sub_2487A6288();
  swift_bridgeObjectRelease();
  uint64_t v44 = (void *)sub_2487A6198();
  sub_2487A5FB8();

  uint64_t v45 = (void *)sub_2487A63A8();
  swift_bridgeObjectRelease();
  *((void *)v0 + 2) = 0;
  unsigned int v46 = objc_msgSend(v79, sel_respondToAskForTimeRequestWithIdentifier_answer_error_, v45, v35, v0 + 16);

  os_log_type_t v47 = (void *)*((void *)v0 + 2);
  if (v46)
  {
    id v77 = v12;
    id v48 = v47;
    uint64_t v49 = sub_2487A5F48();
    os_log_type_t v50 = sub_2487A65B8();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      os_log_t log = (os_log_t)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      v81[0] = v75;
      *(_DWORD *)uint64_t v51 = 136315394;
      *id v13 = sub_2487A24A8(0xD00000000000001BLL, 0x80000002487A9740, v81);
      sub_2487A6698();
      *(_WORD *)(v51 + 12) = 2112;
      *((void *)v0 + 2) = v77;
      id v52 = v77;
      sub_2487A6698();
      log->isa = (Class)v12;

      _os_log_impl(&dword_24876F000, v49, v50, "%s Updated ScreenTime with response. response: %@", (uint8_t *)v51, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](log, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v75, -1, -1);
      MEMORY[0x24C57FA90](v51, -1, -1);
    }
    else
    {
    }
    sub_2487A62D8();
    uint64_t v54 = (void *)sub_2487A62F8();
    unint64_t v55 = (void *)sub_2487A6008();

    sub_2487A6288();
    swift_bridgeObjectRelease();
    unint64_t v56 = (uint64_t (*)(void))*((void *)v0 + 1);
    goto LABEL_73;
  }
  id v53 = v47;
  sub_2487A5DF8();

  swift_willThrow();
LABEL_72:
  unint64_t v56 = (uint64_t (*)(void))*((void *)v0 + 1);
LABEL_73:
  return v56();
}

unint64_t sub_248791B5C()
{
  unint64_t result = qword_269327810;
  if (!qword_269327810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327810);
  }
  return result;
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScreenTimeResponseTask(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && a1[4]) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeResponseTask(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_DWORD *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 4) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 4) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeResponseTask()
{
  return &type metadata for ScreenTimeResponseTask;
}

uint64_t getEnumTagSinglePayload for AppExtension(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ScreenTimeResponseTask.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x248791DACLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_248791DD4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeResponseTask.Error()
{
  return &type metadata for ScreenTimeResponseTask.Error;
}

unint64_t sub_248791DF8()
{
  unint64_t result = qword_269327818;
  if (!qword_269327818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327818);
  }
  return result;
}

id sub_248791E4C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IDSRelay()), sel_init);
  qword_2693292D0 = (uint64_t)result;
  return result;
}

void sub_248791E7C()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v1 = OBJC_IVAR____TtC11AskToDaemon8IDSRelay_pendingSendCompletions;
  uint64_t v22 = v0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v0[v1] = sub_24878E220(MEMORY[0x263F8EE78]);
  sub_2487741E0(0, &qword_2693278F8);
  uint64_t v3 = sub_2487A6168();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2487A6148();
  uint64_t v4 = sub_2487A6638();
  MEMORY[0x270FA5388](v4);
  uint64_t v24 = v2;
  sub_24879710C(&qword_269327900, MEMORY[0x270FCDD30]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327908);
  sub_248797154(&qword_269327910, &qword_269327908);
  sub_2487A66D8();
  uint64_t v5 = sub_2487A65F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  unint64_t v21 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  unsigned int v20 = *MEMORY[0x263F8F140];
  unint64_t v19 = *(void (**)(char *))(v6 + 104);
  v19((char *)&v16 - v21);
  uint64_t v8 = sub_2487A6648();
  unint64_t v9 = v22;
  *(void *)&v22[OBJC_IVAR____TtC11AskToDaemon8IDSRelay_listenerQueue] = v8;
  uint64_t v18 = sub_2487741E0(0, &qword_269327918);
  MEMORY[0x270FA5388](v18);
  sub_2487A6148();
  uint64_t v10 = sub_2487A6618();
  MEMORY[0x270FA5388](v10);
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_24879710C(&qword_269327920, MEMORY[0x270FCDD10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327928);
  sub_248797154(&qword_269327930, &qword_269327928);
  uint64_t v11 = sub_2487A66D8();
  MEMORY[0x270FA5388](v11);
  ((void (*)(char *, void, uint64_t))v19)((char *)&v16 - v21, v20, v5);
  *(void *)&v9[OBJC_IVAR____TtC11AskToDaemon8IDSRelay_senderQueue] = sub_2487A6628();
  id v12 = objc_allocWithZone(MEMORY[0x263F4A0C0]);
  id v13 = (void *)sub_2487A63A8();
  id v14 = objc_msgSend(v12, sel_initWithService_, v13);

  if (v14)
  {
    *(void *)&v9[OBJC_IVAR____TtC11AskToDaemon8IDSRelay_service] = v14;

    v23.receiver = v9;
    v23.super_class = ObjectType;
    unsigned __int8 v15 = (char *)objc_msgSendSuper2(&v23, sel_init);
    objc_msgSend(*(id *)&v15[OBJC_IVAR____TtC11AskToDaemon8IDSRelay_service], sel_addDelegate_queue_, v15, *(void *)&v15[OBJC_IVAR____TtC11AskToDaemon8IDSRelay_listenerQueue]);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_248792338(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327938);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_24879269C(a3, a4, a5, (void (*)(void, void *))sub_248797238, v13);
  return swift_release();
}

uint64_t sub_248792498(int a1, id a2)
{
  if (a2)
  {
    id v3 = a2;
    if (qword_269327258 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2487A5F68();
    __swift_project_value_buffer(v4, (uint64_t)qword_269329260);
    id v5 = a2;
    id v6 = a2;
    uint64_t v7 = sub_2487A5F48();
    os_log_type_t v8 = sub_2487A6598();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      id v11 = a2;
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      sub_2487A6698();
      *uint64_t v10 = v13;

      _os_log_impl(&dword_24876F000, v7, v8, "Could not fetch valid destinations. Error: %@", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v10, -1, -1);
      MEMORY[0x24C57FA90](v9, -1, -1);
    }
    else
    {
    }
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327938);
  return sub_2487A6528();
}

void sub_24879269C(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void, void *), uint64_t a5)
{
  if (qword_269327258 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2487A5F68();
  __swift_project_value_buffer(v7, (uint64_t)qword_269329260);
  swift_bridgeObjectRetain_n();
  os_log_type_t v8 = sub_2487A5F48();
  os_log_type_t v9 = sub_2487A65B8();
  uint64_t v45 = a4;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327A50);
    uint64_t v13 = MEMORY[0x24C57EEE0](a1, v12);
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v47 = sub_2487A24A8(v13, v15, aBlock);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v8, v9, "Validating destinations for sending. destinations: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v11, -1, -1);
    MEMORY[0x24C57FA90](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_2487A67E8();
    swift_bridgeObjectRelease();
    if (v35) {
      goto LABEL_8;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_8:
    id v16 = objc_msgSend(self, sel_sharedInstance);
    uint64_t v17 = v16;
    if (v16)
    {
      id v41 = v16;
      sub_2487980BC(a1);
      uint64_t v18 = (void *)sub_2487A64A8();
      swift_bridgeObjectRelease();
      unint64_t v19 = (void *)sub_2487A63A8();
      unsigned int v20 = (void *)sub_2487A63A8();
      uint64_t v43 = *(void *)(v42 + OBJC_IVAR____TtC11AskToDaemon8IDSRelay_senderQueue);
      unint64_t v21 = (void *)swift_allocObject();
      v21[2] = a1;
      v21[3] = v45;
      v21[4] = a5;
      aBlock[4] = (uint64_t)sub_248797358;
      aBlock[5] = (uint64_t)v21;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_248793F94;
      aBlock[3] = (uint64_t)&block_descriptor_6;
      uint64_t v22 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      sub_2487909E4((uint64_t)v45);
      swift_release();
      unsigned __int8 v23 = objc_msgSend(v41, sel_refreshIDStatusForDestinations_service_listenerID_queue_completionBlock_, v18, v19, v20, v43, v22);
      _Block_release(v22);

      if (v23)
      {

        return;
      }
    }
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_2487A5F48();
    os_log_type_t v25 = sub_2487A6598();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      aBlock[0] = v27;
      *(_DWORD *)os_log_type_t v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327A50);
      uint64_t v29 = MEMORY[0x24C57EEE0](a1, v28);
      unint64_t v31 = v30;
      swift_bridgeObjectRelease();
      uint64_t v47 = sub_2487A24A8(v29, v31, aBlock);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v24, v25, "Failed to perform IDQuery {destinations: %s}", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v27, -1, -1);
      MEMORY[0x24C57FA90](v26, -1, -1);

      id v32 = v45;
      if (v45)
      {
LABEL_13:
        sub_2487972BC();
        uint64_t v33 = (void *)swift_allocError();
        *uint64_t v34 = 4;
        v32(MEMORY[0x263F8EE88], v33);

LABEL_21:
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      id v32 = v45;
      if (v45) {
        goto LABEL_13;
      }
    }

    return;
  }
  char v36 = sub_2487A5F48();
  os_log_type_t v37 = sub_2487A6598();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v47 = sub_2487A24A8(0xD000000000000039, 0x80000002487A99B0, aBlock);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v36, v37, "%s called with no destinations", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v39, -1, -1);
    MEMORY[0x24C57FA90](v38, -1, -1);
  }

  if (v45)
  {
    sub_2487972BC();
    uint64_t v33 = (void *)swift_allocError();
    unsigned char *v40 = 0;
    v45(MEMORY[0x263F8EE88], v33);
    goto LABEL_21;
  }
}

void sub_248792D68(uint64_t a1, unint64_t a2, long long *a3)
{
  if (!a1)
  {
    if (qword_269327258 != -1) {
LABEL_64:
    }
      swift_once();
    uint64_t v37 = sub_2487A5F68();
    __swift_project_value_buffer(v37, (uint64_t)qword_269329260);
    swift_bridgeObjectRetain_n();
    uint64_t v38 = sub_2487A5F48();
    os_log_type_t v39 = sub_2487A6598();
    if (os_log_type_enabled(v38, v39))
    {
      unsigned int v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(void *)&long long v73 = v41;
      *(_DWORD *)unsigned int v40 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327A50);
      uint64_t v43 = MEMORY[0x24C57EEE0](a2, v42);
      unint64_t v45 = v44;
      swift_bridgeObjectRelease();
      *(void *)&long long v68 = sub_2487A24A8(v43, v45, (uint64_t *)&v73);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v38, v39, "Result for ID query was nil. destinations: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v41, -1, -1);
      MEMORY[0x24C57FA90](v40, -1, -1);

      if (!a3) {
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (!a3) {
        return;
      }
    }
    sub_2487972BC();
    id v52 = (void *)swift_allocError();
    unsigned char *v53 = 2;
    uint64_t v54 = MEMORY[0x263F8EE88];
    unint64_t v55 = v52;
    goto LABEL_61;
  }
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_2487937F0(v5);
  if (!v6)
  {
    if (qword_269327258 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_2487A5F68();
    __swift_project_value_buffer(v46, (uint64_t)qword_269329260);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_2487A5F48();
    os_log_type_t v48 = sub_2487A6598();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      v67[0] = v50;
      *(_DWORD *)uint64_t v49 = 136315394;
      uint64_t v51 = swift_bridgeObjectRetain();
      sub_248793728(v51, (uint64_t)&v73);
      swift_bridgeObjectRelease();
      if (*((void *)&v74 + 1))
      {
        sub_2487970FC(v76, &v68);
        sub_24879737C((uint64_t)&v73);
      }
      else
      {
        sub_248784D84((uint64_t)&v73, (uint64_t *)&unk_269327950);
        long long v68 = 0u;
        long long v69 = 0u;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327800);
      uint64_t v56 = sub_2487A63C8();
      *(void *)&long long v73 = sub_2487A24A8(v56, v57, v67);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327A50);
      uint64_t v59 = MEMORY[0x24C57EEE0](a2, v58);
      unint64_t v61 = v60;
      swift_bridgeObjectRelease();
      *(void *)&long long v73 = sub_2487A24A8(v59, v61, v67);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v47, v48, "Result for ID query value type was not Int. first result value: %s, destinations: %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v50, -1, -1);
      MEMORY[0x24C57FA90](v49, -1, -1);

      if (!a3) {
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      if (!a3) {
        return;
      }
    }
    sub_2487972BC();
    id v52 = (void *)swift_allocError();
    *char v62 = 1;
    uint64_t v54 = MEMORY[0x263F8EE88];
    unint64_t v55 = v52;
LABEL_61:
    ((void (*)(uint64_t, void *))a3)(v54, v55);

    return;
  }
  uint64_t v7 = v6;
  unsigned int v63 = a3;
  a3 = &v73;
  swift_bridgeObjectRelease();
  int64_t v8 = 0;
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v64 = v7 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v72 = MEMORY[0x263F8EE88];
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  a2 = v11 & v9;
  int64_t v65 = (unint64_t)(v10 + 63) >> 6;
  unint64_t v12 = 0x269327000uLL;
  while (1)
  {
    if (a2)
    {
      unint64_t v13 = __clz(__rbit64(a2));
      a2 &= a2 - 1;
      unint64_t v14 = v13 | (v8 << 6);
LABEL_12:
      sub_248797044(*(void *)(v7 + 48) + 40 * v14, (uint64_t)&v68);
      uint64_t v15 = *(void *)(*(void *)(v7 + 56) + 8 * v14);
      goto LABEL_31;
    }
    int64_t v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_64;
    }
    if (v16 < v65)
    {
      unint64_t v17 = *(void *)(v64 + 8 * v16);
      if (v17) {
        goto LABEL_16;
      }
      int64_t v18 = v8 + 2;
      ++v8;
      if (v16 + 1 < v65)
      {
        unint64_t v17 = *(void *)(v64 + 8 * v18);
        if (v17) {
          goto LABEL_19;
        }
        int64_t v8 = v16 + 1;
        if (v16 + 2 < v65)
        {
          unint64_t v17 = *(void *)(v64 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_16;
          }
          int64_t v18 = v16 + 3;
          int64_t v8 = v16 + 2;
          if (v16 + 3 < v65) {
            break;
          }
        }
      }
    }
LABEL_30:
    uint64_t v15 = 0;
    a2 = 0;
    uint64_t v70 = 0;
    long long v68 = 0u;
    long long v69 = 0u;
LABEL_31:
    uint64_t v71 = v15;
    sub_2487973D0((uint64_t)&v68, (uint64_t)&v73);
    if (!*((void *)&v74 + 1))
    {
      swift_release();
      if (v63) {
        ((void (*)(uint64_t, void))v63)(v72, 0);
      }
      swift_bridgeObjectRelease();
      return;
    }
    long long v68 = v73;
    long long v69 = v74;
    uint64_t v19 = *(void *)&v76[0];
    uint64_t v70 = v75;
    uint64_t v20 = *(void *)(v12 + 600);
    if (*(void *)&v76[0] == 1)
    {
      if (v20 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_2487A5F68();
      __swift_project_value_buffer(v21, (uint64_t)qword_269329260);
      sub_248797044((uint64_t)&v68, (uint64_t)v67);
      uint64_t v22 = sub_2487A5F48();
      os_log_type_t v23 = sub_2487A65B8();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        v66[0] = v25;
        *(_DWORD *)uint64_t v24 = 136315138;
        uint64_t v26 = sub_2487A66F8();
        *(void *)(v24 + 4) = sub_2487A24A8(v26, v27, v66);
        swift_bridgeObjectRelease();
        sub_24879737C((uint64_t)v67);
        _os_log_impl(&dword_24876F000, v22, v23, "Status for destination %s is valid. Adding to list of destinations to send message to.", (uint8_t *)v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v25, -1, -1);
        uint64_t v28 = v24;
        unint64_t v12 = 0x269327000;
        MEMORY[0x24C57FA90](v28, -1, -1);
      }
      else
      {
        sub_24879737C((uint64_t)v67);
      }

      sub_248797044((uint64_t)&v68, (uint64_t)v66);
      sub_2487944E0((uint64_t)v67, (uint64_t)v66);
      goto LABEL_8;
    }
    if (v20 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_2487A5F68();
    __swift_project_value_buffer(v29, (uint64_t)qword_269329260);
    sub_248797044((uint64_t)&v68, (uint64_t)v67);
    unint64_t v30 = sub_2487A5F48();
    os_log_type_t v31 = sub_2487A65B8();
    if (!os_log_type_enabled(v30, v31))
    {

LABEL_8:
      sub_24879737C((uint64_t)v67);
      goto LABEL_9;
    }
    uint64_t v32 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    v66[0] = v33;
    *(_DWORD *)uint64_t v32 = 136315394;
    uint64_t v34 = sub_2487A66F8();
    *(void *)(v32 + 4) = sub_2487A24A8(v34, v35, v66);
    swift_bridgeObjectRelease();
    sub_24879737C((uint64_t)v67);
    *(_WORD *)(v32 + 12) = 2048;
    *(void *)(v32 + 14) = v19;
    _os_log_impl(&dword_24876F000, v30, v31, "Status for destination %s is %ld. Not sending message to this destination.", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v33, -1, -1);
    uint64_t v36 = v32;
    unint64_t v12 = 0x269327000;
    MEMORY[0x24C57FA90](v36, -1, -1);

LABEL_9:
    sub_24879737C((uint64_t)&v68);
  }
  unint64_t v17 = *(void *)(v64 + 8 * v18);
  if (v17)
  {
LABEL_19:
    int64_t v16 = v18;
LABEL_16:
    a2 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v8 = v16;
    goto LABEL_12;
  }
  while (1)
  {
    int64_t v16 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v16 >= v65)
    {
      int64_t v8 = v65 - 1;
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v64 + 8 * v16);
    ++v18;
    if (v17) {
      goto LABEL_16;
    }
  }
  __break(1u);
}

uint64_t sub_248793728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_248794EF8(a1);
  if (v6) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    *(void *)(a2 + 64) = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    sub_248794F80((uint64_t)v7, (uint64_t)v8, result, v5, 0, a1);
    sub_248797044((uint64_t)v7, a2);
    sub_2487970A0((uint64_t)v8, a2 + 40);
    return sub_248784D84((uint64_t)v7, &qword_2693278F0);
  }
  return result;
}

uint64_t sub_2487937F0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327970);
    uint64_t v2 = sub_2487A6818();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v25 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v24 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v11 = (v5 - 1) & v5;
      unint64_t v12 = __clz(__rbit64(v5)) | (v8 << 6);
      int64_t v13 = v8;
      goto LABEL_28;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v14 >= v24) {
      goto LABEL_39;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v14);
    int64_t v13 = v8 + 1;
    if (!v15)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v24) {
        goto LABEL_39;
      }
      unint64_t v15 = *(void *)(v25 + 8 * v13);
      if (!v15)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v24) {
          goto LABEL_39;
        }
        unint64_t v15 = *(void *)(v25 + 8 * v13);
        if (!v15)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v24) {
            goto LABEL_39;
          }
          unint64_t v15 = *(void *)(v25 + 8 * v13);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
LABEL_28:
    sub_248797044(*(void *)(a1 + 48) + 40 * v12, (uint64_t)v34);
    sub_2487970A0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v35);
    sub_248797044((uint64_t)v34, (uint64_t)&v28);
    sub_2487970A0((uint64_t)v35, (uint64_t)v27);
    sub_248784D84((uint64_t)v34, &qword_2693278F0);
    if (!swift_dynamicCast())
    {
      sub_24879737C((uint64_t)&v28);
      swift_release();
      sub_248777330();
      swift_release();
      return 0;
    }
    long long v31 = v28;
    long long v32 = v29;
    uint64_t v33 = v30;
    uint64_t result = sub_2487A6708();
    uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v6 + 8 * v19);
      }
      while (v23 == -1);
      unint64_t v9 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    *(void *)(*(void *)(v2 + 56) + 8 * v9) = v26;
    ++*(void *)(v2 + 16);
    int64_t v8 = v13;
    unint64_t v5 = v11;
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v24)
  {
LABEL_39:
    swift_release();
    sub_248777330();
    return v2;
  }
  unint64_t v15 = *(void *)(v25 + 8 * v16);
  if (v15)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v13 >= v24) {
      goto LABEL_39;
    }
    unint64_t v15 = *(void *)(v25 + 8 * v13);
    ++v16;
    if (v15) {
      goto LABEL_27;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

unint64_t sub_248793BC0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693278E8);
    uint64_t v2 = (void *)sub_2487A6818();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_248777330();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_248797044(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_2487970A0(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_248797044((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_248784D84((uint64_t)v30, &qword_2693278F0);
      swift_bridgeObjectRelease();
      sub_248777330();
      swift_release();
      return 0;
    }
    sub_2487970A0((uint64_t)v31 + 8, (uint64_t)v25);
    sub_248784D84((uint64_t)v30, &qword_2693278F0);
    sub_2487970FC(v25, v26);
    long long v27 = v24;
    sub_2487970FC(v26, v28);
    long long v16 = v27;
    sub_2487970FC(v28, v29);
    sub_2487970FC(v29, &v27);
    unint64_t result = sub_24878E5F4(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      int64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *int64_t v8 = v16;
      unint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      unint64_t result = (unint64_t)sub_2487970FC(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_2487970FC(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_248793F94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_2487A6338();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  v2(v3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_248794024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int64_t v12 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v12;
  *int64_t v12 = v8;
  v12[1] = sub_24878CD14;
  v12[4] = a7;
  v12[5] = a8;
  v12[3] = a5;
  return MEMORY[0x270FA2498](sub_248795048, 0, 0);
}

uint64_t sub_2487940E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487A6548();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2487A6538();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_248784D84(a1, &qword_2693278B0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2487A6508();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t type metadata accessor for IDSRelay()
{
  return self;
}

uint64_t sub_2487944E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2487A6708();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    while (1)
    {
      sub_248797044(*(void *)(v6 + 48) + 40 * v9, (uint64_t)v16);
      char v11 = MEMORY[0x24C57F130](v16, a2);
      sub_24879737C((uint64_t)v16);
      if (v11) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    sub_24879737C(a2);
    sub_248797044(*(void *)(*v3 + 48) + 40 * v9, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_248797044(a2, (uint64_t)v16);
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_248794928((uint64_t)v16, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v15;
    swift_bridgeObjectRelease();
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_24879465C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327968);
  uint64_t v3 = sub_2487A6738();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v16 = v15 | (v12 << 6);
      }
      else
      {
        int64_t v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9) {
          goto LABEL_33;
        }
        unint64_t v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          int64_t v12 = v17 + 1;
          if (v17 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v18 = v6[v12];
          if (!v18)
          {
            int64_t v12 = v17 + 2;
            if (v17 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v18 = v6[v12];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v12 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v6[v12];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      uint64_t v20 = *(void *)(v2 + 48) + 40 * v16;
      long long v29 = *(_OWORD *)v20;
      long long v30 = *(_OWORD *)(v20 + 16);
      uint64_t v31 = *(void *)(v20 + 32);
      uint64_t result = sub_2487A6708();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
      *(_OWORD *)uint64_t v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(void *)(v14 + 32) = v31;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_248794928(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24879465C();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_248794A94();
      goto LABEL_12;
    }
    sub_248794C64();
  }
  uint64_t v9 = *v3;
  uint64_t result = sub_2487A6708();
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    do
    {
      sub_248797044(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      char v12 = MEMORY[0x24C57F130](v19, v6);
      uint64_t result = sub_24879737C((uint64_t)v19);
      if (v12) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v13 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v14 = *(void *)(v13 + 48) + 40 * a2;
  long long v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = *(void *)(v6 + 32);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    *(void *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_2487A6898();
  __break(1u);
  return result;
}

void *sub_248794A94()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327968);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2487A6728();
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
    uint64_t v16 = 40 * v15;
    uint64_t result = (void *)sub_248797044(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

uint64_t sub_248794C64()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327968);
  uint64_t v3 = sub_2487A6738();
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_248797044(*(void *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    uint64_t result = sub_2487A6708();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
    long long v15 = v29[0];
    long long v16 = v29[1];
    *(void *)(v14 + 32) = v30;
    *(_OWORD *)uint64_t v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(void *)(v4 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_248794EF8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
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

uint64_t sub_248794F80(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  if (a3 < 0 || 1 << *(unsigned char *)(a6 + 32) <= a3)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a6 + 8 * ((unint64_t)a3 >> 6) + 64) >> a3) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a6 + 36) != a4)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  sub_248797044(*(void *)(a6 + 48) + 40 * a3, result);
  uint64_t v9 = *(void *)(a6 + 56) + 32 * a3;

  return sub_2487970A0(v9, a2);
}

uint64_t sub_248795024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_248795048, 0, 0);
}

uint64_t sub_248795048()
{
  long long v73 = v0;
  if (qword_269327258 != -1) {
    swift_once();
  }
  unint64_t v1 = v0 + 3;
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_269329260);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = v0[5];
  uint64_t v70 = v0 + 2;
  uint64_t v71 = v0;
  if (v5)
  {
    uint64_t v7 = v0[4];
    uint64_t v8 = swift_slowAlloc();
    buf = (uint8_t *)swift_slowAlloc();
    v72[0] = (uint64_t)buf;
    *(_DWORD *)uint64_t v8 = 136315394;
    swift_bridgeObjectRetain();
    v0[2] = sub_2487A24A8(v7, v6, v72);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2487A6348();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    v0[2] = sub_2487A24A8(v9, v11, v72);
    sub_2487A6698();
    unint64_t v1 = v0 + 3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v3, v4, "Swift received bridged message {fromID: %s, message: %s}", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](buf, -1, -1);
    MEMORY[0x24C57FA90](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  if (!sub_248793BC0(*v1))
  {
    swift_bridgeObjectRetain_n();
    unint64_t v13 = sub_2487A5F48();
    os_log_type_t v14 = sub_2487A6598();
    if (os_log_type_enabled(v13, v14))
    {
      long long v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v72[0] = v16;
      *(_DWORD *)long long v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_2487A6348();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      *uint64_t v70 = sub_2487A24A8(v17, v19, v72);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v13, v14, "Message was not of type [String: Any]. Bailing receive. message: %s", v15, 0xCu);
      swift_arrayDestroy();
      uint64_t v20 = v16;
LABEL_15:
      MEMORY[0x24C57FA90](v20, -1, -1);
      MEMORY[0x24C57FA90](v15, -1, -1);
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  sub_2487A6318();
  swift_bridgeObjectRetain();
  int64_t v12 = (void *)sub_2487A62E8();
  int64_t v21 = v12;
  if (!v12)
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_2487A5F48();
    os_log_type_t v28 = sub_2487A6598();
    if (os_log_type_enabled(v13, v28))
    {
      long long v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v72[0] = v29;
      *(_DWORD *)long long v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_2487A6348();
      unint64_t v32 = v31;
      swift_bridgeObjectRelease();
      *uint64_t v70 = sub_2487A24A8(v30, v32, v72);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v13, v28, "Failed to derive ATPayload from IDS message: %s", v15, 0xCu);
      swift_arrayDestroy();
      uint64_t v20 = v29;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  id v22 = v12;
  swift_bridgeObjectRelease();
  id v23 = v22;
  unint64_t v24 = sub_2487A5F48();
  os_log_type_t v25 = sub_2487A65B8();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    bufa = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v26 = 138412290;
    *uint64_t v70 = (uint64_t)v23;
    id v27 = v23;
    sub_2487A6698();
    *(void *)bufa = v21;

    _os_log_impl(&dword_24876F000, v24, v25, "Got ATPayload from IDS message: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](bufa, -1, -1);
    MEMORY[0x24C57FA90](v26, -1, -1);
  }
  else
  {
  }
  uint64_t v35 = (objc_class *)sub_2487A6308();
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = v35;
    uint64_t v38 = sub_2487A5F48();
    os_log_type_t v39 = sub_2487A65B8();
    if (os_log_type_enabled(v38, v39))
    {
      unsigned int v40 = v37;
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      os_log_t log = (os_log_t)swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 138412290;
      *uint64_t v70 = (uint64_t)v37;
      uint64_t v42 = v37;
      sub_2487A6698();
      log->isa = v36;

      uint64_t v37 = v40;
      _os_log_impl(&dword_24876F000, v38, v39, "Got ATResponse from IDS message: %@", v41, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](log, -1, -1);
      MEMORY[0x24C57FA90](v41, -1, -1);
    }
    else
    {
    }
    uint64_t v47 = sub_2487A62D8();
    if (!v48)
    {
      unint64_t v13 = sub_2487A5F48();
      os_log_type_t v64 = sub_2487A6598();
      if (os_log_type_enabled(v13, v64))
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v58 = 0;
        unint64_t v60 = "Couldn't launch client in response to IDS message because client bundle identifier was nil.";
        int64_t v65 = v13;
        os_log_type_t v59 = v64;
LABEL_45:
        _os_log_impl(&dword_24876F000, v65, v59, v60, v58, 2u);
        MEMORY[0x24C57FA90](v58, -1, -1);

        goto LABEL_46;
      }
LABEL_47:

      goto LABEL_17;
    }
    uint64_t v49 = v47;
    unint64_t v50 = v48;
    uint64_t v51 = qword_269327288;
    swift_bridgeObjectRetain();
    if (v51 != -1) {
      swift_once();
    }
    id v52 = off_269327798;
    if (*((void *)off_269327798 + 2))
    {
      unint64_t v53 = sub_24878E5F4(v49, v50);
      if (v54)
      {
        int v55 = *(unsigned __int8 *)(v52[7] + v53);
        swift_bridgeObjectRelease_n();
        unint64_t v13 = sub_2487A5F48();
        os_log_type_t v56 = sub_2487A65A8();
        BOOL v57 = os_log_type_enabled(v13, v56);
        if (v55 == 3)
        {
          if (v57)
          {
            uint64_t v58 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v58 = 0;
            os_log_type_t v59 = v56;
            unint64_t v60 = "Received ScreenTime response. Allowing ScreenTime to handle it through their own channels.";
LABEL_44:
            int64_t v65 = v13;
            goto LABEL_45;
          }
        }
        else if (v57)
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v58 = 0;
          os_log_type_t v59 = v56;
          unint64_t v60 = "Received response which comes from AskTo-owned process. This should never happen.";
          goto LABEL_44;
        }
        goto LABEL_47;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_2487A5F48();
    os_log_type_t v61 = sub_2487A6598();
    if (os_log_type_enabled(v13, v61))
    {
      char v62 = (uint8_t *)swift_slowAlloc();
      long long v69 = v37;
      uint64_t v63 = swift_slowAlloc();
      v72[0] = v63;
      *(_DWORD *)char v62 = 136315138;
      swift_bridgeObjectRetain();
      *uint64_t v70 = sub_2487A24A8(v49, v50, v72);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v13, v61, "Client with bundle identifier \"%s\" is not known. Dropping response.", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v63, -1, -1);
      MEMORY[0x24C57FA90](v62, -1, -1);

      goto LABEL_46;
    }

    goto LABEL_16;
  }
  id v43 = v23;
  unint64_t v13 = sub_2487A5F48();
  os_log_type_t v44 = sub_2487A6598();
  if (!os_log_type_enabled(v13, v44))
  {

    goto LABEL_17;
  }
  unint64_t v45 = (uint8_t *)swift_slowAlloc();
  uint64_t v46 = (void *)swift_slowAlloc();
  *(_DWORD *)unint64_t v45 = 138412290;
  *uint64_t v70 = (uint64_t)v43;
  id v23 = v43;
  sub_2487A6698();
  *uint64_t v46 = v21;

  _os_log_impl(&dword_24876F000, v13, v44, "Received payload, but it had no associated response: %@", v45, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
  swift_arrayDestroy();
  MEMORY[0x24C57FA90](v46, -1, -1);
  MEMORY[0x24C57FA90](v45, -1, -1);

LABEL_46:
LABEL_18:
  uint64_t v33 = (uint64_t (*)(void))v71[1];
  return v33();
}

void sub_248795E14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v50[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693278B0);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2487A5F68();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269327258 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_269329260);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_2487A5F48();
  int v48 = sub_2487A65B8();
  if (!os_log_type_enabled(v16, (os_log_type_t)v48))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    if (!a2)
    {
      unint64_t v26 = sub_2487A5F48();
      os_log_type_t v36 = sub_2487A6598();
      if (os_log_type_enabled(v26, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        v50[0] = v38;
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v49 = sub_2487A24A8(0xD000000000000032, 0x80000002487A98D0, v50);
        sub_2487A6698();
        os_log_type_t v39 = "IDS called %s with nil message.";
        goto LABEL_19;
      }
LABEL_21:

      return;
    }
    if (!a1)
    {
LABEL_15:
      unint64_t v26 = sub_2487A5F48();
      os_log_type_t v36 = sub_2487A6598();
      if (os_log_type_enabled(v26, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        v50[0] = v38;
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v49 = sub_2487A24A8(0xD000000000000032, 0x80000002487A98D0, v50);
        sub_2487A6698();
        os_log_type_t v39 = "IDS called %s with nil service.";
LABEL_19:
        _os_log_impl(&dword_24876F000, v26, v36, v39, v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v38, -1, -1);
        MEMORY[0x24C57FA90](v37, -1, -1);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
LABEL_8:
    if (a4)
    {
      uint64_t v21 = sub_2487A6548();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 1, 1, v21);
      id v22 = (void *)swift_allocObject();
      v22[2] = 0;
      v22[3] = 0;
      id v23 = v47;
      v22[4] = v47;
      v22[5] = a2;
      v22[6] = a1;
      v22[7] = a3;
      v22[8] = a4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v24 = a1;
      id v25 = v23;
      sub_2487940E4((uint64_t)v10, (uint64_t)&unk_2693278C0, (uint64_t)v22);
      swift_release();
      return;
    }
    unint64_t v26 = a1;
    id v27 = sub_2487A5F48();
    os_log_type_t v28 = sub_2487A6598();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v50[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      uint64_t v49 = sub_2487A24A8(0xD000000000000032, 0x80000002487A98D0, v50);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v27, v28, "IDS called %s with nil fromID.", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v30, -1, -1);
      MEMORY[0x24C57FA90](v29, -1, -1);

      return;
    }

    goto LABEL_21;
  }
  os_log_t v40 = v16;
  uint64_t v42 = v15;
  id v43 = v10;
  uint64_t v46 = a3;
  uint64_t v17 = swift_slowAlloc();
  unint64_t v18 = (void *)swift_slowAlloc();
  uint64_t v41 = swift_slowAlloc();
  v50[0] = v41;
  *(_DWORD *)uint64_t v17 = 138412546;
  uint64_t v19 = a4;
  if (a4)
  {
    sub_2487783D8();
    swift_allocError();
    *uint64_t v20 = v46;
    v20[1] = a4;
    swift_bridgeObjectRetain();
    a4 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v49 = a4;
  }
  else
  {
    uint64_t v49 = 0;
  }
  sub_2487A6698();
  uint64_t v44 = v19;
  unint64_t v45 = a1;
  *unint64_t v18 = a4;
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v17 + 12) = 2080;
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2487A6348();
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    uint64_t v49 = sub_2487A24A8(v31, v33, v50);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v34 = v40;
    _os_log_impl(&dword_24876F000, v40, (os_log_type_t)v48, "Received message {fromID: %@, message: %s}", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v18, -1, -1);
    uint64_t v35 = v41;
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v35, -1, -1);
    MEMORY[0x24C57FA90](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    a4 = v44;
    a1 = v45;
    a3 = v46;
    unint64_t v10 = v43;
    if (!v45) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  __break(1u);
}

void sub_2487965B8(uint64_t a1, unint64_t a2, char a3, void *a4)
{
  uint64_t v5 = v4;
  if (a2 && a4)
  {
    uint64_t v49 = v4;
    swift_bridgeObjectRetain();
    id v10 = a4;
    if (qword_269327258 != -1) {
      swift_once();
    }
    char v50 = a3;
    uint64_t v11 = sub_2487A5F68();
    __swift_project_value_buffer(v11, (uint64_t)qword_269329260);
    id v12 = a4;
    swift_bridgeObjectRetain();
    id v13 = a4;
    os_log_type_t v14 = sub_2487A5F48();
    os_log_type_t v15 = sub_2487A65B8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v48 = a1;
      uint64_t v17 = (void *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v51[0] = v18;
      *(_DWORD *)uint64_t v16 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_2487A24A8(v48, a2, v51);
      sub_2487A6698();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 1024;
      LODWORD(v52) = a3 & 1;
      sub_2487A6698();
      *(_WORD *)(v16 + 18) = 2112;
      id v19 = a4;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v52 = v20;
      sub_2487A6698();
      *uint64_t v17 = v20;

      _os_log_impl(&dword_24876F000, v14, v15, "Send message delegate callback {identifier: %s, success: %{BOOL}d, error: %@}", (uint8_t *)v16, 0x1Cu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      uint64_t v21 = v17;
      a1 = v48;
      MEMORY[0x24C57FA90](v21, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v18, -1, -1);
      MEMORY[0x24C57FA90](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v5 = v49;
    goto LABEL_18;
  }
  if (qword_269327258 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_2487A5F68();
  __swift_project_value_buffer(v22, (uint64_t)qword_269329260);
  id v23 = sub_2487A5F48();
  os_log_type_t v24 = sub_2487A65B8();
  if (os_log_type_enabled(v23, v24))
  {
    id v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v25 = 67109120;
    LODWORD(v51[0]) = a3 & 1;
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v23, v24, "Send message delegate callback {identifier: nil, success: %{BOOL}d, error: nil}", v25, 8u);
    MEMORY[0x24C57FA90](v25, -1, -1);
  }

  if (a2)
  {
    char v50 = a3;
LABEL_18:
    uint64_t v30 = (uint64_t *)(v5 + OBJC_IVAR____TtC11AskToDaemon8IDSRelay_pendingSendCompletions);
    swift_beginAccess();
    uint64_t v31 = *v30;
    uint64_t v32 = *(void *)(*v30 + 16);
    swift_bridgeObjectRetain();
    if (v32 && (unint64_t v33 = sub_24878E5F4(a1, a2), (v34 & 1) != 0))
    {
      uint64_t v35 = *(void (**)(uint64_t *, uint64_t *))(*(void *)(v31 + 56) + 16 * v33);
      swift_endAccess();
      uint64_t v36 = qword_269327258;
      swift_retain();
      if (v36 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_2487A5F68();
      __swift_project_value_buffer(v37, (uint64_t)qword_269329260);
      swift_bridgeObjectRetain_n();
      uint64_t v38 = sub_2487A5F48();
      os_log_type_t v39 = sub_2487A65B8();
      if (os_log_type_enabled(v38, v39))
      {
        os_log_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        v51[0] = v41;
        *(_DWORD *)os_log_t v40 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_2487A24A8(a1, a2, v51);
        sub_2487A6698();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v38, v39, "Calling completion for IDS message send identifier %s", v40, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v41, -1, -1);
        MEMORY[0x24C57FA90](v40, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      LOBYTE(v52) = v50 & 1;
      v51[0] = (uint64_t)a4;
      v35(&v52, v51);
      swift_release();
      swift_beginAccess();
      uint64_t v47 = sub_2487A0208(a1, a2);
      swift_endAccess();
      swift_bridgeObjectRelease();
      if (v47) {
        sub_248773FD8(v47);
      }
    }
    else
    {
      swift_endAccess();
      if (qword_269327258 != -1) {
        swift_once();
      }
      uint64_t v42 = sub_2487A5F68();
      __swift_project_value_buffer(v42, (uint64_t)qword_269329260);
      swift_bridgeObjectRetain();
      id v43 = sub_2487A5F48();
      os_log_type_t v44 = sub_2487A6598();
      if (os_log_type_enabled(v43, v44))
      {
        unint64_t v45 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        v51[0] = v46;
        *(_DWORD *)unint64_t v45 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_2487A24A8(a1, a2, v51);
        sub_2487A6698();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v43, v44, "Got delegate callback for message send from IDS, but completion for identifier %s was nil.", v45, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v46, -1, -1);
        MEMORY[0x24C57FA90](v45, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    return;
  }
  unint64_t v26 = sub_2487A5F48();
  os_log_type_t v27 = sub_2487A6598();
  if (os_log_type_enabled(v26, v27))
  {
    os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v51[0] = v29;
    *(_DWORD *)os_log_type_t v28 = 136315138;
    uint64_t v52 = sub_2487A24A8(0xD000000000000037, 0x80000002487A9890, v51);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v26, v27, "IDS called %s with nil identifier.", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v29, -1, -1);
    MEMORY[0x24C57FA90](v28, -1, -1);
  }
}

uint64_t sub_248796E20()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_248796E78(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_24877AE1C;
  return sub_248794024(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_248796F54()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_248796F8C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24878CD14;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2693278D0 + dword_2693278D0);
  return v6(a1, v4);
}

uint64_t sub_248797044(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2487970A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_2487970FC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24879710C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_248797154(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2487971A4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327938);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_248797238(int a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327938);

  return sub_248792498(a1, a2);
}

unint64_t sub_2487972BC()
{
  unint64_t result = qword_269327940;
  if (!qword_269327940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327940);
  }
  return result;
}

uint64_t sub_248797310()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_248797358(uint64_t a1)
{
  sub_248792D68(a1, *(void *)(v1 + 16), *(long long **)(v1 + 24));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_24879737C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2487973D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327960);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unsigned char *storeEnumTagSinglePayload for IDSRelay.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x248797504);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IDSRelay.Error()
{
  return &type metadata for IDSRelay.Error;
}

unint64_t sub_248797540()
{
  unint64_t result = qword_269327978;
  if (!qword_269327978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327978);
  }
  return result;
}

uint64_t sub_248797594()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2487975E0(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)v1 + 88) + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unsigned int v6 = (char *)v19 - v5;
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2487A5F68();
  __swift_project_value_buffer(v7, (uint64_t)qword_2693291E8);
  swift_unknownObjectRetain_n();
  uint64_t v8 = sub_2487A5F48();
  os_log_type_t v9 = sub_2487A65B8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v3;
    uint64_t v11 = v10;
    uint64_t v20 = swift_slowAlloc();
    v24[0] = v20;
    *(_DWORD *)uint64_t v11 = 136315394;
    v19[1] = v11 + 4;
    swift_getAssociatedTypeWitness();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    swift_getMetatypeMetadata();
    uint64_t v22 = v4;
    uint64_t v12 = sub_2487A63C8();
    uint64_t MetatypeMetadata = sub_2487A24A8(v12, v13, v24);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t MetatypeMetadata = a1;
    uint64_t v14 = sub_2487A6848();
    uint64_t MetatypeMetadata = sub_2487A24A8(v14, v15, v24);
    uint64_t v4 = v22;
    sub_2487A6698();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v8, v9, "%s connection invalidated. Removing client %s", (uint8_t *)v11, 0x16u);
    uint64_t v16 = v20;
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v16, -1, -1);
    MEMORY[0x24C57FA90](v11, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  v24[0] = a1;
  sub_2487A6778();
  swift_beginAccess();
  uint64_t v17 = AssociatedTypeWitness;
  swift_getAssociatedConformanceWitness();
  sub_2487A6378();
  sub_2487A6358();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  return swift_unknownObjectRelease();
}

uint64_t sub_248797984(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)v1 + 88) + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unsigned int v6 = (char *)v19 - v5;
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2487A5F68();
  __swift_project_value_buffer(v7, (uint64_t)qword_2693291E8);
  swift_unknownObjectRetain_n();
  uint64_t v8 = sub_2487A5F48();
  os_log_type_t v9 = sub_2487A65B8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v19[1] = AssociatedTypeWitness;
    uint64_t v11 = v10;
    uint64_t v12 = swift_slowAlloc();
    v19[3] = v3;
    v20[0] = v12;
    uint64_t v13 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    swift_getAssociatedTypeWitness();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    swift_getMetatypeMetadata();
    uint64_t v14 = sub_2487A63C8();
    void v19[2] = v6;
    uint64_t MetatypeMetadata = sub_2487A24A8(v14, v15, v20);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t MetatypeMetadata = a1;
    uint64_t v16 = sub_2487A6848();
    uint64_t MetatypeMetadata = sub_2487A24A8(v16, v17, v20);
    sub_2487A6698();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v8, v9, "%s connection activated. Tracking client %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v13, -1, -1);
    MEMORY[0x24C57FA90](v11, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  v20[0] = a1;
  sub_2487A6778();
  uint64_t MetatypeMetadata = a1;
  swift_beginAccess();
  swift_getAssociatedConformanceWitness();
  sub_2487A6378();
  swift_unknownObjectRetain();
  sub_2487A6388();
  return swift_endAccess();
}

uint64_t sub_248797CE0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ClientConnectionManager()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_248797D60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2487A5E88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487A5E78();
  unsigned int v6 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 16);
  uint64_t v15 = v2;
  uint64_t v16 = a1;
  v6(a1, v5, v2);
  void v14[3] = sub_2487741E0(0, (unint64_t *)&qword_269327A10);
  if (qword_269327298 != -1) {
    swift_once();
  }
  unint64_t v17 = 0xD000000000000014;
  unint64_t v18 = 0x80000002487A9A10;
  sub_2487A5E68();
  sub_2487A6408();
  swift_bridgeObjectRelease();
  v14[0] = v18;
  v14[1] = v17;
  uint64_t v7 = sub_2487A65F8();
  v14[2] = v14;
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, void))(v9 + 104))((char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F140]);
  uint64_t v10 = sub_2487A6168();
  MEMORY[0x270FA5388](v10 - 8);
  sub_2487A6158();
  uint64_t v11 = sub_2487A65E8();
  MEMORY[0x270FA5388](v11);
  unint64_t v17 = MEMORY[0x263F8EE78];
  sub_248798454();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327A20);
  sub_2487984A0();
  sub_2487A66D8();
  uint64_t v12 = sub_2487A6608();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v15);
  uint64_t result = type metadata accessor for IDSLookupController();
  *(void *)(v16 + *(int *)(result + 20)) = v12;
  return result;
}

uint64_t sub_2487980BC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2487A67E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = sub_248774050(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v3 = v12;
      do
      {
        MEMORY[0x24C57F1A0](v5, a1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269327A50);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_248774050(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_248774050(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v12;
        }
        ++v5;
        *(void *)(v3 + 16) = v7 + 1;
        sub_2487970FC(v11, (_OWORD *)(v3 + 32 * v7 + 32));
      }
      while (v2 != v5);
    }
    else
    {
      unint64_t v8 = a1 + 32;
      uint64_t v3 = v12;
      do
      {
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269327A50);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_248774050(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v10 = *(void *)(v3 + 16);
        unint64_t v9 = *(void *)(v3 + 24);
        if (v10 >= v9 >> 1)
        {
          sub_248774050(v9 > 1, v10 + 1, 1);
          uint64_t v3 = v12;
        }
        *(void *)(v3 + 16) = v10 + 1;
        sub_2487970FC(v11, (_OWORD *)(v3 + 32 * v10 + 32));
        v8 += 8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2487982FC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_248774050(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_248774050(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_248774050(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_2487970FC(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_248798424()
{
  qword_269327A00 = 0x6C7070612E6D6F63;
  *(void *)algn_269327A08 = 0xEF6F546B73412E65;
}

unint64_t sub_248798454()
{
  unint64_t result = qword_269327C60;
  if (!qword_269327C60)
  {
    sub_2487A65E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327C60);
  }
  return result;
}

unint64_t sub_2487984A0()
{
  unint64_t result = qword_269327C70;
  if (!qword_269327C70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_269327A20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327C70);
  }
  return result;
}

uint64_t type metadata accessor for IDSLookupController()
{
  uint64_t result = qword_269327AC8;
  if (!qword_269327AC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_248798548(uint64_t a1)
{
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = v1;
  return MEMORY[0x270FA2498](sub_248798568, 0, 0);
}

uint64_t sub_248798568()
{
  uint64_t v22 = v0;
  unint64_t v1 = v0[12];
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    if (qword_269327250 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2487A5F68();
    __swift_project_value_buffer(v13, (uint64_t)qword_269329248);
    uint64_t v14 = sub_2487A5F48();
    os_log_type_t v15 = sub_2487A6598();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_24876F000, v14, v15, "No family members to lookup, bailing early.", v16, 2u);
      MEMORY[0x24C57FA90](v16, -1, -1);
    }

    unint64_t v17 = sub_24878E114(MEMORY[0x263F8EE78]);
    unint64_t v18 = (uint64_t (*)(unint64_t))v0[1];
    return v18(v17);
  }
LABEL_13:
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2487A67E8();
  swift_bridgeObjectRelease();
  if (!v2) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v3 = v0[12];
  uint64_t v20 = MEMORY[0x263F8EE80];
  unint64_t v4 = v1 & 0xC000000000000001;
  uint64_t v5 = v3 + 32;
  swift_bridgeObjectRetain();
  unint64_t v1 = 0;
  do
  {
    if (v4) {
      id v6 = (id)MEMORY[0x24C57F1A0](v1, v0[12]);
    }
    else {
      id v6 = *(id *)(v5 + 8 * v1);
    }
    unint64_t v7 = v6;
    unint64_t v8 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    id v21 = v6;
    sub_24879959C(&v20, &v21);

    ++v1;
  }
  while (v8 != v2);
  swift_bridgeObjectRelease();
  v0[14] = v20;
  uint64_t v9 = swift_bridgeObjectRetain();
  unint64_t v10 = sub_24879BC68(v9);
  v0[15] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[16] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_248798850;
  uint64_t v12 = v0[13];
  v11[5] = v10;
  v11[6] = v12;
  return MEMORY[0x270FA2498](sub_248799AC4, 0, 0);
}

uint64_t sub_248798850(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (v1) {
    unint64_t v4 = sub_248799530;
  }
  else {
    unint64_t v4 = sub_248798964;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_248798964()
{
  uint64_t v80 = v0;
  if (!*(void *)(*(void *)(v0 + 136) + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_269327250 != -1) {
      goto LABEL_67;
    }
    goto LABEL_6;
  }
  swift_release();
  if (qword_269327250 != -1) {
LABEL_65:
  }
    swift_once();
  uint64_t v1 = sub_2487A5F68();
  __swift_project_value_buffer(v1, (uint64_t)qword_269329248);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_2487A5F48();
  os_log_type_t v3 = sub_2487A65B8();
  unint64_t v4 = &loc_2487A7000;
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v79 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_2487741E0(0, &qword_269327A68);
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2487A6368();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 80) = sub_2487A24A8(v7, v9, &v79);
    sub_2487A6698();
    unint64_t v4 = (void *)&loc_2487A7000;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v2, v3, "Got result keys: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v6, -1, -1);
    MEMORY[0x24C57FA90](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  long long v73 = (uint64_t *)(v0 + 64);
  uint64_t v72 = (uint64_t *)(v0 + 72);
  uint64_t v19 = *(void *)(v0 + 136);
  uint64_t v78 = *(void *)(v0 + 112);
  uint64_t v74 = (void *)v0;
  *(void *)(v0 + 64) = sub_24878E114(MEMORY[0x263F8EE78]);
  uint64_t v76 = v19 + 64;
  uint64_t v20 = -1;
  uint64_t v21 = -1 << *(unsigned char *)(v19 + 32);
  if (-v21 < 64) {
    uint64_t v20 = ~(-1 << -(char)v21);
  }
  unint64_t v22 = v20 & *(void *)(v19 + 64);
  int64_t v77 = (unint64_t)(63 - v21) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v0 = 0;
  uint64_t v23 = (SEL *)&unk_26523E000;
  int v75 = v4[124];
  while (v22)
  {
    unint64_t v24 = __clz(__rbit64(v22));
    v22 &= v22 - 1;
    unint64_t v25 = v24 | (v0 << 6);
LABEL_33:
    uint64_t v29 = (uint64_t *)(*(void *)(v19 + 48) + 16 * v25);
    uint64_t v31 = *v29;
    unint64_t v30 = v29[1];
    swift_bridgeObjectRetain();
    uint64_t v32 = (void *)sub_2487A63A8();
    id v33 = [v32 v23[93]];

    if (v33)
    {
      swift_bridgeObjectRelease();
      uint64_t v34 = sub_2487A63B8();
      unint64_t v36 = v35;

      if (!*(void *)(v78 + 16)) {
        goto LABEL_41;
      }
      swift_bridgeObjectRetain();
      unint64_t v37 = sub_24878E5F4(v34, v36);
      if (v38)
      {
        id v39 = *(id *)(*(void *)(v78 + 56) + 8 * v37);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        os_log_t v40 = sub_2487A5F48();
        os_log_type_t v41 = sub_2487A65B8();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = swift_slowAlloc();
          uint64_t v43 = swift_slowAlloc();
          uint64_t v79 = v43;
          *(_DWORD *)uint64_t v42 = v75;
          swift_bridgeObjectRetain();
          *(void *)(v42 + 4) = sub_2487A24A8(v34, v36, &v79);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24876F000, v40, v41, "%s is eligible to receive iMessages", (uint8_t *)v42, 0xCu);
          swift_arrayDestroy();
          uint64_t v44 = v43;
          uint64_t v23 = (SEL *)&unk_26523E000;
          MEMORY[0x24C57FA90](v44, -1, -1);
          MEMORY[0x24C57FA90](v42, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        uint64_t v51 = *v73;
        if (*(void *)(*v73 + 16))
        {
          id v52 = v39;
          unint64_t v53 = sub_24878E66C((uint64_t)v52);
          char v54 = (void *)MEMORY[0x263F8EE78];
          if (v55)
          {
            char v54 = *(void **)(*(void *)(v51 + 56) + 8 * v53);
            swift_bridgeObjectRetain();
          }
        }
        else
        {
          char v54 = (void *)MEMORY[0x263F8EE78];
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v54 = sub_24879FB50(0, v54[2] + 1, 1, v54);
        }
        unint64_t v57 = v54[2];
        unint64_t v56 = v54[3];
        if (v57 >= v56 >> 1) {
          char v54 = sub_24879FB50((void *)(v56 > 1), v57 + 1, 1, v54);
        }
        v54[2] = v57 + 1;
        uint64_t v58 = &v54[2 * v57];
        v58[4] = v34;
        v58[5] = v36;
        uint64_t v59 = *v73;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v79 = v59;
        *long long v73 = 0x8000000000000000;
        sub_2487A0810((uint64_t)v54, v39, isUniquelyReferenced_nonNull_native);
        *long long v73 = v79;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
LABEL_41:
        swift_bridgeObjectRetain();
        unint64_t v45 = sub_2487A5F48();
        os_log_type_t v49 = sub_2487A6598();
        if (!os_log_type_enabled(v45, v49)) {
          goto LABEL_12;
        }
        uint64_t v47 = swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        uint64_t v79 = v48;
        *(_DWORD *)uint64_t v47 = v75;
        swift_bridgeObjectRetain();
        *(void *)(v47 + 4) = sub_2487A24A8(v34, v36, &v79);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v45, v49, "Unable to find handle \"%s\" in handle to family member map.", (uint8_t *)v47, 0xCu);
LABEL_43:
        swift_arrayDestroy();
        uint64_t v50 = v48;
        uint64_t v23 = (SEL *)&unk_26523E000;
        MEMORY[0x24C57FA90](v50, -1, -1);
        MEMORY[0x24C57FA90](v47, -1, -1);
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v45 = sub_2487A5F48();
      os_log_type_t v46 = sub_2487A6598();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        uint64_t v79 = v48;
        *(_DWORD *)uint64_t v47 = v75;
        swift_bridgeObjectRetain();
        *(void *)(v47 + 4) = sub_2487A24A8(v31, v30, &v79);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v45, v46, "Could not get normalized handle for key: %s", (uint8_t *)v47, 0xCu);
        goto LABEL_43;
      }
LABEL_12:
      swift_bridgeObjectRelease_n();
    }
  }
  int64_t v26 = v0 + 1;
  if (__OFADD__(v0, 1))
  {
    __break(1u);
    goto LABEL_65;
  }
  if (v26 >= v77)
  {
LABEL_55:
    uint64_t v0 = (uint64_t)v74;
    swift_release();
    swift_bridgeObjectRelease();
    os_log_type_t v61 = sub_2487A5F48();
    os_log_type_t v62 = sub_2487A65B8();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      *(_DWORD *)uint64_t v63 = v75;
      uint64_t v79 = v64;
      swift_beginAccess();
      sub_2487741E0(0, (unint64_t *)&qword_269327670);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327AA0);
      sub_24879BD50();
      uint64_t v65 = sub_2487A6348();
      unint64_t v67 = v66;
      long long v68 = (unint64_t *)v73;
      uint64_t v0 = (uint64_t)v74;
      swift_bridgeObjectRelease();
      *uint64_t v72 = sub_2487A24A8(v65, v67, &v79);
      sub_2487A6698();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24876F000, v61, v62, "iMessageableHandles from IDS query controller: %s", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v64, -1, -1);
      MEMORY[0x24C57FA90](v63, -1, -1);

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();

      long long v68 = (unint64_t *)v73;
    }
    swift_beginAccess();
    unint64_t v69 = *v68;
    goto LABEL_61;
  }
  unint64_t v27 = *(void *)(v76 + 8 * v26);
  ++v0;
  if (v27) {
    goto LABEL_32;
  }
  uint64_t v0 = v26 + 1;
  if (v26 + 1 >= v77) {
    goto LABEL_55;
  }
  unint64_t v27 = *(void *)(v76 + 8 * v0);
  if (v27) {
    goto LABEL_32;
  }
  uint64_t v0 = v26 + 2;
  if (v26 + 2 >= v77) {
    goto LABEL_55;
  }
  unint64_t v27 = *(void *)(v76 + 8 * v0);
  if (v27) {
    goto LABEL_32;
  }
  uint64_t v0 = v26 + 3;
  if (v26 + 3 >= v77) {
    goto LABEL_55;
  }
  unint64_t v27 = *(void *)(v76 + 8 * v0);
  if (v27) {
    goto LABEL_32;
  }
  uint64_t v0 = v26 + 4;
  if (v26 + 4 >= v77) {
    goto LABEL_55;
  }
  unint64_t v27 = *(void *)(v76 + 8 * v0);
  if (v27)
  {
LABEL_32:
    unint64_t v22 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v0 << 6);
    goto LABEL_33;
  }
  int64_t v28 = v26 + 5;
  if (v28 >= v77) {
    goto LABEL_55;
  }
  unint64_t v27 = *(void *)(v76 + 8 * v28);
  if (v27)
  {
    uint64_t v0 = v28;
    goto LABEL_32;
  }
  while (1)
  {
    uint64_t v0 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v0 >= v77) {
      goto LABEL_55;
    }
    unint64_t v27 = *(void *)(v76 + 8 * v0);
    ++v28;
    if (v27) {
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_67:
  swift_once();
LABEL_6:
  uint64_t v10 = sub_2487A5F68();
  __swift_project_value_buffer(v10, (uint64_t)qword_269329248);
  swift_retain();
  uint64_t v11 = sub_2487A5F48();
  os_log_type_t v12 = sub_2487A65B8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v79 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v15 = swift_retain();
    uint64_t v16 = MEMORY[0x24C57EEE0](v15, MEMORY[0x263F8D310]);
    unint64_t v18 = v17;
    swift_release();
    *(void *)(v0 + 88) = sub_2487A24A8(v16, v18, &v79);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24876F000, v11, v12, "No results for ids lookup with destinations %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v14, -1, -1);
    MEMORY[0x24C57FA90](v13, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  unint64_t v69 = sub_24878E114(MEMORY[0x263F8EE78]);
LABEL_61:
  uint64_t v70 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v70(v69);
}

uint64_t sub_248799530()
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24879959C(uint64_t *a1, id *a2)
{
  uint64_t v51 = a1;
  id v48 = *a2;
  id v2 = objc_msgSend(v48, sel_appleID);
  if (v2)
  {
    unint64_t v4 = v2;
    uint64_t v5 = sub_2487A63B8();
    uint64_t v7 = v6;

    v50[0] = v5;
    v50[1] = v7;
    uint64_t v8 = sub_2487A5D18();
    uint64_t v9 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v8);
    uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2487A5D08();
    sub_24879BDAC();
    uint64_t v12 = sub_2487A66B8();
    unint64_t isUniquelyReferenced_nonNull_native = v13;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_bridgeObjectRelease();
    uint64_t v15 = HIBYTE(isUniquelyReferenced_nonNull_native) & 0xF;
    if ((isUniquelyReferenced_nonNull_native & 0x2000000000000000) == 0) {
      uint64_t v15 = v12 & 0xFFFFFFFFFFFFLL;
    }
    if (v15)
    {
      uint64_t v16 = sub_24879FB50(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v18 = (unint64_t *)v16[2];
      unint64_t v17 = v16[3];
      unint64_t v19 = (unint64_t)v18 + 1;
      if ((unint64_t)v18 >= v17 >> 1) {
LABEL_31:
      }
        uint64_t v16 = sub_24879FB50((void *)(v17 > 1), v19, 1, v16);
      _OWORD v16[2] = v19;
      uint64_t v20 = &v16[2 * (void)v18];
      v20[4] = v12;
      v20[5] = isUniquelyReferenced_nonNull_native;
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = (void *)MEMORY[0x263F8EE78];
LABEL_9:
  unint64_t v45 = v16;
  uint64_t v21 = v16[2];
  if (!v21) {
    return swift_bridgeObjectRelease();
  }
  unint64_t v18 = v45 + 5;
  *(void *)&long long v3 = 138412546;
  long long v47 = v3;
  uint64_t v46 = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    uint64_t v49 = v21;
    uint64_t v22 = *(v18 - 1);
    unint64_t v19 = *v18;
    swift_bridgeObjectRetain_n();
    id v23 = v48;
    unint64_t v24 = v51;
    unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v50[0] = *v24;
    uint64_t v12 = v50[0];
    *unint64_t v24 = 0x8000000000000000;
    unint64_t v26 = sub_24878E5F4(v22, v19);
    unint64_t v17 = *(void *)(v12 + 16);
    BOOL v27 = (v25 & 1) == 0;
    uint64_t v28 = v17 + v27;
    if (__OFADD__(v17, v27))
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    char v29 = v25;
    if (*(void *)(v12 + 24) < v28) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v12 = v50[0];
      if (v25) {
        goto LABEL_20;
      }
    }
    else
    {
      sub_24878F9FC();
      uint64_t v12 = v50[0];
      if (v29)
      {
LABEL_20:
        uint64_t v32 = *(void *)(v12 + 56);

        *(void *)(v32 + 8 * v26) = v23;
        goto LABEL_24;
      }
    }
LABEL_22:
    *(void *)(v12 + 8 * (v26 >> 6) + 64) |= 1 << v26;
    id v33 = (uint64_t *)(*(void *)(v12 + 48) + 16 * v26);
    *id v33 = v22;
    v33[1] = v19;
    *(void *)(*(void *)(v12 + 56) + 8 * v26) = v23;
    uint64_t v34 = *(void *)(v12 + 16);
    BOOL v35 = __OFADD__(v34, 1);
    unint64_t v17 = v34 + 1;
    if (v35) {
      goto LABEL_30;
    }
    *(void *)(v12 + 16) = v17;
    swift_bridgeObjectRetain();
LABEL_24:
    *uint64_t v51 = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_269327250 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_2487A5F68();
    __swift_project_value_buffer(v36, (uint64_t)qword_269329248);
    swift_bridgeObjectRetain();
    id v37 = v23;
    char v38 = sub_2487A5F48();
    os_log_type_t v39 = sub_2487A65B8();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      os_log_type_t v41 = (void *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v50[0] = v42;
      *(_DWORD *)uint64_t v40 = v47;
      *(void *)(v40 + 4) = v37;
      void *v41 = v48;
      *(_WORD *)(v40 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v40 + 14) = sub_2487A24A8(v22, v19, v50);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24876F000, v38, v39, "%@ registered %s", (uint8_t *)v40, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v41, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v42, -1, -1);
      MEMORY[0x24C57FA90](v40, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v18 += 2;
    uint64_t v21 = v49 - 1;
    if (v49 == 1) {
      return swift_bridgeObjectRelease();
    }
  }
  sub_24878ECA0(v28, isUniquelyReferenced_nonNull_native);
  unint64_t v30 = sub_24878E5F4(v22, v19);
  if ((v29 & 1) == (v31 & 1))
  {
    unint64_t v26 = v30;
    uint64_t v12 = v50[0];
    if (v29) {
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  uint64_t result = sub_2487A68A8();
  __break(1u);
  return result;
}

uint64_t sub_248799AA4(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](sub_248799AC4, 0, 0);
}

uint64_t sub_248799AC4()
{
  id v23 = v0;
  id v1 = objc_msgSend(self, sel_sharedInstance);
  v0[7] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v0[5];
    if (*(void *)(v3 + 16))
    {
      uint64_t v4 = v0[6];
      uint64_t v5 = (void *)swift_task_alloc();
      v0[8] = v5;
      v5[2] = v2;
      v5[3] = v3;
      v5[4] = v4;
      uint64_t v6 = (void *)swift_task_alloc();
      v0[9] = v6;
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327A60);
      *uint64_t v6 = v0;
      v6[1] = sub_248799ECC;
      return MEMORY[0x270FA2360](v0 + 3, 0, 0, 0xD000000000000025, 0x80000002487A9A30, sub_24879BAC4, v5, v7);
    }
    else
    {
      if (qword_269327250 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_2487A5F68();
      __swift_project_value_buffer(v15, (uint64_t)qword_269329248);
      uint64_t v16 = sub_2487A5F48();
      os_log_type_t v17 = sub_2487A6598();
      if (os_log_type_enabled(v16, v17))
      {
        unint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v18 = 0;
        _os_log_impl(&dword_24876F000, v16, v17, "No handles to lookup, bailing early.", v18, 2u);
        MEMORY[0x24C57FA90](v18, -1, -1);
      }

      unint64_t v19 = sub_24878DED8(MEMORY[0x263F8EE78]);
      uint64_t v20 = (uint64_t (*)(unint64_t))v0[1];
      return v20(v19);
    }
  }
  else
  {
    if (qword_269327250 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2487A5F68();
    __swift_project_value_buffer(v8, (uint64_t)qword_269329248);
    uint64_t v9 = sub_2487A5F48();
    os_log_type_t v10 = sub_2487A6598();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v22 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      v0[2] = sub_2487A24A8(0xD000000000000025, 0x80000002487A9A30, &v22);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v9, v10, "%s The IDS query controller was nil, bailing early.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v12, -1, -1);
      MEMORY[0x24C57FA90](v11, -1, -1);
    }

    sub_24879BA70();
    swift_allocError();
    *unint64_t v13 = 1;
    swift_willThrow();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_248799ECC()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24879A230;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_248799FE8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_248799FE8()
{
  uint64_t v16 = v0;
  uint64_t v1 = v0[3];
  if (qword_269327250 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_269329248);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[7];
  if (v5)
  {
    uint64_t v14 = (void *)v0[7];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_2487741E0(0, &qword_269327A68);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2487A6348();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    v0[4] = sub_2487A24A8(v9, v11, &v15);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v3, v4, "Got results from IDS query: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v8, -1, -1);
    MEMORY[0x24C57FA90](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v1);
}

uint64_t sub_24879A230()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24879A29C(uint64_t a1, uint64_t a2)
{
  v3[5] = a1;
  v3[6] = a2;
  BOOL v5 = (void *)swift_task_alloc();
  v3[7] = v5;
  *BOOL v5 = v3;
  v5[1] = sub_24879A34C;
  v5[5] = a2;
  v5[6] = v2;
  return MEMORY[0x270FA2498](sub_248799AC4, 0, 0);
}

uint64_t sub_24879A34C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  swift_task_dealloc();
  if (v1)
  {
    os_log_type_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24879A480, 0, 0);
  }
}

uint64_t sub_24879A480()
{
  unsigned int v86 = v0;
  int64_t v1 = (int64_t)v0;
  uint64_t v2 = v0[8];
  if (*(void *)(v2 + 16))
  {
    int64_t v3 = 0;
    uint64_t v72 = v0 + 3;
    long long v73 = v0 + 2;
    uint64_t v66 = v2 + 64;
    uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v5 = v0[5];
    if (-v4 < 64) {
      uint64_t v6 = ~(-1 << -(char)v4);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 64);
    int64_t v67 = (unint64_t)(63 - v4) >> 6;
    uint64_t v83 = v5 + 56;
    unint64_t v84 = MEMORY[0x263F8EE78];
    uint64_t v81 = v0;
    uint64_t v68 = v2;
    while (1)
    {
      if (v7)
      {
        uint64_t v70 = (v7 - 1) & v7;
        int64_t v71 = v3;
        unint64_t v8 = __clz(__rbit64(v7)) | (v3 << 6);
      }
      else
      {
        int64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_91;
        }
        if (v9 >= v67)
        {
LABEL_82:
          swift_release();
          uint64_t v63 = v84;
          if (v84 >> 62)
          {
            swift_bridgeObjectRetain();
            __swift_instantiateConcreteTypeFromMangledName(&qword_269327A50);
            uint64_t v62 = sub_2487A67D8();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRetain();
            sub_2487A6878();
            uint64_t v62 = v63;
          }
          swift_bridgeObjectRelease();
          goto LABEL_85;
        }
        unint64_t v10 = *(void *)(v66 + 8 * v9);
        int64_t v11 = v3 + 1;
        if (!v10)
        {
          int64_t v11 = v3 + 2;
          if (v3 + 2 >= v67) {
            goto LABEL_82;
          }
          unint64_t v10 = *(void *)(v66 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v3 + 3;
            if (v3 + 3 >= v67) {
              goto LABEL_82;
            }
            unint64_t v10 = *(void *)(v66 + 8 * v11);
            if (!v10)
            {
              uint64_t v12 = v3 + 4;
              if (v3 + 4 >= v67) {
                goto LABEL_82;
              }
              unint64_t v10 = *(void *)(v66 + 8 * v12);
              if (!v10)
              {
                while (1)
                {
                  int64_t v11 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_92;
                  }
                  if (v11 >= v67) {
                    goto LABEL_82;
                  }
                  unint64_t v10 = *(void *)(v66 + 8 * v11);
                  ++v12;
                  if (v10) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v3 + 4;
            }
          }
        }
LABEL_23:
        uint64_t v70 = (v10 - 1) & v10;
        int64_t v71 = v11;
        unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
      }
      unint64_t v13 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v8);
      uint64_t v15 = *v13;
      unint64_t v14 = v13[1];
      uint64_t v16 = *(NSObject **)(*(void *)(v2 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      unint64_t v69 = v16;
      uint64_t v17 = [v69 endpoints];
      if (v17)
      {
        uint64_t v16 = v17;
        sub_2487741E0(0, &qword_269327A48);
        uint64_t v18 = sub_2487A64B8();

        if (!((unint64_t)v18 >> 62)) {
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v18 = MEMORY[0x263F8EE78];
        if (!(MEMORY[0x263F8EE78] >> 62))
        {
LABEL_26:
          uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v19) {
            goto LABEL_27;
          }
          goto LABEL_70;
        }
      }
      if (v18 < 0) {
        uint64_t v16 = v18;
      }
      else {
        uint64_t v16 = (v18 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_2487A67E8();
      swift_bridgeObjectRelease();
      if (v19)
      {
LABEL_27:
        swift_bridgeObjectRelease();
        unint64_t v20 = 0;
        unint64_t v80 = v18 & 0xC000000000000001;
        uint64_t v74 = v18 + 32;
        uint64_t v75 = v18 & 0xFFFFFFFFFFFFFF8;
        uint64_t v78 = v19;
        uint64_t v79 = v18;
        while (1)
        {
          if (v80)
          {
            id v22 = (id)MEMORY[0x24C57F1A0](v20, v18);
          }
          else
          {
            if (v20 >= *(void *)(v75 + 16)) {
              goto LABEL_90;
            }
            id v22 = *(id *)(v74 + 8 * v20);
          }
          id v23 = v22;
          BOOL v24 = __OFADD__(v20, 1);
          unint64_t v25 = v20 + 1;
          if (v24) {
            break;
          }
          unint64_t v82 = v25;
          uint64_t v26 = -1 << *(unsigned char *)(v5 + 32);
          if (-v26 < 64) {
            uint64_t v27 = ~(-1 << -(char)v26);
          }
          else {
            uint64_t v27 = -1;
          }
          unint64_t v28 = v27 & *(void *)(v5 + 56);
          int64_t v29 = (unint64_t)(63 - v26) >> 6;
          swift_bridgeObjectRetain();
          int64_t v1 = 0;
          if (v28)
          {
LABEL_39:
            unint64_t v30 = __clz(__rbit64(v28));
            v28 &= v28 - 1;
            unint64_t v31 = v30 | (v1 << 6);
            goto LABEL_54;
          }
          while (1)
          {
            int64_t v32 = v1 + 1;
            if (__OFADD__(v1, 1))
            {
              __break(1u);
              goto LABEL_80;
            }
            if (v32 >= v29) {
              goto LABEL_28;
            }
            unint64_t v33 = *(void *)(v83 + 8 * v32);
            ++v1;
            if (!v33)
            {
              int64_t v1 = v32 + 1;
              if (v32 + 1 >= v29) {
                goto LABEL_28;
              }
              unint64_t v33 = *(void *)(v83 + 8 * v1);
              if (!v33)
              {
                int64_t v1 = v32 + 2;
                if (v32 + 2 >= v29) {
                  goto LABEL_28;
                }
                unint64_t v33 = *(void *)(v83 + 8 * v1);
                if (!v33)
                {
                  int64_t v34 = v32 + 3;
                  if (v34 >= v29)
                  {
LABEL_28:
                    int64_t v1 = (int64_t)v81;
                    swift_release();
                    uint64_t v21 = v78;
                    uint64_t v18 = v79;
                    unint64_t v20 = v82;
                    goto LABEL_29;
                  }
                  unint64_t v33 = *(void *)(v83 + 8 * v34);
                  if (!v33)
                  {
                    while (1)
                    {
                      int64_t v1 = v34 + 1;
                      if (__OFADD__(v34, 1)) {
                        break;
                      }
                      if (v1 >= v29) {
                        goto LABEL_28;
                      }
                      unint64_t v33 = *(void *)(v83 + 8 * v1);
                      ++v34;
                      if (v33) {
                        goto LABEL_53;
                      }
                    }
                    __break(1u);
                    goto LABEL_89;
                  }
                  int64_t v1 = v34;
                }
              }
            }
LABEL_53:
            unint64_t v28 = (v33 - 1) & v33;
            unint64_t v31 = __clz(__rbit64(v33)) + (v1 << 6);
LABEL_54:
            BOOL v35 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v31);
            uint64_t v37 = *v35;
            unint64_t v36 = v35[1];
            swift_bridgeObjectRetain();
            uint64_t v16 = objc_msgSend(v23, sel_capabilities);
            char v38 = (void *)sub_2487A63A8();
            id v39 = [v16 valueForCapability:v38];

            if (!v39) {
              break;
            }
            swift_bridgeObjectRelease();
            if (v28) {
              goto LABEL_39;
            }
          }
          if (qword_269327250 != -1) {
            swift_once();
          }
          uint64_t v40 = sub_2487A5F68();
          __swift_project_value_buffer(v40, (uint64_t)qword_269329248);
          id v41 = v23;
          swift_bridgeObjectRetain();
          id v42 = v41;
          uint64_t v43 = sub_2487A5F48();
          os_log_type_t v44 = sub_2487A65B8();
          int64_t v1 = (int64_t)v81;
          if (os_log_type_enabled(v43, v44))
          {
            uint64_t v45 = swift_slowAlloc();
            os_log_type_t type = v44;
            uint64_t v46 = (void *)swift_slowAlloc();
            uint64_t v77 = swift_slowAlloc();
            v85[0] = v77;
            *(_DWORD *)uint64_t v45 = 138412546;
            id v47 = objc_msgSend(v42, sel_URI);
            *long long v73 = v47;
            int64_t v1 = (int64_t)v81;
            sub_2487A6698();
            *uint64_t v46 = v47;

            *(_WORD *)(v45 + 12) = 2080;
            swift_bridgeObjectRetain();
            *uint64_t v72 = sub_2487A24A8(v37, v36, v85);
            sub_2487A6698();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_24876F000, v43, type, "Endpoint %@ does not support %s", (uint8_t *)v45, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
            swift_arrayDestroy();
            MEMORY[0x24C57FA90](v46, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x24C57FA90](v77, -1, -1);
            MEMORY[0x24C57FA90](v45, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          swift_release();
          uint64_t v21 = v78;
          uint64_t v18 = v79;
          unint64_t v20 = v82;
          id v48 = v42;
          uint64_t v16 = &v84;
          MEMORY[0x24C57EEB0]();
          if (*(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2487A64E8();
          }
          sub_2487A64F8();
          sub_2487A64D8();
LABEL_29:

          if (v20 == v21)
          {
            swift_bridgeObjectRelease();

            goto LABEL_7;
          }
        }
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
        goto LABEL_93;
      }
LABEL_70:
      swift_bridgeObjectRelease();
      if (qword_269327250 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_2487A5F68();
      __swift_project_value_buffer(v49, (uint64_t)qword_269329248);
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_2487A5F48();
      os_log_type_t v51 = sub_2487A6598();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        v85[0] = v53;
        *(_DWORD *)uint64_t v52 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v52 + 4) = sub_2487A24A8(v15, v14, v85);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24876F000, v50, v51, "No endpoints for handle %s", (uint8_t *)v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57FA90](v53, -1, -1);
        MEMORY[0x24C57FA90](v52, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

LABEL_7:
      uint64_t v2 = v68;
      unint64_t v7 = v70;
      int64_t v3 = v71;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_269327250 != -1) {
LABEL_93:
  }
    swift_once();
  uint64_t v54 = sub_2487A5F68();
  __swift_project_value_buffer(v54, (uint64_t)qword_269329248);
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_2487A5F48();
  os_log_type_t v55 = sub_2487A65B8();
  if (os_log_type_enabled(v16, v55))
  {
    unint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    v85[0] = v57;
    *(_DWORD *)unint64_t v56 = 136315138;
    uint64_t v58 = swift_bridgeObjectRetain();
    uint64_t v59 = MEMORY[0x24C57EEE0](v58, MEMORY[0x263F8D310]);
    unint64_t v61 = v60;
    swift_bridgeObjectRelease();
    *(void *)(v1 + 32) = sub_2487A24A8(v59, v61, v85);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v16, v55, "No results for ids lookup with destinations %s", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v57, -1, -1);
    MEMORY[0x24C57FA90](v56, -1, -1);
  }
  else
  {
LABEL_80:
    swift_bridgeObjectRelease_n();
  }

  uint64_t v62 = MEMORY[0x263F8EE78];
LABEL_85:
  uint64_t v64 = *(uint64_t (**)(uint64_t))(v1 + 8);
  return v64(v62);
}

void sub_24879AF38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v21 = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327A70);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7);
  id v10 = objc_msgSend(self, sel_refreshIDInfo);
  objc_msgSend(v10, sel_setForceRefresh_, 1);
  sub_2487982FC(a3);
  uint64_t v20 = sub_2487A64A8();
  swift_bridgeObjectRelease();
  int64_t v11 = (void *)sub_2487A63A8();
  uint64_t v12 = qword_269327298;
  id v13 = v10;
  if (v12 != -1) {
    swift_once();
  }
  unint64_t v14 = (void *)sub_2487A63A8();
  uint64_t v15 = *(void *)(a4 + *(int *)(type metadata accessor for IDSLookupController() + 20));
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v16, (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_24879BB64;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24879B9C4;
  aBlock[3] = &block_descriptor_7;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  uint64_t v19 = (void *)v20;
  objc_msgSend(v21, sel_idInfoForDestinations_service_infoTypes_options_listenerID_queue_completionBlock_, v20, v11, 1, v13, v14, v15, v18);
  _Block_release(v18);
}

uint64_t sub_24879B1F8(uint64_t a1, void *a2)
{
  if (!a1)
  {
    if (a2)
    {
      sub_24879BA70();
      uint64_t v52 = swift_allocError();
      void *v53 = a2;
      *(void *)&long long v70 = v52;
      id v54 = a2;
    }
    else
    {
      sub_24879BA70();
      uint64_t v55 = swift_allocError();
      *unint64_t v56 = 2;
      *(void *)&long long v70 = v55;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327A70);
    return sub_2487A6518();
  }
  swift_bridgeObjectRetain();
  int64_t v3 = 0;
  unint64_t v58 = sub_24878DED8(MEMORY[0x263F8EE78]);
  uint64_t v60 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v61 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v8 = v7 | (v3 << 6);
LABEL_9:
      sub_248797044(*(void *)(a1 + 48) + 40 * v8, (uint64_t)&v66);
      sub_2487970A0(*(void *)(a1 + 56) + 32 * v8, (uint64_t)v68 + 8);
      goto LABEL_28;
    }
    int64_t v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    if (v9 < v61)
    {
      unint64_t v10 = *(void *)(v60 + 8 * v9);
      if (v10) {
        goto LABEL_13;
      }
      int64_t v11 = v3 + 2;
      ++v3;
      if (v9 + 1 < v61)
      {
        unint64_t v10 = *(void *)(v60 + 8 * v11);
        if (v10) {
          goto LABEL_16;
        }
        int64_t v3 = v9 + 1;
        if (v9 + 2 < v61)
        {
          unint64_t v10 = *(void *)(v60 + 8 * (v9 + 2));
          if (v10)
          {
            v9 += 2;
            goto LABEL_13;
          }
          int64_t v11 = v9 + 3;
          int64_t v3 = v9 + 2;
          if (v9 + 3 < v61) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v6 = 0;
    uint64_t v69 = 0;
    memset(v68, 0, sizeof(v68));
    long long v66 = 0u;
    long long v67 = 0u;
LABEL_28:
    sub_24879BC00((uint64_t)&v66, (uint64_t)&v70);
    if (!*((void *)&v71 + 1))
    {
      swift_release();
      *(void *)&long long v70 = v58;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327A70);
      return sub_2487A6528();
    }
    long long v66 = v70;
    long long v67 = v71;
    *(void *)&v68[0] = v72;
    sub_2487970FC(v73, v65);
    sub_248797044((uint64_t)&v66, (uint64_t)v63);
    if ((swift_dynamicCast() & 1) == 0)
    {
      if (qword_269327250 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_2487A5F68();
      __swift_project_value_buffer(v26, (uint64_t)qword_269329248);
      sub_2487970A0((uint64_t)v65, (uint64_t)v63);
      uint64_t v15 = sub_2487A5F48();
      os_log_type_t v27 = sub_2487A6598();
      if (!os_log_type_enabled(v15, v27))
      {
LABEL_5:

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        goto LABEL_6;
      }
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      v62[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A80);
      uint64_t v28 = sub_2487A63C8();
      *(void *)(v17 + 4) = sub_2487A24A8(v28, v29, (uint64_t *)v62);
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      __swift_project_boxed_opaque_existential_1(v63, v64);
      swift_getDynamicType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A88);
      uint64_t v30 = sub_2487A63C8();
      *(void *)(v17 + 14) = sub_2487A24A8(v30, v31, (uint64_t *)v62);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      id v23 = v15;
      os_log_type_t v24 = v27;
      unint64_t v25 = "key in IDS query results was not a String. Skipping. key type: %s, value type: %s";
      goto LABEL_39;
    }
    id v13 = v62[0];
    id v12 = v62[1];
    sub_2487970A0((uint64_t)v65, (uint64_t)v63);
    sub_2487741E0(0, &qword_269327A68);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_269327250 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_2487A5F68();
      __swift_project_value_buffer(v14, (uint64_t)qword_269329248);
      sub_2487970A0((uint64_t)v65, (uint64_t)v63);
      uint64_t v15 = sub_2487A5F48();
      os_log_type_t v16 = sub_2487A6598();
      if (!os_log_type_enabled(v15, v16)) {
        goto LABEL_5;
      }
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      v62[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A80);
      uint64_t v19 = sub_2487A63C8();
      *(void *)(v17 + 4) = sub_2487A24A8(v19, v20, (uint64_t *)v62);
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      __swift_project_boxed_opaque_existential_1(v63, v64);
      swift_getDynamicType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327A88);
      uint64_t v21 = sub_2487A63C8();
      *(void *)(v17 + 14) = sub_2487A24A8(v21, v22, (uint64_t *)v62);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      id v23 = v15;
      os_log_type_t v24 = v16;
      unint64_t v25 = "value in IDS query results was not IDSIDInfoResult. Skipping. key type: %s, value type: %s";
LABEL_39:
      _os_log_impl(&dword_24876F000, v23, v24, v25, (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v18, -1, -1);
      MEMORY[0x24C57FA90](v17, -1, -1);

      goto LABEL_6;
    }
    id v57 = v62[0];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v63[0] = v58;
    unint64_t v34 = sub_24878E5F4((uint64_t)v13, (uint64_t)v12);
    uint64_t v35 = *(void *)(v58 + 16);
    BOOL v36 = (v33 & 1) == 0;
    uint64_t v37 = v35 + v36;
    if (__OFADD__(v35, v36)) {
      goto LABEL_57;
    }
    if (*(void *)(v58 + 24) >= v37)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        char v49 = v33;
        sub_24878FA08();
        char v33 = v49;
      }
    }
    else
    {
      char v59 = v33;
      sub_24878ECAC(v37, isUniquelyReferenced_nonNull_native);
      unint64_t v38 = sub_24878E5F4((uint64_t)v13, (uint64_t)v12);
      int v40 = v39 & 1;
      char v33 = v59;
      if ((v59 & 1) != v40) {
        goto LABEL_60;
      }
      unint64_t v34 = v38;
    }
    id v41 = (void *)v63[0];
    unint64_t v58 = v63[0];
    if (v33)
    {
      uint64_t v42 = *(void *)(v63[0] + 56);
      uint64_t v43 = 8 * v34;

      *(void *)(v42 + v43) = v57;
      os_log_type_t v44 = v57;
    }
    else
    {
      *(void *)(v63[0] + 8 * (v34 >> 6) + 64) |= 1 << v34;
      uint64_t v45 = (void *)(v41[6] + 16 * v34);
      *uint64_t v45 = v13;
      v45[1] = v12;
      *(void *)(v41[7] + 8 * v34) = v57;
      uint64_t v46 = v41[2];
      BOOL v47 = __OFADD__(v46, 1);
      uint64_t v48 = v46 + 1;
      if (v47) {
        goto LABEL_58;
      }
      os_log_type_t v44 = v57;
      v41[2] = v48;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
    sub_24879737C((uint64_t)&v66);
  }
  unint64_t v10 = *(void *)(v60 + 8 * v11);
  if (v10)
  {
LABEL_16:
    int64_t v9 = v11;
LABEL_13:
    unint64_t v6 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v9 << 6);
    int64_t v3 = v9;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v9 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v9 >= v61)
    {
      int64_t v3 = v61 - 1;
      goto LABEL_27;
    }
    unint64_t v10 = *(void *)(v60 + 8 * v9);
    ++v11;
    if (v10) {
      goto LABEL_13;
    }
  }
LABEL_59:
  __break(1u);
LABEL_60:
  uint64_t result = sub_2487A68A8();
  __break(1u);
  return result;
}

uint64_t sub_24879B9C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_2487A6338();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_24879BA70()
{
  unint64_t result = qword_269327A58;
  if (!qword_269327A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327A58);
  }
  return result;
}

void sub_24879BAC4(uint64_t a1)
{
  sub_24879AF38(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_24879BAD0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327A70);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24879BB64(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327A70);

  return sub_24879B1F8(a1, a2);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_24879BC00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_24879BC68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327AB0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_248776C84((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_248777330();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

unint64_t sub_24879BD50()
{
  unint64_t result = qword_269327AA8;
  if (!qword_269327AA8)
  {
    sub_2487741E0(255, (unint64_t *)&qword_269327670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327AA8);
  }
  return result;
}

unint64_t sub_24879BDAC()
{
  unint64_t result = qword_269327AB8;
  if (!qword_269327AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327AB8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for IDSLookupController.Error(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for IDSLookupController.Error(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for IDSLookupController.Error(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF) {
      id v7 = v4;
    }
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    id v5 = v4;
    uint64_t v6 = *a1;
    *a1 = v4;
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for IDSLookupController.Error(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for IDSLookupController.Error(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IDSLookupController.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_24879BFF8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24879C010(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for IDSLookupController.Error()
{
  return &type metadata for IDSLookupController.Error;
}

uint64_t *sub_24879C040(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2487A5E88();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void sub_24879C110(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2487A5E88();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_24879C184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487A5E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_24879C204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487A5E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t sub_24879C28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487A5E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_24879C308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487A5E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_24879C38C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24879C3A0);
}

uint64_t sub_24879C3A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487A5E88();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_24879C460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24879C474);
}

uint64_t sub_24879C474(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2487A5E88();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24879C530()
{
  uint64_t result = sub_2487A5E88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24879C5CC()
{
  return sub_2487A63C8();
}

uint64_t sub_24879C61C(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  return MEMORY[0x270FA2498](sub_24879C640, 0, 0);
}

uint64_t sub_24879C640()
{
  uint64_t v1 = v0[11];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 24);
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = v0[9];
    uint64_t v3 = v0[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_24878E5F4(v4, v3);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(v2 + 56) + 8 * v5);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2487731CC();
      uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
      return v8(v7);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  char v10 = *(unsigned char *)(v0[11] + 16);
  type metadata accessor for AppExtensionConnection();
  swift_allocObject();
  swift_retain();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[12] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24879C950;
  uint64_t v12 = v0[11];
  return sub_248771B70(v10, (uint64_t)sub_2487A1978, v12);
}

uint64_t sub_24879C950(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v5 = sub_24879CD64;
  }
  else
  {
    swift_release();
    *(void *)(v4 + 112) = a1;
    unint64_t v5 = sub_24879CA80;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24879CA80()
{
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 72);
  v1[4] = &off_26FC7EDC8;
  swift_unknownObjectWeakAssign();
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  char v6 = (void *)swift_allocObject();
  v6[2] = v5;
  v6[3] = v4;
  v6[4] = v2;
  uint64_t v7 = v1[8];
  v1[8] = sub_2487A1A3C;
  v1[9] = v6;
  swift_bridgeObjectRetain();
  sub_248773FD8(v7);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = v4;
  v9[4] = v2;
  uint64_t v10 = v1[10];
  v1[10] = sub_2487A1A14;
  v1[11] = v9;
  swift_bridgeObjectRetain();
  sub_248773FD8(v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = 0x8000000000000000;
  sub_2487A06A0((uint64_t)v1, v4, v2, isUniquelyReferenced_nonNull_native);
  *(void *)(v3 + 24) = v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v13 = *(void **)(v0 + 104);
  uint64_t v12 = *(void *)(v0 + 112);
  sub_2487731CC();
  if (v13)
  {
    *(void *)(v0 + 64) = v13;
    id v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693274E8);
    if (swift_dynamicCast() && *(unsigned char *)(v0 + 120) == 5)
    {

      sub_248773F5C();
      swift_allocError();
      *uint64_t v15 = 5;
      swift_willThrow();
    }
    swift_release();

    os_log_type_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
  else
  {
    uint64_t v18 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v18(v12);
  }
}

uint64_t sub_24879CD64()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24879CDC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void **)&protocolRef__TtP9AskToCore25AskToExtensionXPCProtocol_;
  if (!*(unsigned char *)(a4 + 16)) {
    uint64_t v5 = (void **)&protocolRef__TtP6People32PeopleLegacyExtensionXPCProtocol_;
  }
  char v6 = *v5;
  uint64_t v7 = self;
  id v8 = v6;
  id v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, v8);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v9);
}

uint64_t sub_24879CE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    sub_2487A0138(a2, a3);
    swift_endAccess();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24879CF0C(uint64_t a1, uint64_t a2)
{
  v3[23] = a2;
  v3[24] = v2;
  v3[22] = a1;
  return MEMORY[0x270FA2498](sub_24879CF30, 0, 0);
}

uint64_t sub_24879CF30()
{
  int v1 = *(unsigned __int8 *)(*(void *)(v0 + 192) + 16);
  *(unsigned char *)(v0 + 256) = v1;
  if (v1) {
    unint64_t v2 = 0xD00000000000002ALL;
  }
  else {
    unint64_t v2 = 0xD000000000000033;
  }
  if (v1) {
    unint64_t v3 = 0x80000002487A86B0;
  }
  else {
    unint64_t v3 = 0x80000002487A8700;
  }
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24879D024;
  uint64_t v5 = *(void *)(v0 + 192);
  v4[10] = v3;
  v4[11] = v5;
  v4[9] = v2;
  return MEMORY[0x270FA2498](sub_24879C640, 0, 0);
}

uint64_t sub_24879D024(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(v4 + 208) = a1;
  *(void *)(v4 + 216) = v1;
  swift_task_dealloc();
  if (v1)
  {
    char v6 = sub_24879D5E0;
  }
  else
  {
    char v7 = *(unsigned char *)(v4 + 256);
    swift_bridgeObjectRelease();
    id v8 = (void *)swift_task_alloc();
    if (v7)
    {
      *(void *)(v4 + 240) = v8;
      *id v8 = v5;
      v8[1] = sub_24879D3D8;
      uint64_t v9 = *(void *)(v4 + 184);
      v8[18] = a1;
      v8[19] = v9;
      v8[17] = v4 + 16;
      uint64_t v10 = sub_2487A0A8C;
    }
    else
    {
      *(void *)(v4 + 224) = v8;
      *id v8 = v5;
      v8[1] = sub_24879D234;
      *(_OWORD *)(v8 + 19) = *(_OWORD *)(v4 + 184);
      v8[17] = v4 + 96;
      v8[18] = a1;
      uint64_t v10 = sub_24879D6F4;
    }
    char v6 = v10;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24879D234()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_24879D66C;
  }
  else {
    unint64_t v2 = sub_24879D348;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24879D348()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_release();
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 128);
  long long v4 = *(_OWORD *)(v0 + 136);
  long long v5 = *(_OWORD *)(v0 + 112);
  long long v6 = *(_OWORD *)(v0 + 152);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v1 + 16) = v5;
  *(void *)(v1 + 32) = v3;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(void *)(v1 + 72) = v2;
  char v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24879D3D8()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24879D57C;
  }
  else {
    uint64_t v2 = sub_24879D4EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24879D4EC()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_release();
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 48);
  long long v4 = *(_OWORD *)(v0 + 56);
  long long v5 = *(_OWORD *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v5;
  *(void *)(v1 + 32) = v3;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(void *)(v1 + 72) = v2;
  char v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24879D57C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24879D5E0()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24879D66C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24879D6D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  return MEMORY[0x270FA2498](sub_24879D6F4, 0, 0);
}

uint64_t sub_24879D6F4()
{
  sub_248773904();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327B08);
  if (swift_dynamicCast())
  {
    uint64_t v1 = *(void *)(v0 + 128);
    *(void *)(v0 + 168) = v1;
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 176) = v2;
    *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 152);
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24879D8A4;
    return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000040, 0x80000002487A9BC0, sub_2487A16F4, v2, &type metadata for MessagesPayload);
  }
  else
  {
    sub_248773F5C();
    swift_allocError();
    *long long v4 = 1;
    swift_willThrow();
    long long v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_24879D8A4()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24879DA50;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24879D9C0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24879D9C0()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 88);
  long long v4 = *(_OWORD *)(v0 + 56);
  long long v5 = *(_OWORD *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v5;
  *(void *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(void *)(v1 + 72) = v3;
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24879DA50()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24879DABC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v61 = a4;
  uint64_t v62 = a3;
  uint64_t v65 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);
  uint64_t v63 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v63 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = sub_2487A5F68();
  uint64_t v64 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327698);
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_2487A6268();
  uint64_t v60 = v9;
  uint64_t v56 = v6;
  id v57 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = v5;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  MEMORY[0x270FA5388](v14);
  sub_24879FAE8((uint64_t)v12, (uint64_t)v12);
  char v59 = a2;
  sub_24879EAB4((uint64_t)v12, v12);
  sub_248784D84((uint64_t)v12, &qword_269327698);
  sub_2487A1700((uint64_t)v12, (uint64_t)v12);
  if (qword_269327238 != -1) {
    swift_once();
  }
  uint64_t v15 = v7;
  uint64_t v16 = __swift_project_value_buffer(v7, (uint64_t)qword_269329200);
  uint64_t v17 = v64;
  uint64_t v18 = v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v60, v16, v7);
  uint64_t v19 = sub_2487A5F48();
  int v20 = sub_2487A65B8();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    int v54 = v20;
    uint64_t v55 = v11;
    os_log_t v53 = v19;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    swift_beginAccess();
    uint64_t v23 = sub_2487A5E38();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48))(v12, 1, v23);
    uint64_t v26 = v63;
    if (v25)
    {
      unint64_t v27 = 0xE300000000000000;
      uint64_t v28 = 7104878;
    }
    else
    {
      uint64_t v52 = (uint64_t)&v52;
      MEMORY[0x270FA5388](v25);
      int64_t v32 = v21;
      char v33 = (char *)&v52 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, void *, uint64_t))(v24 + 16))(v33, v12, v23);
      uint64_t v28 = sub_2487A5E08();
      unint64_t v27 = v34;
      uint64_t v35 = v33;
      uint64_t v21 = v32;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v35, v23);
    }
    unint64_t v29 = v59;
    uint64_t v30 = v62;
    void aBlock[6] = sub_2487A24A8(v28, v27, aBlock);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    os_log_t v36 = v53;
    _os_log_impl(&dword_24876F000, v53, (os_log_type_t)v54, "Reaching out to People extension with base URL %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v22, -1, -1);
    MEMORY[0x24C57FA90](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v60, v15);
    uint64_t v11 = v55;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v17 + 8))(v18, v7);
    unint64_t v29 = v59;
    uint64_t v30 = v62;
    uint64_t v26 = v63;
  }
  uint64_t v37 = v65;
  if (*(unsigned char *)(v30 + 17) == 3)
  {
    unint64_t v38 = (void *)sub_2487A62F8();
    sub_2487A5FB8();

    char v39 = (void *)sub_2487A63A8();
    swift_bridgeObjectRelease();
    uint64_t v40 = swift_beginAccess();
    MEMORY[0x270FA5388](v40);
    id v41 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_24879FAE8((uint64_t)v12, (uint64_t)v41);
    uint64_t v42 = sub_2487A5E38();
    uint64_t v43 = *(void *)(v42 - 8);
    os_log_type_t v44 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v41, 1, v42) != 1)
    {
      os_log_type_t v44 = (void *)sub_2487A5E18();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v41, v42);
    }
    uint64_t v45 = v57;
    uint64_t v46 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v57, v37, v58);
    unint64_t v47 = (*(unsigned __int8 *)(v26 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = v29;
    (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v48 + v47, v45, v46);
    aBlock[4] = (uint64_t)sub_2487A176C;
    aBlock[5] = v48;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24879E3F4;
    aBlock[3] = (uint64_t)&block_descriptor_8;
    char v49 = _Block_copy(aBlock);
    id v50 = v29;
    swift_release();
    objc_msgSend(v61, sel_messagePayloadForScreenTimeFor_baseURL_fallbackToLP_reply_, v39, v44, 0, v49);
    _Block_release(v49);
  }
  return sub_248784D84((uint64_t)v12, &qword_269327698);
}

void sub_24879E250(void *a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    sub_2487A6098();
    sub_2487A60A8();
    sub_2487A6298();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327AB0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2487A7F50;
    *(void *)(inited + 32) = sub_2487A63B8();
    *(void *)(inited + 40) = v4;
    sub_24878C0A0(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_2487A62D8();
    uint64_t v5 = (void *)sub_2487A62F8();
    sub_2487A6008();

    __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);
    sub_2487A6528();
  }
  else
  {
    if (a1)
    {
      id v6 = a1;
    }
    else
    {
      sub_248773F5C();
      swift_allocError();
      *uint64_t v7 = 2;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);
    sub_2487A6518();
  }
}

void sub_24879E3F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v6 = a2;
  id v7 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_24879E480(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269327238 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2487A5F68();
  __swift_project_value_buffer(v10, (uint64_t)qword_269329200);
  id v11 = a2;
  uint64_t v12 = sub_2487A5F48();
  os_log_type_t v13 = sub_2487A65B8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v29 = v6;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = a1;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412290;
    uint64_t v26 = v7;
    aBlock[0] = v11;
    id v16 = v11;
    uint64_t v28 = a3;
    id v17 = v16;
    uint64_t v6 = v29;
    uint64_t v7 = v26;
    sub_2487A6698();
    uint64_t v18 = v25;
    *uint64_t v25 = v11;

    a3 = v28;
    _os_log_impl(&dword_24876F000, v12, v13, "Reaching out to AskTo extension with payload: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327A40);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v18, -1, -1);
    uint64_t v19 = v15;
    a1 = v27;
    MEMORY[0x24C57FA90](v19, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v20 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v21 + v20, v9, v6);
  aBlock[4] = sub_2487A18E8;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24879E9F4;
  aBlock[3] = &block_descriptor_29;
  uint64_t v22 = _Block_copy(aBlock);
  id v23 = v11;
  swift_release();
  objc_msgSend(a3, sel_messagesDataPayloadFor_reply_, v23, v22);
  _Block_release(v22);
}

uint64_t sub_24879E7D4(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3 >> 60 == 15)
  {
    if (a1)
    {
      id v3 = a1;
    }
    else
    {
      sub_248773F5C();
      swift_allocError();
      *uint64_t v12 = 2;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);
    return sub_2487A6518();
  }
  else
  {
    sub_248776950(a2, a3);
    sub_248776950(a2, a3);
    sub_2487A6298();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327AB0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2487A7F50;
    *(void *)(inited + 32) = sub_2487A63B8();
    *(void *)(inited + 40) = v7;
    sub_24878C0A0(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_2487A62D8();
    uint64_t v8 = (void *)sub_2487A62F8();
    uint64_t v9 = (void *)sub_2487A6008();

    sub_24877693C(a2, a3);
    swift_bridgeObjectRetain();
    id v10 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);
    sub_2487A6528();
    sub_248776A18(a2, a3);
    sub_248776A18(a2, a3);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void sub_24879E9F4(uint64_t a1, void *a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = *(void (**)(void *, void *, unint64_t))(a1 + 32);
  if (a3)
  {
    swift_retain();
    id v5 = a2;
    id v6 = v3;
    id v3 = (void *)sub_2487A5E58();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    id v9 = a2;
    unint64_t v8 = 0xF000000000000000;
  }
  v4(a2, v3, v8);
  sub_248776A18((uint64_t)v3, v8);
  swift_release();
}

uint64_t sub_24879EAB4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v98 = a2;
  uint64_t v3 = sub_2487A6228();
  uint64_t v95 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v99 = (char *)v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v80 - v6;
  uint64_t v8 = sub_2487A61F8();
  uint64_t v93 = *(void *)(v8 - 8);
  uint64_t v94 = v8;
  MEMORY[0x270FA5388](v8);
  __int16 v97 = (char *)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269327238 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2487A5F68();
  uint64_t v96 = (void *)__swift_project_value_buffer(v10, (uint64_t)qword_269329200);
  id v11 = sub_2487A5F48();
  os_log_type_t v12 = sub_2487A65B8();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v13 = 0;
    _os_log_impl(&dword_24876F000, v11, v12, "Attempting to add icon image data to base URL", v13, 2u);
    MEMORY[0x24C57FA90](v13, -1, -1);
  }

  uint64_t v14 = sub_2487A5E38();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327698);
  MEMORY[0x270FA5388](v18 - 8);
  unint64_t v20 = (char *)v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24879FAE8(a1, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) == 1)
  {
    sub_248784D84((uint64_t)v20, &qword_269327698);
    uint64_t v21 = sub_2487A5F48();
    os_log_type_t v22 = sub_2487A65B8();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_24876F000, v21, v22, "Tried adding an icon to a URL, but the given URL was nil", v23, 2u);
      MEMORY[0x24C57FA90](v23, -1, -1);
    }

    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v98, 1, 1, v14);
  }
  else
  {
    uint64_t v89 = v80;
    uint64_t v87 = v15;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v20, v14);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327650);
    unsigned int v86 = v80;
    MEMORY[0x270FA5388](v25 - 8);
    uint64_t v27 = (char *)v80 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2487A5D88();
    sub_2487A61E8();
    sub_2487A61C8();
    sub_2487A6218();
    uint64_t v28 = v27;
    sub_2487A61D8();
    uint64_t v29 = sub_2487A5DA8();
    uint64_t v30 = *(void *)(v29 - 8);
    uint64_t v83 = *(uint64_t (**)(char *, uint64_t))(v30 + 48);
    uint64_t v84 = v29;
    int v31 = v83(v28, 1);
    uint64_t v92 = v3;
    unsigned int v85 = v28;
    if (v31 || (uint64_t v33 = sub_2487A5D68()) == 0)
    {
      swift_bridgeObjectRelease();
      unint64_t v32 = MEMORY[0x263F8EE78];
    }
    else
    {
      unint64_t v32 = v33;
    }
    char v34 = sub_2487A6218();
    uint64_t v90 = v14;
    uint64_t v91 = v7;
    unint64_t v88 = v17;
    uint64_t v82 = v30;
    if ((v34 & 1) != 0 || (sub_2487A12B0(), !v35))
    {
      uint64_t v43 = sub_2487A5F48();
      os_log_type_t v44 = sub_2487A65B8();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl(&dword_24876F000, v43, v44, "Tried adding associatedContentIcon data to the URL, but the icon data was nil", v45, 2u);
        MEMORY[0x24C57FA90](v45, -1, -1);
      }
    }
    else
    {
      uint64_t v36 = sub_2487A5D58();
      uint64_t v81 = v80;
      uint64_t v37 = *(void *)(v36 - 8);
      uint64_t v38 = *(void *)(v37 + 64);
      MEMORY[0x270FA5388](v36);
      unint64_t v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_2487A5D28();
      uint64_t v40 = swift_bridgeObjectRelease();
      v80[1] = v80;
      MEMORY[0x270FA5388](v40);
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))((char *)v80 - v39, (char *)v80 - v39, v36);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v32 = sub_24879FED0(0, *(void *)(v32 + 16) + 1, 1, v32);
      }
      unint64_t v42 = *(void *)(v32 + 16);
      unint64_t v41 = *(void *)(v32 + 24);
      if (v42 >= v41 >> 1) {
        unint64_t v32 = sub_24879FED0(v41 > 1, v42 + 1, 1, v32);
      }
      *(void *)(v32 + 16) = v42 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v32+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(void *)(v37 + 72) * v42, (char *)v80 - v39, v36);
      (*(void (**)(char *, uint64_t))(v37 + 8))((char *)v80 - v39, v36);
    }
    if ((sub_2487A6218() & 1) != 0 || (sub_2487A12B0(), !v46))
    {
      int v54 = sub_2487A5F48();
      os_log_type_t v55 = sub_2487A65B8();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        _os_log_impl(&dword_24876F000, v54, v55, "Tried adding clientIcon data to the URL, but the icon data was nil", v56, 2u);
        MEMORY[0x24C57FA90](v56, -1, -1);
      }
    }
    else
    {
      uint64_t v47 = sub_2487A5D58();
      uint64_t v96 = v80;
      uint64_t v48 = *(void *)(v47 - 8);
      uint64_t v49 = *(void *)(v48 + 64);
      MEMORY[0x270FA5388](v47);
      unint64_t v50 = (v49 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_2487A5D28();
      uint64_t v51 = swift_bridgeObjectRelease();
      uint64_t v81 = v80;
      MEMORY[0x270FA5388](v51);
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))((char *)v80 - v50, (char *)v80 - v50, v47);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v32 = sub_24879FED0(0, *(void *)(v32 + 16) + 1, 1, v32);
      }
      unint64_t v53 = *(void *)(v32 + 16);
      unint64_t v52 = *(void *)(v32 + 24);
      if (v53 >= v52 >> 1) {
        unint64_t v32 = sub_24879FED0(v52 > 1, v53 + 1, 1, v32);
      }
      *(void *)(v32 + 16) = v53 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v32+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(void *)(v48 + 72) * v53, (char *)v80 - v50, v47);
      (*(void (**)(char *, uint64_t))(v48 + 8))((char *)v80 - v50, v47);
    }
    uint64_t v57 = sub_2487A5D58();
    uint64_t v96 = v80;
    uint64_t v58 = *(void *)(v57 - 8);
    uint64_t v59 = *(void *)(v58 + 64);
    MEMORY[0x270FA5388](v57);
    unint64_t v60 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
    id v61 = (char *)v80 - v60;
    sub_2487A5D28();
    uint64_t v62 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v62);
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))((char *)v80 - v60, (char *)v80 - v60, v57);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v32 = sub_24879FED0(0, *(void *)(v32 + 16) + 1, 1, v32);
    }
    unint64_t v64 = *(void *)(v32 + 16);
    unint64_t v63 = *(void *)(v32 + 24);
    if (v64 >= v63 >> 1) {
      unint64_t v32 = sub_24879FED0(v63 > 1, v64 + 1, 1, v32);
    }
    *(void *)(v32 + 16) = v64 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v58 + 32))(v32+ ((*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80))+ *(void *)(v58 + 72) * v64, (char *)v80 - v60, v57);
    uint64_t v65 = v84;
    uint64_t v66 = (uint64_t)v85;
    long long v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v83;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v83)(v85, 1, v84)) {
      swift_bridgeObjectRelease();
    }
    else {
      sub_2487A5D78();
    }
    uint64_t v68 = v98;
    long long v70 = v91;
    uint64_t v69 = v92;
    uint64_t v71 = v67(v66, 1, v65);
    uint64_t v72 = v66;
    if (v71)
    {
      (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v57);
      long long v73 = *(void (**)(char *, uint64_t))(v95 + 8);
      v73(v99, v69);
      v73(v70, v69);
      (*(void (**)(char *, uint64_t))(v93 + 8))(v97, v94);
      uint64_t v74 = v87;
      uint64_t v75 = v90;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v90);
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v74 + 56))(v68, 1, 1, v75);
    }
    else
    {
      uint64_t v98 = v80;
      uint64_t v76 = v82;
      MEMORY[0x270FA5388](v71);
      uint64_t v78 = (char *)v80 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v78, v72, v65);
      sub_2487A5D98();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v78, v65);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v57);
      uint64_t v79 = *(void (**)(char *, uint64_t))(v95 + 8);
      v79(v99, v69);
      v79(v70, v69);
      (*(void (**)(char *, uint64_t))(v93 + 8))(v97, v94);
      (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v90);
    }
    return sub_248784D84(v72, &qword_269327650);
  }
}

uint64_t sub_24879F860()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AppExtensionProxy()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for AppExtension(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24879F988);
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

ValueMetadata *type metadata accessor for AppExtension()
{
  return &type metadata for AppExtension;
}

unint64_t sub_24879F9C4()
{
  unint64_t result = qword_269327AF0;
  if (!qword_269327AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327AF0);
  }
  return result;
}

uint64_t sub_24879FA18()
{
  swift_getWitnessTable();

  return sub_24879C5CC();
}

unint64_t sub_24879FA6C(uint64_t a1)
{
  unint64_t result = sub_24879FA94();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24879FA94()
{
  unint64_t result = qword_269327AF8;
  if (!qword_269327AF8)
  {
    type metadata accessor for AppExtensionProxy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327AF8);
  }
  return result;
}

uint64_t sub_24879FAE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_24879FB50(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327AB0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      os_log_type_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2487A0974(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24879FC60(char a1, int64_t a2, char a3, unint64_t a4)
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
    os_log_type_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327B28);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269327638) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  os_log_type_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2487A67B8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269327638) - 8);
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
    sub_2487A0E5C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24879FED0(char a1, int64_t a2, char a3, unint64_t a4)
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
    os_log_type_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327B00);
  uint64_t v10 = *(void *)(sub_2487A5D58() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  os_log_type_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2487A67B8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2487A5D58() - 8);
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
    sub_2487A159C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2487A0138(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24878E5F4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *int v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24878F4D4();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_2487A02F0(v6, v9);
  *int v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2487A0208(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24878E5F4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *int v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24878F838();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_2487A04C8(v6, v9);
  *int v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_2487A02F0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2487A66E8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2487A6908();
        swift_bridgeObjectRetain();
        sub_2487A63E8();
        uint64_t v9 = sub_2487A6928();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          os_log_type_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          BOOL v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *BOOL v15 = *v16;
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

unint64_t sub_2487A04C8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2487A66E8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2487A6908();
        swift_bridgeObjectRetain();
        sub_2487A63E8();
        uint64_t v9 = sub_2487A6928();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          os_log_type_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          BOOL v15 = (_OWORD *)(v14 + 16 * v3);
          uint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *BOOL v15 = *v16;
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

uint64_t sub_2487A06A0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24878E5F4(a2, a3);
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
    sub_24878F4D4();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24878E6B0(v15, a4 & 1);
  unint64_t v21 = sub_24878E5F4(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2487A68A8();
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
  id v23 = (uint64_t *)(v18[6] + 16 * v12);
  *id v23 = a2;
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

id sub_2487A0810(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_24878E66C((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_24878F68C();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_bridgeObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24878E9C8(v12, a3 & 1);
  unint64_t v18 = sub_24878E66C((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_248784BF0();
    id result = (id)sub_2487A68A8();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;

  return a2;
}

uint64_t sub_2487A0974(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2487A6828();
  __break(1u);
  return result;
}

uint64_t sub_2487A0A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  return MEMORY[0x270FA2498](sub_2487A0A8C, 0, 0);
}

uint64_t sub_2487A0A8C()
{
  sub_248773904();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327B20);
  if (swift_dynamicCast())
  {
    uint64_t v1 = v0[19];
    uint64_t v2 = v0[16];
    v0[20] = v2;
    uint64_t v3 = swift_task_alloc();
    v0[21] = v3;
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[22] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_2487A0C44;
    return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD00000000000003FLL, 0x80000002487A9C50, sub_2487A180C, v3, &type metadata for MessagesPayload);
  }
  else
  {
    sub_248773F5C();
    swift_allocError();
    *unint64_t v5 = 1;
    swift_willThrow();
    unint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_2487A0C44()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2487A0DF0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2487A0D60;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2487A0D60()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 88);
  long long v4 = *(_OWORD *)(v0 + 56);
  long long v5 = *(_OWORD *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v5;
  *(void *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(void *)(v1 + 72) = v3;
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2487A0DF0()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2487A0E5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269327638) - 8);
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
  uint64_t result = sub_2487A6828();
  __break(1u);
  return result;
}

uint64_t sub_2487A0FB8(CGImage *a1)
{
  Mutable = CFDataCreateMutable(0, 0);
  if (!Mutable)
  {
    if (qword_269327238 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2487A5F68();
    __swift_project_value_buffer(v8, (uint64_t)qword_269329200);
    uint64_t v3 = sub_2487A5F48();
    os_log_type_t v9 = sub_2487A6598();
    if (os_log_type_enabled(v3, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_24876F000, v3, v9, "CFDataCreateMutable failed", v10, 2u);
      MEMORY[0x24C57FA90](v10, -1, -1);
    }
    goto LABEL_19;
  }
  uint64_t v3 = Mutable;
  uint64_t v4 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
  if (!v4)
  {
    if (qword_269327238 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_2487A5F68();
    __swift_project_value_buffer(v11, (uint64_t)qword_269329200);
    unint64_t v12 = sub_2487A5F48();
    os_log_type_t v13 = sub_2487A6598();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_24876F000, v12, v13, "CGImageDestinationCreateWithData failed", v14, 2u);
      MEMORY[0x24C57FA90](v14, -1, -1);

      return 0;
    }

LABEL_19:
    return 0;
  }
  long long v5 = v4;
  CGImageDestinationAddImage(v4, a1, 0);
  if (!CGImageDestinationFinalize(v5))
  {
    if (qword_269327238 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_2487A5F68();
    __swift_project_value_buffer(v15, (uint64_t)qword_269329200);
    uint64_t v16 = sub_2487A5F48();
    os_log_type_t v17 = sub_2487A6598();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl(&dword_24876F000, v16, v17, "CGImageDestinationFinalize failed", v18, 2u);
      MEMORY[0x24C57FA90](v18, -1, -1);

      return 0;
    }

    goto LABEL_19;
  }
  long long v6 = v3;
  uint64_t v7 = sub_2487A5E58();

  return v7;
}

uint64_t sub_2487A12B0()
{
  v28[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = (CGImage *)sub_2487A6208();
  uint64_t v1 = sub_2487A0FB8(v0);
  unint64_t v3 = v2;
  if (v2 >> 60 != 15)
  {
    uint64_t v4 = (void *)sub_2487A5E48();
    v28[0] = 0;
    id v5 = objc_msgSend(v4, sel_compressedDataUsingAlgorithm_error_, 3, v28);

    id v6 = v28[0];
    if (v5) {
      goto LABEL_5;
    }
    uint64_t v7 = v6;
    uint64_t v8 = (void *)sub_2487A5DF8();

    swift_willThrow();
  }
  id v5 = 0;
LABEL_5:
  if (qword_269327238 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2487A5F68();
  __swift_project_value_buffer(v9, (uint64_t)qword_269329200);
  id v10 = v5;
  uint64_t v11 = sub_2487A5F48();
  os_log_type_t v12 = sub_2487A65B8();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v13 = 134217984;
    if (!v5)
    {
      uint64_t v21 = 0;
LABEL_18:
      v28[0] = v21;
      sub_2487A6698();

      _os_log_impl(&dword_24876F000, v11, v12, "Icon image data is %ld bytes", v13, 0xCu);
      MEMORY[0x24C57FA90](v13, -1, -1);

      if (!v5) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    uint64_t v26 = v1;
    unint64_t v27 = v3;
    id v14 = v10;
    uint64_t v15 = sub_2487A6658();
    uint64_t v16 = sub_2487A6668();
    uint64_t v17 = sub_2487A6658();
    uint64_t v18 = sub_2487A6668();
    if (v15 < v17 || v18 < v15)
    {
      __break(1u);
    }
    else
    {
      BOOL v25 = v0;
      uint64_t v19 = sub_2487A6658();
      uint64_t v20 = sub_2487A6668();

      if (v16 >= v19 && v20 >= v16)
      {
        uint64_t v21 = (void *)(v16 - v15);
        if (!__OFSUB__(v16, v15))
        {
          uint64_t v0 = v25;
          uint64_t v1 = v26;
          unint64_t v3 = v27;
          goto LABEL_18;
        }
LABEL_23:
        __break(1u);
      }
    }
    __break(1u);
    goto LABEL_23;
  }

  if (!v5)
  {
LABEL_19:
    sub_248776A18(v1, v3);

    return 0;
  }
LABEL_16:
  id v22 = objc_msgSend(v10, sel_base64EncodedStringWithOptions_, 0, v25);
  uint64_t v23 = sub_2487A63B8();
  sub_248776A18(v1, v3);

  return v23;
}

uint64_t sub_2487A159C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2487A5D58() - 8);
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
  uint64_t result = sub_2487A6828();
  __break(1u);
  return result;
}

uint64_t sub_2487A16F4(uint64_t a1)
{
  return sub_24879DABC(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_2487A1700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2487A176C(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);

  sub_24879E250(a1, a2);
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void sub_2487A180C(uint64_t a1)
{
  sub_24879E480(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2487A18E8(void *a1, uint64_t a2, unint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269327B10);

  return sub_24879E7D4(a1, a2, a3);
}

void sub_2487A1978(void *a1, uint64_t a2, uint64_t a3)
{
  sub_24879CDC8(a1, a2, a3, v3);
}

uint64_t sub_2487A1994()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t objectdestroy_35Tm()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2487A1A14()
{
  return sub_24879CE6C(v0[2], v0[3], v0[4]);
}

char *sub_2487A1A40(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = qword_269327540;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327B50);
  swift_allocObject();
  uint64_t v7 = v2;
  *(void *)&v2[v6] = sub_2487A2AE8(MEMORY[0x263F8EE78]);
  uint64_t v8 = &v7[*(void *)asc_269327530];
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  id v9 = objc_allocWithZone(MEMORY[0x263F08D90]);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_2487A63A8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithMachServiceName_, v10);

  *(void *)&v7[qword_269327538] = v11;
  v14.receiver = v7;
  v14.super_class = ObjectType;
  unint64_t v12 = (char *)objc_msgSendSuper2(&v14, sel_init);
  objc_msgSend(*(id *)&v12[qword_269327538], sel_setDelegate_, v12);
  return v12;
}

id sub_2487A1B74()
{
  if (qword_269327230 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2487A5F68();
  __swift_project_value_buffer(v1, (uint64_t)qword_2693291E8);
  uint64_t v2 = v0;
  uint64_t v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = *(void *)&v2[*(void *)asc_269327530];
    unint64_t v8 = *(void *)&v2[*(void *)asc_269327530 + 8];
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2487A24A8(v7, v8, &v11);
    sub_2487A6698();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v3, v4, "Resuming XPC listener for %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v6, -1, -1);
    MEMORY[0x24C57FA90](v5, -1, -1);
  }
  else
  {
  }
  return objc_msgSend(*(id *)&v2[qword_269327538], sel_resume, v10, v11);
}

uint64_t Daemon.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  Daemon.init()();
  return v0;
}

uint64_t Daemon.init()()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = 0;
  if (qword_269327228 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_2693291D0);
  uint64_t v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24876F000, v3, v4, "Initializing daemon", v5, 2u);
    MEMORY[0x24C57FA90](v5, -1, -1);
  }

  uint64_t v6 = sub_2487A5F48();
  os_log_type_t v7 = sub_2487A65B8();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_24876F000, v6, v7, "Daemon entering sandbox", v8, 2u);
    MEMORY[0x24C57FA90](v8, -1, -1);
  }

  if (_set_user_dir_suffix())
  {
    id v9 = sub_2487A5F48();
    os_log_type_t v10 = sub_2487A65B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24876F000, v9, v10, "Creating IDS service and adding service delegate", v11, 2u);
      MEMORY[0x24C57FA90](v11, -1, -1);
    }

    if (qword_269327290 != -1) {
      swift_once();
    }
    unint64_t v12 = (void *)qword_2693292D0;
    *(void *)(v0 + 24) = qword_2693292D0;
    id v13 = v12;
    objc_super v14 = sub_2487A5F48();
    os_log_type_t v15 = sub_2487A65B8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_24876F000, v14, v15, "Creating Biome listener", v16, 2u);
      MEMORY[0x24C57FA90](v16, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_269327B40);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2487A7F50;
    type metadata accessor for ScreenTimeRequestBiomeEventHandler();
    *(void *)(v17 + 32) = sub_248778440();
    *(void *)(v17 + 40) = &off_26BA8D728;
    *(void *)(v1 + 32) = v17;
    return v1;
  }
  else
  {
    uint64_t result = sub_2487A67C8();
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall Daemon.startup()()
{
  uint64_t v1 = v0;
  uint64_t v3 = qword_269327B30;
  uint64_t v2 = off_269327B38;
  uint64_t v4 = qword_269327228;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2487A5F68();
  __swift_project_value_buffer(v5, (uint64_t)qword_2693291D0);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_2487A5F48();
  os_log_type_t v7 = sub_2487A65B8();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v9;
    *(_DWORD *)unint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_2487A24A8(v3, (unint64_t)v2, &v21);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v6, v7, "Starting daemon - %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v9, -1, -1);
    MEMORY[0x24C57FA90](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v10 = sub_2487A5F48();
  os_log_type_t v11 = sub_2487A65B8();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v12 = 0;
    _os_log_impl(&dword_24876F000, v10, v11, "Creating and resuming client connection listener", v12, 2u);
    MEMORY[0x24C57FA90](v12, -1, -1);
  }

  id v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269327B48));
  swift_bridgeObjectRetain();
  objc_super v14 = sub_2487A1A40(v3, (uint64_t)v2);
  sub_2487A1B74();
  os_log_type_t v15 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v14;
  uint64_t v16 = v14;

  swift_bridgeObjectRetain();
  uint64_t v17 = sub_2487A5F48();
  os_log_type_t v18 = sub_2487A65B8();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    swift_bridgeObjectRetain();
    sub_2487A24A8(v3, (unint64_t)v2, &v21);
    sub_2487A6698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24876F000, v17, v18, "Daemon started - %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v20, -1, -1);
    MEMORY[0x24C57FA90](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t Daemon.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Daemon.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2487A24A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2487A257C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2487970A0((uint64_t)v12, *a3);
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
      sub_2487970A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2487A257C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2487A66A8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2487A2738(a5, a6);
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
  uint64_t v8 = sub_2487A6798();
  if (!v8)
  {
    sub_2487A67B8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2487A6828();
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

uint64_t sub_2487A2738(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2487A27D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2487A2948(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2487A2948(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2487A27D0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_248781B24(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2487A6768();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2487A67B8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2487A6418();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2487A6828();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2487A67B8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2487A2948(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693276A8);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_2487A6828();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for Daemon()
{
  return self;
}

uint64_t method lookup function for Daemon(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Daemon);
}

uint64_t dispatch thunk of Daemon.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_2487A2AE8(unint64_t a1)
{
  uint64_t v2 = (void *)sub_24878E34C(MEMORY[0x263F8EE78]);
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2487A67E8();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_26:
    uint64_t result = v24;
    *(void *)(v24 + 16) = v2;
    return result;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_26;
  }
LABEL_3:
  unint64_t v25 = a1;
  unint64_t v26 = a1 & 0xC000000000000001;
  uint64_t v4 = 4;
  while (1)
  {
    uint64_t v6 = v4 - 4;
    if (v26)
    {
      uint64_t v7 = MEMORY[0x24C57F1A0](v4 - 4, a1);
      uint64_t v8 = v4 - 3;
      if (__OFADD__(v6, 1)) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 8 * v4);
      swift_retain();
      uint64_t v8 = v4 - 3;
      if (__OFADD__(v6, 1))
      {
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    a1 = *(void *)(v7 + 16);
    uint64_t v9 = *(void *)(v7 + 24);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v12 = sub_24878E5F4(a1, v9);
    uint64_t v13 = v2[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      goto LABEL_23;
    }
    char v16 = v11;
    if (v2[3] < v15) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v11) {
        goto LABEL_4;
      }
    }
    else
    {
      sub_24878FBC0();
      if (v16)
      {
LABEL_4:
        uint64_t v5 = v2[7];
        swift_release();
        *(void *)(v5 + 8 * v12) = v7;
        goto LABEL_5;
      }
    }
LABEL_18:
    v2[(v12 >> 6) + 8] |= 1 << v12;
    uint64_t v19 = (unint64_t *)(v2[6] + 16 * v12);
    *uint64_t v19 = a1;
    v19[1] = v9;
    *(void *)(v2[7] + 8 * v12) = v7;
    uint64_t v20 = v2[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_24;
    }
    v2[2] = v22;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v4;
    a1 = v25;
    if (v8 == v3) {
      goto LABEL_26;
    }
  }
  sub_24878EFC4(v15, isUniquelyReferenced_nonNull_native);
  unint64_t v17 = sub_24878E5F4(a1, v9);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  uint64_t result = sub_2487A68A8();
  __break(1u);
  return result;
}

uint64_t sub_2487A2D20()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2487A2D88()
{
  sub_248773FB0(v0 + 16);

  return v0;
}

uint64_t sub_2487A2DB8()
{
  sub_2487A2D88();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for BiomeStreamListener()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t getEnumTagSinglePayload for BiomeEventKind(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for BiomeEventKind(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2487A2EF4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2487A2F1C()
{
  return 0;
}

ValueMetadata *type metadata accessor for BiomeEventKind()
{
  return &type metadata for BiomeEventKind;
}

unint64_t sub_2487A2F38()
{
  unint64_t result = qword_269327C40;
  if (!qword_269327C40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269327C48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327C40);
  }
  return result;
}

uint64_t sub_2487A2F94()
{
  return 1;
}

uint64_t sub_2487A2F9C()
{
  return sub_2487A6928();
}

uint64_t sub_2487A2FF4()
{
  return sub_2487A63E8();
}

uint64_t sub_2487A3010()
{
  return sub_2487A6928();
}

uint64_t sub_2487A3064@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2487A6838();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2487A30B8(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x80000002487A8490;
}

unint64_t sub_2487A30D8()
{
  return 0xD000000000000011;
}

void sub_2487A30F4(void *a1@<X8>)
{
  *a1 = &unk_26FC7DC60;
}

unint64_t sub_2487A3108()
{
  unint64_t result = qword_269327C50;
  if (!qword_269327C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269327C50);
  }
  return result;
}

id sub_2487A315C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_2487A6758();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
  v6(a2, a3);
  sub_2487A3568();
  uint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_2487A6758();
  swift_bridgeObjectRelease();
  v6(a2, a3);
  uint64_t v7 = sub_2487A65F8();
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, void))(v9 + 104))((char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F140]);
  uint64_t v10 = sub_2487A6168();
  MEMORY[0x270FA5388](v10 - 8);
  sub_2487A6158();
  uint64_t v11 = sub_2487A65E8();
  MEMORY[0x270FA5388](v11);
  uint64_t v23 = MEMORY[0x263F8EE78];
  sub_248798454();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269327A20);
  sub_2487984A0();
  sub_2487A66D8();
  unint64_t v12 = (void *)sub_2487A6608();
  if (qword_269327260 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2487A5F68();
  __swift_project_value_buffer(v13, (uint64_t)qword_269329278);
  BOOL v14 = sub_2487A5F48();
  os_log_type_t v15 = sub_2487A65B8();
  if (os_log_type_enabled(v14, v15))
  {
    char v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v23 = v17;
    *(_DWORD *)char v16 = 136315138;
    v22[1] = sub_2487A24A8(0xD000000000000022, 0x80000002487A9F60, &v23);
    sub_2487A6698();
    _os_log_impl(&dword_24876F000, v14, v15, "Creating listening scheduler for %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57FA90](v17, -1, -1);
    MEMORY[0x24C57FA90](v16, -1, -1);
  }

  id v18 = objc_allocWithZone(MEMORY[0x263F2A758]);
  uint64_t v19 = (void *)sub_2487A63A8();
  id v20 = objc_msgSend(v18, sel_initWithIdentifier_targetQueue_waking_, v19, v12, a1 & 1);

  return v20;
}

unint64_t sub_2487A3568()
{
  unint64_t result = qword_269327A10;
  if (!qword_269327A10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269327A10);
  }
  return result;
}

uint64_t sub_2487A35A8()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_2487A35C8, 0, 0);
}

uint64_t sub_2487A35C8()
{
  uint64_t v10 = v0;
  if (*(_WORD *)(v0[3] + 24))
  {
    if (qword_269327248 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2487A5F68();
    __swift_project_value_buffer(v1, (uint64_t)qword_269329230);
    uint64_t v2 = sub_2487A5F48();
    os_log_type_t v3 = sub_2487A6598();
    if (os_log_type_enabled(v2, v3))
    {
      unsigned int v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v9 = v5;
      *(_DWORD *)unsigned int v4 = 136315138;
      v0[2] = sub_2487A24A8(0xD00000000000001ALL, 0x80000002487AA080, &v9);
      sub_2487A6698();
      _os_log_impl(&dword_24876F000, v2, v3, "%s Unhandled transport", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57FA90](v5, -1, -1);
      MEMORY[0x24C57FA90](v4, -1, -1);
    }

    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6(0);
  }
  else
  {
    uint64_t v8 = (void *)swift_task_alloc();
    v0[4] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_2487A3828;
    v8[4] = v0[3];
    return MEMORY[0x270FA2498](sub_2487A3944, 0, 0);
  }
}

uint64_t sub_2487A3828(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  os_log_type_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_2487A3924()
{
  *(void *)(v1 + 32) = v0;
  return MEMORY[0x270FA2498](sub_2487A3944, 0, 0);
}

uint64_t sub_2487A3944()
{
  uint64_t v23 = v0;
  uint64_t v1 = *(void *)(v0[4] + 32);
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain_n();
    os_log_type_t v3 = (unint64_t *)(v1 + 40);
    do
    {
      uint64_t v5 = *(v3 - 1);
      unint64_t v4 = *v3;
      swift_bridgeObjectRetain();
      uint64_t v6 = (void *)sub_2487A63A8();
      uint64_t v7 = IDSCopyBestGuessIDForID();

      if (v7)
      {
        uint64_t v8 = swift_bridgeObjectRelease();
        MEMORY[0x24C57EEB0](v8);
        if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2487A64E8();
        }
        sub_2487A64F8();
        sub_2487A64D8();
      }
      else
      {
        if (qword_269327248 != -1) {
          swift_once();
        }
        uint64_t v9 = sub_2487A5F68();
        __swift_project_value_buffer(v9, (uint64_t)qword_269329230);
        swift_bridgeObjectRetain_n();
        uint64_t v10 = sub_2487A5F48();
        os_log_type_t v11 = sub_2487A6598();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v12 = swift_slowAlloc();
          uint64_t v13 = swift_slowAlloc();
          uint64_t v22 = v13;
          *(_DWORD *)uint64_t v12 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v12 + 4) = sub_2487A24A8(v5, v4, &v22);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24876F000, v10, v11, "Best guess ID for %s was nil. Skipping destination.", (uint8_t *)v12, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C57FA90](v13, -1, -1);
          MEMORY[0x24C57FA90](v12, -1, -1);

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
      }
      v3 += 2;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v14 = v21;
    uint64_t v0 = v20;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  v0[5] = v14;
  swift_bridgeObjectRelease();
  if (qword_269327290 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_2693292D0;
  char v16 = (void *)swift_task_alloc();
  v0[6] = v16;
  _OWORD v16[2] = v15;
  v16[3] = v14;
  v16[4] = 0xD000000000000010;
  uint64_t v16[5] = 0x80000002487A9A60;
  uint64_t v17 = (void *)swift_task_alloc();
  v0[7] = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269327C90);
  *uint64_t v17 = v0;
  v17[1] = sub_2487A3D08;
  return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD00000000000002BLL, 0x80000002487AA0A0, sub_2487A41BC, v16, v18);
}

uint64_t sub_2487A3D08()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2487A3E20, 0, 0);
}

uint64_t sub_2487A3E20()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[2];
  if (qword_269327248 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2487A5F68();
  __swift_project_value_buffer(v2, (uint64_t)qword_269329230);
  swift_bridgeObjectRetain();
  os_log_type_t v3 = sub_2487A5F48();
  os_log_type_t v4 = sub_2487A65B8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    v0[3] = *(void *)(v1 + 16);
    sub_2487A6698();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24876F000, v3, v4, "Found %ld valid IDS destinations", v5, 0xCu);
    MEMORY[0x24C57FA90](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  uint64_t v6 = *(void *)(v1 + 16);
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t (*)(BOOL))v0[1];
  return v7(v6 != 0);
}

uint64_t sub_2487A3FA4()
{
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);

  return MEMORY[0x270FA0228](v0, 120, 7);
}

uint64_t type metadata accessor for PrivledgedRecipientGroup()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for PrivledgedRecipientGroup.Context(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for PrivledgedRecipientGroup.Context()
{
  return swift_release();
}

uint64_t assignWithCopy for PrivledgedRecipientGroup.Context(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for PrivledgedRecipientGroup.Context(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivledgedRecipientGroup.Context(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 10)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivledgedRecipientGroup.Context(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivledgedRecipientGroup.Context()
{
  return &type metadata for PrivledgedRecipientGroup.Context;
}

uint64_t sub_2487A41BC(uint64_t a1)
{
  return sub_248792338(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_2487A41C8(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, __int16 a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for IDSRelay();
  v30[3] = v12;
  v30[4] = &off_26FC7EA00;
  v30[0] = a1;
  uint64_t v13 = type metadata accessor for IDSLookupController();
  uint64_t v28 = v13;
  uint64_t v29 = &off_26FC7ED20;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
  sub_2487A5894(a2, (uint64_t)boxed_opaque_existential_1);
  type metadata accessor for PrivledgedRecipientGroup();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, v12);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v28);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v23 + 16))(v22);
  uint64_t v24 = *v18;
  *(void *)(v15 + 64) = v12;
  *(void *)(v15 + 72) = &off_26FC7EA00;
  *(void *)(v15 + 40) = v24;
  *(void *)(v15 + 104) = v13;
  *(void *)(v15 + 112) = &off_26FC7ED20;
  unint64_t v25 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v15 + 80));
  sub_2487A5894((uint64_t)v22, (uint64_t)v25);
  *(void *)(v15 + 16) = a3;
  *(_WORD *)(v15 + 24) = a4;
  *(_WORD *)(v15 + 26) = a5;
  *(void *)(v15 + 32) = a6;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return v15;
}

uint64_t sub_2487A440C(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, __int16 a5)
{
  *(_WORD *)(v5 + 292) = a5;
  *(_WORD *)(v5 + 290) = a4;
  *(void *)(v5 + 216) = a2;
  *(void *)(v5 + 224) = a3;
  *(void *)(v5 + 208) = a1;
  return MEMORY[0x270FA2498](sub_2487A4438, 0, 0);
}

uint64_t sub_2487A4438()
{
  if (*(unsigned __int16 *)(v0 + 292) != 0xFFFF)
  {
    if (*(_WORD *)(v0 + 292))
    {
      if (qword_269327248 != -1) {
        swift_once();
      }
      uint64_t v17 = sub_2487A5F68();
      __swift_project_value_buffer(v17, (uint64_t)qword_269329230);
      uint64_t v18 = sub_2487A5F48();
      os_log_type_t v19 = sub_2487A65A8();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 33554688;
        *(_WORD *)(v0 + 288) = sub_2487A6088();
        sub_2487A6698();
        _os_log_impl(&dword_24876F000, v18, v19, "Error inflating recipient group. Recipient group was unknown. %hd", v20, 6u);
        MEMORY[0x24C57FA90](v20, -1, -1);
      }

      uint64_t v21 = *(void *)(v0 + 208);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
      sub_2487A5844(&qword_269327780, &qword_269327778);
      swift_allocError();
      uint64_t v23 = 2;
    }
    else
    {
      int v1 = (unsigned __int16)sub_2487A6328();
      if (v1 == (unsigned __int16)sub_2487A6328())
      {
        id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3BF48]), sel_init);
        *(void *)(v0 + 232) = v2;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 200;
        *(void *)(v0 + 24) = sub_2487A4AB0;
        uint64_t v3 = swift_continuation_init();
        *(void *)(v0 + 160) = MEMORY[0x263EF8330];
        *(void *)(v0 + 168) = 0x40000000;
        *(void *)(v0 + 176) = sub_2487801D0;
        *(void *)(v0 + 184) = &block_descriptor_0;
        *(void *)(v0 + 192) = v3;
        objc_msgSend(v2, sel_startRequestWithCompletionHandler_, v0 + 160);
        return MEMORY[0x270FA23F0](v0 + 16);
      }
      uint64_t v21 = *(void *)(v0 + 208);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
      sub_2487A5844(&qword_269327780, &qword_269327778);
      swift_allocError();
      uint64_t v23 = 1;
    }
    *uint64_t v22 = v23;
    swift_willThrow();
    swift_release();
    goto LABEL_24;
  }
  if (!*(void *)(v0 + 224))
  {
    uint64_t v21 = *(void *)(v0 + 208);
    uint64_t KeyPath = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327CA8);
    sub_2487A5844(qword_269327CB0, &qword_269327CA8);
    swift_allocError();
    *unint64_t v25 = KeyPath;
    swift_willThrow();
LABEL_24:
    __swift_destroy_boxed_opaque_existential_1(v21);
    __swift_destroy_boxed_opaque_existential_1(*(void *)(v0 + 216));
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
  swift_retain();
  if ((sub_248790ABC(0xD000000000000025, 0x80000002487A8460) & 1) == 0)
  {
    uint64_t v21 = *(void *)(v0 + 208);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
    sub_2487A5844(&qword_269327780, &qword_269327778);
    swift_allocError();
    *unint64_t v26 = 0;
LABEL_23:
    swift_willThrow();
    swift_release_n();
    goto LABEL_24;
  }
  int v4 = (unsigned __int16)sub_2487A6328();
  if (v4 != (unsigned __int16)sub_2487A6328())
  {
    uint64_t v21 = *(void *)(v0 + 208);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
    sub_2487A5844(&qword_269327780, &qword_269327778);
    swift_allocError();
    *unint64_t v27 = 1;
    goto LABEL_23;
  }
  swift_release();
  uint64_t v5 = *(void *)(v0 + 216);
  uint64_t v32 = *(void *)(v0 + 224);
  uint64_t v6 = *(void *)(v0 + 208);
  __int16 v30 = *(_WORD *)(v0 + 292);
  __int16 v31 = *(_WORD *)(v0 + 290);
  sub_24878CADC(v6, v0 + 80);
  sub_24878CADC(v5, v0 + 120);
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 80, v7);
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16))(v10, v8, v7);
  uint64_t v11 = *(void *)(v0 + 144);
  uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 120, v11);
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v14, v12, v11);
  uint64_t v15 = sub_2487A41C8(*v10, v14, v32, v31, v30, MEMORY[0x263F8EE78]);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v6);
  __swift_destroy_boxed_opaque_existential_1(v5);
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v16(v15);
}

uint64_t sub_2487A4AB0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 240) = v1;
  if (v1) {
    id v2 = sub_2487A53A4;
  }
  else {
    id v2 = sub_2487A4BC0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2487A4BC0()
{
  uint64_t v1 = (void *)v0[25];
  v0[31] = v1;
  unint64_t v2 = sub_2487A65C8();
  uint64_t v3 = v2;
  v0[32] = v2;
  if (v2 >> 62)
  {
    if (sub_2487A67E8()) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    __swift_project_boxed_opaque_existential_1((void *)v0[27], *(void *)(v0[27] + 24));
    uint64_t v4 = (void *)swift_task_alloc();
    v0[33] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_2487A4E28;
    return sub_248798548(v3);
  }
  swift_bridgeObjectRelease();
  if (qword_269327248 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2487A5F68();
  __swift_project_value_buffer(v6, (uint64_t)qword_269329230);
  uint64_t v7 = sub_2487A5F48();
  os_log_type_t v8 = sub_2487A65A8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_24876F000, v7, v8, "There were no parents and guardians. This shouldn't ever happen. Please file a radar to Family Frameworks - AskTo | All.", v9, 2u);
    MEMORY[0x24C57FA90](v9, -1, -1);
  }
  uint64_t v10 = (void *)v0[29];
  uint64_t v11 = v0[26];

  __swift_instantiateConcreteTypeFromMangledName(&qword_269327778);
  sub_2487A5844(&qword_269327780, &qword_269327778);
  swift_allocError();
  *uint64_t v12 = 3;
  swift_willThrow();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v11);
  __swift_destroy_boxed_opaque_existential_1(v0[27]);
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2487A4E28(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 272) = a1;
  *(void *)(v3 + 280) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v4 = sub_2487A5314;
  }
  else {
    uint64_t v4 = sub_2487A4F64;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

void sub_2487A4F64()
{
  int64_t v1 = 0;
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v4 = v2 + 64;
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & v3;
  int64_t v8 = (unint64_t)(63 - v6) >> 6;
  uint64_t v36 = (void *)MEMORY[0x263F8EE78];
  if ((v5 & v3) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v9 | (v1 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v1 << 6))
  {
    uint64_t v11 = *(void **)(*(void *)(v2 + 56) + 8 * i);
    if (v11[2])
    {
      uint64_t v16 = v11[4];
      uint64_t v15 = v11[5];
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v36 = sub_24879FB50(0, v36[2] + 1, 1, v36);
      }
      unint64_t v18 = v36[2];
      unint64_t v17 = v36[3];
      if (v18 >= v17 >> 1) {
        uint64_t v36 = sub_24879FB50((void *)(v17 > 1), v18 + 1, 1, v36);
      }
      v36[2] = v18 + 1;
      os_log_type_t v19 = &v36[2 * v18];
      void v19[4] = v16;
      v19[5] = v15;
      if (v7) {
        goto LABEL_4;
      }
    }
    else if (v7)
    {
      goto LABEL_4;
    }
LABEL_7:
    int64_t v12 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      return;
    }
    if (v12 >= v8) {
      goto LABEL_27;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v12);
    ++v1;
    if (!v13)
    {
      int64_t v1 = v12 + 1;
      if (v12 + 1 >= v8) {
        goto LABEL_27;
      }
      unint64_t v13 = *(void *)(v4 + 8 * v1);
      if (!v13)
      {
        int64_t v1 = v12 + 2;
        if (v12 + 2 >= v8) {
          goto LABEL_27;
        }
        unint64_t v13 = *(void *)(v4 + 8 * v1);
        if (!v13) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 < v8)
  {
    unint64_t v13 = *(void *)(v4 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        int64_t v1 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_31;
        }
        if (v1 >= v8) {
          goto LABEL_27;
        }
        unint64_t v13 = *(void *)(v4 + 8 * v1);
        ++v14;
        if (v13) {
          goto LABEL_20;
        }
      }
    }
    int64_t v1 = v14;
    goto LABEL_20;
  }
LABEL_27:
  uint64_t v20 = *(void **)(v0 + 248);

  swift_release();
  uint64_t v21 = *(void *)(v0 + 216);
  uint64_t v35 = *(void *)(v0 + 224);
  uint64_t v22 = *(void *)(v0 + 208);
  __int16 v33 = *(_WORD *)(v0 + 292);
  __int16 v34 = *(_WORD *)(v0 + 290);
  sub_24878CADC(v22, v0 + 80);
  sub_24878CADC(v21, v0 + 120);
  uint64_t v23 = *(void *)(v0 + 104);
  uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 80, v23);
  uint64_t v25 = *(void *)(v23 - 8);
  unint64_t v26 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(v26, v24, v23);
  uint64_t v27 = *(void *)(v0 + 144);
  uint64_t v28 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 120, v27);
  uint64_t v29 = *(void *)(v27 - 8);
  uint64_t v30 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v30, v28, v27);
  uint64_t v31 = sub_2487A41C8(*v26, v30, v35, v34, v33, (uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v22);
  __swift_destroy_boxed_opaque_existential_1(v21);
  uint64_t v32 = *(void (**)(uint64_t))(v0 + 8);
  v32(v31);
}

uint64_t sub_2487A5314()
{
  int64_t v1 = *(void **)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 208);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_destroy_boxed_opaque_existential_1(*(void *)(v0 + 216));
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2487A53A4()
{
  int64_t v1 = (void *)v0[29];
  uint64_t v2 = v0[26];
  swift_willThrow();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_destroy_boxed_opaque_existential_1(v0[27]);
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2487A543C(uint64_t a1, __int16 a2, __int16 a3)
{
  *(_WORD *)(v3 + 146) = a3;
  *(_WORD *)(v3 + 144) = a2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = type metadata accessor for IDSLookupController();
  *(void *)(v3 + 112) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2487A54D8, 0, 0);
}

uint64_t sub_2487A54D8()
{
  if (qword_269327290 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = (void *)qword_2693292D0;
  sub_248797D60(v1);
  *(void *)(v0 + 40) = type metadata accessor for IDSRelay();
  *(void *)(v0 + 48) = &off_26FC7EA00;
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 80) = v2;
  *(void *)(v0 + 88) = &off_26FC7ED20;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  sub_248774B24(v1, (uint64_t)boxed_opaque_existential_1);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269327CA0 + dword_269327CA0);
  id v5 = v3;
  swift_retain();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2487A5638;
  uint64_t v7 = *(void *)(v0 + 96);
  uint64_t v8 = *(unsigned __int16 *)(v0 + 146);
  uint64_t v9 = *(unsigned __int16 *)(v0 + 144);
  return v11(v0 + 16, v0 + 56, v7, v9, v8);
}

uint64_t sub_2487A5638(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 128) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v5 = sub_2487A57D4;
  }
  else
  {
    *(void *)(v4 + 136) = a1;
    id v5 = sub_2487A5760;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2487A5760()
{
  sub_248774BEC(v0[14]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[17];
  return v1(v2);
}

uint64_t sub_2487A57D4()
{
  sub_248774BEC(*(void *)(v0 + 112));
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2487A5844(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2487A5894(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IDSLookupController();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2487A58F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t *sub_2487A5900(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_retain();
  }
  *a1 = v3;
  return a1;
}

unint64_t sub_2487A593C(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_release();
  }
  return result;
}

unint64_t *sub_2487A5954(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_retain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_retain();
    swift_release();
  }
  return a1;
}

unint64_t *sub_2487A59E8(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_release();
LABEL_6:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_release();
  return a1;
}

uint64_t sub_2487A5A4C(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFA && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483643);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 4;
  if (v4 >= 6) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_2487A5AA4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 4;
    }
  }
  return result;
}

uint64_t type metadata accessor for PrivledgedRecipientGroup.Error()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2487A5B14(char a1, __int16 a2)
{
  if (a1 == 3)
  {
    if (qword_269327228 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2487A5F68();
    __swift_project_value_buffer(v3, (uint64_t)qword_2693291D0);
    unsigned int v4 = sub_2487A5F48();
    os_log_type_t v5 = sub_2487A65B8();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_24876F000, v4, v5, "Client is ScreenTime. Returning ScreenTime response tasks.", v6, 2u);
      MEMORY[0x24C57FA90](v6, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_269327D38);
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_2487A7F50;
    *(void *)(result + 56) = &type metadata for ScreenTimeResponseTask;
    *(void *)(result + 64) = &off_26FC7E9E8;
    *(unsigned char *)(result + 32) = 3;
    *(_WORD *)(result + 34) = a2;
  }
  else
  {
    if (qword_269327228 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2487A5F68();
    __swift_project_value_buffer(v8, (uint64_t)qword_2693291D0);
    uint64_t v9 = sub_2487A5F48();
    os_log_type_t v10 = sub_2487A65B8();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24876F000, v9, v10, "Client is an AskTo-owned process. Returning no response tasks.", v11, 2u);
      MEMORY[0x24C57FA90](v11, -1, -1);
    }

    return MEMORY[0x263F8EE78];
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientResponseTaskMapper()
{
  return &type metadata for ClientResponseTaskMapper;
}

uint64_t sub_2487A5D08()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_2487A5D18()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_2487A5D28()
{
  return MEMORY[0x270EEE3D8]();
}

uint64_t sub_2487A5D38()
{
  return MEMORY[0x270EEE3E8]();
}

uint64_t sub_2487A5D48()
{
  return MEMORY[0x270EEE400]();
}

uint64_t sub_2487A5D58()
{
  return MEMORY[0x270EEE418]();
}

uint64_t sub_2487A5D68()
{
  return MEMORY[0x270EEE4A8]();
}

uint64_t sub_2487A5D78()
{
  return MEMORY[0x270EEE4B8]();
}

uint64_t sub_2487A5D88()
{
  return MEMORY[0x270EEE510]();
}

uint64_t sub_2487A5D98()
{
  return MEMORY[0x270EEE528]();
}

uint64_t sub_2487A5DA8()
{
  return MEMORY[0x270EEE608]();
}

uint64_t sub_2487A5DB8()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_2487A5DC8()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_2487A5DD8()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_2487A5DE8()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_2487A5DF8()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_2487A5E08()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_2487A5E18()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_2487A5E28()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_2487A5E38()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_2487A5E48()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_2487A5E58()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_2487A5E68()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_2487A5E78()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_2487A5E88()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_2487A5E98()
{
  return MEMORY[0x270F083C8]();
}

uint64_t sub_2487A5EA8()
{
  return MEMORY[0x270F083D0]();
}

uint64_t sub_2487A5EB8()
{
  return MEMORY[0x270F083D8]();
}

uint64_t sub_2487A5EC8()
{
  return MEMORY[0x270EEB820]();
}

uint64_t sub_2487A5ED8()
{
  return MEMORY[0x270EEB830]();
}

uint64_t sub_2487A5EE8()
{
  return MEMORY[0x270EEB848]();
}

uint64_t sub_2487A5F08()
{
  return MEMORY[0x270EEB858]();
}

uint64_t sub_2487A5F18()
{
  return MEMORY[0x270EEB870]();
}

uint64_t sub_2487A5F28()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_2487A5F38()
{
  return MEMORY[0x270EEB8F0]();
}

uint64_t sub_2487A5F48()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2487A5F58()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2487A5F68()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2487A5F78()
{
  return MEMORY[0x270F0E9E8]();
}

uint64_t sub_2487A5F88()
{
  return MEMORY[0x270F0E9F0]();
}

uint64_t sub_2487A5F98()
{
  return MEMORY[0x270F0E9F8]();
}

uint64_t sub_2487A5FA8()
{
  return MEMORY[0x270F0EA00]();
}

uint64_t sub_2487A5FB8()
{
  return MEMORY[0x270F0EA08]();
}

uint64_t sub_2487A5FC8()
{
  return MEMORY[0x270F0EA10]();
}

uint64_t sub_2487A5FD8()
{
  return MEMORY[0x270F0EA18]();
}

uint64_t sub_2487A5FE8()
{
  return MEMORY[0x270F0EA20]();
}

uint64_t sub_2487A5FF8()
{
  return MEMORY[0x270F0EA28]();
}

uint64_t sub_2487A6008()
{
  return MEMORY[0x270F0EA30]();
}

uint64_t sub_2487A6018()
{
  return MEMORY[0x270F0EA40]();
}

uint64_t sub_2487A6028()
{
  return MEMORY[0x270F0EA48]();
}

uint64_t sub_2487A6038()
{
  return MEMORY[0x270F0EA50]();
}

uint64_t sub_2487A6048()
{
  return MEMORY[0x270F0EA58]();
}

uint64_t sub_2487A6058()
{
  return MEMORY[0x270F0EA60]();
}

uint64_t sub_2487A6068()
{
  return MEMORY[0x270F0EA68]();
}

uint64_t sub_2487A6078()
{
  return MEMORY[0x270F0EA70]();
}

uint64_t sub_2487A6088()
{
  return MEMORY[0x270F0EA78]();
}

uint64_t sub_2487A6098()
{
  return MEMORY[0x270F533B8]();
}

uint64_t sub_2487A60A8()
{
  return MEMORY[0x270F533C0]();
}

uint64_t sub_2487A60B8()
{
  return MEMORY[0x270F533D0]();
}

uint64_t sub_2487A60C8()
{
  return MEMORY[0x270F53448]();
}

uint64_t sub_2487A60D8()
{
  return MEMORY[0x270F53450]();
}

uint64_t sub_2487A60E8()
{
  return MEMORY[0x270F53458]();
}

uint64_t sub_2487A60F8()
{
  return MEMORY[0x270F53460]();
}

uint64_t sub_2487A6108()
{
  return MEMORY[0x270F53468]();
}

uint64_t sub_2487A6118()
{
  return MEMORY[0x270F53470]();
}

uint64_t sub_2487A6128()
{
  return MEMORY[0x270F53478]();
}

uint64_t sub_2487A6138()
{
  return MEMORY[0x270F53480]();
}

uint64_t sub_2487A6148()
{
  return MEMORY[0x270FA09E0]();
}

uint64_t sub_2487A6158()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_2487A6168()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_2487A6178()
{
  return MEMORY[0x270F0EA80]();
}

uint64_t sub_2487A6188()
{
  return MEMORY[0x270F0EA88]();
}

uint64_t sub_2487A6198()
{
  return MEMORY[0x270F0EA90]();
}

uint64_t sub_2487A61A8()
{
  return MEMORY[0x270F0EA98]();
}

uint64_t sub_2487A61B8()
{
  return MEMORY[0x270F0EAA0]();
}

uint64_t sub_2487A61C8()
{
  return MEMORY[0x270F0EAA8]();
}

uint64_t sub_2487A61D8()
{
  return MEMORY[0x270F0EAB0]();
}

uint64_t sub_2487A61E8()
{
  return MEMORY[0x270F0EAB8]();
}

uint64_t sub_2487A61F8()
{
  return MEMORY[0x270F0EAC0]();
}

uint64_t sub_2487A6208()
{
  return MEMORY[0x270F0EAF0]();
}

uint64_t sub_2487A6218()
{
  return MEMORY[0x270F0EAF8]();
}

uint64_t sub_2487A6228()
{
  return MEMORY[0x270F0EB00]();
}

uint64_t sub_2487A6238()
{
  return MEMORY[0x270F0EB08]();
}

uint64_t sub_2487A6248()
{
  return MEMORY[0x270F0EB10]();
}

uint64_t sub_2487A6258()
{
  return MEMORY[0x270F0EB18]();
}

uint64_t sub_2487A6268()
{
  return MEMORY[0x270F0EB20]();
}

uint64_t sub_2487A6278()
{
  return MEMORY[0x270F0EB30]();
}

uint64_t sub_2487A6288()
{
  return MEMORY[0x270F0EB38]();
}

uint64_t sub_2487A6298()
{
  return MEMORY[0x270F0EB40]();
}

uint64_t sub_2487A62A8()
{
  return MEMORY[0x270F0EB48]();
}

uint64_t sub_2487A62B8()
{
  return MEMORY[0x270F0EB50]();
}

uint64_t sub_2487A62C8()
{
  return MEMORY[0x270F0EB58]();
}

uint64_t sub_2487A62D8()
{
  return MEMORY[0x270F0EB60]();
}

uint64_t sub_2487A62E8()
{
  return MEMORY[0x270F0EB68]();
}

uint64_t sub_2487A62F8()
{
  return MEMORY[0x270F0EB70]();
}

uint64_t sub_2487A6308()
{
  return MEMORY[0x270F0EB78]();
}

uint64_t sub_2487A6318()
{
  return MEMORY[0x270F0EB80]();
}

uint64_t sub_2487A6328()
{
  return MEMORY[0x270F0EB88]();
}

uint64_t sub_2487A6338()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_2487A6348()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2487A6358()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_2487A6368()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_2487A6378()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_2487A6388()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_2487A6398()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2487A63A8()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_2487A63B8()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_2487A63C8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2487A63D8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2487A63E8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2487A63F8()
{
  return MEMORY[0x270F53558]();
}

uint64_t sub_2487A6408()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2487A6418()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2487A6428()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2487A6438()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2487A6458()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2487A6468()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2487A6478()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2487A6488()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2487A6498()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2487A64A8()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_2487A64B8()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_2487A64C8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2487A64D8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2487A64E8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2487A64F8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2487A6508()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2487A6518()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2487A6528()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2487A6538()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2487A6548()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2487A6558()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_2487A6568()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2487A6588()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2487A6598()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2487A65A8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2487A65B8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2487A65C8()
{
  return MEMORY[0x270F28578]();
}

uint64_t sub_2487A65D8()
{
  return MEMORY[0x270FA0C18]();
}

uint64_t sub_2487A65E8()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_2487A65F8()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_2487A6608()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_2487A6618()
{
  return MEMORY[0x270FA0F38]();
}

uint64_t sub_2487A6628()
{
  return MEMORY[0x270FA0F40]();
}

uint64_t sub_2487A6638()
{
  return MEMORY[0x270FA0F80]();
}

uint64_t sub_2487A6648()
{
  return MEMORY[0x270FA0F98]();
}

uint64_t sub_2487A6658()
{
  return MEMORY[0x270EF2088]();
}

uint64_t sub_2487A6668()
{
  return MEMORY[0x270EF2098]();
}

uint64_t sub_2487A6678()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_2487A6688()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_2487A6698()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2487A66A8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2487A66B8()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_2487A66C8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2487A66D8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2487A66E8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2487A66F8()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_2487A6708()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2487A6718()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2487A6728()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2487A6738()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2487A6748()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2487A6758()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2487A6768()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2487A6778()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_2487A6788()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2487A6798()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2487A67A8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2487A67B8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2487A67C8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2487A67D8()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_2487A67E8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2487A67F8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2487A6808()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2487A6818()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2487A6828()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2487A6838()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2487A6848()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2487A6868()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2487A6878()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_2487A6898()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2487A68A8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2487A68B8()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_2487A68C8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2487A68D8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2487A68E8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2487A68F8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2487A6908()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2487A6918()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2487A6928()
{
  return MEMORY[0x270F9FC90]();
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47D8](allocator, capacity);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

uint64_t IDSCopyBestGuessIDForID()
{
  return MEMORY[0x270F3C960]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x270F3D000]();
}

uint64_t IMSPIBatchFetchMessageGUIDsWithBalloonBundleID()
{
  return MEMORY[0x270F3CB28]();
}

uint64_t IMSPISendMSMessagePayloadReturningGUID()
{
  return MEMORY[0x270F3CB60]();
}

uint64_t IMSPIUpdatePluginMessageWithGUID()
{
  return MEMORY[0x270F3CB78]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9338]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}