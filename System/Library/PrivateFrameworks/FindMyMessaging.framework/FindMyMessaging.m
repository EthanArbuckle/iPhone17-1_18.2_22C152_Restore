uint64_t QueryController.serviceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

void *QueryController.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  v4 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    v4[14] = result;
    v4[15] = a1;
    v4[16] = a2;
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *QueryController.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  swift_defaultActor_initialize();
  result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    v2[14] = result;
    v2[15] = a1;
    v2[16] = a2;
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24E4DC724(uint64_t a1)
{
  *(unsigned char *)(v2 + 57) = *(unsigned char *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = v4;
  return MEMORY[0x270FA2498](sub_24E4DC754, v1, 0);
}

uint64_t sub_24E4DC754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v3 = *(void *)(v2 + 32);
  char v5 = *(unsigned char *)(v2 + 57);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = sub_24E4E0C64((unint64_t *)&unk_2698EE348, a2, (void (*)(uint64_t))type metadata accessor for QueryController);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v2 + 40) = v8;
  *(void *)(v8 + 16) = v6;
  *(unsigned char *)(v8 + 24) = v5;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v3;
  v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v9;
  void *v9 = v2;
  v9[1] = sub_24E4DC8A8;
  uint64_t v10 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v2 + 56, v6, v7, 0xD00000000000001ALL, 0x800000024E52F0F0, sub_24E4DCD54, v8, v10);
}

uint64_t sub_24E4DC8A8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4DC9D4, v1, 0);
}

uint64_t sub_24E4DC9D4()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 56));
}

uint64_t type metadata accessor for QueryController()
{
  return self;
}

void sub_24E4DCA10(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a4;
  int v29 = a3;
  uint64_t v25 = a1;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3D8);
  uint64_t v7 = *(void *)(v24 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v9 = sub_24E52CF00();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v28 = *(id *)(a2 + 112);
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_24E52CFE0();
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_24E52CFE0();
  v13 = (void *)sub_24E52CFE0();
  sub_24E4E0C04();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F8F080], v9);
  v14 = (void *)sub_24E52D210();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  uint64_t v16 = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v25, v24);
  unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  *(unsigned char *)(v18 + 24) = v29;
  *(void *)(v18 + 32) = v23;
  *(void *)(v18 + 40) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v17, (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
  aBlock[4] = sub_24E4E0EDC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E4DD250;
  aBlock[3] = &block_descriptor_32;
  v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  v20 = (void *)v27;
  v21 = (void *)v26;
  objc_msgSend(v28, sel_currentIDStatusForDestination_service_listenerID_queue_completionBlock_, v27, v26, v13, v14, v19);
  _Block_release(v19);
}

void sub_24E4DCD54(uint64_t a1)
{
  sub_24E4DCA10(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

void sub_24E4DCD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = a6;
  uint64_t v36 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3D8);
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v37 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24E52CF00();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v15 = Strong;
    if (a1)
    {
      if (qword_2698EE320 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_24E52CEF0();
      __swift_project_value_buffer(v16, (uint64_t)qword_2698EEB20);
      unint64_t v17 = sub_24E52CED0();
      os_log_type_t v18 = sub_24E52D200();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_24E4DA000, v17, v18, "FindMyMessaging: lookup status is valid, no need to refresh", v19, 2u);
        MEMORY[0x25333DD20](v19, -1, -1);
      }

      LOBYTE(aBlock[0]) = a1 == 1;
      sub_24E52D130();
      swift_release();
    }
    else
    {
      if (qword_2698EE320 != -1) {
        swift_once();
      }
      uint64_t v35 = v7;
      uint64_t v20 = sub_24E52CEF0();
      __swift_project_value_buffer(v20, (uint64_t)qword_2698EEB20);
      v21 = sub_24E52CED0();
      os_log_type_t v22 = sub_24E52D200();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_24E4DA000, v21, v22, "FindMyMessaging: lookup status is unknown, refreshing", v23, 2u);
        MEMORY[0x25333DD20](v23, -1, -1);
      }

      id v34 = *(id *)(v15 + 112);
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_24E52CFE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v24 = (void *)sub_24E52CFE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v25 = (void *)sub_24E52CFE0();
      swift_bridgeObjectRelease();
      sub_24E4E0C04();
      (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F8F080], v10);
      uint64_t v26 = (void *)sub_24E52D210();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      uint64_t v27 = v37;
      uint64_t v28 = v35;
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v38, v35);
      unint64_t v29 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
      uint64_t v30 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v30 + v29, v9, v28);
      aBlock[4] = sub_24E4E0FF0;
      aBlock[5] = v30;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_24E4DD250;
      aBlock[3] = &block_descriptor_38;
      v31 = _Block_copy(aBlock);
      swift_release();
      id v32 = v34;
      v33 = (void *)v36;
      objc_msgSend(v34, sel_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_, v36, v24, v25, v26, v31);
      swift_release();
      _Block_release(v31);
    }
  }
}

uint64_t sub_24E4DD250(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_24E4DD2A4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v3 + 136) = *(unsigned char *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(v3 + 80) = v2;
  *(void *)(v3 + 88) = v4;
  *(void *)(v3 + 96) = v5;
  *(unsigned char *)(v3 + 137) = *a2;
  return MEMORY[0x270FA2498](sub_24E4DD2DC, v2, 0);
}

uint64_t sub_24E4DD2DC()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  char v3 = *(unsigned char *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 104) = inited;
  *(_OWORD *)(inited + 16) = xmmword_24E52DE40;
  *(unsigned char *)(inited + 32) = v3;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v1;
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 112) = v6;
  *(void *)(v6 + 16) = inited;
  *(void *)(v6 + 24) = v4;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2698EE360);
  *uint64_t v7 = v0;
  v7[1] = sub_24E4DD424;
  return MEMORY[0x270F28DC8](v0 + 72, 0xD00000000000001CLL, 0x800000024E52F110, sub_24E4E00FC, v6, v8);
}

uint64_t sub_24E4DD424()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = sub_24E4DD9A0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    swift_task_dealloc();
    uint64_t v4 = sub_24E4DD54C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4DD54C()
{
  char v1 = *(unsigned char *)(v0 + 137);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v2 = *(void *)(v0 + 72);
  *(unsigned char *)(swift_task_alloc() + 16) = v1;
  uint64_t v26 = v2 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v2 + 64);
  int64_t v27 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v28 = v2;
  while (1)
  {
    if (v5)
    {
      unint64_t v7 = __clz(__rbit64(v5));
      uint64_t v8 = (v5 - 1) & v5;
      int64_t v30 = v6;
      unint64_t v9 = v7 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v10 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_40;
    }
    if (v10 >= v27) {
      break;
    }
    unint64_t v11 = *(void *)(v26 + 8 * v10);
    int64_t i = v6 + 1;
    if (!v11)
    {
      int64_t i = v6 + 2;
      if (v6 + 2 >= v27) {
        break;
      }
      unint64_t v11 = *(void *)(v26 + 8 * i);
      if (!v11)
      {
        int64_t i = v6 + 3;
        if (v6 + 3 >= v27) {
          break;
        }
        unint64_t v11 = *(void *)(v26 + 8 * i);
        if (!v11)
        {
          int64_t i = v6 + 4;
          if (v6 + 4 >= v27) {
            break;
          }
          unint64_t v11 = *(void *)(v26 + 8 * i);
          if (!v11)
          {
            uint64_t v13 = v6 + 5;
            if (v6 + 5 >= v27) {
              break;
            }
            unint64_t v11 = *(void *)(v26 + 8 * v13);
            for (int64_t i = v6 + 5; !v11; ++v13)
            {
              int64_t i = v13 + 1;
              if (__OFADD__(v13, 1)) {
                goto LABEL_41;
              }
              if (i >= v27) {
                goto LABEL_38;
              }
              unint64_t v11 = *(void *)(v26 + 8 * i);
            }
          }
        }
      }
    }
    uint64_t v8 = (v11 - 1) & v11;
    int64_t v30 = i;
    unint64_t v9 = __clz(__rbit64(v11)) + (i << 6);
LABEL_22:
    unint64_t v14 = *(void *)(*(void *)(v2 + 56) + 8 * v9);
    unint64_t v29 = v8;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_24E52D460();
      if (v15)
      {
LABEL_24:
        uint64_t v16 = 0;
        while (1)
        {
          id v17 = (v14 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x25333D430](v16, v14)
              : *(id *)(v14 + 8 * v16 + 32);
          os_log_type_t v18 = v17;
          uint64_t v19 = v16 + 1;
          if (__OFADD__(v16, 1)) {
            break;
          }
          id v20 = objc_msgSend(v17, sel_capabilities);
          sub_24E52CFF0();
          v21 = (void *)sub_24E52CFE0();
          swift_bridgeObjectRelease();
          id v22 = objc_msgSend(v20, sel_valueForCapability_, v21);

          if (v22 == (id)1)
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v23 = 1;
            goto LABEL_35;
          }
          ++v16;
          if (v19 == v15) {
            goto LABEL_4;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        JUMPOUT(0x24E4DD988);
      }
    }
    else
    {
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      if (v15) {
        goto LABEL_24;
      }
    }
LABEL_4:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v2 = v28;
    unint64_t v5 = v29;
    int64_t v6 = v30;
  }
LABEL_38:
  swift_release();
  uint64_t v23 = 0;
LABEL_35:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v24(v23);
}

uint64_t sub_24E4DD9A0()
{
  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24E4DDA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = a3;
  *(unsigned char *)(v4 + 152) = *(unsigned char *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(v4 + 96) = v3;
  *(void *)(v4 + 104) = v5;
  *(void *)(v4 + 112) = v6;
  return MEMORY[0x270FA2498](sub_24E4DDA5C, v3, 0);
}

uint64_t sub_24E4DDA5C()
{
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  char v3 = *(unsigned char *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 120) = inited;
  *(_OWORD *)(inited + 16) = xmmword_24E52DE40;
  *(unsigned char *)(inited + 32) = v3;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v1;
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 128) = v6;
  *(void *)(v6 + 16) = inited;
  *(void *)(v6 + 24) = v4;
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2698EE360);
  *unint64_t v7 = v0;
  v7[1] = sub_24E4DDBA4;
  return MEMORY[0x270F28DC8](v0 + 72, 0xD00000000000001CLL, 0x800000024E52F110, sub_24E4E1098, v6, v8);
}

uint64_t sub_24E4DDBA4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = sub_24E4DDDB0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 96);
    swift_task_dealloc();
    uint64_t v4 = sub_24E4DDCCC;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4DDCCC()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v3 = v0[9];
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  char v5 = sub_24E4DFECC(v3, (uint64_t (*)(unsigned char *, uint64_t))sub_24E4E0104);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6(v5 & 1);
}

uint64_t sub_24E4DDDB0()
{
  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

BOOL sub_24E4DDE38(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  BOOL v3 = sub_24E4E0A68(a2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_24E4DDE9C(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v3 + 153) = *(unsigned char *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(v3 + 80) = v2;
  *(void *)(v3 + 88) = v4;
  *(void *)(v3 + 96) = v5;
  *(unsigned char *)(v3 + 154) = *a2;
  return MEMORY[0x270FA2498](sub_24E4DDED4, v2, 0);
}

uint64_t sub_24E4DDED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 88);
  uint64_t v3 = *(void *)(v2 + 96);
  char v5 = *(unsigned char *)(v2 + 153);
  uint64_t v6 = *(void *)(v2 + 80);
  uint64_t v7 = sub_24E4E0C64((unint64_t *)&unk_2698EE348, a2, (void (*)(uint64_t))type metadata accessor for QueryController);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v2 + 104) = v8;
  *(void *)(v8 + 16) = v6;
  *(unsigned char *)(v8 + 24) = v5;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v3;
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 112) = v9;
  void *v9 = v2;
  v9[1] = sub_24E4DE028;
  uint64_t v10 = MEMORY[0x263F8D4F8];
  return MEMORY[0x270FA2318](v2 + 152, v6, v7, 0xD00000000000001ALL, 0x800000024E52F0F0, sub_24E4E1084, v8, v10);
}

uint64_t sub_24E4DE028()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4DE154, v1, 0);
}

uint64_t sub_24E4DE154()
{
  if (*(unsigned char *)(v0 + 152) == 1)
  {
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v1 = *(void *)(v0 + 96);
    char v3 = *(unsigned char *)(v0 + 153);
    uint64_t v4 = *(void *)(v0 + 80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
    uint64_t inited = swift_initStackObject();
    *(void *)(v0 + 120) = inited;
    *(_OWORD *)(inited + 16) = xmmword_24E52DE40;
    *(unsigned char *)(inited + 32) = v3;
    *(void *)(inited + 40) = v2;
    *(void *)(inited + 48) = v1;
    swift_bridgeObjectRetain();
    uint64_t v6 = swift_task_alloc();
    *(void *)(v0 + 128) = v6;
    *(void *)(v6 + 16) = inited;
    *(void *)(v6 + 24) = v4;
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v7;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2698EE360);
    *uint64_t v7 = v0;
    v7[1] = sub_24E4DE320;
    return MEMORY[0x270F28DC8](v0 + 72, 0xD00000000000001CLL, 0x800000024E52F110, sub_24E4E1098, v6, v8);
  }
  else
  {
    sub_24E4E010C();
    swift_allocError();
    unsigned char *v9 = 3;
    swift_willThrow();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10(0);
  }
}

uint64_t sub_24E4DE320()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = sub_24E4DE89C;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    swift_task_dealloc();
    uint64_t v4 = sub_24E4DE448;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4DE448()
{
  char v1 = *(unsigned char *)(v0 + 154);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v2 = *(void *)(v0 + 72);
  *(unsigned char *)(swift_task_alloc() + 16) = v1;
  uint64_t v26 = v2 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v2 + 64);
  int64_t v27 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v28 = v2;
  while (1)
  {
    if (v5)
    {
      unint64_t v7 = __clz(__rbit64(v5));
      uint64_t v8 = (v5 - 1) & v5;
      int64_t v30 = v6;
      unint64_t v9 = v7 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v10 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_40;
    }
    if (v10 >= v27) {
      break;
    }
    unint64_t v11 = *(void *)(v26 + 8 * v10);
    int64_t i = v6 + 1;
    if (!v11)
    {
      int64_t i = v6 + 2;
      if (v6 + 2 >= v27) {
        break;
      }
      unint64_t v11 = *(void *)(v26 + 8 * i);
      if (!v11)
      {
        int64_t i = v6 + 3;
        if (v6 + 3 >= v27) {
          break;
        }
        unint64_t v11 = *(void *)(v26 + 8 * i);
        if (!v11)
        {
          int64_t i = v6 + 4;
          if (v6 + 4 >= v27) {
            break;
          }
          unint64_t v11 = *(void *)(v26 + 8 * i);
          if (!v11)
          {
            uint64_t v13 = v6 + 5;
            if (v6 + 5 >= v27) {
              break;
            }
            unint64_t v11 = *(void *)(v26 + 8 * v13);
            for (int64_t i = v6 + 5; !v11; ++v13)
            {
              int64_t i = v13 + 1;
              if (__OFADD__(v13, 1)) {
                goto LABEL_41;
              }
              if (i >= v27) {
                goto LABEL_38;
              }
              unint64_t v11 = *(void *)(v26 + 8 * i);
            }
          }
        }
      }
    }
    uint64_t v8 = (v11 - 1) & v11;
    int64_t v30 = i;
    unint64_t v9 = __clz(__rbit64(v11)) + (i << 6);
LABEL_22:
    unint64_t v14 = *(void *)(*(void *)(v2 + 56) + 8 * v9);
    unint64_t v29 = v8;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_24E52D460();
      if (v15)
      {
LABEL_24:
        uint64_t v16 = 0;
        while (1)
        {
          id v17 = (v14 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x25333D430](v16, v14)
              : *(id *)(v14 + 8 * v16 + 32);
          os_log_type_t v18 = v17;
          uint64_t v19 = v16 + 1;
          if (__OFADD__(v16, 1)) {
            break;
          }
          id v20 = objc_msgSend(v17, sel_capabilities);
          sub_24E52CFF0();
          v21 = (void *)sub_24E52CFE0();
          swift_bridgeObjectRelease();
          id v22 = objc_msgSend(v20, sel_valueForCapability_, v21);

          if (v22 == (id)1)
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v23 = 1;
            goto LABEL_35;
          }
          ++v16;
          if (v19 == v15) {
            goto LABEL_4;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        JUMPOUT(0x24E4DE884);
      }
    }
    else
    {
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      if (v15) {
        goto LABEL_24;
      }
    }
LABEL_4:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v2 = v28;
    unint64_t v5 = v29;
    int64_t v6 = v30;
  }
LABEL_38:
  swift_release();
  uint64_t v23 = 0;
LABEL_35:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v24(v23);
}

uint64_t sub_24E4DE89C()
{
  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_24E4DE924(uint64_t a1)
{
  *(unsigned char *)(v2 + 136) = *(unsigned char *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(v2 + 80) = v1;
  *(void *)(v2 + 88) = v3;
  *(void *)(v2 + 96) = v4;
  return MEMORY[0x270FA2498](sub_24E4DE954, v1, 0);
}

uint64_t sub_24E4DE954()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  char v3 = *(unsigned char *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 104) = inited;
  *(_OWORD *)(inited + 16) = xmmword_24E52DE40;
  *(unsigned char *)(inited + 32) = v3;
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 48) = v1;
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 112) = v6;
  *(void *)(v6 + 16) = inited;
  *(void *)(v6 + 24) = v4;
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2698EE360);
  *unint64_t v7 = v0;
  v7[1] = sub_24E4DEA9C;
  return MEMORY[0x270F28DC8](v0 + 72, 0xD00000000000001CLL, 0x800000024E52F110, sub_24E4E1098, v6, v8);
}

uint64_t sub_24E4DEA9C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = sub_24E4DED40;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    swift_task_dealloc();
    uint64_t v4 = sub_24E4DEBC4;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4DEBC4()
{
  swift_setDeallocating();
  swift_arrayDestroy();
  unint64_t v1 = sub_24E4DEDC4(*(void *)(v0 + 72));
  uint64_t result = swift_bridgeObjectRelease();
  if (!v1)
  {
    uint64_t v3 = 0;
    goto LABEL_13;
  }
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24E52D460();
    uint64_t result = swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_4;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    unint64_t v1 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_12;
  }
LABEL_4:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25333D430](0, v1);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v4 = *(id *)(v1 + 32);
  }
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v5, sel_senderCorrelationIdentifier);

  if (v6)
  {
    unint64_t v1 = sub_24E52CFF0();
    uint64_t v3 = v7;
  }
  else
  {
    unint64_t v1 = 0;
    uint64_t v3 = 0;
  }
LABEL_13:
  uint64_t v8 = *(uint64_t (**)(unint64_t, uint64_t))(v0 + 8);
  return v8(v1, v3);
}

uint64_t sub_24E4DED40()
{
  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4DEDC4(uint64_t a1)
{
  uint64_t result = sub_24E4DFE44(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  sub_24E4E0BB4(result, v3, 0, a1);
  return swift_bridgeObjectRetain();
}

uint64_t QueryController.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t QueryController.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t QueryController.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E4DEEA8()
{
  return v0;
}

void sub_24E4DEEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a1;
  uint64_t v5 = sub_24E52CF00();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (!v9)
  {
LABEL_12:
    uint64_t v24 = *(void **)(a3 + 112);
    sub_24E4E10A0(v10);
    swift_bridgeObjectRelease();
    uint64_t v25 = (void *)sub_24E52D0C0();
    swift_bridgeObjectRelease();
    uint64_t v26 = (void *)sub_24E52CFE0();
    int64_t v27 = (void *)sub_24E52CFE0();
    sub_24E4E0C04();
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F080], v5);
    uint64_t v28 = (void *)sub_24E52D210();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v39 = sub_24E4E0C44;
    uint64_t v40 = v34;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v36 = 1107296256;
    uint64_t v37 = sub_24E4DFB60;
    uint64_t v38 = &block_descriptor;
    unint64_t v29 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v24, sel_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_, v25, v26, v27, v28, v29);
    _Block_release(v29);

    return;
  }
  uint64_t v31 = a3;
  uint64_t v32 = v6;
  uint64_t v33 = v5;
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_24E4F1DB8(0, v9, 0);
  uint64_t v10 = v41;
  unint64_t v11 = (uint64_t (**)(uint64_t, uint64_t))(a2 + 48);
  while (1)
  {
    unint64_t v12 = (unint64_t)*(v11 - 1);
    uint64_t v13 = *v11;
    if ((*(unsigned char *)(v11 - 2) & 0xFE) != 2)
    {
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    unint64_t v14 = (void *)sub_24E52CFE0();
    id v15 = objc_msgSend(v14, sel__stripPotentialTokenURIWithToken_, 0);

    if (!v15) {
      break;
    }
    uint64_t v16 = sub_24E52CFF0();
    os_log_type_t v18 = v17;

    v19._countAndFlagsBits = v16;
    v19._object = v18;
    Destination.init(stringRepresentation:)(v19);
    id v20 = v37;
    if (!v37) {
      goto LABEL_14;
    }
    unint64_t v12 = v36;
    swift_bridgeObjectRelease();
    uint64_t v13 = v20;
LABEL_8:
    uint64_t v41 = v10;
    unint64_t v22 = *(void *)(v10 + 16);
    unint64_t v21 = *(void *)(v10 + 24);
    if (v22 >= v21 >> 1)
    {
      sub_24E4F1DB8(v21 > 1, v22 + 1, 1);
      uint64_t v10 = v41;
    }
    v11 += 3;
    *(void *)(v10 + 16) = v22 + 1;
    uint64_t v23 = v10 + 16 * v22;
    *(void *)(v23 + 32) = v12;
    *(void *)(v23 + 40) = v13;
    if (!--v9)
    {
      uint64_t v6 = v32;
      uint64_t v5 = v33;
      a3 = v31;
      goto LABEL_12;
    }
  }
  __break(1u);
LABEL_14:
  unint64_t aBlock = 0;
  unint64_t v36 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_24E52D380();
  swift_bridgeObjectRelease();
  unint64_t aBlock = 0xD000000000000012;
  unint64_t v36 = 0x800000024E52F220;
  swift_bridgeObjectRetain();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  sub_24E52D450();
  __break(1u);
}

void sub_24E4DF2C4(uint64_t a1)
{
  if (!a1 || (unint64_t v1 = sub_24E4DF798(a1)) == 0)
  {
    uint64_t v37 = sub_24E52CCB0();
    sub_24E4E0C64(&qword_2698EE3B8, 255, MEMORY[0x263F3C9B0]);
    uint64_t v38 = (void *)swift_allocError();
    void *v39 = 0xD000000000000029;
    v39[1] = 0x800000024E52F260;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F3C9A8], v37);
    sub_24E52CCC0();

    return;
  }
  unint64_t v2 = v1;
  int64_t v3 = 0;
  unint64_t v4 = v1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  int64_t v9 = (void *)MEMORY[0x263F8EE80];
  int64_t v41 = v8;
  unint64_t v42 = v1 + 64;
  unint64_t v40 = v1;
  if (v7) {
    goto LABEL_23;
  }
LABEL_9:
  while (2)
  {
    int64_t v11 = v3 + 1;
    if (!__OFADD__(v3, 1))
    {
      if (v11 < v8)
      {
        unint64_t v12 = *(void *)(v4 + 8 * v11);
        ++v3;
        if (v12) {
          goto LABEL_22;
        }
        int64_t v3 = v11 + 1;
        if (v11 + 1 >= v8) {
          goto LABEL_50;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (v12) {
          goto LABEL_22;
        }
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_50;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (v12)
        {
LABEL_22:
          unint64_t v7 = (v12 - 1) & v12;
          for (unint64_t i = __clz(__rbit64(v12)) + (v3 << 6); ; unint64_t i = v15 | (v3 << 6))
          {
            uint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
            uint64_t v18 = *v16;
            uint64_t v17 = v16[1];
            uint64_t v19 = *(void *)(*(void *)(v2 + 56) + 8 * i);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (sub_24E52D040())
            {
              unsigned __int8 v20 = 0;
              goto LABEL_38;
            }
            if (sub_24E52D040())
            {
              unsigned __int8 v20 = 1;
              goto LABEL_38;
            }
            if (sub_24E52D040())
            {
              unsigned __int8 v20 = 2;
              goto LABEL_38;
            }
            if (sub_24E52D040())
            {
              unsigned __int8 v20 = 3;
              goto LABEL_38;
            }
            if (sub_24E52D040())
            {
              unsigned __int8 v20 = 4;
              goto LABEL_38;
            }
            if (sub_24E52D040()) {
              break;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (!v7) {
              goto LABEL_9;
            }
LABEL_23:
            unint64_t v15 = __clz(__rbit64(v7));
            v7 &= v7 - 1;
          }
          unsigned __int8 v20 = 5;
LABEL_38:
          unint64_t v21 = v9;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v43 = v9;
          unsigned __int8 v23 = v20;
          unint64_t v25 = sub_24E4FF254(v20, v18, v17);
          uint64_t v26 = v9[2];
          BOOL v27 = (v24 & 1) == 0;
          uint64_t v28 = v26 + v27;
          if (__OFADD__(v26, v27)) {
            goto LABEL_52;
          }
          char v29 = v24;
          if (v21[3] < v28)
          {
            sub_24E5276E0(v28, isUniquelyReferenced_nonNull_native);
            unint64_t v30 = sub_24E4FF254(v23, v18, v17);
            if ((v29 & 1) != (v31 & 1)) {
              goto LABEL_55;
            }
            unint64_t v25 = v30;
            uint64_t v32 = v43;
            if ((v29 & 1) == 0) {
              goto LABEL_45;
            }
LABEL_7:
            int64_t v9 = v32;
            uint64_t v10 = v32[7];
            swift_bridgeObjectRelease();
            *(void *)(v10 + 8 * v25) = v19;
LABEL_8:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            int64_t v8 = v41;
            unint64_t v4 = v42;
            unint64_t v2 = v40;
            if (!v7) {
              continue;
            }
            goto LABEL_23;
          }
          if (isUniquelyReferenced_nonNull_native)
          {
            uint64_t v32 = v43;
            if (v24) {
              goto LABEL_7;
            }
          }
          else
          {
            sub_24E528C40();
            uint64_t v32 = v43;
            if (v29) {
              goto LABEL_7;
            }
          }
LABEL_45:
          v32[(v25 >> 6) + 8] |= 1 << v25;
          uint64_t v33 = v32[6] + 24 * v25;
          *(unsigned char *)uint64_t v33 = v23;
          *(void *)(v33 + 8) = v18;
          *(void *)(v33 + 16) = v17;
          *(void *)(v32[7] + 8 * v25) = v19;
          uint64_t v34 = v32[2];
          BOOL v35 = __OFADD__(v34, 1);
          uint64_t v36 = v34 + 1;
          if (v35) {
            goto LABEL_54;
          }
          int64_t v9 = v32;
          v32[2] = v36;
          swift_bridgeObjectRetain();
          goto LABEL_8;
        }
        int64_t v13 = v11 + 3;
        if (v13 < v8)
        {
          unint64_t v12 = *(void *)(v4 + 8 * v13);
          if (v12)
          {
            int64_t v3 = v13;
            goto LABEL_22;
          }
          while (1)
          {
            int64_t v3 = v13 + 1;
            if (__OFADD__(v13, 1)) {
              goto LABEL_53;
            }
            if (v3 >= v8) {
              break;
            }
            unint64_t v12 = *(void *)(v4 + 8 * v3);
            ++v13;
            if (v12) {
              goto LABEL_22;
            }
          }
        }
      }
LABEL_50:
      swift_release();
      sub_24E52CCD0();
      swift_bridgeObjectRelease();
      return;
    }
    break;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  sub_24E52D5D0();
  __break(1u);
}

unint64_t sub_24E4DF798(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3C0);
    unint64_t v2 = (void *)sub_24E52D490();
  }
  else
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v28 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  int64_t v27 = (unint64_t)(63 - v4) >> 6;
  uint64_t v6 = (char *)v36 + 8;
  unint64_t v7 = (char *)v33 + 8;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v26 = v1;
  while (1)
  {
    if (v5)
    {
      uint64_t v14 = (v5 - 1) & v5;
      unint64_t v15 = __clz(__rbit64(v5)) | (v9 << 6);
      int64_t v16 = v9;
    }
    else
    {
      int64_t v17 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v27)
      {
LABEL_36:
        sub_24E4E0DC4();
        return (unint64_t)v2;
      }
      unint64_t v18 = *(void *)(v28 + 8 * v17);
      int64_t v16 = v9 + 1;
      if (!v18)
      {
        int64_t v16 = v9 + 2;
        if (v9 + 2 >= v27) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v28 + 8 * v16);
        if (!v18)
        {
          int64_t v16 = v9 + 3;
          if (v9 + 3 >= v27) {
            goto LABEL_36;
          }
          unint64_t v18 = *(void *)(v28 + 8 * v16);
          if (!v18)
          {
            int64_t v16 = v9 + 4;
            if (v9 + 4 >= v27) {
              goto LABEL_36;
            }
            unint64_t v18 = *(void *)(v28 + 8 * v16);
            if (!v18)
            {
              int64_t v19 = v9 + 5;
              if (v9 + 5 >= v27) {
                goto LABEL_36;
              }
              unint64_t v18 = *(void *)(v28 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  int64_t v16 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_41;
                  }
                  if (v16 >= v27) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = *(void *)(v28 + 8 * v16);
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v16 = v9 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v14 = (v18 - 1) & v18;
      unint64_t v15 = __clz(__rbit64(v18)) + (v16 << 6);
    }
    sub_24E4E0CAC(*(void *)(v1 + 48) + 40 * v15, (uint64_t)v35);
    sub_24E4E0D08(*(void *)(v1 + 56) + 32 * v15, (uint64_t)v6);
    v33[0] = v36[0];
    v33[1] = v36[1];
    uint64_t v34 = v37;
    v32[0] = v35[0];
    v32[1] = v35[1];
    sub_24E4E0CAC((uint64_t)v32, (uint64_t)v31);
    if (!swift_dynamicCast())
    {
      sub_24E4E0D64((uint64_t)v32);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_24E4E0DC4();
      swift_release();
      return 0;
    }
    sub_24E4E0D08((uint64_t)v7, (uint64_t)v31);
    sub_24E4E0D64((uint64_t)v32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3D0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    unint64_t result = sub_24E4FF2E8(v29, v30);
    unint64_t v20 = result;
    if (v21)
    {
      uint64_t v10 = v7;
      int64_t v11 = v6;
      unint64_t v12 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *unint64_t v12 = v29;
      v12[1] = v30;
      uint64_t v13 = v2[7];
      unint64_t result = swift_bridgeObjectRelease();
      *(void *)(v13 + 8 * v20) = v29;
      uint64_t v6 = v11;
      unint64_t v7 = v10;
      uint64_t v1 = v26;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v22 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v22 = v29;
    v22[1] = v30;
    *(void *)(v2[7] + 8 * result) = v29;
    uint64_t v23 = v2[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_39;
    }
    v2[2] = v25;
LABEL_8:
    int64_t v9 = v16;
    unint64_t v5 = v14;
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

uint64_t sub_24E4DFB60(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_24E52CF30();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E4DFBF0()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_2698EEB20);
  __swift_project_value_buffer(v0, (uint64_t)qword_2698EEB20);
  return sub_24E52CEE0();
}

uint64_t sub_24E4DFC74(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_24E4DFD34;
  *(unsigned char *)(v5 + 136) = *(unsigned char *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(v5 + 80) = v4;
  *(void *)(v5 + 88) = v6;
  *(void *)(v5 + 96) = v7;
  return MEMORY[0x270FA2498](sub_24E4DE954, v4, 0);
}

uint64_t sub_24E4DFD34(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  int64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_24E4DFE44(uint64_t a1)
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
  uint64_t v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_24E4DFECC(uint64_t a1, uint64_t (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v24 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v7)
  {
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_5:
    uint64_t v12 = *(void *)(a1 + 48) + 24 * v11;
    uint64_t v13 = *(void *)(v12 + 8);
    uint64_t v14 = *(void *)(v12 + 16);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    v20[0] = *(unsigned char *)v12;
    uint64_t v21 = v13;
    uint64_t v22 = v14;
    uint64_t v23 = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v16 = a2(v20, v15);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v16)
    {
      swift_release();
      return 1;
    }
  }
  int64_t v17 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v17 >= v24) {
    goto LABEL_23;
  }
  unint64_t v18 = *(void *)(v4 + 8 * v17);
  ++v9;
  if (v18) {
    goto LABEL_21;
  }
  int64_t v9 = v17 + 1;
  if (v17 + 1 >= v24) {
    goto LABEL_23;
  }
  unint64_t v18 = *(void *)(v4 + 8 * v9);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v9 = v17 + 2;
  if (v17 + 2 >= v24) {
    goto LABEL_23;
  }
  unint64_t v18 = *(void *)(v4 + 8 * v9);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v9 = v17 + 3;
  if (v17 + 3 >= v24) {
    goto LABEL_23;
  }
  unint64_t v18 = *(void *)(v4 + 8 * v9);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v24)
  {
LABEL_23:
    swift_release();
    return 0;
  }
  unint64_t v18 = *(void *)(v4 + 8 * v19);
  int64_t v9 = v19;
  if (v18)
  {
LABEL_21:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
    goto LABEL_5;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v24) {
      goto LABEL_23;
    }
    unint64_t v18 = *(void *)(v4 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_21;
    }
  }
LABEL_25:
  __break(1u);
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

void sub_24E4E00FC(uint64_t a1)
{
  sub_24E4DEEB4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

BOOL sub_24E4E0104(uint64_t a1, unint64_t a2)
{
  return sub_24E4DDE38(a1, a2);
}

unint64_t sub_24E4E010C()
{
  unint64_t result = qword_2698EE378;
  if (!qword_2698EE378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2698EE378);
  }
  return result;
}

uint64_t method lookup function for QueryController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QueryController);
}

uint64_t dispatch thunk of QueryController.__allocating_init(serviceName:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of QueryController.isRegistered(destination:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 112) + **(int **)(*(void *)v1 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E4E0290;
  return v6(a1);
}

uint64_t sub_24E4E0290(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of QueryController.destinationHasCapability(destination:capability:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 120) + **(int **)(*(void *)v2 + 120));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24E4E0498;
  return v8(a1, a2);
}

uint64_t sub_24E4E0498(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of QueryController.destinationHasCapability(destination:capability:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 128)
                                                          + **(int **)(*(void *)v3 + 128));
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *unint64_t v8 = v4;
  v8[1] = sub_24E4E109C;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of QueryController.destinationHasCapabilityWithDataReloadIfRequired(destination:capability:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 136) + **(int **)(*(void *)v2 + 136));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24E4E109C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of QueryController.correlationIdentifier(destination:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 144) + **(int **)(*(void *)v1 + 144));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E4E08C0;
  return v6(a1);
}

uint64_t sub_24E4E08C0(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL sub_24E4E0A68(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_24E52D460())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25333D430](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      uint64_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = objc_msgSend(v4, sel_capabilities);
      uint64_t v8 = (void *)sub_24E52CFE0();
      id v9 = objc_msgSend(v7, sel_valueForCapability_, v8);

      BOOL v10 = v9 == (id)1;
      ++v3;
      if (v9 == (id)1 || v6 == v2) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  BOOL v10 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24E4E0BB4(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 56) + 8 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

unint64_t sub_24E4E0C04()
{
  unint64_t result = qword_26B1C1598;
  if (!qword_26B1C1598)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1C1598);
  }
  return result;
}

void sub_24E4E0C44(uint64_t a1)
{
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

uint64_t sub_24E4E0C64(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24E4E0CAC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24E4E0D08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24E4E0D64(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E4E0DC4()
{
  return swift_release();
}

uint64_t sub_24E4E0DCC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E4E0E04()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_24E4E0EDC(uint64_t a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3D8) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v8 = *(unsigned __int8 *)(v1 + 24);
  sub_24E4DCD64(a1, v4, v8, v5, v6, v7);
}

uint64_t sub_24E4E0F5C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE3D8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24E4E0FF0()
{
  return sub_24E52D130();
}

uint64_t sub_24E4E10A0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_24E4F1D98(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24E4F1D98(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_24E4F1D98(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_24E4F7148(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_24E4E11C8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24E52D460();
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
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24E4F1D98(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x25333D430](i, a1);
        sub_24E4F6554(0, &qword_26B1C15A0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24E4F1D98(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_24E4F1D98(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_24E4F7148(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      long long v8 = (id *)(a1 + 32);
      sub_24E4F6554(0, &qword_26B1C15A0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24E4F1D98(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_24E4F1D98(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_24E4F7148(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4E142C()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_26B1C1918);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1C1918);
  if (qword_26B1C18F0 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1C1A30);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_24E4E14F4()
{
  return sub_24E52D000();
}

uint64_t InternetMessaging.serviceName.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InternetMessaging.crossAccount.getter()
{
  return *(unsigned __int8 *)(v0 + 128);
}

unint64_t sub_24E4E1568(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B1C1510);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    unint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA80);
  uint64_t v6 = sub_24E52D490();
  unint64_t v7 = (void *)v6;
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
    sub_24E4FB9C8(v12, (uint64_t)v5, qword_26B1C1510);
    unint64_t result = sub_24E4FF360((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_24E52CEC0();
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

unint64_t sub_24E4E175C(uint64_t a1)
{
  return sub_24E4E17AC(a1, &qword_2698EE5A0, &qword_2698EE5A8, (uint64_t (*)(uint64_t *, unint64_t))sub_24E4F7148);
}

unint64_t sub_24E4E1784(uint64_t a1)
{
  return sub_24E4E17AC(a1, &qword_2698EEA30, &qword_2698EE470, (uint64_t (*)(uint64_t *, unint64_t))sub_24E4F7148);
}

unint64_t sub_24E4E17AC(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t *, unint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_24E52D490();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24E4FB9C8(v11, (uint64_t)&v20, a3);
    uint64_t v12 = v20;
    uint64_t v13 = v21;
    unint64_t result = sub_24E4FF2E8(v20, v21);
    if (v15) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v16 = (uint64_t *)(v8[6] + 16 * result);
    *unint64_t v16 = v12;
    v16[1] = v13;
    unint64_t result = a4(&v22, v8[7] + 32 * result);
    uint64_t v17 = v8[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v8[2] = v19;
    v11 += 48;
    if (!--v9)
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

uint64_t sub_24E4E18EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 168);
  *(void *)(v2 + 168) = a1;
  *(void *)(v2 + 176) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4E1900(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 184);
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4E1914(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 200);
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4E1928(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 216);
  *(void *)(v2 + 216) = a1;
  *(void *)(v2 + 224) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4E193C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 232);
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4E1950(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 248);
  *(void *)(v2 + 248) = a1;
  *(void *)(v2 + 256) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4E1978()
{
  sub_24E52CD00();
  if (!v21)
  {
    sub_24E4FB96C((uint64_t)v20, &qword_2698EE5F0);
LABEL_12:
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24E52CEF0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B1C1918);
    uint64_t v7 = sub_24E52CED0();
    os_log_type_t v8 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v8, "Missing com.apple.private.ids.registration entitlement!", v9, 2u);
      MEMORY[0x25333DD20](v9, -1, -1);
    }
    goto LABEL_31;
  }
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1) {
    goto LABEL_12;
  }
  sub_24E52CD00();
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1)
  {
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24E52CEF0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B1C1918);
    uint64_t v7 = sub_24E52CED0();
    os_log_type_t v11 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v11, "Missing com.apple.private.ids.remotecredentials entitlement!", v12, 2u);
      MEMORY[0x25333DD20](v12, -1, -1);
    }
    goto LABEL_31;
  }
  sub_24E52CD00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C19B8);
  if ((swift_dynamicCast() & 1) == 0
    || (uint64_t v2 = *(void *)(v0 + 112),
        uint64_t v1 = *(void *)(v0 + 120),
        char v3 = sub_24E5065F0(v2, v1, v19),
        swift_bridgeObjectRelease(),
        (v3 & 1) == 0))
  {
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24E52CEF0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B1C1918);
    uint64_t v7 = sub_24E52CED0();
    os_log_type_t v14 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v15 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v14, "Missing com.apple.private.ids.messaging entitlement!", v15, 2u);
      MEMORY[0x25333DD20](v15, -1, -1);
    }
    goto LABEL_31;
  }
  sub_24E52CD00();
  if ((swift_dynamicCast() & 1) == 0
    || (char v4 = sub_24E5065F0(v2, v1, v19), result = swift_bridgeObjectRelease(), (v4 & 1) == 0))
  {
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_24E52CEF0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B1C1918);
    uint64_t v7 = sub_24E52CED0();
    os_log_type_t v17 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v17))
    {
      BOOL v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v18 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v17, "Missing com.apple.private.ids.messaging.urgent-priority entitlement!", v18, 2u);
      MEMORY[0x25333DD20](v18, -1, -1);
    }
LABEL_31:

    uint64_t result = sub_24E52D450();
    __break(1u);
  }
  return result;
}

uint64_t InternetMessaging.__allocating_init(serviceName:crossAccount:)(uint64_t a1, uint64_t a2, char a3)
{
  swift_allocObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24E4E0290;
  return InternetMessaging.init(serviceName:crossAccount:)(a1, a2, a3);
}

uint64_t InternetMessaging.init(serviceName:crossAccount:)(uint64_t a1, uint64_t a2, char a3)
{
  v4[3] = v3;
  v4[4] = *v3;
  uint64_t v8 = *v3;
  swift_defaultActor_initialize();
  v3[18] = 0;
  v3[19] = sub_24E4E1568(MEMORY[0x263F8EE78]);
  sub_24E52CEC0();
  v4[5] = *(void *)(v8 + 80);
  v4[6] = *(void *)(v8 + 88);
  type metadata accessor for Message();
  type metadata accessor for MessageContext();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
  sub_24E52CCE0();
  swift_getTupleTypeMetadata2();
  sub_24E52D100();
  sub_24E4F95F4((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
  v3[20] = sub_24E52CF50();
  *(_OWORD *)(v3 + 21) = 0u;
  *(_OWORD *)(v3 + 23) = 0u;
  *(_OWORD *)(v3 + 25) = 0u;
  *(_OWORD *)(v3 + 27) = 0u;
  *(_OWORD *)(v3 + 29) = 0u;
  *(_OWORD *)(v3 + 31) = 0u;
  v3[14] = a1;
  v3[15] = a2;
  *((unsigned char *)v3 + 128) = a3;
  id v9 = objc_allocWithZone(MEMORY[0x263F4A0C0]);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_24E52CFE0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithService_, v10);

  if (v11)
  {
    v3[17] = (uint64_t)v11;
    uint64_t v12 = sub_24E4E21F4;
    uint64_t v13 = v3;
    uint64_t v14 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_24E4E21F4()
{
  BOOL v18 = v0;
  uint64_t v1 = v0[3];
  uint64_t v2 = (objc_class *)type metadata accessor for MessagingDelegateTrampoline();
  uint64_t v3 = type metadata accessor for InternetMessaging();
  int v4 = swift_retain();
  id v5 = sub_24E52A1F8(v4, v2, v3, (uint64_t)&off_2700531D0);
  swift_release();
  uint64_t v6 = *(void **)(v1 + 144);
  *(void *)(v1 + 144) = v5;

  sub_24E4E1978();
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C1918);
  uint64_t v8 = sub_24E52CED0();
  os_log_type_t v9 = sub_24E52D200();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v12 = sub_24E4E14F4();
    v0[2] = sub_24E4F1740(v12, v13, &v17);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4DA000, v8, v9, "%{public}s: created.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v11, -1, -1);
    MEMORY[0x25333DD20](v10, -1, -1);
  }

  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v15 = v0[3];
  return v14(v15);
}

void sub_24E4E2410()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E52CF00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4A250]), sel_init);
  objc_msgSend(v6, sel_setWantsCrossAccountMessaging_, *(unsigned __int8 *)(v1 + 128));
  uint64_t v7 = *(void **)(v1 + 136);
  uint64_t v8 = *(void **)(v1 + 144);
  sub_24E4F6554(0, (unint64_t *)&qword_26B1C1598);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F080], v2);
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = (void *)sub_24E52D210();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v7, sel_addDelegate_withDelegateProperties_queue_, v10, v9, v11);

  id v12 = objc_msgSend(v7, sel_devices);
  if (v12)
  {
    unint64_t v13 = v12;
    sub_24E4F6554(0, &qword_26B1C15A0);
    unint64_t v14 = sub_24E52D0D0();

    uint64_t v15 = *(void **)(v1 + 144);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = sub_24E4E11C8(v14);
      swift_bridgeObjectRelease();
      sub_24E51F054(v7, v17);
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24E52CEF0();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B1C1918);
  uint64_t v19 = sub_24E52CED0();
  os_log_type_t v20 = sub_24E52D200();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v21 = 136446210;
    uint64_t v23 = sub_24E4E14F4();
    uint64_t v25 = sub_24E4F1740(v23, v24, &v26);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4DA000, v19, v20, "%{public}s: started.", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v22, -1, -1);
    MEMORY[0x25333DD20](v21, -1, -1);
  }
  else
  {
  }
}

void sub_24E4E27A8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v3 = v1 + 64;
  uint64_t v2 = v4;
  uint64_t v5 = 1 << *(unsigned char *)(*(void *)(v0 + 152) + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  uint64_t v7 = v6 & v2;
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_5;
    }
    int64_t v11 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    uint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v9;
    if (!v12)
    {
      int64_t v9 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      uint64_t v12 = *(void *)(v3 + 8 * v9);
      if (!v12)
      {
        int64_t v9 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        uint64_t v12 = *(void *)(v3 + 8 * v9);
        if (!v12)
        {
          int64_t v9 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          uint64_t v12 = *(void *)(v3 + 8 * v9);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v7 = (v12 - 1) & v12;
LABEL_5:
    sub_24E52D140();
    sub_24E4F95F4(&qword_2698EE3F0, MEMORY[0x263F8F488]);
    id v10 = (void *)swift_allocError();
    swift_retain();
    sub_24E52CF10();
    v32[9] = (uint64_t)v10;
    sub_24E52CCC0();
    swift_release();
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    swift_beginAccess();
    *(void *)(v0 + 152) = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v14 = *(void *)(v0 + 160);
    sub_24E52CEC0();
    type metadata accessor for Message();
    type metadata accessor for MessageContext();
    swift_getTupleTypeMetadata2();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
    sub_24E52CCE0();
    sub_24E4F95F4((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    uint64_t v15 = v14 + 64;
    uint64_t v16 = 1 << *(unsigned char *)(v14 + 32);
    uint64_t v17 = -1;
    if (v16 < 64) {
      uint64_t v17 = ~(-1 << v16);
    }
    uint64_t v18 = v17 & *(void *)(v14 + 64);
    int64_t v19 = (unint64_t)(v16 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v20 = 0;
    while (1)
    {
      if (v18)
      {
        v18 &= v18 - 1;
      }
      else
      {
        int64_t v22 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_48;
        }
        if (v22 >= v19)
        {
LABEL_43:
          swift_release();
          swift_beginAccess();
          sub_24E52CF70();
          sub_24E52CF60();
          swift_endAccess();
          objc_msgSend(*(id *)(v0 + 136), sel_removeDelegate_, *(void *)(v0 + 144));
          if (qword_26B1C1930 != -1) {
            goto LABEL_51;
          }
          goto LABEL_44;
        }
        uint64_t v23 = *(void *)(v15 + 8 * v22);
        ++v20;
        if (!v23)
        {
          int64_t v20 = v22 + 1;
          if (v22 + 1 >= v19) {
            goto LABEL_43;
          }
          uint64_t v23 = *(void *)(v15 + 8 * v20);
          if (!v23)
          {
            int64_t v20 = v22 + 2;
            if (v22 + 2 >= v19) {
              goto LABEL_43;
            }
            uint64_t v23 = *(void *)(v15 + 8 * v20);
            if (!v23)
            {
              int64_t v24 = v22 + 3;
              if (v24 >= v19) {
                goto LABEL_43;
              }
              uint64_t v23 = *(void *)(v15 + 8 * v24);
              if (!v23)
              {
                while (1)
                {
                  int64_t v20 = v24 + 1;
                  if (__OFADD__(v24, 1)) {
                    goto LABEL_49;
                  }
                  if (v20 >= v19) {
                    goto LABEL_43;
                  }
                  uint64_t v23 = *(void *)(v15 + 8 * v20);
                  ++v24;
                  if (v23) {
                    goto LABEL_42;
                  }
                }
              }
              int64_t v20 = v24;
            }
          }
        }
LABEL_42:
        uint64_t v18 = (v23 - 1) & v23;
      }
      sub_24E52D140();
      sub_24E4F95F4(&qword_2698EE3F0, MEMORY[0x263F8F488]);
      uint64_t v21 = (void *)swift_allocError();
      swift_retain();
      sub_24E52CF10();
      v32[0] = (uint64_t)v21;
      sub_24E52CCC0();
      swift_release();
    }
  }
  uint64_t v12 = *(void *)(v3 + 8 * v13);
  if (v12)
  {
    int64_t v9 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_23;
    }
    uint64_t v12 = *(void *)(v3 + 8 * v9);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_50:
  __break(1u);
LABEL_51:
  swift_once();
LABEL_44:
  uint64_t v25 = sub_24E52CEF0();
  __swift_project_value_buffer(v25, (uint64_t)qword_26B1C1918);
  uint64_t v26 = sub_24E52CED0();
  os_log_type_t v27 = sub_24E52D200();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)uint64_t v28 = 136446210;
    uint64_t v30 = sub_24E4E14F4();
    sub_24E4F1740(v30, v31, v32);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4DA000, v26, v27, "%{public}s: stopped.", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v29, -1, -1);
    MEMORY[0x25333DD20](v28, -1, -1);
  }
}

void sub_24E4E2DD4(void *a1@<X8>)
{
  id v3 = objc_msgSend(*(id *)(v1 + 136), sel_iCloudAccount);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_loginID);
    if (!v5)
    {
      __break(1u);
      return;
    }
    uint64_t v6 = v5;
    uint64_t v7 = sub_24E52CFF0();
    int64_t v9 = v8;

    v10._countAndFlagsBits = v7;
    v10._object = v9;
    Destination.init(string:)(v10);
    uint64_t v11 = v18;
    if (v19)
    {
      sub_24E5050E4((uint64_t)v14);
      swift_bridgeObjectRelease();

      uint64_t v12 = v15;
      uint64_t v13 = v16;
      *a1 = v14[0];
      a1[1] = v12;
      a1[2] = v13;
      return;
    }

    *a1 = v17;
    a1[1] = v11;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
  a1[2] = 0;
}

uint64_t sub_24E4E2EC0@<X0>(uint64_t a1@<X8>)
{
  id v3 = *(void **)(v1 + 136);
  uint64_t v4 = (void *)sub_24E52CFE0();
  id v5 = objc_msgSend(v3, sel_deviceForFromID_, v4);

  if (v5)
  {
    sub_24E52B650(v5, (uint64_t)v9);
    v8[6] = v9[6];
    v8[7] = v9[7];
    v8[8] = v9[8];
    v8[9] = v9[9];
    v8[2] = v9[2];
    v8[3] = v9[3];
    v8[4] = v9[4];
    v8[5] = v9[5];
    v8[0] = v9[0];
    v8[1] = v9[1];
    nullsub_1(v8);
    uint64_t v6 = v8;
  }
  else
  {
    sub_24E4F6590(v9);
    uint64_t v6 = v9;
  }
  return sub_24E4F65AC((uint64_t)v6, a1);
}

uint64_t sub_24E4E2F98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24E4E30B0();
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    sub_24E4F6590(&v21);
    uint64_t v18 = &v21;
    return sub_24E4F65AC((uint64_t)v18, a1);
  }
  long long v4 = *(_OWORD *)(v2 + 144);
  long long v27 = *(_OWORD *)(v2 + 128);
  long long v28 = v4;
  long long v5 = *(_OWORD *)(v2 + 176);
  long long v29 = *(_OWORD *)(v2 + 160);
  long long v30 = v5;
  long long v6 = *(_OWORD *)(v2 + 80);
  long long v23 = *(_OWORD *)(v2 + 64);
  long long v24 = v6;
  long long v7 = *(_OWORD *)(v2 + 112);
  long long v25 = *(_OWORD *)(v2 + 96);
  long long v26 = v7;
  long long v8 = *(_OWORD *)(v2 + 48);
  long long v21 = *(_OWORD *)(v2 + 32);
  long long v22 = v8;
  if ((BYTE3(v29) & 1) == 0)
  {
    uint64_t v9 = 192;
    while (--v3)
    {
      Swift::String v10 = (long long *)(v2 + v9);
      v9 += 160;
      long long v11 = v10[1];
      long long v21 = *v10;
      long long v22 = v11;
      long long v12 = v10[2];
      long long v13 = v10[3];
      long long v14 = v10[5];
      long long v25 = v10[4];
      long long v26 = v14;
      long long v23 = v12;
      long long v24 = v13;
      long long v15 = v10[6];
      long long v16 = v10[7];
      long long v17 = v10[9];
      long long v29 = v10[8];
      long long v30 = v17;
      long long v27 = v15;
      long long v28 = v16;
      if (BYTE3(v29)) {
        goto LABEL_6;
      }
    }
    goto LABEL_7;
  }
LABEL_6:
  sub_24E4F6614((uint64_t)&v21);
  swift_bridgeObjectRelease();
  v20[6] = v27;
  v20[7] = v28;
  unsigned char v20[8] = v29;
  v20[9] = v30;
  v20[2] = v23;
  v20[3] = v24;
  v20[4] = v25;
  v20[5] = v26;
  v20[0] = v21;
  v20[1] = v22;
  nullsub_1(v20);
  uint64_t v18 = v20;
  return sub_24E4F65AC((uint64_t)v18, a1);
}

uint64_t sub_24E4E30B0()
{
  unint64_t v0 = (unint64_t)sub_24E4E33EC();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
    uint64_t v10 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v10)
    {
LABEL_13:
      uint64_t v11 = v5 + 32;
      swift_bridgeObjectRetain();
      uint64_t v12 = v10 - 1;
      long long v13 = (void *)MEMORY[0x263F8EE78];
      while (1)
      {
        sub_24E4F65AC(v11, (uint64_t)v26);
        sub_24E4F65AC((uint64_t)v26, (uint64_t)v27);
        if (sub_24E4F66C0((uint64_t)v27) != 1)
        {
          sub_24E4F65AC((uint64_t)v26, (uint64_t)v25);
          sub_24E4F6614((uint64_t)v25);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v13 = sub_24E4F1164(0, v13[2] + 1, 1, v13);
          }
          unint64_t v15 = v13[2];
          unint64_t v14 = v13[3];
          if (v15 >= v14 >> 1) {
            long long v13 = sub_24E4F1164((void *)(v14 > 1), v15 + 1, 1, v13);
          }
          sub_24E4F65AC((uint64_t)v26, (uint64_t)v24);
          v13[2] = v15 + 1;
          long long v16 = &v13[20 * v15];
          long long v17 = v24[1];
          v16[2] = v24[0];
          v16[3] = v17;
          long long v18 = v24[5];
          long long v20 = v24[2];
          long long v19 = v24[3];
          v16[6] = v24[4];
          v16[7] = v18;
          v16[4] = v20;
          v16[5] = v19;
          long long v21 = v24[9];
          long long v23 = v24[6];
          long long v22 = v24[7];
          v16[10] = v24[8];
          v16[11] = v21;
          v16[8] = v23;
          v16[9] = v22;
        }
        if (!v12) {
          break;
        }
        --v12;
        v11 += 160;
      }
      swift_bridgeObjectRelease_n();
      return (uint64_t)v13;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = sub_24E52D460();
  if (!v2) {
    goto LABEL_24;
  }
LABEL_3:
  *(void *)&v24[0] = MEMORY[0x263F8EE78];
  uint64_t result = sub_24E4F1DD8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)&v24[0];
    if ((v1 & 0xC000000000000001) == 0) {
      goto LABEL_6;
    }
LABEL_5:
    for (id i = (id)MEMORY[0x25333D430](v4, v1); ; id i = *(id *)(v1 + 8 * v4 + 32))
    {
      id v7 = i;
      sub_24E52B650(v7, (uint64_t)v26);

      v25[6] = v26[6];
      v25[7] = v26[7];
      v25[8] = v26[8];
      v25[9] = v26[9];
      v25[2] = v26[2];
      v25[3] = v26[3];
      v25[4] = v26[4];
      v25[5] = v26[5];
      v25[0] = v26[0];
      v25[1] = v26[1];
      nullsub_1(v25);
      sub_24E4F65AC((uint64_t)v25, (uint64_t)v27);
      *(void *)&v24[0] = v5;
      unint64_t v9 = *(void *)(v5 + 16);
      unint64_t v8 = *(void *)(v5 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_24E4F1DD8(v8 > 1, v9 + 1, 1);
        uint64_t v5 = *(void *)&v24[0];
      }
      *(void *)(v5 + 16) = v9 + 1;
      sub_24E4F65AC((uint64_t)v27, v5 + 160 * v9 + 32);
      if (v2 - 1 == v4) {
        break;
      }
      ++v4;
      if ((v1 & 0xC000000000000001) != 0) {
        goto LABEL_5;
      }
LABEL_6:
      ;
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v5 + 16);
    if (v10) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

id sub_24E4E33EC()
{
  if (MEMORY[0x25333CD20]()) {
    return (id)MEMORY[0x263F8EE78];
  }
  id result = objc_msgSend(*(id *)(v0 + 136), sel_devices);
  if (result)
  {
    uint64_t v2 = result;
    sub_24E4F6554(0, &qword_26B1C15A0);
    uint64_t v3 = sub_24E52D0D0();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t InternetMessaging.deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E4F66D8(*(void *)(v0 + 168));
  sub_24E4F66D8(*(void *)(v0 + 184));
  sub_24E4F66D8(*(void *)(v0 + 200));
  sub_24E4F66D8(*(void *)(v0 + 216));
  sub_24E4F66D8(*(void *)(v0 + 232));
  sub_24E4F66D8(*(void *)(v0 + 248));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t InternetMessaging.__deallocating_deinit()
{
  InternetMessaging.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t InternetMessaging.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E4E3520()
{
  return InternetMessaging.unownedExecutor.getter();
}

uint64_t InternetMessaging.send(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v4[13] = *v3;
  v4[14] = type metadata accessor for MessagingOptions();
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Message();
  v4[17] = v5;
  v4[18] = *(void *)(v5 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E36AC, v3, 0);
}

uint64_t sub_24E4E36AC()
{
  v84 = v0;
  uint64_t v1 = *(void *)(v0[11] + *(int *)(v0[14] + 20));
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_24E4F1DB8(0, v2, 0);
    uint64_t v4 = 0;
    uint64_t v3 = v82;
    unint64_t v5 = *(void *)(v82 + 16);
    uint64_t v6 = 16 * v5;
    do
    {
      uint64_t v7 = v1;
      uint64_t v9 = *(void *)(v1 + v4 + 40);
      uint64_t v8 = *(void *)(v1 + v4 + 48);
      uint64_t v82 = v3;
      unint64_t v10 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v10 >> 1)
      {
        sub_24E4F1DB8(v10 > 1, v5 + 1, 1);
        uint64_t v3 = v82;
      }
      *(void *)(v3 + 16) = v5 + 1;
      uint64_t v11 = v3 + v6;
      *(void *)(v11 + 32) = v9;
      *(void *)(v11 + 40) = v8;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
      uint64_t v1 = v7;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v0 = v81;
  }
  uint64_t v12 = sub_24E4F68F0(v3);
  v0[21] = v12;
  swift_bridgeObjectRelease();
  sub_24E52CD90();
  swift_allocObject();
  sub_24E52CD80();
  swift_getWitnessTable();
  uint64_t v13 = sub_24E52CD60();
  v0[22] = v13;
  v0[23] = v14;
  uint64_t v15 = v13;
  unint64_t v16 = v14;
  uint64_t v17 = v0[14];
  uint64_t v18 = v0[11];
  swift_release();
  uint64_t v19 = 0x6F707365722F7728;
  if (!*(unsigned char *)(v18 + *(int *)(v17 + 24))) {
    uint64_t v19 = 0;
  }
  unint64_t v20 = 0xE000000000000000;
  if (*(unsigned char *)(v18 + *(int *)(v17 + 24))) {
    unint64_t v20 = 0xED0000202965736ELL;
  }
  uint64_t v82 = v19;
  unint64_t v83 = v20;
  sub_24E52D020();
  swift_bridgeObjectRelease();
  unint64_t v21 = v83;
  uint64_t v22 = 0;
  switch(v16 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v15), v15))
      {
        __break(1u);
LABEL_32:
        __break(1u);
        JUMPOUT(0x24E4E4148);
      }
      uint64_t v22 = HIDWORD(v15) - (int)v15;
LABEL_16:
      if (objc_msgSend(self, sel_checkMessageSize_priority_, v22, 300))
      {
        uint64_t v77 = v82;
        uint64_t v78 = v15;
        unint64_t v79 = v16;
        if (qword_26B1C1930 != -1) {
          swift_once();
        }
        uint64_t v25 = v0[20];
        uint64_t v26 = v0[17];
        uint64_t v27 = v0[18];
        uint64_t v28 = v0[16];
        uint64_t v30 = v0[10];
        uint64_t v29 = v0[11];
        uint64_t v31 = sub_24E52CEF0();
        __swift_project_value_buffer(v31, (uint64_t)qword_26B1C1918);
        v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
        v76(v25, v30, v26);
        sub_24E4F963C(v29, v28, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v32 = sub_24E52CED0();
        os_log_type_t v33 = sub_24E52D200();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = v0[18];
          uint64_t v35 = v0[17];
          uint64_t v71 = v0[19];
          uint64_t v72 = v0[16];
          os_log_type_t type = v33;
          uint64_t v70 = v0[20];
          uint64_t v36 = swift_slowAlloc();
          uint64_t v74 = swift_slowAlloc();
          uint64_t v82 = v74;
          *(_DWORD *)uint64_t v36 = 136316162;
          log = v32;
          uint64_t v37 = sub_24E4E14F4();
          v0[4] = sub_24E4F1740(v37, v38, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 12) = 2082;
          swift_bridgeObjectRetain();
          v0[5] = sub_24E4F1740(v77, v21, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v36 + 22) = 2082;
          v76(v71, v70, v35);
          v39 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
          v39(v70, v35);
          uint64_t v40 = Message.description.getter(v35);
          unint64_t v42 = v41;
          v39(v71, v35);
          v0[6] = sub_24E4F1740(v40, v42, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 32) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v43 = sub_24E52D190();
          unint64_t v45 = v44;
          swift_bridgeObjectRelease();
          v0[7] = sub_24E4F1740(v43, v45, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v36 + 42) = 2082;
          sub_24E52CEC0();
          sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
          uint64_t v46 = sub_24E52D560();
          v0[8] = sub_24E4F1740(v46, v47, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          sub_24E4F96A4(v72, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
          _os_log_impl(&dword_24E4DA000, log, type, "%s: Sending %{public}s: %{public}s to %s with identifier: %{public}s", (uint8_t *)v36, 0x34u);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v74, -1, -1);
          MEMORY[0x25333DD20](v36, -1, -1);
        }
        else
        {
          uint64_t v51 = v0[16];
          (*(void (**)(void, void))(v0[18] + 8))(v0[20], v0[17]);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          sub_24E4F96A4(v51, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        }
        v52 = v0;
        sub_24E4F963C(v0[11], v0[15], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        v53 = sub_24E52CED0();
        os_log_type_t v54 = sub_24E52D200();
        BOOL v55 = os_log_type_enabled(v53, v54);
        uint64_t v56 = v0[15];
        unint64_t v57 = v79;
        if (v55)
        {
          uint64_t v58 = swift_slowAlloc();
          uint64_t v80 = swift_slowAlloc();
          uint64_t v82 = v80;
          *(_DWORD *)uint64_t v58 = 136446466;
          uint64_t v59 = sub_24E4E14F4();
          v0[2] = sub_24E4F1740(v59, v60, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v58 + 12) = 2080;
          MessagingOptions.dictionaryValue.getter();
          uint64_t v61 = sub_24E52CF40();
          unint64_t v63 = v62;
          swift_bridgeObjectRelease();
          v0[3] = sub_24E4F1740(v61, v63, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          sub_24E4F96A4(v56, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
          _os_log_impl(&dword_24E4DA000, v53, v54, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v58, 0x16u);
          swift_arrayDestroy();
          unint64_t v57 = v79;
          MEMORY[0x25333DD20](v80, -1, -1);
          MEMORY[0x25333DD20](v58, -1, -1);
        }
        else
        {
          sub_24E4F96A4(v0[15], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        }

        uint64_t v64 = v0[12];
        uint64_t v65 = swift_task_alloc();
        v52[24] = v65;
        long long v66 = *((_OWORD *)v52 + 5);
        *(void *)(v65 + 16) = v64;
        *(_OWORD *)(v65 + 24) = v66;
        *(void *)(v65 + 40) = v78;
        *(void *)(v65 + 48) = v57;
        *(void *)(v65 + 56) = v12;
        v67 = (void *)swift_task_alloc();
        v52[25] = v67;
        uint64_t v68 = sub_24E52CEC0();
        void *v67 = v52;
        v67[1] = sub_24E4E4158;
        uint64_t v69 = v52[9];
        return MEMORY[0x270F28DC8](v69, 0xD00000000000001DLL, 0x800000024E52F2B0, sub_24E4F69E0, v65, v68);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24E4E010C();
        swift_allocError();
        unsigned char *v48 = 2;
        swift_willThrow();
        sub_24E4F6988(v15, v16);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v49 = (uint64_t (*)(void))v0[1];
        return v49();
      }
    case 2uLL:
      uint64_t v24 = *(void *)(v15 + 16);
      uint64_t v23 = *(void *)(v15 + 24);
      uint64_t v22 = v23 - v24;
      if (!__OFSUB__(v23, v24)) {
        goto LABEL_16;
      }
      goto LABEL_32;
    case 3uLL:
      goto LABEL_16;
    default:
      uint64_t v22 = BYTE6(v16);
      goto LABEL_16;
  }
}

uint64_t sub_24E4E4158()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = sub_24E4E4320;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 96);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v4 = sub_24E4E428C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4E428C()
{
  sub_24E4F6988(v0[22], v0[23]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24E4E4320()
{
  sub_24E4F6988(v0[22], v0[23]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24E4E43C4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v38 = a6;
  uint64_t v39 = a7;
  uint64_t v36 = a1;
  uint64_t v37 = a5;
  uint64_t v32 = a3;
  uint64_t v9 = *a2;
  uint64_t v10 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v31 = (uint64_t)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = *(void *)(v9 + 80);
  uint64_t v34 = *(void *)(v9 + 88);
  uint64_t v12 = type metadata accessor for Message();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388]();
  unint64_t v16 = (char *)&v30 - v15;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v33 = v18;
  uint64_t v19 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v32, v12);
  sub_24E4F963C(a4, (uint64_t)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v20 = (*(unsigned __int8 *)(v13 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v21 = (v14 + *(unsigned __int8 *)(v10 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v22 = (v11 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  uint64_t v25 = v34;
  *((void *)v24 + 4) = v35;
  *((void *)v24 + 5) = v25;
  *((void *)v24 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v24[v20], v16, v12);
  sub_24E4F9704(v31, (uint64_t)&v24[v21], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v26 = (uint64_t *)&v24[v22];
  uint64_t v28 = v37;
  unint64_t v27 = v38;
  *uint64_t v26 = v37;
  v26[1] = v27;
  *(void *)&v24[v23] = v39;
  *(void *)&v24[(v23 + 15) & 0xFFFFFFFFFFFFFFF8] = v36;
  swift_retain();
  sub_24E4FB4A0(v28, v27);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E51F518((uint64_t)v33, (uint64_t)&unk_2698EE5B8, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_24E4E4710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  void *v13 = v8;
  v13[1] = sub_24E4FBA64;
  return sub_24E4E47EC(a5, a6, a7, a8, v16, v17);
}

uint64_t sub_24E4E47EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[18] = a6;
  v7[19] = v6;
  v7[16] = a4;
  v7[17] = a5;
  v7[14] = a2;
  v7[15] = a3;
  v7[13] = a1;
  v7[20] = *v6;
  uint64_t v8 = *v6;
  v7[21] = *(void *)(*v6 + 80);
  v7[22] = *(void *)(v8 + 88);
  uint64_t v9 = type metadata accessor for Message();
  v7[23] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v7[24] = v10;
  v7[25] = *(void *)(v10 + 64);
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for MessagingOptions();
  v7[28] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v7[29] = v12;
  v7[30] = *(void *)(v12 + 64);
  v7[31] = swift_task_alloc();
  v7[32] = swift_task_alloc();
  uint64_t v13 = sub_24E52CEC0();
  v7[33] = v13;
  v7[34] = *(void *)(v13 - 8);
  v7[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E49FC, v6, 0);
}

uint64_t sub_24E4E49FC()
{
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v21 = *(void *)(v0 + 240);
  uint64_t v17 = *(void *)(v0 + 216);
  uint64_t v18 = *(void *)(v0 + 232);
  uint64_t v19 = *(void *)(v0 + 200);
  uint64_t v26 = *(void *)(v0 + 192);
  uint64_t v16 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 152);
  uint64_t v25 = *(void *)(v0 + 160);
  uint64_t v6 = *(void *)(v0 + 144);
  unint64_t v23 = *(void *)(v0 + 128);
  uint64_t v24 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 112);
  uint64_t v22 = *(void *)(v0 + 120);
  uint64_t v15 = *(void *)(v0 + 104);
  long long v20 = *(_OWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v3);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = *(void *)(v5 + 152);
  *(void *)(v5 + 152) = 0x8000000000000000;
  sub_24E5030AC(v6, v1, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 152) = v27;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_endAccess();
  sub_24E4F963C(v7, v4, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  *(void *)(v0 + 288) = v9;
  *(void *)(v0 + 296) = (v26 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v17, v15, v16);
  unint64_t v10 = (*(unsigned __int8 *)(v18 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v11 = (v21 + *(unsigned __int8 *)(v26 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v0 + 304) = v12;
  *(_OWORD *)(v12 + 16) = v20;
  *(void *)(v12 + 32) = v5;
  *(void *)(v12 + 40) = v22;
  *(void *)(v12 + 48) = v23;
  *(void *)(v12 + 56) = v24;
  sub_24E4F9704(v4, v12 + v10, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v26 + 32))(v12 + v11, v17, v16);
  *(void *)(v12 + ((v19 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
  swift_retain();
  sub_24E4FB4A0(v22, v23);
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v13;
  void *v13 = v0;
  v13[1] = sub_24E4E4D1C;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E4E4D1C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = sub_24E4E4ED4;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 152);
    swift_release();
    uint64_t v4 = sub_24E4E4E44;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4E4E44()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4E4ED4()
{
  uint64_t v43 = v0;
  swift_release();
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[13];
  uint64_t v2 = (void *)v0[40];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t))v0[36];
  uint64_t v40 = v0[31];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[14];
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C1918);
  v3(v4, v1, v5);
  sub_24E4F963C(v6, v40, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v8 = v2;
  id v9 = v2;
  unint64_t v10 = sub_24E52CED0();
  os_log_type_t v11 = sub_24E52D200();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = (void *)v0[40];
  if (v12)
  {
    unint64_t v41 = v10;
    uint64_t v34 = (void (*)(uint64_t, uint64_t, uint64_t))v0[36];
    uint64_t v35 = v0[31];
    uint64_t v14 = v0[26];
    uint64_t v15 = v0[27];
    id v37 = (id)v0[40];
    uint64_t v17 = v0[23];
    uint64_t v16 = v0[24];
    os_log_type_t type = v11;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v36 = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v42 = v39;
    *(_DWORD *)uint64_t v18 = 136446978;
    uint64_t v19 = sub_24E4E14F4();
    v0[9] = sub_24E4F1740(v19, v20, &v42);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v34(v15, v14, v17);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(v14, v17);
    uint64_t v22 = Message.description.getter(v17);
    unint64_t v24 = v23;
    v21(v15, v17);
    v0[10] = sub_24E4F1740(v22, v24, &v42);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v25 = sub_24E52D560();
    v0[11] = sub_24E4F1740(v25, v26, &v42);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v35, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    id v27 = v37;
    uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v28;
    sub_24E52D250();
    *uint64_t v36 = v28;

    _os_log_impl(&dword_24E4DA000, v41, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v36, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v39, -1, -1);
    MEMORY[0x25333DD20](v18, -1, -1);
  }
  else
  {
    uint64_t v29 = v0[31];
    (*(void (**)(void, void))(v0[24] + 8))(v0[26], v0[23]);
    sub_24E4F96A4(v29, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v30 = (void *)v0[40];
  uint64_t v31 = v0[14];
  v0[8] = v30;
  sub_24E52CCC0();
  swift_beginAccess();
  sub_24E515CDC(v31);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t InternetMessaging.send(message:metadata:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[12] = a4;
  v5[13] = v4;
  v5[10] = a2;
  v5[11] = a3;
  v5[9] = a1;
  v5[14] = *v4;
  v5[15] = type metadata accessor for MessagingOptions();
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Message();
  v5[18] = v6;
  v5[19] = *(void *)(v6 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E5554, v4, 0);
}

uint64_t sub_24E4E5554()
{
  v75 = v0;
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = *(void *)(v2 + *(int *)(v1 + 20));
  int64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v73 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24E4F1DB8(0, v4, 0);
    uint64_t v6 = 0;
    uint64_t v5 = v73;
    unint64_t v7 = *(void *)(v73 + 16);
    uint64_t v8 = 16 * v7;
    do
    {
      uint64_t v10 = *(void *)(v3 + v6 + 40);
      uint64_t v9 = *(void *)(v3 + v6 + 48);
      uint64_t v73 = v5;
      unint64_t v11 = *(void *)(v5 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v11 >> 1)
      {
        sub_24E4F1DB8(v11 > 1, v7 + 1, 1);
        uint64_t v5 = v73;
      }
      *(void *)(v5 + 16) = v7 + 1;
      uint64_t v12 = v5 + v8;
      *(void *)(v12 + 32) = v10;
      *(void *)(v12 + 40) = v9;
      v8 += 16;
      v6 += 24;
      ++v7;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    uint64_t v0 = v71;
    uint64_t v1 = v71[15];
    uint64_t v2 = v71[12];
  }
  uint64_t v13 = sub_24E4F68F0(v5);
  v0[22] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = 0x6F707365722F7728;
  if (!*(unsigned char *)(v2 + *(int *)(v1 + 24))) {
    uint64_t v14 = 0;
  }
  unint64_t v15 = 0xE000000000000000;
  if (*(unsigned char *)(v2 + *(int *)(v1 + 24))) {
    unint64_t v15 = 0xED0000202965736ELL;
  }
  uint64_t v73 = v14;
  unint64_t v74 = v15;
  sub_24E52D020();
  swift_bridgeObjectRelease();
  unint64_t v16 = v74;
  uint64_t v69 = v73;
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v17 = v0[21];
  uint64_t v18 = v0[18];
  uint64_t v19 = v0[19];
  uint64_t v20 = v0[17];
  uint64_t v21 = v0[12];
  uint64_t v22 = v0[10];
  uint64_t v23 = sub_24E52CEF0();
  __swift_project_value_buffer(v23, (uint64_t)qword_26B1C1918);
  uint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v68(v17, v22, v18);
  sub_24E4F963C(v21, v20, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_24E52CED0();
  os_log_type_t v25 = sub_24E52D200();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v27 = v0[21];
  uint64_t v72 = v13;
  if (v26)
  {
    log = v24;
    uint64_t v28 = v0[19];
    uint64_t v63 = v0[20];
    uint64_t v29 = v0[18];
    uint64_t v64 = v0[17];
    os_log_type_t type = v25;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t v73 = v65;
    *(_DWORD *)uint64_t v30 = 136316162;
    uint64_t v31 = sub_24E4E14F4();
    v0[4] = sub_24E4F1740(v31, v32, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    swift_bridgeObjectRetain();
    v0[5] = sub_24E4F1740(v69, v16, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 22) = 2082;
    v68(v63, v27, v29);
    os_log_type_t v33 = v0;
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v34(v27, v29);
    uint64_t v35 = Message.description.getter(v29);
    unint64_t v37 = v36;
    v34(v63, v29);
    uint64_t v0 = v33;
    v33[6] = sub_24E4F1740(v35, v37, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_24E52D190();
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    v33[7] = sub_24E4F1740(v38, v40, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 42) = 2082;
    sub_24E52CEC0();
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v41 = sub_24E52D560();
    v33[8] = sub_24E4F1740(v41, v42, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v64, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, log, type, "%s: Sending (resource) %{public}s: %{public}s to %s with identifier: %{public}s", (uint8_t *)v30, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v65, -1, -1);
    MEMORY[0x25333DD20](v30, -1, -1);
  }
  else
  {
    uint64_t v43 = v0[17];
    (*(void (**)(uint64_t, void))(v0[19] + 8))(v27, v0[18]);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    sub_24E4F96A4(v43, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  sub_24E4F963C(v0[12], v0[16], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v44 = sub_24E52CED0();
  os_log_type_t v45 = sub_24E52D200();
  BOOL v46 = os_log_type_enabled(v44, v45);
  uint64_t v47 = v0[16];
  if (v46)
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    uint64_t v73 = v70;
    *(_DWORD *)uint64_t v48 = 136446466;
    uint64_t v49 = sub_24E4E14F4();
    v0[2] = sub_24E4F1740(v49, v50, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    uint64_t v51 = sub_24E52CF40();
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    v0[3] = sub_24E4F1740(v51, v53, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v47, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, v44, v45, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v70, -1, -1);
    MEMORY[0x25333DD20](v48, -1, -1);
  }
  else
  {
    sub_24E4F96A4(v0[16], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }

  os_log_type_t v54 = v0;
  uint64_t v55 = v0[13];
  uint64_t v56 = v54[12];
  uint64_t v57 = swift_task_alloc();
  v54[23] = v57;
  long long v58 = *((_OWORD *)v54 + 5);
  *(void *)(v57 + 16) = v55;
  *(_OWORD *)(v57 + 24) = v58;
  *(void *)(v57 + 40) = v56;
  *(void *)(v57 + 48) = v72;
  uint64_t v59 = (void *)swift_task_alloc();
  v54[24] = v59;
  uint64_t v60 = sub_24E52CEC0();
  *uint64_t v59 = v54;
  v59[1] = sub_24E4E5E24;
  uint64_t v61 = v54[9];
  return MEMORY[0x270F28DC8](v61, 0xD000000000000026, 0x800000024E52F2F0, sub_24E4F69F0, v57, v60);
}

uint64_t sub_24E4E5E24()
{
  uint64_t v2 = (void *)*v1;
  v2[25] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[13];
    return MEMORY[0x270FA2498](sub_24E4E5FAC, v3, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24E4E5FAC()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4E6050(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = a1;
  uint64_t v34 = a6;
  uint64_t v32 = a4;
  uint64_t v9 = *a2;
  uint64_t v29 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  uint64_t v10 = *(void *)(v29 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v27 = (uint64_t)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = *(void *)(v9 + 80);
  uint64_t v30 = *(void *)(v9 + 88);
  uint64_t v11 = type metadata accessor for Message();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388]();
  unint64_t v15 = (char *)&v27 - v14;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388]();
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v17;
  uint64_t v18 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a3, v11);
  sub_24E4F963C(a5, (uint64_t)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v19 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (*(unsigned __int8 *)(v29 + 80) + v20 + 8) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  unint64_t v22 = (v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  uint64_t v24 = v30;
  *((void *)v23 + 4) = v31;
  *((void *)v23 + 5) = v24;
  *((void *)v23 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v23[v19], v15, v11);
  *(void *)&v23[v20] = v32;
  sub_24E4F9704(v27, (uint64_t)&v23[v21], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v25 = v33;
  *(void *)&v23[v22] = v34;
  *(void *)&v23[(v22 + 15) & 0xFFFFFFFFFFFFFFF8] = v25;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E51F518((uint64_t)v28, (uint64_t)&unk_2698EE580, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_24E4E6398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  void *v13 = v8;
  v13[1] = sub_24E4FBA64;
  return sub_24E4E6468(a5, a6, a7, a8, v16);
}

uint64_t sub_24E4E6468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[18] = a5;
  v6[19] = v5;
  v6[16] = a3;
  v6[17] = a4;
  v6[14] = a1;
  v6[15] = a2;
  v6[20] = *v5;
  uint64_t v7 = *v5;
  v6[21] = *(void *)(*v5 + 80);
  v6[22] = *(void *)(v7 + 88);
  uint64_t v8 = type metadata accessor for Message();
  v6[23] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[24] = v9;
  v6[25] = *(void *)(v9 + 64);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for MessagingOptions();
  v6[28] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v6[29] = v11;
  v6[30] = *(void *)(v11 + 64);
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  uint64_t v12 = sub_24E52CEC0();
  v6[33] = v12;
  v6[34] = *(void *)(v12 - 8);
  v6[35] = swift_task_alloc();
  uint64_t v13 = sub_24E52CDF0();
  v6[36] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v6[37] = v14;
  v6[38] = *(void *)(v14 + 64);
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E671C, v5, 0);
}

uint64_t sub_24E4E671C()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v38 = *(void *)(v0 + 288);
  uint64_t v6 = NSTemporaryDirectory();
  sub_24E52CFF0();

  sub_24E52CDB0();
  swift_bridgeObjectRelease();
  sub_24E52CEB0();
  sub_24E52CE90();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v7(v3, v5);
  sub_24E52CDD0();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 328) = v8;
  *(void *)(v0 + 336) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v1, v38);
  sub_24E52CD90();
  swift_allocObject();
  sub_24E52CD80();
  swift_getWitnessTable();
  *(void *)(v0 + 344) = sub_24E52CD60();
  *(void *)(v0 + 352) = v9;
  swift_release();
  sub_24E52CE30();
  uint64_t v26 = *(void *)(v0 + 320);
  *(void *)os_log_type_t type = *(void *)(v0 + 312);
  uint64_t v10 = *(void *)(v0 + 296);
  uint64_t v28 = *(void *)(v0 + 304);
  uint64_t v11 = *(void *)(v0 + 280);
  uint64_t v37 = *(void *)(v0 + 288);
  uint64_t v12 = *(void *)(v0 + 264);
  uint64_t v40 = *(void *)(v0 + 256);
  uint64_t v30 = *(void *)(v0 + 240);
  uint64_t v27 = *(void *)(v0 + 232);
  uint64_t v39 = *(void *)(v0 + 216);
  uint64_t v29 = *(void *)(v0 + 200);
  uint64_t v36 = *(void *)(v0 + 192);
  uint64_t v41 = *(void *)(v0 + 184);
  uint64_t v13 = *(void *)(v0 + 152);
  uint64_t v14 = *(void *)(v0 + 144);
  uint64_t v33 = *(void *)(v0 + 136);
  os_log_t log = *(os_log_t *)(v0 + 160);
  uint64_t v15 = *(void *)(v0 + 128);
  uint64_t v32 = *(void *)(v0 + 120);
  uint64_t v25 = *(void *)(v0 + 112);
  long long v31 = *(_OWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 272) + 16))(v11, v15, v12);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v42 = *(void *)(v13 + 152);
  *(void *)(v13 + 152) = 0x8000000000000000;
  sub_24E5030AC(v14, v11, isUniquelyReferenced_nonNull_native);
  *(void *)(v13 + 152) = v42;
  swift_bridgeObjectRelease();
  v7(v11, v12);
  swift_endAccess();
  (*(void (**)(os_log_type_t *, uint64_t, uint64_t))(v10 + 16))(*(os_log_type_t **)type, v26, v37);
  sub_24E4F963C(v15, v40, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v39, v25, v41);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v18 = (v28 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (*(unsigned __int8 *)(v27 + 80) + v19 + 8) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v21 = (v30 + *(unsigned __int8 *)(v36 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v22 = swift_allocObject();
  *(void *)(v0 + 360) = v22;
  *(_OWORD *)(v22 + 16) = v31;
  *(void *)(v22 + 32) = v13;
  (*(void (**)(unint64_t, os_log_type_t *, uint64_t))(v10 + 32))(v22 + v17, *(os_log_type_t **)type, v37);
  *(void *)(v22 + v18) = v32;
  *(void *)(v22 + v19) = v33;
  sub_24E4F9704(v40, v22 + v20, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v36 + 32))(v22 + v21, v39, v41);
  *(void *)(v22 + ((v29 + v21 + 7) & 0xFFFFFFFFFFFFFFF8)) = log;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_24E4E71E4;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E4E71E4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = sub_24E4E74E4;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 152);
    swift_release();
    uint64_t v4 = sub_24E4E7358;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4E7358()
{
  sub_24E4F6988(*(void *)(v0 + 344), *(void *)(v0 + 352));
  id v1 = objc_msgSend(self, sel_defaultManager);
  uint64_t v2 = (void *)sub_24E52CDC0();
  *(void *)(v0 + 64) = 0;
  unsigned int v3 = objc_msgSend(v1, sel_removeItemAtURL_error_, v2, v0 + 64);

  uint64_t v4 = *(void **)(v0 + 64);
  if (v3)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = v4;
    uint64_t v7 = (void *)sub_24E52CDA0();

    swift_willThrow();
  }
  (*(void (**)(void, void))(v0 + 328))(*(void *)(v0 + 320), *(void *)(v0 + 288));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_24E4E74E4()
{
  uint64_t v49 = v0;
  v48[1] = *MEMORY[0x263EF8340];
  sub_24E4F6988(*(void *)(v0 + 344), *(void *)(v0 + 352));
  swift_release();
  id v1 = *(void **)(v0 + 376);
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 192);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v8 = sub_24E52CEF0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B1C1918);
  uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v47(v4, v2, v6);
  sub_24E4F963C(v7, v3, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v9 = v1;
  id v10 = v1;
  uint64_t v11 = sub_24E52CED0();
  os_log_type_t v12 = sub_24E52D200();
  uint64_t v13 = v1;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v41 = *(void *)(v0 + 248);
    BOOL v46 = v1;
    os_log_t log = v11;
    uint64_t v14 = *(void *)(v0 + 208);
    uint64_t v15 = *(void *)(v0 + 216);
    uint64_t v17 = *(void *)(v0 + 184);
    uint64_t v16 = *(void *)(v0 + 192);
    os_log_type_t type = v12;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v42 = (void *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v48[0] = v45;
    *(_DWORD *)uint64_t v18 = 136446978;
    uint64_t v19 = sub_24E4E14F4();
    *(void *)(v0 + 72) = sub_24E4F1740(v19, v20, v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v47(v15, v14, v17);
    unint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(v14, v17);
    uint64_t v22 = Message.description.getter(v17);
    unint64_t v24 = v23;
    uint64_t v25 = v15;
    uint64_t v13 = v46;
    v21(v25, v17);
    *(void *)(v0 + 104) = sub_24E4F1740(v22, v24, v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v26 = sub_24E52D560();
    *(void *)(v0 + 88) = sub_24E4F1740(v26, v27, v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v41, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    id v28 = v46;
    uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 96) = v29;
    sub_24E52D250();
    *uint64_t v42 = v29;

    _os_log_impl(&dword_24E4DA000, log, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v42, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v45, -1, -1);
    MEMORY[0x25333DD20](v18, -1, -1);
  }
  else
  {
    uint64_t v30 = *(void *)(v0 + 248);
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 184));
    sub_24E4F96A4(v30, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v31 = *(void *)(v0 + 128);
  *(void *)(v0 + 80) = v13;
  sub_24E52CCC0();
  swift_beginAccess();
  sub_24E515CDC(v31);
  swift_endAccess();
  swift_release();

  id v32 = objc_msgSend(self, sel_defaultManager);
  uint64_t v33 = (void *)sub_24E52CDC0();
  *(void *)(v0 + 64) = 0;
  unsigned __int8 v34 = objc_msgSend(v32, sel_removeItemAtURL_error_, v33, v0 + 64);

  uint64_t v35 = *(void **)(v0 + 64);
  if (v34)
  {
    id v36 = v35;
  }
  else
  {
    id v37 = v35;
    uint64_t v38 = (void *)sub_24E52CDA0();

    swift_willThrow();
  }
  (*(void (**)(void, void))(v0 + 328))(*(void *)(v0 + 320), *(void *)(v0 + 288));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v39 = *(uint64_t (**)(void))(v0 + 8);
  return v39();
}

uint64_t InternetMessaging.sendWithResponse(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = type metadata accessor for Message();
  type metadata accessor for MessageContext();
  v5[8] = swift_getTupleTypeMetadata2();
  v5[9] = swift_task_alloc();
  v5[10] = type metadata accessor for MessagingOptions();
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E7C14, v4, 0);
}

uint64_t sub_24E4E7C14()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[10];
  sub_24E4F963C(v0[5], v2, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(unsigned char *)(v2 + *(int *)(v3 + 24)) = 1;
  sub_24E4F963C(v2, v1, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v4 = *(void *)(v1 + *(int *)(v3 + 20));
  if (*(void *)(v4 + 16) == 1 && *(unsigned __int8 *)(v4 + 32) - 2 <= 2)
  {
    uint64_t v5 = v0[11];
    uint64_t v6 = v0[6];
    uint64_t v7 = v0[4];
    uint64_t v8 = (void *)swift_task_alloc();
    v0[13] = v8;
    v8[2] = v6;
    v8[3] = v7;
    v8[4] = v5;
    id v9 = (void *)swift_task_alloc();
    v0[14] = v9;
    void *v9 = v0;
    v9[1] = sub_24E4E7E2C;
    uint64_t v11 = v0[8];
    uint64_t v10 = v0[9];
    return MEMORY[0x270F28DC8](v10, 0xD000000000000029, 0x800000024E52F320, sub_24E4F6A00, v8, v11);
  }
  else
  {
    sub_24E4E010C();
    swift_allocError();
    *os_log_type_t v12 = 1;
    swift_willThrow();
    uint64_t v13 = v0[11];
    sub_24E4F96A4(v0[12], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    sub_24E4F96A4(v13, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_24E4E7E2C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_24E4E8098;
  }
  else {
    uint64_t v4 = sub_24E4E7F74;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4E7F74()
{
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[7];
  uint64_t v6 = v0[2];
  uint64_t v5 = v0[3];
  sub_24E4F96A4(v0[12], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  sub_24E4F96A4(v1, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v7 = v2 + *(int *)(v3 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v6, v2, v4);
  sub_24E4F9704(v7, v5, (uint64_t (*)(void))type metadata accessor for MessageContext);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24E4E8098()
{
  uint64_t v1 = v0[11];
  sub_24E4F96A4(v0[12], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  sub_24E4F96A4(v1, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_24E4E8150(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a3;
  uint64_t v25 = a1;
  uint64_t v6 = *a2;
  uint64_t v7 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v24 = *(void *)(v6 + 80);
  uint64_t v23 = *(void *)(v6 + 88);
  uint64_t v9 = type metadata accessor for Message();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v22 - v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v22, v9);
  sub_24E4F963C(a4, (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v18 = (v11 + *(unsigned __int8 *)(v7 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = (char *)swift_allocObject();
  *((void *)v19 + 2) = 0;
  *((void *)v19 + 3) = 0;
  uint64_t v20 = v23;
  *((void *)v19 + 4) = v24;
  *((void *)v19 + 5) = v20;
  *((void *)v19 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v19[v17], v13, v9);
  sub_24E4F9704((uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)&v19[v18], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)&v19[(v8 + v18 + 7) & 0xFFFFFFFFFFFFFFF8] = v25;
  swift_retain();
  swift_retain();
  sub_24E51F518((uint64_t)v15, (uint64_t)&unk_2698EE558, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_24E4E8458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v11;
  *uint64_t v11 = v7;
  v11[1] = sub_24E4FBA64;
  return sub_24E4E850C(a5, a6, a7);
}

uint64_t sub_24E4E850C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[19] = *v3;
  uint64_t v5 = *v3;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  v4[20] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[21] = v7;
  v4[22] = *(void *)(v7 + 64);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v4[25] = *(void *)(v5 + 80);
  v4[26] = *(void *)(v5 + 88);
  uint64_t v8 = type metadata accessor for Message();
  v4[27] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[28] = v9;
  v4[29] = *(void *)(v9 + 64);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  uint64_t v10 = sub_24E52CEC0();
  v4[32] = v10;
  v4[33] = *(void *)(v10 - 8);
  v4[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E871C, v3, 0);
}

uint64_t sub_24E4E871C()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v22 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 216);
  uint64_t v16 = *(void *)(v0 + 248);
  uint64_t v17 = *(void *)(v0 + 192);
  uint64_t v20 = *(void *)(v0 + 176);
  uint64_t v18 = *(void *)(v0 + 168);
  uint64_t v23 = *(void *)(v0 + 152);
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v15 = *(void *)(v0 + 120);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  *(void *)(v0 + 280) = v8;
  *(void *)(v0 + 288) = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  long long v19 = *(_OWORD *)(v0 + 200);
  v8(v2, v7, v3);
  *(void *)(v0 + 80) = v6;
  swift_beginAccess();
  type metadata accessor for MessageContext();
  swift_retain();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
  sub_24E52CCE0();
  sub_24E4F95F4((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
  *(void *)(v0 + 296) = sub_24E52CF70();
  sub_24E52CF90();
  swift_endAccess();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 304) = v9;
  *(void *)(v0 + 312) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v16, v15, v5);
  sub_24E4F963C(v7, v17, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v11 = (v22 + *(unsigned __int8 *)(v18 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v0 + 320) = v12;
  *(_OWORD *)(v12 + 16) = v19;
  *(void *)(v12 + 32) = v21;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v12 + v10, v16, v5);
  sub_24E4F9704(v17, v12 + v11, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)(v12 + ((v20 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v23;
  swift_retain();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v13;
  void *v13 = v0;
  v13[1] = sub_24E4E8A68;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E4E8A68()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 336) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 144);
    uint64_t v4 = sub_24E4E8C20;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 144);
    swift_release();
    uint64_t v4 = sub_24E4E8B90;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4E8B90()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4E8C20()
{
  BOOL v46 = v0;
  swift_release();
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[15];
  uint64_t v2 = (void *)v0[42];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t))v0[38];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v43 = v0[23];
  uint64_t v6 = v0[16];
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C1918);
  v3(v4, v1, v5);
  sub_24E4F963C(v6, v43, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v8 = v2;
  id v9 = v2;
  unint64_t v10 = sub_24E52CED0();
  os_log_type_t v11 = sub_24E52D200();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = (void *)v0[42];
  if (v12)
  {
    uint64_t v44 = v10;
    id v37 = (void (*)(uint64_t, uint64_t, uint64_t))v0[38];
    uint64_t v14 = v0[31];
    uint64_t v15 = v0[30];
    id v40 = (id)v0[42];
    uint64_t v17 = v0[27];
    uint64_t v16 = v0[28];
    uint64_t v38 = v0[23];
    os_log_type_t type = v11;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v39 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v45 = v42;
    *(_DWORD *)uint64_t v18 = 136446978;
    uint64_t v19 = sub_24E4E14F4();
    v0[11] = sub_24E4F1740(v19, v20, &v45);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v37(v14, v15, v17);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(v15, v17);
    uint64_t v22 = Message.description.getter(v17);
    unint64_t v24 = v23;
    v21(v14, v17);
    v0[12] = sub_24E4F1740(v22, v24, &v45);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v25 = sub_24E52D560();
    v0[13] = sub_24E4F1740(v25, v26, &v45);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v38, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    id v27 = v40;
    uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v28;
    sub_24E52D250();
    void *v39 = v28;

    _os_log_impl(&dword_24E4DA000, v44, type, "%{public}s: Failed to send message (with response) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v39, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v42, -1, -1);
    MEMORY[0x25333DD20](v18, -1, -1);
  }
  else
  {
    uint64_t v29 = v0[23];
    (*(void (**)(void, void))(v0[28] + 8))(v0[30], v0[27]);
    sub_24E4F96A4(v29, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v30 = (void *)v0[42];
  uint64_t v32 = v0[34];
  uint64_t v31 = (void (*)(uint64_t, uint64_t, uint64_t))v0[35];
  uint64_t v33 = v0[32];
  uint64_t v34 = v0[16];
  v0[8] = v30;
  sub_24E52CCC0();
  v31(v32, v34, v33);
  v0[9] = 0;
  swift_beginAccess();
  sub_24E52CF90();
  swift_endAccess();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t InternetMessaging.send(dictionary:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[11] = *v3;
  v4[12] = type metadata accessor for MessagingOptions();
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E9220, v3, 0);
}

uint64_t sub_24E4E9220()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void *)(v0[9] + *(int *)(v0[12] + 20));
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_24E4F1DB8(0, v2, 0);
    uint64_t v4 = 0;
    uint64_t v3 = v48;
    unint64_t v5 = *(void *)(v48 + 16);
    uint64_t v6 = 16 * v5;
    do
    {
      uint64_t v8 = *(void *)(v1 + v4 + 40);
      uint64_t v7 = *(void *)(v1 + v4 + 48);
      uint64_t v48 = v3;
      unint64_t v9 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v9 >> 1)
      {
        sub_24E4F1DB8(v9 > 1, v5 + 1, 1);
        uint64_t v3 = v48;
      }
      *(void *)(v3 + 16) = v5 + 1;
      uint64_t v10 = v3 + v6;
      *(void *)(v10 + 32) = v8;
      *(void *)(v10 + 40) = v7;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v0 = v47;
  }
  uint64_t v11 = sub_24E4F68F0(v3);
  v0[15] = v11;
  swift_bridgeObjectRelease();
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v12 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = sub_24E52CEF0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B1C1918);
  sub_24E4F963C(v13, v12, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_24E52CED0();
  os_log_type_t v16 = sub_24E52D200();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v18 = v0[14];
  if (v17)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v48 = v45;
    *(_DWORD *)uint64_t v19 = 136315650;
    uint64_t v20 = sub_24E4E14F4();
    v0[4] = sub_24E4F1740(v20, v21, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24E52D190();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    v0[5] = sub_24E4F1740(v22, v24, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 2082;
    sub_24E52CEC0();
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v25 = sub_24E52D560();
    v0[6] = sub_24E4F1740(v25, v26, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v18, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, v15, v16, "%s: Sending raw dictionary to %s with identifier: %{public}s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v45, -1, -1);
    MEMORY[0x25333DD20](v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_24E4F96A4(v18, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  sub_24E4F963C(v0[9], v0[13], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v27 = sub_24E52CED0();
  os_log_type_t v28 = sub_24E52D200();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v30 = v0[13];
  if (v29)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v48 = v46;
    *(_DWORD *)uint64_t v31 = 136446466;
    uint64_t v32 = sub_24E4E14F4();
    v0[2] = sub_24E4F1740(v32, v33, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    uint64_t v34 = sub_24E52CF40();
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    v0[3] = sub_24E4F1740(v34, v36, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v30, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, v27, v28, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v46, -1, -1);
    MEMORY[0x25333DD20](v31, -1, -1);
  }
  else
  {
    sub_24E4F96A4(v0[13], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }

  id v37 = v0;
  uint64_t v38 = v0[10];
  uint64_t v39 = swift_task_alloc();
  v37[16] = v39;
  long long v40 = *((_OWORD *)v37 + 4);
  *(void *)(v39 + 16) = v38;
  *(void *)(v39 + 24) = v11;
  *(_OWORD *)(v39 + 32) = v40;
  uint64_t v41 = (void *)swift_task_alloc();
  v37[17] = v41;
  uint64_t v42 = sub_24E52CEC0();
  *uint64_t v41 = v37;
  v41[1] = sub_24E4E98C0;
  uint64_t v43 = v37[7];
  return MEMORY[0x270F28DC8](v43, 0xD000000000000020, 0x800000024E52F350, sub_24E4F6A0C, v39, v42);
}

uint64_t sub_24E4E98C0()
{
  int64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[10];
    return MEMORY[0x270FA2498](sub_24E4E9A28, v3, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24E4E9A28()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4E9AB0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388]();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  sub_24E4F963C(a5, (uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  BOOL v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = *(void *)(v10 + 80);
  v17[5] = *(void *)(v10 + 88);
  v17[6] = a2;
  v17[7] = a3;
  v17[8] = a4;
  sub_24E4F9704((uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v17 + v16, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)((char *)v17 + ((v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E51F518((uint64_t)v14, (uint64_t)&unk_2698EE530, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_24E4E9CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  void *v13 = v8;
  v13[1] = sub_24E4FBA64;
  return sub_24E4E9DB4(a5, a6, a7, a8);
}

uint64_t sub_24E4E9DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v5[17] = *v4;
  v5[18] = *v4;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  v5[19] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[20] = v7;
  v5[21] = *(void *)(v7 + 64);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  uint64_t v8 = sub_24E52CEC0();
  v5[24] = v8;
  v5[25] = *(void *)(v8 - 8);
  v5[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4E9F40, v4, 0);
}

uint64_t sub_24E4E9F40()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v13 = v0[23];
  uint64_t v14 = v0[20];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[16];
  uint64_t v7 = v0[14];
  uint64_t v6 = v0[15];
  uint64_t v15 = v0[21];
  uint64_t v16 = v0[13];
  uint64_t v17 = v0[12];
  uint64_t v18 = v0[17];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v7, v3);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *(void *)(v5 + 152);
  *(void *)(v5 + 152) = 0x8000000000000000;
  sub_24E5030AC(v6, v2, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 152) = v19;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_endAccess();
  sub_24E4F963C(v7, v13, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v9 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v10 = (void *)swift_allocObject();
  v0[27] = v10;
  v10[2] = *(void *)(v4 + 80);
  v10[3] = *(void *)(v4 + 88);
  v10[4] = v5;
  v10[5] = v16;
  v10[6] = v17;
  sub_24E4F9704(v13, (uint64_t)v10 + v9, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)((char *)v10 + ((v15 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[28] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24E4EA1B4;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E4EA1B4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 128);
    uint64_t v4 = sub_24E4EA350;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 128);
    swift_release();
    uint64_t v4 = sub_24E4EA2DC;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4EA2DC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4EA350()
{
  unint64_t v26 = v0;
  swift_release();
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[29];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[14];
  uint64_t v4 = sub_24E52CEF0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B1C1918);
  sub_24E4F963C(v3, v2, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v5 = v1;
  id v6 = v1;
  uint64_t v7 = sub_24E52CED0();
  os_log_type_t v8 = sub_24E52D200();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[29];
  if (v9)
  {
    uint64_t v23 = v0[22];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = v24;
    *(_DWORD *)uint64_t v11 = 136446722;
    uint64_t v13 = sub_24E4E14F4();
    v0[9] = sub_24E4F1740(v13, v14, &v25);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v15 = sub_24E52D560();
    v0[10] = sub_24E4F1740(v15, v16, &v25);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v23, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v11 + 22) = 2114;
    id v17 = v10;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v18;
    sub_24E52D250();
    *uint64_t v12 = v18;

    _os_log_impl(&dword_24E4DA000, v7, v8, "%{public}s: Failed to send raw dictionary with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v11, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v24, -1, -1);
    MEMORY[0x25333DD20](v11, -1, -1);
  }
  else
  {
    sub_24E4F96A4(v0[22], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v19 = (void *)v0[29];
  uint64_t v20 = v0[14];
  v0[8] = v19;
  sub_24E52CCC0();
  swift_beginAccess();
  sub_24E515CDC(v20);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_24E4EA72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  _OWORD v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[7] = a2;
  uint64_t v9 = type metadata accessor for Message();
  v8[14] = v9;
  v8[15] = *(void *)(v9 - 8);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  v8[18] = swift_task_alloc();
  uint64_t v10 = sub_24E52CEC0();
  v8[19] = v10;
  v8[20] = *(void *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4EA900, 0, 0);
}

uint64_t sub_24E4EA900()
{
  unint64_t v62 = v0;
  v61[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[10];
  uint64_t v2 = *(void **)(v0[7] + 136);
  uint64_t v3 = (void *)sub_24E52CE10();
  sub_24E506B34(v1);
  uint64_t v4 = (void *)sub_24E52D170();
  swift_bridgeObjectRelease();
  unint64_t v5 = MessagingOptions.dictionaryValue.getter();
  sub_24E506E28(v5);
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendData_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  uint64_t v7 = (void *)v0[3];
  os_log_type_t v8 = (void *)v0[2];
  if (!v2)
  {
    id v14 = v7;
    id v15 = v8;
    sub_24E52CDA0();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    goto LABEL_9;
  }
  if (!v8)
  {
    id v16 = v7;
    goto LABEL_7;
  }
  uint64_t v9 = v0[19];
  uint64_t v10 = v0[20];
  uint64_t v11 = v0[18];
  sub_24E52CFF0();
  id v12 = v7;
  id v13 = v8;
  sub_24E52CE80();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_24E4FB96C(v0[18], &qword_26B1C1770);
LABEL_7:
    sub_24E4E010C();
    swift_allocError();
    *id v17 = 0;
    goto LABEL_8;
  }
  uint64_t v60 = v13;
  (*(void (**)(void, void, void))(v0[20] + 32))(v0[22], v0[18], v0[19]);
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v20 = v0[20];
  os_log_t log = (os_log_t)v0[21];
  uint64_t v58 = v0[22];
  uint64_t v21 = v0[19];
  uint64_t v22 = v0[17];
  uint64_t v24 = v0[14];
  uint64_t v23 = v0[15];
  uint64_t v25 = v0[12];
  uint64_t v26 = sub_24E52CEF0();
  __swift_project_value_buffer(v26, (uint64_t)qword_26B1C1918);
  uint64_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v55(v22, v25, v24);
  (*(void (**)(os_log_t, uint64_t, uint64_t))(v20 + 16))(log, v58, v21);
  uint64_t v27 = sub_24E52CED0();
  os_log_type_t v28 = sub_24E52D200();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v31 = v0[21];
  uint64_t v30 = v0[22];
  uint64_t v33 = v0[19];
  uint64_t v32 = v0[20];
  uint64_t v34 = v0[17];
  if (v29)
  {
    uint64_t v50 = v0[20];
    uint64_t v51 = v0[21];
    uint64_t v52 = v0[19];
    uint64_t v35 = v0[15];
    uint64_t v36 = v0[16];
    loga = v27;
    uint64_t v59 = v0[22];
    uint64_t v37 = v0[14];
    uint64_t v38 = swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    v61[0] = v54;
    *(_DWORD *)uint64_t v38 = 136446722;
    os_log_type_t type = v28;
    uint64_t v39 = sub_24E4E14F4();
    v0[4] = sub_24E4F1740(v39, v40, v61);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2082;
    v55(v36, v34, v37);
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v41(v34, v37);
    uint64_t v42 = Message.description.getter(v37);
    unint64_t v44 = v43;
    v41(v36, v37);
    v0[5] = sub_24E4F1740(v42, v44, v61);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 22) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v45 = sub_24E52D560();
    v0[6] = sub_24E4F1740(v45, v46, v61);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    v47(v51, v52);
    _os_log_impl(&dword_24E4DA000, loga, type, "%{public}s: Sent message %{public}s with identifier: %{public}s", (uint8_t *)v38, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v54, -1, -1);
    MEMORY[0x25333DD20](v38, -1, -1);

    uint64_t v48 = v59;
    uint64_t v49 = v52;
  }
  else
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);

    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v47(v31, v33);
    uint64_t v48 = v30;
    uint64_t v49 = v33;
  }
  v47(v48, v49);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
LABEL_9:
  return v18();
}

uint64_t sub_24E4EAF60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  _OWORD v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[7] = a2;
  uint64_t v9 = type metadata accessor for Message();
  v8[14] = v9;
  v8[15] = *(void *)(v9 - 8);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  v8[18] = swift_task_alloc();
  uint64_t v10 = sub_24E52CEC0();
  v8[19] = v10;
  v8[20] = *(void *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4EB134, 0, 0);
}

uint64_t sub_24E4EB134()
{
  uint64_t v61 = v0;
  v60[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = *(void **)(v0[7] + 136);
  uint64_t v4 = (void *)sub_24E52CDC0();
  sub_24E5071F0(v2);
  unint64_t v5 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  sub_24E506B34(v1);
  id v6 = (void *)sub_24E52D170();
  swift_bridgeObjectRelease();
  unint64_t v7 = MessagingOptions.dictionaryValue.getter();
  sub_24E506E28(v7);
  swift_bridgeObjectRelease();
  os_log_type_t v8 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  unsigned int v9 = objc_msgSend(v3, sel_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_, v4, v5, v6, 300, v8, v0 + 2, v0 + 3);

  uint64_t v10 = (void *)v0[3];
  uint64_t v11 = (void *)v0[2];
  if (!v9)
  {
    id v17 = v10;
    id v18 = v11;
    sub_24E52CDA0();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
    goto LABEL_9;
  }
  if (!v11)
  {
    id v19 = v10;
    goto LABEL_7;
  }
  uint64_t v12 = v0[19];
  uint64_t v13 = v0[20];
  uint64_t v14 = v0[18];
  sub_24E52CFF0();
  id v15 = v10;
  id v16 = v11;
  sub_24E52CE80();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
  {
    sub_24E4FB96C(v0[18], &qword_26B1C1770);
LABEL_7:
    sub_24E4E010C();
    swift_allocError();
    unsigned char *v20 = 0;
    goto LABEL_8;
  }
  uint64_t v59 = v16;
  (*(void (**)(void, void, void))(v0[20] + 32))(v0[22], v0[18], v0[19]);
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v23 = v0[21];
  uint64_t v58 = v0[22];
  uint64_t v24 = v0[19];
  uint64_t v25 = v0[20];
  uint64_t v26 = v0[17];
  uint64_t v28 = v0[14];
  uint64_t v27 = v0[15];
  uint64_t v29 = v0[12];
  uint64_t v30 = sub_24E52CEF0();
  __swift_project_value_buffer(v30, (uint64_t)qword_26B1C1918);
  uint64_t v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v57(v26, v29, v28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v23, v58, v24);
  uint64_t v31 = sub_24E52CED0();
  os_log_type_t v32 = sub_24E52D200();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v35 = v0[21];
  uint64_t v34 = v0[22];
  uint64_t v36 = v0[19];
  uint64_t v37 = v0[20];
  uint64_t v38 = v0[17];
  if (v33)
  {
    uint64_t v52 = v0[21];
    os_log_type_t type = v32;
    uint64_t v39 = v0[15];
    uint64_t v40 = v0[16];
    uint64_t v53 = v0[19];
    os_log_t log = v31;
    uint64_t v41 = v0[14];
    uint64_t v42 = swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    v60[0] = v54;
    *(_DWORD *)uint64_t v42 = 136446722;
    uint64_t v43 = sub_24E4E14F4();
    v0[4] = sub_24E4F1740(v43, v44, v60);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2082;
    v57(v40, v38, v41);
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v45(v38, v41);
    uint64_t v46 = Message.description.getter(v41);
    unint64_t v48 = v47;
    v45(v40, v41);
    v0[5] = sub_24E4F1740(v46, v48, v60);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 22) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v36 = v53;
    uint64_t v49 = sub_24E52D560();
    v0[6] = sub_24E4F1740(v49, v50, v60);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v51(v52, v53);
    _os_log_impl(&dword_24E4DA000, log, type, "%{public}s: Sent message (resource) %{public}s with identifier: %{public}s", (uint8_t *)v42, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v54, -1, -1);
    MEMORY[0x25333DD20](v42, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);

    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v51(v35, v36);
  }
  v51(v34, v36);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
LABEL_9:
  return v21();
}

uint64_t sub_24E4EB7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a3;
  type metadata accessor for MessagingOptions();
  v5[8] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Message();
  v5[9] = v8;
  v5[10] = *(void *)(v8 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  uint64_t v9 = sub_24E52CEC0();
  v5[13] = v9;
  v5[14] = *(void *)(v9 - 8);
  uint64_t v10 = swift_task_alloc();
  v5[15] = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  v5[16] = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24E4EB9A8;
  return InternetMessaging.send(message:messageOptions:)(v10, a3, a4);
}

uint64_t sub_24E4EB9A8()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24E4EBEB0;
  }
  else
  {
    (*(void (**)(void, void))(v2[14] + 8))(v2[15], v2[13]);
    uint64_t v3 = sub_24E4EBAD4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E4EBAD4()
{
  BOOL v33 = v0;
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[6];
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C1918);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v8(v2, v1, v3);
  sub_24E4F963C(v6, v5, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v9 = sub_24E52CED0();
  os_log_type_t v10 = sub_24E52D200();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v27 = v8;
    uint64_t v11 = v0[11];
    uint64_t v26 = v0[12];
    os_log_t log = v9;
    uint64_t v13 = v0[9];
    uint64_t v12 = v0[10];
    uint64_t v28 = v0[8];
    os_log_type_t type = v10;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v32 = v29;
    *(_DWORD *)uint64_t v14 = 136446722;
    uint64_t v15 = sub_24E4E14F4();
    v0[2] = sub_24E4F1740(v15, v16, &v32);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    v27(v11, v26, v13);
    id v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v26, v13);
    uint64_t v18 = Message.description.getter(v13);
    unint64_t v20 = v19;
    v17(v11, v13);
    v0[3] = sub_24E4F1740(v18, v20, &v32);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v21 = sub_24E52D560();
    v0[4] = sub_24E4F1740(v21, v22, &v32);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v28, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, log, type, "%{public}s: Sent message (with response) %{public}s with identifier: %{public}s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v29, -1, -1);
    MEMORY[0x25333DD20](v14, -1, -1);
  }
  else
  {
    uint64_t v23 = v0[8];
    (*(void (**)(void, void))(v0[10] + 8))(v0[12], v0[9]);
    sub_24E4F96A4(v23, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_24E4EBEB0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4EBF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a3;
  v6[8] = a4;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  v6[11] = swift_task_alloc();
  uint64_t v7 = sub_24E52CEC0();
  v6[12] = v7;
  v6[13] = *(void *)(v7 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4EC070, 0, 0);
}

uint64_t sub_24E4EC070()
{
  uint64_t v42 = v0;
  v41[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[8];
  uint64_t v2 = *(void **)(v0[6] + 136);
  sub_24E5071F0(v0[7]);
  uint64_t v3 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  sub_24E506B34(v1);
  uint64_t v4 = (void *)sub_24E52D170();
  swift_bridgeObjectRelease();
  unint64_t v5 = MessagingOptions.dictionaryValue.getter();
  sub_24E506E28(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendMessage_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  uint64_t v7 = (void *)v0[3];
  uint64_t v8 = (void *)v0[2];
  if (!v2)
  {
    id v14 = v7;
    id v15 = v8;
    sub_24E52CDA0();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    goto LABEL_9;
  }
  if (!v8)
  {
    id v16 = v7;
    goto LABEL_7;
  }
  uint64_t v9 = v0[12];
  uint64_t v10 = v0[13];
  uint64_t v11 = v0[11];
  sub_24E52CFF0();
  id v12 = v7;
  id v13 = v8;
  sub_24E52CE80();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_24E4FB96C(v0[11], &qword_26B1C1770);
LABEL_7:
    sub_24E4E010C();
    swift_allocError();
    *id v17 = 0;
    goto LABEL_8;
  }
  uint64_t v40 = v13;
  (*(void (**)(void, void, void))(v0[13] + 32))(v0[15], v0[11], v0[12]);
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v21 = v0[14];
  uint64_t v20 = v0[15];
  uint64_t v22 = v0[12];
  uint64_t v23 = v0[13];
  uint64_t v24 = sub_24E52CEF0();
  __swift_project_value_buffer(v24, (uint64_t)qword_26B1C1918);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v20, v22);
  uint64_t v25 = sub_24E52CED0();
  os_log_type_t v26 = sub_24E52D200();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v29 = v0[14];
  uint64_t v28 = v0[15];
  uint64_t v31 = v0[12];
  uint64_t v30 = v0[13];
  if (v27)
  {
    os_log_type_t type = v26;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v41[0] = v39;
    *(_DWORD *)uint64_t v32 = 136446466;
    uint64_t v33 = sub_24E4E14F4();
    v0[4] = sub_24E4F1740(v33, v34, v41);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v35 = sub_24E52D560();
    v0[5] = sub_24E4F1740(v35, v36, v41);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v37(v29, v31);
    _os_log_impl(&dword_24E4DA000, v25, type, "%{public}s: Sent raw dictionary to with identifier: %{public}s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v39, -1, -1);
    MEMORY[0x25333DD20](v32, -1, -1);
  }
  else
  {

    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v37(v29, v31);
  }
  v37(v28, v31);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
LABEL_9:
  return v18();
}

uint64_t sub_24E4EC5BC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 352) = a7;
  *(void *)(v8 + 360) = v7;
  *(void *)(v8 + 336) = a4;
  *(void *)(v8 + 344) = a5;
  *(void *)(v8 + 320) = a1;
  *(void *)(v8 + 328) = a2;
  *(void *)(v8 + 368) = *v7;
  uint64_t v11 = *v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  *(void *)(v8 + 376) = swift_task_alloc();
  *(void *)(v8 + 384) = *(void *)(v11 + 80);
  *(void *)(v8 + 392) = *(void *)(v11 + 88);
  uint64_t v12 = type metadata accessor for Message();
  *(void *)(v8 + 400) = v12;
  uint64_t v13 = type metadata accessor for MessageContext();
  *(void *)(v8 + 408) = v13;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(void *)(v8 + 416) = TupleTypeMetadata2;
  *(void *)(v8 + 424) = *(void *)(TupleTypeMetadata2 - 8);
  *(void *)(v8 + 432) = swift_task_alloc();
  uint64_t v15 = sub_24E52CEC0();
  *(void *)(v8 + 440) = v15;
  *(void *)(v8 + 448) = *(void *)(v15 - 8);
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = swift_task_alloc();
  *(void *)(v8 + 472) = swift_task_alloc();
  *(void *)(v8 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  *(void *)(v8 + 488) = swift_task_alloc();
  *(void *)(v8 + 496) = swift_task_alloc();
  *(void *)(v8 + 504) = type metadata accessor for MessagingOptions();
  *(void *)(v8 + 512) = swift_task_alloc();
  *(void *)(v8 + 520) = swift_task_alloc();
  uint64_t v16 = *(void *)(v13 - 8);
  *(void *)(v8 + 528) = v16;
  *(void *)(v8 + 536) = *(void *)(v16 + 64);
  *(void *)(v8 + 544) = swift_task_alloc();
  *(void *)(v8 + 552) = swift_task_alloc();
  *(void *)(v8 + 560) = swift_task_alloc();
  uint64_t v17 = *(void *)(v12 - 8);
  *(void *)(v8 + 568) = v17;
  *(void *)(v8 + 576) = *(void *)(v17 + 64);
  *(void *)(v8 + 584) = swift_task_alloc();
  *(void *)(v8 + 592) = swift_task_alloc();
  *(void *)(v8 + 600) = swift_task_alloc();
  *(void *)(v8 + 608) = swift_task_alloc();
  *(void *)(v8 + 616) = swift_task_alloc();
  *(void *)(v8 + 624) = swift_task_alloc();
  *(void *)(v8 + 632) = swift_task_alloc();
  uint64_t v18 = a3[1];
  *(void *)(v8 + 640) = *a3;
  *(void *)(v8 + 648) = v18;
  *(unsigned char *)(v8 + 744) = *(unsigned char *)a6;
  uint64_t v19 = *(void *)(a6 + 16);
  *(void *)(v8 + 656) = *(void *)(a6 + 8);
  *(void *)(v8 + 664) = v19;
  return MEMORY[0x270FA2498](sub_24E4EC994, v7, 0);
}

uint64_t sub_24E4EC994()
{
  uint64_t v218 = v0;
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v3 = *(void *)(v1 + 112);
  unint64_t v2 = *(void *)(v1 + 120);
  BOOL v4 = v3 == *(void *)(v0 + 320) && v2 == *(void *)(v0 + 328);
  if (!v4 && (sub_24E52D5A0() & 1) == 0)
  {
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_24E52CEF0();
    __swift_project_value_buffer(v38, (uint64_t)qword_26B1C1918);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v39 = sub_24E52CED0();
    os_log_type_t v40 = sub_24E52D1E0();
    if (os_log_type_enabled(v39, v40))
    {
      unint64_t v41 = *(void *)(v0 + 328);
      uint64_t v202 = *(void *)(v0 + 320);
      uint64_t v42 = swift_slowAlloc();
      uint64_t v208 = swift_slowAlloc();
      v217[0] = v208;
      *(_DWORD *)uint64_t v42 = 136446722;
      uint64_t v43 = sub_24E4E14F4();
      *(void *)(v0 + 256) = sub_24E4F1740(v43, v44, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 248) = sub_24E4F1740(v3, v2, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v42 + 22) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 184) = sub_24E4F1740(v202, v41, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v39, v40, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v42, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v208, -1, -1);
      MEMORY[0x25333DD20](v42, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_20;
  }
  sub_24E52CD50();
  swift_allocObject();
  sub_24E52CD40();
  swift_getWitnessTable();
  sub_24E52CD20();
  uint64_t v5 = *(void *)(v0 + 632);
  uint64_t v6 = *(void *)(v0 + 624);
  uint64_t v7 = *(void *)(v0 + 568);
  uint64_t v9 = *(void *)(v0 + 400);
  uint64_t v8 = *(void *)(v0 + 408);
  uint64_t v10 = *(void *)(v0 + 352);
  swift_release();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v11(v5, v6, v9);
  if (*(unsigned char *)(v10 + *(int *)(v8 + 36)) == 1)
  {
    uint64_t v12 = *(void *)(v0 + 360);
    uint64_t v13 = *(void *)(v12 + 248);
    *(void *)(v0 + 672) = v13;
    *(void *)(v0 + 680) = *(void *)(v12 + 256);
    if (v13)
    {
      v210 = (int *)v13;
      sub_24E4F8EAC(v13);
      if (qword_26B1C1930 != -1) {
        swift_once();
      }
      uint64_t v14 = *(void *)(v0 + 632);
      uint64_t v15 = *(void *)(v0 + 616);
      uint64_t v16 = v0;
      uint64_t v17 = *(void *)(v0 + 568);
      uint64_t v18 = *(void *)(v16 + 560);
      uint64_t v19 = *(void *)(v16 + 400);
      uint64_t v20 = *(void *)(v16 + 352);
      uint64_t v21 = sub_24E52CEF0();
      *(void *)(v16 + 688) = __swift_project_value_buffer(v21, (uint64_t)qword_26B1C1918);
      sub_24E4F963C(v20, v18, (uint64_t (*)(void))type metadata accessor for MessageContext);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
      v22(v15, v14, v19);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v23 = sub_24E52CED0();
      os_log_type_t v24 = sub_24E52D200();
      BOOL v25 = os_log_type_enabled(v23, v24);
      unint64_t v26 = *(void *)(v16 + 664);
      if (v25)
      {
        uint64_t v181 = *(void *)(v16 + 656);
        v207 = v23;
        v193 = *(NSObject **)(v16 + 616);
        v188 = *(NSObject **)(v16 + 608);
        uint64_t v196 = *(void *)(v16 + 568);
        uint64_t v167 = *(void *)(v16 + 560);
        uint64_t v27 = *(void *)(v16 + 400);
        os_log_type_t v203 = v24;
        unint64_t v28 = *(void *)(v16 + 328);
        uint64_t v176 = *(void *)(v16 + 320);
        uint64_t v29 = swift_slowAlloc();
        uint64_t v200 = swift_slowAlloc();
        v217[0] = v200;
        *(_DWORD *)uint64_t v29 = 136316162;
        uint64_t v30 = sub_24E4E14F4();
        *(void *)(v16 + 280) = sub_24E4F1740(v30, v31, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        *(_WORD *)(v29 + 12) = 2080;
        sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
        uint64_t v32 = sub_24E52D560();
        *(void *)(v16 + 288) = sub_24E4F1740(v32, v33, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        sub_24E4F96A4(v167, (uint64_t (*)(void))type metadata accessor for MessageContext);
        *(_WORD *)(v29 + 22) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v16 + 296) = sub_24E4F1740(v176, v28, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v29 + 32) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v16 + 304) = sub_24E4F1740(v181, v26, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v29 + 42) = 2080;
        v22((uint64_t)v188, (uint64_t)v193, v27);
        unint64_t v34 = *(void (**)(NSObject *, uint64_t))(v196 + 8);
        v34(v193, v27);
        uint64_t v35 = Message.description.getter(v27);
        unint64_t v37 = v36;
        v34(v188, v27);
        *(void *)(v16 + 312) = sub_24E4F1740(v35, v37, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4DA000, v207, v203, "%s: Received message %s on %s from %s: %s expecting response", (uint8_t *)v29, 0x34u);
        swift_arrayDestroy();
        MEMORY[0x25333DD20](v200, -1, -1);
        MEMORY[0x25333DD20](v29, -1, -1);
      }
      else
      {
        uint64_t v93 = *(void *)(v16 + 560);
        unint64_t v34 = *(void (**)(NSObject *, uint64_t))(*(void *)(v16 + 568) + 8);
        v34(*(NSObject **)(v16 + 616), *(void *)(v16 + 400));
        sub_24E4F96A4(v93, (uint64_t (*)(void))type metadata accessor for MessageContext);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      *(void *)(v16 + 696) = v34;
      uint64_t v94 = *(void *)(v16 + 664);
      uint64_t v95 = *(void *)(v16 + 656);
      char v96 = *(unsigned char *)(v16 + 744);
      uint64_t v97 = *(void *)(v16 + 648);
      *(void *)(v16 + 88) = *(void *)(v16 + 640);
      *(void *)(v16 + 96) = v97;
      *(unsigned char *)(v16 + 40) = v96;
      *(void *)(v16 + 48) = v95;
      *(void *)(v16 + 56) = v94;
      unint64_t v98 = sub_24E4E17AC(MEMORY[0x263F8EE78], &qword_2698EEA30, &qword_2698EE470, (uint64_t (*)(uint64_t *, unint64_t))sub_24E4F7148);
      *(void *)(v16 + 704) = v98;
      v213 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))((char *)v210 + *v210);
      v99 = (void *)swift_task_alloc();
      *(void *)(v16 + 712) = v99;
      void *v99 = v16;
      v99[1] = sub_24E4EE6D0;
      uint64_t v100 = *(void *)(v16 + 632);
      uint64_t v101 = *(void *)(v16 + 600);
      uint64_t v102 = *(void *)(v16 + 352);
      return v213(v101, v16 + 88, v16 + 40, v100, v98, v102);
    }
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v82 = sub_24E52CEF0();
    __swift_project_value_buffer(v82, (uint64_t)qword_26B1C1918);
    unint64_t v83 = sub_24E52CED0();
    os_log_type_t v84 = sub_24E52D1E0();
    BOOL v85 = os_log_type_enabled(v83, v84);
    uint64_t v86 = *(void *)(v0 + 632);
    uint64_t v87 = *(void *)(v0 + 568);
    uint64_t v88 = *(void *)(v0 + 400);
    if (v85)
    {
      uint64_t v212 = *(void *)(v0 + 632);
      v89 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      v217[0] = v90;
      *(_DWORD *)v89 = 136446210;
      uint64_t v91 = sub_24E4E14F4();
      *(void *)(v0 + 240) = sub_24E4F1740(v91, v92, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E4DA000, v83, v84, "%{public}s: No replyCallback!", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v90, -1, -1);
      MEMORY[0x25333DD20](v89, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v212, v88);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v86, v88);
    }
  }
  else
  {
    uint64_t v45 = *(void *)(v0 + 488);
    uint64_t v46 = *(void *)(v0 + 440);
    uint64_t v47 = *(void *)(v0 + 448);
    sub_24E4FB9C8(*(void *)(v0 + 352), v45, &qword_26B1C1770);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46) == 1)
    {
      sub_24E4FB96C(*(void *)(v0 + 488), &qword_26B1C1770);
    }
    else
    {
      uint64_t v50 = *(void *)(v0 + 472);
      uint64_t v51 = *(void *)(v0 + 440);
      uint64_t v52 = *(void *)(v0 + 360);
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 448) + 32))(v50, *(void *)(v0 + 488), v51);
      swift_beginAccess();
      uint64_t v53 = *(void *)(v52 + 160);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
      uint64_t v54 = sub_24E52CCE0();
      uint64_t v55 = sub_24E4F95F4((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
      MEMORY[0x25333D010](v50, v53, v51, v54, v55);
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 160))
      {
        if (qword_26B1C1930 != -1) {
          swift_once();
        }
        uint64_t v56 = *(void *)(v0 + 632);
        uint64_t v57 = *(void *)(v0 + 592);
        uint64_t v58 = *(void *)(v0 + 568);
        uint64_t v59 = *(void *)(v0 + 552);
        uint64_t v185 = *(void *)(v0 + 472);
        uint64_t v182 = *(void *)(v0 + 464);
        uint64_t v61 = *(void *)(v0 + 440);
        uint64_t v60 = *(void *)(v0 + 448);
        uint64_t v62 = *(void *)(v0 + 400);
        uint64_t v63 = *(void *)(v0 + 352);
        uint64_t v64 = sub_24E52CEF0();
        __swift_project_value_buffer(v64, (uint64_t)qword_26B1C1918);
        sub_24E4F963C(v63, v59, (uint64_t (*)(void))type metadata accessor for MessageContext);
        v204 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16);
        v204(v57, v56, v62);
        uint64_t v65 = v182;
        v183 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
        v183(v65, v185, v61);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        long long v66 = sub_24E52CED0();
        os_log_type_t v67 = sub_24E52D200();
        if (os_log_type_enabled(v66, v67))
        {
          uint64_t v180 = *(void *)(v0 + 656);
          uint64_t v166 = *(void *)(v0 + 608);
          uint64_t v165 = *(void *)(v0 + 592);
          uint64_t v68 = *(void *)(v0 + 568);
          uint64_t v69 = *(void *)(v0 + 552);
          uint64_t v168 = *(void *)(v0 + 464);
          uint64_t v177 = *(void *)(v0 + 448);
          uint64_t v164 = *(void *)(v0 + 440);
          unint64_t v161 = *(void *)(v0 + 664);
          uint64_t v162 = *(void *)(v0 + 400);
          os_log_type_t type = v67;
          unint64_t v70 = *(void *)(v0 + 328);
          uint64_t v163 = *(void *)(v0 + 320);
          os_log_t log = v66;
          uint64_t v71 = swift_slowAlloc();
          uint64_t v171 = swift_slowAlloc();
          v217[0] = v171;
          *(_DWORD *)uint64_t v71 = 136316418;
          uint64_t v72 = sub_24E4E14F4();
          *(void *)(v0 + 192) = sub_24E4F1740(v72, v73, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 12) = 2080;
          sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
          uint64_t v74 = sub_24E52D560();
          *(void *)(v0 + 200) = sub_24E4F1740(v74, v75, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          sub_24E4F96A4(v69, (uint64_t (*)(void))type metadata accessor for MessageContext);
          *(_WORD *)(v71 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 208) = sub_24E4F1740(v163, v70, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v71 + 32) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 216) = sub_24E4F1740(v180, v161, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v71 + 42) = 2080;
          v204(v166, v165, v162);
          uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
          v76(v165, v162);
          uint64_t v77 = Message.description.getter(v162);
          unint64_t v79 = v78;
          v211 = v76;
          v76(v166, v162);
          *(void *)(v0 + 224) = sub_24E4F1740(v77, v79, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 52) = 2080;
          uint64_t v80 = sub_24E52D560();
          *(void *)(v0 + 232) = sub_24E4F1740(v80, v81, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          v209 = *(void (**)(uint64_t, uint64_t))(v177 + 8);
          v209(v168, v164);
          _os_log_impl(&dword_24E4DA000, log, type, "%s: Received message %s on %s from %s: %s in response to %s", (uint8_t *)v71, 0x3Eu);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v171, -1, -1);
          MEMORY[0x25333DD20](v71, -1, -1);
        }
        else
        {
          uint64_t v115 = *(void *)(v0 + 552);
          uint64_t v116 = *(void *)(v0 + 464);
          uint64_t v117 = *(void *)(v0 + 440);
          uint64_t v118 = *(void *)(v0 + 448);
          v211 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 568) + 8);
          v211(*(void *)(v0 + 592), *(void *)(v0 + 400));
          sub_24E4F96A4(v115, (uint64_t (*)(void))type metadata accessor for MessageContext);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v209 = *(void (**)(uint64_t, uint64_t))(v118 + 8);
          v209(v116, v117);
        }
        *(void *)typea = *(void *)(v0 + 632);
        uint64_t v119 = *(void *)(v0 + 472);
        uint64_t v120 = *(void *)(v0 + 456);
        uint64_t v122 = *(void *)(v0 + 432);
        uint64_t v121 = *(void *)(v0 + 440);
        uint64_t v124 = *(void *)(v0 + 416);
        uint64_t v123 = *(void *)(v0 + 424);
        uint64_t v125 = *(void *)(v0 + 400);
        uint64_t v126 = *(void *)(v0 + 352);
        uint64_t v127 = v122 + *(int *)(v124 + 48);
        ((void (*)(uint64_t))v204)(v122);
        sub_24E4F963C(v126, v127, (uint64_t (*)(void))type metadata accessor for MessageContext);
        sub_24E52CCD0();
        (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v122, v124);
        v183(v120, v119, v121);
        *(void *)(v0 + 176) = 0;
        swift_beginAccess();
        sub_24E52CF70();
        sub_24E52CF90();
        swift_endAccess();
        swift_release();
        v209(v119, v121);
        v211(*(void *)typea, v125);
        goto LABEL_20;
      }
      if (qword_26B1C1930 != -1) {
        swift_once();
      }
      uint64_t v103 = sub_24E52CEF0();
      __swift_project_value_buffer(v103, (uint64_t)qword_26B1C1918);
      v104 = sub_24E52CED0();
      os_log_type_t v105 = sub_24E52D1E0();
      BOOL v106 = os_log_type_enabled(v104, v105);
      uint64_t v107 = *(void *)(v0 + 472);
      uint64_t v109 = *(void *)(v0 + 440);
      uint64_t v108 = *(void *)(v0 + 448);
      if (v106)
      {
        uint64_t v197 = *(void *)(v0 + 440);
        v110 = (uint8_t *)swift_slowAlloc();
        v205 = v11;
        uint64_t v111 = swift_slowAlloc();
        v217[0] = v111;
        *(_DWORD *)v110 = 136315138;
        uint64_t v112 = sub_24E4E14F4();
        *(void *)(v0 + 168) = sub_24E4F1740(v112, v113, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4DA000, v104, v105, "%s: Got unexpected response!", v110, 0xCu);
        swift_arrayDestroy();
        uint64_t v114 = v111;
        uint64_t v11 = v205;
        MEMORY[0x25333DD20](v114, -1, -1);
        MEMORY[0x25333DD20](v110, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v107, v197);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v107, v109);
      }
    }
    v206 = (void (*)(unint64_t, uint64_t, uint64_t))v11;
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v128 = *(void *)(v0 + 632);
    uint64_t v129 = *(void *)(v0 + 584);
    uint64_t v130 = *(void *)(v0 + 568);
    uint64_t v131 = *(void *)(v0 + 400);
    uint64_t v132 = sub_24E52CEF0();
    __swift_project_value_buffer(v132, (uint64_t)qword_26B1C1918);
    v216 = *(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 16);
    v216(v129, v128, v131);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v133 = sub_24E52CED0();
    os_log_type_t v134 = sub_24E52D200();
    BOOL v135 = os_log_type_enabled(v133, v134);
    unint64_t v136 = *(void *)(v0 + 664);
    if (v135)
    {
      uint64_t v178 = *(void *)(v0 + 656);
      uint64_t v186 = *(void *)(v0 + 584);
      uint64_t v189 = *(void *)(v0 + 608);
      uint64_t v214 = *(void *)(v0 + 568);
      uint64_t v184 = *(void *)(v0 + 400);
      os_log_type_t v198 = v134;
      v194 = v133;
      uint64_t v138 = *(void *)(v0 + 320);
      unint64_t v137 = *(void *)(v0 + 328);
      uint64_t v139 = swift_slowAlloc();
      uint64_t v191 = swift_slowAlloc();
      v217[0] = v191;
      *(_DWORD *)uint64_t v139 = 136316163;
      uint64_t v140 = sub_24E4E14F4();
      *(void *)(v0 + 120) = sub_24E4F1740(v140, v141, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v139 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 128) = sub_24E4F1740(v138, v137, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v139 + 22) = 2160;
      *(void *)(v0 + 136) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v139 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 144) = sub_24E4F1740(v178, v136, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v139 + 42) = 2082;
      v216(v189, v186, v184);
      v215 = *(void (**)(uint64_t, uint64_t))(v214 + 8);
      v215(v186, v184);
      uint64_t v142 = Message.description.getter(v184);
      unint64_t v144 = v143;
      v215(v189, v184);
      *(void *)(v0 + 152) = sub_24E4F1740(v142, v144, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E4DA000, v194, v198, "%s: Received message on %{public}s from %{private,mask.hash}s: %{public}s", (uint8_t *)v139, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v191, -1, -1);
      MEMORY[0x25333DD20](v139, -1, -1);
    }
    else
    {
      v215 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 568) + 8);
      v215(*(void *)(v0 + 584), *(void *)(v0 + 400));
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v145 = *(void *)(v0 + 360);
    uint64_t v146 = *(void *)(v145 + 184);
    if (v146)
    {
      uint64_t v199 = *(void *)(v0 + 656);
      uint64_t v201 = *(void *)(v0 + 664);
      char v195 = *(unsigned char *)(v0 + 744);
      uint64_t v192 = *(void *)(v0 + 648);
      uint64_t v190 = *(void *)(v0 + 640);
      uint64_t v147 = *(void *)(v0 + 632);
      uint64_t v148 = *(void *)(v0 + 608);
      uint64_t v187 = *(void *)(v0 + 576);
      os_log_t loga = *(os_log_t *)(v0 + 544);
      uint64_t v172 = *(void *)(v0 + 568);
      *(void *)typeb = *(void *)(v0 + 528);
      uint64_t v149 = *(void *)(v0 + 400);
      uint64_t v150 = *(void *)(v0 + 376);
      uint64_t v151 = *(void *)(v0 + 352);
      uint64_t v152 = *(void *)(v145 + 192);
      uint64_t v153 = sub_24E52D160();
      long long v179 = *(_OWORD *)(v0 + 384);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v153 - 8) + 56))(v150, 1, 1, v153);
      v216(v148, v147, v149);
      sub_24E4F963C(v151, (uint64_t)loga, (uint64_t (*)(void))type metadata accessor for MessageContext);
      uint64_t v154 = v0;
      unint64_t v155 = (*(unsigned __int8 *)(v172 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v172 + 80);
      unint64_t v156 = (v187 + *(unsigned __int8 *)(*(void *)typeb + 80) + v155) & ~(unint64_t)*(unsigned __int8 *)(*(void *)typeb + 80);
      uint64_t v157 = swift_allocObject();
      *(void *)(v157 + 16) = 0;
      *(void *)(v157 + 24) = 0;
      *(_OWORD *)(v157 + 32) = v179;
      *(void *)(v157 + 48) = v146;
      *(void *)(v157 + 56) = v152;
      *(void *)(v157 + 64) = v190;
      *(void *)(v157 + 72) = v192;
      *(unsigned char *)(v157 + 80) = v195;
      unint64_t v158 = v157 + v155;
      uint64_t v0 = v154;
      *(void *)(v157 + 88) = v199;
      *(void *)(v157 + 96) = v201;
      v206(v158, v148, v149);
      sub_24E4F9704((uint64_t)loga, v157 + v156, (uint64_t (*)(void))type metadata accessor for MessageContext);
      sub_24E4F8EAC(v146);
      swift_bridgeObjectRetain();
      sub_24E4F8EAC(v146);
      swift_bridgeObjectRetain();
      sub_24E51F518(v150, (uint64_t)&unk_2698EE4E8, v157);
      swift_release();
      sub_24E4F66D8(v146);
      uint64_t v159 = v147;
      uint64_t v160 = v149;
    }
    else
    {
      uint64_t v159 = *(void *)(v0 + 632);
      uint64_t v160 = *(void *)(v0 + 400);
    }
    v215(v159, v160);
  }
LABEL_20:
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v48 = *(uint64_t (**)(void))(v0 + 8);
  return v48();
}

uint64_t sub_24E4EE6D0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 720) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 360);
    BOOL v4 = sub_24E4EED64;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 360);
    swift_bridgeObjectRelease();
    BOOL v4 = sub_24E4EE7F8;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4EE7F8()
{
  uint64_t v1 = *(void *)(v0 + 664);
  char v21 = *(unsigned char *)(v0 + 744);
  uint64_t v22 = *(void *)(v0 + 656);
  uint64_t v24 = *(void *)(v0 + 520);
  uint64_t v3 = *(int **)(v0 + 504);
  uint64_t v2 = *(void *)(v0 + 512);
  uint64_t v4 = *(void *)(v0 + 496);
  uint64_t v6 = *(void *)(v0 + 440);
  uint64_t v5 = *(void *)(v0 + 448);
  uint64_t v7 = *(void *)(v0 + 408);
  uint64_t v8 = *(void *)(v0 + 352);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24E52DE40;
  *(unsigned char *)(v9 + 32) = v21;
  *(void *)(v9 + 40) = v22;
  *(void *)(v9 + 48) = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8 + *(int *)(v7 + 20), v6);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v10(v4, 0, 1, v6);
  swift_bridgeObjectRetain();
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v23 = sub_24E4F6DB0(MEMORY[0x263F8EE78]);
  uint64_t v12 = sub_24E4F6DB0(v11);
  uint64_t v13 = v2 + v3[7];
  v10(v13, 1, 1, v6);
  sub_24E52CEB0();
  *(void *)(v2 + v3[5]) = v9;
  *(unsigned char *)(v2 + v3[6]) = 0;
  sub_24E4F92E8(v4, v13);
  uint64_t v14 = v2 + v3[8];
  *(void *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 8) = 1;
  *(unsigned char *)(v2 + v3[9]) = 0;
  *(void *)(v2 + v3[10]) = v23;
  *(void *)(v2 + v3[11]) = v12;
  uint64_t v15 = (void *)(v2 + v3[12]);
  *uint64_t v15 = 0;
  v15[1] = 0;
  sub_24E4FB96C(v4, &qword_26B1C1770);
  *(_OWORD *)(v2 + v3[13]) = xmmword_24E52DF20;
  sub_24E4F9704(v2, v24, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 728) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_24E4EEA4C;
  uint64_t v17 = *(void *)(v0 + 600);
  uint64_t v18 = *(void *)(v0 + 520);
  uint64_t v19 = *(void *)(v0 + 480);
  return InternetMessaging.send(message:messageOptions:)(v19, v17, v18);
}

uint64_t sub_24E4EEA4C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 736) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[45];
    uint64_t v4 = sub_24E4EF114;
  }
  else
  {
    uint64_t v5 = v2[45];
    (*(void (**)(void, void))(v2[56] + 8))(v2[60], v2[55]);
    uint64_t v4 = sub_24E4EEB84;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E4EEB84()
{
  uint64_t v1 = v0[79];
  uint64_t v2 = v0[75];
  uint64_t v3 = v0[71];
  uint64_t v4 = v0[65];
  uint64_t v5 = v0[50];
  sub_24E4F66D8(v0[84]);
  sub_24E4F96A4(v4, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6(v2, v5);
  v6(v1, v5);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24E4EED64()
{
  uint64_t v22 = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[90];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[87];
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24E52CED0();
  os_log_type_t v6 = sub_24E52D1E0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v18 = v0[84];
    uint64_t v19 = v0[50];
    uint64_t v20 = v0[79];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v9;
    *(_DWORD *)uint64_t v7 = 136446466;
    uint64_t v10 = sub_24E4E14F4();
    v0[33] = sub_24E4F1740(v10, v11, &v21);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2114;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[34] = v13;
    sub_24E52D250();
    *uint64_t v8 = v13;

    _os_log_impl(&dword_24E4DA000, v5, v6, "%{public}s: Error sending response: %{public}@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v9, -1, -1);
    MEMORY[0x25333DD20](v7, -1, -1);
    sub_24E4F66D8(v18);

    v2(v20, v19);
  }
  else
  {
    uint64_t v14 = v0[79];
    uint64_t v15 = v0[50];
    sub_24E4F66D8(v0[84]);

    v2(v14, v15);
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
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_24E4EF114()
{
  uint64_t v25 = v0;
  uint64_t v1 = v0[75];
  uint64_t v2 = v0[71];
  uint64_t v3 = v0[50];
  sub_24E4F96A4(v0[65], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v4(v1, v3);
  uint64_t v5 = (void *)v0[92];
  id v6 = v5;
  id v7 = v5;
  uint64_t v8 = sub_24E52CED0();
  os_log_type_t v9 = sub_24E52D1E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v21 = v0[84];
    uint64_t v22 = v0[50];
    uint64_t v23 = v0[79];
    uint64_t v10 = swift_slowAlloc();
    unint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v24 = v12;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v13 = sub_24E4E14F4();
    v0[33] = sub_24E4F1740(v13, v14, &v24);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2114;
    id v15 = v5;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[34] = v16;
    sub_24E52D250();
    *unint64_t v11 = v16;

    _os_log_impl(&dword_24E4DA000, v8, v9, "%{public}s: Error sending response: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v12, -1, -1);
    MEMORY[0x25333DD20](v10, -1, -1);
    sub_24E4F66D8(v21);

    v4(v23, v22);
  }
  else
  {
    uint64_t v17 = v0[79];
    uint64_t v18 = v0[50];
    sub_24E4F66D8(v0[84]);

    v4(v17, v18);
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
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_24E4EF4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 104) = v11;
  *(void *)(v8 + 112) = v12;
  *(_OWORD *)(v8 + 88) = v10;
  *(unsigned char *)(v8 + 136) = a8;
  *(void *)(v8 + 72) = a6;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 56) = a4;
  *(void *)(v8 + 64) = a5;
  return MEMORY[0x270FA2498](sub_24E4EF534, 0, 0);
}

uint64_t sub_24E4EF534()
{
  long long v1 = *(_OWORD *)(v0 + 88);
  char v2 = *(unsigned char *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 40) = *(void *)(v0 + 72);
  id v4 = *(int **)(v0 + 56);
  *(void *)(v0 + 48) = v3;
  *(unsigned char *)(v0 + 16) = v2;
  *(_OWORD *)(v0 + 24) = v1;
  unint64_t v5 = sub_24E4E17AC(MEMORY[0x263F8EE78], &qword_2698EEA30, &qword_2698EE470, (uint64_t (*)(uint64_t *, unint64_t))sub_24E4F7148);
  *(void *)(v0 + 120) = v5;
  long long v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))((char *)v4 + *v4);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v6;
  *id v6 = v0;
  v6[1] = sub_24E4EF680;
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);
  return v10(v0 + 40, v0 + 16, v7, v5, v8);
}

uint64_t sub_24E4EF680()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  long long v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_24E4EF790(void (*a1)(char *, uint64_t), unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v98 = a7;
  uint64_t v107 = *v7;
  unint64_t v14 = v107;
  uint64_t v96 = *(void *)(type metadata accessor for MessageContext() - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v97 = v15;
  uint64_t v99 = (uint64_t)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v102 = (uint64_t)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v14[10];
  uint64_t v94 = v14[11];
  uint64_t v95 = v17;
  uint64_t v18 = type metadata accessor for Message();
  os_log_type_t v105 = *(void **)(v18 - 8);
  uint64_t v106 = v18;
  uint64_t v19 = v105[8];
  uint64_t v20 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v101 = (char *)&v83 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v83 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v83 - v25;
  MEMORY[0x270FA5388](v24);
  v104 = (char *)&v83 - v27;
  uint64_t v28 = a3[1];
  uint64_t v92 = *a3;
  uint64_t v93 = v28;
  int v91 = *a6;
  uint64_t v100 = *((void *)a6 + 1);
  unint64_t v103 = *((void *)a6 + 2);
  uint64_t v29 = (uint64_t)v7[14];
  unint64_t v30 = (unint64_t)v7[15];
  uint64_t v108 = a1;
  if (void (*)(char *, uint64_t))v29 == a1 && v30 == a2 || (sub_24E52D5A0())
  {
    uint64_t v90 = a5;
    uint64_t v31 = sub_24E52CE00();
    unint64_t v33 = v32;
    sub_24E52CD50();
    swift_allocObject();
    sub_24E52CD40();
    uint64_t v34 = v106;
    swift_getWitnessTable();
    sub_24E52CD20();
    sub_24E4F6988(v31, v33);
    swift_release();
    uint64_t v43 = v104;
    uint64_t v42 = v105;
    unint64_t v44 = (void (*)(unint64_t, char *, uint64_t))v105[4];
    uint64_t v87 = v105 + 4;
    uint64_t v86 = v44;
    v44((unint64_t)v104, v26, v34);
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_24E52CEF0();
    __swift_project_value_buffer(v45, (uint64_t)qword_26B1C1918);
    uint64_t v46 = (void (*)(char *, char *, uint64_t))v42[2];
    v89 = v42 + 2;
    uint64_t v88 = v46;
    v46(v23, v43, v34);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v47 = sub_24E52CED0();
    os_log_type_t v48 = sub_24E52D200();
    int v85 = v48;
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v84 = swift_slowAlloc();
      v110[0] = v84;
      *(_DWORD *)uint64_t v49 = 136316419;
      os_log_t v83 = v47;
      uint64_t v50 = sub_24E4E14F4();
      uint64_t v109 = sub_24E4F1740(v50, v51, v110);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v109 = sub_24E4F1740((uint64_t)v108, a2, v110);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v49 + 22) = 2160;
      uint64_t v109 = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v49 + 32) = 2081;
      unint64_t v52 = v103;
      swift_bridgeObjectRetain();
      uint64_t v109 = sub_24E4F1740(v100, v52, v110);
      uint64_t v107 = v110;
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v49 + 42) = 2080;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4D0);
      uint64_t v53 = sub_24E52CF40();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      uint64_t v109 = sub_24E4F1740(v53, v55, v110);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 52) = 2082;
      uint64_t v56 = v101;
      v88(v101, v23, v34);
      uint64_t v57 = (void (*)(char *, uint64_t))v105[1];
      v57(v23, v34);
      uint64_t v58 = Message.description.getter(v34);
      uint64_t v59 = v34;
      uint64_t v60 = v58;
      unint64_t v62 = v61;
      uint64_t v108 = v57;
      v57(v56, v59);
      uint64_t v109 = sub_24E4F1740(v60, v62, v110);
      sub_24E52D250();
      uint64_t v43 = v104;
      swift_bridgeObjectRelease();
      os_log_t v63 = v83;
      _os_log_impl(&dword_24E4DA000, v83, (os_log_type_t)v85, "%s: Received (resource) message on %{public}s from %{private,mask.hash}s: metadata: %s'; message: %{public}s",
        (uint8_t *)v49,
        0x3Eu);
      uint64_t v64 = v84;
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v64, -1, -1);
      uint64_t v65 = v49;
      uint64_t v42 = v105;
      MEMORY[0x25333DD20](v65, -1, -1);
    }
    else
    {
      uint64_t v108 = (void (*)(char *, uint64_t))v42[1];
      v108(v23, v34);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    long long v66 = v88;
    uint64_t v67 = (uint64_t)v8[23];
    if (v67)
    {
      uint64_t v68 = v8[24];
      uint64_t v69 = sub_24E52D160();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v102, 1, 1, v69);
      unint64_t v70 = v101;
      v66(v101, v43, v106);
      uint64_t v71 = v99;
      sub_24E4F963C(v98, v99, (uint64_t (*)(void))type metadata accessor for MessageContext);
      unint64_t v72 = (*((unsigned __int8 *)v42 + 80) + 104) & ~(unint64_t)*((unsigned __int8 *)v42 + 80);
      unint64_t v73 = (v19 + v72 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v74 = (*(unsigned __int8 *)(v96 + 80) + v73 + 8) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
      uint64_t v75 = swift_allocObject();
      *(void *)(v75 + 16) = 0;
      *(void *)(v75 + 24) = 0;
      uint64_t v77 = v93;
      uint64_t v76 = v94;
      *(void *)(v75 + 32) = v95;
      *(void *)(v75 + 40) = v76;
      *(void *)(v75 + 48) = v67;
      *(void *)(v75 + 56) = v68;
      *(void *)(v75 + 64) = v92;
      *(void *)(v75 + 72) = v77;
      *(unsigned char *)(v75 + 80) = v91;
      unint64_t v78 = v103;
      *(void *)(v75 + 88) = v100;
      *(void *)(v75 + 96) = v78;
      unint64_t v79 = v70;
      uint64_t v80 = v106;
      v86(v75 + v72, v79, v106);
      *(void *)(v75 + v73) = v90;
      sub_24E4F9704(v71, v75 + v74, (uint64_t (*)(void))type metadata accessor for MessageContext);
      sub_24E4F8EAC(v67);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E4F8EAC(v67);
      swift_bridgeObjectRetain();
      sub_24E51F518(v102, (uint64_t)&unk_2698EE4C8, v75);
      swift_release();
      sub_24E4F66D8(v67);
      unint64_t v81 = v104;
      uint64_t v82 = v80;
    }
    else
    {
      unint64_t v81 = v43;
      uint64_t v82 = v106;
    }
    v108(v81, v82);
  }
  else
  {
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_24E52CEF0();
    __swift_project_value_buffer(v35, (uint64_t)qword_26B1C1918);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    unint64_t v36 = sub_24E52CED0();
    os_log_type_t v37 = sub_24E52D1E0();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      v110[0] = v106;
      *(_DWORD *)uint64_t v38 = 136446722;
      uint64_t v39 = sub_24E4E14F4();
      uint64_t v109 = sub_24E4F1740(v39, v40, v110);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v109 = sub_24E4F1740(v29, v30, v110);
      sub_24E52D250();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 22) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v109 = sub_24E4F1740((uint64_t)v108, a2, v110);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v36, v37, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v38, 0x20u);
      uint64_t v41 = v106;
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v41, -1, -1);
      MEMORY[0x25333DD20](v38, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
}

uint64_t sub_24E4F0524(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 48) = a7;
  *(unsigned char *)(v8 + 16) = a8;
  *(void *)(v8 + 24) = v13;
  *(void *)(v8 + 32) = v14;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v8 + 56) = v9;
  void *v9 = v8;
  v9[1] = sub_24E4FBA5C;
  return v11(v8 + 40, v8 + 16);
}

uint64_t sub_24E4F0640(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 48) = a7;
  *(unsigned char *)(v8 + 16) = a8;
  *(void *)(v8 + 24) = v13;
  *(void *)(v8 + 32) = v14;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v8 + 56) = v9;
  void *v9 = v8;
  v9[1] = sub_24E4F0750;
  return v11(v8 + 40, v8 + 16);
}

uint64_t sub_24E4F0750()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  long long v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E4F0844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(void *)(v7 + 32) = a6;
  *(void *)(v7 + 40) = v6;
  *(unsigned char *)(v7 + 48) = a5;
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24E4F086C, v6, 0);
}

uint64_t sub_24E4F086C()
{
  sub_24E4F71AC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 48), *(void **)(v0 + 32));
  long long v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4F08D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2698EE4F0 + dword_2698EE4F0);
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v9;
  void *v9 = v5;
  v9[1] = sub_24E4FBA64;
  return v11(a3, a4, a5);
}

uint64_t sub_24E4F0998(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_24E4FBA64;
  return sub_24E4EC5BC(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24E4F0A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  return MEMORY[0x270FA2498](sub_24E4F0AA8, v7, 0);
}

uint64_t sub_24E4F0AA8()
{
  sub_24E4EF790(*(void (**)(char *, uint64_t))(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned __int8 **)(v0 + 56), *(void *)(v0 + 64));
  long long v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4F0B14(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t))((char *)&dword_2698EE4A0
                                                                                       + dword_2698EE4A0);
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  void *v14 = v7;
  v14[1] = sub_24E4FBA64;
  return v16(a1, a2, a3, a4, a6, a7);
}

uint64_t sub_24E4F0C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&dword_2698EE498 + dword_2698EE498);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24E4FBA64;
  return v7(a3);
}

uint64_t sub_24E4F0CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&dword_2698EE490 + dword_2698EE490);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24E4FBA64;
  return v7(a3);
}

uint64_t sub_24E4F0D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 168);
  *(void *)(v2 + 168) = a1;
  *(void *)(v2 + 176) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4F0DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 184);
  *(void *)(v2 + 184) = a1;
  *(void *)(v2 + 192) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4F0DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 200);
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4F0E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 216);
  *(void *)(v2 + 216) = a1;
  *(void *)(v2 + 224) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E4F0E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 232);
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t InternetMessaging.setReplyCallback(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 248);
  *(void *)(v2 + 248) = a1;
  *(void *)(v2 + 256) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t InternetMessaging.description.getter()
{
  uint64_t v0 = type metadata accessor for InternetMessaging();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E52D540();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  MEMORY[0x25333D5E0](v0, WitnessTable);
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  swift_bridgeObjectRetain();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  return 60;
}

uint64_t sub_24E4F1074()
{
  return InternetMessaging.description.getter();
}

uint64_t sub_24E4F1098()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_26B1C1A30);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1C1A30);
  return sub_24E52CEE0();
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

void *sub_24E4F1164(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1A08);
      long long v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 160);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[20 * v8 + 4]) {
          memmove(v12, a4 + 4, 160 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      long long v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24E4F66E8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4F1288(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE520);
  uint64_t v10 = *(void *)(type metadata accessor for CorrelationIdentifier() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24E52D440();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for CorrelationIdentifier() - 8);
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
    sub_24E4F93A4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_24E4F14F0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24E4F94FC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24E4F1618(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE478);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24E4F67E0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E4F1740(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E4F1814(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24E4E0D08((uint64_t)v12, *a3);
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
      sub_24E4E0D08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24E4F1814(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24E52D260();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E4F19D0(a5, a6);
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
  uint64_t v8 = sub_24E52D3B0();
  if (!v8)
  {
    sub_24E52D440();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24E52D4A0();
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

uint64_t sub_24E4F19D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E4F1A68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E4F1C48(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E4F1C48(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E4F1A68(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24E4F1BE0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24E52D390();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24E52D440();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24E52D030();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24E52D4A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24E52D440();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E4F1BE0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE5E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E4F1C48(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE5E8);
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
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F1D98(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E4F1E18(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24E4F1DB8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E4F1F88(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24E4F1DD8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E4F20F4(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24E4F1DF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E4F2298(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24E4F1E18(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C19D8);
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
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F1F88(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE5E0);
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
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F20F4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1A10);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 160);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 160 * v8) {
      memmove(v10 + 4, a4 + 4, 160 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 160 * v8 || v12 >= v13 + 160 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C19F0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F2298(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE468);
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
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F2404(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24E52D620();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  uint64_t v8 = sub_24E52D660();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24E52D5A0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_24E52D5A0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24E4F4234(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24E4F25B4(unsigned char *a1, unsigned __int8 *a2)
{
  uint64_t v4 = *v2;
  int v5 = *a2;
  sub_24E52D620();
  sub_24E52D630();
  uint64_t v6 = sub_24E52D660();
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    uint64_t v9 = ~v7;
    while (*(unsigned __int8 *)(*(void *)(v4 + 48) + v8) != v5)
    {
      unint64_t v8 = (v8 + 1) & v9;
      if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_5;
      }
    }
    uint64_t result = 0;
    LOBYTE(v5) = *(unsigned char *)(*(void *)(*v2 + 48) + v8);
  }
  else
  {
LABEL_5:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v12 = v5;
    uint64_t v13 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_24E4F43D0((uint64_t)&v12, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *a1 = v5;
  return result;
}

uint64_t sub_24E4F26CC(uint64_t a1, uint64_t a2)
{
  uint64_t v53 = a1;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE510);
  MEMORY[0x270FA5388](v65);
  int v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v56 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v51 - v10;
  uint64_t v12 = type metadata accessor for CorrelationIdentifier();
  uint64_t v62 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v64 = (uint64_t)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v60 = (uint64_t *)((char *)&v51 - v16);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  BOOL v19 = (char *)&v51 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v51 = (uint64_t)&v51 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v51 - v22;
  unint64_t v52 = v2;
  uint64_t v24 = *v2;
  sub_24E52D620();
  uint64_t v66 = a2;
  sub_24E4F963C(a2, (uint64_t)v23, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v59 = v6;
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v23, v6);
    sub_24E52D630();
    sub_24E4F95F4((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    swift_bridgeObjectRetain();
    sub_24E52CFB0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  else
  {
    sub_24E52D630();
    swift_bridgeObjectRetain();
    sub_24E52D010();
    swift_bridgeObjectRelease();
  }
  uint64_t v26 = sub_24E52D660();
  uint64_t v27 = -1 << *(unsigned char *)(v24 + 32);
  unint64_t v28 = v26 & ~v27;
  uint64_t v63 = v24 + 56;
  if (((*(void *)(v24 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v46 = v52;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v48 = v66;
    uint64_t v49 = v51;
    sub_24E4F963C(v66, v51, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t v67 = *v46;
    *uint64_t v46 = 0x8000000000000000;
    sub_24E4F451C(v49, v28, isUniquelyReferenced_nonNull_native);
    *uint64_t v46 = v67;
    swift_bridgeObjectRelease();
    sub_24E4F9704(v48, v53, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    return 1;
  }
  uint64_t v61 = ~v27;
  uint64_t v62 = *(void *)(v62 + 72);
  uint64_t v58 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  unint64_t v54 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  unint64_t v55 = v5;
  while (1)
  {
    unint64_t v29 = v62 * v28;
    sub_24E4F963C(*(void *)(v24 + 48) + v62 * v28, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    unint64_t v30 = &v5[*(int *)(v65 + 48)];
    sub_24E4F963C((uint64_t)v19, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    sub_24E4F963C(v66, (uint64_t)v30, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() != 1) {
      break;
    }
    sub_24E4F963C((uint64_t)v5, v64, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v31 = *v54;
      unint64_t v57 = v29;
      uint64_t v32 = v64;
      unint64_t v33 = v56;
      uint64_t v34 = v59;
      v31(v56, v30, v59);
      char v35 = sub_24E52CEA0();
      unint64_t v36 = *v58;
      os_log_type_t v37 = v33;
      int v5 = v55;
      (*v58)((uint64_t)v37, v34);
      uint64_t v38 = v32;
      unint64_t v29 = v57;
      v36(v38, v34);
      if (v35) {
        goto LABEL_23;
      }
LABEL_19:
      sub_24E4F96A4((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
      goto LABEL_8;
    }
    (*v58)(v64, v59);
LABEL_7:
    sub_24E4FB96C((uint64_t)v5, &qword_2698EE510);
LABEL_8:
    sub_24E4F96A4((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    unint64_t v28 = (v28 + 1) & v61;
    if (((*(void *)(v63 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
      goto LABEL_21;
    }
  }
  uint64_t v39 = v60;
  sub_24E4F963C((uint64_t)v5, (uint64_t)v60, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v42 = *(void *)v30;
  uint64_t v43 = *((void *)v30 + 1);
  if (v41 != v42 || v40 != v43)
  {
    char v45 = sub_24E52D5A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v45) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRelease_n();
LABEL_23:
  sub_24E4F96A4((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  sub_24E4F96A4((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  swift_bridgeObjectRelease();
  sub_24E4F96A4(v66, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  sub_24E4F963C(*(void *)(*v52 + 48) + v29, v53, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  return 0;
}

uint64_t sub_24E4F2E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *v4;
  sub_24E52D620();
  sub_24E52D630();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  uint64_t v10 = sub_24E52D660();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v13 = ~v11;
    uint64_t v14 = *(void *)(v9 + 48);
    while (1)
    {
      uint64_t v15 = (unsigned __int8 *)(v14 + 24 * v12);
      if (*v15 == a2)
      {
        BOOL v16 = *((void *)v15 + 1) == a3 && *((void *)v15 + 2) == a4;
        if (v16 || (sub_24E52D5A0() & 1) != 0) {
          break;
        }
      }
      unint64_t v12 = (v12 + 1) & v13;
      if (((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(*v4 + 48) + 24 * v12;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v18 = *(void *)(v17 + 16);
    *(unsigned char *)a1 = *(unsigned char *)v17;
    *(void *)(a1 + 8) = v19;
    *(void *)(a1 + 16) = v18;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_24E4F4BBC(a2, a3, a4, v12, isUniquelyReferenced_nonNull_native);
    uint64_t *v4 = v22;
    swift_bridgeObjectRelease();
    *(unsigned char *)a1 = a2;
    uint64_t result = 1;
    *(void *)(a1 + 8) = a3;
    *(void *)(a1 + 16) = a4;
  }
  return result;
}

uint64_t sub_24E4F2FC8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24E52D620();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_24E52D660();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24E52D5A0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_24E52D5A0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24E4F4D64(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24E4F3188()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE5D8);
  uint64_t v3 = sub_24E52D360();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                long long v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
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
      sub_24E52D620();
      sub_24E52D010();
      uint64_t result = sub_24E52D660();
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
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *long long v1 = v4;
  return result;
}

uint64_t sub_24E4F3468()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE488);
  uint64_t result = sub_24E52D360();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                long long v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
      sub_24E52D620();
      sub_24E52D630();
      uint64_t result = sub_24E52D660();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *long long v1 = v4;
  return result;
}

uint64_t sub_24E4F3714()
{
  long long v1 = v0;
  uint64_t v2 = type metadata accessor for CorrelationIdentifier();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  int64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE518);
  uint64_t v7 = sub_24E52D360();
  if (*(void *)(v6 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
    unint64_t v9 = (void *)(v6 + 56);
    uint64_t v10 = -1;
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    unint64_t v11 = v10 & *(void *)(v6 + 56);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v14 << 6);
      }
      else
      {
        int64_t v17 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        if (v17 >= v12) {
          goto LABEL_22;
        }
        unint64_t v18 = v9[v17];
        ++v14;
        if (!v18)
        {
          int64_t v14 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_22;
          }
          unint64_t v18 = v9[v14];
          if (!v18)
          {
            int64_t v14 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_22;
            }
            unint64_t v18 = v9[v14];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_22:
                swift_release();
                uint64_t v20 = 1 << *(unsigned char *)(v6 + 32);
                if (v20 > 63) {
                  bzero((void *)(v6 + 56), ((unint64_t)(v20 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v9 = -1 << v20;
                }
                *(void *)(v6 + 16) = 0;
                break;
              }
              unint64_t v18 = v9[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v14 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_28;
                  }
                  if (v14 >= v12) {
                    goto LABEL_22;
                  }
                  unint64_t v18 = v9[v14];
                  ++v19;
                  if (v18) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v14 = v19;
            }
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
      }
      sub_24E4F9704(*(void *)(v6 + 48) + *(void *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
      uint64_t result = sub_24E4F3F90((uint64_t)v5, v7);
    }
  }
  uint64_t result = swift_release();
  *long long v1 = v7;
  return result;
}

uint64_t sub_24E4F3984()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE500);
  uint64_t v3 = sub_24E52D360();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v32 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v31 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = v32[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v16 = v32[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v16 = v32[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v31)
              {
LABEL_33:
                swift_release();
                long long v1 = v0;
                uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
                if (v30 > 63) {
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v30;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v32[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v32[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      uint64_t v19 = *(void *)(v2 + 48) + 24 * v14;
      char v20 = *(unsigned char *)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      uint64_t v22 = *(void *)(v19 + 16);
      sub_24E52D620();
      sub_24E52D630();
      sub_24E52D010();
      uint64_t result = sub_24E52D660();
      uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v8 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = *(void *)(v4 + 48) + 24 * v11;
      *(unsigned char *)uint64_t v12 = v20;
      *(void *)(v12 + 8) = v21;
      *(void *)(v12 + 16) = v22;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  *long long v1 = v4;
  return result;
}

uint64_t sub_24E4F3CA0()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE460);
  uint64_t v3 = sub_24E52D360();
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
                long long v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
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
      sub_24E52D620();
      swift_bridgeObjectRetain();
      sub_24E52D010();
      swift_bridgeObjectRelease();
      uint64_t result = sub_24E52D660();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *long long v1 = v4;
  return result;
}

uint64_t sub_24E4F3F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CorrelationIdentifier();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E52D620();
  sub_24E4F963C(a1, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
    sub_24E52D630();
    sub_24E4F95F4((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    sub_24E52CFB0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_24E52D630();
    sub_24E52D010();
    swift_bridgeObjectRelease();
  }
  sub_24E52D660();
  unint64_t v12 = sub_24E52D2A0();
  *(void *)(a2 + 56 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
  uint64_t result = sub_24E4F9704(a1, *(void *)(a2 + 48) + *(void *)(v9 + 72) * v12, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_24E4F4234(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24E4F3188();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24E4F4F10();
      goto LABEL_22;
    }
    sub_24E4F5830();
  }
  uint64_t v11 = *v4;
  sub_24E52D620();
  sub_24E52D010();
  uint64_t result = sub_24E52D660();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24E52D5A0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24E52D5C0();
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
          uint64_t result = sub_24E52D5A0();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
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

uint64_t sub_24E4F43D0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = (unsigned char *)result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24E4F3468();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_24E4F50C4();
      goto LABEL_12;
    }
    sub_24E4F5AE0();
  }
  uint64_t v8 = *v3;
  int v9 = *v5;
  sub_24E52D620();
  sub_24E52D630();
  uint64_t result = sub_24E52D660();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    while (*(unsigned __int8 *)(*(void *)(v8 + 48) + a2) != v9)
    {
      a2 = (a2 + 1) & v11;
      if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_12;
      }
    }
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v12 + 48) + a2) = *v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (!v14)
  {
    *(void *)(v12 + 16) = v15;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24E52D5C0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F451C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v64 = a1;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE510);
  MEMORY[0x270FA5388](v63);
  uint64_t v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_24E52CEC0();
  uint64_t v9 = *(void *)(v59 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v59);
  unint64_t v57 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v62 = (char *)&v53 - v12;
  uint64_t v13 = type metadata accessor for CorrelationIdentifier();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v58 = (uint64_t *)((char *)&v53 - v19);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v53 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v53 - v23;
  unint64_t v25 = *(void *)(*v4 + 16);
  unint64_t v26 = *(void *)(*v4 + 24);
  uint64_t v53 = v14;
  unint64_t v54 = v4;
  if (v26 <= v25 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_24E4F3714();
    }
    else
    {
      if (v26 > v25)
      {
        sub_24E4F5258();
        goto LABEL_28;
      }
      sub_24E4F5D5C();
    }
    uint64_t v56 = *v4;
    sub_24E52D620();
    sub_24E4F963C(v64, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      BOOL v27 = v62;
      uint64_t v28 = v24;
      uint64_t v29 = v59;
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v62, v28, v59);
      sub_24E52D630();
      sub_24E4F95F4((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
      sub_24E52CFB0();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v27, v29);
    }
    else
    {
      sub_24E52D630();
      sub_24E52D010();
      swift_bridgeObjectRelease();
    }
    uint64_t v30 = sub_24E52D660();
    uint64_t v31 = v56;
    uint64_t v32 = -1 << *(unsigned char *)(v56 + 32);
    a2 = v30 & ~v32;
    uint64_t v62 = (char *)(v56 + 56);
    if ((*(void *)(v56 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v61 = ~v32;
      uint64_t v60 = *(void *)(v14 + 72);
      unint64_t v33 = (void (**)(char *, uint64_t))(v9 + 8);
      unint64_t v55 = (void (**)(char *, char *, uint64_t))(v9 + 32);
      do
      {
        sub_24E4F963C(*(void *)(v31 + 48) + v60 * a2, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
        uint64_t v34 = &v8[*(int *)(v63 + 48)];
        sub_24E4F963C((uint64_t)v22, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
        sub_24E4F963C(v64, (uint64_t)v34, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_24E4F963C((uint64_t)v8, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            char v35 = v17;
            unint64_t v36 = v57;
            uint64_t v37 = v59;
            (*v55)(v57, v34, v59);
            char v38 = sub_24E52CEA0();
            uint64_t v39 = *v33;
            uint64_t v40 = v36;
            uint64_t v17 = v35;
            uint64_t v31 = v56;
            (*v33)(v40, v37);
            v39(v17, v37);
            if (v38) {
              goto LABEL_32;
            }
LABEL_26:
            sub_24E4F96A4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
            goto LABEL_15;
          }
          (*v33)(v17, v59);
        }
        else
        {
          uint64_t v41 = v58;
          sub_24E4F963C((uint64_t)v8, (uint64_t)v58, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
          uint64_t v43 = *v41;
          uint64_t v42 = v41[1];
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            uint64_t v44 = *(void *)v34;
            uint64_t v45 = *((void *)v34 + 1);
            if (v43 == v44 && v42 == v45) {
              goto LABEL_31;
            }
            char v47 = sub_24E52D5A0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v47) {
              goto LABEL_32;
            }
            goto LABEL_26;
          }
          swift_bridgeObjectRelease();
        }
        sub_24E4FB96C((uint64_t)v8, &qword_2698EE510);
LABEL_15:
        sub_24E4F96A4((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
        a2 = (a2 + 1) & v61;
      }
      while (((*(void *)&v62[(a2 >> 3) & 0xFFFFFFFFFFFFFF8] >> a2) & 1) != 0);
    }
  }
LABEL_28:
  uint64_t v48 = *v54;
  *(void *)(*v54 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24E4F9704(v64, *(void *)(v48 + 48) + *(void *)(v53 + 72) * a2, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  uint64_t v50 = *(void *)(v48 + 16);
  BOOL v51 = __OFADD__(v50, 1);
  uint64_t v52 = v50 + 1;
  if (v51)
  {
    __break(1u);
LABEL_31:
    swift_bridgeObjectRelease_n();
LABEL_32:
    sub_24E4F96A4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    sub_24E4F96A4((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t result = sub_24E52D5C0();
    __break(1u);
  }
  else
  {
    *(void *)(v48 + 16) = v52;
  }
  return result;
}

uint64_t sub_24E4F4BBC(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  unint64_t v6 = v5;
  int v10 = result;
  unint64_t v11 = *(void *)(*v5 + 16);
  unint64_t v12 = *(void *)(*v5 + 24);
  if (v12 > v11 && (a5 & 1) != 0) {
    goto LABEL_18;
  }
  if (a5)
  {
    sub_24E4F3984();
  }
  else
  {
    if (v12 > v11)
    {
      uint64_t result = (uint64_t)sub_24E4F54BC();
      goto LABEL_18;
    }
    sub_24E4F5F98();
  }
  uint64_t v13 = *v5;
  sub_24E52D620();
  sub_24E52D630();
  sub_24E52D010();
  uint64_t result = sub_24E52D660();
  uint64_t v14 = -1 << *(unsigned char *)(v13 + 32);
  a4 = result & ~v14;
  uint64_t v15 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4))
  {
    uint64_t v16 = ~v14;
    uint64_t v17 = *(void *)(v13 + 48);
    while (1)
    {
      uint64_t v18 = (unsigned __int8 *)(v17 + 24 * a4);
      if (*v18 == v10)
      {
        if (*((void *)v18 + 1) == a2 && *((void *)v18 + 2) == a3) {
          break;
        }
        uint64_t result = sub_24E52D5A0();
        if (result) {
          break;
        }
      }
      a4 = (a4 + 1) & v16;
      if (((*(void *)(v15 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4) & 1) == 0) {
        goto LABEL_18;
      }
    }
    uint64_t result = sub_24E52D5C0();
    __break(1u);
  }
LABEL_18:
  uint64_t v20 = *v6;
  *(void *)(*v6 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  uint64_t v21 = *(void *)(v20 + 48) + 24 * a4;
  *(unsigned char *)uint64_t v21 = v10;
  *(void *)(v21 + 8) = a2;
  *(void *)(v21 + 16) = a3;
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

uint64_t sub_24E4F4D64(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24E4F3CA0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24E4F567C();
      goto LABEL_22;
    }
    sub_24E4F627C();
  }
  uint64_t v11 = *v4;
  sub_24E52D620();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24E52D660();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24E52D5A0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24E52D5C0();
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
          uint64_t result = sub_24E52D5A0();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
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

void *sub_24E4F4F10()
{
  long long v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE5D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E52D350();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *long long v1 = v4;
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
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

void *sub_24E4F50C4()
{
  long long v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE488);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E52D350();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *long long v1 = v4;
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24E4F5258()
{
  long long v1 = v0;
  uint64_t v2 = type metadata accessor for CorrelationIdentifier();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE518);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24E52D350();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    *long long v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_24E4F963C(*(void *)(v6 + 48) + v19, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t result = (void *)sub_24E4F9704((uint64_t)v5, *(void *)(v8 + 48) + v19, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16) {
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24E4F54BC()
{
  long long v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE500);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E52D350();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *long long v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22)
      {
        int64_t v9 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v9);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    *(unsigned char *)uint64_t v20 = *(unsigned char *)v17;
    *(void *)(v20 + 8) = v19;
    *(void *)(v20 + 16) = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24E4F567C()
{
  long long v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE460);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E52D350();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *long long v1 = v4;
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
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

uint64_t sub_24E4F5830()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE5D8);
  uint64_t v3 = sub_24E52D360();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *long long v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24E52D620();
    swift_bridgeObjectRetain();
    sub_24E52D010();
    uint64_t result = sub_24E52D660();
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
    long long v1 = v0;
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

uint64_t sub_24E4F5AE0()
{
  long long v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE488);
  uint64_t result = sub_24E52D360();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *long long v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
    sub_24E52D620();
    sub_24E52D630();
    uint64_t result = sub_24E52D660();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    long long v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E4F5D5C()
{
  long long v1 = v0;
  uint64_t v2 = type metadata accessor for CorrelationIdentifier();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  int64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE518);
  uint64_t v7 = sub_24E52D360();
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_24:
    *long long v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v9 = v6 + 56;
  uint64_t v10 = -1;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  unint64_t v11 = v10 & *(void *)(v6 + 56);
  int64_t v12 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v14 << 6);
      goto LABEL_6;
    }
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v12) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_22;
      }
      unint64_t v18 = *(void *)(v9 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_22;
        }
        unint64_t v18 = *(void *)(v9 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_6:
    sub_24E4F963C(*(void *)(v6 + 48) + *(void *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t result = sub_24E4F3F90((uint64_t)v5, v7);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_22:
    uint64_t result = swift_release_n();
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18)
  {
    int64_t v14 = v19;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v12) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_21;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24E4F5F98()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE500);
  uint64_t v2 = sub_24E52D360();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v28 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v29 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v9;
    if (!v15)
    {
      int64_t v9 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v9);
      if (!v15)
      {
        int64_t v9 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v9);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v9 << 6);
LABEL_24:
    uint64_t v17 = *(void *)(v1 + 48) + 24 * v13;
    char v18 = *(unsigned char *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    sub_24E52D620();
    sub_24E52D630();
    swift_bridgeObjectRetain();
    sub_24E52D010();
    uint64_t result = sub_24E52D660();
    uint64_t v21 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v7 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    uint64_t v11 = *(void *)(v3 + 48) + 24 * v10;
    *(unsigned char *)uint64_t v11 = v18;
    *(void *)(v11 + 8) = v19;
    *(void *)(v11 + 16) = v20;
    ++*(void *)(v3 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v9 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v9 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v9);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24E4F627C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE460);
  uint64_t v3 = sub_24E52D360();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24E52D620();
    swift_bridgeObjectRetain_n();
    sub_24E52D010();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24E52D660();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
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

uint64_t type metadata accessor for InternetMessaging()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E4F6554(uint64_t a1, unint64_t *a2)
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

double sub_24E4F6590(_OWORD *a1)
{
  double result = 0.0;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_24E4F65AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C19F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E4F6614(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E4F66C0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_24E4F66D8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24E4F66E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 160 * a1 + 32;
    unint64_t v6 = a3 + 160 * v4;
    if (v5 >= v6 || v5 + 160 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F67E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE470);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F68F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24E52D1A0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24E4F2404(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24E4F6988(uint64_t a1, unint64_t a2)
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

uint64_t sub_24E4F69E0(uint64_t a1)
{
  return sub_24E4E43C4(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_24E4F69F0(uint64_t a1)
{
  return sub_24E4E6050(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_24E4F6A00(uint64_t a1)
{
  return sub_24E4E8150(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_24E4F6A0C(uint64_t a1)
{
  return sub_24E4E9AB0(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24E4F6A1C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for InternetMessaging(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InternetMessaging);
}

uint64_t dispatch thunk of InternetMessaging.set(didDeliverCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of InternetMessaging.set(messageReceivedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of InternetMessaging.set(dictionaryReceivedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of InternetMessaging.set(accountChangedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of InternetMessaging.set(devicesChangedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of InternetMessaging.__allocating_init(serviceName:crossAccount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 464) + **(int **)(v3 + 464));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24E4FBA60;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of InternetMessaging.start()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of InternetMessaging.stop()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of InternetMessaging.myAccountScopedDestination.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of InternetMessaging.device(fromID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of InternetMessaging.connectedDevice.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of InternetMessaging.devices.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t sub_24E4F6DB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24E4F7158();
  uint64_t result = sub_24E52D1A0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned __int8 v5 = *v4++;
      unsigned __int8 v6 = v5;
      sub_24E4F25B4(&v7, &v6);
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24E4F6E2C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CorrelationIdentifier();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unsigned __int8 v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_24E4F95F4(&qword_2698EE508, (void (*)(uint64_t))type metadata accessor for CorrelationIdentifier);
  uint64_t result = sub_24E52D1A0();
  uint64_t v14 = result;
  if (v9)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      sub_24E4F963C(v11, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
      sub_24E4F26CC((uint64_t)v8, (uint64_t)v6);
      sub_24E4F96A4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v14;
  }
  return result;
}

uint64_t sub_24E4F6FB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24E4F9350();
  uint64_t result = sub_24E52D1A0();
  uint64_t v9 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 48);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      uint64_t v7 = *((unsigned __int8 *)v4 - 16);
      swift_bridgeObjectRetain();
      sub_24E4F2E00((uint64_t)&v8, v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 3;
      --v2;
    }
    while (v2);
    return v9;
  }
  return result;
}

uint64_t sub_24E4F7058(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24E4F70F0();
  uint64_t result = sub_24E52D1A0();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24E4F2FC8(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t sub_24E4F70F0()
{
  unint64_t result = qword_26B1C19F8;
  if (!qword_26B1C19F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C19F8);
  }
  return result;
}

_OWORD *sub_24E4F7148(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_24E4F7158()
{
  unint64_t result = qword_2698EE480;
  if (!qword_2698EE480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE480);
  }
  return result;
}

void sub_24E4F71AC(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v8 = sub_24E52CEC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v27[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (*(void *)(*(void *)(v4 + 152) + 16))
  {
    swift_bridgeObjectRetain();
    sub_24E4FF360(a2);
    if (v12)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      if (a3)
      {
        sub_24E52CCD0();
      }
      else
      {
        if (a4)
        {
          uint64_t v22 = a4;
        }
        else
        {
          uint64_t v23 = sub_24E52CCB0();
          sub_24E4F95F4(&qword_2698EE3B8, MEMORY[0x263F3C9B0]);
          uint64_t v22 = (void *)swift_allocError();
          *unint64_t v24 = 0xD00000000000001CLL;
          v24[1] = 0x800000024E52F540;
          (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v24, *MEMORY[0x263F3C9A8], v23);
        }
        v27[0] = (uint64_t)v22;
        id v25 = a4;
        sub_24E52CCC0();
      }
      swift_beginAccess();
      sub_24E515CDC(a2);
      swift_endAccess();
      swift_release();
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26B1C1930 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24E52CEF0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B1C1918);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  uint64_t v14 = sub_24E52CED0();
  os_log_type_t v15 = sub_24E52D1E0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v27[0] = v17;
    *(_DWORD *)uint64_t v16 = 136446466;
    uint64_t v18 = sub_24E4E14F4();
    uint64_t v28 = sub_24E4F1740(v18, v19, v27);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    sub_24E4F95F4(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v20 = sub_24E52D560();
    uint64_t v28 = sub_24E4F1740(v20, v21, v27);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_24E4DA000, v14, v15, "%{public}s: Got didSend callback for unsent message! %{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v17, -1, -1);
    MEMORY[0x25333DD20](v16, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_24E4F762C(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 56) = a2;
  *(void *)(v4 + 64) = v3;
  uint64_t v5 = a1[1];
  *(void *)(v4 + 72) = *a1;
  *(void *)(v4 + 80) = v5;
  *(unsigned char *)(v4 + 128) = *(unsigned char *)a3;
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)(v4 + 88) = *(void *)(a3 + 8);
  *(void *)(v4 + 96) = v6;
  return MEMORY[0x270FA2498](sub_24E4F7664, v3, 0);
}

uint64_t sub_24E4F7664()
{
  uint64_t v1 = *(void *)(v0 + 64);
  long long v2 = *(int **)(v1 + 168);
  *(void *)(v0 + 104) = v2;
  if (v2)
  {
    long long v3 = *(_OWORD *)(v0 + 88);
    char v4 = *(unsigned char *)(v0 + 128);
    uint64_t v6 = *(void *)(v0 + 72);
    uint64_t v5 = *(void *)(v0 + 80);
    *(void *)(v0 + 112) = *(void *)(v1 + 176);
    *(void *)(v0 + 40) = v6;
    *(unsigned char *)(v0 + 16) = v4;
    *(void *)(v0 + 48) = v5;
    *(_OWORD *)(v0 + 24) = v3;
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_24E4F77C0;
    uint64_t v8 = *(void *)(v0 + 56);
    return v11(v0 + 40, v8, v0 + 16);
  }
  else
  {
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_24E4F77C0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 64);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4F78D0, v1, 0);
}

uint64_t sub_24E4F78D0()
{
  sub_24E4F66D8(*(void *)(v0 + 104));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4F7930(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 96) = a6;
  *(void *)(v7 + 104) = v6;
  *(void *)(v7 + 80) = a2;
  *(void *)(v7 + 88) = a4;
  *(void *)(v7 + 72) = a1;
  *(void *)(v7 + 112) = *v6;
  uint64_t v10 = *(void *)(type metadata accessor for MessageContext() - 8);
  *(void *)(v7 + 120) = v10;
  *(void *)(v7 + 128) = *(void *)(v10 + 64);
  *(void *)(v7 + 136) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = *a3;
  uint64_t v13 = a3[1];
  *(void *)(v7 + 144) = v11;
  *(void *)(v7 + 152) = v12;
  *(unsigned char *)(v7 + 184) = *(unsigned char *)a5;
  uint64_t v14 = *(void *)(a5 + 8);
  uint64_t v15 = *(void *)(a5 + 16);
  *(void *)(v7 + 160) = v13;
  *(void *)(v7 + 168) = v14;
  *(void *)(v7 + 176) = v15;
  return MEMORY[0x270FA2498](sub_24E4F7A7C, v6, 0);
}

uint64_t sub_24E4F7A7C()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v1 + 112);
  unint64_t v2 = *(void *)(v1 + 120);
  BOOL v4 = v3 == *(void *)(v0 + 72) && v2 == *(void *)(v0 + 80);
  if (v4 || (sub_24E52D5A0() & 1) != 0)
  {
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24E52CEF0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1C1918);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_24E52CED0();
    os_log_type_t v7 = sub_24E52D200();
    BOOL v8 = os_log_type_enabled(v6, v7);
    unint64_t v9 = *(void *)(v0 + 176);
    if (v8)
    {
      uint64_t v38 = *(void *)(v0 + 168);
      unint64_t v10 = *(void *)(v0 + 80);
      uint64_t v35 = *(void *)(v0 + 72);
      uint64_t v11 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v44 = v40;
      *(_DWORD *)uint64_t v11 = 136315907;
      uint64_t v12 = sub_24E4E14F4();
      *(void *)(v0 + 40) = sub_24E4F1740(v12, v13, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 48) = sub_24E4F1740(v35, v10, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 22) = 2160;
      *(void *)(v0 + 56) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v11 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 64) = sub_24E4F1740(v38, v9, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v6, v7, "%s: Received raw dictionary on %{public}s from %{private,mask.hash}s", (uint8_t *)v11, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v40, -1, -1);
      MEMORY[0x25333DD20](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v14 = *(void *)(v0 + 104);
    uint64_t v15 = *(void *)(v14 + 200);
    if (v15)
    {
      uint64_t v16 = *(void *)(v0 + 176);
      char v39 = *(unsigned char *)(v0 + 184);
      uint64_t v17 = *(void *)(v0 + 144);
      uint64_t v36 = *(void *)(v0 + 152);
      uint64_t v37 = *(void *)(v0 + 160);
      uint64_t v41 = *(void *)(v0 + 168);
      uint64_t v18 = *(void *)(v0 + 136);
      uint64_t v19 = *(void *)(v0 + 120);
      uint64_t v20 = *(void *)(v0 + 88);
      uint64_t v21 = *(void *)(v0 + 96);
      uint64_t v22 = *(void *)(v14 + 208);
      uint64_t v23 = sub_24E52D160();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
      sub_24E4F963C(v21, v18, (uint64_t (*)(void))type metadata accessor for MessageContext);
      unint64_t v24 = (*(unsigned __int8 *)(v19 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = 0;
      *(void *)(v25 + 24) = 0;
      *(void *)(v25 + 32) = v15;
      *(void *)(v25 + 40) = v22;
      *(void *)(v25 + 48) = v36;
      *(void *)(v25 + 56) = v37;
      *(unsigned char *)(v25 + 64) = v39;
      *(void *)(v25 + 72) = v41;
      *(void *)(v25 + 80) = v16;
      *(void *)(v25 + 88) = v20;
      sub_24E4F9704(v18, v25 + v24, (uint64_t (*)(void))type metadata accessor for MessageContext);
      swift_bridgeObjectRetain();
      sub_24E4F8EAC(v15);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E51F518(v17, (uint64_t)&unk_2698EE4B0, v25);
      swift_release();
    }
  }
  else
  {
    if (qword_26B1C1930 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24E52CEF0();
    __swift_project_value_buffer(v26, (uint64_t)qword_26B1C1918);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    BOOL v27 = sub_24E52CED0();
    os_log_type_t v28 = sub_24E52D1E0();
    if (os_log_type_enabled(v27, v28))
    {
      unint64_t v29 = *(void *)(v0 + 80);
      uint64_t v42 = *(void *)(v0 + 72);
      uint64_t v30 = swift_slowAlloc();
      uint64_t type = swift_slowAlloc();
      uint64_t v44 = type;
      *(_DWORD *)uint64_t v30 = 136446722;
      uint64_t v31 = sub_24E4E14F4();
      *(void *)(v0 + 16) = sub_24E4F1740(v31, v32, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 24) = sub_24E4F1740(v3, v2, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v30 + 22) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 32) = sub_24E4F1740(v42, v29, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v27, v28, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v30, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](type, -1, -1);
      MEMORY[0x25333DD20](v30, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_24E4F8110(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24E4F8130, v1, 0);
}

uint64_t sub_24E4F8130()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(int **)(v1 + 216);
  v0[4] = v2;
  if (v2)
  {
    v0[5] = *(void *)(v1 + 224);
    os_log_type_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[6] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E4F8258;
    uint64_t v4 = v0[2];
    return v7(v4);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_24E4F8258()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4FBA68, v1, 0);
}

uint64_t sub_24E4F8368(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24E4F8388, v1, 0);
}

uint64_t sub_24E4F8388()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(int **)(v1 + 232);
  v0[4] = v2;
  if (v2)
  {
    v0[5] = *(void *)(v1 + 240);
    os_log_type_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[6] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E4F84B0;
    uint64_t v4 = v0[2];
    return v7(v4);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_24E4F84B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E4F85C0, v1, 0);
}

uint64_t sub_24E4F85C0()
{
  sub_24E4F66D8(*(void *)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4F8620()
{
  uint64_t v1 = type metadata accessor for MessageContext();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 96) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6);
  unint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  if (!v8) {
    v9(v0 + v3, v6);
  }
  v9(v5 + *(int *)(v1 + 20), v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v5 + *(int *)(v1 + 44);
  uint64_t v11 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24E4F8814()
{
  uint64_t v2 = *(void *)(type metadata accessor for MessageContext() - 8);
  uint64_t v3 = *(int **)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  char v6 = *(unsigned char *)(v0 + 64);
  long long v12 = *(_OWORD *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v9 = swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *(void *)uint64_t v9 = v1;
  *(void *)(v9 + 8) = sub_24E4FBA64;
  *(void *)(v9 + 40) = v4;
  *(unsigned char *)(v9 + 16) = v6;
  *(void *)(v9 + 48) = v5;
  *(_OWORD *)(v9 + 24) = v12;
  unint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v3 + *v3);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v9 + 56) = v10;
  *uint64_t v10 = v9;
  v10[1] = sub_24E4F0750;
  return v13(v9 + 40, v9 + 16, v7, v8);
}

uint64_t sub_24E4F89C4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 104) & ~v3;
  unint64_t v5 = (*(void *)(*(void *)v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for MessageContext();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v5 + v7 + 8) & ~v7;
  uint64_t v18 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  swift_bridgeObjectRelease();
  uint64_t v10 = v0 + v8;
  uint64_t v11 = sub_24E52CEC0();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v0 + v8, 1, v11);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  if (!v13) {
    v14(v0 + v8, v11);
  }
  v14(v10 + *(int *)(v6 + 20), v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = v10 + *(int *)(v6 + 44);
  uint64_t v16 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v8 + v18, v3 | v7 | 7);
}

uint64_t sub_24E4F8C80()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(type metadata accessor for MessageContext() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(int **)(v0 + 48);
  uint64_t v9 = *(void *)(v2 + 64);
  uint64_t v10 = *(void *)(v2 + 72);
  char v11 = *(unsigned char *)(v2 + 80);
  long long v18 = *(_OWORD *)(v2 + 88);
  uint64_t v12 = v2 + v4;
  uint64_t v13 = *(void *)(v2 + v5);
  uint64_t v14 = v2 + v7;
  uint64_t v15 = swift_task_alloc();
  *(void *)(v1 + 16) = v15;
  *(void *)uint64_t v15 = v1;
  *(void *)(v15 + 8) = sub_24E4FBA64;
  *(void *)(v15 + 40) = v9;
  *(unsigned char *)(v15 + 16) = v11;
  *(void *)(v15 + 48) = v10;
  *(_OWORD *)(v15 + 24) = v18;
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v15 + 56) = v16;
  *uint64_t v16 = v15;
  v16[1] = sub_24E4FBA5C;
  return v19(v15 + 40, v15 + 16, v12, v13, v14);
}

uint64_t sub_24E4F8EAC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24E4F8EBC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 104) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessageContext();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v18 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = v0 + v8;
  uint64_t v11 = sub_24E52CEC0();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v0 + v8, 1, v11);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  if (!v13) {
    v14(v0 + v8, v11);
  }
  v14(v10 + *(int *)(v6 + 20), v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = v10 + *(int *)(v6 + 44);
  uint64_t v16 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v8 + v18, v3 | v7 | 7);
}

uint64_t sub_24E4F9164()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for MessageContext() - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  long long v13 = *(_OWORD *)(v0 + 64);
  LOBYTE(v4) = *(unsigned char *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = v0 + (v6 & ~v5);
  uint64_t v10 = swift_task_alloc();
  long long v11 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v10;
  *(void *)uint64_t v10 = v1;
  *(void *)(v10 + 8) = sub_24E4FBA64;
  *(void *)(v10 + 104) = v0 + v3;
  *(void *)(v10 + 112) = v9;
  *(void *)(v10 + 88) = v7;
  *(void *)(v10 + 96) = v8;
  *(unsigned char *)(v10 + 136) = v4;
  *(_OWORD *)(v10 + 72) = v13;
  *(_OWORD *)(v10 + 56) = v11;
  return MEMORY[0x270FA2498](sub_24E4EF534, 0, 0);
}

uint64_t sub_24E4F92E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E4F9350()
{
  unint64_t result = qword_2698EE4F8;
  if (!qword_2698EE4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE4F8);
  }
  return result;
}

uint64_t sub_24E4F93A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for CorrelationIdentifier() - 8);
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
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F94FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24E52D4A0();
  __break(1u);
  return result;
}

uint64_t sub_24E4F95F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E4F963C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E4F96A4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E4F9704(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E4F976C()
{
  uint64_t v1 = type metadata accessor for MessagingOptions();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  uint64_t v9 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v0 + v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v9 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_24E4F9934()
{
  uint64_t v2 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_24E4FBA64;
  uint64_t v9 = (void *)swift_task_alloc();
  v8[2] = v9;
  void *v9 = v8;
  v9[1] = sub_24E4FBA64;
  return sub_24E4E9DB4(v4, v5, v6, v7);
}

uint64_t sub_24E4F9A98()
{
  uint64_t v1 = type metadata accessor for MessagingOptions();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v9 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v0 + v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v9 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_24E4F9C50(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_24E4FBA64;
  return sub_24E4EBF3C(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_24E4F9D7C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v15 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = sub_24E52CEC0();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v0 + v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v8 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v10)) {
    v12(v13, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v15 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E4F9FE4()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_24E4FA1A0;
  uint64_t v11 = (void *)swift_task_alloc();
  v10[2] = v11;
  *uint64_t v11 = v10;
  v11[1] = sub_24E4FBA64;
  return sub_24E4E850C(v7, v8, v9);
}

uint64_t sub_24E4FA1A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E4FA294()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v15 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_release();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = sub_24E52CEC0();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v0 + v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v8 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v10)) {
    v12(v13, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v15 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E4FA4EC(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 32);
  uint64_t v11 = v1 + v6;
  uint64_t v12 = v1 + v9;
  uint64_t v13 = *(void *)(v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v14;
  void *v14 = v3;
  v14[1] = sub_24E4FA1A0;
  return sub_24E4EB7C8(a1, v10, v11, v12, v13);
}

uint64_t sub_24E4FA674()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  unint64_t v5 = (*(void *)(*(void *)v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v14 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v8 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v8, v1);
  sub_24E4F6988(*(void *)(v8 + v2[12]), *(void *)(v8 + v2[12] + 8));
  swift_bridgeObjectRelease();
  uint64_t v15 = (v5 + v7 + 8) & ~v7;
  uint64_t v9 = sub_24E52CEC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v11(v0 + v15, v9);
  swift_bridgeObjectRelease();
  uint64_t v12 = v0 + v15 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v12, 1, v9)) {
    v11(v12, v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((((v14 + v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E4FA900()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v0 + v3;
  uint64_t v9 = *(void *)(v0 + v4);
  uint64_t v10 = v0 + v6;
  uint64_t v11 = *(void *)(v0 + v7);
  uint64_t v12 = *(void *)(v0 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v13;
  void *v13 = v1;
  v13[1] = sub_24E4FBA64;
  uint64_t v14 = (void *)swift_task_alloc();
  v13[2] = v14;
  void *v14 = v13;
  v14[1] = sub_24E4FBA64;
  return sub_24E4E6468(v8, v9, v10, v11, v12);
}

uint64_t sub_24E4FAAE8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24E52CDF0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v4 = (v20 + 40) & ~v20;
  unint64_t v5 = (((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v17 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v16 = *(void *)(*(void *)(v6 - 8) + 64);
  uint64_t v19 = type metadata accessor for Message();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v19 - 8) + 80);
  uint64_t v15 = *(void *)(*(void *)(v19 - 8) + 64);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = (v5 + v17 + 8) & ~v17;
  uint64_t v8 = sub_24E52CEC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v10(v0 + v18, v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v18 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v11, 1, v8)) {
    v10(v11, v8);
  }
  uint64_t v12 = (v18 + v16 + v7) & ~v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v12);
  uint64_t v13 = v0 + v12 + *(int *)(v19 + 40);
  sub_24E4F6988(*(void *)v13, *(void *)(v13 + 8));
  return MEMORY[0x270FA0238](v0, ((v15 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v20 | v17 | v7 | 7);
}

uint64_t sub_24E4FAE08(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24E52CDF0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v12 = (v9 + v10 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = *(void *)(v1 + 32);
  uint64_t v14 = v1 + v5;
  uint64_t v15 = *(void *)(v1 + v6);
  uint64_t v16 = *(void *)(v1 + v7);
  uint64_t v17 = v1 + v9;
  uint64_t v18 = v1 + v12;
  uint64_t v19 = *(void *)(v1 + ((*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v20;
  void *v20 = v2;
  v20[1] = sub_24E4FBA64;
  return sub_24E4EAF60(a1, v13, v14, v15, v16, v17, v18, v19);
}

uint64_t sub_24E4FB028()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v16 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = sub_24E52CEC0();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v0 + v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v8 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v10)) {
    v12(v13, v10);
  }
  unint64_t v14 = (v16 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E4F6988(*(void *)(v0 + v14), *(void *)(v0 + v14 + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((((v14 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E4FB2B4()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = v0 + v3;
  uint64_t v10 = v0 + v6;
  uint64_t v11 = *(void *)(v0 + v7);
  uint64_t v12 = *(void *)(v0 + v7 + 8);
  uint64_t v13 = *(void *)(v0 + v8);
  uint64_t v14 = *(void *)(v0 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v15;
  *uint64_t v15 = v1;
  v15[1] = sub_24E4FBA64;
  uint64_t v16 = (void *)swift_task_alloc();
  v15[2] = v16;
  *uint64_t v16 = v15;
  v16[1] = sub_24E4FBA64;
  return sub_24E4E47EC(v9, v10, v11, v12, v13, v14);
}

uint64_t sub_24E4FB4A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_24E4FB4F8()
{
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = type metadata accessor for MessagingOptions();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v14 = *(void *)(*(void *)(v2 - 8) + 64);
  uint64_t v16 = v1;
  uint64_t v15 = type metadata accessor for Message();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v15 - 8) + 80);
  uint64_t v13 = *(void *)(*(void *)(v15 - 8) + 64);
  swift_release();
  sub_24E4F6988(*((void *)v0 + 5), *((void *)v0 + 6));
  swift_bridgeObjectRelease();
  uint64_t v5 = &v0[(v3 + 64) & ~v3];
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(char *, uint64_t))(v7 + 8);
  v8(v5, v6);
  swift_bridgeObjectRelease();
  uint64_t v9 = &v5[*(int *)(v2 + 28)];
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6)) {
    v8(v9, v6);
  }
  uint64_t v10 = (((v3 + 64) & ~v3) + v14 + v4) & ~v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *))(*(void *)(v16 - 8) + 8))(&v0[v10]);
  uint64_t v11 = &v0[v10 + *(int *)(v15 + 40)];
  sub_24E4F6988(*(void *)v11, *((void *)v11 + 1));
  return MEMORY[0x270FA0238](v0, ((v13 + v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v4 | 7);
}

uint64_t sub_24E4FB774(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = v1[4];
  uint64_t v11 = v1[5];
  uint64_t v12 = v1[6];
  uint64_t v13 = v1[7];
  uint64_t v14 = (uint64_t)v1 + v6;
  uint64_t v15 = (uint64_t)v1 + v9;
  uint64_t v16 = *(void *)((char *)v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v17;
  *uint64_t v17 = v3;
  v17[1] = sub_24E4FBA64;
  return sub_24E4EA72C(a1, v10, v11, v12, v13, v14, v15, v16);
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

uint64_t sub_24E4FB96C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E4FB9C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24E4FBA6C()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_2698EE5F8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2698EE5F8);
  if (qword_2698EE320 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2698EEB20);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t CorrelationIdentifierMap.init(serviceName:destinations:disambiguate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[15] = a5;
  v6[16] = a6;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  return MEMORY[0x270FA2498](sub_24E4FBB5C, 0, 0);
}

{
  void *v6;

  v6[15] = a5;
  v6[16] = a6;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  return MEMORY[0x270FA2498](sub_24E4FD140, 0, 0);
}

id sub_24E4FBB5C()
{
  uint64_t Controller = type metadata accessor for QueryController();
  uint64_t v2 = (void *)swift_allocObject();
  v0[17] = v2;
  swift_defaultActor_initialize();
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v5 = v0[12];
    uint64_t v4 = v0[13];
    v2[14] = result;
    v2[15] = v5;
    v2[16] = v4;
    v0[5] = Controller;
    v0[6] = &protocol witness table for QueryController;
    v0[2] = v2;
    swift_retain();
    swift_retain();
    unint64_t v6 = (void *)swift_task_alloc();
    v0[18] = v6;
    *unint64_t v6 = v0;
    v6[1] = sub_24E4FBC94;
    uint64_t v7 = v0[15];
    uint64_t v8 = v0[16];
    uint64_t v9 = v0[14];
    return (id)sub_24E4FBE90((uint64_t)(v0 + 7), (uint64_t)(v0 + 2), v9, v7, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24E4FBC94()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4FBE24;
  }
  else {
    uint64_t v2 = sub_24E4FBDA8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4FBDA8()
{
  uint64_t v1 = *(_OWORD **)(v0 + 88);
  swift_release();
  swift_release();
  long long v2 = *(_OWORD *)(v0 + 72);
  *uint64_t v1 = *(_OWORD *)(v0 + 56);
  v1[1] = v2;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24E4FBE24()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E4FBE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[35] = a4;
  v5[36] = a5;
  v5[33] = a2;
  v5[34] = a3;
  v5[32] = a1;
  v5[37] = type metadata accessor for CorrelationIdentifier();
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E4FBF48, 0, 0);
}

uint64_t sub_24E4FBF48()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v1 + 16);
  *(void *)(v0 + 328) = v2;
  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + 264);
    *(void *)(v0 + 352) = 0;
    uint64_t v4 = MEMORY[0x263F8EE80];
    *(void *)(v0 + 336) = MEMORY[0x263F8EE80];
    *(void *)(v0 + 344) = v4;
    char v5 = *(unsigned char *)(v1 + 32);
    *(unsigned char *)(v0 + 408) = v5;
    uint64_t v6 = *(void *)(v1 + 40);
    *(void *)(v0 + 360) = v6;
    uint64_t v7 = *(void *)(v1 + 48);
    *(void *)(v0 + 368) = v7;
    uint64_t v8 = v3[3];
    uint64_t v9 = v3[4];
    swift_retain();
    __swift_project_boxed_opaque_existential_1(v3, v8);
    *(unsigned char *)(v0 + 16) = v5;
    *(void *)(v0 + 24) = v6;
    *(void *)(v0 + 32) = v7;
    uint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 8) + **(int **)(v9 + 8));
    swift_bridgeObjectRetain();
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_24E4FC168;
    return v18(v0 + 16, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v0 + 280);
    uint64_t v13 = *(void *)(v0 + 288);
    uint64_t v14 = *(void **)(v0 + 256);
    uint64_t v15 = *(void *)(v0 + 264);
    uint64_t v16 = MEMORY[0x263F8EE80];
    void *v14 = MEMORY[0x263F8EE80];
    v14[1] = v16;
    v14[2] = v12;
    v14[3] = v13;
    swift_bridgeObjectRetain_n();
    swift_retain();
    __swift_destroy_boxed_opaque_existential_0(v15);
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
}

uint64_t sub_24E4FC168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[48] = a1;
  v4[49] = a2;
  v4[50] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v5 = sub_24E4FD044;
  }
  else
  {
    char v5 = sub_24E4FC288;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24E4FC288()
{
  uint64_t v103 = v0;
  unint64_t v1 = *(void *)(v0 + 392);
  if (!v1)
  {
    if (qword_2698EE328 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_24E52CEF0();
    __swift_project_value_buffer(v16, (uint64_t)qword_2698EE5F8);
    swift_bridgeObjectRetain_n();
    uint64_t v17 = sub_24E52CED0();
    os_log_type_t v18 = sub_24E52D1E0();
    BOOL v19 = os_log_type_enabled(v17, v18);
    unint64_t v20 = *(void *)(v0 + 368);
    if (v19)
    {
      uint64_t v21 = *(void *)(v0 + 360);
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v102 = v23;
      *(_DWORD *)uint64_t v22 = 141558275;
      *(void *)(v0 + 168) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v22 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 160) = sub_24E4F1740(v21, v20, &v102);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v17, v18, "CorrelationIdentifierMap: No correlationIdentifier for %{private,mask.hash}s!", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v23, -1, -1);
      MEMORY[0x25333DD20](v22, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v52 = *(void *)(v0 + 360);
    uint64_t v51 = *(void *)(v0 + 368);
    uint64_t v53 = *(void *)(v0 + 336);
    uint64_t v99 = *(void *)(v0 + 344);
    uint64_t v55 = *(void *)(v0 + 312);
    uint64_t v54 = *(void *)(v0 + 320);
    *(void *)(v0 + 112) = 0;
    *(void *)(v0 + 120) = 0xE000000000000000;
    char v96 = *(unsigned char *)(v0 + 408);
    sub_24E52D380();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 128) = 0xD00000000000001FLL;
    *(void *)(v0 + 136) = 0x800000024E52F9B0;
    swift_bridgeObjectRetain();
    sub_24E52D020();
    swift_bridgeObjectRelease();
    sub_24E52D020();
    uint64_t v56 = sub_24E52CFD0();
    unint64_t v58 = v57;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 144) = v56;
    *(void *)(v0 + 152) = v58;
    sub_24E5014FC();
    sub_24E52CD10();
    sub_24E4F6988(v56, v58);
    swift_storeEnumTagMultiPayload();
    sub_24E4FF714(v54, v55);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v102 = v53;
    sub_24E5033E0(v55, v96, v52, v51, isUniquelyReferenced_nonNull_native);
    uint64_t v9 = v102;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E4FF714(v54, v55);
    char v60 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v102 = v99;
    sub_24E503254(v96, v52, v51, v55, v60);
    uint64_t v49 = v102;
    swift_bridgeObjectRelease();
    sub_24E4FF600(v55);
    uint64_t v50 = v54;
    goto LABEL_22;
  }
  uint64_t v3 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 312);
  char v5 = *(void **)(v0 + 320);
  char v7 = *(unsigned char *)(v0 + 408);
  *char v5 = *(void *)(v0 + 384);
  v5[1] = v1;
  swift_storeEnumTagMultiPayload();
  sub_24E4FF6B0((uint64_t)v5, v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v102 = v4;
  sub_24E5033E0(v6, v7, v3, v2, v8);
  uint64_t v9 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_2698EE328 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24E52CEF0();
  __swift_project_value_buffer(v10, (uint64_t)qword_2698EE5F8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_24E52CED0();
  os_log_type_t v12 = sub_24E52D1D0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v95 = *(void *)(v0 + 384);
    unint64_t v13 = *(void *)(v0 + 368);
    uint64_t v93 = *(void *)(v0 + 360);
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v102 = v15;
    *(_DWORD *)uint64_t v14 = 141558787;
    *(void *)(v0 + 224) = 1752392040;
    sub_24E52D250();
    *(_WORD *)(v14 + 12) = 2081;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 232) = sub_24E4F1740(v93, v13, &v102);
    sub_24E52D250();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 22) = 2160;
    *(void *)(v0 + 240) = 1752392040;
    sub_24E52D250();
    *(_WORD *)(v14 + 32) = 2081;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 248) = sub_24E4F1740(v95, v1, &v102);
    sub_24E52D250();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E4DA000, v11, v12, "CorrelationIdentifierMap: %{private,mask.hash}s -> %{private,mask.hash}s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v15, -1, -1);
    MEMORY[0x25333DD20](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v24 = *(void *)(v0 + 344);
  uint64_t v25 = *(void **)(v0 + 304);
  *uint64_t v25 = *(void *)(v0 + 384);
  v25[1] = v1;
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = *(void *)(v24 + 16);
  swift_bridgeObjectRetain();
  if (!v26 || (unint64_t v27 = sub_24E4FF3F8(*(void *)(v0 + 304)), (v28 & 1) == 0))
  {
    uint64_t v42 = *(void *)(v0 + 384);
    uint64_t v44 = *(void *)(v0 + 360);
    uint64_t v43 = *(void *)(v0 + 368);
    uint64_t v45 = *(void *)(v0 + 344);
    uint64_t v46 = *(void **)(v0 + 320);
    char v47 = *(unsigned char *)(v0 + 408);
    sub_24E4FF600(*(void *)(v0 + 304));
    *uint64_t v46 = v42;
    v46[1] = v1;
    swift_storeEnumTagMultiPayload();
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v102 = v45;
    sub_24E503254(v47, v44, v43, (uint64_t)v46, v48);
    uint64_t v49 = v102;
    swift_bridgeObjectRelease();
    uint64_t v50 = (uint64_t)v46;
LABEL_22:
    sub_24E4FF600(v50);
    goto LABEL_23;
  }
  uint64_t v98 = v9;
  int v29 = *(unsigned __int8 *)(v0 + 408);
  uint64_t v30 = *(void *)(v0 + 304);
  uint64_t v31 = (unsigned __int8 *)(*(void *)(*(void *)(v0 + 344) + 56) + 24 * v27);
  int v32 = *v31;
  uint64_t v33 = *((void *)v31 + 1);
  unint64_t v34 = *((void *)v31 + 2);
  swift_bridgeObjectRetain();
  sub_24E4FF600(v30);
  if (v32 == v29 && (v33 == *(void *)(v0 + 360) && v34 == *(void *)(v0 + 368) || (sub_24E52D5A0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_24E52CED0();
    os_log_type_t v36 = sub_24E52D200();
    BOOL v37 = os_log_type_enabled(v35, v36);
    unint64_t v38 = *(void *)(v0 + 368);
    if (v37)
    {
      uint64_t v39 = *(void *)(v0 + 360);
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v102 = v41;
      *(_DWORD *)uint64_t v40 = 141558275;
      *(void *)(v40 + 4) = 1752392040;
      *(_WORD *)(v40 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v40 + 14) = sub_24E4F1740(v39, v38, &v102);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v35, v36, "Duplicate destination: %{private,mask.hash}s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v41, -1, -1);
      MEMORY[0x25333DD20](v40, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v49 = *(void *)(v0 + 344);
    uint64_t v9 = v98;
  }
  else
  {
    uint64_t v76 = *(void *)(v0 + 360);
    uint64_t v77 = *(void *)(v0 + 368);
    char v78 = *(unsigned char *)(v0 + 408);
    unint64_t v79 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    *(unsigned char *)(v0 + 40) = v32;
    uint64_t v97 = v33;
    *(void *)(v0 + 48) = v33;
    *(void *)(v0 + 56) = v34;
    *(unsigned char *)(v0 + 64) = v78;
    *(void *)(v0 + 72) = v76;
    *(void *)(v0 + 80) = v77;
    swift_retain();
    v79(v0 + 40, v0 + 64);
    swift_release();
    char v80 = *(unsigned char *)(v0 + 88);
    uint64_t v81 = *(void *)(v0 + 96);
    unint64_t v82 = *(void *)(v0 + 104);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    os_log_t v83 = sub_24E52CED0();
    os_log_type_t v84 = sub_24E52D200();
    BOOL v85 = os_log_type_enabled(v83, v84);
    unint64_t v86 = *(void *)(v0 + 368);
    if (v85)
    {
      uint64_t v92 = *(void *)(v0 + 360);
      char v101 = v80;
      uint64_t v87 = swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      uint64_t v102 = v94;
      *(_DWORD *)uint64_t v87 = 141559299;
      *(void *)(v0 + 176) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v87 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 184) = sub_24E4F1740(v97, v34, &v102);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v87 + 22) = 2160;
      *(void *)(v0 + 192) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v87 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 200) = sub_24E4F1740(v92, v86, &v102);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v87 + 42) = 2160;
      *(void *)(v0 + 208) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v87 + 52) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 216) = sub_24E4F1740(v81, v82, &v102);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v83, v84, "CorrelationIdentifierMap: Disambiguating (%{private,mask.hash}s, %{private,mask.hash}s) to %{private,mask.hash}s", (uint8_t *)v87, 0x3Eu);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v94, -1, -1);
      uint64_t v88 = v87;
      char v80 = v101;
      MEMORY[0x25333DD20](v88, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v89 = *(void *)(v0 + 344);
    uint64_t v90 = *(void **)(v0 + 320);
    *uint64_t v90 = *(void *)(v0 + 384);
    v90[1] = v1;
    swift_storeEnumTagMultiPayload();
    char v91 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v102 = v89;
    sub_24E503254(v80, v81, v82, (uint64_t)v90, v91);
    uint64_t v49 = v102;
    swift_bridgeObjectRelease();
    sub_24E4FF600((uint64_t)v90);
    uint64_t v9 = v98;
  }
LABEL_23:
  uint64_t v61 = *(void *)(v0 + 352) + 1;
  if (v61 == *(void *)(v0 + 328))
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v62 = *(void *)(v0 + 280);
    uint64_t v63 = *(void *)(v0 + 288);
    uint64_t v64 = *(uint64_t **)(v0 + 256);
    uint64_t v65 = *(void *)(v0 + 264);
    *uint64_t v64 = v9;
    v64[1] = v49;
    v64[2] = v62;
    v64[3] = v63;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_destroy_boxed_opaque_existential_0(v65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v66 = *(uint64_t (**)(void))(v0 + 8);
    return v66();
  }
  else
  {
    *(void *)(v0 + 344) = v49;
    *(void *)(v0 + 352) = v61;
    *(void *)(v0 + 336) = v9;
    uint64_t v68 = *(void **)(v0 + 264);
    uint64_t v69 = *(void *)(v0 + 272) + 24 * v61;
    char v70 = *(unsigned char *)(v69 + 32);
    *(unsigned char *)(v0 + 408) = v70;
    uint64_t v71 = *(void *)(v69 + 40);
    *(void *)(v0 + 360) = v71;
    uint64_t v72 = *(void *)(v69 + 48);
    *(void *)(v0 + 368) = v72;
    uint64_t v73 = v68[3];
    uint64_t v74 = v68[4];
    __swift_project_boxed_opaque_existential_1(v68, v73);
    *(unsigned char *)(v0 + 16) = v70;
    *(void *)(v0 + 24) = v71;
    *(void *)(v0 + 32) = v72;
    uint64_t v100 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 + 8) + **(int **)(v74 + 8));
    swift_bridgeObjectRetain();
    uint64_t v75 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v75;
    void *v75 = v0;
    v75[1] = sub_24E4FC168;
    return v100(v0 + 16, v73, v74);
  }
}

uint64_t sub_24E4FD044()
{
  uint64_t v1 = *(void *)(v0 + 264);
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_24E4FD140()
{
  uint64_t Controller = type metadata accessor for QueryController();
  uint64_t v2 = (void *)swift_allocObject();
  v0[17] = v2;
  swift_defaultActor_initialize();
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    uint64_t v4 = v0[13];
    uint64_t v5 = v0[14];
    uint64_t v6 = v0[12];
    v2[14] = result;
    v2[15] = v6;
    v2[16] = v4;
    v0[5] = Controller;
    v0[6] = &protocol witness table for QueryController;
    v0[2] = v2;
    swift_retain();
    char v7 = sub_24E4FEFBC(v5);
    swift_bridgeObjectRelease();
    swift_retain();
    char v8 = (void *)swift_task_alloc();
    v0[18] = v8;
    *char v8 = v0;
    v8[1] = sub_24E4FD290;
    uint64_t v9 = v0[15];
    uint64_t v10 = v0[16];
    return (id)sub_24E4FBE90((uint64_t)(v0 + 7), (uint64_t)(v0 + 2), (uint64_t)v7, v9, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24E4FD290()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E501554;
  }
  else {
    uint64_t v2 = sub_24E501550;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

FindMyMessaging::Destination __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CorrelationIdentifierMap.destination(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v5 = v1;
  uint64_t v6 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x270FA5388](v6);
  char v8 = (uint64_t *)((char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void *)(v2 + 8);
  *char v8 = countAndFlagsBits;
  v8[1] = (uint64_t)object;
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  if (v10 && (unint64_t v11 = sub_24E4FF3F8((uint64_t)v8), (v12 & 1) != 0))
  {
    uint64_t v13 = *(void *)(v9 + 56) + 24 * v11;
    char v14 = *(unsigned char *)v13;
    uint64_t v16 = *(void *)(v13 + 8);
    uint64_t v15 = *(void *)(v13 + 16);
    swift_bridgeObjectRetain();
    FindMyMessaging::Destination::DestinationType v17 = sub_24E4FF600((uint64_t)v8);
    *(unsigned char *)uint64_t v5 = v14;
    *(void *)(v5 + 8) = v16;
    *(void *)(v5 + 16) = v15;
  }
  else
  {
    sub_24E4FF600((uint64_t)v8);
    sub_24E4FF65C();
    swift_allocError();
    *(void *)uint64_t v20 = countAndFlagsBits;
    *(void *)(v20 + 8) = object;
    *(void *)(v20 + 16) = 0;
    *(unsigned char *)(v20 + 24) = 0;
    swift_bridgeObjectRetain();
    FindMyMessaging::Destination::DestinationType v17 = swift_willThrow();
  }
  result.destination._object = v19;
  result.destination._uint64_t countAndFlagsBits = v18;
  result.uint64_t type = v17;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CorrelationIdentifierMap.correlationIdentifier(for:)(FindMyMessaging::Destination a1)
{
  uint64_t v2 = *(unsigned __int8 **)&a1.type;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE630);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CorrelationIdentifier();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v25 - v11;
  uint64_t v13 = *v2;
  uint64_t v15 = *((void *)v2 + 1);
  uint64_t v14 = *((void *)v2 + 2);
  uint64_t v16 = *v1;
  uint64_t v17 = *(void *)(v16 + 16);
  uint64_t v26 = v13;
  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
LABEL_7:
    sub_24E4FB96C((uint64_t)v5, &qword_2698EE630);
    sub_24E4FF65C();
    swift_allocError();
    *(void *)uint64_t v20 = v26;
    *(void *)(v20 + 8) = v15;
    *(void *)(v20 + 16) = v14;
    *(unsigned char *)(v20 + 24) = 1;
    swift_bridgeObjectRetain();
    uint64_t v21 = swift_willThrow();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_24E4FF254(v13, v15, v14);
  if (v19)
  {
    sub_24E4FF714(*(void *)(v16 + 56) + *(void *)(v7 + 72) * v18, (uint64_t)v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    goto LABEL_7;
  }
  sub_24E4FF6B0((uint64_t)v5, (uint64_t)v12);
  sub_24E4FF714((uint64_t)v12, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24E4FF65C();
    swift_allocError();
    *(void *)uint64_t v23 = v26;
    *(void *)(v23 + 8) = v15;
    *(void *)(v23 + 16) = v14;
    *(unsigned char *)(v23 + 24) = 1;
    swift_bridgeObjectRetain();
    swift_willThrow();
    sub_24E4FF600((uint64_t)v12);
    uint64_t v21 = sub_24E4FF600((uint64_t)v10);
  }
  else
  {
    sub_24E4FF600((uint64_t)v12);
    uint64_t v21 = *v10;
    uint64_t v22 = (void *)v10[1];
  }
LABEL_11:
  result._object = v22;
  result._uint64_t countAndFlagsBits = v21;
  return result;
}

uint64_t CorrelationIdentifierMap.map(destinations:)(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v1;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    for (id i = (void *)(a1 + 48); ; i += 3)
    {
      uint64_t v9 = *(i - 1);
      uint64_t v10 = *i;
      v11[0] = *((unsigned char *)i - 16);
      uint64_t v12 = v9;
      uint64_t v13 = v10;
      swift_bridgeObjectRetain();
      sub_24E4FD8B4(&v14, (uint64_t)v11, v5);
      if (v3) {
        break;
      }
      uint64_t v3 = 0;
      swift_bridgeObjectRelease();
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

uint64_t sub_24E4FD8B4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE630);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CorrelationIdentifier();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v38 - v14;
  if (!*(void *)(a3 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    return sub_24E4FB96C((uint64_t)v8, &qword_2698EE630);
  }
  uint64_t v16 = *(void *)(a2 + 8);
  unsigned __int8 v17 = *(unsigned char *)a2;
  uint64_t v18 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t v39 = v16;
  unint64_t v19 = sub_24E4FF254(v17, v16, v18);
  if (v20)
  {
    sub_24E4FF714(*(void *)(a3 + 56) + *(void *)(v10 + 72) * v19, (uint64_t)v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_24E4FB96C((uint64_t)v8, &qword_2698EE630);
  }
  uint64_t v22 = a1;
  unint64_t v23 = v18;
  uint64_t v24 = (uint64_t)v8;
  uint64_t v25 = v15;
  sub_24E4FF6B0(v24, (uint64_t)v15);
  uint64_t v26 = *v22;
  swift_bridgeObjectRetain();
  char v27 = sub_24E5066B8((uint64_t)v15, v26);
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0)
  {
    sub_24E4FF714((uint64_t)v15, (uint64_t)v13);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v26 = sub_24E4F1288(0, *(void *)(v26 + 16) + 1, 1, v26);
    }
    unint64_t v37 = *(void *)(v26 + 16);
    unint64_t v36 = *(void *)(v26 + 24);
    if (v37 >= v36 >> 1) {
      uint64_t v26 = sub_24E4F1288(v36 > 1, v37 + 1, 1, v26);
    }
    *(void *)(v26 + 16) = v37 + 1;
    sub_24E4FF6B0((uint64_t)v13, v26+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v37);
    *uint64_t v22 = v26;
    goto LABEL_19;
  }
  if (qword_2698EE328 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_24E52CEF0();
  __swift_project_value_buffer(v28, (uint64_t)qword_2698EE5F8);
  unint64_t v29 = v23;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_24E52CED0();
  os_log_type_t v31 = sub_24E52D1E0();
  if (!os_log_type_enabled(v30, v31))
  {
    swift_bridgeObjectRelease_n();

LABEL_19:
    uint64_t v35 = (uint64_t)v25;
    return sub_24E4FF600(v35);
  }
  uint64_t v32 = swift_slowAlloc();
  uint64_t v33 = (uint64_t)v25;
  uint64_t v34 = swift_slowAlloc();
  uint64_t v41 = v34;
  *(_DWORD *)uint64_t v32 = 136315651;
  uint64_t v40 = sub_24E4F1740(0xD000000000000012, 0x800000024E52F990, &v41);
  sub_24E52D250();
  *(_WORD *)(v32 + 12) = 2160;
  uint64_t v40 = 1752392040;
  sub_24E52D250();
  *(_WORD *)(v32 + 22) = 2081;
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_24E4F1740(v39, v29, &v41);
  sub_24E52D250();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_24E4DA000, v30, v31, "CorrelationIdentifierMap: Duplicate destination detected during %s: %{private,mask.hash}s", (uint8_t *)v32, 0x20u);
  swift_arrayDestroy();
  MEMORY[0x25333DD20](v34, -1, -1);
  MEMORY[0x25333DD20](v32, -1, -1);

  uint64_t v35 = v33;
  return sub_24E4FF600(v35);
}

uint64_t CorrelationIdentifierMap.map(destinations:)()
{
  uint64_t v2 = v1;
  uint64_t v3 = *v0;
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_24E4FEFBC(v4);
  swift_bridgeObjectRelease();
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t v6 = v5[2];
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = v5 + 6;
    while (1)
    {
      uint64_t v8 = *(v7 - 1);
      uint64_t v9 = *v7;
      v13[0] = *((unsigned char *)v7 - 16);
      uint64_t v14 = v8;
      uint64_t v15 = v9;
      swift_bridgeObjectRetain();
      sub_24E4FD8B4(&v16, (uint64_t)v13, v3);
      if (v2) {
        break;
      }
      uint64_t v2 = 0;
      v7 += 3;
      swift_bridgeObjectRelease();
      if (!--v6)
      {
        swift_release_n();
        uint64_t v10 = v16;
        goto LABEL_7;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    swift_release();
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_7:
    uint64_t v11 = sub_24E4F6E2C(v10);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

void *CorrelationIdentifierMap.map(correlationIdentifiers:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v5 = *(void *)(type metadata accessor for CorrelationIdentifier() - 8);
  uint64_t v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  uint64_t v19 = v6;
  uint64_t v20 = v5;
  do
  {
    if (*(void *)(v4 + 16))
    {
      unint64_t v10 = sub_24E4FF3F8(v6 + *(void *)(v5 + 72) * v7);
      if (v11)
      {
        uint64_t v12 = *(void *)(v4 + 56) + 24 * v10;
        char v13 = *(unsigned char *)v12;
        uint64_t v15 = *(void *)(v12 + 8);
        uint64_t v14 = *(void *)(v12 + 16);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v8 = sub_24E4F14F0(0, v8[2] + 1, 1, v8);
        }
        unint64_t v17 = v8[2];
        unint64_t v16 = v8[3];
        if (v17 >= v16 >> 1) {
          uint64_t v8 = sub_24E4F14F0((void *)(v16 > 1), v17 + 1, 1, v8);
        }
        v8[2] = v17 + 1;
        uint64_t v9 = &v8[3 * v17];
        *((unsigned char *)v9 + 32) = v13;
        v9[5] = v15;
        v9[6] = v14;
        uint64_t v5 = v20;
        uint64_t v6 = v19;
      }
    }
    ++v7;
  }
  while (v2 != v7);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t CorrelationIdentifierMap.map(correlationIdentifiers:)()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = swift_bridgeObjectRetain();
  size_t v3 = sub_24E4FF100(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)(type metadata accessor for CorrelationIdentifier() - 8);
    size_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    swift_retain();
    uint64_t v7 = 0;
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    uint64_t v21 = v5;
    size_t v20 = v6;
    do
    {
      if (*(void *)(v1 + 16))
      {
        unint64_t v10 = sub_24E4FF3F8(v6 + *(void *)(v5 + 72) * v7);
        if (v11)
        {
          uint64_t v12 = *(void *)(v1 + 56) + 24 * v10;
          char v13 = *(unsigned char *)v12;
          uint64_t v15 = *(void *)(v12 + 8);
          uint64_t v14 = *(void *)(v12 + 16);
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v8 = sub_24E4F14F0(0, v8[2] + 1, 1, v8);
          }
          unint64_t v17 = v8[2];
          unint64_t v16 = v8[3];
          if (v17 >= v16 >> 1) {
            uint64_t v8 = sub_24E4F14F0((void *)(v16 > 1), v17 + 1, 1, v8);
          }
          v8[2] = v17 + 1;
          uint64_t v9 = &v8[3 * v17];
          *((unsigned char *)v9 + 32) = v13;
          v9[5] = v15;
          v9[6] = v14;
          uint64_t v5 = v21;
          size_t v6 = v20;
        }
      }
      ++v7;
    }
    while (v4 != v7);
    swift_release_n();
  }
  else
  {
    swift_release();
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v18 = sub_24E4F6FB8((uint64_t)v8);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t CorrelationIdentifierMap.init(mockLookupHelper:destinations:disambiguate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[14] = a4;
  v5[15] = a5;
  v5[12] = a2;
  v5[13] = a3;
  v5[11] = a1;
  return MEMORY[0x270FA2498](sub_24E4FE25C, 0, 0);
}

{
  void *v5;

  v5[19] = a4;
  v5[20] = a5;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  return MEMORY[0x270FA2498](sub_24E4FE550, 0, 0);
}

uint64_t sub_24E4FE25C()
{
  sub_24E5008E8(v0[12], (uint64_t)(v0 + 2));
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[16] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E4FE328;
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[13];
  return sub_24E4FBE90((uint64_t)(v0 + 7), (uint64_t)(v0 + 2), v4, v2, v3);
}

uint64_t sub_24E4FE328()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4FE4B8;
  }
  else {
    uint64_t v2 = sub_24E4FE43C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4FE43C()
{
  uint64_t v1 = *(_OWORD **)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v2);
  long long v3 = *(_OWORD *)(v0 + 72);
  *uint64_t v1 = *(_OWORD *)(v0 + 56);
  v1[1] = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24E4FE4B8()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24E4FE550()
{
  uint64_t v1 = v0[18];
  sub_24E5008E8(v0[17], (uint64_t)(v0 + 2));
  swift_retain();
  sub_24E5008E8((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  uint64_t v2 = sub_24E4FEFBC(v1);
  swift_bridgeObjectRelease();
  swift_retain();
  long long v3 = (void *)swift_task_alloc();
  v0[21] = (uint64_t)v3;
  *long long v3 = v0;
  v3[1] = sub_24E4FE650;
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[20];
  return sub_24E4FBE90((uint64_t)(v0 + 12), (uint64_t)(v0 + 7), (uint64_t)v2, v4, v5);
}

uint64_t sub_24E4FE650()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E4FE814;
  }
  else {
    uint64_t v2 = sub_24E4FE764;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E4FE764()
{
  uint64_t v2 = *(_OWORD **)(v0 + 128);
  uint64_t v1 = *(void *)(v0 + 136);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  long long v5 = *(_OWORD *)(v0 + 112);
  long long v6 = *(_OWORD *)(v0 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1);
  _OWORD *v2 = v6;
  v2[1] = v5;
  long long v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24E4FE814()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t CorrelationIdentifierMap.description.getter()
{
  sub_24E52D380();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "forwardMap: ");
  type metadata accessor for CorrelationIdentifier();
  sub_24E4F9350();
  swift_bridgeObjectRetain();
  sub_24E52CF40();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  sub_24E501470(&qword_2698EE508, (void (*)(uint64_t))type metadata accessor for CorrelationIdentifier);
  swift_bridgeObjectRetain();
  sub_24E52CF40();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t CorrelationIdentifier.hash(into:)()
{
  uint64_t v1 = sub_24E52CEC0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E4FF714(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_24E52D630();
    sub_24E501470((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    sub_24E52CFB0();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    sub_24E52D630();
    sub_24E52D010();
    return swift_bridgeObjectRelease();
  }
}

uint64_t CorrelationIdentifier.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E52CEC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E52D620();
  sub_24E4FF714(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_24E52D630();
    sub_24E501470((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    sub_24E52CFB0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_24E52D630();
    sub_24E52D010();
    swift_bridgeObjectRelease();
  }
  return sub_24E52D660();
}

uint64_t sub_24E4FEDCC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E52CEC0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E52D620();
  sub_24E4FF714(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_24E52D630();
    sub_24E501470((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    sub_24E52CFB0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    sub_24E52D630();
    sub_24E52D010();
    swift_bridgeObjectRelease();
  }
  return sub_24E52D660();
}

void *sub_24E4FEFBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_24E500118((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_24E4E0DC4();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t type metadata accessor for CorrelationIdentifier()
{
  uint64_t result = qword_2698EE650;
  if (!qword_2698EE650) {
    return swift_getSingletonMetadata();
  }
  return result;
}

size_t sub_24E4FF100(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE520);
  uint64_t v3 = *(void *)(type metadata accessor for CorrelationIdentifier() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_24E500328(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_24E4E0DC4();
      if (v9 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_24E4FF254(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  sub_24E52D620();
  sub_24E52D630();
  sub_24E52D010();
  uint64_t v6 = sub_24E52D660();
  return sub_24E4FF7DC(a1, a2, a3, v6);
}

unint64_t sub_24E4FF2E8(uint64_t a1, uint64_t a2)
{
  sub_24E52D620();
  sub_24E52D010();
  uint64_t v4 = sub_24E52D660();
  return sub_24E4FF8B4(a1, a2, v4);
}

unint64_t sub_24E4FF360(uint64_t a1)
{
  sub_24E52CEC0();
  sub_24E501470((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
  uint64_t v2 = sub_24E52CFA0();
  return sub_24E4FF998(a1, v2);
}

unint64_t sub_24E4FF3F8(uint64_t a1)
{
  uint64_t v2 = sub_24E52CEC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E52D620();
  sub_24E4FF714(a1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_24E52D630();
    sub_24E501470((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    sub_24E52CFB0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_24E52D630();
    sub_24E52D010();
    swift_bridgeObjectRelease();
  }
  uint64_t v9 = sub_24E52D660();
  return sub_24E4FFB58(a1, v9);
}

uint64_t sub_24E4FF600(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24E4FF65C()
{
  unint64_t result = qword_2698EE628;
  if (!qword_2698EE628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE628);
  }
  return result;
}

uint64_t sub_24E4FF6B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E4FF714(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24E4FF778(uint64_t a1)
{
  sub_24E52D430();
  uint64_t v2 = sub_24E52CFA0();
  return sub_24E4FFF80(a1, v2);
}

unint64_t sub_24E4FF7DC(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    int v10 = a1;
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      char v13 = (unsigned __int8 *)(v12 + 24 * v7);
      if (*v13 == v10)
      {
        BOOL v14 = *((void *)v13 + 1) == a2 && *((void *)v13 + 2) == a3;
        if (v14 || (sub_24E52D5A0() & 1) != 0) {
          break;
        }
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_24E4FF8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24E52D5A0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24E52D5A0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24E4FF998(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24E501470(&qword_2698EE668, MEMORY[0x263F07508]);
      char v15 = sub_24E52CFC0();
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

unint64_t sub_24E4FFB58(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = a1;
  uint64_t v37 = sub_24E52CEC0();
  uint64_t v4 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v34 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE510);
  MEMORY[0x270FA5388](v42);
  unint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CorrelationIdentifier();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v38 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  char v13 = (uint64_t *)((char *)&v33 - v12);
  MEMORY[0x270FA5388](v11);
  unint64_t v16 = (char *)&v33 - v15;
  uint64_t v44 = v2;
  uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v18 = a2 & ~v17;
  uint64_t v41 = v2 + 64;
  if (((*(void *)(v2 + 64 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
    return v18;
  }
  uint64_t v19 = *(void *)(v14 + 72);
  uint64_t v39 = ~v17;
  uint64_t v40 = v19;
  unint64_t v36 = (void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v33 = (void (**)(char *, char *, uint64_t))(v4 + 32);
  uint64_t v20 = (uint64_t)v38;
  while (1)
  {
    sub_24E4FF714(*(void *)(v44 + 48) + v40 * v18, (uint64_t)v16);
    uint64_t v21 = &v7[*(int *)(v42 + 48)];
    sub_24E4FF714((uint64_t)v16, (uint64_t)v7);
    sub_24E4FF714(v43, (uint64_t)v21);
    if (swift_getEnumCaseMultiPayload() != 1) {
      break;
    }
    sub_24E4FF714((uint64_t)v7, v20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = v34;
      uint64_t v23 = v37;
      (*v33)(v34, v21, v37);
      int v35 = sub_24E52CEA0();
      uint64_t v24 = *v36;
      uint64_t v25 = v22;
      uint64_t v20 = (uint64_t)v38;
      (*v36)((uint64_t)v25, v23);
      v24(v20, v23);
      if (v35) {
        goto LABEL_20;
      }
LABEL_16:
      sub_24E4FF600((uint64_t)v7);
      goto LABEL_5;
    }
    (*v36)(v20, v37);
LABEL_4:
    sub_24E4FB96C((uint64_t)v7, &qword_2698EE510);
LABEL_5:
    sub_24E4FF600((uint64_t)v16);
    unint64_t v18 = (v18 + 1) & v39;
    if (((*(void *)(v41 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return v18;
    }
  }
  sub_24E4FF714((uint64_t)v7, (uint64_t)v13);
  uint64_t v27 = *v13;
  uint64_t v26 = v13[1];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v28 = *(void *)v21;
  uint64_t v29 = *((void *)v21 + 1);
  if (v27 != v28 || v26 != v29)
  {
    char v31 = sub_24E52D5A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRelease_n();
LABEL_20:
  sub_24E4FF600((uint64_t)v7);
  sub_24E4FF600((uint64_t)v16);
  return v18;
}

unint64_t sub_24E4FFF80(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = sub_24E52D430();
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = sub_24E52CFC0();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_24E500118(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
LABEL_39:
    *uint64_t v5 = a4;
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
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
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
    uint64_t v20 = *(void *)(a4 + 48) + 24 * v16;
    uint64_t v22 = *(void *)(v20 + 8);
    uint64_t v21 = *(void *)(v20 + 16);
    *(unsigned char *)uint64_t v11 = *(unsigned char *)v20;
    *(void *)(v11 + 8) = v22;
    *(void *)(v11 + 16) = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 24;
    unint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_24E500328(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for CorrelationIdentifier();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8);
  int64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (char *)&v30 - v14;
  uint64_t v35 = a4;
  uint64_t v18 = *(void *)(a4 + 56);
  uint64_t v17 = a4 + 56;
  uint64_t v16 = v18;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 24);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v32 = -1 << *(unsigned char *)(v17 - 24);
  uint64_t v33 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  int64_t v34 = (unint64_t)(63 - v19) >> 6;
  int64_t v31 = v34 - 1;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    sub_24E4FF714(*(void *)(v35 + 48) + v29 * v25, (uint64_t)v12);
    sub_24E4FF6B0((uint64_t)v12, (uint64_t)v15);
    uint64_t result = sub_24E4FF6B0((uint64_t)v15, a2);
    if (v23 == a3) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v34) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }
  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v26 >= v34)
    {
      unint64_t v21 = 0;
      int64_t v22 = v31;
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t _s15FindMyMessaging21CorrelationIdentifierO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CorrelationIdentifier();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v26 - v12);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE510);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_24E4FF714(a1, (uint64_t)v17);
  sub_24E4FF714(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_24E4FF714((uint64_t)v17, (uint64_t)v13);
    uint64_t v22 = *v13;
    uint64_t v21 = v13[1];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      if (v22 == *(void *)v18 && v21 == *((void *)v18 + 1))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v24 = sub_24E52D5A0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0)
        {
          sub_24E4FF600((uint64_t)v17);
          goto LABEL_8;
        }
      }
      sub_24E4FF600((uint64_t)v17);
      char v19 = 1;
      return v19 & 1;
    }
    swift_bridgeObjectRelease();
LABEL_7:
    sub_24E4FB96C((uint64_t)v17, &qword_2698EE510);
LABEL_8:
    char v19 = 0;
    return v19 & 1;
  }
  sub_24E4FF714((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  char v19 = sub_24E52CEA0();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
  sub_24E4FF600((uint64_t)v17);
  return v19 & 1;
}

uint64_t sub_24E5008E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24E50094C()
{
  return sub_24E501470(&qword_2698EE648, (void (*)(uint64_t))type metadata accessor for CorrelationIdentifier);
}

uint64_t destroy for CorrelationIdentifierMap()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for CorrelationIdentifierMap(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CorrelationIdentifierMap(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for CorrelationIdentifierMap(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrelationIdentifierMap(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrelationIdentifierMap(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrelationIdentifierMap()
{
  return &type metadata for CorrelationIdentifierMap;
}

uint64_t initializeBufferWithCopyOfBuffer for Device(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_24E500BD8()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for CorrelationIdentifierMap.Error()
{
  return sub_24E500BF8();
}

uint64_t sub_24E500BF8()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CorrelationIdentifierMap.Error(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  char v6 = *((unsigned char *)a2 + 24);
  sub_24E500BD8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for CorrelationIdentifierMap.Error(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  char v6 = *((unsigned char *)a2 + 24);
  sub_24E500BD8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_24E500BF8();
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CorrelationIdentifierMap.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_24E500BF8();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrelationIdentifierMap.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrelationIdentifierMap.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24E500DC8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_24E500DD0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CorrelationIdentifierMap.Error()
{
  return &type metadata for CorrelationIdentifierMap.Error;
}

uint64_t *initializeBufferWithCopyOfBuffer for CorrelationIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24E52CEC0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CorrelationIdentifier(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24E52CEC0();
    unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
}

void *initializeWithCopy for CorrelationIdentifier(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_24E52CEC0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for CorrelationIdentifier(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_24E4FF600((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_24E52CEC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for CorrelationIdentifier(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24E52CEC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for CorrelationIdentifier(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24E4FF600((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24E52CEC0();
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

uint64_t getEnumTagSinglePayload for CorrelationIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for CorrelationIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24E5012C8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24E5012D8()
{
  uint64_t result = sub_24E52CEC0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of CorrelationIdentifierLookup.correlationIdentifier(destination:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24E4E08C0;
  return v9(a1, a2, a3);
}

uint64_t sub_24E501470(unint64_t *a1, void (*a2)(uint64_t))
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24E5014FC()
{
  unint64_t result = qword_2698EE670;
  if (!qword_2698EE670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE670);
  }
  return result;
}

uint64_t NullMessageType.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

void *static NullMessageType.allCases.getter()
{
  return &unk_270053000;
}

uint64_t NullMessageType.rawValue.getter()
{
  return 0;
}

uint64_t sub_24E501580()
{
  return 1;
}

unint64_t sub_24E50158C()
{
  unint64_t result = qword_2698EE678;
  if (!qword_2698EE678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE678);
  }
  return result;
}

uint64_t sub_24E5015E0()
{
  return sub_24E52D660();
}

uint64_t sub_24E501624()
{
  return sub_24E52D650();
}

uint64_t sub_24E50164C()
{
  return sub_24E52D660();
}

_DWORD *sub_24E50168C@<X0>(_DWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_24E5016A0(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_24E5016AC()
{
  unint64_t result = qword_2698EE680;
  if (!qword_2698EE680)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698EE688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE680);
  }
  return result;
}

void sub_24E501708(void *a1@<X8>)
{
  *a1 = &unk_270053028;
}

unint64_t sub_24E501718(void *a1)
{
  a1[1] = sub_24E501750();
  a1[2] = sub_24E5017A4();
  unint64_t result = sub_24E5017F8();
  a1[3] = result;
  return result;
}

unint64_t sub_24E501750()
{
  unint64_t result = qword_2698EE690;
  if (!qword_2698EE690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE690);
  }
  return result;
}

unint64_t sub_24E5017A4()
{
  unint64_t result = qword_2698EE698;
  if (!qword_2698EE698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE698);
  }
  return result;
}

unint64_t sub_24E5017F8()
{
  unint64_t result = qword_2698EE6A0;
  if (!qword_2698EE6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE6A0);
  }
  return result;
}

uint64_t sub_24E50184C()
{
  return sub_24E52D0B0();
}

uint64_t sub_24E5018AC()
{
  return sub_24E52D060();
}

uint64_t getEnumTagSinglePayload for NullMessageType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NullMessageType(unsigned char *result, int a2, int a3)
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
        void *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E5019F0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24E501A18()
{
  return 0;
}

ValueMetadata *type metadata accessor for NullMessageType()
{
  return &type metadata for NullMessageType;
}

BOOL static MessagingCapability.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MessagingCapability.hash(into:)()
{
  return sub_24E52D630();
}

void *static MessagingCapability.allCases.getter()
{
  return &unk_270053050;
}

uint64_t MessagingCapability.hashValue.getter()
{
  return sub_24E52D660();
}

BOOL sub_24E501AC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E501AD8()
{
  return sub_24E52D660();
}

uint64_t sub_24E501B20()
{
  return sub_24E52D630();
}

uint64_t sub_24E501B4C()
{
  return sub_24E52D660();
}

unint64_t sub_24E501B94()
{
  unint64_t result = qword_2698EE6A8;
  if (!qword_2698EE6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE6A8);
  }
  return result;
}

unint64_t sub_24E501BEC()
{
  unint64_t result = qword_2698EE6B0;
  if (!qword_2698EE6B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2698EE6B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE6B0);
  }
  return result;
}

void sub_24E501C48(void *a1@<X8>)
{
  *a1 = &unk_270053050;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Destination.DestinationType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MessagingCapability(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 5;
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
        JUMPOUT(0x24E501DC0);
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
          void *result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_24E501DE8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24E501DF0(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessagingCapability()
{
  return &type metadata for MessagingCapability;
}

unint64_t MessagingOptions.dictionaryValue.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  MEMORY[0x270FA5388]();
  int v2 = (char *)&v109 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24E52CEC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  unsigned int v6 = (char *)&v109 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE6C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24E52DE40;
  *(void *)(inited + 32) = sub_24E52CFF0();
  *(void *)(inited + 40) = v8;
  uint64_t v9 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = 1;
  unint64_t v10 = sub_24E4E175C(inited);
  uint64_t v11 = sub_24E52CFF0();
  uint64_t v13 = v12;
  uint64_t v14 = sub_24E52CE70();
  uint64_t v122 = MEMORY[0x263F06F78];
  *(void *)&long long v121 = v14;
  *((void *)&v121 + 1) = v15;
  sub_24E4F7148(&v121, v120);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v119 = v10;
  sub_24E502E44(v120, v11, v13, isUniquelyReferenced_nonNull_native);
  unint64_t v17 = v119;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v110 = type metadata accessor for MessagingOptions();
  uint64_t v18 = *(int *)(v110 + 24);
  uint64_t v111 = v0;
  if (*(unsigned char *)(v0 + v18) == 1)
  {
    uint64_t v19 = sub_24E52CFF0();
    uint64_t v21 = v20;
    uint64_t v122 = v9;
    LOBYTE(v121) = 1;
    sub_24E4F7148(&v121, v120);
    char v22 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v119 = v17;
    sub_24E502E44(v120, v19, v21, v22);
    unint64_t v17 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v23 = (int *)v110;
  sub_24E502FE4(v111 + *(int *)(v110 + 28), (uint64_t)v2);
  int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  uint64_t v25 = MEMORY[0x263F8D310];
  if (v24 == 1)
  {
    sub_24E50304C((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    uint64_t v26 = sub_24E52CFF0();
    uint64_t v28 = v27;
    uint64_t v29 = sub_24E52CE90();
    uint64_t v122 = v25;
    *(void *)&long long v121 = v29;
    *((void *)&v121 + 1) = v30;
    sub_24E4F7148(&v121, v120);
    char v31 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v119 = v17;
    sub_24E502E44(v120, v26, v28, v31);
    unint64_t v17 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v32 = v111;
  uint64_t v33 = (uint64_t *)(v111 + v23[8]);
  if ((v33[1] & 1) == 0)
  {
    uint64_t v34 = *v33;
    uint64_t v35 = sub_24E52CFF0();
    uint64_t v37 = v36;
    uint64_t v122 = MEMORY[0x263F8D538];
    *(void *)&long long v121 = v34;
    sub_24E4F7148(&v121, v120);
    char v38 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v119 = v17;
    sub_24E502E44(v120, v35, v37, v38);
    unint64_t v17 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v39 = MEMORY[0x263F8D4F8];
  if (*(unsigned char *)(v32 + v23[9]) == 1)
  {
    uint64_t v40 = sub_24E52CFF0();
    uint64_t v42 = v41;
    uint64_t v122 = v39;
    LOBYTE(v121) = 1;
    sub_24E4F7148(&v121, v120);
    char v43 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v119 = v17;
    sub_24E502E44(v120, v40, v42, v43);
    unint64_t v44 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v44 = v17;
  }
  uint64_t v45 = (uint64_t *)(v32 + v23[12]);
  uint64_t v46 = v45[1];
  if (v46)
  {
    uint64_t v47 = *v45;
    uint64_t v48 = sub_24E52CFF0();
    uint64_t v50 = v49;
    uint64_t v122 = v25;
    *(void *)&long long v121 = v47;
    *((void *)&v121 + 1) = v46;
    sub_24E4F7148(&v121, v120);
    swift_bridgeObjectRetain();
    char v51 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v119 = v44;
    sub_24E502E44(v120, v48, v50, v51);
    unint64_t v52 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v52 = v44;
  }
  uint64_t v53 = *(void *)(v32 + v23[10]);
  int64_t v54 = *(void *)(v53 + 16);
  uint64_t v55 = MEMORY[0x263F8EE78];
  uint64_t v56 = (uint64_t *)MEMORY[0x263F4A1B0];
  unint64_t v57 = (uint64_t *)MEMORY[0x263F4A170];
  unint64_t v58 = (uint64_t *)MEMORY[0x263F4A168];
  uint64_t v59 = (uint64_t *)MEMORY[0x263F4A1C0];
  char v60 = (uint64_t *)MEMORY[0x263F4A1A0];
  if (v54)
  {
    unint64_t v109 = v52;
    *(void *)&long long v121 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    uint64_t v61 = v59;
    sub_24E4F1DB8(0, v54, 0);
    uint64_t v62 = v121;
    int64_t v63 = sub_24E503A78(v53);
    int v65 = v64;
    uint64_t v66 = v60;
    char v68 = v67 & 1;
    uint64_t v118 = v53 + 56;
    uint64_t v116 = *v56;
    uint64_t v115 = *v57;
    uint64_t v114 = *v58;
    uint64_t v113 = *v61;
    uint64_t v112 = *MEMORY[0x263F4A178];
    uint64_t v117 = *v66;
    do
    {
      if (v63 < 0 || v63 >= 1 << *(unsigned char *)(v53 + 32))
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        JUMPOUT(0x24E50285CLL);
      }
      if (((*(void *)(v118 + (((unint64_t)v63 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v63) & 1) == 0) {
        goto LABEL_36;
      }
      if (*(_DWORD *)(v53 + 36) != v65) {
        goto LABEL_37;
      }
      uint64_t v69 = sub_24E52CFF0();
      uint64_t v71 = v70;
      *(void *)&long long v121 = v62;
      unint64_t v73 = *(void *)(v62 + 16);
      unint64_t v72 = *(void *)(v62 + 24);
      if (v73 >= v72 >> 1)
      {
        sub_24E4F1DB8(v72 > 1, v73 + 1, 1);
        uint64_t v62 = v121;
      }
      *(void *)(v62 + 16) = v73 + 1;
      uint64_t v74 = v62 + 16 * v73;
      *(void *)(v74 + 32) = v69;
      *(void *)(v74 + 40) = v71;
      int64_t v75 = sub_24E503B28(v63, v65, v68 & 1, v53);
      int64_t v63 = v75;
      int v65 = v76;
      char v68 = v77 & 1;
      --v54;
    }
    while (v54);
    sub_24E503B18(v75, v76, v77 & 1);
    swift_bridgeObjectRelease();
    uint64_t v78 = sub_24E4F68F0(v62);
    swift_release();
    uint64_t v79 = sub_24E52CFF0();
    uint64_t v81 = v80;
    uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE6C8);
    *(void *)&long long v121 = v78;
    sub_24E4F7148(&v121, v120);
    unint64_t v82 = v109;
    char v83 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v119 = v82;
    sub_24E502E44(v120, v79, v81, v83);
    unint64_t v52 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = v111;
    uint64_t v23 = (int *)v110;
    char v60 = (uint64_t *)MEMORY[0x263F4A1A0];
    uint64_t v59 = (uint64_t *)MEMORY[0x263F4A1C0];
    uint64_t v56 = (uint64_t *)MEMORY[0x263F4A1B0];
    uint64_t v55 = MEMORY[0x263F8EE78];
  }
  uint64_t v84 = *(void *)(v32 + v23[11]);
  int64_t v85 = *(void *)(v84 + 16);
  if (v85)
  {
    unint64_t v109 = v52;
    *(void *)&long long v121 = v55;
    swift_bridgeObjectRetain();
    unint64_t v86 = v59;
    sub_24E4F1DB8(0, v85, 0);
    uint64_t v87 = v121;
    int64_t v88 = sub_24E503A78(v84);
    int v90 = v89;
    char v92 = v91 & 1;
    uint64_t v118 = v84 + 56;
    uint64_t v116 = *v56;
    uint64_t v115 = *MEMORY[0x263F4A170];
    uint64_t v114 = *MEMORY[0x263F4A168];
    uint64_t v113 = *v86;
    uint64_t v112 = *MEMORY[0x263F4A178];
    uint64_t v117 = *v60;
    do
    {
      if (v88 < 0 || v88 >= 1 << *(unsigned char *)(v84 + 32)) {
        goto LABEL_38;
      }
      if (((*(void *)(v118 + (((unint64_t)v88 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v88) & 1) == 0) {
        goto LABEL_39;
      }
      if (*(_DWORD *)(v84 + 36) != v90) {
        goto LABEL_40;
      }
      uint64_t v93 = sub_24E52CFF0();
      uint64_t v95 = v94;
      *(void *)&long long v121 = v87;
      unint64_t v97 = *(void *)(v87 + 16);
      unint64_t v96 = *(void *)(v87 + 24);
      if (v97 >= v96 >> 1)
      {
        sub_24E4F1DB8(v96 > 1, v97 + 1, 1);
        uint64_t v87 = v121;
      }
      *(void *)(v87 + 16) = v97 + 1;
      uint64_t v98 = v87 + 16 * v97;
      *(void *)(v98 + 32) = v93;
      *(void *)(v98 + 40) = v95;
      int64_t v99 = sub_24E503B28(v88, v90, v92 & 1, v84);
      int64_t v88 = v99;
      int v90 = v100;
      char v92 = v101 & 1;
      --v85;
    }
    while (v85);
    sub_24E503B18(v99, v100, v101 & 1);
    swift_bridgeObjectRelease();
    uint64_t v102 = sub_24E4F68F0(v87);
    swift_release();
    uint64_t v103 = sub_24E52CFF0();
    uint64_t v105 = v104;
    uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE6C8);
    *(void *)&long long v121 = v102;
    sub_24E4F7148(&v121, v120);
    unint64_t v106 = v109;
    char v107 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v119 = v106;
    sub_24E502E44(v120, v103, v105, v107);
    unint64_t v52 = v119;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v52;
}

double MessagingOptions.init(destinations:expectsPeerResponse:responseIdentifier:timeToLive:fireAndForget:requiredCapabilities:lackingCapabilities:queueOneIdentifier:)@<D0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v18 = (int *)type metadata accessor for MessagingOptions();
  uint64_t v19 = a9 + v18[7];
  uint64_t v20 = sub_24E52CEC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  sub_24E52CEB0();
  *(void *)(a9 + v18[5]) = a1;
  *(unsigned char *)(a9 + v18[6]) = a2;
  sub_24E4F92E8(a3, v19);
  uint64_t v21 = a9 + v18[8];
  *(void *)uint64_t v21 = a4;
  *(unsigned char *)(v21 + 8) = a5 & 1;
  *(unsigned char *)(a9 + v18[9]) = a6;
  *(void *)(a9 + v18[10]) = a7;
  *(void *)(a9 + v18[11]) = a8;
  char v22 = (void *)(a9 + v18[12]);
  *char v22 = a10;
  v22[1] = a11;
  sub_24E50304C(a3);
  double result = 3433.05319;
  *(_OWORD *)(a9 + v18[13]) = xmmword_24E52DF20;
  return result;
}

uint64_t MessagingOptions.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24E52CEC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t MessagingOptions.destinations.getter()
{
  type metadata accessor for MessagingOptions();
  return swift_bridgeObjectRetain();
}

uint64_t MessagingOptions.expectsPeerResponse.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 24));
}

uint64_t MessagingOptions.expectsPeerResponse.setter(char a1)
{
  uint64_t result = type metadata accessor for MessagingOptions();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*MessagingOptions.expectsPeerResponse.modify())(void)
{
  return nullsub_1;
}

uint64_t MessagingOptions.responseIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MessagingOptions() + 28);
  return sub_24E502FE4(v3, a1);
}

uint64_t MessagingOptions.responseIdentifier.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MessagingOptions() + 28);
  return sub_24E503C0C(a1, v3);
}

uint64_t (*MessagingOptions.responseIdentifier.modify())(void)
{
  return nullsub_1;
}

uint64_t MessagingOptions.timeToLive.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 32));
}

uint64_t MessagingOptions.fireAndForget.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 36));
}

uint64_t MessagingOptions.requiredCapabilities.getter()
{
  type metadata accessor for MessagingOptions();
  return swift_bridgeObjectRetain();
}

uint64_t MessagingOptions.lackingCapabilities.getter()
{
  type metadata accessor for MessagingOptions();
  return swift_bridgeObjectRetain();
}

uint64_t MessagingOptions.queueOneIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessagingOptions.timeout.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 52));
}

uint64_t MessagingOptions.init(destinations:expectsPeerResponse:responseIdentifier:timeToLive:fireAndForget:requiredCapabilities:lackingCapabilities:queueOneIdentifier:timeout:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v19 = (int *)type metadata accessor for MessagingOptions();
  uint64_t v20 = a9 + v19[7];
  uint64_t v21 = sub_24E52CEC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  sub_24E52CEB0();
  *(void *)(a9 + v19[5]) = a1;
  *(unsigned char *)(a9 + v19[6]) = a2;
  uint64_t result = sub_24E503C0C(a3, v20);
  uint64_t v23 = a9 + v19[8];
  *(void *)uint64_t v23 = a4;
  *(unsigned char *)(v23 + 8) = a5 & 1;
  *(unsigned char *)(a9 + v19[9]) = a6;
  *(void *)(a9 + v19[10]) = a7;
  *(void *)(a9 + v19[11]) = a8;
  int v24 = (void *)(a9 + v19[12]);
  *int v24 = a10;
  v24[1] = a11;
  uint64_t v25 = (void *)(a9 + v19[13]);
  *uint64_t v25 = a12;
  v25[1] = a13;
  return result;
}

_OWORD *sub_24E502E44(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24E4FF2E8(a2, a3);
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
      sub_24E528E04();
      goto LABEL_7;
    }
    sub_24E527A14(v15, a4 & 1);
    unint64_t v21 = sub_24E4FF2E8(a2, a3);
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
    uint64_t result = (_OWORD *)sub_24E52D5D0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_24E4F7148(a1, v19);
  }
LABEL_13:
  sub_24E503738(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for MessagingOptions()
{
  uint64_t result = qword_26B1C1778;
  if (!qword_26B1C1778) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E502FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E50304C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E5030AC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_24E52CEC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  char v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_24E4FF360(a2);
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
    uint64_t v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_24E528E24();
    goto LABEL_7;
  }
  sub_24E527A34(v17, a3 & 1);
  unint64_t v23 = sub_24E4FF360(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_24E52D5D0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_24E5037A4(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_24E503254(char a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int v6 = (void **)v5;
  uint64_t v29 = a3;
  uint64_t v11 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x270FA5388](v11);
  char v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = (void *)*v5;
  unint64_t v16 = sub_24E4FF3F8(a4);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 >= v19 && (a5 & 1) != 0)
  {
LABEL_7:
    char v22 = *v6;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7] + 24 * v16;
      uint64_t result = swift_bridgeObjectRelease();
      *(unsigned char *)uint64_t v23 = a1;
      uint64_t v25 = v29;
      *(void *)(v23 + 8) = a2;
      *(void *)(v23 + 16) = v25;
      return result;
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a5 & 1) == 0)
  {
    sub_24E5290BC();
    goto LABEL_7;
  }
  sub_24E527E28(v19, a5 & 1);
  unint64_t v26 = sub_24E4FF3F8(a4);
  if ((v20 & 1) != (v27 & 1))
  {
LABEL_14:
    uint64_t result = sub_24E52D5D0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v26;
  char v22 = *v6;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  sub_24E4FF714(a4, (uint64_t)v13);
  return sub_24E50385C(v16, (uint64_t)v13, a1, a2, v29, v22);
}

uint64_t sub_24E5033E0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned int v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_24E4FF254(a2, a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a5 & 1) == 0)
  {
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_24E529384();
      goto LABEL_7;
    }
    sub_24E528110(v17, a5 & 1);
    unint64_t v24 = sub_24E4FF254(a2, a3, a4);
    if ((v18 & 1) == (v25 & 1))
    {
      unint64_t v14 = v24;
      char v20 = *v6;
      if (v18) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24E52D5D0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v6;
  if (v18)
  {
LABEL_8:
    uint64_t v21 = v20[7];
    uint64_t v22 = v21 + *(void *)(*(void *)(type metadata accessor for CorrelationIdentifier() - 8) + 72) * v14;
    return sub_24E504C54(a1, v22);
  }
LABEL_13:
  sub_24E503918(v14, a2, a3, a4, a1, v20);
  return swift_bridgeObjectRetain();
}

_OWORD *sub_24E503560(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_24E52D430();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_24E4FF778(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_24E529828();
      goto LABEL_7;
    }
    sub_24E528844(v17, a3 & 1);
    unint64_t v23 = sub_24E4FF778(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      char v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_24E5039B8(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_24E52D5D0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = (_OWORD *)(v20[7] + 32 * v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
  return sub_24E4F7148(a1, v21);
}

_OWORD *sub_24E503738(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unsigned int v6 = (void *)(a5[6] + 16 * a1);
  *unsigned int v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24E4F7148(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_24E5037A4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_24E52CEC0();
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

uint64_t sub_24E50385C(unint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v12 = a6[6];
  uint64_t v13 = type metadata accessor for CorrelationIdentifier();
  uint64_t result = sub_24E4FF6B0(a2, v12 + *(void *)(*(void *)(v13 - 8) + 72) * a1);
  uint64_t v15 = a6[7] + 24 * a1;
  *(unsigned char *)uint64_t v15 = a3;
  *(void *)(v15 + 8) = a4;
  *(void *)(v15 + 16) = a5;
  uint64_t v16 = a6[2];
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    a6[2] = v18;
  }
  return result;
}

uint64_t sub_24E503918(unint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = a6[6] + 24 * a1;
  *(unsigned char *)uint64_t v9 = a2;
  *(void *)(v9 + 8) = a3;
  *(void *)(v9 + 16) = a4;
  uint64_t v10 = a6[7];
  uint64_t v11 = type metadata accessor for CorrelationIdentifier();
  uint64_t result = sub_24E4FF6B0(a5, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a6[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a6[2] = v15;
  }
  return result;
}

_OWORD *sub_24E5039B8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_24E52D430();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_24E4F7148(a3, (_OWORD *)(a4[7] + 32 * a1));
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

uint64_t sub_24E503A78(uint64_t a1)
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

uint64_t sub_24E503B18(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

int64_t sub_24E503B28(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_24E503C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

char *initializeBufferWithCopyOfBuffer for MessagingOptions(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24E52CEC0();
    uint64_t v8 = *(void *)(v7 - 8);
    unint64_t v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    uint64_t v10 = a3[6];
    *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
    a1[v10] = a2[v10];
    uint64_t v11 = a3[7];
    __dst = &a1[v11];
    BOOL v12 = &a2[v11];
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    if (v13(v12, 1, v7))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
      memcpy(__dst, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      v9(__dst, v12, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(__dst, 0, 1, v7);
    }
    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    uint64_t v18 = &a1[v16];
    uint64_t v19 = &a2[v16];
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = v19[8];
    a1[v17] = a2[v17];
    uint64_t v20 = a3[11];
    *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
    *(void *)&a1[v20] = *(void *)&a2[v20];
    uint64_t v21 = a3[12];
    uint64_t v22 = a3[13];
    unint64_t v23 = &a1[v21];
    char v24 = &a2[v21];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)unint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    *(_OWORD *)&a1[v22] = *(_OWORD *)&a2[v22];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MessagingOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for MessagingOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  a1[v9] = a2[v9];
  uint64_t v10 = a3[7];
  __dst = &a1[v10];
  uint64_t v11 = &a2[v10];
  BOOL v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_bridgeObjectRetain();
  if (v12(v11, 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    memcpy(__dst, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v8(__dst, v11, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(__dst, 0, 1, v6);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  a1[v15] = a2[v15];
  uint64_t v18 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  uint64_t v19 = a3[12];
  uint64_t v20 = a3[13];
  uint64_t v21 = &a1[v19];
  uint64_t v22 = &a2[v19];
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = v23;
  *(_OWORD *)&a1[v20] = *(_OWORD *)&a2[v20];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MessagingOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v26 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v26(a1, a2, v6);
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[6]] = a2[a3[6]];
  uint64_t v8 = a3[7];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  int v12 = v11(&a1[v8], 1, v6);
  int v13 = v11(v10, 1, v6);
  if (!v12)
  {
    if (!v13)
    {
      v26(v9, v10, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v10, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  uint64_t v18 = *(void *)v17;
  v16[8] = v17[8];
  *(void *)uint64_t v16 = v18;
  a1[a3[9]] = a2[a3[9]];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[12];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[13];
  uint64_t v23 = &a1[v22];
  char v24 = &a2[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  return a1;
}

char *initializeWithTake for MessagingOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  uint64_t v9 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  a1[v9] = a2[v9];
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  int v12 = &a2[v10];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v10], 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = &a1[v14];
  uint64_t v17 = &a2[v14];
  *(void *)uint64_t v16 = *(void *)v17;
  v16[8] = v17[8];
  a1[v15] = a2[v15];
  uint64_t v18 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  uint64_t v19 = a3[13];
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  *(_OWORD *)&a1[v19] = *(_OWORD *)&a2[v19];
  return a1;
}

uint64_t assignWithTake for MessagingOptions(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v25(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v9 = (const void *)(a2 + v8);
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 48);
  unint64_t v26 = (void *)(a1 + v8);
  int v11 = v10();
  int v12 = ((uint64_t (*)(const void *, uint64_t, uint64_t))v10)(v9, 1, v6);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v26, v9, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v6);
      goto LABEL_9;
    }
    size_t v13 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770) - 8) + 64);
    uint64_t v14 = v26;
  }
  else
  {
    if (!v12)
    {
      v25((uint64_t)v26, (uint64_t)v9, v6);
      goto LABEL_9;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v26, v6);
    size_t v13 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770) - 8) + 64);
    uint64_t v14 = v26;
  }
  memcpy(v14, v9, v13);
LABEL_9:
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  void *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessagingOptions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E50487C);
}

uint64_t sub_24E50487C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for MessagingOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E5049C0);
}

uint64_t sub_24E5049C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24E52CEC0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_24E504AF0()
{
  sub_24E52CEC0();
  if (v0 <= 0x3F)
  {
    sub_24E504BFC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24E504BFC()
{
  if (!qword_26B1C1848[0])
  {
    sub_24E52CEC0();
    unint64_t v0 = sub_24E52D240();
    if (!v1) {
      atomic_store(v0, qword_26B1C1848);
    }
  }
}

uint64_t sub_24E504C54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t Account.uniqueID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Account.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_24E52D010();
  return swift_bridgeObjectRelease();
}

uint64_t static Account.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24E52D5A0();
  }
}

uint64_t Account.hashValue.getter()
{
  return sub_24E52D660();
}

uint64_t sub_24E504DCC()
{
  return sub_24E52D660();
}

uint64_t sub_24E504E28()
{
  swift_bridgeObjectRetain();
  sub_24E52D010();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E504E80()
{
  return sub_24E52D660();
}

unint64_t sub_24E504EDC()
{
  unint64_t result = qword_26B1C1A00;
  if (!qword_26B1C1A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C1A00);
  }
  return result;
}

uint64_t sub_24E504F30(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24E52D5A0();
  }
}

void *initializeBufferWithCopyOfBuffer for Account(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Account()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Account(void *a1, void *a2)
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

void *assignWithTake for Account(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Account(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Account(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Account()
{
  return &type metadata for Account;
}

uint64_t Destination.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

unsigned __int8 sub_24E5050E4@<W0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  if ((*(unsigned char *)v1 & 0xFE) == 2)
  {
    uint64_t v5 = (void *)sub_24E52CFE0();
    id v6 = objc_msgSend(v5, sel__stripPotentialTokenURIWithToken_, 0);

    if (v6)
    {
      uint64_t v7 = sub_24E52CFF0();
      uint64_t v9 = v8;

      v10._uint64_t countAndFlagsBits = v7;
      v10._object = v9;
      unsigned __int8 result = Destination.init(stringRepresentation:)(v10);
      if (v14)
      {
        *(unsigned char *)a1 = v12;
        *(void *)(a1 + 8) = v13;
        *(void *)(a1 + 16) = v14;
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    swift_bridgeObjectRetain();
    sub_24E52D380();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24E52D020();
    swift_bridgeObjectRelease();
    sub_24E52D020();
    unsigned __int8 result = sub_24E52D450();
    __break(1u);
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)v1;
    *(void *)(a1 + 8) = v4;
    *(void *)(a1 + 16) = v3;
    return swift_bridgeObjectRetain();
  }
  return result;
}

FindMyMessaging::Destination_optional __swiftcall Destination.init(stringRepresentation:)(Swift::String stringRepresentation)
{
  object = stringRepresentation._object;
  uint64_t countAndFlagsBits = stringRepresentation._countAndFlagsBits;
  uint64_t v4 = v1;
  FindMyMessaging::Destination::DestinationType v5 = sub_24E52D040();
  if (v5)
  {
    uint64_t v8 = 0;
  }
  else
  {
    FindMyMessaging::Destination::DestinationType v5 = sub_24E52D040();
    if (v5)
    {
      uint64_t v8 = 1;
    }
    else
    {
      FindMyMessaging::Destination::DestinationType v5 = sub_24E52D040();
      if (v5)
      {
        uint64_t v8 = 2;
      }
      else
      {
        FindMyMessaging::Destination::DestinationType v5 = sub_24E52D040();
        if (v5)
        {
          uint64_t v8 = 3;
        }
        else
        {
          FindMyMessaging::Destination::DestinationType v5 = sub_24E52D040();
          if (v5)
          {
            uint64_t v8 = 4;
          }
          else
          {
            FindMyMessaging::Destination::DestinationType v5 = sub_24E52D040();
            if ((v5 & 1) == 0)
            {
              FindMyMessaging::Destination::DestinationType v5 = swift_bridgeObjectRelease();
              uint64_t *v4 = 0;
              v4[1] = 0;
              v4[2] = 0;
              goto LABEL_15;
            }
            uint64_t v8 = 5;
          }
        }
      }
    }
  }
  uint64_t *v4 = v8;
  v4[1] = countAndFlagsBits;
  v4[2] = (uint64_t)object;
LABEL_15:
  result.value.destination._object = v7;
  result.value.destination._uint64_t countAndFlagsBits = v6;
  result.value.uint64_t type = v5;
  return result;
}

FindMyMessaging::Destination_optional __swiftcall Destination.init(string:)(Swift::String string)
{
  unint64_t v2 = v1;
  sub_24E505664();
  char v3 = sub_24E52D270();
  uint64_t v4 = (void *)sub_24E52CFE0();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
    FindMyMessaging::Destination::DestinationType v5 = (void *)IDSCopyIDForPhoneNumber();

    if (v5)
    {
      uint64_t v9 = 1;
      goto LABEL_6;
    }
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  FindMyMessaging::Destination::DestinationType v5 = (void *)MEMORY[0x25333D750](v4);

  if (!v5)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_6:
  uint64_t v10 = sub_24E52CFF0();
  uint64_t v12 = v11;

  uint64_t *v2 = v9;
  v2[1] = v10;
  v2[2] = v12;
LABEL_9:
  result.value.destination._object = v8;
  result.value.destination._uint64_t countAndFlagsBits = v7;
  result.value.uint64_t type = v6;
  return result;
}

FindMyMessaging::Destination::DestinationType_optional __swiftcall Destination.DestinationType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 6;
  if ((unint64_t)rawValue < 6) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (FindMyMessaging::Destination::DestinationType_optional)rawValue;
}

uint64_t Destination.DestinationType.rawValue.getter()
{
  return *v0;
}

FindMyMessaging::Destination::DestinationType_optional sub_24E5054D8(Swift::Int *a1)
{
  return Destination.DestinationType.init(rawValue:)(*a1);
}

void sub_24E5054E0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24E5054EC()
{
  return sub_24E52D0A0();
}

uint64_t sub_24E50554C()
{
  return sub_24E52D050();
}

void Destination.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

FindMyMessaging::Destination __swiftcall Destination.init(email:)(Swift::String email)
{
  sub_24E5055E0(MEMORY[0x263F49E20], 0, v1);
  result.destination._object = v4;
  result.destination._uint64_t countAndFlagsBits = v3;
  result.uint64_t type = v2;
  return result;
}

FindMyMessaging::Destination __swiftcall Destination.init(phoneNumber:)(Swift::String phoneNumber)
{
  sub_24E5055E0(MEMORY[0x263F49E28], 1, v1);
  result.destination._object = v4;
  result.destination._uint64_t countAndFlagsBits = v3;
  result.uint64_t type = v2;
  return result;
}

void sub_24E5055E0(uint64_t (*a1)(void *)@<X2>, char a2@<W3>, uint64_t a3@<X8>)
{
  FindMyMessaging::Destination::DestinationType v6 = (void *)sub_24E52CFE0();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)a1(v6);

  if (v7)
  {
    uint64_t v8 = sub_24E52CFF0();
    uint64_t v10 = v9;

    *(unsigned char *)a3 = a2;
    *(void *)(a3 + 8) = v8;
    *(void *)(a3 + 16) = v10;
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_24E505664()
{
  unint64_t result = qword_2698EE6D0;
  if (!qword_2698EE6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE6D0);
  }
  return result;
}

uint64_t sub_24E5056B8(char a1)
{
  if (a1) {
    return 0x74616E6974736564;
  }
  else {
    return 1701869940;
  }
}

BOOL sub_24E5056F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24E505708()
{
  return sub_24E5056B8(*v0);
}

uint64_t sub_24E505710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E5064AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E505738()
{
  return 0;
}

void sub_24E505744(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24E505750(uint64_t a1)
{
  unint64_t v2 = sub_24E505950();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E50578C(uint64_t a1)
{
  unint64_t v2 = sub_24E505950();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Destination.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE6D8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  v11[0] = *((void *)v1 + 2);
  v11[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E505950();
  sub_24E52D680();
  char v14 = v8;
  char v13 = 0;
  sub_24E5059A4();
  sub_24E52D520();
  if (!v2)
  {
    char v12 = 1;
    sub_24E52D500();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24E505950()
{
  unint64_t result = qword_2698EE6E0;
  if (!qword_2698EE6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE6E0);
  }
  return result;
}

unint64_t sub_24E5059A4()
{
  unint64_t result = qword_2698EE6E8;
  if (!qword_2698EE6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE6E8);
  }
  return result;
}

uint64_t Destination.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE6F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E505950();
  sub_24E52D670();
  if (!v2)
  {
    char v16 = 0;
    sub_24E505BB4();
    sub_24E52D4E0();
    char v9 = v17;
    char v15 = 1;
    uint64_t v11 = sub_24E52D4C0();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)a2 = v9;
    *(void *)(a2 + 8) = v11;
    *(void *)(a2 + 16) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_24E505BB4()
{
  unint64_t result = qword_2698EE6F8;
  if (!qword_2698EE6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE6F8);
  }
  return result;
}

uint64_t sub_24E505C08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return Destination.init(from:)(a1, a2);
}

uint64_t sub_24E505C20(void *a1)
{
  return Destination.encode(to:)(a1);
}

uint64_t sub_24E505C38()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Destination.hash(into:)()
{
  sub_24E52D630();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  return swift_bridgeObjectRelease();
}

uint64_t static Destination.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (*((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2)) {
    return 1;
  }
  else {
    return sub_24E52D5A0();
  }
}

uint64_t Destination.hashValue.getter()
{
  return sub_24E52D660();
}

uint64_t sub_24E505D78()
{
  return sub_24E52D660();
}

uint64_t sub_24E505DDC()
{
  sub_24E52D630();
  return sub_24E52D010();
}

uint64_t sub_24E505E30()
{
  return sub_24E52D660();
}

unint64_t sub_24E505E94()
{
  unint64_t result = qword_2698EE700;
  if (!qword_2698EE700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE700);
  }
  return result;
}

unint64_t sub_24E505EEC()
{
  unint64_t result = qword_2698EE708;
  if (!qword_2698EE708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE708);
  }
  return result;
}

uint64_t sub_24E505F40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (*((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2)) {
    return 1;
  }
  else {
    return sub_24E52D5A0();
  }
}

uint64_t destroy for Destination()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s15FindMyMessaging11DestinationVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Destination(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
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

uint64_t assignWithTake for Destination(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Destination(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Destination(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Destination()
{
  return &type metadata for Destination;
}

unsigned char *storeEnumTagSinglePayload for Destination.DestinationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    _OWORD *result = a2 + 5;
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
        JUMPOUT(0x24E5061CCLL);
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
          _OWORD *result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Destination.DestinationType()
{
  return &type metadata for Destination.DestinationType;
}

uint64_t getEnumTagSinglePayload for Destination.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Destination.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    _OWORD *result = a2 + 1;
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
        JUMPOUT(0x24E506360);
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
          _OWORD *result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_24E506388(unsigned char *result, char a2)
{
  _OWORD *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Destination.CodingKeys()
{
  return &type metadata for Destination.CodingKeys;
}

unint64_t sub_24E5063A8()
{
  unint64_t result = qword_2698EE710;
  if (!qword_2698EE710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE710);
  }
  return result;
}

unint64_t sub_24E506400()
{
  unint64_t result = qword_2698EE718;
  if (!qword_2698EE718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE718);
  }
  return result;
}

unint64_t sub_24E506458()
{
  unint64_t result = qword_2698EE720;
  if (!qword_2698EE720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE720);
  }
  return result;
}

uint64_t sub_24E5064AC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v3 || (sub_24E52D5A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616E6974736564 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24E52D5A0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_24E506598()
{
  unint64_t result = qword_2698EE728;
  if (!qword_2698EE728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE728);
  }
  return result;
}

uint64_t sub_24E5065F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24E52D5A0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  char v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24E52D5A0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24E5066B8(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = a1;
  uint64_t v41 = sub_24E52CEC0();
  uint64_t v3 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  char v38 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE510);
  MEMORY[0x270FA5388](v43);
  char v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CorrelationIdentifier();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v42 = (uint64_t *)((char *)&v35 - v12);
  MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v35 - v14;
  uint64_t v16 = *(void *)(a2 + 16);
  if (!v16) {
    return 0;
  }
  uint64_t v17 = a2 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  uint64_t v40 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v35 = a2;
  uint64_t v36 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v18 = *(void *)(v13 + 72);
  swift_bridgeObjectRetain();
  uint64_t v37 = v15;
  while (1)
  {
    sub_24E4F963C(v17, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t v19 = &v6[*(int *)(v43 + 48)];
    sub_24E4F963C((uint64_t)v15, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    sub_24E4F963C(v44, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() != 1) {
      break;
    }
    sub_24E4F963C((uint64_t)v6, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v20 = v7;
      uint64_t v21 = v38;
      uint64_t v22 = v19;
      uint64_t v23 = v41;
      (*v36)(v38, v22, v41);
      int v39 = sub_24E52CEA0();
      char v24 = *v40;
      uint64_t v25 = v21;
      uint64_t v7 = v20;
      char v15 = v37;
      (*v40)(v25, v23);
      v24(v10, v23);
      if (v39) {
        goto LABEL_21;
      }
LABEL_16:
      sub_24E4F96A4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
      goto LABEL_5;
    }
    (*v40)(v10, v41);
LABEL_4:
    sub_24E4FB96C((uint64_t)v6, &qword_2698EE510);
LABEL_5:
    sub_24E4F96A4((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    v17 += v18;
    if (!--v16)
    {
      uint64_t v33 = 0;
      goto LABEL_22;
    }
  }
  unint64_t v26 = v42;
  sub_24E4F963C((uint64_t)v6, (uint64_t)v42, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v29 = *(void *)v19;
  uint64_t v30 = *((void *)v19 + 1);
  if (v28 != v29 || v27 != v30)
  {
    char v32 = sub_24E52D5A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRelease_n();
LABEL_21:
  sub_24E4F96A4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  sub_24E4F96A4((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  uint64_t v33 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  return v33;
}

uint64_t sub_24E506B34(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE828);
    uint64_t v2 = sub_24E52D370();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE88];
  }
  uint64_t v3 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t v8 = v2 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v10 + 1;
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v6 = (v14 - 1) & v14;
    int64_t v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t result = sub_24E52D340();
    uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      unint64_t v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v2 + 48) + 40 * v11;
    *(_OWORD *)uint64_t v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(void *)(v12 + 32) = v26;
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_24E4E0DC4();
    return v2;
  }
  uint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24E506E28(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE820);
    uint64_t v2 = sub_24E52D490();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_24E4E0D08(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24E4F7148(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_24E4F7148(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_24E4F7148(v36, v37);
    sub_24E4F7148(v37, &v33);
    uint64_t result = sub_24E52D340();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_24E4F7148(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24E4E0DC4();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24E5071F0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE820);
    uint64_t v2 = sub_24E52D490();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_24E4E0D08(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24E4F7148(v38, v37);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4D0);
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_24E4F7148(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_24E4F7148(v36, v37);
    sub_24E4F7148(v37, &v33);
    uint64_t result = sub_24E52D340();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_24E4F7148(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24E4E0DC4();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24E5075E8()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_26B1C18F8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1C18F8);
  if (qword_26B1C18E8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1C1A18);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

uint64_t sub_24E5076B0()
{
  return sub_24E52D000();
}

uint64_t LocalMessaging.serviceName.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24E50771C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 160);
  *(void *)(v2 + 160) = a1;
  *(void *)(v2 + 168) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E507730(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 176);
  *(void *)(v2 + 176) = a1;
  *(void *)(v2 + 184) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E507744(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 192);
  *(void *)(v2 + 192) = a1;
  *(void *)(v2 + 200) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E507758(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 208);
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 216) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E50776C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 224);
  *(void *)(v2 + 224) = a1;
  *(void *)(v2 + 232) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E507780(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 240);
  *(void *)(v2 + 240) = a1;
  *(void *)(v2 + 248) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E5077AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 256);
  *(void *)(v2 + 256) = a1;
  *(void *)(v2 + 264) = a2;
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E5077C0()
{
  sub_24E52CD00();
  if (!v21)
  {
    sub_24E4FB96C((uint64_t)v20, &qword_2698EE5F0);
LABEL_12:
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24E52CEF0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B1C18F8);
    int64_t v7 = sub_24E52CED0();
    os_log_type_t v8 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v9 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v8, "Missing com.apple.private.ids.registration entitlement!", v9, 2u);
      MEMORY[0x25333DD20](v9, -1, -1);
    }
    goto LABEL_31;
  }
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1) {
    goto LABEL_12;
  }
  sub_24E52CD00();
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1)
  {
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24E52CEF0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B1C18F8);
    int64_t v7 = sub_24E52CED0();
    os_log_type_t v11 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v12 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v11, "Missing com.apple.private.ids.remotecredentials entitlement!", v12, 2u);
      MEMORY[0x25333DD20](v12, -1, -1);
    }
    goto LABEL_31;
  }
  sub_24E52CD00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C19B8);
  if ((swift_dynamicCast() & 1) == 0
    || (uint64_t v2 = *(void *)(v0 + 112),
        uint64_t v1 = *(void *)(v0 + 120),
        char v3 = sub_24E5065F0(v2, v1, v19),
        swift_bridgeObjectRelease(),
        (v3 & 1) == 0))
  {
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24E52CEF0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B1C18F8);
    int64_t v7 = sub_24E52CED0();
    os_log_type_t v14 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v14))
    {
      int64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v15 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v14, "Missing com.apple.private.ids.messaging entitlement!", v15, 2u);
      MEMORY[0x25333DD20](v15, -1, -1);
    }
    goto LABEL_31;
  }
  sub_24E52CD00();
  if ((swift_dynamicCast() & 1) == 0
    || (char v4 = sub_24E5065F0(v2, v1, v19), result = swift_bridgeObjectRelease(), (v4 & 1) == 0))
  {
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_24E52CEF0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B1C18F8);
    int64_t v7 = sub_24E52CED0();
    os_log_type_t v17 = sub_24E52D1F0();
    if (os_log_type_enabled(v7, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_24E4DA000, v7, v17, "Missing com.apple.private.ids.messaging.urgent-priority entitlement!", v18, 2u);
      MEMORY[0x25333DD20](v18, -1, -1);
    }
LABEL_31:

    uint64_t result = sub_24E52D450();
    __break(1u);
  }
  return result;
}

uint64_t LocalMessaging.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_24E4E0290;
  return LocalMessaging.init(serviceName:)(a1, a2);
}

uint64_t LocalMessaging.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  v3[3] = v2;
  v3[4] = *v2;
  uint64_t v6 = *v2;
  swift_defaultActor_initialize();
  v2[17] = 0;
  v2[18] = sub_24E4E1568(MEMORY[0x263F8EE78]);
  sub_24E52CEC0();
  v3[5] = *(void *)(v6 + 80);
  v3[6] = *(void *)(v6 + 88);
  type metadata accessor for Message();
  type metadata accessor for MessageContext();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
  sub_24E52CCE0();
  swift_getTupleTypeMetadata2();
  sub_24E52D100();
  sub_24E518620((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
  v2[19] = sub_24E52CF50();
  *((_OWORD *)v2 + 10) = 0u;
  *((_OWORD *)v2 + 11) = 0u;
  *((_OWORD *)v2 + 12) = 0u;
  *((_OWORD *)v2 + 13) = 0u;
  *((_OWORD *)v2 + 14) = 0u;
  *((_OWORD *)v2 + 15) = 0u;
  *((_OWORD *)v2 + 16) = 0u;
  v2[14] = a1;
  v2[15] = a2;
  id v7 = objc_allocWithZone(MEMORY[0x263F4A0C0]);
  swift_bridgeObjectRetain();
  os_log_type_t v8 = (void *)sub_24E52CFE0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithService_, v8);

  if (v9)
  {
    v2[16] = (uint64_t)v9;
    uint64_t v10 = sub_24E50801C;
    os_log_type_t v11 = v2;
    uint64_t v12 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_24E50801C()
{
  uint64_t v18 = v0;
  uint64_t v1 = v0[3];
  uint64_t v2 = (objc_class *)type metadata accessor for MessagingDelegateTrampoline();
  uint64_t v3 = type metadata accessor for LocalMessaging();
  int v4 = swift_retain();
  id v5 = sub_24E52A1F8(v4, v2, v3, (uint64_t)&off_270053910);
  swift_release();
  uint64_t v6 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = v5;

  sub_24E5077C0();
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C18F8);
  os_log_type_t v8 = sub_24E52CED0();
  os_log_type_t v9 = sub_24E52D200();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v12 = sub_24E5076B0();
    v0[2] = sub_24E4F1740(v12, v13, &v17);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4DA000, v8, v9, "%{public}s: created.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v11, -1, -1);
    MEMORY[0x25333DD20](v10, -1, -1);
  }

  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v15 = v0[3];
  return v14(v15);
}

void sub_24E508238()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E52CF00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4A250]), sel_init);
  uint64_t v7 = *(void **)(v0 + 128);
  os_log_type_t v8 = *(void **)(v0 + 136);
  sub_24E4F6554(0, (unint64_t *)&qword_26B1C1598);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F080], v2);
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = (void *)sub_24E52D210();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v7, sel_addDelegate_withDelegateProperties_queue_, v10, v9, v11);

  id v12 = objc_msgSend(v7, sel_devices);
  if (v12)
  {
    unint64_t v13 = v12;
    sub_24E4F6554(0, &qword_26B1C15A0);
    unint64_t v14 = sub_24E52D0D0();

    uint64_t v15 = *(void **)(v1 + 136);
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = sub_24E4E11C8(v14);
      swift_bridgeObjectRelease();
      sub_24E51F054(v7, v17);
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24E52CEF0();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B1C18F8);
  uint64_t v19 = sub_24E52CED0();
  os_log_type_t v20 = sub_24E52D200();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v21 = 136446210;
    uint64_t v23 = sub_24E5076B0();
    uint64_t v25 = sub_24E4F1740(v23, v24, &v26);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4DA000, v19, v20, "%{public}s: started.", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v22, -1, -1);
    MEMORY[0x25333DD20](v21, -1, -1);
  }
  else
  {
  }
}

void sub_24E5085BC()
{
  uint64_t v1 = v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v4 = v2 + 64;
  uint64_t v3 = v5;
  uint64_t v6 = 1 << *(unsigned char *)(*(void *)(v0 + 144) + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  uint64_t v8 = v7 & v3;
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      v8 &= v8 - 1;
      goto LABEL_5;
    }
    int64_t v12 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    if (v12 >= v9) {
      goto LABEL_23;
    }
    uint64_t v13 = *(void *)(v4 + 8 * v12);
    ++v10;
    if (!v13)
    {
      int64_t v10 = v12 + 1;
      if (v12 + 1 >= v9) {
        goto LABEL_23;
      }
      uint64_t v13 = *(void *)(v4 + 8 * v10);
      if (!v13)
      {
        int64_t v10 = v12 + 2;
        if (v12 + 2 >= v9) {
          goto LABEL_23;
        }
        uint64_t v13 = *(void *)(v4 + 8 * v10);
        if (!v13)
        {
          int64_t v10 = v12 + 3;
          if (v12 + 3 >= v9) {
            goto LABEL_23;
          }
          uint64_t v13 = *(void *)(v4 + 8 * v10);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v8 = (v13 - 1) & v13;
LABEL_5:
    sub_24E52D140();
    sub_24E518620(&qword_2698EE3F0, MEMORY[0x263F8F488]);
    uint64_t v11 = (void *)swift_allocError();
    swift_retain();
    sub_24E52CF10();
    v34[9] = (uint64_t)v11;
    sub_24E52CCC0();
    swift_release();
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9)
  {
LABEL_23:
    swift_release();
    swift_beginAccess();
    *(void *)(v0 + 144) = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v15 = *(void *)(v0 + 152);
    sub_24E52CEC0();
    type metadata accessor for Message();
    type metadata accessor for MessageContext();
    swift_getTupleTypeMetadata2();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
    sub_24E52CCE0();
    sub_24E518620((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
    uint64_t v16 = nullsub_1(v15);
    uint64_t v17 = v16 + 64;
    uint64_t v18 = 1 << *(unsigned char *)(v16 + 32);
    uint64_t v19 = -1;
    if (v18 < 64) {
      uint64_t v19 = ~(-1 << v18);
    }
    uint64_t v20 = v19 & *(void *)(v16 + 64);
    int64_t v21 = (unint64_t)(v18 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v22 = 0;
    while (1)
    {
      if (v20)
      {
        v20 &= v20 - 1;
      }
      else
      {
        int64_t v24 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          goto LABEL_48;
        }
        if (v24 >= v21)
        {
LABEL_43:
          swift_release();
          swift_beginAccess();
          sub_24E52CF70();
          sub_24E52CF60();
          swift_endAccess();
          objc_msgSend(*(id *)(v1 + 128), sel_removeDelegate_, *(void *)(v1 + 136));
          if (qword_26B1C1910 != -1) {
            goto LABEL_51;
          }
          goto LABEL_44;
        }
        uint64_t v25 = *(void *)(v17 + 8 * v24);
        ++v22;
        if (!v25)
        {
          int64_t v22 = v24 + 1;
          if (v24 + 1 >= v21) {
            goto LABEL_43;
          }
          uint64_t v25 = *(void *)(v17 + 8 * v22);
          if (!v25)
          {
            int64_t v22 = v24 + 2;
            if (v24 + 2 >= v21) {
              goto LABEL_43;
            }
            uint64_t v25 = *(void *)(v17 + 8 * v22);
            if (!v25)
            {
              int64_t v26 = v24 + 3;
              if (v26 >= v21) {
                goto LABEL_43;
              }
              uint64_t v25 = *(void *)(v17 + 8 * v26);
              if (!v25)
              {
                while (1)
                {
                  int64_t v22 = v26 + 1;
                  if (__OFADD__(v26, 1)) {
                    goto LABEL_49;
                  }
                  if (v22 >= v21) {
                    goto LABEL_43;
                  }
                  uint64_t v25 = *(void *)(v17 + 8 * v22);
                  ++v26;
                  if (v25) {
                    goto LABEL_42;
                  }
                }
              }
              int64_t v22 = v26;
            }
          }
        }
LABEL_42:
        uint64_t v20 = (v25 - 1) & v25;
      }
      sub_24E52D140();
      sub_24E518620(&qword_2698EE3F0, MEMORY[0x263F8F488]);
      uint64_t v23 = (void *)swift_allocError();
      swift_retain();
      sub_24E52CF10();
      v34[0] = (uint64_t)v23;
      sub_24E52CCC0();
      swift_release();
    }
  }
  uint64_t v13 = *(void *)(v4 + 8 * v14);
  if (v13)
  {
    int64_t v10 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v10 >= v9) {
      goto LABEL_23;
    }
    uint64_t v13 = *(void *)(v4 + 8 * v10);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_50:
  __break(1u);
LABEL_51:
  swift_once();
LABEL_44:
  uint64_t v27 = sub_24E52CEF0();
  __swift_project_value_buffer(v27, (uint64_t)qword_26B1C18F8);
  uint64_t v28 = sub_24E52CED0();
  os_log_type_t v29 = sub_24E52D200();
  if (os_log_type_enabled(v28, v29))
  {
    long long v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v34[0] = v31;
    *(_DWORD *)long long v30 = 136446210;
    uint64_t v32 = sub_24E5076B0();
    sub_24E4F1740(v32, v33, v34);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E4DA000, v28, v29, "%{public}s: stopped.", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v31, -1, -1);
    MEMORY[0x25333DD20](v30, -1, -1);
  }
}

uint64_t sub_24E508C00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 128);
  uint64_t v4 = (void *)sub_24E52CFE0();
  id v5 = objc_msgSend(v3, sel_deviceForFromID_, v4);

  if (v5)
  {
    sub_24E52B650(v5, (uint64_t)v9);
    v8[6] = v9[6];
    v8[7] = v9[7];
    v8[8] = v9[8];
    v8[9] = v9[9];
    v8[2] = v9[2];
    v8[3] = v9[3];
    v8[4] = v9[4];
    v8[5] = v9[5];
    v8[0] = v9[0];
    v8[1] = v9[1];
    nullsub_1(v8);
    uint64_t v6 = v8;
  }
  else
  {
    sub_24E4F6590(v9);
    uint64_t v6 = v9;
  }
  return sub_24E4F65AC((uint64_t)v6, a1);
}

uint64_t sub_24E508CD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24E508DF0();
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    sub_24E4F6590(&v21);
    uint64_t v18 = &v21;
    return sub_24E4F65AC((uint64_t)v18, a1);
  }
  long long v4 = *(_OWORD *)(v2 + 144);
  long long v27 = *(_OWORD *)(v2 + 128);
  long long v28 = v4;
  long long v5 = *(_OWORD *)(v2 + 176);
  long long v29 = *(_OWORD *)(v2 + 160);
  long long v30 = v5;
  long long v6 = *(_OWORD *)(v2 + 80);
  long long v23 = *(_OWORD *)(v2 + 64);
  long long v24 = v6;
  long long v7 = *(_OWORD *)(v2 + 112);
  long long v25 = *(_OWORD *)(v2 + 96);
  long long v26 = v7;
  long long v8 = *(_OWORD *)(v2 + 48);
  long long v21 = *(_OWORD *)(v2 + 32);
  long long v22 = v8;
  if ((BYTE3(v29) & 1) == 0)
  {
    uint64_t v9 = 192;
    while (--v3)
    {
      int64_t v10 = (long long *)(v2 + v9);
      v9 += 160;
      long long v11 = v10[1];
      long long v21 = *v10;
      long long v22 = v11;
      long long v12 = v10[2];
      long long v13 = v10[3];
      long long v14 = v10[5];
      long long v25 = v10[4];
      long long v26 = v14;
      long long v23 = v12;
      long long v24 = v13;
      long long v15 = v10[6];
      long long v16 = v10[7];
      long long v17 = v10[9];
      long long v29 = v10[8];
      long long v30 = v17;
      long long v27 = v15;
      long long v28 = v16;
      if (BYTE3(v29)) {
        goto LABEL_6;
      }
    }
    goto LABEL_7;
  }
LABEL_6:
  sub_24E4F6614((uint64_t)&v21);
  swift_bridgeObjectRelease();
  v20[6] = v27;
  v20[7] = v28;
  unsigned char v20[8] = v29;
  v20[9] = v30;
  v20[2] = v23;
  v20[3] = v24;
  v20[4] = v25;
  v20[5] = v26;
  v20[0] = v21;
  v20[1] = v22;
  nullsub_1(v20);
  uint64_t v18 = v20;
  return sub_24E4F65AC((uint64_t)v18, a1);
}

uint64_t sub_24E508DF0()
{
  unint64_t v0 = (unint64_t)sub_24E50912C();
  unint64_t v1 = v0;
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    uint64_t v5 = MEMORY[0x263F8EE78];
    uint64_t v10 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v10)
    {
LABEL_13:
      uint64_t v11 = v5 + 32;
      swift_bridgeObjectRetain();
      uint64_t v12 = v10 - 1;
      long long v13 = (void *)MEMORY[0x263F8EE78];
      while (1)
      {
        sub_24E4F65AC(v11, (uint64_t)v26);
        sub_24E4F65AC((uint64_t)v26, (uint64_t)v27);
        if (sub_24E4F66C0((uint64_t)v27) != 1)
        {
          sub_24E4F65AC((uint64_t)v26, (uint64_t)v25);
          sub_24E4F6614((uint64_t)v25);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v13 = sub_24E4F1164(0, v13[2] + 1, 1, v13);
          }
          unint64_t v15 = v13[2];
          unint64_t v14 = v13[3];
          if (v15 >= v14 >> 1) {
            long long v13 = sub_24E4F1164((void *)(v14 > 1), v15 + 1, 1, v13);
          }
          sub_24E4F65AC((uint64_t)v26, (uint64_t)v24);
          v13[2] = v15 + 1;
          long long v16 = &v13[20 * v15];
          long long v17 = v24[1];
          v16[2] = v24[0];
          v16[3] = v17;
          long long v18 = v24[5];
          long long v20 = v24[2];
          long long v19 = v24[3];
          v16[6] = v24[4];
          v16[7] = v18;
          v16[4] = v20;
          v16[5] = v19;
          long long v21 = v24[9];
          long long v23 = v24[6];
          long long v22 = v24[7];
          v16[10] = v24[8];
          v16[11] = v21;
          v16[8] = v23;
          v16[9] = v22;
        }
        if (!v12) {
          break;
        }
        --v12;
        v11 += 160;
      }
      swift_bridgeObjectRelease_n();
      return (uint64_t)v13;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = sub_24E52D460();
  if (!v2) {
    goto LABEL_24;
  }
LABEL_3:
  *(void *)&v24[0] = MEMORY[0x263F8EE78];
  uint64_t result = sub_24E4F1DD8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)&v24[0];
    if ((v1 & 0xC000000000000001) == 0) {
      goto LABEL_6;
    }
LABEL_5:
    for (id i = (id)MEMORY[0x25333D430](v4, v1); ; id i = *(id *)(v1 + 8 * v4 + 32))
    {
      id v7 = i;
      sub_24E52B650(v7, (uint64_t)v26);

      v25[6] = v26[6];
      v25[7] = v26[7];
      v25[8] = v26[8];
      v25[9] = v26[9];
      v25[2] = v26[2];
      v25[3] = v26[3];
      v25[4] = v26[4];
      v25[5] = v26[5];
      v25[0] = v26[0];
      v25[1] = v26[1];
      nullsub_1(v25);
      sub_24E4F65AC((uint64_t)v25, (uint64_t)v27);
      *(void *)&v24[0] = v5;
      unint64_t v9 = *(void *)(v5 + 16);
      unint64_t v8 = *(void *)(v5 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_24E4F1DD8(v8 > 1, v9 + 1, 1);
        uint64_t v5 = *(void *)&v24[0];
      }
      *(void *)(v5 + 16) = v9 + 1;
      sub_24E4F65AC((uint64_t)v27, v5 + 160 * v9 + 32);
      if (v2 - 1 == v4) {
        break;
      }
      ++v4;
      if ((v1 & 0xC000000000000001) != 0) {
        goto LABEL_5;
      }
LABEL_6:
      ;
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v5 + 16);
    if (v10) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

id sub_24E50912C()
{
  if (MEMORY[0x25333CD20]()) {
    return (id)MEMORY[0x263F8EE78];
  }
  id result = objc_msgSend(*(id *)(v0 + 128), sel_devices);
  if (result)
  {
    uint64_t v2 = result;
    sub_24E4F6554(0, &qword_26B1C15A0);
    uint64_t v3 = sub_24E52D0D0();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LocalMessaging.deinit()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E4F66D8(*(void *)(v0 + 160));
  sub_24E4F66D8(*(void *)(v0 + 176));
  sub_24E4F66D8(*(void *)(v0 + 192));
  sub_24E4F66D8(*(void *)(v0 + 208));
  sub_24E4F66D8(*(void *)(v0 + 224));
  sub_24E4F66D8(*(void *)(v0 + 240));
  sub_24E4F66D8(*(void *)(v0 + 256));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LocalMessaging.__deallocating_deinit()
{
  LocalMessaging.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t LocalMessaging.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E509268()
{
  return LocalMessaging.unownedExecutor.getter();
}

uint64_t LocalMessaging.send(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v4[13] = *v3;
  v4[14] = type metadata accessor for MessagingOptions();
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Message();
  v4[17] = v5;
  v4[18] = *(void *)(v5 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E5093F4, v3, 0);
}

uint64_t sub_24E5093F4()
{
  uint64_t v84 = v0;
  uint64_t v1 = *(void *)(v0[11] + *(int *)(v0[14] + 20));
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_24E4F1DB8(0, v2, 0);
    uint64_t v4 = 0;
    uint64_t v3 = v82;
    unint64_t v5 = *(void *)(v82 + 16);
    uint64_t v6 = 16 * v5;
    do
    {
      uint64_t v7 = v1;
      uint64_t v9 = *(void *)(v1 + v4 + 40);
      uint64_t v8 = *(void *)(v1 + v4 + 48);
      uint64_t v82 = v3;
      unint64_t v10 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v10 >> 1)
      {
        sub_24E4F1DB8(v10 > 1, v5 + 1, 1);
        uint64_t v3 = v82;
      }
      *(void *)(v3 + 16) = v5 + 1;
      uint64_t v11 = v3 + v6;
      *(void *)(v11 + 32) = v9;
      *(void *)(v11 + 40) = v8;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
      uint64_t v1 = v7;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v0 = v81;
  }
  uint64_t v12 = sub_24E4F68F0(v3);
  v0[21] = v12;
  swift_bridgeObjectRelease();
  sub_24E52CD90();
  swift_allocObject();
  sub_24E52CD80();
  swift_getWitnessTable();
  uint64_t v13 = sub_24E52CD60();
  v0[22] = v13;
  v0[23] = v14;
  uint64_t v15 = v13;
  unint64_t v16 = v14;
  uint64_t v17 = v0[14];
  uint64_t v18 = v0[11];
  swift_release();
  uint64_t v19 = 0x6F707365722F7728;
  if (!*(unsigned char *)(v18 + *(int *)(v17 + 24))) {
    uint64_t v19 = 0;
  }
  unint64_t v20 = 0xE000000000000000;
  if (*(unsigned char *)(v18 + *(int *)(v17 + 24))) {
    unint64_t v20 = 0xED0000202965736ELL;
  }
  uint64_t v82 = v19;
  unint64_t v83 = v20;
  sub_24E52D020();
  swift_bridgeObjectRelease();
  unint64_t v21 = v83;
  uint64_t v22 = 0;
  switch(v16 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v15), v15))
      {
        __break(1u);
LABEL_32:
        __break(1u);
        JUMPOUT(0x24E509E90);
      }
      uint64_t v22 = HIDWORD(v15) - (int)v15;
LABEL_16:
      if (objc_msgSend(self, sel_checkMessageSize_priority_, v22, 300))
      {
        uint64_t v77 = v82;
        uint64_t v78 = v15;
        unint64_t v79 = v16;
        if (qword_26B1C1910 != -1) {
          swift_once();
        }
        uint64_t v25 = v0[20];
        uint64_t v26 = v0[17];
        uint64_t v27 = v0[18];
        uint64_t v28 = v0[16];
        uint64_t v30 = v0[10];
        uint64_t v29 = v0[11];
        uint64_t v31 = sub_24E52CEF0();
        __swift_project_value_buffer(v31, (uint64_t)qword_26B1C18F8);
        uint64_t v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
        v76(v25, v30, v26);
        sub_24E4F963C(v29, v28, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v32 = sub_24E52CED0();
        os_log_type_t v33 = sub_24E52D200();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = v0[18];
          uint64_t v35 = v0[17];
          uint64_t v71 = v0[19];
          uint64_t v72 = v0[16];
          os_log_type_t type = v33;
          uint64_t v70 = v0[20];
          uint64_t v36 = swift_slowAlloc();
          uint64_t v74 = swift_slowAlloc();
          uint64_t v82 = v74;
          *(_DWORD *)uint64_t v36 = 136316162;
          os_log_t log = v32;
          uint64_t v37 = sub_24E5076B0();
          v0[4] = sub_24E4F1740(v37, v38, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 12) = 2082;
          swift_bridgeObjectRetain();
          v0[5] = sub_24E4F1740(v77, v21, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v36 + 22) = 2082;
          v76(v71, v70, v35);
          long long v39 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
          v39(v70, v35);
          uint64_t v40 = Message.description.getter(v35);
          unint64_t v42 = v41;
          v39(v71, v35);
          v0[6] = sub_24E4F1740(v40, v42, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 32) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v43 = sub_24E52D190();
          unint64_t v45 = v44;
          swift_bridgeObjectRelease();
          v0[7] = sub_24E4F1740(v43, v45, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v36 + 42) = 2082;
          sub_24E52CEC0();
          sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
          uint64_t v46 = sub_24E52D560();
          v0[8] = sub_24E4F1740(v46, v47, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          sub_24E4F96A4(v72, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
          _os_log_impl(&dword_24E4DA000, log, type, "%s: Sending %{public}s: %{public}s to %s with identifier: %{public}s", (uint8_t *)v36, 0x34u);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v74, -1, -1);
          MEMORY[0x25333DD20](v36, -1, -1);
        }
        else
        {
          uint64_t v51 = v0[16];
          (*(void (**)(void, void))(v0[18] + 8))(v0[20], v0[17]);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          sub_24E4F96A4(v51, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        }
        unint64_t v52 = v0;
        sub_24E4F963C(v0[11], v0[15], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        uint64_t v53 = sub_24E52CED0();
        os_log_type_t v54 = sub_24E52D200();
        BOOL v55 = os_log_type_enabled(v53, v54);
        uint64_t v56 = v0[15];
        unint64_t v57 = v79;
        if (v55)
        {
          uint64_t v58 = swift_slowAlloc();
          uint64_t v80 = swift_slowAlloc();
          uint64_t v82 = v80;
          *(_DWORD *)uint64_t v58 = 136446466;
          uint64_t v59 = sub_24E5076B0();
          v0[2] = sub_24E4F1740(v59, v60, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v58 + 12) = 2080;
          MessagingOptions.dictionaryValue.getter();
          uint64_t v61 = sub_24E52CF40();
          unint64_t v63 = v62;
          swift_bridgeObjectRelease();
          v0[3] = sub_24E4F1740(v61, v63, &v82);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          sub_24E4F96A4(v56, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
          _os_log_impl(&dword_24E4DA000, v53, v54, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v58, 0x16u);
          swift_arrayDestroy();
          unint64_t v57 = v79;
          MEMORY[0x25333DD20](v80, -1, -1);
          MEMORY[0x25333DD20](v58, -1, -1);
        }
        else
        {
          sub_24E4F96A4(v0[15], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
        }

        uint64_t v64 = v0[12];
        uint64_t v65 = swift_task_alloc();
        v52[24] = v65;
        long long v66 = *((_OWORD *)v52 + 5);
        *(void *)(v65 + 16) = v64;
        *(_OWORD *)(v65 + 24) = v66;
        *(void *)(v65 + 40) = v78;
        *(void *)(v65 + 48) = v57;
        *(void *)(v65 + 56) = v12;
        char v67 = (void *)swift_task_alloc();
        v52[25] = v67;
        uint64_t v68 = sub_24E52CEC0();
        void *v67 = v52;
        v67[1] = sub_24E4E4158;
        uint64_t v69 = v52[9];
        return MEMORY[0x270F28DC8](v69, 0xD00000000000001DLL, 0x800000024E52F2B0, sub_24E5164C8, v65, v68);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24E4E010C();
        swift_allocError();
        unsigned char *v48 = 2;
        swift_willThrow();
        sub_24E4F6988(v15, v16);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v49 = (uint64_t (*)(void))v0[1];
        return v49();
      }
    case 2uLL:
      uint64_t v24 = *(void *)(v15 + 16);
      uint64_t v23 = *(void *)(v15 + 24);
      uint64_t v22 = v23 - v24;
      if (!__OFSUB__(v23, v24)) {
        goto LABEL_16;
      }
      goto LABEL_32;
    case 3uLL:
      goto LABEL_16;
    default:
      uint64_t v22 = BYTE6(v16);
      goto LABEL_16;
  }
}

uint64_t sub_24E509EA0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v40 = a6;
  uint64_t v41 = a7;
  uint64_t v38 = a1;
  uint64_t v39 = a5;
  uint64_t v34 = a3;
  uint64_t v9 = *a2;
  uint64_t v10 = type metadata accessor for MessagingOptions();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v33 = (uint64_t)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = *(void *)(v9 + 80);
  uint64_t v36 = *(void *)(v9 + 88);
  uint64_t v13 = type metadata accessor for Message();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v32 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v18 - 8);
  unint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = v20;
  uint64_t v21 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v34, v13);
  sub_24E4F963C(a4, (uint64_t)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v22 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v23 = (v15 + *(unsigned __int8 *)(v11 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v24 = (v12 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = (char *)swift_allocObject();
  *((void *)v26 + 2) = 0;
  *((void *)v26 + 3) = 0;
  uint64_t v27 = v36;
  *((void *)v26 + 4) = v37;
  *((void *)v26 + 5) = v27;
  *((void *)v26 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v26[v22], v17, v13);
  sub_24E5185B8(v33, (uint64_t)&v26[v23], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v28 = (uint64_t *)&v26[v24];
  uint64_t v30 = v39;
  unint64_t v29 = v40;
  *uint64_t v28 = v39;
  v28[1] = v29;
  *(void *)&v26[v25] = v41;
  *(void *)&v26[(v25 + 15) & 0xFFFFFFFFFFFFFFF8] = v38;
  swift_retain();
  sub_24E4FB4A0(v30, v29);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E51F518((uint64_t)v35, (uint64_t)&unk_2698EE888, (uint64_t)v26);
  return swift_release();
}

uint64_t sub_24E50A1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  void *v13 = v8;
  v13[1] = sub_24E4FBA64;
  return sub_24E50A2C8(a5, a6, a7, a8, v16, v17);
}

uint64_t sub_24E50A2C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[18] = a6;
  v7[19] = v6;
  v7[16] = a4;
  v7[17] = a5;
  v7[14] = a2;
  v7[15] = a3;
  v7[13] = a1;
  v7[20] = *v6;
  uint64_t v8 = *v6;
  v7[21] = *(void *)(*v6 + 80);
  v7[22] = *(void *)(v8 + 88);
  uint64_t v9 = type metadata accessor for Message();
  v7[23] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v7[24] = v10;
  v7[25] = *(void *)(v10 + 64);
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for MessagingOptions();
  v7[28] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v7[29] = v12;
  v7[30] = *(void *)(v12 + 64);
  v7[31] = swift_task_alloc();
  v7[32] = swift_task_alloc();
  uint64_t v13 = sub_24E52CEC0();
  v7[33] = v13;
  v7[34] = *(void *)(v13 - 8);
  v7[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50A4D8, v6, 0);
}

uint64_t sub_24E50A4D8()
{
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v21 = *(void *)(v0 + 240);
  uint64_t v17 = *(void *)(v0 + 216);
  uint64_t v18 = *(void *)(v0 + 232);
  uint64_t v19 = *(void *)(v0 + 200);
  uint64_t v26 = *(void *)(v0 + 192);
  uint64_t v16 = *(void *)(v0 + 184);
  uint64_t v5 = *(void *)(v0 + 152);
  uint64_t v25 = *(void *)(v0 + 160);
  uint64_t v6 = *(void *)(v0 + 144);
  unint64_t v23 = *(void *)(v0 + 128);
  uint64_t v24 = *(void *)(v0 + 136);
  uint64_t v7 = *(void *)(v0 + 112);
  uint64_t v22 = *(void *)(v0 + 120);
  uint64_t v15 = *(void *)(v0 + 104);
  long long v20 = *(_OWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v3);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = *(void *)(v5 + 144);
  *(void *)(v5 + 144) = 0x8000000000000000;
  sub_24E5030AC(v6, v1, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 144) = v27;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_endAccess();
  sub_24E4F963C(v7, v4, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  *(void *)(v0 + 288) = v9;
  *(void *)(v0 + 296) = (v26 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v17, v15, v16);
  unint64_t v10 = (*(unsigned __int8 *)(v18 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v11 = (v21 + *(unsigned __int8 *)(v26 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v0 + 304) = v12;
  *(_OWORD *)(v12 + 16) = v20;
  *(void *)(v12 + 32) = v5;
  *(void *)(v12 + 40) = v22;
  *(void *)(v12 + 48) = v23;
  *(void *)(v12 + 56) = v24;
  sub_24E5185B8(v4, v12 + v10, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v26 + 32))(v12 + v11, v17, v16);
  *(void *)(v12 + ((v19 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
  swift_retain();
  sub_24E4FB4A0(v22, v23);
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v13;
  void *v13 = v0;
  v13[1] = sub_24E50A7F8;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E50A7F8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = sub_24E50A920;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 152);
    swift_release();
    uint64_t v4 = sub_24E4E4E44;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E50A920()
{
  uint64_t v43 = v0;
  swift_release();
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[13];
  uint64_t v2 = (void *)v0[40];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t))v0[36];
  uint64_t v40 = v0[31];
  uint64_t v4 = v0[26];
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[14];
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C18F8);
  v3(v4, v1, v5);
  sub_24E4F963C(v6, v40, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v8 = v2;
  id v9 = v2;
  unint64_t v10 = sub_24E52CED0();
  os_log_type_t v11 = sub_24E52D200();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = (void *)v0[40];
  if (v12)
  {
    uint64_t v41 = v10;
    uint64_t v34 = (void (*)(uint64_t, uint64_t, uint64_t))v0[36];
    uint64_t v35 = v0[31];
    uint64_t v14 = v0[26];
    uint64_t v15 = v0[27];
    id v37 = (id)v0[40];
    uint64_t v17 = v0[23];
    uint64_t v16 = v0[24];
    os_log_type_t type = v11;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v36 = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v42 = v39;
    *(_DWORD *)uint64_t v18 = 136446978;
    uint64_t v19 = sub_24E5076B0();
    v0[9] = sub_24E4F1740(v19, v20, &v42);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v34(v15, v14, v17);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(v14, v17);
    uint64_t v22 = Message.description.getter(v17);
    unint64_t v24 = v23;
    v21(v15, v17);
    v0[10] = sub_24E4F1740(v22, v24, &v42);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v25 = sub_24E52D560();
    v0[11] = sub_24E4F1740(v25, v26, &v42);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v35, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    id v27 = v37;
    uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v28;
    sub_24E52D250();
    *uint64_t v36 = v28;

    _os_log_impl(&dword_24E4DA000, v41, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v36, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v39, -1, -1);
    MEMORY[0x25333DD20](v18, -1, -1);
  }
  else
  {
    uint64_t v29 = v0[31];
    (*(void (**)(void, void))(v0[24] + 8))(v0[26], v0[23]);
    sub_24E4F96A4(v29, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v30 = (void *)v0[40];
  uint64_t v31 = v0[14];
  v0[8] = v30;
  sub_24E52CCC0();
  swift_beginAccess();
  sub_24E515CDC(v31);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t LocalMessaging.send(message:metadata:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[12] = a4;
  v5[13] = v4;
  v5[10] = a2;
  v5[11] = a3;
  v5[9] = a1;
  v5[14] = *v4;
  v5[15] = type metadata accessor for MessagingOptions();
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Message();
  v5[18] = v6;
  v5[19] = *(void *)(v6 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50AFA0, v4, 0);
}

uint64_t sub_24E50AFA0()
{
  int64_t v75 = v0;
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = *(void *)(v2 + *(int *)(v1 + 20));
  int64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v73 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24E4F1DB8(0, v4, 0);
    uint64_t v6 = 0;
    uint64_t v5 = v73;
    unint64_t v7 = *(void *)(v73 + 16);
    uint64_t v8 = 16 * v7;
    do
    {
      uint64_t v10 = *(void *)(v3 + v6 + 40);
      uint64_t v9 = *(void *)(v3 + v6 + 48);
      uint64_t v73 = v5;
      unint64_t v11 = *(void *)(v5 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v11 >> 1)
      {
        sub_24E4F1DB8(v11 > 1, v7 + 1, 1);
        uint64_t v5 = v73;
      }
      *(void *)(v5 + 16) = v7 + 1;
      uint64_t v12 = v5 + v8;
      *(void *)(v12 + 32) = v10;
      *(void *)(v12 + 40) = v9;
      v8 += 16;
      v6 += 24;
      ++v7;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    uint64_t v0 = v71;
    uint64_t v1 = v71[15];
    uint64_t v2 = v71[12];
  }
  uint64_t v13 = sub_24E4F68F0(v5);
  v0[22] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = 0x6F707365722F7728;
  if (!*(unsigned char *)(v2 + *(int *)(v1 + 24))) {
    uint64_t v14 = 0;
  }
  unint64_t v15 = 0xE000000000000000;
  if (*(unsigned char *)(v2 + *(int *)(v1 + 24))) {
    unint64_t v15 = 0xED0000202965736ELL;
  }
  uint64_t v73 = v14;
  unint64_t v74 = v15;
  sub_24E52D020();
  swift_bridgeObjectRelease();
  unint64_t v16 = v74;
  uint64_t v69 = v73;
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v17 = v0[21];
  uint64_t v18 = v0[18];
  uint64_t v19 = v0[19];
  uint64_t v20 = v0[17];
  uint64_t v21 = v0[12];
  uint64_t v22 = v0[10];
  uint64_t v23 = sub_24E52CEF0();
  __swift_project_value_buffer(v23, (uint64_t)qword_26B1C18F8);
  uint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v68(v17, v22, v18);
  sub_24E4F963C(v21, v20, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_24E52CED0();
  os_log_type_t v25 = sub_24E52D200();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v27 = v0[21];
  uint64_t v72 = v13;
  if (v26)
  {
    os_log_t log = v24;
    uint64_t v28 = v0[19];
    uint64_t v63 = v0[20];
    uint64_t v29 = v0[18];
    uint64_t v64 = v0[17];
    os_log_type_t type = v25;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t v73 = v65;
    *(_DWORD *)uint64_t v30 = 136316162;
    uint64_t v31 = sub_24E5076B0();
    v0[4] = sub_24E4F1740(v31, v32, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    swift_bridgeObjectRetain();
    v0[5] = sub_24E4F1740(v69, v16, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 22) = 2082;
    v68(v63, v27, v29);
    uint64_t v33 = v0;
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v34(v27, v29);
    uint64_t v35 = Message.description.getter(v29);
    unint64_t v37 = v36;
    v34(v63, v29);
    uint64_t v0 = v33;
    v33[6] = sub_24E4F1740(v35, v37, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 32) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_24E52D190();
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    v33[7] = sub_24E4F1740(v38, v40, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 42) = 2082;
    sub_24E52CEC0();
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v41 = sub_24E52D560();
    v33[8] = sub_24E4F1740(v41, v42, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v64, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, log, type, "%s: Sending (resource) %{public}s: %{public}s to %s with identifier: %{public}s", (uint8_t *)v30, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v65, -1, -1);
    MEMORY[0x25333DD20](v30, -1, -1);
  }
  else
  {
    uint64_t v43 = v0[17];
    (*(void (**)(uint64_t, void))(v0[19] + 8))(v27, v0[18]);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    sub_24E4F96A4(v43, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  sub_24E4F963C(v0[12], v0[16], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v44 = sub_24E52CED0();
  os_log_type_t v45 = sub_24E52D200();
  BOOL v46 = os_log_type_enabled(v44, v45);
  uint64_t v47 = v0[16];
  if (v46)
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    uint64_t v73 = v70;
    *(_DWORD *)uint64_t v48 = 136446466;
    uint64_t v49 = sub_24E5076B0();
    v0[2] = sub_24E4F1740(v49, v50, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    uint64_t v51 = sub_24E52CF40();
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    v0[3] = sub_24E4F1740(v51, v53, &v73);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v47, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, v44, v45, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v70, -1, -1);
    MEMORY[0x25333DD20](v48, -1, -1);
  }
  else
  {
    sub_24E4F96A4(v0[16], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }

  os_log_type_t v54 = v0;
  uint64_t v55 = v0[13];
  uint64_t v56 = v54[12];
  uint64_t v57 = swift_task_alloc();
  v54[23] = v57;
  long long v58 = *((_OWORD *)v54 + 5);
  *(void *)(v57 + 16) = v55;
  *(_OWORD *)(v57 + 24) = v58;
  *(void *)(v57 + 40) = v56;
  *(void *)(v57 + 48) = v72;
  uint64_t v59 = (void *)swift_task_alloc();
  v54[24] = v59;
  uint64_t v60 = sub_24E52CEC0();
  *uint64_t v59 = v54;
  v59[1] = sub_24E4E5E24;
  uint64_t v61 = v54[9];
  return MEMORY[0x270F28DC8](v61, 0xD000000000000026, 0x800000024E52F2F0, sub_24E5164D8, v57, v60);
}

uint64_t sub_24E50B870(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v35 = a1;
  uint64_t v36 = a6;
  uint64_t v34 = a4;
  uint64_t v9 = *a2;
  uint64_t v10 = type metadata accessor for MessagingOptions();
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v31 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v29 = (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = *(void *)(v9 + 80);
  uint64_t v32 = *(void *)(v9 + 88);
  uint64_t v12 = type metadata accessor for Message();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = v19;
  uint64_t v20 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a3, v12);
  sub_24E4F963C(a5, (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v21 = (*(unsigned __int8 *)(v13 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v22 = (v14 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (*(unsigned __int8 *)(v31 + 80) + v22 + 8) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  unint64_t v24 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  os_log_type_t v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = 0;
  *((void *)v25 + 3) = 0;
  uint64_t v26 = v32;
  *((void *)v25 + 4) = v33;
  *((void *)v25 + 5) = v26;
  *((void *)v25 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v25[v21], v16, v12);
  *(void *)&v25[v22] = v34;
  sub_24E5185B8(v29, (uint64_t)&v25[v23], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v27 = v35;
  *(void *)&v25[v24] = v36;
  *(void *)&v25[(v24 + 15) & 0xFFFFFFFFFFFFFFF8] = v27;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E51F518((uint64_t)v30, (uint64_t)&unk_2698EE860, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_24E50BBB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  void *v13 = v8;
  v13[1] = sub_24E4FBA64;
  return sub_24E50BC88(a5, a6, a7, a8, v16);
}

uint64_t sub_24E50BC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[17] = a5;
  v6[18] = v5;
  v6[15] = a3;
  v6[16] = a4;
  v6[13] = a1;
  v6[14] = a2;
  v6[19] = *v5;
  uint64_t v7 = *v5;
  v6[20] = *(void *)(*v5 + 80);
  v6[21] = *(void *)(v7 + 88);
  uint64_t v8 = type metadata accessor for Message();
  v6[22] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[23] = v9;
  v6[24] = *(void *)(v9 + 64);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for MessagingOptions();
  v6[27] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v6[28] = v11;
  v6[29] = *(void *)(v11 + 64);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  uint64_t v12 = sub_24E52CEC0();
  v6[32] = v12;
  v6[33] = *(void *)(v12 - 8);
  v6[34] = swift_task_alloc();
  uint64_t v13 = sub_24E52CDF0();
  v6[35] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v6[36] = v14;
  v6[37] = *(void *)(v14 + 64);
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50BF08, v5, 0);
}

uint64_t sub_24E50BF08()
{
  uint64_t v43 = v0;
  sub_24E52CD90();
  swift_allocObject();
  sub_24E52CD80();
  swift_getWitnessTable();
  *(void *)(v0 + 320) = sub_24E52CD60();
  *(void *)(v0 + 328) = v1;
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t v37 = *(void *)(v0 + 288);
  uint64_t v39 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 264);
  os_log_t log = *(os_log_t *)(v0 + 256);
  swift_release();
  uint64_t v5 = NSTemporaryDirectory();
  sub_24E52CFF0();

  sub_24E52CDB0();
  swift_bridgeObjectRelease();
  sub_24E52CEB0();
  sub_24E52CE90();
  uint64_t v6 = *(void (**)(uint64_t, os_log_t))(v4 + 8);
  v6(v3, log);
  sub_24E52CDD0();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  *(void *)(v0 + 336) = v7;
  *(void *)(v0 + 344) = (v37 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v2, v39);
  sub_24E52CE30();
  uint64_t v24 = *(void *)(v0 + 312);
  uint64_t v33 = *(void *)(v0 + 304);
  uint64_t v8 = *(void *)(v0 + 288);
  uint64_t v26 = *(void *)(v0 + 296);
  uint64_t v9 = *(void *)(v0 + 272);
  uint64_t v36 = *(void *)(v0 + 280);
  uint64_t v10 = *(NSObject **)(v0 + 256);
  uint64_t v40 = *(void *)(v0 + 248);
  uint64_t v28 = *(void *)(v0 + 232);
  uint64_t v25 = *(void *)(v0 + 224);
  uint64_t v38 = *(void *)(v0 + 208);
  uint64_t v27 = *(void *)(v0 + 192);
  uint64_t v34 = *(void *)(v0 + 184);
  uint64_t v41 = *(void *)(v0 + 176);
  uint64_t v11 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 136);
  uint64_t v31 = *(void *)(v0 + 128);
  uint64_t v32 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 120);
  uint64_t v30 = *(void *)(v0 + 112);
  uint64_t v23 = *(void *)(v0 + 104);
  long long v29 = *(_OWORD *)(v0 + 160);
  (*(void (**)(uint64_t, uint64_t, NSObject *))(*(void *)(v0 + 264) + 16))(v9, v13, v10);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v42 = *(void *)(v11 + 144);
  *(void *)(v11 + 144) = 0x8000000000000000;
  sub_24E5030AC(v12, v9, isUniquelyReferenced_nonNull_native);
  *(void *)(v11 + 144) = v42;
  swift_bridgeObjectRelease();
  v6(v9, v10);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v33, v24, v36);
  sub_24E4F963C(v13, v40, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v38, v23, v41);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v16 = (v26 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = (v16 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (*(unsigned __int8 *)(v25 + 80) + v17 + 8) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  unint64_t v19 = (v28 + *(unsigned __int8 *)(v34 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v0 + 352) = v20;
  *(_OWORD *)(v20 + 16) = v29;
  *(void *)(v20 + 32) = v11;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32))(v20 + v15, v33, v36);
  *(void *)(v20 + v16) = v30;
  *(void *)(v20 + v17) = v31;
  sub_24E5185B8(v40, v20 + v18, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v34 + 32))(v20 + v19, v38, v41);
  *(void *)(v20 + ((v27 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v32;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v21;
  void *v21 = v0;
  v21[1] = sub_24E50C900;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E50C900()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 368) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 144);
  swift_release();
  if (v0) {
    uint64_t v4 = sub_24E50CB14;
  }
  else {
    uint64_t v4 = sub_24E50CA48;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E50CA48()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[42];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[35];
  sub_24E4F6988(v0[40], v0[41]);
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24E50CB14()
{
  uint64_t v42 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[42];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[35];
  sub_24E4F6988(v0[40], v0[41]);
  v1(v2, v3);
  uint64_t v4 = (void *)v0[46];
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[30];
  uint64_t v7 = v0[25];
  uint64_t v8 = v0[22];
  uint64_t v9 = v0[23];
  uint64_t v10 = v0[15];
  uint64_t v11 = sub_24E52CEF0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B1C18F8);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v40(v7, v5, v8);
  sub_24E4F963C(v10, v6, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v12 = v4;
  id v13 = v4;
  uint64_t v14 = sub_24E52CED0();
  os_log_type_t v15 = sub_24E52D200();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v35 = v0[30];
    uint64_t v16 = v0[25];
    uint64_t v34 = v0[26];
    uint64_t v17 = v0[22];
    uint64_t v18 = v0[23];
    os_log_type_t type = v15;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v37 = (void *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v41 = v39;
    *(_DWORD *)uint64_t v19 = 136446978;
    os_log_t log = v14;
    uint64_t v20 = sub_24E5076B0();
    v0[8] = sub_24E4F1740(v20, v21, &v41);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    v40(v34, v16, v17);
    unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v22(v16, v17);
    uint64_t v23 = Message.description.getter(v17);
    unint64_t v25 = v24;
    v22(v34, v17);
    v0[12] = sub_24E4F1740(v23, v25, &v41);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v26 = sub_24E52D560();
    v0[10] = sub_24E4F1740(v26, v27, &v41);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v35, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v19 + 32) = 2114;
    id v28 = v4;
    uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v29;
    sub_24E52D250();
    *uint64_t v37 = v29;

    _os_log_impl(&dword_24E4DA000, log, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v19, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v37, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v39, -1, -1);
    MEMORY[0x25333DD20](v19, -1, -1);
  }
  else
  {
    uint64_t v30 = v0[30];
    (*(void (**)(void, void))(v0[23] + 8))(v0[25], v0[22]);
    sub_24E4F96A4(v30, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v31 = v0[15];
  v0[9] = v4;
  sub_24E52CCC0();
  swift_beginAccess();
  sub_24E515CDC(v31);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t LocalMessaging.sendWithResponse(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = type metadata accessor for Message();
  type metadata accessor for MessageContext();
  v5[8] = swift_getTupleTypeMetadata2();
  v5[9] = swift_task_alloc();
  v5[10] = type metadata accessor for MessagingOptions();
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50D170, v4, 0);
}

uint64_t sub_24E50D170()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[10];
  sub_24E4F963C(v0[5], v2, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(unsigned char *)(v2 + *(int *)(v3 + 24)) = 1;
  sub_24E4F963C(v2, v1, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v4 = *(void *)(v1 + *(int *)(v3 + 20));
  if (*(void *)(v4 + 16) == 1 && *(unsigned __int8 *)(v4 + 32) - 2 <= 2)
  {
    uint64_t v5 = v0[11];
    uint64_t v6 = v0[6];
    uint64_t v7 = v0[4];
    uint64_t v8 = (void *)swift_task_alloc();
    v0[13] = v8;
    v8[2] = v6;
    v8[3] = v7;
    v8[4] = v5;
    uint64_t v9 = (void *)swift_task_alloc();
    v0[14] = v9;
    void *v9 = v0;
    v9[1] = sub_24E50D388;
    uint64_t v11 = v0[8];
    uint64_t v10 = v0[9];
    return MEMORY[0x270F28DC8](v10, 0xD000000000000029, 0x800000024E52F320, sub_24E5164E8, v8, v11);
  }
  else
  {
    sub_24E4E010C();
    swift_allocError();
    *id v12 = 1;
    swift_willThrow();
    uint64_t v13 = v0[11];
    sub_24E4F96A4(v0[12], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    sub_24E4F96A4(v13, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_24E50D388()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_24E4E8098;
  }
  else {
    uint64_t v4 = sub_24E50D4D0;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E50D4D0()
{
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[7];
  uint64_t v6 = v0[2];
  uint64_t v5 = v0[3];
  sub_24E4F96A4(v0[12], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  sub_24E4F96A4(v1, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v7 = v2 + *(int *)(v3 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v6, v2, v4);
  sub_24E5185B8(v7, v5, (uint64_t (*)(void))type metadata accessor for MessageContext);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24E50D5F4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v27 = a1;
  uint64_t v6 = *a2;
  uint64_t v7 = type metadata accessor for MessagingOptions();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v26 = *(void *)(v6 + 80);
  uint64_t v25 = *(void *)(v6 + 88);
  uint64_t v10 = type metadata accessor for Message();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v24 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v24, v10);
  sub_24E4F963C(a4, (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v20 = (v12 + *(unsigned __int8 *)(v8 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  uint64_t v22 = v25;
  *((void *)v21 + 4) = v26;
  *((void *)v21 + 5) = v22;
  *((void *)v21 + 6) = a2;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v21[v19], v14, v10);
  sub_24E5185B8((uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)&v21[v20], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)&v21[(v9 + v20 + 7) & 0xFFFFFFFFFFFFFFF8] = v27;
  swift_retain();
  swift_retain();
  sub_24E51F518((uint64_t)v17, (uint64_t)&unk_2698EE838, (uint64_t)v21);
  return swift_release();
}

uint64_t sub_24E50D8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v11;
  *uint64_t v11 = v7;
  v11[1] = sub_24E4FBA64;
  return sub_24E50D9B0(a5, a6, a7);
}

uint64_t sub_24E50D9B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[19] = *v3;
  uint64_t v5 = *v3;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  v4[20] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[21] = v7;
  v4[22] = *(void *)(v7 + 64);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v4[25] = *(void *)(v5 + 80);
  v4[26] = *(void *)(v5 + 88);
  uint64_t v8 = type metadata accessor for Message();
  v4[27] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[28] = v9;
  v4[29] = *(void *)(v9 + 64);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  uint64_t v10 = sub_24E52CEC0();
  v4[32] = v10;
  v4[33] = *(void *)(v10 - 8);
  v4[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50DBC0, v3, 0);
}

uint64_t sub_24E50DBC0()
{
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v22 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 216);
  uint64_t v16 = *(void *)(v0 + 248);
  uint64_t v17 = *(void *)(v0 + 192);
  uint64_t v20 = *(void *)(v0 + 176);
  uint64_t v18 = *(void *)(v0 + 168);
  uint64_t v23 = *(void *)(v0 + 152);
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 136);
  uint64_t v15 = *(void *)(v0 + 120);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  *(void *)(v0 + 280) = v8;
  *(void *)(v0 + 288) = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  long long v19 = *(_OWORD *)(v0 + 200);
  v8(v2, v7, v3);
  *(void *)(v0 + 80) = v6;
  swift_beginAccess();
  type metadata accessor for MessageContext();
  swift_retain();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
  sub_24E52CCE0();
  sub_24E518620((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
  *(void *)(v0 + 296) = sub_24E52CF70();
  sub_24E52CF90();
  swift_endAccess();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 304) = v9;
  *(void *)(v0 + 312) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v16, v15, v5);
  sub_24E4F963C(v7, v17, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v11 = (v22 + *(unsigned __int8 *)(v18 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v0 + 320) = v12;
  *(_OWORD *)(v12 + 16) = v19;
  *(void *)(v12 + 32) = v21;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v12 + v10, v16, v5);
  sub_24E5185B8(v17, v12 + v11, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)(v12 + ((v20 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v23;
  swift_retain();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v13;
  void *v13 = v0;
  v13[1] = sub_24E50DF0C;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E50DF0C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 336) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 144);
    uint64_t v4 = sub_24E50E034;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 144);
    swift_release();
    uint64_t v4 = sub_24E4E8B90;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E50E034()
{
  BOOL v46 = v0;
  swift_release();
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[15];
  uint64_t v2 = (void *)v0[42];
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t))v0[38];
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v43 = v0[23];
  uint64_t v6 = v0[16];
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C18F8);
  v3(v4, v1, v5);
  sub_24E4F963C(v6, v43, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v8 = v2;
  id v9 = v2;
  unint64_t v10 = sub_24E52CED0();
  os_log_type_t v11 = sub_24E52D200();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v13 = (void *)v0[42];
  if (v12)
  {
    uint64_t v44 = v10;
    uint64_t v37 = (void (*)(uint64_t, uint64_t, uint64_t))v0[38];
    uint64_t v14 = v0[31];
    uint64_t v15 = v0[30];
    id v40 = (id)v0[42];
    uint64_t v17 = v0[27];
    uint64_t v16 = v0[28];
    uint64_t v38 = v0[23];
    os_log_type_t type = v11;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v39 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v45 = v42;
    *(_DWORD *)uint64_t v18 = 136446978;
    uint64_t v19 = sub_24E5076B0();
    v0[11] = sub_24E4F1740(v19, v20, &v45);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v37(v14, v15, v17);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(v15, v17);
    uint64_t v22 = Message.description.getter(v17);
    unint64_t v24 = v23;
    v21(v14, v17);
    v0[12] = sub_24E4F1740(v22, v24, &v45);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v25 = sub_24E52D560();
    v0[13] = sub_24E4F1740(v25, v26, &v45);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v38, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    id v27 = v40;
    uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v28;
    sub_24E52D250();
    void *v39 = v28;

    _os_log_impl(&dword_24E4DA000, v44, type, "%{public}s: Failed to send message (with response) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v39, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v42, -1, -1);
    MEMORY[0x25333DD20](v18, -1, -1);
  }
  else
  {
    uint64_t v29 = v0[23];
    (*(void (**)(void, void))(v0[28] + 8))(v0[30], v0[27]);
    sub_24E4F96A4(v29, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v30 = (void *)v0[42];
  uint64_t v32 = v0[34];
  uint64_t v31 = (void (*)(uint64_t, uint64_t, uint64_t))v0[35];
  uint64_t v33 = v0[32];
  uint64_t v34 = v0[16];
  v0[8] = v30;
  sub_24E52CCC0();
  v31(v32, v34, v33);
  v0[9] = 0;
  swift_beginAccess();
  sub_24E52CF90();
  swift_endAccess();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t LocalMessaging.send(dictionary:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[11] = *v3;
  v4[12] = type metadata accessor for MessagingOptions();
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50E634, v3, 0);
}

uint64_t sub_24E50E634()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void *)(v0[9] + *(int *)(v0[12] + 20));
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_24E4F1DB8(0, v2, 0);
    uint64_t v4 = 0;
    uint64_t v3 = v48;
    unint64_t v5 = *(void *)(v48 + 16);
    uint64_t v6 = 16 * v5;
    do
    {
      uint64_t v8 = *(void *)(v1 + v4 + 40);
      uint64_t v7 = *(void *)(v1 + v4 + 48);
      uint64_t v48 = v3;
      unint64_t v9 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v9 >> 1)
      {
        sub_24E4F1DB8(v9 > 1, v5 + 1, 1);
        uint64_t v3 = v48;
      }
      *(void *)(v3 + 16) = v5 + 1;
      uint64_t v10 = v3 + v6;
      *(void *)(v10 + 32) = v8;
      *(void *)(v10 + 40) = v7;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v0 = v47;
  }
  uint64_t v11 = sub_24E4F68F0(v3);
  v0[15] = v11;
  swift_bridgeObjectRelease();
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v12 = v0[14];
  uint64_t v13 = v0[9];
  uint64_t v14 = sub_24E52CEF0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B1C18F8);
  sub_24E4F963C(v13, v12, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_24E52CED0();
  os_log_type_t v16 = sub_24E52D200();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v18 = v0[14];
  if (v17)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v48 = v45;
    *(_DWORD *)uint64_t v19 = 136315650;
    uint64_t v20 = sub_24E5076B0();
    v0[4] = sub_24E4F1740(v20, v21, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_24E52D190();
    unint64_t v24 = v23;
    swift_bridgeObjectRelease();
    v0[5] = sub_24E4F1740(v22, v24, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 2082;
    sub_24E52CEC0();
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v25 = sub_24E52D560();
    v0[6] = sub_24E4F1740(v25, v26, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v18, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, v15, v16, "%s: Sending raw dictionary to %s with identifier: %{public}s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v45, -1, -1);
    MEMORY[0x25333DD20](v19, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_24E4F96A4(v18, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  sub_24E4F963C(v0[9], v0[13], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v27 = sub_24E52CED0();
  os_log_type_t v28 = sub_24E52D200();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v30 = v0[13];
  if (v29)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v48 = v46;
    *(_DWORD *)uint64_t v31 = 136446466;
    uint64_t v32 = sub_24E5076B0();
    v0[2] = sub_24E4F1740(v32, v33, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    uint64_t v34 = sub_24E52CF40();
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    v0[3] = sub_24E4F1740(v34, v36, &v48);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v30, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, v27, v28, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v46, -1, -1);
    MEMORY[0x25333DD20](v31, -1, -1);
  }
  else
  {
    sub_24E4F96A4(v0[13], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }

  uint64_t v37 = v0;
  uint64_t v38 = v0[10];
  uint64_t v39 = swift_task_alloc();
  v37[16] = v39;
  long long v40 = *((_OWORD *)v37 + 4);
  *(void *)(v39 + 16) = v38;
  *(void *)(v39 + 24) = v11;
  *(_OWORD *)(v39 + 32) = v40;
  uint64_t v41 = (void *)swift_task_alloc();
  v37[17] = v41;
  uint64_t v42 = sub_24E52CEC0();
  *uint64_t v41 = v37;
  v41[1] = sub_24E4E98C0;
  uint64_t v43 = v37[7];
  return MEMORY[0x270F28DC8](v43, 0xD000000000000020, 0x800000024E52F350, sub_24E5164F4, v39, v42);
}

uint64_t sub_24E50ECD4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = type metadata accessor for MessagingOptions();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v14 - 8);
  os_log_type_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24E52D160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_24E4F963C(a5, (uint64_t)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v18 = (*(unsigned __int8 *)(v12 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = *(void *)(v10 + 80);
  v19[5] = *(void *)(v10 + 88);
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4;
  sub_24E5185B8((uint64_t)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v19 + v18, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)((char *)v19 + ((v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E51F518((uint64_t)v16, (uint64_t)&unk_2698EE800, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_24E50EF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  void *v13 = v8;
  v13[1] = sub_24E4FBA64;
  return sub_24E50EFD8(a5, a6, a7, a8);
}

uint64_t sub_24E50EFD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v5[17] = *v4;
  v5[18] = *v4;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  v5[19] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[20] = v7;
  v5[21] = *(void *)(v7 + 64);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  uint64_t v8 = sub_24E52CEC0();
  v5[24] = v8;
  v5[25] = *(void *)(v8 - 8);
  v5[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50F164, v4, 0);
}

uint64_t sub_24E50F164()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v13 = v0[23];
  uint64_t v14 = v0[20];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[16];
  uint64_t v7 = v0[14];
  uint64_t v6 = v0[15];
  uint64_t v15 = v0[21];
  uint64_t v16 = v0[13];
  uint64_t v17 = v0[12];
  uint64_t v18 = v0[17];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v7, v3);
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v19 = *(void *)(v5 + 144);
  *(void *)(v5 + 144) = 0x8000000000000000;
  sub_24E5030AC(v6, v2, isUniquelyReferenced_nonNull_native);
  *(void *)(v5 + 144) = v19;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_endAccess();
  sub_24E4F963C(v7, v13, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  unint64_t v9 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v10 = (void *)swift_allocObject();
  v0[27] = v10;
  v10[2] = *(void *)(v4 + 80);
  v10[3] = *(void *)(v4 + 88);
  v10[4] = v5;
  v10[5] = v16;
  v10[6] = v17;
  sub_24E5185B8(v13, (uint64_t)v10 + v9, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  *(void *)((char *)v10 + ((v15 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[28] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24E50F3D8;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E50F3D8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 128);
    uint64_t v4 = sub_24E50F500;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 128);
    swift_release();
    uint64_t v4 = sub_24E4EA2DC;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E50F500()
{
  unint64_t v26 = v0;
  swift_release();
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[29];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[14];
  uint64_t v4 = sub_24E52CEF0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B1C18F8);
  sub_24E4F963C(v3, v2, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v5 = v1;
  id v6 = v1;
  uint64_t v7 = sub_24E52CED0();
  os_log_type_t v8 = sub_24E52D200();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[29];
  if (v9)
  {
    uint64_t v23 = v0[22];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = v24;
    *(_DWORD *)uint64_t v11 = 136446722;
    uint64_t v13 = sub_24E5076B0();
    v0[9] = sub_24E4F1740(v13, v14, &v25);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v15 = sub_24E52D560();
    v0[10] = sub_24E4F1740(v15, v16, &v25);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v23, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    *(_WORD *)(v11 + 22) = 2114;
    id v17 = v10;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v18;
    sub_24E52D250();
    *uint64_t v12 = v18;

    _os_log_impl(&dword_24E4DA000, v7, v8, "%{public}s: Failed to send raw dictionary with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v11, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v24, -1, -1);
    MEMORY[0x25333DD20](v11, -1, -1);
  }
  else
  {
    sub_24E4F96A4(v0[22], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  uint64_t v19 = (void *)v0[29];
  uint64_t v20 = v0[14];
  v0[8] = v19;
  sub_24E52CCC0();
  swift_beginAccess();
  sub_24E515CDC(v20);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_24E50F8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  _OWORD v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[7] = a2;
  uint64_t v9 = type metadata accessor for Message();
  v8[14] = v9;
  v8[15] = *(void *)(v9 - 8);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  v8[18] = swift_task_alloc();
  uint64_t v10 = sub_24E52CEC0();
  v8[19] = v10;
  v8[20] = *(void *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E50FAB0, 0, 0);
}

uint64_t sub_24E50FAB0()
{
  unint64_t v62 = v0;
  v61[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[10];
  uint64_t v2 = *(void **)(v0[7] + 128);
  uint64_t v3 = (void *)sub_24E52CE10();
  sub_24E506B34(v1);
  uint64_t v4 = (void *)sub_24E52D170();
  swift_bridgeObjectRelease();
  unint64_t v5 = MessagingOptions.dictionaryValue.getter();
  sub_24E506E28(v5);
  swift_bridgeObjectRelease();
  id v6 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendData_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  uint64_t v7 = (void *)v0[3];
  os_log_type_t v8 = (void *)v0[2];
  if (!v2)
  {
    id v14 = v7;
    id v15 = v8;
    sub_24E52CDA0();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    goto LABEL_9;
  }
  if (!v8)
  {
    id v16 = v7;
    goto LABEL_7;
  }
  uint64_t v9 = v0[19];
  uint64_t v10 = v0[20];
  uint64_t v11 = v0[18];
  sub_24E52CFF0();
  id v12 = v7;
  id v13 = v8;
  sub_24E52CE80();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_24E4FB96C(v0[18], &qword_26B1C1770);
LABEL_7:
    sub_24E4E010C();
    swift_allocError();
    *id v17 = 0;
    goto LABEL_8;
  }
  uint64_t v60 = v13;
  (*(void (**)(void, void, void))(v0[20] + 32))(v0[22], v0[18], v0[19]);
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v20 = v0[20];
  os_log_t log = (os_log_t)v0[21];
  uint64_t v58 = v0[22];
  uint64_t v21 = v0[19];
  uint64_t v22 = v0[17];
  uint64_t v24 = v0[14];
  uint64_t v23 = v0[15];
  uint64_t v25 = v0[12];
  uint64_t v26 = sub_24E52CEF0();
  __swift_project_value_buffer(v26, (uint64_t)qword_26B1C18F8);
  uint64_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  v55(v22, v25, v24);
  (*(void (**)(os_log_t, uint64_t, uint64_t))(v20 + 16))(log, v58, v21);
  uint64_t v27 = sub_24E52CED0();
  os_log_type_t v28 = sub_24E52D200();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v31 = v0[21];
  uint64_t v30 = v0[22];
  uint64_t v33 = v0[19];
  uint64_t v32 = v0[20];
  uint64_t v34 = v0[17];
  if (v29)
  {
    uint64_t v50 = v0[20];
    uint64_t v51 = v0[21];
    uint64_t v52 = v0[19];
    uint64_t v35 = v0[15];
    uint64_t v36 = v0[16];
    os_log_t loga = v27;
    uint64_t v59 = v0[22];
    uint64_t v37 = v0[14];
    uint64_t v38 = swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    v61[0] = v54;
    *(_DWORD *)uint64_t v38 = 136446722;
    os_log_type_t type = v28;
    uint64_t v39 = sub_24E5076B0();
    v0[4] = sub_24E4F1740(v39, v40, v61);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2082;
    v55(v36, v34, v37);
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v41(v34, v37);
    uint64_t v42 = Message.description.getter(v37);
    unint64_t v44 = v43;
    v41(v36, v37);
    v0[5] = sub_24E4F1740(v42, v44, v61);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 22) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v45 = sub_24E52D560();
    v0[6] = sub_24E4F1740(v45, v46, v61);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    v47(v51, v52);
    _os_log_impl(&dword_24E4DA000, loga, type, "%{public}s: Sent message %{public}s with identifier: %{public}s", (uint8_t *)v38, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v54, -1, -1);
    MEMORY[0x25333DD20](v38, -1, -1);

    uint64_t v48 = v59;
    uint64_t v49 = v52;
  }
  else
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);

    uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v47(v31, v33);
    uint64_t v48 = v30;
    uint64_t v49 = v33;
  }
  v47(v48, v49);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
LABEL_9:
  return v18();
}

uint64_t sub_24E510110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[13] = a7;
  v8[14] = a8;
  _OWORD v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[8] = a2;
  uint64_t v9 = type metadata accessor for Message();
  v8[15] = v9;
  v8[16] = *(void *)(v9 - 8);
  v8[17] = swift_task_alloc();
  v8[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  v8[19] = swift_task_alloc();
  uint64_t v10 = sub_24E52CEC0();
  v8[20] = v10;
  v8[21] = *(void *)(v10 - 8);
  v8[22] = swift_task_alloc();
  v8[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E5102E4, 0, 0);
}

uint64_t sub_24E5102E4()
{
  uint64_t v68 = v0;
  v67[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[10];
  uint64_t v3 = *(void **)(v0[8] + 128);
  uint64_t v4 = (void *)sub_24E52CDC0();
  sub_24E5071F0(v2);
  unint64_t v5 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  sub_24E506B34(v1);
  id v6 = (void *)sub_24E52D170();
  swift_bridgeObjectRelease();
  unint64_t v7 = MessagingOptions.dictionaryValue.getter();
  sub_24E506E28(v7);
  swift_bridgeObjectRelease();
  os_log_type_t v8 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  unsigned int v9 = objc_msgSend(v3, sel_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_, v4, v5, v6, 300, v8, v0 + 2, v0 + 3);

  uint64_t v10 = (void *)v0[3];
  id v11 = (id)v0[2];
  if (!v9)
  {
    id v17 = v10;
    id v11 = v11;
    sub_24E52CDA0();

LABEL_8:
    swift_willThrow();
LABEL_9:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = (uint64_t (*)(void))v0[1];
    goto LABEL_10;
  }
  if (!v11)
  {
    id v18 = v10;
    goto LABEL_7;
  }
  uint64_t v12 = v0[20];
  uint64_t v13 = v0[21];
  uint64_t v14 = v0[19];
  sub_24E52CFF0();
  id v15 = v10;
  id v16 = v11;
  sub_24E52CE80();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
  {
    sub_24E4FB96C(v0[19], &qword_26B1C1770);
LABEL_7:
    sub_24E4E010C();
    swift_allocError();
    unsigned char *v19 = 0;
    goto LABEL_8;
  }
  long long v66 = v16;
  (*(void (**)(void, void, void))(v0[21] + 32))(v0[23], v0[19], v0[20]);
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v22 = v0[22];
  *(void *)os_log_type_t type = v0[23];
  uint64_t v23 = v0[20];
  uint64_t v24 = v0[21];
  uint64_t v25 = v0[18];
  uint64_t v27 = v0[15];
  uint64_t v26 = v0[16];
  uint64_t v28 = v0[13];
  uint64_t v29 = sub_24E52CEF0();
  __swift_project_value_buffer(v29, (uint64_t)qword_26B1C18F8);
  uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  v63(v25, v28, v27);
  (*(void (**)(uint64_t, os_log_type_t *, uint64_t))(v24 + 16))(v22, *(os_log_type_t **)type, v23);
  uint64_t v30 = sub_24E52CED0();
  os_log_type_t v31 = sub_24E52D200();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v34 = v0[21];
  uint64_t v33 = v0[22];
  uint64_t v35 = v0[20];
  uint64_t v36 = v0[18];
  if (v32)
  {
    uint64_t v59 = v0[20];
    os_log_type_t typea = v31;
    uint64_t v60 = v0[22];
    uint64_t v38 = v0[16];
    uint64_t v37 = v0[17];
    os_log_t log = v30;
    uint64_t v39 = v0[15];
    uint64_t v40 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    v67[0] = v61;
    *(_DWORD *)uint64_t v40 = 136446722;
    uint64_t v41 = sub_24E5076B0();
    v0[5] = sub_24E4F1740(v41, v42, v67);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2082;
    v63(v37, v36, v39);
    unint64_t v43 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    v43(v36, v39);
    uint64_t v44 = Message.description.getter(v39);
    unint64_t v46 = v45;
    v43(v37, v39);
    v0[6] = sub_24E4F1740(v44, v46, v67);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 22) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v47 = sub_24E52D560();
    v0[7] = sub_24E4F1740(v47, v48, v67);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v49(v60, v59);
    uint64_t v30 = log;
    _os_log_impl(&dword_24E4DA000, log, typea, "%{public}s: Sent message (resource) %{public}s with identifier: %{public}s", (uint8_t *)v40, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v61, -1, -1);
    MEMORY[0x25333DD20](v40, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v0[16] + 8))(v0[18], v0[15]);
    uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v49(v33, v35);
  }

  id v50 = objc_msgSend(self, sel_defaultManager);
  uint64_t v51 = (void *)sub_24E52CDC0();
  v0[4] = 0;
  unsigned int v52 = objc_msgSend(v50, sel_removeItemAtURL_error_, v51, v0 + 4);

  unint64_t v53 = (void *)v0[4];
  uint64_t v54 = v0[23];
  if (!v52)
  {
    uint64_t v57 = v0[20];
    id v58 = v53;
    sub_24E52CDA0();

    swift_willThrow();
    v49(v54, v57);
    id v11 = v66;
    goto LABEL_9;
  }
  uint64_t v55 = v0[20];
  id v56 = v53;
  v49(v54, v55);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
LABEL_10:
  return v20();
}

uint64_t sub_24E510A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a3;
  type metadata accessor for MessagingOptions();
  v5[8] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Message();
  v5[9] = v8;
  v5[10] = *(void *)(v8 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  uint64_t v9 = sub_24E52CEC0();
  v5[13] = v9;
  v5[14] = *(void *)(v9 - 8);
  uint64_t v10 = swift_task_alloc();
  v5[15] = v10;
  id v11 = (void *)swift_task_alloc();
  v5[16] = v11;
  *id v11 = v5;
  v11[1] = sub_24E510C04;
  return LocalMessaging.send(message:messageOptions:)(v10, a3, a4);
}

uint64_t sub_24E510C04()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24E4EBEB0;
  }
  else
  {
    (*(void (**)(void, void))(v2[14] + 8))(v2[15], v2[13]);
    uint64_t v3 = sub_24E510D30;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24E510D30()
{
  uint64_t v33 = v0;
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[6];
  uint64_t v7 = sub_24E52CEF0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1C18F8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v8(v2, v1, v3);
  sub_24E4F963C(v6, v5, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v9 = sub_24E52CED0();
  os_log_type_t v10 = sub_24E52D200();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v27 = v8;
    uint64_t v11 = v0[11];
    uint64_t v26 = v0[12];
    os_log_t log = v9;
    uint64_t v13 = v0[9];
    uint64_t v12 = v0[10];
    uint64_t v28 = v0[8];
    os_log_type_t type = v10;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v32 = v29;
    *(_DWORD *)uint64_t v14 = 136446722;
    uint64_t v15 = sub_24E5076B0();
    v0[2] = sub_24E4F1740(v15, v16, &v32);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    v27(v11, v26, v13);
    id v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v26, v13);
    uint64_t v18 = Message.description.getter(v13);
    unint64_t v20 = v19;
    v17(v11, v13);
    v0[3] = sub_24E4F1740(v18, v20, &v32);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v21 = sub_24E52D560();
    v0[4] = sub_24E4F1740(v21, v22, &v32);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    sub_24E4F96A4(v28, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_24E4DA000, log, type, "%{public}s: Sent message (with response) %{public}s with identifier: %{public}s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v29, -1, -1);
    MEMORY[0x25333DD20](v14, -1, -1);
  }
  else
  {
    uint64_t v23 = v0[8];
    (*(void (**)(void, void))(v0[10] + 8))(v0[12], v0[9]);
    sub_24E4F96A4(v23, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_24E51110C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a3;
  v6[8] = a4;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  v6[11] = swift_task_alloc();
  uint64_t v7 = sub_24E52CEC0();
  v6[12] = v7;
  v6[13] = *(void *)(v7 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E511240, 0, 0);
}

uint64_t sub_24E511240()
{
  unint64_t v42 = v0;
  v41[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[8];
  uint64_t v2 = *(void **)(v0[6] + 128);
  sub_24E5071F0(v0[7]);
  uint64_t v3 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  sub_24E506B34(v1);
  uint64_t v4 = (void *)sub_24E52D170();
  swift_bridgeObjectRelease();
  unint64_t v5 = MessagingOptions.dictionaryValue.getter();
  sub_24E506E28(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_24E52CF20();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendMessage_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  uint64_t v7 = (void *)v0[3];
  uint64_t v8 = (void *)v0[2];
  if (!v2)
  {
    id v14 = v7;
    id v15 = v8;
    sub_24E52CDA0();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    goto LABEL_9;
  }
  if (!v8)
  {
    id v16 = v7;
    goto LABEL_7;
  }
  uint64_t v9 = v0[12];
  uint64_t v10 = v0[13];
  uint64_t v11 = v0[11];
  sub_24E52CFF0();
  id v12 = v7;
  id v13 = v8;
  sub_24E52CE80();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_24E4FB96C(v0[11], &qword_26B1C1770);
LABEL_7:
    sub_24E4E010C();
    swift_allocError();
    *id v17 = 0;
    goto LABEL_8;
  }
  uint64_t v40 = v13;
  (*(void (**)(void, void, void))(v0[13] + 32))(v0[15], v0[11], v0[12]);
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v21 = v0[14];
  uint64_t v20 = v0[15];
  uint64_t v22 = v0[12];
  uint64_t v23 = v0[13];
  uint64_t v24 = sub_24E52CEF0();
  __swift_project_value_buffer(v24, (uint64_t)qword_26B1C18F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v20, v22);
  uint64_t v25 = sub_24E52CED0();
  os_log_type_t v26 = sub_24E52D200();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v29 = v0[14];
  uint64_t v28 = v0[15];
  uint64_t v31 = v0[12];
  uint64_t v30 = v0[13];
  if (v27)
  {
    os_log_type_t type = v26;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v41[0] = v39;
    *(_DWORD *)uint64_t v32 = 136446466;
    uint64_t v33 = sub_24E5076B0();
    v0[4] = sub_24E4F1740(v33, v34, v41);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v35 = sub_24E52D560();
    v0[5] = sub_24E4F1740(v35, v36, v41);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v37(v29, v31);
    _os_log_impl(&dword_24E4DA000, v25, type, "%{public}s: Sent raw dictionary to with identifier: %{public}s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v39, -1, -1);
    MEMORY[0x25333DD20](v32, -1, -1);
  }
  else
  {

    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v37(v29, v31);
  }
  v37(v28, v31);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
LABEL_9:
  return v18();
}

uint64_t sub_24E51178C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 352) = a7;
  *(void *)(v8 + 360) = v7;
  *(void *)(v8 + 336) = a4;
  *(void *)(v8 + 344) = a5;
  *(void *)(v8 + 320) = a1;
  *(void *)(v8 + 328) = a2;
  *(void *)(v8 + 368) = *v7;
  uint64_t v11 = *v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  *(void *)(v8 + 376) = swift_task_alloc();
  *(void *)(v8 + 384) = *(void *)(v11 + 80);
  *(void *)(v8 + 392) = *(void *)(v11 + 88);
  uint64_t v12 = type metadata accessor for Message();
  *(void *)(v8 + 400) = v12;
  uint64_t v13 = type metadata accessor for MessageContext();
  *(void *)(v8 + 408) = v13;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(void *)(v8 + 416) = TupleTypeMetadata2;
  *(void *)(v8 + 424) = *(void *)(TupleTypeMetadata2 - 8);
  *(void *)(v8 + 432) = swift_task_alloc();
  uint64_t v15 = sub_24E52CEC0();
  *(void *)(v8 + 440) = v15;
  *(void *)(v8 + 448) = *(void *)(v15 - 8);
  *(void *)(v8 + 456) = swift_task_alloc();
  *(void *)(v8 + 464) = swift_task_alloc();
  *(void *)(v8 + 472) = swift_task_alloc();
  *(void *)(v8 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  *(void *)(v8 + 488) = swift_task_alloc();
  *(void *)(v8 + 496) = swift_task_alloc();
  *(void *)(v8 + 504) = type metadata accessor for MessagingOptions();
  *(void *)(v8 + 512) = swift_task_alloc();
  *(void *)(v8 + 520) = swift_task_alloc();
  uint64_t v16 = *(void *)(v13 - 8);
  *(void *)(v8 + 528) = v16;
  *(void *)(v8 + 536) = *(void *)(v16 + 64);
  *(void *)(v8 + 544) = swift_task_alloc();
  *(void *)(v8 + 552) = swift_task_alloc();
  *(void *)(v8 + 560) = swift_task_alloc();
  uint64_t v17 = *(void *)(v12 - 8);
  *(void *)(v8 + 568) = v17;
  *(void *)(v8 + 576) = *(void *)(v17 + 64);
  *(void *)(v8 + 584) = swift_task_alloc();
  *(void *)(v8 + 592) = swift_task_alloc();
  *(void *)(v8 + 600) = swift_task_alloc();
  *(void *)(v8 + 608) = swift_task_alloc();
  *(void *)(v8 + 616) = swift_task_alloc();
  *(void *)(v8 + 624) = swift_task_alloc();
  *(void *)(v8 + 632) = swift_task_alloc();
  uint64_t v18 = a3[1];
  *(void *)(v8 + 640) = *a3;
  *(void *)(v8 + 648) = v18;
  *(unsigned char *)(v8 + 744) = *(unsigned char *)a6;
  uint64_t v19 = *(void *)(a6 + 16);
  *(void *)(v8 + 656) = *(void *)(a6 + 8);
  *(void *)(v8 + 664) = v19;
  return MEMORY[0x270FA2498](sub_24E511B64, v7, 0);
}

uint64_t sub_24E511B64()
{
  uint64_t v218 = v0;
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v3 = *(void *)(v1 + 112);
  unint64_t v2 = *(void *)(v1 + 120);
  BOOL v4 = v3 == *(void *)(v0 + 320) && v2 == *(void *)(v0 + 328);
  if (!v4 && (sub_24E52D5A0() & 1) == 0)
  {
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_24E52CEF0();
    __swift_project_value_buffer(v38, (uint64_t)qword_26B1C18F8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v39 = sub_24E52CED0();
    os_log_type_t v40 = sub_24E52D1E0();
    if (os_log_type_enabled(v39, v40))
    {
      unint64_t v41 = *(void *)(v0 + 328);
      uint64_t v202 = *(void *)(v0 + 320);
      uint64_t v42 = swift_slowAlloc();
      uint64_t v208 = swift_slowAlloc();
      v217[0] = v208;
      *(_DWORD *)uint64_t v42 = 136446722;
      uint64_t v43 = sub_24E5076B0();
      *(void *)(v0 + 256) = sub_24E4F1740(v43, v44, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 248) = sub_24E4F1740(v3, v2, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v42 + 22) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 184) = sub_24E4F1740(v202, v41, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v39, v40, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v42, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v208, -1, -1);
      MEMORY[0x25333DD20](v42, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_20;
  }
  sub_24E52CD50();
  swift_allocObject();
  sub_24E52CD40();
  swift_getWitnessTable();
  sub_24E52CD20();
  uint64_t v5 = *(void *)(v0 + 632);
  uint64_t v6 = *(void *)(v0 + 624);
  uint64_t v7 = *(void *)(v0 + 568);
  uint64_t v9 = *(void *)(v0 + 400);
  uint64_t v8 = *(void *)(v0 + 408);
  uint64_t v10 = *(void *)(v0 + 352);
  swift_release();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  v11(v5, v6, v9);
  if (*(unsigned char *)(v10 + *(int *)(v8 + 36)) == 1)
  {
    uint64_t v12 = *(void *)(v0 + 360);
    uint64_t v13 = *(void *)(v12 + 256);
    *(void *)(v0 + 672) = v13;
    *(void *)(v0 + 680) = *(void *)(v12 + 264);
    if (v13)
    {
      v210 = (int *)v13;
      sub_24E4F8EAC(v13);
      if (qword_26B1C1910 != -1) {
        swift_once();
      }
      uint64_t v14 = *(void *)(v0 + 632);
      uint64_t v15 = *(void *)(v0 + 616);
      uint64_t v16 = v0;
      uint64_t v17 = *(void *)(v0 + 568);
      uint64_t v18 = *(void *)(v16 + 560);
      uint64_t v19 = *(void *)(v16 + 400);
      uint64_t v20 = *(void *)(v16 + 352);
      uint64_t v21 = sub_24E52CEF0();
      *(void *)(v16 + 688) = __swift_project_value_buffer(v21, (uint64_t)qword_26B1C18F8);
      sub_24E4F963C(v20, v18, (uint64_t (*)(void))type metadata accessor for MessageContext);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
      v22(v15, v14, v19);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v23 = sub_24E52CED0();
      os_log_type_t v24 = sub_24E52D200();
      BOOL v25 = os_log_type_enabled(v23, v24);
      unint64_t v26 = *(void *)(v16 + 664);
      if (v25)
      {
        uint64_t v181 = *(void *)(v16 + 656);
        v207 = v23;
        v193 = *(NSObject **)(v16 + 616);
        v188 = *(NSObject **)(v16 + 608);
        uint64_t v196 = *(void *)(v16 + 568);
        uint64_t v167 = *(void *)(v16 + 560);
        uint64_t v27 = *(void *)(v16 + 400);
        os_log_type_t v203 = v24;
        unint64_t v28 = *(void *)(v16 + 328);
        uint64_t v176 = *(void *)(v16 + 320);
        uint64_t v29 = swift_slowAlloc();
        uint64_t v200 = swift_slowAlloc();
        v217[0] = v200;
        *(_DWORD *)uint64_t v29 = 136316162;
        uint64_t v30 = sub_24E5076B0();
        *(void *)(v16 + 280) = sub_24E4F1740(v30, v31, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        *(_WORD *)(v29 + 12) = 2080;
        sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
        uint64_t v32 = sub_24E52D560();
        *(void *)(v16 + 288) = sub_24E4F1740(v32, v33, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        sub_24E4F96A4(v167, (uint64_t (*)(void))type metadata accessor for MessageContext);
        *(_WORD *)(v29 + 22) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v16 + 296) = sub_24E4F1740(v176, v28, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v29 + 32) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v16 + 304) = sub_24E4F1740(v181, v26, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v29 + 42) = 2080;
        v22((uint64_t)v188, (uint64_t)v193, v27);
        unint64_t v34 = *(void (**)(NSObject *, uint64_t))(v196 + 8);
        v34(v193, v27);
        uint64_t v35 = Message.description.getter(v27);
        unint64_t v37 = v36;
        v34(v188, v27);
        *(void *)(v16 + 312) = sub_24E4F1740(v35, v37, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4DA000, v207, v203, "%s: Received message %s on %s from %s: %s expecting response", (uint8_t *)v29, 0x34u);
        swift_arrayDestroy();
        MEMORY[0x25333DD20](v200, -1, -1);
        MEMORY[0x25333DD20](v29, -1, -1);
      }
      else
      {
        uint64_t v93 = *(void *)(v16 + 560);
        unint64_t v34 = *(void (**)(NSObject *, uint64_t))(*(void *)(v16 + 568) + 8);
        v34(*(NSObject **)(v16 + 616), *(void *)(v16 + 400));
        sub_24E4F96A4(v93, (uint64_t (*)(void))type metadata accessor for MessageContext);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      *(void *)(v16 + 696) = v34;
      uint64_t v94 = *(void *)(v16 + 664);
      uint64_t v95 = *(void *)(v16 + 656);
      char v96 = *(unsigned char *)(v16 + 744);
      uint64_t v97 = *(void *)(v16 + 648);
      *(void *)(v16 + 88) = *(void *)(v16 + 640);
      *(void *)(v16 + 96) = v97;
      *(unsigned char *)(v16 + 40) = v96;
      *(void *)(v16 + 48) = v95;
      *(void *)(v16 + 56) = v94;
      unint64_t v98 = sub_24E4E1784(MEMORY[0x263F8EE78]);
      *(void *)(v16 + 704) = v98;
      v213 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))((char *)v210 + *v210);
      int64_t v99 = (void *)swift_task_alloc();
      *(void *)(v16 + 712) = v99;
      void *v99 = v16;
      v99[1] = sub_24E513874;
      uint64_t v100 = *(void *)(v16 + 632);
      uint64_t v101 = *(void *)(v16 + 600);
      uint64_t v102 = *(void *)(v16 + 352);
      return v213(v101, v16 + 88, v16 + 40, v100, v98, v102);
    }
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v82 = sub_24E52CEF0();
    __swift_project_value_buffer(v82, (uint64_t)qword_26B1C18F8);
    unint64_t v83 = sub_24E52CED0();
    os_log_type_t v84 = sub_24E52D1E0();
    BOOL v85 = os_log_type_enabled(v83, v84);
    uint64_t v86 = *(void *)(v0 + 632);
    uint64_t v87 = *(void *)(v0 + 568);
    uint64_t v88 = *(void *)(v0 + 400);
    if (v85)
    {
      uint64_t v212 = *(void *)(v0 + 632);
      int v89 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      v217[0] = v90;
      *(_DWORD *)int v89 = 136446210;
      uint64_t v91 = sub_24E5076B0();
      *(void *)(v0 + 240) = sub_24E4F1740(v91, v92, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E4DA000, v83, v84, "%{public}s: No replyCallback!", v89, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v90, -1, -1);
      MEMORY[0x25333DD20](v89, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v212, v88);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v86, v88);
    }
  }
  else
  {
    uint64_t v45 = *(void *)(v0 + 488);
    uint64_t v46 = *(void *)(v0 + 440);
    uint64_t v47 = *(void *)(v0 + 448);
    sub_24E502FE4(*(void *)(v0 + 352), v45);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46) == 1)
    {
      sub_24E4FB96C(*(void *)(v0 + 488), &qword_26B1C1770);
    }
    else
    {
      uint64_t v50 = *(void *)(v0 + 472);
      uint64_t v51 = *(void *)(v0 + 440);
      uint64_t v52 = *(void *)(v0 + 360);
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 448) + 32))(v50, *(void *)(v0 + 488), v51);
      swift_beginAccess();
      uint64_t v53 = *(void *)(v52 + 152);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1C19D0);
      uint64_t v54 = sub_24E52CCE0();
      uint64_t v55 = sub_24E518620((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
      MEMORY[0x25333D010](v50, v53, v51, v54, v55);
      swift_bridgeObjectRelease();
      if (*(void *)(v0 + 160))
      {
        if (qword_26B1C1910 != -1) {
          swift_once();
        }
        uint64_t v56 = *(void *)(v0 + 632);
        uint64_t v57 = *(void *)(v0 + 592);
        uint64_t v58 = *(void *)(v0 + 568);
        uint64_t v59 = *(void *)(v0 + 552);
        uint64_t v185 = *(void *)(v0 + 472);
        uint64_t v182 = *(void *)(v0 + 464);
        uint64_t v61 = *(void *)(v0 + 440);
        uint64_t v60 = *(void *)(v0 + 448);
        uint64_t v62 = *(void *)(v0 + 400);
        uint64_t v63 = *(void *)(v0 + 352);
        uint64_t v64 = sub_24E52CEF0();
        __swift_project_value_buffer(v64, (uint64_t)qword_26B1C18F8);
        sub_24E4F963C(v63, v59, (uint64_t (*)(void))type metadata accessor for MessageContext);
        v204 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16);
        v204(v57, v56, v62);
        uint64_t v65 = v182;
        v183 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
        v183(v65, v185, v61);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        long long v66 = sub_24E52CED0();
        os_log_type_t v67 = sub_24E52D200();
        if (os_log_type_enabled(v66, v67))
        {
          uint64_t v180 = *(void *)(v0 + 656);
          uint64_t v166 = *(void *)(v0 + 608);
          uint64_t v165 = *(void *)(v0 + 592);
          uint64_t v68 = *(void *)(v0 + 568);
          uint64_t v69 = *(void *)(v0 + 552);
          uint64_t v168 = *(void *)(v0 + 464);
          uint64_t v177 = *(void *)(v0 + 448);
          uint64_t v164 = *(void *)(v0 + 440);
          unint64_t v161 = *(void *)(v0 + 664);
          uint64_t v162 = *(void *)(v0 + 400);
          os_log_type_t type = v67;
          unint64_t v70 = *(void *)(v0 + 328);
          uint64_t v163 = *(void *)(v0 + 320);
          os_log_t log = v66;
          uint64_t v71 = swift_slowAlloc();
          uint64_t v171 = swift_slowAlloc();
          v217[0] = v171;
          *(_DWORD *)uint64_t v71 = 136316418;
          uint64_t v72 = sub_24E5076B0();
          *(void *)(v0 + 192) = sub_24E4F1740(v72, v73, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 12) = 2080;
          sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
          uint64_t v74 = sub_24E52D560();
          *(void *)(v0 + 200) = sub_24E4F1740(v74, v75, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          sub_24E4F96A4(v69, (uint64_t (*)(void))type metadata accessor for MessageContext);
          *(_WORD *)(v71 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 208) = sub_24E4F1740(v163, v70, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v71 + 32) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 216) = sub_24E4F1740(v180, v161, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v71 + 42) = 2080;
          v204(v166, v165, v162);
          uint64_t v76 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
          v76(v165, v162);
          uint64_t v77 = Message.description.getter(v162);
          unint64_t v79 = v78;
          v211 = v76;
          v76(v166, v162);
          *(void *)(v0 + 224) = sub_24E4F1740(v77, v79, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 52) = 2080;
          uint64_t v80 = sub_24E52D560();
          *(void *)(v0 + 232) = sub_24E4F1740(v80, v81, v217);
          sub_24E52D250();
          swift_bridgeObjectRelease();
          v209 = *(void (**)(uint64_t, uint64_t))(v177 + 8);
          v209(v168, v164);
          _os_log_impl(&dword_24E4DA000, log, type, "%s: Received message %s on %s from %s: %s in response to %s", (uint8_t *)v71, 0x3Eu);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v171, -1, -1);
          MEMORY[0x25333DD20](v71, -1, -1);
        }
        else
        {
          uint64_t v115 = *(void *)(v0 + 552);
          uint64_t v116 = *(void *)(v0 + 464);
          uint64_t v117 = *(void *)(v0 + 440);
          uint64_t v118 = *(void *)(v0 + 448);
          v211 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 568) + 8);
          v211(*(void *)(v0 + 592), *(void *)(v0 + 400));
          sub_24E4F96A4(v115, (uint64_t (*)(void))type metadata accessor for MessageContext);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v209 = *(void (**)(uint64_t, uint64_t))(v118 + 8);
          v209(v116, v117);
        }
        *(void *)os_log_type_t typea = *(void *)(v0 + 632);
        uint64_t v119 = *(void *)(v0 + 472);
        uint64_t v120 = *(void *)(v0 + 456);
        uint64_t v122 = *(void *)(v0 + 432);
        uint64_t v121 = *(void *)(v0 + 440);
        uint64_t v124 = *(void *)(v0 + 416);
        uint64_t v123 = *(void *)(v0 + 424);
        uint64_t v125 = *(void *)(v0 + 400);
        uint64_t v126 = *(void *)(v0 + 352);
        uint64_t v127 = v122 + *(int *)(v124 + 48);
        ((void (*)(uint64_t))v204)(v122);
        sub_24E4F963C(v126, v127, (uint64_t (*)(void))type metadata accessor for MessageContext);
        sub_24E52CCD0();
        (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v122, v124);
        v183(v120, v119, v121);
        *(void *)(v0 + 176) = 0;
        swift_beginAccess();
        sub_24E52CF70();
        sub_24E52CF90();
        swift_endAccess();
        swift_release();
        v209(v119, v121);
        v211(*(void *)typea, v125);
        goto LABEL_20;
      }
      if (qword_26B1C1910 != -1) {
        swift_once();
      }
      uint64_t v103 = sub_24E52CEF0();
      __swift_project_value_buffer(v103, (uint64_t)qword_26B1C18F8);
      uint64_t v104 = sub_24E52CED0();
      os_log_type_t v105 = sub_24E52D1E0();
      BOOL v106 = os_log_type_enabled(v104, v105);
      uint64_t v107 = *(void *)(v0 + 472);
      uint64_t v109 = *(void *)(v0 + 440);
      uint64_t v108 = *(void *)(v0 + 448);
      if (v106)
      {
        uint64_t v197 = *(void *)(v0 + 440);
        uint64_t v110 = (uint8_t *)swift_slowAlloc();
        v205 = v11;
        uint64_t v111 = swift_slowAlloc();
        v217[0] = v111;
        *(_DWORD *)uint64_t v110 = 136315138;
        uint64_t v112 = sub_24E5076B0();
        *(void *)(v0 + 168) = sub_24E4F1740(v112, v113, v217);
        sub_24E52D250();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4DA000, v104, v105, "%s: Got unexpected response!", v110, 0xCu);
        swift_arrayDestroy();
        uint64_t v114 = v111;
        uint64_t v11 = v205;
        MEMORY[0x25333DD20](v114, -1, -1);
        MEMORY[0x25333DD20](v110, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v107, v197);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v107, v109);
      }
    }
    v206 = (void (*)(unint64_t, uint64_t, uint64_t))v11;
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v128 = *(void *)(v0 + 632);
    uint64_t v129 = *(void *)(v0 + 584);
    uint64_t v130 = *(void *)(v0 + 568);
    uint64_t v131 = *(void *)(v0 + 400);
    uint64_t v132 = sub_24E52CEF0();
    __swift_project_value_buffer(v132, (uint64_t)qword_26B1C18F8);
    v216 = *(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 16);
    v216(v129, v128, v131);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v133 = sub_24E52CED0();
    os_log_type_t v134 = sub_24E52D200();
    BOOL v135 = os_log_type_enabled(v133, v134);
    unint64_t v136 = *(void *)(v0 + 664);
    if (v135)
    {
      uint64_t v178 = *(void *)(v0 + 656);
      uint64_t v186 = *(void *)(v0 + 584);
      uint64_t v189 = *(void *)(v0 + 608);
      uint64_t v214 = *(void *)(v0 + 568);
      uint64_t v184 = *(void *)(v0 + 400);
      os_log_type_t v198 = v134;
      v194 = v133;
      uint64_t v138 = *(void *)(v0 + 320);
      unint64_t v137 = *(void *)(v0 + 328);
      uint64_t v139 = swift_slowAlloc();
      uint64_t v191 = swift_slowAlloc();
      v217[0] = v191;
      *(_DWORD *)uint64_t v139 = 136316163;
      uint64_t v140 = sub_24E5076B0();
      *(void *)(v0 + 120) = sub_24E4F1740(v140, v141, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v139 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 128) = sub_24E4F1740(v138, v137, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v139 + 22) = 2160;
      *(void *)(v0 + 136) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v139 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 144) = sub_24E4F1740(v178, v136, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v139 + 42) = 2082;
      v216(v189, v186, v184);
      v215 = *(void (**)(uint64_t, uint64_t))(v214 + 8);
      v215(v186, v184);
      uint64_t v142 = Message.description.getter(v184);
      unint64_t v144 = v143;
      v215(v189, v184);
      *(void *)(v0 + 152) = sub_24E4F1740(v142, v144, v217);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E4DA000, v194, v198, "%s: Received message on %{public}s from %{private,mask.hash}s: %{public}s", (uint8_t *)v139, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v191, -1, -1);
      MEMORY[0x25333DD20](v139, -1, -1);
    }
    else
    {
      v215 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 568) + 8);
      v215(*(void *)(v0 + 584), *(void *)(v0 + 400));
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v145 = *(void *)(v0 + 360);
    uint64_t v146 = *(void *)(v145 + 176);
    if (v146)
    {
      uint64_t v199 = *(void *)(v0 + 656);
      uint64_t v201 = *(void *)(v0 + 664);
      char v195 = *(unsigned char *)(v0 + 744);
      uint64_t v192 = *(void *)(v0 + 648);
      uint64_t v190 = *(void *)(v0 + 640);
      uint64_t v147 = *(void *)(v0 + 632);
      uint64_t v148 = *(void *)(v0 + 608);
      uint64_t v187 = *(void *)(v0 + 576);
      os_log_t loga = *(os_log_t *)(v0 + 544);
      uint64_t v172 = *(void *)(v0 + 568);
      *(void *)typeb = *(void *)(v0 + 528);
      uint64_t v149 = *(void *)(v0 + 400);
      uint64_t v150 = *(void *)(v0 + 376);
      uint64_t v151 = *(void *)(v0 + 352);
      uint64_t v152 = *(void *)(v145 + 184);
      uint64_t v153 = sub_24E52D160();
      long long v179 = *(_OWORD *)(v0 + 384);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v153 - 8) + 56))(v150, 1, 1, v153);
      v216(v148, v147, v149);
      sub_24E4F963C(v151, (uint64_t)loga, (uint64_t (*)(void))type metadata accessor for MessageContext);
      uint64_t v154 = v0;
      unint64_t v155 = (*(unsigned __int8 *)(v172 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v172 + 80);
      unint64_t v156 = (v187 + *(unsigned __int8 *)(*(void *)typeb + 80) + v155) & ~(unint64_t)*(unsigned __int8 *)(*(void *)typeb + 80);
      uint64_t v157 = swift_allocObject();
      *(void *)(v157 + 16) = 0;
      *(void *)(v157 + 24) = 0;
      *(_OWORD *)(v157 + 32) = v179;
      *(void *)(v157 + 48) = v146;
      *(void *)(v157 + 56) = v152;
      *(void *)(v157 + 64) = v190;
      *(void *)(v157 + 72) = v192;
      *(unsigned char *)(v157 + 80) = v195;
      unint64_t v158 = v157 + v155;
      uint64_t v0 = v154;
      *(void *)(v157 + 88) = v199;
      *(void *)(v157 + 96) = v201;
      v206(v158, v148, v149);
      sub_24E5185B8((uint64_t)loga, v157 + v156, (uint64_t (*)(void))type metadata accessor for MessageContext);
      sub_24E4F8EAC(v146);
      swift_bridgeObjectRetain();
      sub_24E4F8EAC(v146);
      swift_bridgeObjectRetain();
      sub_24E51F518(v150, (uint64_t)&unk_2698EE7E8, v157);
      swift_release();
      sub_24E4F66D8(v146);
      uint64_t v159 = v147;
      uint64_t v160 = v149;
    }
    else
    {
      uint64_t v159 = *(void *)(v0 + 632);
      uint64_t v160 = *(void *)(v0 + 400);
    }
    v215(v159, v160);
  }
LABEL_20:
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v48 = *(uint64_t (**)(void))(v0 + 8);
  return v48();
}

uint64_t sub_24E513874()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 720) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 360);
    BOOL v4 = sub_24E513D28;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 360);
    swift_bridgeObjectRelease();
    BOOL v4 = sub_24E51399C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E51399C()
{
  uint64_t v1 = *(void *)(v0 + 664);
  char v21 = *(unsigned char *)(v0 + 744);
  uint64_t v22 = *(void *)(v0 + 656);
  uint64_t v24 = *(void *)(v0 + 520);
  uint64_t v3 = *(int **)(v0 + 504);
  uint64_t v2 = *(void *)(v0 + 512);
  uint64_t v4 = *(void *)(v0 + 496);
  uint64_t v6 = *(void *)(v0 + 440);
  uint64_t v5 = *(void *)(v0 + 448);
  uint64_t v7 = *(void *)(v0 + 408);
  uint64_t v8 = *(void *)(v0 + 352);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE358);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24E52DE40;
  *(unsigned char *)(v9 + 32) = v21;
  *(void *)(v9 + 40) = v22;
  *(void *)(v9 + 48) = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8 + *(int *)(v7 + 20), v6);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v10(v4, 0, 1, v6);
  swift_bridgeObjectRetain();
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v23 = sub_24E4F6DB0(MEMORY[0x263F8EE78]);
  uint64_t v12 = sub_24E4F6DB0(v11);
  uint64_t v13 = v2 + v3[7];
  v10(v13, 1, 1, v6);
  sub_24E52CEB0();
  *(void *)(v2 + v3[5]) = v9;
  *(unsigned char *)(v2 + v3[6]) = 0;
  sub_24E4F92E8(v4, v13);
  uint64_t v14 = v2 + v3[8];
  *(void *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 8) = 1;
  *(unsigned char *)(v2 + v3[9]) = 0;
  *(void *)(v2 + v3[10]) = v23;
  *(void *)(v2 + v3[11]) = v12;
  uint64_t v15 = (void *)(v2 + v3[12]);
  *uint64_t v15 = 0;
  v15[1] = 0;
  sub_24E4FB96C(v4, &qword_26B1C1770);
  *(_OWORD *)(v2 + v3[13]) = xmmword_24E52DF20;
  sub_24E5185B8(v2, v24, (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 728) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_24E513BF0;
  uint64_t v17 = *(void *)(v0 + 600);
  uint64_t v18 = *(void *)(v0 + 520);
  uint64_t v19 = *(void *)(v0 + 480);
  return LocalMessaging.send(message:messageOptions:)(v19, v17, v18);
}

uint64_t sub_24E513BF0()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 736) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[45];
    uint64_t v4 = sub_24E5140D8;
  }
  else
  {
    uint64_t v5 = v2[45];
    (*(void (**)(void, void))(v2[56] + 8))(v2[60], v2[55]);
    uint64_t v4 = sub_24E4EEB84;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E513D28()
{
  uint64_t v22 = v0;
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)v0[90];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[87];
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_24E52CED0();
  os_log_type_t v6 = sub_24E52D1E0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v18 = v0[84];
    uint64_t v19 = v0[50];
    uint64_t v20 = v0[79];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v21 = v9;
    *(_DWORD *)uint64_t v7 = 136446466;
    uint64_t v10 = sub_24E5076B0();
    v0[33] = sub_24E4F1740(v10, v11, &v21);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2114;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[34] = v13;
    sub_24E52D250();
    *uint64_t v8 = v13;

    _os_log_impl(&dword_24E4DA000, v5, v6, "%{public}s: Error sending response: %{public}@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v9, -1, -1);
    MEMORY[0x25333DD20](v7, -1, -1);
    sub_24E4F66D8(v18);

    v2(v20, v19);
  }
  else
  {
    uint64_t v14 = v0[79];
    uint64_t v15 = v0[50];
    sub_24E4F66D8(v0[84]);

    v2(v14, v15);
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
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_24E5140D8()
{
  uint64_t v25 = v0;
  uint64_t v1 = v0[75];
  uint64_t v2 = v0[71];
  uint64_t v3 = v0[50];
  sub_24E4F96A4(v0[65], (uint64_t (*)(void))type metadata accessor for MessagingOptions);
  id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v4(v1, v3);
  uint64_t v5 = (void *)v0[92];
  id v6 = v5;
  id v7 = v5;
  uint64_t v8 = sub_24E52CED0();
  os_log_type_t v9 = sub_24E52D1E0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v21 = v0[84];
    uint64_t v22 = v0[50];
    uint64_t v23 = v0[79];
    uint64_t v10 = swift_slowAlloc();
    unint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v24 = v12;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v13 = sub_24E5076B0();
    v0[33] = sub_24E4F1740(v13, v14, &v24);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2114;
    id v15 = v5;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[34] = v16;
    sub_24E52D250();
    *unint64_t v11 = v16;

    _os_log_impl(&dword_24E4DA000, v8, v9, "%{public}s: Error sending response: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v12, -1, -1);
    MEMORY[0x25333DD20](v10, -1, -1);
    sub_24E4F66D8(v21);

    v4(v23, v22);
  }
  else
  {
    uint64_t v17 = v0[79];
    uint64_t v18 = v0[50];
    sub_24E4F66D8(v0[84]);

    v4(v17, v18);
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
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_24E5144BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 104) = v11;
  *(void *)(v8 + 112) = v12;
  *(_OWORD *)(v8 + 88) = v10;
  *(unsigned char *)(v8 + 136) = a8;
  *(void *)(v8 + 72) = a6;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 56) = a4;
  *(void *)(v8 + 64) = a5;
  return MEMORY[0x270FA2498](sub_24E5144F8, 0, 0);
}

uint64_t sub_24E5144F8()
{
  long long v1 = *(_OWORD *)(v0 + 88);
  char v2 = *(unsigned char *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 80);
  *(void *)(v0 + 40) = *(void *)(v0 + 72);
  id v4 = *(int **)(v0 + 56);
  *(void *)(v0 + 48) = v3;
  *(unsigned char *)(v0 + 16) = v2;
  *(_OWORD *)(v0 + 24) = v1;
  unint64_t v5 = sub_24E4E1784(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 120) = v5;
  long long v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))((char *)v4 + *v4);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v6;
  *id v6 = v0;
  v6[1] = sub_24E4EF680;
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v8 = *(void *)(v0 + 112);
  return v10(v0 + 40, v0 + 16, v7, v5, v8);
}

void sub_24E514620(void (*a1)(char *, uint64_t), unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v100 = a7;
  uint64_t v109 = *v7;
  unint64_t v14 = v109;
  uint64_t v15 = type metadata accessor for MessageContext();
  uint64_t v98 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v99 = v16;
  uint64_t v101 = (uint64_t)&v85 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v104 = (uint64_t)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v14[10];
  uint64_t v96 = v14[11];
  uint64_t v97 = v19;
  uint64_t v20 = type metadata accessor for Message();
  uint64_t v107 = *(void **)(v20 - 8);
  uint64_t v108 = v20;
  uint64_t v21 = v107[8];
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v103 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v85 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  unint64_t v28 = (char *)&v85 - v27;
  MEMORY[0x270FA5388](v26);
  BOOL v106 = (char *)&v85 - v29;
  uint64_t v30 = a3[1];
  uint64_t v94 = *a3;
  uint64_t v95 = v30;
  int v93 = *a6;
  uint64_t v102 = *((void *)a6 + 1);
  unint64_t v105 = *((void *)a6 + 2);
  uint64_t v31 = (uint64_t)v7[14];
  unint64_t v32 = (unint64_t)v7[15];
  uint64_t v110 = a1;
  if (void (*)(char *, uint64_t))v31 == a1 && v32 == a2 || (sub_24E52D5A0())
  {
    uint64_t v92 = a5;
    uint64_t v33 = sub_24E52CE00();
    unint64_t v35 = v34;
    sub_24E52CD50();
    swift_allocObject();
    sub_24E52CD40();
    uint64_t v36 = v108;
    swift_getWitnessTable();
    sub_24E52CD20();
    sub_24E4F6988(v33, v35);
    swift_release();
    uint64_t v45 = v106;
    unint64_t v44 = v107;
    uint64_t v46 = (void (*)(unint64_t, char *, uint64_t))v107[4];
    int v89 = v107 + 4;
    uint64_t v88 = v46;
    v46((unint64_t)v106, v28, v36);
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_24E52CEF0();
    __swift_project_value_buffer(v47, (uint64_t)qword_26B1C18F8);
    unint64_t v48 = (void (*)(char *, char *, uint64_t))v44[2];
    uint64_t v91 = v44 + 2;
    uint64_t v90 = v48;
    v48(v25, v45, v36);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v49 = sub_24E52CED0();
    os_log_type_t v50 = sub_24E52D200();
    int v87 = v50;
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      v112[0] = v86;
      *(_DWORD *)uint64_t v51 = 136316419;
      os_log_t v85 = v49;
      uint64_t v52 = sub_24E5076B0();
      uint64_t v111 = sub_24E4F1740(v52, v53, v112);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v111 = sub_24E4F1740((uint64_t)v110, a2, v112);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v51 + 22) = 2160;
      uint64_t v111 = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v51 + 32) = 2081;
      unint64_t v54 = v105;
      swift_bridgeObjectRetain();
      uint64_t v111 = sub_24E4F1740(v102, v54, v112);
      uint64_t v109 = v112;
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v51 + 42) = 2080;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4D0);
      uint64_t v55 = sub_24E52CF40();
      unint64_t v57 = v56;
      swift_bridgeObjectRelease();
      uint64_t v111 = sub_24E4F1740(v55, v57, v112);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 52) = 2082;
      uint64_t v58 = v103;
      v90(v103, v25, v36);
      uint64_t v59 = (void (*)(char *, uint64_t))v107[1];
      v59(v25, v36);
      uint64_t v60 = Message.description.getter(v36);
      uint64_t v61 = v36;
      uint64_t v62 = v60;
      unint64_t v64 = v63;
      uint64_t v110 = v59;
      v59(v58, v61);
      uint64_t v111 = sub_24E4F1740(v62, v64, v112);
      sub_24E52D250();
      uint64_t v45 = v106;
      swift_bridgeObjectRelease();
      os_log_t v65 = v85;
      _os_log_impl(&dword_24E4DA000, v85, (os_log_type_t)v87, "%s: Received (resource) message on %{public}s from %{private,mask.hash}s: metadata: %s'; message: %{public}s",
        (uint8_t *)v51,
        0x3Eu);
      uint64_t v66 = v86;
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v66, -1, -1);
      uint64_t v67 = v51;
      unint64_t v44 = v107;
      MEMORY[0x25333DD20](v67, -1, -1);
    }
    else
    {
      uint64_t v110 = (void (*)(char *, uint64_t))v44[1];
      v110(v25, v36);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    uint64_t v68 = v90;
    uint64_t v69 = (uint64_t)v8[22];
    if (v69)
    {
      unint64_t v70 = v8[23];
      uint64_t v71 = sub_24E52D160();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v104, 1, 1, v71);
      uint64_t v72 = v103;
      v68(v103, v45, v108);
      uint64_t v73 = v101;
      sub_24E4F963C(v100, v101, (uint64_t (*)(void))type metadata accessor for MessageContext);
      unint64_t v74 = (*((unsigned __int8 *)v44 + 80) + 104) & ~(unint64_t)*((unsigned __int8 *)v44 + 80);
      unint64_t v75 = (v21 + v74 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v76 = (*(unsigned __int8 *)(v98 + 80) + v75 + 8) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
      uint64_t v77 = swift_allocObject();
      *(void *)(v77 + 16) = 0;
      *(void *)(v77 + 24) = 0;
      uint64_t v79 = v95;
      uint64_t v78 = v96;
      *(void *)(v77 + 32) = v97;
      *(void *)(v77 + 40) = v78;
      *(void *)(v77 + 48) = v69;
      *(void *)(v77 + 56) = v70;
      *(void *)(v77 + 64) = v94;
      *(void *)(v77 + 72) = v79;
      *(unsigned char *)(v77 + 80) = v93;
      unint64_t v80 = v105;
      *(void *)(v77 + 88) = v102;
      *(void *)(v77 + 96) = v80;
      unint64_t v81 = v72;
      uint64_t v82 = v108;
      v88(v77 + v74, v81, v108);
      *(void *)(v77 + v75) = v92;
      sub_24E5185B8(v73, v77 + v76, (uint64_t (*)(void))type metadata accessor for MessageContext);
      sub_24E4F8EAC(v69);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E4F8EAC(v69);
      swift_bridgeObjectRetain();
      sub_24E51F518(v104, (uint64_t)&unk_2698EE7D0, v77);
      swift_release();
      sub_24E4F66D8(v69);
      unint64_t v83 = v106;
      uint64_t v84 = v82;
    }
    else
    {
      unint64_t v83 = v45;
      uint64_t v84 = v108;
    }
    v110(v83, v84);
  }
  else
  {
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_24E52CEF0();
    __swift_project_value_buffer(v37, (uint64_t)qword_26B1C18F8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v38 = sub_24E52CED0();
    os_log_type_t v39 = sub_24E52D1E0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v108 = swift_slowAlloc();
      v112[0] = v108;
      *(_DWORD *)uint64_t v40 = 136446722;
      uint64_t v41 = sub_24E5076B0();
      uint64_t v111 = sub_24E4F1740(v41, v42, v112);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v111 = sub_24E4F1740(v31, v32, v112);
      sub_24E52D250();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 22) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v111 = sub_24E4F1740((uint64_t)v110, a2, v112);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v38, v39, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v40, 0x20u);
      uint64_t v43 = v108;
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v43, -1, -1);
      MEMORY[0x25333DD20](v40, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
}

uint64_t sub_24E5153B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(void *)(v7 + 32) = a6;
  *(void *)(v7 + 40) = v6;
  *(unsigned char *)(v7 + 48) = a5;
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24E5153DC, v6, 0);
}

uint64_t sub_24E5153DC()
{
  sub_24E51687C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 48), *(void **)(v0 + 32));
  long long v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E515444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2698EE7F0 + dword_2698EE7F0);
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v9;
  void *v9 = v5;
  v9[1] = sub_24E4FBA64;
  return v11(a3, a4, a5);
}

uint64_t sub_24E515508(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_24E4FBA64;
  return sub_24E51178C(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24E5155E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  return MEMORY[0x270FA2498](sub_24E515618, v7, 0);
}

uint64_t sub_24E515618()
{
  sub_24E514620(*(void (**)(char *, uint64_t))(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned __int8 **)(v0 + 56), *(void *)(v0 + 64));
  long long v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E515684(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t))((char *)&dword_2698EE7B0
                                                                                       + dword_2698EE7B0);
  unint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  void *v14 = v7;
  v14[1] = sub_24E4FBA64;
  return v16(a1, a2, a3, a4, a6, a7);
}

uint64_t sub_24E515770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&dword_2698EE7A8 + dword_2698EE7A8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24E4FBA64;
  return v7(a3);
}

uint64_t sub_24E51581C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&dword_2698EE7A0 + dword_2698EE7A0);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_24E4FBA64;
  return v7(a3);
}

uint64_t sub_24E5158CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 160);
  *(void *)(v2 + 160) = a1;
  *(void *)(v2 + 168) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E51591C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 176);
  *(void *)(v2 + 176) = a1;
  *(void *)(v2 + 184) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E51596C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 192);
  *(void *)(v2 + 192) = a1;
  *(void *)(v2 + 200) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E5159BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 208);
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 216) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E515A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 224);
  *(void *)(v2 + 224) = a1;
  *(void *)(v2 + 232) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t sub_24E515A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 240);
  *(void *)(v2 + 240) = a1;
  *(void *)(v2 + 248) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t LocalMessaging.setReplyCallback(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 256);
  *(void *)(v2 + 256) = a1;
  *(void *)(v2 + 264) = a2;
  swift_retain();
  return sub_24E4F66D8(v3);
}

uint64_t LocalMessaging.description.getter()
{
  uint64_t v0 = type metadata accessor for LocalMessaging();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24E52D540();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  MEMORY[0x25333D5E0](v0, WitnessTable);
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  swift_bridgeObjectRetain();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  return 60;
}

uint64_t sub_24E515C34()
{
  return LocalMessaging.description.getter();
}

uint64_t sub_24E515C58()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_26B1C1A18);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1C1A18);
  return sub_24E52CEE0();
}

uint64_t sub_24E515CDC(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24E4FF360(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24E528E24();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_24E52CEC0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_24E515F00(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_24E515DD4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24E4FF778(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24E529828();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_24E52D430();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_24E4F7148((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_24E5161F8(v6, v9);
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

unint64_t sub_24E515F00(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_24E52D290();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      unint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_24E518620((unint64_t *)&qword_26B1C1840, MEMORY[0x263F07508]);
        uint64_t v17 = sub_24E52CFA0();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (void *)(v22 + 8 * a1);
            uint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *uint64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24E5161F8(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E52D430();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v38 = a2 + 64;
    unint64_t result = sub_24E52D290();
    uint64_t v12 = v38;
    if ((*(void *)(v38 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v36 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      unint64_t v35 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v37 = v13;
      int64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v35(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        uint64_t v18 = sub_24E52CFA0();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_17:
            uint64_t v22 = *(void *)(a2 + 48);
            unint64_t result = v22 + v15 * a1;
            unint64_t v23 = v22 + v17 + v15;
            if (v15 * a1 < v17 || result >= v23)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v17)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v25 = *(void *)(a2 + 56);
            uint64_t v26 = (_OWORD *)(v25 + 32 * a1);
            uint64_t v27 = (_OWORD *)(v25 + 32 * v10);
            uint64_t v12 = v38;
            if (a1 != v10 || (a1 = v10, v26 >= v27 + 2))
            {
              long long v28 = v27[1];
              *uint64_t v26 = *v27;
              v26[1] = v28;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_17;
        }
        uint64_t v12 = v38;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    BOOL v29 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v29 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *BOOL v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t type metadata accessor for LocalMessaging()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E5164C8(uint64_t a1)
{
  return sub_24E509EA0(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_24E5164D8(uint64_t a1)
{
  return sub_24E50B870(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_24E5164E8(uint64_t a1)
{
  return sub_24E50D5F4(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_24E5164F4(uint64_t a1)
{
  return sub_24E50ECD4(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_24E516500()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for LocalMessaging(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalMessaging);
}

uint64_t dispatch thunk of LocalMessaging.set(didDeliverCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of LocalMessaging.set(messageReceivedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of LocalMessaging.set(dictionaryReceivedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of LocalMessaging.set(accountChangedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of LocalMessaging.set(devicesChangedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of LocalMessaging.set(connectedDevicesChangedCallback:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of LocalMessaging.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 496) + **(int **)(v2 + 496));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24E4FBA60;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LocalMessaging.start()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of LocalMessaging.stop()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of LocalMessaging.device(fromID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of LocalMessaging.connectedDevice.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of LocalMessaging.devices.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

void sub_24E51687C(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v8 = sub_24E52CEC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v27[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (*(void *)(*(void *)(v4 + 144) + 16))
  {
    swift_bridgeObjectRetain();
    sub_24E4FF360(a2);
    if (v12)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      if (a3)
      {
        sub_24E52CCD0();
      }
      else
      {
        if (a4)
        {
          uint64_t v22 = a4;
        }
        else
        {
          uint64_t v23 = sub_24E52CCB0();
          sub_24E518620(&qword_2698EE3B8, MEMORY[0x263F3C9B0]);
          uint64_t v22 = (void *)swift_allocError();
          *uint64_t v24 = 0xD00000000000001CLL;
          v24[1] = 0x800000024E52F540;
          (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v24, *MEMORY[0x263F3C9A8], v23);
        }
        v27[0] = (uint64_t)v22;
        id v25 = a4;
        sub_24E52CCC0();
      }
      swift_beginAccess();
      sub_24E515CDC(a2);
      swift_endAccess();
      swift_release();
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_26B1C1910 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24E52CEF0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B1C18F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  uint64_t v14 = sub_24E52CED0();
  os_log_type_t v15 = sub_24E52D1E0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v27[0] = v17;
    *(_DWORD *)uint64_t v16 = 136446466;
    uint64_t v18 = sub_24E5076B0();
    uint64_t v28 = sub_24E4F1740(v18, v19, v27);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    sub_24E518620(&qword_2698EE400, MEMORY[0x263F07508]);
    uint64_t v20 = sub_24E52D560();
    uint64_t v28 = sub_24E4F1740(v20, v21, v27);
    sub_24E52D250();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_24E4DA000, v14, v15, "%{public}s: Got didSend callback for unsent message! %{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v17, -1, -1);
    MEMORY[0x25333DD20](v16, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_24E516CFC(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 56) = a2;
  *(void *)(v4 + 64) = v3;
  uint64_t v5 = a1[1];
  *(void *)(v4 + 72) = *a1;
  *(void *)(v4 + 80) = v5;
  *(unsigned char *)(v4 + 128) = *(unsigned char *)a3;
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)(v4 + 88) = *(void *)(a3 + 8);
  *(void *)(v4 + 96) = v6;
  return MEMORY[0x270FA2498](sub_24E516D34, v3, 0);
}

uint64_t sub_24E516D34()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(int **)(v1 + 160);
  *(void *)(v0 + 104) = v2;
  if (v2)
  {
    long long v3 = *(_OWORD *)(v0 + 88);
    char v4 = *(unsigned char *)(v0 + 128);
    uint64_t v6 = *(void *)(v0 + 72);
    uint64_t v5 = *(void *)(v0 + 80);
    *(void *)(v0 + 112) = *(void *)(v1 + 168);
    *(void *)(v0 + 40) = v6;
    *(unsigned char *)(v0 + 16) = v4;
    *(void *)(v0 + 48) = v5;
    *(_OWORD *)(v0 + 24) = v3;
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_24E4F77C0;
    uint64_t v8 = *(void *)(v0 + 56);
    return v11(v0 + 40, v8, v0 + 16);
  }
  else
  {
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_24E516E90(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 96) = a6;
  *(void *)(v7 + 104) = v6;
  *(void *)(v7 + 80) = a2;
  *(void *)(v7 + 88) = a4;
  *(void *)(v7 + 72) = a1;
  *(void *)(v7 + 112) = *v6;
  uint64_t v10 = *(void *)(type metadata accessor for MessageContext() - 8);
  *(void *)(v7 + 120) = v10;
  *(void *)(v7 + 128) = *(void *)(v10 + 64);
  *(void *)(v7 + 136) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = *a3;
  uint64_t v13 = a3[1];
  *(void *)(v7 + 144) = v11;
  *(void *)(v7 + 152) = v12;
  *(unsigned char *)(v7 + 184) = *(unsigned char *)a5;
  uint64_t v14 = *(void *)(a5 + 8);
  uint64_t v15 = *(void *)(a5 + 16);
  *(void *)(v7 + 160) = v13;
  *(void *)(v7 + 168) = v14;
  *(void *)(v7 + 176) = v15;
  return MEMORY[0x270FA2498](sub_24E516FDC, v6, 0);
}

uint64_t sub_24E516FDC()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v1 + 112);
  unint64_t v2 = *(void *)(v1 + 120);
  BOOL v4 = v3 == *(void *)(v0 + 72) && v2 == *(void *)(v0 + 80);
  if (v4 || (sub_24E52D5A0() & 1) != 0)
  {
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24E52CEF0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B1C18F8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_24E52CED0();
    os_log_type_t v7 = sub_24E52D200();
    BOOL v8 = os_log_type_enabled(v6, v7);
    unint64_t v9 = *(void *)(v0 + 176);
    if (v8)
    {
      uint64_t v38 = *(void *)(v0 + 168);
      unint64_t v10 = *(void *)(v0 + 80);
      uint64_t v35 = *(void *)(v0 + 72);
      uint64_t v11 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v44 = v40;
      *(_DWORD *)uint64_t v11 = 136315907;
      uint64_t v12 = sub_24E5076B0();
      *(void *)(v0 + 40) = sub_24E4F1740(v12, v13, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 48) = sub_24E4F1740(v35, v10, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 22) = 2160;
      *(void *)(v0 + 56) = 1752392040;
      sub_24E52D250();
      *(_WORD *)(v11 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 64) = sub_24E4F1740(v38, v9, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v6, v7, "%s: Received raw dictionary on %{public}s from %{private,mask.hash}s", (uint8_t *)v11, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v40, -1, -1);
      MEMORY[0x25333DD20](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v14 = *(void *)(v0 + 104);
    uint64_t v15 = *(void *)(v14 + 192);
    if (v15)
    {
      uint64_t v16 = *(void *)(v0 + 176);
      char v39 = *(unsigned char *)(v0 + 184);
      uint64_t v17 = *(void *)(v0 + 144);
      uint64_t v36 = *(void *)(v0 + 152);
      uint64_t v37 = *(void *)(v0 + 160);
      uint64_t v41 = *(void *)(v0 + 168);
      uint64_t v18 = *(void *)(v0 + 136);
      uint64_t v19 = *(void *)(v0 + 120);
      uint64_t v20 = *(void *)(v0 + 88);
      uint64_t v21 = *(void *)(v0 + 96);
      uint64_t v22 = *(void *)(v14 + 200);
      uint64_t v23 = sub_24E52D160();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
      sub_24E4F963C(v21, v18, (uint64_t (*)(void))type metadata accessor for MessageContext);
      unint64_t v24 = (*(unsigned __int8 *)(v19 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = 0;
      *(void *)(v25 + 24) = 0;
      *(void *)(v25 + 32) = v15;
      *(void *)(v25 + 40) = v22;
      *(void *)(v25 + 48) = v36;
      *(void *)(v25 + 56) = v37;
      *(unsigned char *)(v25 + 64) = v39;
      *(void *)(v25 + 72) = v41;
      *(void *)(v25 + 80) = v16;
      *(void *)(v25 + 88) = v20;
      sub_24E5185B8(v18, v25 + v24, (uint64_t (*)(void))type metadata accessor for MessageContext);
      swift_bridgeObjectRetain();
      sub_24E4F8EAC(v15);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E51F518(v17, (uint64_t)&unk_2698EE7C0, v25);
      swift_release();
    }
  }
  else
  {
    if (qword_26B1C1910 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_24E52CEF0();
    __swift_project_value_buffer(v26, (uint64_t)qword_26B1C18F8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v27 = sub_24E52CED0();
    os_log_type_t v28 = sub_24E52D1E0();
    if (os_log_type_enabled(v27, v28))
    {
      unint64_t v29 = *(void *)(v0 + 80);
      uint64_t v42 = *(void *)(v0 + 72);
      uint64_t v30 = swift_slowAlloc();
      uint64_t type = swift_slowAlloc();
      uint64_t v44 = type;
      *(_DWORD *)uint64_t v30 = 136446722;
      uint64_t v31 = sub_24E5076B0();
      *(void *)(v0 + 16) = sub_24E4F1740(v31, v32, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 24) = sub_24E4F1740(v3, v2, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v30 + 22) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 32) = sub_24E4F1740(v42, v29, &v44);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E4DA000, v27, v28, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v30, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](type, -1, -1);
      MEMORY[0x25333DD20](v30, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v33 = *(uint64_t (**)(void))(v0 + 8);
  return v33();
}

uint64_t sub_24E517670(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24E517690, v1, 0);
}

uint64_t sub_24E517690()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(int **)(v1 + 208);
  v0[4] = v2;
  if (v2)
  {
    v0[5] = *(void *)(v1 + 216);
    os_log_type_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[6] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E4F8258;
    uint64_t v4 = v0[2];
    return v7(v4);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_24E5177B8(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24E5177D8, v1, 0);
}

uint64_t sub_24E5177D8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(int **)(v1 + 224);
  v0[4] = v2;
  if (v2)
  {
    v0[5] = *(void *)(v1 + 232);
    os_log_type_t v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[6] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E4F84B0;
    uint64_t v4 = v0[2];
    return v7(v4);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_24E517900()
{
  uint64_t v1 = type metadata accessor for MessageContext();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 96) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6);
  unint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  if (!v8) {
    v9(v0 + v3, v6);
  }
  v9(v5 + *(int *)(v1 + 20), v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v5 + *(int *)(v1 + 44);
  uint64_t v11 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24E517AF4()
{
  uint64_t v2 = *(void *)(type metadata accessor for MessageContext() - 8);
  uint64_t v3 = *(int **)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  char v6 = *(unsigned char *)(v0 + 64);
  long long v12 = *(_OWORD *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v9 = swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *(void *)uint64_t v9 = v1;
  *(void *)(v9 + 8) = sub_24E4FBA64;
  *(void *)(v9 + 40) = v4;
  *(unsigned char *)(v9 + 16) = v6;
  *(void *)(v9 + 48) = v5;
  *(_OWORD *)(v9 + 24) = v12;
  unint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v3 + *v3);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v9 + 56) = v10;
  *uint64_t v10 = v9;
  v10[1] = sub_24E4F0750;
  return v13(v9 + 40, v9 + 16, v7, v8);
}

uint64_t sub_24E517CA4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 104) & ~v3;
  unint64_t v5 = (*(void *)(*(void *)v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for MessageContext();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v5 + v7 + 8) & ~v7;
  uint64_t v18 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  swift_bridgeObjectRelease();
  uint64_t v10 = v0 + v8;
  uint64_t v11 = sub_24E52CEC0();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v0 + v8, 1, v11);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  if (!v13) {
    v14(v0 + v8, v11);
  }
  v14(v10 + *(int *)(v6 + 20), v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = v10 + *(int *)(v6 + 44);
  uint64_t v16 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v8 + v18, v3 | v7 | 7);
}

uint64_t sub_24E517F60()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(type metadata accessor for MessageContext() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(int **)(v0 + 48);
  uint64_t v9 = *(void *)(v2 + 64);
  uint64_t v10 = *(void *)(v2 + 72);
  char v11 = *(unsigned char *)(v2 + 80);
  long long v18 = *(_OWORD *)(v2 + 88);
  uint64_t v12 = v2 + v4;
  uint64_t v13 = *(void *)(v2 + v5);
  uint64_t v14 = v2 + v7;
  uint64_t v15 = swift_task_alloc();
  *(void *)(v1 + 16) = v15;
  *(void *)uint64_t v15 = v1;
  *(void *)(v15 + 8) = sub_24E4FBA64;
  *(void *)(v15 + 40) = v9;
  *(unsigned char *)(v15 + 16) = v11;
  *(void *)(v15 + 48) = v10;
  *(_OWORD *)(v15 + 24) = v18;
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v15 + 56) = v16;
  *uint64_t v16 = v15;
  v16[1] = sub_24E4FBA5C;
  return v19(v15 + 40, v15 + 16, v12, v13, v14);
}

uint64_t sub_24E51818C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 104) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessageContext();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v18 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = v0 + v8;
  uint64_t v11 = sub_24E52CEC0();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v0 + v8, 1, v11);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  if (!v13) {
    v14(v0 + v8, v11);
  }
  v14(v10 + *(int *)(v6 + 20), v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = v10 + *(int *)(v6 + 44);
  uint64_t v16 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v8 + v18, v3 | v7 | 7);
}

uint64_t sub_24E518434()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for MessageContext() - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  long long v13 = *(_OWORD *)(v0 + 64);
  LOBYTE(v4) = *(unsigned char *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = v0 + (v6 & ~v5);
  uint64_t v10 = swift_task_alloc();
  long long v11 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v10;
  *(void *)uint64_t v10 = v1;
  *(void *)(v10 + 8) = sub_24E4FBA64;
  *(void *)(v10 + 104) = v0 + v3;
  *(void *)(v10 + 112) = v9;
  *(void *)(v10 + 88) = v7;
  *(void *)(v10 + 96) = v8;
  *(unsigned char *)(v10 + 136) = v4;
  *(_OWORD *)(v10 + 72) = v13;
  *(_OWORD *)(v10 + 56) = v11;
  return MEMORY[0x270FA2498](sub_24E5144F8, 0, 0);
}

uint64_t sub_24E5185B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E518620(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E518668()
{
  uint64_t v1 = type metadata accessor for MessagingOptions();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  uint64_t v9 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v0 + v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v9 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_24E518830()
{
  uint64_t v2 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_24E4FBA64;
  uint64_t v9 = (void *)swift_task_alloc();
  v8[2] = v9;
  void *v9 = v8;
  v9[1] = sub_24E4FBA64;
  return sub_24E50EFD8(v4, v5, v6, v7);
}

uint64_t sub_24E518994()
{
  uint64_t v1 = type metadata accessor for MessagingOptions();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v9 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v0 + v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4)) {
    v6(v7, v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v9 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_24E518B4C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_24E4FBA64;
  return sub_24E51110C(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_24E518C78()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v15 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = sub_24E52CEC0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v0 + v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v8 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v10)) {
    v12(v13, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v15 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E518EE0()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_24E4FA1A0;
  uint64_t v11 = (void *)swift_task_alloc();
  v10[2] = v11;
  *uint64_t v11 = v10;
  v11[1] = sub_24E4FBA64;
  return sub_24E50D9B0(v7, v8, v9);
}

uint64_t sub_24E51909C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v15 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_release();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = sub_24E52CEC0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v0 + v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v8 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v10)) {
    v12(v13, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v15 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E5192F4(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v9 = (v6 + v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 32);
  uint64_t v11 = v1 + v6;
  uint64_t v12 = v1 + v9;
  uint64_t v13 = *(void *)(v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v14;
  void *v14 = v3;
  v14[1] = sub_24E4FA1A0;
  return sub_24E510A24(a1, v10, v11, v12, v13);
}

uint64_t sub_24E51947C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  unint64_t v5 = (*(void *)(*(void *)v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v14 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v8 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v8, v1);
  sub_24E4F6988(*(void *)(v8 + v2[12]), *(void *)(v8 + v2[12] + 8));
  swift_bridgeObjectRelease();
  uint64_t v15 = (v5 + v7 + 8) & ~v7;
  uint64_t v9 = sub_24E52CEC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v11(v0 + v15, v9);
  swift_bridgeObjectRelease();
  uint64_t v12 = v0 + v15 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v12, 1, v9)) {
    v11(v12, v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((((v14 + v15 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E519708()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v0 + v3;
  uint64_t v9 = *(void *)(v0 + v4);
  uint64_t v10 = v0 + v6;
  uint64_t v11 = *(void *)(v0 + v7);
  uint64_t v12 = *(void *)(v0 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v13;
  void *v13 = v1;
  v13[1] = sub_24E4FBA64;
  uint64_t v14 = (void *)swift_task_alloc();
  v13[2] = v14;
  void *v14 = v13;
  v14[1] = sub_24E4FBA64;
  return sub_24E50BC88(v8, v9, v10, v11, v12);
}

uint64_t sub_24E5198F0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_24E52CDF0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v4 = (v20 + 40) & ~v20;
  unint64_t v5 = (((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v17 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v16 = *(void *)(*(void *)(v6 - 8) + 64);
  uint64_t v19 = type metadata accessor for Message();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v19 - 8) + 80);
  uint64_t v15 = *(void *)(*(void *)(v19 - 8) + 64);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = (v5 + v17 + 8) & ~v17;
  uint64_t v8 = sub_24E52CEC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v10(v0 + v18, v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v18 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v11, 1, v8)) {
    v10(v11, v8);
  }
  uint64_t v12 = (v18 + v16 + v7) & ~v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v12);
  uint64_t v13 = v0 + v12 + *(int *)(v19 + 40);
  sub_24E4F6988(*(void *)v13, *(void *)(v13 + 8));
  return MEMORY[0x270FA0238](v0, ((v15 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v20 | v17 | v7 | 7);
}

uint64_t sub_24E519C10(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24E52CDF0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v12 = (v9 + v10 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = *(void *)(v1 + 32);
  uint64_t v14 = v1 + v5;
  uint64_t v15 = *(void *)(v1 + v6);
  uint64_t v16 = *(void *)(v1 + v7);
  uint64_t v17 = v1 + v9;
  uint64_t v18 = v1 + v12;
  uint64_t v19 = *(void *)(v1 + ((*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v20;
  void *v20 = v2;
  v20[1] = sub_24E4FBA64;
  return sub_24E510110(a1, v13, v14, v15, v16, v17, v18, v19);
}

uint64_t sub_24E519E30()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for Message() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = type metadata accessor for MessagingOptions();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v16 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v9 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v9, v1);
  sub_24E4F6988(*(void *)(v9 + v2[12]), *(void *)(v9 + v2[12] + 8));
  uint64_t v10 = sub_24E52CEC0();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v0 + v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v13 = v0 + v8 + *(int *)(v6 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v10)) {
    v12(v13, v10);
  }
  unint64_t v14 = (v16 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E4F6988(*(void *)(v0 + v14), *(void *)(v0 + v14 + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, ((((v14 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_24E51A0BC()
{
  uint64_t v2 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = v0 + v3;
  uint64_t v10 = v0 + v6;
  uint64_t v11 = *(void *)(v0 + v7);
  uint64_t v12 = *(void *)(v0 + v7 + 8);
  uint64_t v13 = *(void *)(v0 + v8);
  uint64_t v14 = *(void *)(v0 + ((v8 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v15;
  *uint64_t v15 = v1;
  v15[1] = sub_24E4FBA64;
  uint64_t v16 = (void *)swift_task_alloc();
  v15[2] = v16;
  *uint64_t v16 = v15;
  v16[1] = sub_24E4FBA64;
  return sub_24E50A2C8(v9, v10, v11, v12, v13, v14);
}

uint64_t sub_24E51A2A8()
{
  uint64_t v1 = *((void *)v0 + 2);
  uint64_t v2 = type metadata accessor for MessagingOptions();
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  uint64_t v14 = *(void *)(*(void *)(v2 - 8) + 64);
  uint64_t v16 = v1;
  uint64_t v15 = type metadata accessor for Message();
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v15 - 8) + 80);
  uint64_t v13 = *(void *)(*(void *)(v15 - 8) + 64);
  swift_release();
  sub_24E4F6988(*((void *)v0 + 5), *((void *)v0 + 6));
  swift_bridgeObjectRelease();
  uint64_t v5 = &v0[(v3 + 64) & ~v3];
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(char *, uint64_t))(v7 + 8);
  v8(v5, v6);
  swift_bridgeObjectRelease();
  uint64_t v9 = &v5[*(int *)(v2 + 28)];
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v9, 1, v6)) {
    v8(v9, v6);
  }
  uint64_t v10 = (((v3 + 64) & ~v3) + v14 + v4) & ~v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *))(*(void *)(v16 - 8) + 8))(&v0[v10]);
  uint64_t v11 = &v0[v10 + *(int *)(v15 + 40)];
  sub_24E4F6988(*(void *)v11, *((void *)v11 + 1));
  return MEMORY[0x270FA0238](v0, ((v13 + v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v4 | 7);
}

uint64_t sub_24E51A524(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(type metadata accessor for MessagingOptions() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for Message() - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = v1[4];
  uint64_t v11 = v1[5];
  uint64_t v12 = v1[6];
  uint64_t v13 = v1[7];
  uint64_t v14 = (uint64_t)v1 + v6;
  uint64_t v15 = (uint64_t)v1 + v9;
  uint64_t v16 = *(void *)((char *)v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v17;
  *uint64_t v17 = v3;
  v17[1] = sub_24E4FBA64;
  return sub_24E50F8DC(a1, v10, v11, v12, v13, v14, v15, v16);
}

uint64_t sub_24E51A6CC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_24E4F7148((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_24E503560(v9, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v8;
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_24E52D430();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_24E51CAD0(a1);
    sub_24E515DD4(a2, v9);
    uint64_t v7 = sub_24E52D430();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a2, v7);
    return sub_24E51CAD0((uint64_t)v9);
  }
}

uint64_t sub_24E51A7DC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C1828);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24E52D430();
  __swift_allocate_value_buffer(v3, qword_26B1C1808);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_26B1C1808);
  sub_24E52D420();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.messagingCoder.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B1C1820 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24E52D430();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B1C1808);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_24E51A9BC()
{
  unint64_t v0 = sub_24E52D4B0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_24E51AA0C(char a1)
{
  return qword_24E52ED70[a1];
}

uint64_t sub_24E51AA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D338];
  return MEMORY[0x270F9F940](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24E51AA98(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v5 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAE8](a1, a2, WitnessTable, v5);
}

uint64_t sub_24E51AB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF8](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24E51AB74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9DAF0](a1, a2, a3, WitnessTable, v7);
}

uint64_t sub_24E51ABE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E51A9BC();
  *a1 = result;
  return result;
}

uint64_t sub_24E51AC14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24E51AA0C(*v1);
  *a1 = result;
  a1[1] = 0xE100000000000000;
  return result;
}

uint64_t sub_24E51AC44()
{
  return sub_24E51AA0C(*v0);
}

uint64_t sub_24E51AC64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E51AA08();
  *a1 = result;
  return result;
}

uint64_t sub_24E51AC8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24E51CAC8();
  *a1 = result;
  return result;
}

uint64_t sub_24E51ACB8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24E51AD0C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

BOOL static Message.MessageError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Message.MessageError.hash(into:)()
{
  return sub_24E52D630();
}

uint64_t Message.MessageError.hashValue.getter()
{
  return sub_24E52D660();
}

uint64_t sub_24E51ADF8()
{
  return sub_24E52D660();
}

uint64_t Message.type.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Message.version.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 36));
}

uint64_t Message.payloadLength.getter(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1 + 40));
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  uint64_t result = 0;
  switch(v4 >> 62)
  {
    case 1uLL:
      BOOL v6 = __OFSUB__(HIDWORD(v3), v3);
      int v7 = HIDWORD(v3) - v3;
      if (v6)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x24E51AEE0);
      }
      return v7;
    case 2uLL:
      uint64_t v10 = v3 + 16;
      uint64_t v8 = *(void *)(v3 + 16);
      uint64_t v9 = *(void *)(v10 + 8);
      uint64_t result = v9 - v8;
      if (!__OFSUB__(v9, v8)) {
        return result;
      }
      goto LABEL_8;
    case 3uLL:
      return result;
    default:
      return BYTE6(v4);
  }
}

uint64_t Message.init<A>(type:version:payload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  uint64_t v32 = a6;
  uint64_t v34 = a3;
  uint64_t v12 = sub_24E52D430();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = *(void *)(a4 - 8);
  uint64_t v36 = a1;
  uint64_t v16 = a1;
  uint64_t v17 = a4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(a7, v16, a4);
  uint64_t v31 = type metadata accessor for Message();
  *(void *)(a7 + *(int *)(v31 + 36)) = a2;
  sub_24E52CD90();
  swift_allocObject();
  sub_24E52CD80();
  if (qword_26B1C1820 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v12, (uint64_t)qword_26B1C1808);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v18, v12);
  v38[3] = MEMORY[0x263F8D4F8];
  LOBYTE(v38[0]) = 1;
  uint64_t v19 = (void (*)(char *, void))sub_24E52CD70();
  sub_24E51A6CC((uint64_t)v38, (uint64_t)v15);
  v19(v37, 0);
  sub_24E51BE48(a5, a5);
  uint64_t v20 = *(void *)(a5 - 8);
  swift_allocObject();
  uint64_t v21 = sub_24E52D0F0();
  uint64_t v22 = v34;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v23, v34, a5);
  sub_24E52D110();
  v38[0] = v21;
  v38[5] = v32;
  swift_getWitnessTable();
  uint64_t v24 = v33;
  uint64_t v25 = sub_24E52CD60();
  uint64_t v27 = v26;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, a5);
  if (v24)
  {
    os_log_type_t v28 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v28(v36, v17);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v28)(a7, v17);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v17);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v30 = (uint64_t *)(a7 + *(int *)(v31 + 40));
    *uint64_t v30 = v25;
    v30[1] = v27;
  }
  return result;
}

uint64_t type metadata accessor for Message()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Message.extract<A>()@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v20 = a3;
  uint64_t v4 = sub_24E52D240();
  uint64_t v18 = *(void *)(v4 - 8);
  uint64_t v19 = v4;
  MEMORY[0x270FA5388](v4);
  BOOL v6 = (char *)&v17 - v5;
  uint64_t v7 = sub_24E52D430();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E52CD50();
  swift_allocObject();
  sub_24E52CD40();
  if (qword_26B1C1820 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_26B1C1808);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v24[3] = MEMORY[0x263F8D4F8];
  LOBYTE(v24[0]) = 1;
  uint64_t v12 = (void (*)(unsigned char *, void))sub_24E52CD30();
  sub_24E51A6CC((uint64_t)v24, (uint64_t)v10);
  v12(v23, 0);
  sub_24E52D110();
  v24[5] = v21;
  swift_getWitnessTable();
  uint64_t v13 = v22;
  sub_24E52CD20();
  if (v13) {
    return swift_release();
  }
  swift_getWitnessTable();
  sub_24E52D1C0();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a1 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v6, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v19);
    type metadata accessor for Message.MessageError();
    swift_getWitnessTable();
    swift_allocError();
    *uint64_t v15 = 0;
    swift_willThrow();
    return swift_release();
  }
  swift_release();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v20, v6, a1);
}

uint64_t Message.encode(to:)(void *a1, uint64_t a2)
{
  v11[0] = a2;
  void v11[2] = *(void *)(a2 + 16);
  type metadata accessor for Message.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_24E52D530();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  BOOL v6 = (char *)v11 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v7 = v11[1];
  sub_24E52D680();
  LOBYTE(v12) = 0;
  uint64_t v8 = v11[3];
  sub_24E52D520();
  if (!v8)
  {
    uint64_t v9 = v11[0];
    LOBYTE(v12) = 1;
    sub_24E52D510();
    long long v12 = *(_OWORD *)(v7 + *(int *)(v9 + 40));
    char v13 = 2;
    sub_24E51BEE8();
    sub_24E52D520();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t Message.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v24 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v26 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Message.CodingKeys();
  swift_getWitnessTable();
  uint64_t v28 = sub_24E52D4F0();
  uint64_t v23 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v25 = a3;
  uint64_t v10 = type metadata accessor for Message();
  uint64_t v21 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v12 = (char *)&v20 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v27 = v9;
  uint64_t v13 = v29;
  sub_24E52D670();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v14 = v24;
  LOBYTE(v30) = 0;
  uint64_t v16 = v26;
  uint64_t v15 = v27;
  uint64_t v17 = v28;
  sub_24E52D4E0();
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v12, v16, a2);
  LOBYTE(v30) = 1;
  *(void *)&v12[*(int *)(v10 + 36)] = sub_24E52D4D0();
  char v31 = 2;
  sub_24E51BF3C();
  sub_24E52D4E0();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v15, v17);
  *(_OWORD *)&v12[*(int *)(v10 + 40)] = v30;
  uint64_t v18 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 16))(v22, v12, v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v12, v10);
}

uint64_t sub_24E51BC1C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Message.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_24E51BC3C(void *a1, uint64_t a2)
{
  return Message.encode(to:)(a1, a2);
}

uint64_t Message.description.getter(uint64_t a1)
{
  sub_24E52D380();
  swift_getWitnessTable();
  sub_24E52D540();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  sub_24E52D590();
  sub_24E52D020();
  sub_24E52D560();
  sub_24E52D020();
  swift_bridgeObjectRelease();
  sub_24E52D020();
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(a1 + 40));
  uint64_t v4 = *v3;
  switch((unint64_t)v3[1] >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v4), v4)) {
        goto LABEL_5;
      }
      __break(1u);
LABEL_7:
      __break(1u);
      JUMPOUT(0x24E51BE34);
    case 2uLL:
      if (!__OFSUB__(*(void *)(v4 + 24), *(void *)(v4 + 16))) {
        goto LABEL_5;
      }
      goto LABEL_7;
    default:
LABEL_5:
      sub_24E52D560();
      sub_24E52D020();
      swift_bridgeObjectRelease();
      sub_24E52D020();
      return 0;
  }
}

uint64_t sub_24E51BE48(uint64_t a1, uint64_t a2)
{
  if (swift_isClassType()) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3)
  {
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE930);
  }
  else
  {
    return MEMORY[0x270F9F4F8](0, a2);
  }
}

uint64_t type metadata accessor for Message.MessageError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Message.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_24E51BEE8()
{
  unint64_t result = qword_2698EE8A8[0];
  if (!qword_2698EE8A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2698EE8A8);
  }
  return result;
}

unint64_t sub_24E51BF3C()
{
  unint64_t result = qword_26B1C1760;
  if (!qword_26B1C1760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C1760);
  }
  return result;
}

uint64_t sub_24E51BF90()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E51BFAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24E51BFB4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24E51C05C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    uint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v12 = *(void *)v11;
    v11 += 15;
    *uint64_t v10 = v12;
    uint64_t v13 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v14 = *(void *)(v11 & 0xFFFFFFFFFFFFFFF8);
    unint64_t v15 = *(void *)((v11 & 0xFFFFFFFFFFFFFFF8) + 8);
    sub_24E4FB4A0(v14, v15);
    void *v13 = v14;
    v13[1] = v15;
  }
  return v4;
}

uint64_t sub_24E51C178(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  uint64_t v4 = (uint64_t *)((((a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  return sub_24E4F6988(v5, v6);
}

uint64_t sub_24E51C1F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (uint64_t *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  sub_24E4FB4A0(*v10, v12);
  void *v9 = v11;
  v9[1] = v12;
  return a1;
}

uint64_t sub_24E51C288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (uint64_t *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (uint64_t *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  sub_24E4FB4A0(*v10, v12);
  uint64_t v13 = *v9;
  unint64_t v14 = v9[1];
  uint64_t *v9 = v11;
  v9[1] = v12;
  sub_24E4F6988(v13, v14);
  return a1;
}

uint64_t sub_24E51C328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24E51C3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (uint64_t *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  sub_24E4F6988(v10, v11);
  return a1;
}

uint64_t sub_24E51C448(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0xC) {
    unsigned int v7 = 12;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x24E51C5B0);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0xC) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  uint64_t v17 = *(void *)((((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) >> 60;
  if (((4 * v17) & 0xC) != 0) {
    return 16 - ((4 * v17) & 0xC | (v17 >> 2));
  }
  else {
    return 0;
  }
}

void sub_24E51C5C4(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xC) {
    unsigned int v8 = 12;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0xC)
            {
              uint64_t v19 = (void *)((((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
              if (a2 > 0xC)
              {
                void *v19 = a2 - 13;
                v19[1] = 0;
              }
              else
              {
                void *v19 = 0;
                v19[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
              }
            }
            else
            {
              uint64_t v18 = *(void (**)(void))(v6 + 56);
              v18();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    unsigned int v17 = ~v8 + a2;
    bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x24E51C7CCLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_24E51C7F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_24E51C7FC(unsigned char *result, unsigned int a2, unsigned int a3)
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
    _OWORD *result = a2 + 1;
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
        JUMPOUT(0x24E51C8C8);
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
          _OWORD *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_24E51C8F0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_24E51C980(unsigned char *result, unsigned int a2, unsigned int a3)
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
    _OWORD *result = a2 + 2;
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
        JUMPOUT(0x24E51CA4CLL);
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
          _OWORD *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_24E51CA74()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E51CA90()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E51CAAC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E51CAC8()
{
  return 3;
}

uint64_t sub_24E51CAD0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE5F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessagingError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MessagingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    _OWORD *result = a2 + 3;
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
        JUMPOUT(0x24E51CC8CLL);
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
          _OWORD *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagingError()
{
  return &type metadata for MessagingError;
}

unint64_t sub_24E51CCC8()
{
  unint64_t result = qword_2698EE938;
  if (!qword_2698EE938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE938);
  }
  return result;
}

unint64_t sub_24E51CD1C(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000026;
      break;
    case 2:
      unint64_t result = 0x6772614C6F6F742ELL;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24E51CDB0()
{
  return sub_24E51CD1C(*v0);
}

uint64_t MessageContext.incomingResponseIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24E502FE4(v1, a1);
}

uint64_t MessageContext.outgoingResponseIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 20);
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for MessageContext()
{
  uint64_t result = qword_26B1C18D0;
  if (!qword_26B1C18D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t MessageContext.fromID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 24);
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v4 = *(void *)(v3 + 16);
  *(unsigned char *)a1 = *(unsigned char *)v3;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t MessageContext.toID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 28);
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v4 = *(void *)(v3 + 16);
  *(unsigned char *)a1 = *(unsigned char *)v3;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t MessageContext.serviceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for MessageContext() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageContext.expectsPeerResponse.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessageContext() + 36));
}

uint64_t MessageContext.fromServerStorage.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessageContext() + 40));
}

uint64_t MessageContext.serverReceivedTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 44);
  uint64_t v4 = sub_24E52CE60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t MessageContext.senderCorrelationIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for MessageContext() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

id sub_24E51D068@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1768);
  MEMORY[0x270FA5388](v4 - 8);
  int v89 = &v77[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_24E52CE60();
  uint64_t v90 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  int v87 = &v77[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v88 = &v77[-v9];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  MEMORY[0x270FA5388](v10 - 8);
  unsigned int v12 = &v77[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_24E52CEC0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  int v16 = &v77[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unsigned int v17 = (int *)type metadata accessor for MessageContext();
  uint64_t v18 = *((void *)v17 - 1);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = &v77[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((sub_24E51ECD0(a1) & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v84 = v16;
  id v21 = objc_msgSend(a1, sel_toID);
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v85 = a2;
    uint64_t v86 = v17;
    uint64_t v23 = sub_24E52CFF0();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v26 = IDSCopyLocalDeviceUniqueID();
    if (!v26)
    {
      if (qword_2698EE338 != -1) {
        swift_once();
      }
      uint64_t v55 = sub_24E52CEF0();
      __swift_project_value_buffer(v55, (uint64_t)qword_2698EEB50);
      uint64_t v43 = sub_24E52CED0();
      os_log_type_t v44 = sub_24E52D1E0();
      if (!os_log_type_enabled(v43, v44)) {
        goto LABEL_23;
      }
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      uint64_t v47 = "Ignoring IDSCopyLocalDeviceUniqueID() failed to return a value!";
      goto LABEL_22;
    }
    uint64_t v27 = (void *)v26;
    uint64_t v85 = a2;
    uint64_t v86 = v17;
    sub_24E52CFF0();

    uint64_t v91 = 0x3A656369766564;
    unint64_t v92 = 0xE700000000000000;
    sub_24E52D020();
    swift_bridgeObjectRelease();
    uint64_t v23 = v91;
    uint64_t v25 = (void *)v92;
  }
  uint64_t v82 = v6;
  uint64_t v83 = v14;
  uint64_t v28 = v13;
  id result = objc_msgSend(a1, sel_fromID);
  if (!result)
  {
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  long long v30 = result;
  uint64_t v31 = sub_24E52CFF0();
  uint64_t v33 = v32;

  v34._uint64_t countAndFlagsBits = v31;
  v34._object = v33;
  Destination.init(stringRepresentation:)(v34);
  uint64_t v35 = v93;
  if (!v93
    || (unint64_t v36 = v92,
        int v37 = v91,
        v38._uint64_t countAndFlagsBits = v23,
        v38._object = v25,
        FindMyMessaging::Destination_optional v94 = Destination.init(stringRepresentation:)(v38),
        (uint64_t v39 = v93) == 0))
  {
    swift_bridgeObjectRelease();

    uint64_t v48 = 1;
    a2 = v85;
    unsigned int v17 = v86;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v18 + 56))(a2, v48, 1, v17);
  }
  int v80 = v37;
  unint64_t v81 = v36;
  unint64_t v79 = v92;
  int v78 = v91;
  id result = objc_msgSend(a1, sel_outgoingResponseIdentifier, v94.value.destination._object);
  if (!result) {
    goto LABEL_38;
  }
  uint64_t v40 = result;
  sub_24E52CFF0();

  sub_24E52CE80();
  swift_bridgeObjectRelease();
  uint64_t v41 = v83;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v83 + 48))(v12, 1, v28) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24E4FB96C((uint64_t)v12, &qword_26B1C1770);
    a2 = v85;
    if (qword_2698EE338 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_24E52CEF0();
    __swift_project_value_buffer(v42, (uint64_t)qword_2698EEB50);
    uint64_t v43 = sub_24E52CED0();
    os_log_type_t v44 = sub_24E52D1E0();
    BOOL v45 = os_log_type_enabled(v43, v44);
    unsigned int v17 = v86;
    if (!v45) {
      goto LABEL_23;
    }
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v46 = 0;
    uint64_t v47 = "could not convert outgoingResponseIdentifier to UUID!";
LABEL_22:
    _os_log_impl(&dword_24E4DA000, v43, v44, v47, v46, 2u);
    MEMORY[0x25333DD20](v46, -1, -1);
LABEL_23:

LABEL_24:
    uint64_t v48 = 1;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v18 + 56))(a2, v48, 1, v17);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v41 + 32))(v84, v12, v28);
  uint64_t v49 = v86;
  os_log_type_t v50 = &v20[v86[6]];
  *os_log_type_t v50 = v80;
  *((void *)v50 + 1) = v81;
  *((void *)v50 + 2) = v35;
  uint64_t v51 = v49;
  uint64_t v52 = &v20[v49[7]];
  unsigned char *v52 = v78;
  *((void *)v52 + 1) = v79;
  *((void *)v52 + 2) = v39;
  id v53 = objc_msgSend(a1, sel_incomingResponseIdentifier);
  if (v53)
  {
    unint64_t v54 = v53;
    sub_24E52CFF0();

    sub_24E52CE80();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v20, 1, 1, v28);
  }
  unsigned int v17 = v51;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v41 + 16))(&v20[v51[5]], v84, v28);
  id result = objc_msgSend(a1, sel_serviceIdentifier);
  if (result)
  {
    unint64_t v56 = result;
    uint64_t v57 = v28;
    uint64_t v58 = sub_24E52CFF0();
    uint64_t v60 = v59;

    uint64_t v61 = (uint64_t *)&v20[v17[8]];
    *uint64_t v61 = v58;
    v61[1] = v60;
    v20[v17[9]] = objc_msgSend(a1, sel_expectsPeerResponse);
    v20[v17[10]] = objc_msgSend(a1, sel_fromServerStorage);
    id v62 = objc_msgSend(a1, sel_serverReceivedTime);
    uint64_t v63 = (uint64_t)v89;
    if (v62)
    {
      unint64_t v64 = v62;
      os_log_t v65 = v87;
      sub_24E52CE50();

      uint64_t v66 = v90;
      uint64_t v67 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v90 + 32);
      uint64_t v68 = v65;
      uint64_t v69 = v82;
      v67(v63, v68, v82);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v66 + 56))(v63, 0, 1, v69);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v63, 1, v69) != 1)
      {
        unint64_t v70 = v88;
        v67((uint64_t)v88, (unsigned char *)v63, v82);
LABEL_33:
        v67((uint64_t)&v20[v17[11]], v70, v82);
        id v71 = objc_msgSend(a1, sel_senderCorrelationIdentifier);
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = sub_24E52CFF0();
          unint64_t v75 = v74;
        }
        else
        {

          uint64_t v73 = 0;
          unint64_t v75 = 0xE000000000000000;
        }
        (*(void (**)(unsigned char *, uint64_t))(v83 + 8))(v84, v57);
        unint64_t v76 = (uint64_t *)&v20[v17[12]];
        *unint64_t v76 = v73;
        v76[1] = v75;
        a2 = v85;
        sub_24E51EFF0((uint64_t)v20, v85);
        uint64_t v48 = 0;
        return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v18 + 56))(a2, v48, 1, v17);
      }
    }
    else
    {
      uint64_t v66 = v90;
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v90 + 56))(v89, 1, 1, v82);
    }
    unint64_t v70 = v88;
    sub_24E52CE40();
    sub_24E4FB96C(v63, &qword_26B1C1768);
    uint64_t v67 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v66 + 32);
    goto LABEL_33;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t MessageContext.description.getter()
{
  return 60;
}

unint64_t sub_24E51DAC4()
{
  unint64_t result = qword_2698EE940;
  if (!qword_2698EE940)
  {
    type metadata accessor for MessageContext();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EE940);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageContext(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24E52CEC0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)a1 + a3[5], (char *)a2 + a3[5], v7);
    }
    else
    {
      uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
      v11(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      v11((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    }
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v12;
    uint64_t v15 = (char *)a2 + v12;
    char *v14 = *v15;
    uint64_t v16 = *((void *)v15 + 2);
    *((void *)v14 + 1) = *((void *)v15 + 1);
    *((void *)v14 + 2) = v16;
    unsigned int v17 = (char *)a1 + v13;
    uint64_t v18 = (char *)a2 + v13;
    *unsigned int v17 = *v18;
    uint64_t v19 = *((void *)v18 + 2);
    *((void *)v17 + 1) = *((void *)v18 + 1);
    *((void *)v17 + 2) = v19;
    uint64_t v20 = a3[8];
    uint64_t v21 = a3[9];
    uint64_t v22 = (uint64_t *)((char *)a1 + v20);
    uint64_t v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
    uint64_t v25 = a3[11];
    *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    Swift::String v34 = (char *)a1 + v25;
    uint64_t v26 = (char *)a2 + v25;
    uint64_t v27 = sub_24E52CE60();
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28(v34, v26, v27);
    uint64_t v29 = a3[12];
    long long v30 = (uint64_t *)((char *)a1 + v29);
    uint64_t v31 = (uint64_t *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    *long long v30 = *v31;
    v30[1] = v32;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MessageContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E52CEC0();
  uint64_t v5 = *(void *)(v4 - 8);
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  if (!v6) {
    v7(a1, v4);
  }
  v7(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = a1 + *(int *)(a2 + 44);
  uint64_t v9 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(&a1[a3[5]], &a2[a3[5]], v6);
  }
  else
  {
    uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v9(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    v9(&a1[a3[5]], &a2[a3[5]], v6);
  }
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *uint64_t v12 = *v13;
  uint64_t v14 = *((void *)v13 + 2);
  *((void *)v12 + 1) = *((void *)v13 + 1);
  *((void *)v12 + 2) = v14;
  uint64_t v15 = &a1[v11];
  uint64_t v16 = &a2[v11];
  *uint64_t v15 = *v16;
  uint64_t v17 = *((void *)v16 + 2);
  *((void *)v15 + 1) = *((void *)v16 + 1);
  *((void *)v15 + 2) = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v18];
  uint64_t v21 = &a2[v18];
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  a1[v19] = a2[v19];
  uint64_t v23 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  uint64_t v32 = &a1[v23];
  uint64_t v24 = &a2[v23];
  uint64_t v25 = sub_24E52CE60();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26(v32, v24, v25);
  uint64_t v27 = a3[12];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  uint64_t v30 = *((void *)v29 + 1);
  *(void *)uint64_t v28 = *(void *)v29;
  *((void *)v28 + 1) = v30;
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(&a1[a3[5]], &a2[a3[5]], v6);
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  char *v13 = *v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  *((void *)v13 + 2) = *((void *)v14 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[7];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *uint64_t v16 = *v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  *((void *)v16 + 2) = *((void *)v17 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)uint64_t v19 = *(void *)v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[9]] = a2[a3[9]];
  a1[a3[10]] = a2[a3[10]];
  uint64_t v21 = a3[11];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = sub_24E52CE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  uint64_t v25 = a3[12];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&a1[a3[5]], &a2[a3[5]], v6);
  }
  else
  {
    int v9 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v9(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    v9(&a1[a3[5]], &a2[a3[5]], v6);
  }
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v10];
  uint64_t v13 = &a2[v10];
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((void *)v12 + 2) = *((void *)v13 + 2);
  uint64_t v14 = &a1[v11];
  uint64_t v15 = &a2[v11];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((void *)v14 + 2) = *((void *)v15 + 2);
  uint64_t v16 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  a1[v16] = a2[v16];
  uint64_t v17 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = sub_24E52CE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  return a1;
}

char *assignWithTake for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(&a1[a3[5]], &a2[a3[5]], v6);
  uint64_t v12 = a3[6];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  char *v13 = *v14;
  uint64_t v16 = *((void *)v14 + 1);
  uint64_t v15 = *((void *)v14 + 2);
  *((void *)v13 + 1) = v16;
  *((void *)v13 + 2) = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *uint64_t v18 = *v19;
  uint64_t v21 = *((void *)v19 + 1);
  uint64_t v20 = *((void *)v19 + 2);
  *((void *)v18 + 1) = v21;
  *((void *)v18 + 2) = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v26 = *(void *)v24;
  uint64_t v25 = *((void *)v24 + 1);
  *(void *)uint64_t v23 = v26;
  *((void *)v23 + 1) = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v27] = a2[v27];
  uint64_t v28 = a3[11];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v31 = sub_24E52CE60();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 40))(v29, v30, v31);
  uint64_t v32 = a3[12];
  uint64_t v33 = &a1[v32];
  Swift::String v34 = &a2[v32];
  uint64_t v36 = *(void *)v34;
  uint64_t v35 = *((void *)v34 + 1);
  *(void *)uint64_t v33 = v36;
  *((void *)v33 + 1) = v35;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E51E888);
}

uint64_t sub_24E51E888(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_24E52CEC0();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6] + 16);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v15 = sub_24E52CE60();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[11];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for MessageContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E51EA24);
}

uint64_t sub_24E51EA24(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = sub_24E52CEC0();
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v15 = sub_24E52CE60();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[11];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

void sub_24E51EBAC()
{
  sub_24E504BFC();
  if (v0 <= 0x3F)
  {
    sub_24E52CEC0();
    if (v1 <= 0x3F)
    {
      sub_24E52CE60();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_24E51ECD0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_fromID);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_24E52CFF0();

    LOBYTE(v3) = sub_24E52D040();
    swift_bridgeObjectRelease();
    if (v3) {
      return 1;
    }
    id v13 = objc_msgSend(a1, sel_senderCorrelationIdentifier);
    if (v13)
    {

      return 1;
    }
    if (qword_2698EE338 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_24E52CEF0();
    __swift_project_value_buffer(v14, (uint64_t)qword_2698EEB50);
    id v6 = a1;
    uint64_t v7 = sub_24E52CED0();
    os_log_type_t v8 = sub_24E52D1E0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      id v15 = v6;
      sub_24E52D250();
      *uint64_t v10 = v6;

      uint64_t v12 = "Ignoring IDSMessageContext without a correlationIdentifier: %@";
      goto LABEL_14;
    }
LABEL_15:

    return 0;
  }
  if (qword_2698EE338 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24E52CEF0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2698EEB50);
  id v6 = a1;
  uint64_t v7 = sub_24E52CED0();
  os_log_type_t v8 = sub_24E52D1E0();
  if (!os_log_type_enabled(v7, v8)) {
    goto LABEL_15;
  }
  uint64_t v9 = (uint8_t *)swift_slowAlloc();
  uint64_t v10 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v9 = 138412290;
  id v11 = v6;
  sub_24E52D250();
  *uint64_t v10 = v6;

  uint64_t v12 = "Ignoring IDSMessageContext without a fromID: %@";
LABEL_14:
  _os_log_impl(&dword_24E4DA000, v7, v8, v12, v9, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
  swift_arrayDestroy();
  MEMORY[0x25333DD20](v10, -1, -1);
  MEMORY[0x25333DD20](v9, -1, -1);

  return 0;
}

uint64_t sub_24E51EFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24E51F054(void *a1, uint64_t a2)
{
}

uint64_t sub_24E51F074(uint64_t a1, const char *a2)
{
  uint64_t v2 = a1;
  uint64_t v33 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v47 = (unint64_t)(v3 + 63) >> 6;
  id v6 = (char *)v45 + 8;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  uint64_t v32 = result;
  if (v5) {
    goto LABEL_36;
  }
LABEL_6:
  int64_t v10 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v10 < v47)
    {
      unint64_t v11 = *(void *)(v33 + 8 * v10);
      ++v8;
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 1;
      if (v10 + 1 >= v47) {
        goto LABEL_37;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 2;
      if (v10 + 2 >= v47) {
        goto LABEL_37;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 3;
      if (v10 + 3 >= v47) {
        goto LABEL_37;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v8);
      if (v11)
      {
LABEL_21:
        unint64_t v5 = (v11 - 1) & v11;
        for (unint64_t i = __clz(__rbit64(v11)) + (v8 << 6); ; unint64_t i = v30 | (v8 << 6))
        {
          sub_24E4E0CAC(*(void *)(v2 + 48) + 40 * i, (uint64_t)v44);
          sub_24E4E0D08(*(void *)(v2 + 56) + 32 * i, (uint64_t)v6);
          v42[0] = v45[0];
          v42[1] = v45[1];
          uint64_t v43 = v46;
          v41[0] = v44[0];
          v41[1] = v44[1];
          sub_24E4E0CAC((uint64_t)v41, (uint64_t)&v34);
          if (swift_dynamicCast())
          {
            long long v38 = v37;
            uint64_t v14 = v43;
            id v15 = __swift_project_boxed_opaque_existential_1((void *)v42 + 1, v43);
            *((void *)&v40 + 1) = v14;
            boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v39);
            (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(boxed_opaque_existential_0, v15, v14);
          }
          else
          {
            uint64_t v17 = v6;
            if (qword_2698EE338 != -1) {
              swift_once();
            }
            uint64_t v18 = sub_24E52CEF0();
            __swift_project_value_buffer(v18, (uint64_t)qword_2698EEB50);
            sub_24E4E0CAC((uint64_t)v41, (uint64_t)&v34);
            uint64_t v19 = sub_24E52CED0();
            os_log_type_t v20 = sub_24E52D1E0();
            if (os_log_type_enabled(v19, v20))
            {
              uint64_t v21 = swift_slowAlloc();
              uint64_t v22 = swift_slowAlloc();
              *(void *)&long long v37 = v22;
              *(_DWORD *)uint64_t v21 = 136446210;
              uint64_t v23 = sub_24E52D330();
              *(void *)(v21 + 4) = sub_24E4F1740(v23, v24, (uint64_t *)&v37);
              swift_bridgeObjectRelease();
              sub_24E52A3A0((uint64_t)&v34);
              _os_log_impl(&dword_24E4DA000, v19, v20, a2, (uint8_t *)v21, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x25333DD20](v22, -1, -1);
              MEMORY[0x25333DD20](v21, -1, -1);
            }
            else
            {
              sub_24E52A3A0((uint64_t)&v34);
            }

            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v6 = v17;
            uint64_t v2 = v32;
          }
          sub_24E4FB96C((uint64_t)v41, &qword_2698EE3C8);
          if (*((void *)&v38 + 1))
          {
            long long v34 = v38;
            long long v35 = v39;
            long long v36 = v40;
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)sub_24E4F1618(0, v9[2] + 1, 1, v9);
              uint64_t v9 = (void *)result;
            }
            unint64_t v26 = v9[2];
            unint64_t v25 = v9[3];
            if (v26 >= v25 >> 1)
            {
              uint64_t result = (uint64_t)sub_24E4F1618((void *)(v25 > 1), v26 + 1, 1, v9);
              uint64_t v9 = (void *)result;
            }
            _OWORD v9[2] = v26 + 1;
            uint64_t v27 = &v9[6 * v26];
            long long v28 = v34;
            long long v29 = v36;
            uint64_t v27[3] = v35;
            v27[4] = v29;
            v27[2] = v28;
            if (!v5) {
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t result = sub_24E4FB96C((uint64_t)&v38, &qword_2698EEA50);
            if (!v5) {
              goto LABEL_6;
            }
          }
LABEL_36:
          unint64_t v30 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      int64_t v12 = v10 + 4;
      if (v12 < v47)
      {
        unint64_t v11 = *(void *)(v33 + 8 * v12);
        if (v11)
        {
          int64_t v8 = v12;
          goto LABEL_21;
        }
        while (1)
        {
          int64_t v8 = v12 + 1;
          if (__OFADD__(v12, 1)) {
            goto LABEL_39;
          }
          if (v8 >= v47) {
            break;
          }
          unint64_t v11 = *(void *)(v33 + 8 * v8);
          ++v12;
          if (v11) {
            goto LABEL_21;
          }
        }
      }
    }
LABEL_37:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24E51F518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E52D160();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24E52D150();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24E4FB96C(a1, (uint64_t *)&unk_26B1C19C0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E52D120();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24E51F6C4()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_2698EEB38);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2698EEB38);
  if (qword_2698EE338 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2698EEB50);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_24E51F78C(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v107 = a7;
  uint64_t v108 = a3;
  unint64_t v109 = a4;
  id v110 = a1;
  id v111 = a2;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v10 - 8);
  int64_t v12 = &v101[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1508);
  MEMORY[0x270FA5388](v13 - 8);
  id v15 = &v101[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = type metadata accessor for MessageContext();
  uint64_t v106 = *(void *)(v16 - 8);
  uint64_t v17 = *(void *)(v106 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = &v101[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = &v101[-v20];
  id v112 = v7;
  uint64_t v22 = &v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  uint64_t v23 = MEMORY[0x25333DDF0](&v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (!v23)
  {
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_24E52CEF0();
    __swift_project_value_buffer(v34, (uint64_t)qword_2698EEB38);
    id v112 = v112;
    long long v35 = sub_24E52CED0();
    os_log_type_t v36 = sub_24E52D1E0();
    if (os_log_type_enabled(v35, v36))
    {
      long long v37 = (uint8_t *)swift_slowAlloc();
      long long v38 = (void *)swift_slowAlloc();
      *(_DWORD *)long long v37 = 138412290;
      id v113 = v112;
      id v39 = v112;
      sub_24E52D250();
      *long long v38 = v112;

      _os_log_impl(&dword_24E4DA000, v35, v36, "MessagingDelegateTrampoline: No delegate for %@", v37, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v38, -1, -1);
      MEMORY[0x25333DD20](v37, -1, -1);

      return;
    }

    id v47 = v112;
    goto LABEL_18;
  }
  if (!v110)
  {
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_24E52CEF0();
    __swift_project_value_buffer(v40, (uint64_t)qword_2698EEB38);
    id v41 = v112;
    uint64_t v42 = sub_24E52CED0();
    os_log_type_t v43 = sub_24E52D1E0();
    if (os_log_type_enabled(v42, v43))
    {
      os_log_type_t v44 = (uint8_t *)swift_slowAlloc();
      BOOL v45 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v44 = 138412290;
      id v113 = v41;
      id v46 = v41;
      sub_24E52D250();
      *BOOL v45 = v41;

      _os_log_impl(&dword_24E4DA000, v42, v43, "MessagingDelegateTrampoline: No service for %@", v44, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v45, -1, -1);
      MEMORY[0x25333DD20](v44, -1, -1);
      swift_unknownObjectRelease();

      return;
    }

LABEL_35:
    swift_unknownObjectRelease();
    return;
  }
  if (!v111)
  {
    uint64_t v48 = qword_2698EE330;
    id v49 = v110;
    if (v48 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_24E52CEF0();
    __swift_project_value_buffer(v50, (uint64_t)qword_2698EEB38);
    id v51 = v112;
    long long v29 = sub_24E52CED0();
    os_log_type_t v52 = sub_24E52D1E0();
    if (os_log_type_enabled(v29, v52))
    {
      id v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      id v112 = v49;
      id v113 = v51;
      uint64_t v55 = (void *)v54;
      *(_DWORD *)id v53 = 138412290;
      id v56 = v51;
      sub_24E52D250();
      *uint64_t v55 = v51;

      _os_log_impl(&dword_24E4DA000, v29, v52, "MessagingDelegateTrampoline: No account for %@", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v55, -1, -1);
      MEMORY[0x25333DD20](v53, -1, -1);
      swift_unknownObjectRelease();
      goto LABEL_25;
    }

    goto LABEL_35;
  }
  uint64_t v105 = v23;
  if (v109 >> 60 == 15)
  {
    uint64_t v24 = qword_2698EE330;
    id v25 = v110;
    id v26 = v111;
    if (v24 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_24E52CEF0();
    __swift_project_value_buffer(v27, (uint64_t)qword_2698EEB38);
    id v28 = v112;
    long long v29 = sub_24E52CED0();
    os_log_type_t v30 = sub_24E52D1E0();
    if (os_log_type_enabled(v29, v30))
    {
      id v112 = v25;
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138412290;
      id v113 = v28;
      id v33 = v28;
      sub_24E52D250();
      *uint64_t v32 = v28;

      _os_log_impl(&dword_24E4DA000, v29, v30, "MessagingDelegateTrampoline: No data for %@", v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v32, -1, -1);
      MEMORY[0x25333DD20](v31, -1, -1);
      swift_unknownObjectRelease();

LABEL_25:
      id v57 = v112;
LABEL_44:

      return;
    }

    goto LABEL_35;
  }
  if (a6)
  {
    uint64_t v103 = *((void *)v22 + 1);
    id v104 = v110;
    id v58 = v111;
    sub_24E52B0A0(v108, v109);
    swift_bridgeObjectRetain();
    v59._uint64_t countAndFlagsBits = a5;
    v59._object = a6;
    Destination.init(stringRepresentation:)(v59);
    uint64_t v60 = v115;
    if (v115)
    {
      if (v107)
      {
        id v110 = v114;
        id v111 = v58;
        int v102 = v113;
        id v61 = v107;
        id v62 = objc_msgSend(v104, sel_serviceIdentifier);
        if (v62)
        {
          uint64_t v63 = v62;
          id v112 = (id)sub_24E52CFF0();
          uint64_t v65 = v64;

          id v66 = v61;
          sub_24E51D068(v66, (uint64_t)v15);
          uint64_t v67 = v106;
          if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v106 + 48))(v15, 1, v16) == 1)
          {

            swift_unknownObjectRelease();
            sub_24E52B08C(v108, v109);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            sub_24E4FB96C((uint64_t)v15, &qword_26B1C1508);
          }
          else
          {
            sub_24E52B4C8((uint64_t)v15, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for MessageContext);
            uint64_t v91 = sub_24E52D160();
            (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v12, 1, 1, v91);
            sub_24E52B460((uint64_t)v21, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for MessageContext);
            uint64_t v92 = *(unsigned __int8 *)(v67 + 80);
            id v107 = v66;
            uint64_t v93 = (v92 + 112) & ~v92;
            uint64_t v94 = swift_allocObject();
            *(void *)(v94 + 16) = 0;
            *(void *)(v94 + 24) = 0;
            uint64_t v95 = v103;
            *(void *)(v94 + 32) = v105;
            *(void *)(v94 + 40) = v95;
            id v96 = v111;
            *(void *)(v94 + 48) = v112;
            *(void *)(v94 + 56) = v65;
            uint64_t v97 = v108;
            *(void *)(v94 + 64) = v96;
            *(void *)(v94 + 72) = v97;
            uint64_t v98 = v60;
            unint64_t v99 = v109;
            *(void *)(v94 + 80) = v109;
            *(unsigned char *)(v94 + 88) = v102;
            *(void *)(v94 + 96) = v110;
            *(void *)(v94 + 104) = v98;
            sub_24E52B4C8((uint64_t)v19, v94 + v93, (uint64_t (*)(void))type metadata accessor for MessageContext);
            id v100 = v96;
            sub_24E52B0A0(v97, v99);
            swift_unknownObjectRetain();
            sub_24E51F518((uint64_t)v12, (uint64_t)&unk_2698EEA78, v94);
            swift_release();

            sub_24E52B08C(v97, v99);
            swift_unknownObjectRelease();

            sub_24E52AB94((uint64_t)v21);
          }
          return;
        }
        swift_bridgeObjectRelease();
        if (qword_2698EE330 != -1) {
          swift_once();
        }
        uint64_t v86 = sub_24E52CEF0();
        __swift_project_value_buffer(v86, (uint64_t)qword_2698EEB38);
        id v80 = v112;
        unint64_t v81 = sub_24E52CED0();
        os_log_type_t v87 = sub_24E52D1E0();
        if (os_log_type_enabled(v81, v87))
        {
          uint64_t v88 = (uint8_t *)swift_slowAlloc();
          int v89 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v88 = 138412290;
          id v113 = v80;
          id v90 = v80;
          sub_24E52D250();
          void *v89 = v80;

          _os_log_impl(&dword_24E4DA000, v81, v87, "MessagingDelegateTrampoline: serviceIdentifier for %@", v88, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v89, -1, -1);
          MEMORY[0x25333DD20](v88, -1, -1);

          sub_24E52B08C(v108, v109);
          goto LABEL_43;
        }

        swift_unknownObjectRelease();
      }
      else
      {
        int v78 = v58;
        swift_bridgeObjectRelease();
        if (qword_2698EE330 != -1) {
          swift_once();
        }
        uint64_t v79 = sub_24E52CEF0();
        __swift_project_value_buffer(v79, (uint64_t)qword_2698EEB38);
        id v80 = v112;
        unint64_t v81 = sub_24E52CED0();
        os_log_type_t v82 = sub_24E52D1E0();
        if (os_log_type_enabled(v81, v82))
        {
          uint64_t v83 = (uint8_t *)swift_slowAlloc();
          uint64_t v84 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v83 = 138412290;
          id v113 = v80;
          id v85 = v80;
          sub_24E52D250();
          void *v84 = v80;

          _os_log_impl(&dword_24E4DA000, v81, v82, "MessagingDelegateTrampoline: No context for %@", v83, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v84, -1, -1);
          MEMORY[0x25333DD20](v83, -1, -1);

          sub_24E52B08C(v108, v109);
          swift_unknownObjectRelease();

          return;
        }

        swift_unknownObjectRelease();
      }
      sub_24E52B08C(v108, v109);

      id v47 = v104;
      goto LABEL_18;
    }
  }
  else
  {
    id v68 = v110;
    id v69 = v111;
    sub_24E52B0A0(v108, v109);
  }
  id v70 = v112;
  if (qword_2698EE330 != -1) {
    swift_once();
  }
  uint64_t v71 = sub_24E52CEF0();
  __swift_project_value_buffer(v71, (uint64_t)qword_2698EEB38);
  id v72 = v70;
  uint64_t v73 = sub_24E52CED0();
  os_log_type_t v74 = sub_24E52D1E0();
  if (os_log_type_enabled(v73, v74))
  {
    unint64_t v75 = (uint8_t *)swift_slowAlloc();
    unint64_t v76 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v75 = 138412290;
    id v113 = v72;
    id v77 = v72;
    sub_24E52D250();
    *unint64_t v76 = v72;

    _os_log_impl(&dword_24E4DA000, v73, v74, "MessagingDelegateTrampoline: No fromID for %@", v75, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v76, -1, -1);
    MEMORY[0x25333DD20](v75, -1, -1);

    sub_24E52B08C(v108, v109);
LABEL_43:
    swift_unknownObjectRelease();
    id v57 = v111;
    goto LABEL_44;
  }

  swift_unknownObjectRelease();
  sub_24E52B08C(v108, v109);

  id v47 = v110;
LABEL_18:
}

uint64_t sub_24E5206D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 128) = v13;
  *(unsigned char *)(v8 + 152) = v11;
  *(_OWORD *)(v8 + 96) = v10;
  *(_OWORD *)(v8 + 112) = v12;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(void *)(v8 + 64) = a5;
  *(void *)(v8 + 72) = a6;
  *(void *)(v8 + 56) = a4;
  return MEMORY[0x270FA2498](sub_24E520720, 0, 0);
}

id sub_24E520720()
{
  id result = objc_msgSend(*(id *)(v0 + 88), sel_uniqueID);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v4 = *(void *)(v0 + 112);
    uint64_t v3 = *(void *)(v0 + 120);
    char v5 = *(unsigned char *)(v0 + 152);
    uint64_t v6 = *(void **)(v0 + 88);
    uint64_t v12 = *(void *)(v0 + 64);
    swift_getObjectType();
    uint64_t v7 = sub_24E52CFF0();
    uint64_t v9 = v8;

    *(void *)(v0 + 136) = v9;
    *(void *)(v0 + 40) = v7;
    *(void *)(v0 + 48) = v9;
    *(unsigned char *)(v0 + 16) = v5;
    *(void *)(v0 + 24) = v4;
    *(void *)(v0 + 32) = v3;
    uint64_t v11 = *(void *)(v12 + 24) + **(int **)(v12 + 24);
    long long v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v10;
    *long long v10 = v0;
    v10[1] = sub_24E5208C0;
    __asm { BRAA            X9, X16 }
  }
  __break(1u);
  return result;
}

uint64_t sub_24E5208C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_24E520AF8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v133 = a7;
  uint64_t v134 = a4;
  uint64_t v135 = a6;
  uint64_t v127 = a5;
  uint64_t v132 = a1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v131 = (uint64_t)&v123 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1508);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v123 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for MessageContext();
  uint64_t v128 = *(void *)(v15 - 8);
  uint64_t v16 = *(void *)(v128 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v129 = (uint64_t)&v123 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v130 = (uint64_t)&v123 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA58);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v123 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24E52CDF0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v137 = v22;
  uint64_t v138 = v23;
  uint64_t v24 = *(void *)(v23 + 64);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  id v26 = (char *)&v123 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  id v28 = (char *)&v123 - v27;
  id v139 = v7;
  long long v29 = &v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  uint64_t v30 = MEMORY[0x25333DDF0](v29);
  if (v30)
  {
    uint64_t v136 = v30;
    if (a2)
    {
      uint64_t v125 = *((void *)v29 + 1);
      uint64_t v126 = v28;
      sub_24E4FB9C8(a3, (uint64_t)v21, &qword_2698EEA58);
      uint64_t v31 = v137;
      uint64_t v32 = v138;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v138 + 48))(v21, 1, v137) == 1)
      {
        id v33 = a2;
        sub_24E4FB96C((uint64_t)v21, &qword_2698EEA58);
        if (qword_2698EE330 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_24E52CEF0();
        __swift_project_value_buffer(v34, (uint64_t)qword_2698EEB38);
        id v35 = v139;
        os_log_type_t v36 = sub_24E52CED0();
        os_log_type_t v37 = sub_24E52D1E0();
        if (os_log_type_enabled(v36, v37))
        {
          long long v38 = (uint8_t *)swift_slowAlloc();
          id v39 = (void *)swift_slowAlloc();
          *(_DWORD *)long long v38 = 138412290;
          id v140 = v35;
          id v40 = v35;
          sub_24E52D250();
          void *v39 = v35;

          _os_log_impl(&dword_24E4DA000, v36, v37, "MessagingDelegateTrampoline: No resourceURL for %@", v38, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v39, -1, -1);
          MEMORY[0x25333DD20](v38, -1, -1);
          swift_unknownObjectRelease();
        }
        else
        {

          swift_unknownObjectRelease();
        }
        return;
      }
      uint64_t v124 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
      v124(v126, v21, v31);
      uint64_t v54 = v31;
      if (v135)
      {
        id v55 = v133;
        if (v133)
        {
          if (v134)
          {
            id v56 = v132;
            if (v132)
            {
              id v123 = a2;
              id v133 = v55;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              id v57 = objc_msgSend(v56, sel_serviceIdentifier);
              if (v57)
              {
                id v58 = v57;
                uint64_t v59 = sub_24E52CFF0();
                id v139 = v60;

                id v61 = v133;
                sub_24E51D068(v61, (uint64_t)v14);
                uint64_t v62 = v128;
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v128 + 48))(v14, 1, v15) == 1)
                {
                  (*(void (**)(char *, uint64_t))(v138 + 8))(v126, v137);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();

                  swift_unknownObjectRelease();
                  sub_24E4FB96C((uint64_t)v14, &qword_26B1C1508);
                }
                else
                {
                  uint64_t v101 = (uint64_t)v14;
                  uint64_t v102 = v130;
                  sub_24E52B4C8(v101, v130, (uint64_t (*)(void))type metadata accessor for MessageContext);
                  uint64_t v103 = sub_24E52D160();
                  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v103 - 8) + 56))(v131, 1, 1, v103);
                  uint64_t v104 = v138;
                  uint64_t v105 = *(void (**)(char *, char *, uint64_t))(v138 + 16);
                  uint64_t v132 = (void *)v59;
                  uint64_t v106 = v137;
                  v105(v26, v126, v137);
                  sub_24E52B460(v102, v129, (uint64_t (*)(void))type metadata accessor for MessageContext);
                  uint64_t v107 = *(unsigned __int8 *)(v104 + 80);
                  id v133 = v61;
                  uint64_t v108 = (v107 + 72) & ~v107;
                  unint64_t v109 = (v24 + v108 + 7) & 0xFFFFFFFFFFFFFFF8;
                  unint64_t v110 = (v109 + 15) & 0xFFFFFFFFFFFFFFF8;
                  unint64_t v111 = (*(unsigned __int8 *)(v62 + 80) + v110 + 16) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
                  id v112 = (void *)swift_allocObject();
                  uint64_t v112[2] = 0;
                  v112[3] = 0;
                  uint64_t v113 = v125;
                  v112[4] = v136;
                  v112[5] = v113;
                  id v114 = v139;
                  v112[6] = v132;
                  v112[7] = v114;
                  uint64_t v115 = (char *)v112 + v108;
                  id v117 = v123;
                  uint64_t v116 = (void (*)(char *, char *))v124;
                  v112[8] = v123;
                  v116(v115, v26);
                  *(void *)((char *)v112 + v109) = v134;
                  uint64_t v118 = (void *)((char *)v112 + v110);
                  uint64_t v119 = v135;
                  *uint64_t v118 = v127;
                  v118[1] = v119;
                  sub_24E52B4C8(v129, (uint64_t)v112 + v111, (uint64_t (*)(void))type metadata accessor for MessageContext);
                  id v120 = v117;
                  swift_unknownObjectRetain();
                  sub_24E51F518(v131, (uint64_t)&unk_2698EEA68, (uint64_t)v112);

                  swift_unknownObjectRelease();
                  swift_release();
                  sub_24E52AB94(v130);
                  (*(void (**)(char *, uint64_t))(v104 + 8))(v126, v106);
                }
              }
              else
              {
                id v91 = v133;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (qword_2698EE330 != -1) {
                  swift_once();
                }
                uint64_t v92 = sub_24E52CEF0();
                __swift_project_value_buffer(v92, (uint64_t)qword_2698EEB38);
                id v93 = v139;
                uint64_t v94 = sub_24E52CED0();
                os_log_type_t v95 = sub_24E52D1E0();
                BOOL v96 = os_log_type_enabled(v94, v95);
                uint64_t v97 = v126;
                if (v96)
                {
                  uint64_t v98 = (uint8_t *)swift_slowAlloc();
                  unint64_t v99 = (void *)swift_slowAlloc();
                  *(_DWORD *)uint64_t v98 = 138412290;
                  id v140 = v93;
                  id v100 = v93;
                  uint64_t v97 = v126;
                  sub_24E52D250();
                  void *v99 = v93;

                  _os_log_impl(&dword_24E4DA000, v94, v95, "MessagingDelegateTrampoline: serviceIdentifier for %@", v98, 0xCu);
                  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
                  swift_arrayDestroy();
                  MEMORY[0x25333DD20](v99, -1, -1);
                  MEMORY[0x25333DD20](v98, -1, -1);
                }
                else
                {
                }
                uint64_t v122 = v138;

                swift_unknownObjectRelease();
                (*(void (**)(char *, uint64_t))(v122 + 8))(v97, v137);
              }
            }
            else
            {
              __break(1u);
            }
          }
          else
          {
            uint64_t v79 = qword_2698EE330;
            id v80 = a2;
            id v81 = v55;
            if (v79 != -1) {
              swift_once();
            }
            uint64_t v82 = sub_24E52CEF0();
            __swift_project_value_buffer(v82, (uint64_t)qword_2698EEB38);
            id v83 = v139;
            uint64_t v84 = sub_24E52CED0();
            os_log_type_t v85 = sub_24E52D1E0();
            if (os_log_type_enabled(v84, v85))
            {
              uint64_t v86 = swift_slowAlloc();
              id v139 = v80;
              os_log_type_t v87 = (uint8_t *)v86;
              uint64_t v88 = (void *)swift_slowAlloc();
              *(_DWORD *)os_log_type_t v87 = 138412290;
              id v140 = v83;
              id v89 = v83;
              uint64_t v54 = v137;
              sub_24E52D250();
              *uint64_t v88 = v83;

              _os_log_impl(&dword_24E4DA000, v84, v85, "MessagingDelegateTrampoline: No metadata for %@", v87, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
              swift_arrayDestroy();
              MEMORY[0x25333DD20](v88, -1, -1);
              id v90 = v87;
              id v80 = v139;
              MEMORY[0x25333DD20](v90, -1, -1);
            }
            else
            {
            }
            uint64_t v121 = v138;

            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v121 + 8))(v126, v54);
          }
          return;
        }
        uint64_t v74 = qword_2698EE330;
        id v65 = a2;
        if (v74 != -1) {
          swift_once();
        }
        uint64_t v75 = sub_24E52CEF0();
        __swift_project_value_buffer(v75, (uint64_t)qword_2698EEB38);
        id v67 = v139;
        id v68 = sub_24E52CED0();
        os_log_type_t v69 = sub_24E52D1E0();
        if (os_log_type_enabled(v68, v69))
        {
          id v70 = (uint8_t *)swift_slowAlloc();
          uint64_t v71 = (void *)swift_slowAlloc();
          *(_DWORD *)id v70 = 138412290;
          id v140 = v67;
          id v76 = v67;
          sub_24E52D250();
          *uint64_t v71 = v67;

          uint64_t v54 = v137;
          uint64_t v73 = "MessagingDelegateTrampoline: No context for %@";
          goto LABEL_38;
        }
      }
      else
      {
        uint64_t v64 = qword_2698EE330;
        id v65 = a2;
        if (v64 != -1) {
          swift_once();
        }
        uint64_t v66 = sub_24E52CEF0();
        __swift_project_value_buffer(v66, (uint64_t)qword_2698EEB38);
        id v67 = v139;
        id v68 = sub_24E52CED0();
        os_log_type_t v69 = sub_24E52D1E0();
        if (os_log_type_enabled(v68, v69))
        {
          id v70 = (uint8_t *)swift_slowAlloc();
          uint64_t v71 = (void *)swift_slowAlloc();
          *(_DWORD *)id v70 = 138412290;
          id v140 = v67;
          id v72 = v67;
          sub_24E52D250();
          *uint64_t v71 = v67;

          uint64_t v54 = v137;
          uint64_t v73 = "MessagingDelegateTrampoline: No fromID for %@";
LABEL_38:
          _os_log_impl(&dword_24E4DA000, v68, v69, v73, v70, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v71, -1, -1);
          MEMORY[0x25333DD20](v70, -1, -1);
LABEL_40:
          uint64_t v77 = v138;
          int v78 = v126;
          swift_unknownObjectRelease();

          (*(void (**)(char *, uint64_t))(v77 + 8))(v78, v54);
          return;
        }
      }

      goto LABEL_40;
    }
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_24E52CEF0();
    __swift_project_value_buffer(v47, (uint64_t)qword_2698EEB38);
    id v48 = v139;
    id v49 = sub_24E52CED0();
    os_log_type_t v50 = sub_24E52D1E0();
    if (os_log_type_enabled(v49, v50))
    {
      id v51 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v52 = (void *)swift_slowAlloc();
      *(_DWORD *)id v51 = 138412290;
      id v140 = v48;
      id v53 = v48;
      sub_24E52D250();
      void *v52 = v48;

      _os_log_impl(&dword_24E4DA000, v49, v50, "MessagingDelegateTrampoline: No account for %@", v51, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v52, -1, -1);
      MEMORY[0x25333DD20](v51, -1, -1);
      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_24E52CEF0();
    __swift_project_value_buffer(v41, (uint64_t)qword_2698EEB38);
    id v139 = v139;
    uint64_t v42 = sub_24E52CED0();
    os_log_type_t v43 = sub_24E52D1E0();
    if (os_log_type_enabled(v42, v43))
    {
      os_log_type_t v44 = (uint8_t *)swift_slowAlloc();
      BOOL v45 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v44 = 138412290;
      id v140 = v139;
      id v46 = v139;
      sub_24E52D250();
      *BOOL v45 = v139;

      _os_log_impl(&dword_24E4DA000, v42, v43, "MessagingDelegateTrampoline: No delegate for %@", v44, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v45, -1, -1);
      MEMORY[0x25333DD20](v44, -1, -1);
    }
    else
    {

      id v63 = v139;
    }
  }
}

uint64_t sub_24E521B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 152) = v12;
  *(_OWORD *)(v8 + 136) = v11;
  *(_OWORD *)(v8 + 120) = v10;
  *(void *)(v8 + 104) = a7;
  *(void *)(v8 + 112) = a8;
  *(void *)(v8 + 88) = a5;
  *(void *)(v8 + 96) = a6;
  *(void *)(v8 + 80) = a4;
  return MEMORY[0x270FA2498](sub_24E521BA4, 0, 0);
}

char sub_24E521BA4()
{
  uint64_t v21 = v0;
  id v1 = objc_msgSend(*(id *)(v0 + 112), sel_uniqueID);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)(v0 + 128);
    uint64_t v4 = *(void **)(v0 + 112);
    uint64_t v5 = sub_24E52CFF0();
    uint64_t v7 = v6;

    *(void *)(v0 + 160) = v7;
    *(void *)(v0 + 64) = v5;
    *(void *)(v0 + 72) = v7;
    if (*(void *)(sub_24E51F074(v3, "Dropping non-String metadata key: %{public}s") + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA30);
      uint64_t v8 = sub_24E52D490();
    }
    else
    {
      uint64_t v8 = MEMORY[0x263F8EE80];
    }
    uint64_t v20 = v8;
    uint64_t v9 = swift_bridgeObjectRetain();
    sub_24E529AD0(v9, 1, &v20);
    uint64_t v11 = *(void *)(v0 + 136);
    long long v10 = *(void **)(v0 + 144);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 168) = v20;
    swift_bridgeObjectRetain();
    v12._uint64_t countAndFlagsBits = v11;
    v12._object = v10;
    LOBYTE(v1) = Destination.init(stringRepresentation:)(v12);
    uint64_t v13 = *(void *)(v0 + 32);
    *(void *)(v0 + 176) = v13;
    if (v13)
    {
      uint64_t v19 = *(void *)(v0 + 88);
      uint64_t v15 = *(void *)(v0 + 16);
      uint64_t v14 = *(void *)(v0 + 24);
      swift_getObjectType();
      *(unsigned char *)(v0 + 40) = v15;
      *(void *)(v0 + 48) = v14;
      *(void *)(v0 + 56) = v13;
      uint64_t v18 = *(void *)(v19 + 32) + **(int **)(v19 + 32);
      uint64_t v16 = (void *)swift_task_alloc();
      *(void *)(v0 + 184) = v16;
      *uint64_t v16 = v0;
      v16[1] = sub_24E521E20;
      uint64_t v23 = *(void *)(v0 + 88);
      __asm { BRAA            X9, X16 }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return (char)v1;
}

uint64_t sub_24E521E20()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_24E522158(void *a1, void *a2, uint64_t a3, uint64_t a4, char *a5, void *a6)
{
  id v89 = a5;
  uint64_t v87 = a4;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v86 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1508);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for MessageContext();
  uint64_t v88 = *(void *)(v16 - 8);
  uint64_t v17 = *(void *)(v88 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v85 = (uint64_t)&v80 - v20;
  uint64_t v21 = &v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  uint64_t v22 = MEMORY[0x25333DDF0](&v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (!v22)
  {
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_24E52CEF0();
    __swift_project_value_buffer(v29, (uint64_t)qword_2698EEB38);
    id v89 = v6;
    uint64_t v30 = sub_24E52CED0();
    os_log_type_t v31 = sub_24E52D1E0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      id v33 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 138412290;
      uint64_t v90 = (uint64_t)v89;
      uint64_t v34 = v89;
      sub_24E52D250();
      void *v33 = v89;

      _os_log_impl(&dword_24E4DA000, v30, v31, "MessagingDelegateTrampoline: No delegate for %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v33, -1, -1);
      MEMORY[0x25333DD20](v32, -1, -1);

      return;
    }

    uint64_t v42 = v89;
LABEL_19:

    return;
  }
  if (!a2)
  {
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_24E52CEF0();
    __swift_project_value_buffer(v35, (uint64_t)qword_2698EEB38);
    os_log_type_t v36 = v6;
    os_log_type_t v37 = sub_24E52CED0();
    os_log_type_t v38 = sub_24E52D1E0();
    if (os_log_type_enabled(v37, v38))
    {
      id v39 = (uint8_t *)swift_slowAlloc();
      id v40 = (void *)swift_slowAlloc();
      *(_DWORD *)id v39 = 138412290;
      uint64_t v90 = (uint64_t)v36;
      uint64_t v41 = v36;
      sub_24E52D250();
      *id v40 = v36;

      _os_log_impl(&dword_24E4DA000, v37, v38, "MessagingDelegateTrampoline: No account for %@", v39, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v40, -1, -1);
      MEMORY[0x25333DD20](v39, -1, -1);
      swift_unknownObjectRelease();

      return;
    }

    goto LABEL_37;
  }
  uint64_t v84 = v22;
  if (a3)
  {
    if (v89)
    {
      if (a6)
      {
        if (!a1)
        {
          __break(1u);
          swift_unexpectedError();
          __break(1u);
          return;
        }
        uint64_t v23 = *((void *)v21 + 1);
        id v83 = a2;
        id v82 = a6;
        swift_bridgeObjectRetain();
        id v24 = objc_msgSend(a1, sel_serviceIdentifier);
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v81 = sub_24E52CFF0();
          uint64_t v27 = v26;

          if (*(void *)(sub_24E51F074(a3, "Dropping non-String message key: %{public}s") + 16))
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA30);
            uint64_t v28 = sub_24E52D490();
          }
          else
          {
            uint64_t v28 = MEMORY[0x263F8EE80];
          }
          uint64_t v66 = v88;
          uint64_t v90 = v28;
          uint64_t v67 = swift_bridgeObjectRetain();
          sub_24E529AD0(v67, 1, &v90);
          swift_bridgeObjectRelease();
          uint64_t v68 = v90;
          id v69 = v82;
          sub_24E51D068(v69, (uint64_t)v15);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v15, 1, v16) == 1)
          {
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            swift_unknownObjectRelease();
            sub_24E4FB96C((uint64_t)v15, &qword_26B1C1508);
          }
          else
          {
            uint64_t v88 = v27;
            uint64_t v70 = v23;
            uint64_t v71 = v85;
            sub_24E52B4C8((uint64_t)v15, v85, (uint64_t (*)(void))type metadata accessor for MessageContext);
            uint64_t v72 = sub_24E52D160();
            uint64_t v73 = (uint64_t)v86;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v86, 1, 1, v72);
            sub_24E52B460(v71, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for MessageContext);
            unint64_t v74 = (*(unsigned __int8 *)(v66 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
            uint64_t v75 = (void *)swift_allocObject();
            v75[2] = 0;
            v75[3] = 0;
            v75[4] = v84;
            v75[5] = v70;
            uint64_t v76 = v88;
            v75[6] = v81;
            v75[7] = v76;
            id v77 = v83;
            v75[8] = v83;
            v75[9] = v68;
            int v78 = v89;
            v75[10] = v87;
            v75[11] = v78;
            sub_24E52B4C8((uint64_t)v19, (uint64_t)v75 + v74, (uint64_t (*)(void))type metadata accessor for MessageContext);
            id v79 = v77;
            swift_unknownObjectRetain();
            sub_24E51F518(v73, (uint64_t)&unk_2698EEA40, (uint64_t)v75);

            swift_unknownObjectRelease();
            swift_release();
            sub_24E52AB94(v71);
          }
          return;
        }
        swift_bridgeObjectRelease();
        if (qword_2698EE330 != -1) {
          swift_once();
        }
        uint64_t v59 = sub_24E52CEF0();
        __swift_project_value_buffer(v59, (uint64_t)qword_2698EEB38);
        uint64_t v60 = v6;
        id v61 = sub_24E52CED0();
        os_log_type_t v62 = sub_24E52D1E0();
        if (os_log_type_enabled(v61, v62))
        {
          id v63 = (uint8_t *)swift_slowAlloc();
          uint64_t v64 = (void *)swift_slowAlloc();
          *(_DWORD *)id v63 = 138412290;
          uint64_t v90 = (uint64_t)v60;
          id v65 = v60;
          sub_24E52D250();
          *uint64_t v64 = v60;

          _os_log_impl(&dword_24E4DA000, v61, v62, "MessagingDelegateTrampoline: serviceIdentifier for %@", v63, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v64, -1, -1);
          MEMORY[0x25333DD20](v63, -1, -1);

          swift_unknownObjectRelease();
          return;
        }

        swift_unknownObjectRelease();
        uint64_t v42 = (char *)v82;
        goto LABEL_19;
      }
      uint64_t v56 = qword_2698EE330;
      id v44 = a2;
      if (v56 != -1) {
        swift_once();
      }
      uint64_t v57 = sub_24E52CEF0();
      __swift_project_value_buffer(v57, (uint64_t)qword_2698EEB38);
      id v46 = v6;
      uint64_t v47 = sub_24E52CED0();
      os_log_type_t v48 = sub_24E52D1E0();
      if (os_log_type_enabled(v47, v48))
      {
        id v49 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v50 = (void *)swift_slowAlloc();
        *(_DWORD *)id v49 = 138412290;
        uint64_t v90 = (uint64_t)v46;
        id v58 = v46;
        sub_24E52D250();
        *os_log_type_t v50 = v46;

        os_log_type_t v52 = "MessagingDelegateTrampoline: No context for %@";
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    uint64_t v53 = qword_2698EE330;
    id v44 = a2;
    if (v53 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_24E52CEF0();
    __swift_project_value_buffer(v54, (uint64_t)qword_2698EEB38);
    id v46 = v6;
    uint64_t v47 = sub_24E52CED0();
    os_log_type_t v48 = sub_24E52D1E0();
    if (os_log_type_enabled(v47, v48))
    {
      id v49 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v50 = (void *)swift_slowAlloc();
      *(_DWORD *)id v49 = 138412290;
      uint64_t v90 = (uint64_t)v46;
      id v55 = v46;
      sub_24E52D250();
      *os_log_type_t v50 = v46;

      os_log_type_t v52 = "MessagingDelegateTrampoline: No fromID for %@";
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v43 = qword_2698EE330;
    id v44 = a2;
    if (v43 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_24E52CEF0();
    __swift_project_value_buffer(v45, (uint64_t)qword_2698EEB38);
    id v46 = v6;
    uint64_t v47 = sub_24E52CED0();
    os_log_type_t v48 = sub_24E52D1E0();
    if (os_log_type_enabled(v47, v48))
    {
      id v49 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v50 = (void *)swift_slowAlloc();
      *(_DWORD *)id v49 = 138412290;
      uint64_t v90 = (uint64_t)v46;
      id v51 = v46;
      sub_24E52D250();
      *os_log_type_t v50 = v46;

      os_log_type_t v52 = "MessagingDelegateTrampoline: No message for %@";
LABEL_35:
      _os_log_impl(&dword_24E4DA000, v47, v48, v52, v49, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v50, -1, -1);
      MEMORY[0x25333DD20](v49, -1, -1);
      swift_unknownObjectRelease();

      return;
    }
  }
LABEL_36:

LABEL_37:
  swift_unknownObjectRelease();
}

uint64_t sub_24E522DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 136) = v11;
  *(void *)(v8 + 144) = v12;
  *(_OWORD *)(v8 + 120) = v10;
  *(void *)(v8 + 104) = a7;
  *(void *)(v8 + 112) = a8;
  *(void *)(v8 + 88) = a5;
  *(void *)(v8 + 96) = a6;
  *(void *)(v8 + 80) = a4;
  return MEMORY[0x270FA2498](sub_24E522E28, 0, 0);
}

char sub_24E522E28()
{
  id v1 = objc_msgSend(*(id *)(v0 + 112), sel_uniqueID);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v3 = *(void **)(v0 + 136);
    uint64_t v5 = *(void **)(v0 + 112);
    uint64_t v6 = sub_24E52CFF0();
    uint64_t v8 = v7;

    *(void *)(v0 + 152) = v8;
    *(void *)(v0 + 64) = v6;
    *(void *)(v0 + 72) = v8;
    *(void *)(v0 + 160) = sub_24E4E1784(MEMORY[0x263F8EE78]);
    swift_bridgeObjectRetain();
    v9._uint64_t countAndFlagsBits = v4;
    v9._object = v3;
    LOBYTE(v1) = Destination.init(stringRepresentation:)(v9);
    uint64_t v10 = *(void *)(v0 + 32);
    *(void *)(v0 + 168) = v10;
    if (v10)
    {
      uint64_t v17 = *(void *)(v0 + 88);
      uint64_t v12 = *(void *)(v0 + 16);
      uint64_t v11 = *(void *)(v0 + 24);
      swift_getObjectType();
      *(unsigned char *)(v0 + 40) = v12;
      *(void *)(v0 + 48) = v11;
      *(void *)(v0 + 56) = v10;
      uint64_t v15 = *(void *)(v17 + 40) + **(int **)(v17 + 40);
      uint64_t v13 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v13;
      void *v13 = v0;
      v13[1] = sub_24E523004;
      __asm { BRAA            X9, X16 }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return (char)v1;
}

uint64_t sub_24E523004()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_24E523260(void *a1, void *a2, uint64_t a3, unint64_t a4, int a5, void *a6)
{
  uint64_t v90 = a6;
  uint64_t v91 = a3;
  int v89 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24E52CEC0();
  id v93 = *(char **)(v16 - 8);
  uint64_t v17 = *((void *)v93 + 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v92 = (char *)&v84 - v20;
  uint64_t v21 = &v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  uint64_t v22 = MEMORY[0x25333DDF0](&v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v22)
  {
    if (a2)
    {
      uint64_t v88 = v22;
      if (a4)
      {
        uint64_t v86 = *((void *)v21 + 1);
        id v23 = a2;
        swift_bridgeObjectRetain();
        sub_24E52CE80();
        id v24 = v93;
        if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v93 + 6))(v15, 1, v16) == 1)
        {
          sub_24E4FB96C((uint64_t)v15, &qword_26B1C1770);
          if (qword_2698EE330 != -1) {
            swift_once();
          }
          uint64_t v25 = sub_24E52CEF0();
          __swift_project_value_buffer(v25, (uint64_t)qword_2698EEB38);
          uint64_t v26 = v6;
          swift_bridgeObjectRetain();
          uint64_t v27 = v26;
          uint64_t v28 = sub_24E52CED0();
          os_log_type_t v29 = sub_24E52D1E0();
          if (os_log_type_enabled(v28, v29))
          {
            uint64_t v30 = swift_slowAlloc();
            uint64_t v31 = swift_slowAlloc();
            id v87 = v23;
            uint64_t v32 = (void *)v31;
            uint64_t v33 = swift_slowAlloc();
            os_log_type_t v95 = (void *)v33;
            *(_DWORD *)uint64_t v30 = 136315394;
            swift_bridgeObjectRetain();
            uint64_t v94 = sub_24E4F1740(v91, a4, (uint64_t *)&v95);
            sub_24E52D250();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v30 + 12) = 2112;
            uint64_t v94 = (uint64_t)v27;
            uint64_t v34 = v27;
            sub_24E52D250();
            *uint64_t v32 = v27;

            _os_log_impl(&dword_24E4DA000, v28, v29, "MessagingDelegateTrampoline: identifier [%s] is not a valid UUID for %@", (uint8_t *)v30, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
            swift_arrayDestroy();
            MEMORY[0x25333DD20](v32, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x25333DD20](v33, -1, -1);
            MEMORY[0x25333DD20](v30, -1, -1);
            swift_unknownObjectRelease();
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_unknownObjectRelease();
          }
        }
        else
        {
          id v87 = v23;
          swift_bridgeObjectRelease();
          id v58 = (void (*)(char *, char *, uint64_t))*((void *)v24 + 4);
          v58(v92, v15, v16);
          if (a1)
          {
            id v59 = objc_msgSend(a1, sel_serviceIdentifier);
            if (v59)
            {
              uint64_t v60 = v59;
              uint64_t v91 = sub_24E52CFF0();
              uint64_t v85 = v61;

              uint64_t v62 = sub_24E52D160();
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v12, 1, 1, v62);
              uint64_t v84 = v58;
              id v63 = v93;
              (*((void (**)(char *, char *, uint64_t))v93 + 2))(v19, v92, v16);
              unint64_t v64 = (v63[80] + 72) & ~(unint64_t)v63[80];
              uint64_t v65 = v64 + v17;
              unint64_t v66 = (v64 + v17) & 0xFFFFFFFFFFFFFFF8;
              uint64_t v67 = (void *)swift_allocObject();
              uint64_t v67[2] = 0;
              v67[3] = 0;
              uint64_t v68 = v86;
              v67[4] = v88;
              v67[5] = v68;
              uint64_t v69 = v85;
              v67[6] = v91;
              v67[7] = v69;
              uint64_t v70 = (char *)v67 + v64;
              id v71 = v87;
              v67[8] = v87;
              v84(v70, v19, v16);
              *((unsigned char *)v67 + v65) = v89 & 1;
              uint64_t v72 = v90;
              *(void *)((char *)v67 + v66 + 8) = v90;
              id v73 = v71;
              swift_unknownObjectRetain();
              id v74 = v72;
              sub_24E51F518((uint64_t)v12, (uint64_t)&unk_2698EEA20, (uint64_t)v67);
              swift_unknownObjectRelease();

              swift_release();
              (*((void (**)(char *, uint64_t))v63 + 1))(v92, v16);
            }
            else
            {
              if (qword_2698EE330 != -1) {
                swift_once();
              }
              uint64_t v75 = sub_24E52CEF0();
              __swift_project_value_buffer(v75, (uint64_t)qword_2698EEB38);
              uint64_t v76 = v6;
              id v77 = sub_24E52CED0();
              os_log_type_t v78 = sub_24E52D1E0();
              if (os_log_type_enabled(v77, v78))
              {
                id v79 = (uint8_t *)swift_slowAlloc();
                uint64_t v80 = (void *)swift_slowAlloc();
                *(_DWORD *)id v79 = 138412290;
                os_log_type_t v95 = v76;
                uint64_t v81 = v76;
                sub_24E52D250();
                *uint64_t v80 = v76;

                _os_log_impl(&dword_24E4DA000, v77, v78, "MessagingDelegateTrampoline: serviceIdentifier for %@", v79, 0xCu);
                __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
                swift_arrayDestroy();
                MEMORY[0x25333DD20](v80, -1, -1);
                MEMORY[0x25333DD20](v79, -1, -1);
              }
              else
              {
              }
              id v82 = v87;
              id v83 = v93;
              swift_unknownObjectRelease();

              (*((void (**)(char *, uint64_t))v83 + 1))(v92, v16);
            }
          }
          else
          {
            __break(1u);
          }
        }
        return;
      }
      uint64_t v49 = qword_2698EE330;
      id v50 = a2;
      if (v49 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_24E52CEF0();
      __swift_project_value_buffer(v51, (uint64_t)qword_2698EEB38);
      os_log_type_t v52 = v6;
      uint64_t v53 = sub_24E52CED0();
      os_log_type_t v54 = sub_24E52D1E0();
      if (os_log_type_enabled(v53, v54))
      {
        id v55 = (uint8_t *)swift_slowAlloc();
        uint64_t v56 = (void *)swift_slowAlloc();
        *(_DWORD *)id v55 = 138412290;
        os_log_type_t v95 = v52;
        uint64_t v57 = v52;
        sub_24E52D250();
        *uint64_t v56 = v52;

        _os_log_impl(&dword_24E4DA000, v53, v54, "MessagingDelegateTrampoline: No identifier for %@", v55, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
        swift_arrayDestroy();
        MEMORY[0x25333DD20](v56, -1, -1);
        MEMORY[0x25333DD20](v55, -1, -1);
        swift_unknownObjectRelease();

        return;
      }
    }
    else
    {
      if (qword_2698EE330 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_24E52CEF0();
      __swift_project_value_buffer(v41, (uint64_t)qword_2698EEB38);
      uint64_t v42 = v6;
      uint64_t v43 = sub_24E52CED0();
      os_log_type_t v44 = sub_24E52D1E0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        id v46 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 138412290;
        os_log_type_t v95 = v42;
        uint64_t v47 = v42;
        sub_24E52D250();
        *id v46 = v42;

        _os_log_impl(&dword_24E4DA000, v43, v44, "MessagingDelegateTrampoline: No account for %@", v45, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
        swift_arrayDestroy();
        MEMORY[0x25333DD20](v46, -1, -1);
        MEMORY[0x25333DD20](v45, -1, -1);
        swift_unknownObjectRelease();

        return;
      }
    }
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_24E52CEF0();
    __swift_project_value_buffer(v35, (uint64_t)qword_2698EEB38);
    id v93 = v6;
    os_log_type_t v36 = sub_24E52CED0();
    os_log_type_t v37 = sub_24E52D1E0();
    if (os_log_type_enabled(v36, v37))
    {
      os_log_type_t v38 = (uint8_t *)swift_slowAlloc();
      id v39 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v38 = 138412290;
      os_log_type_t v95 = v93;
      id v40 = v93;
      sub_24E52D250();
      void *v39 = v93;

      _os_log_impl(&dword_24E4DA000, v36, v37, "MessagingDelegateTrampoline: No delegate for %@", v38, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v39, -1, -1);
      MEMORY[0x25333DD20](v38, -1, -1);
    }
    else
    {

      os_log_type_t v48 = v93;
    }
  }
}

uint64_t sub_24E523E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 72) = v10;
  *(void *)(v8 + 80) = v12;
  *(unsigned char *)(v8 + 96) = v11;
  *(void *)(v8 + 56) = a7;
  *(void *)(v8 + 64) = a8;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 32) = a4;
  return MEMORY[0x270FA2498](sub_24E523E9C, 0, 0);
}

id sub_24E523E9C()
{
  id result = objc_msgSend(*(id *)(v0 + 64), sel_uniqueID);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void **)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 40);
    uint64_t ObjectType = swift_getObjectType();

    uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 + 8) + **(int **)(v13 + 8));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_24E523FF0;
    uint64_t v6 = *(unsigned __int8 *)(v0 + 96);
    uint64_t v7 = *(void *)(v0 + 72);
    uint64_t v8 = *(void *)(v0 + 80);
    uint64_t v9 = *(void *)(v0 + 56);
    uint64_t v10 = *(void *)(v0 + 40);
    uint64_t v11 = *(void *)(v0 + 48);
    return (id)v12(v11, v9, v0 + 16, v7, v6, v8, ObjectType, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24E523FF0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_24E5241B8(void *a1, void *a2, void *a3, unint64_t a4, uint64_t a5, char *a6)
{
  uint64_t v7 = v6;
  uint64_t v96 = a5;
  id v98 = a3;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1770);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v100 = (char *)sub_24E52CEC0();
  uint64_t v97 = *((void *)v100 - 1);
  uint64_t v18 = *(void *)(v97 + 64);
  uint64_t v19 = MEMORY[0x270FA5388](v100);
  uint64_t v20 = (char *)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  unint64_t v99 = (char *)&v92 - v21;
  uint64_t v22 = &v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  uint64_t v23 = MEMORY[0x25333DDF0](&v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (!v23)
  {
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_24E52CEF0();
    __swift_project_value_buffer(v37, (uint64_t)qword_2698EEB38);
    id v100 = v7;
    os_log_type_t v38 = sub_24E52CED0();
    os_log_type_t v39 = sub_24E52D1E0();
    if (os_log_type_enabled(v38, v39))
    {
      id v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      *(_DWORD *)id v40 = 138412290;
      uint64_t v101 = (uint64_t)v100;
      uint64_t v42 = v100;
      sub_24E52D250();
      *uint64_t v41 = v100;

      _os_log_impl(&dword_24E4DA000, v38, v39, "MessagingDelegateTrampoline: No delegate for %@", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v41, -1, -1);
      MEMORY[0x25333DD20](v40, -1, -1);

      return;
    }

LABEL_30:
    uint64_t v76 = v100;

    return;
  }
  if (a2)
  {
    uint64_t v95 = v23;
    if (a4)
    {
      uint64_t v93 = *((void *)v22 + 1);
      uint64_t v94 = a1;
      id v24 = a2;
      swift_bridgeObjectRetain();
      sub_24E52CE80();
      uint64_t v25 = v97;
      uint64_t v26 = v100;
      if ((*(unsigned int (**)(char *, uint64_t, char *))(v97 + 48))(v17, 1, v100) == 1)
      {
        uint64_t v27 = v24;
        sub_24E4FB96C((uint64_t)v17, &qword_26B1C1770);
        if (qword_2698EE330 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_24E52CEF0();
        __swift_project_value_buffer(v28, (uint64_t)qword_2698EEB38);
        os_log_type_t v29 = v7;
        swift_bridgeObjectRetain();
        uint64_t v30 = v29;
        uint64_t v31 = sub_24E52CED0();
        os_log_type_t v32 = sub_24E52D1E0();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = swift_slowAlloc();
          uint64_t v34 = (void *)swift_slowAlloc();
          uint64_t v35 = swift_slowAlloc();
          uint64_t v101 = v35;
          *(_DWORD *)uint64_t v33 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v103 = sub_24E4F1740((uint64_t)v98, a4, &v101);
          id v98 = v27;
          sub_24E52D250();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v33 + 12) = 2112;
          uint64_t v103 = (uint64_t)v30;
          os_log_type_t v36 = v30;
          sub_24E52D250();
          *uint64_t v34 = v30;

          _os_log_impl(&dword_24E4DA000, v31, v32, "MessagingDelegateTrampoline: identifier [%s] is not a valid UUID for %@", (uint8_t *)v33, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v34, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v35, -1, -1);
          MEMORY[0x25333DD20](v33, -1, -1);
          swift_unknownObjectRelease();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_unknownObjectRelease();
        }
        return;
      }
      id v98 = v24;
      swift_bridgeObjectRelease();
      uint64_t v92 = *(void (**)(char *, char *, char *))(v25 + 32);
      v92(v99, v17, v26);
      uint64_t v58 = v25;
      if (a6)
      {
        id v59 = a6;
        uint64_t v60 = v94;
        if (v94)
        {
LABEL_24:
          swift_bridgeObjectRetain();
          id v61 = objc_msgSend(v60, sel_serviceIdentifier);
          if (v61)
          {
            uint64_t v62 = v61;
            uint64_t v63 = sub_24E52CFF0();
            id v100 = v59;
            unint64_t v64 = v26;
            uint64_t v65 = v63;
            uint64_t v97 = v66;

            uint64_t v67 = sub_24E52D160();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v14, 1, 1, v67);
            (*(void (**)(char *, char *, char *))(v58 + 16))(v20, v99, v64);
            unint64_t v68 = (*(unsigned __int8 *)(v58 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
            uint64_t v69 = (char *)swift_allocObject();
            *((void *)v69 + 2) = 0;
            *((void *)v69 + 3) = 0;
            uint64_t v70 = v93;
            *((void *)v69 + 4) = v95;
            *((void *)v69 + 5) = v70;
            uint64_t v71 = v97;
            *((void *)v69 + 6) = v65;
            *((void *)v69 + 7) = v71;
            id v72 = v98;
            *((void *)v69 + 8) = v98;
            v92(&v69[v68], v20, v64);
            id v73 = (uint64_t *)&v69[(v18 + v68 + 7) & 0xFFFFFFFFFFFFFFF8];
            id v74 = v100;
            *id v73 = v96;
            v73[1] = (uint64_t)v74;
            id v75 = v72;
            swift_unknownObjectRetain();
            sub_24E51F518((uint64_t)v14, (uint64_t)&unk_2698EEA10, (uint64_t)v69);
            swift_unknownObjectRelease();

            swift_release();
            (*(void (**)(char *, char *))(v58 + 8))(v99, v64);
            return;
          }
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t v77 = IDSCopyLocalDeviceUniqueID();
        uint64_t v60 = v94;
        if (!v77)
        {
          if (qword_2698EE330 != -1) {
            swift_once();
          }
          uint64_t v87 = sub_24E52CEF0();
          __swift_project_value_buffer(v87, (uint64_t)qword_2698EEB38);
          uint64_t v81 = sub_24E52CED0();
          os_log_type_t v88 = sub_24E52D1E0();
          BOOL v89 = os_log_type_enabled(v81, v88);
          id v90 = v98;
          if (v89)
          {
            uint64_t v91 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v91 = 0;
            _os_log_impl(&dword_24E4DA000, v81, v88, "Ignoring IDSCopyLocalDeviceUniqueID() failed to return a value!", v91, 2u);
            MEMORY[0x25333DD20](v91, -1, -1);
          }
          swift_unknownObjectRelease();

          goto LABEL_48;
        }
        os_log_type_t v78 = (void *)v77;
        sub_24E52CFF0();

        uint64_t v101 = 0x3A656369766564;
        unint64_t v102 = 0xE700000000000000;
        sub_24E52D020();
        uint64_t v58 = v97;
        swift_bridgeObjectRelease();
        id v59 = (char *)v102;
        uint64_t v96 = v101;
        uint64_t v26 = v100;
        if (v60) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_37:
      swift_bridgeObjectRelease();
      if (qword_2698EE330 != -1) {
        swift_once();
      }
      uint64_t v79 = sub_24E52CEF0();
      __swift_project_value_buffer(v79, (uint64_t)qword_2698EEB38);
      uint64_t v80 = v7;
      uint64_t v81 = sub_24E52CED0();
      os_log_type_t v82 = sub_24E52D1E0();
      if (os_log_type_enabled(v81, v82))
      {
        id v83 = (uint8_t *)swift_slowAlloc();
        uint64_t v84 = (void *)swift_slowAlloc();
        *(_DWORD *)id v83 = 138412290;
        uint64_t v101 = (uint64_t)v80;
        uint64_t v85 = v80;
        uint64_t v58 = v97;
        sub_24E52D250();
        void *v84 = v80;

        _os_log_impl(&dword_24E4DA000, v81, v82, "MessagingDelegateTrampoline: serviceIdentifier for %@", v83, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
        swift_arrayDestroy();
        MEMORY[0x25333DD20](v84, -1, -1);
        MEMORY[0x25333DD20](v83, -1, -1);
      }
      else
      {
      }
      id v86 = v98;
      swift_unknownObjectRelease();

LABEL_48:
      (*(void (**)(char *, char *))(v58 + 8))(v99, v100);
      return;
    }
    uint64_t v50 = qword_2698EE330;
    id v100 = a2;
    if (v50 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_24E52CEF0();
    __swift_project_value_buffer(v51, (uint64_t)qword_2698EEB38);
    os_log_type_t v52 = v7;
    uint64_t v53 = sub_24E52CED0();
    os_log_type_t v54 = sub_24E52D1E0();
    if (os_log_type_enabled(v53, v54))
    {
      id v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = (void *)swift_slowAlloc();
      *(_DWORD *)id v55 = 138412290;
      uint64_t v101 = (uint64_t)v52;
      uint64_t v57 = v52;
      sub_24E52D250();
      *uint64_t v56 = v52;

      _os_log_impl(&dword_24E4DA000, v53, v54, "MessagingDelegateTrampoline: No identifier for %@", v55, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v56, -1, -1);
      MEMORY[0x25333DD20](v55, -1, -1);
      swift_unknownObjectRelease();

      return;
    }

    swift_unknownObjectRelease();
    goto LABEL_30;
  }
  if (qword_2698EE330 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_24E52CEF0();
  __swift_project_value_buffer(v43, (uint64_t)qword_2698EEB38);
  os_log_type_t v44 = v7;
  uint64_t v45 = sub_24E52CED0();
  os_log_type_t v46 = sub_24E52D1E0();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v48 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 138412290;
    uint64_t v101 = (uint64_t)v44;
    uint64_t v49 = v44;
    sub_24E52D250();
    void *v48 = v44;

    _os_log_impl(&dword_24E4DA000, v45, v46, "MessagingDelegateTrampoline: No account for %@", v47, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v48, -1, -1);
    MEMORY[0x25333DD20](v47, -1, -1);
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
}

uint64_t sub_24E524EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 136) = v11;
  *(_OWORD *)(v8 + 120) = v10;
  *(void *)(v8 + 104) = a7;
  *(void *)(v8 + 112) = a8;
  *(void *)(v8 + 88) = a5;
  *(void *)(v8 + 96) = a6;
  *(void *)(v8 + 80) = a4;
  return MEMORY[0x270FA2498](sub_24E524F24, 0, 0);
}

char sub_24E524F24()
{
  id v1 = objc_msgSend(*(id *)(v0 + 112), sel_uniqueID);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v3 = *(void **)(v0 + 136);
  uint64_t v5 = *(void **)(v0 + 112);
  uint64_t v6 = sub_24E52CFF0();
  uint64_t v8 = v7;

  *(void *)(v0 + 144) = v8;
  *(void *)(v0 + 64) = v6;
  *(void *)(v0 + 72) = v8;
  swift_bridgeObjectRetain();
  v9._uint64_t countAndFlagsBits = v4;
  v9._object = v3;
  LOBYTE(v1) = Destination.init(stringRepresentation:)(v9);
  uint64_t v10 = *(void *)(v0 + 32);
  *(void *)(v0 + 152) = v10;
  if (!v10)
  {
LABEL_7:
    __break(1u);
    return (char)v1;
  }
  uint64_t v21 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 16);
  uint64_t v11 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  *(unsigned char *)(v0 + 40) = v12;
  *(void *)(v0 + 48) = v11;
  *(void *)(v0 + 56) = v10;
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 16)
                                                                                              + **(int **)(v21 + 16));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v14;
  void *v14 = v0;
  v14[1] = sub_24E5250D4;
  uint64_t v15 = *(void *)(v0 + 120);
  uint64_t v16 = *(void *)(v0 + 104);
  uint64_t v17 = *(void *)(v0 + 88);
  uint64_t v18 = *(void *)(v0 + 96);
  LOBYTE(v1) = v20(v18, v16, v0 + 64, v15, v0 + 40, ObjectType, v17);
  return (char)v1;
}

uint64_t sub_24E5250D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_24E525314(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_24E52CEF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v2[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  uint64_t v13 = MEMORY[0x25333DDF0](&v2[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v13)
  {
    id v77 = a1;
    os_log_type_t v78 = v11;
    uint64_t v79 = v2;
    uint64_t v80 = v13;
    uint64_t v81 = v5;
    if (!a2 || (v14 = *((void *)v12 + 1), (uint64_t v15 = sub_24E525C90(a2)) == 0))
    {
      if (qword_2698EE330 != -1) {
        swift_once();
      }
      uint64_t v21 = v81;
      uint64_t v22 = __swift_project_value_buffer(v81, (uint64_t)qword_2698EEB38);
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v22, v21);
      swift_bridgeObjectRetain_n();
      uint64_t v23 = sub_24E52CED0();
      os_log_type_t v24 = sub_24E52D1E0();
      if (!os_log_type_enabled(v23, v24))
      {

        swift_bridgeObjectRelease_n();
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v21);
        return;
      }
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      v84[0] = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      if (a2)
      {
        uint64_t v27 = v26;
        swift_bridgeObjectRetain();
        uint64_t v28 = sub_24E52D190();
        unint64_t v30 = v29;
        swift_bridgeObjectRelease();
        uint64_t v85 = sub_24E4F1740(v28, v30, v84);
        sub_24E52D250();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24E4DA000, v23, v24, "MessagingDelegateTrampoline: Unable to convert accounts to Set<IDSAccount> %s", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333DD20](v27, -1, -1);
        MEMORY[0x25333DD20](v25, -1, -1);
        swift_unknownObjectRelease();

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v81);
        return;
      }
      goto LABEL_52;
    }
    uint64_t v16 = v15;
    id v83 = (char *)(v15 & 0xC000000000000001);
    if ((v15 & 0xC000000000000001) != 0)
    {
      uint64_t v17 = sub_24E52D2F0();
      uint64_t v76 = v14;
      if (v17)
      {
LABEL_6:
        uint64_t v88 = MEMORY[0x263F8EE78];
        sub_24E4F1DF8(0, v17 & ~(v17 >> 63), 0);
        if (v83)
        {
          uint64_t v18 = sub_24E52D2B0();
          unsigned __int8 v20 = 1;
        }
        else
        {
          uint64_t v18 = sub_24E52A170(v16);
          unsigned __int8 v20 = v38 & 1;
        }
        uint64_t v85 = v18;
        uint64_t v86 = v19;
        unsigned __int8 v87 = v20;
        if ((v17 & 0x8000000000000000) == 0)
        {
          uint64_t v39 = v16 & 0xFFFFFFFFFFFFFF8;
          if (v16 < 0) {
            uint64_t v39 = v16;
          }
          uint64_t v82 = v39;
          while (1)
          {
            uint64_t v46 = v85;
            uint64_t v45 = v86;
            uint64_t v47 = v87;
            sub_24E529EF8(v85, v86, v87, v16);
            uint64_t v49 = v48;
            id v50 = objc_msgSend(v48, sel_uniqueID);
            if (!v50) {
              break;
            }
            uint64_t v51 = v50;
            uint64_t v52 = sub_24E52CFF0();
            uint64_t v54 = v53;

            uint64_t v55 = v88;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_24E4F1DF8(0, *(void *)(v55 + 16) + 1, 1);
              uint64_t v55 = v88;
            }
            unint64_t v57 = *(void *)(v55 + 16);
            unint64_t v56 = *(void *)(v55 + 24);
            if (v57 >= v56 >> 1)
            {
              sub_24E4F1DF8(v56 > 1, v57 + 1, 1);
              uint64_t v55 = v88;
            }
            *(void *)(v55 + 16) = v57 + 1;
            unint64_t v58 = v55 + 16 * v57;
            *(void *)(v58 + 32) = v52;
            *(void *)(v58 + 40) = v54;
            if (v83)
            {
              if ((v47 & 1) == 0) {
                goto LABEL_50;
              }
              if (sub_24E52D2C0()) {
                swift_isUniquelyReferenced_nonNull_native();
              }
              __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE9E0);
              id v59 = (void (*)(uint64_t *, void))sub_24E52D1B0();
              sub_24E52D310();
              v59(v84, 0);
              if (!--v17)
              {
LABEL_39:
                sub_24E503B18(v85, v86, v87);
                swift_bridgeObjectRelease();
                uint64_t v37 = v88;
                goto LABEL_40;
              }
            }
            else
            {
              uint64_t v40 = sub_24E503B24(v46, v45, v47, v16);
              uint64_t v42 = v41;
              char v44 = v43;
              sub_24E503B18(v46, v45, v47);
              uint64_t v85 = v40;
              uint64_t v86 = v42;
              unsigned __int8 v87 = v44 & 1;
              if (!--v17) {
                goto LABEL_39;
              }
            }
          }
          __break(1u);
LABEL_50:
          __break(1u);
          goto LABEL_51;
        }
        __break(1u);
LABEL_48:
        swift_once();
LABEL_44:
        __swift_project_value_buffer(v5, (uint64_t)qword_2698EEB38);
        uint64_t v70 = v11;
        uint64_t v71 = sub_24E52CED0();
        os_log_type_t v72 = sub_24E52D1E0();
        if (os_log_type_enabled(v71, v72))
        {
          id v73 = (uint8_t *)swift_slowAlloc();
          id v74 = (void *)swift_slowAlloc();
          *(_DWORD *)id v73 = 138412290;
          v84[0] = (uint64_t)v70;
          id v75 = v70;
          sub_24E52D250();
          *id v74 = v70;

          _os_log_impl(&dword_24E4DA000, v71, v72, "MessagingDelegateTrampoline: serviceIdentifier for %@", v73, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
          swift_arrayDestroy();
          MEMORY[0x25333DD20](v74, -1, -1);
          MEMORY[0x25333DD20](v73, -1, -1);
          swift_unknownObjectRelease();
        }
        else
        {

          swift_unknownObjectRelease();
        }
        return;
      }
    }
    else
    {
      uint64_t v17 = *(void *)(v15 + 16);
      uint64_t v76 = v14;
      if (v17) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_40:
    uint64_t v60 = sub_24E4F7058(v37);
    swift_bridgeObjectRelease();
    uint64_t v5 = v81;
    uint64_t v61 = (uint64_t)v78;
    uint64_t v11 = v79;
    if (!v77)
    {
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      return;
    }
    id v62 = objc_msgSend(v77, sel_serviceIdentifier);
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = sub_24E52CFF0();
      uint64_t v66 = v65;

      uint64_t v67 = sub_24E52D160();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v61, 1, 1, v67);
      unint64_t v68 = (void *)swift_allocObject();
      v68[2] = 0;
      v68[3] = 0;
      uint64_t v69 = v76;
      v68[4] = v80;
      v68[5] = v69;
      v68[6] = v64;
      v68[7] = v66;
      v68[8] = v60;
      sub_24E51F518(v61, (uint64_t)&unk_2698EE9F0, (uint64_t)v68);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
    if (qword_2698EE330 == -1) {
      goto LABEL_44;
    }
    goto LABEL_48;
  }
  if (qword_2698EE330 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v5, (uint64_t)qword_2698EEB38);
  id v83 = v2;
  uint64_t v31 = sub_24E52CED0();
  os_log_type_t v32 = sub_24E52D1E0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 138412290;
    v84[0] = (uint64_t)v83;
    uint64_t v35 = v83;
    sub_24E52D250();
    *uint64_t v34 = v83;

    _os_log_impl(&dword_24E4DA000, v31, v32, "MessagingDelegateTrampoline: No delegate for %@", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v34, -1, -1);
    MEMORY[0x25333DD20](v33, -1, -1);
  }
  else
  {

    os_log_type_t v36 = v83;
  }
}

uint64_t sub_24E525C90(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA00);
    uint64_t v2 = sub_24E52D370();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE88];
  }
  uint64_t v27 = a1 + 56;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v8 << 6);
      int64_t v12 = v8;
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v13 >= v26) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v12 = v8 + 1;
    if (!v14)
    {
      int64_t v12 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_39;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_39;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_39;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v12);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v10 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_28:
    sub_24E4E0CAC(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v28);
    uint64_t v16 = (void *)sub_24E52D320();
    sub_24E52A3A0((uint64_t)v28);
    self;
    uint64_t v17 = swift_dynamicCastObjCClass();
    if (!v17)
    {
      swift_release_n();

      sub_24E4E0DC4();
      return 0;
    }
    uint64_t v18 = v17;
    uint64_t result = sub_24E52D220();
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
          goto LABEL_41;
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
    *(void *)(*(void *)(v2 + 48) + 8 * v9) = v18;
    ++*(void *)(v2 + 16);
    int64_t v8 = v12;
    unint64_t v5 = v10;
  }
  int64_t v15 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_39:
    swift_release();
    sub_24E4E0DC4();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v15);
  if (v14)
  {
    int64_t v12 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_39;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_24E525FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 48) + **(int **)(a5 + 48));
  unint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  void *v14 = v8;
  v14[1] = sub_24E4FBA64;
  return v16(a6, a7, a8, ObjectType, a5);
}

uint64_t sub_24E526188(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24E52D3E0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_24E4E0D08(i, (uint64_t)v5);
    sub_24E4F6554(0, &qword_26B1C15A0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_24E52D3C0();
    sub_24E52D3F0();
    sub_24E52D400();
    sub_24E52D3D0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void sub_24E5262C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_24E52CEF0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v11 = (char *)v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1C19C0);
  MEMORY[0x270FA5388]();
  int64_t v13 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = &v4[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  int64_t v15 = (char *)MEMORY[0x25333DDF0](&v4[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v15)
  {
    uint64_t v51 = v15;
    if (a2)
    {
      uint64_t v50 = *((void *)v14 + 1);
      uint64_t v16 = sub_24E526188(a2);
      if (v16)
      {
        if (a1)
        {
          uint64_t v17 = v16;
          id v18 = objc_msgSend(a1, sel_serviceIdentifier);
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = sub_24E52CFF0();
            uint64_t v22 = v21;

            uint64_t v23 = sub_24E52D160();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v13, 1, 1, v23);
            BOOL v24 = (void *)swift_allocObject();
            v24[2] = 0;
            v24[3] = 0;
            uint64_t v25 = v50;
            int64_t v26 = v51;
            v24[4] = v17;
            v24[5] = v26;
            void v24[6] = v25;
            v24[7] = v20;
            v24[8] = v22;
            swift_bridgeObjectRetain();
            swift_unknownObjectRetain();
            swift_bridgeObjectRetain();
            sub_24E51F518((uint64_t)v13, a4, (uint64_t)v24);
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
          }
          else
          {
            swift_bridgeObjectRelease();
            if (qword_2698EE330 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v8, (uint64_t)qword_2698EEB38);
            char v43 = v4;
            char v44 = sub_24E52CED0();
            os_log_type_t v45 = sub_24E52D1E0();
            if (os_log_type_enabled(v44, v45))
            {
              uint64_t v46 = (uint8_t *)swift_slowAlloc();
              uint64_t v47 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v46 = 138412290;
              uint64_t v53 = (uint64_t)v43;
              os_log_type_t v48 = v43;
              sub_24E52D250();
              *uint64_t v47 = v43;

              _os_log_impl(&dword_24E4DA000, v44, v45, "MessagingDelegateTrampoline: serviceIdentifier for %@", v46, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
              swift_arrayDestroy();
              MEMORY[0x25333DD20](v47, -1, -1);
              MEMORY[0x25333DD20](v46, -1, -1);

              swift_unknownObjectRelease();
            }
            else
            {

              swift_unknownObjectRelease();
            }
          }
          return;
        }
        __break(1u);
LABEL_29:
        __break(1u);
        return;
      }
    }
    if (qword_2698EE330 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v8, (uint64_t)qword_2698EEB38);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v27, v8);
    swift_bridgeObjectRetain_n();
    uint64_t v28 = sub_24E52CED0();
    os_log_type_t v29 = sub_24E52D1E0();
    if (os_log_type_enabled(v28, v29))
    {
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v53 = v31;
      *(_DWORD *)unint64_t v30 = 136315138;
      if (!a2) {
        goto LABEL_29;
      }
      uint64_t v32 = v31;
      v49[1] = v30 + 4;
      uint64_t v33 = swift_bridgeObjectRetain();
      uint64_t v50 = MEMORY[0x263F8EE58] + 8;
      uint64_t v34 = MEMORY[0x25333D170](v33);
      unint64_t v36 = v35;
      swift_bridgeObjectRelease();
      uint64_t v52 = sub_24E4F1740(v34, v36, &v53);
      sub_24E52D250();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E4DA000, v28, v29, "MessagingDelegateTrampoline: Unable to convert devices to [IDSDevice] %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333DD20](v32, -1, -1);
      MEMORY[0x25333DD20](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return;
  }
  if (qword_2698EE330 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v8, (uint64_t)qword_2698EEB38);
  uint64_t v51 = v4;
  uint64_t v37 = sub_24E52CED0();
  os_log_type_t v38 = sub_24E52D1E0();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 138412290;
    uint64_t v53 = (uint64_t)v51;
    uint64_t v41 = v51;
    sub_24E52D250();
    *uint64_t v40 = v51;

    _os_log_impl(&dword_24E4DA000, v37, v38, "MessagingDelegateTrampoline: No delegate for %@", v39, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698EE4B8);
    swift_arrayDestroy();
    MEMORY[0x25333DD20](v40, -1, -1);
    MEMORY[0x25333DD20](v39, -1, -1);
  }
  else
  {

    uint64_t v42 = v51;
  }
}

uint64_t sub_24E526A14(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4) {
    uint64_t v10 = sub_24E52D0D0();
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a1;
  sub_24E5262C4(a3, v10, a5, a6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24E526AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[146] = a8;
  v8[145] = a7;
  v8[144] = a6;
  v8[143] = a5;
  v8[142] = a4;
  return MEMORY[0x270FA2498](sub_24E526AE8, 0, 0);
}

uint64_t sub_24E526AE8()
{
  uint64_t v46 = v0;
  unint64_t v1 = *(void *)(v0 + 1136);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24E52D460();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v44 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24E4F1DD8(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v44;
    uint64_t v6 = v43 + 16;
    uint64_t v7 = (_OWORD *)(v43 + 976);
    uint64_t v40 = *(void *)(v43 + 1136) + 32;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x25333D430](v5, *(void *)(v43 + 1136));
      }
      else {
        id v8 = *(id *)(v40 + 8 * v5);
      }
      id v9 = v8;
      sub_24E52B650(v9, (uint64_t)v45);

      long long v10 = v45[7];
      *(_OWORD *)(v43 + 1072) = v45[6];
      *(_OWORD *)(v43 + 1088) = v10;
      long long v11 = v45[9];
      *(_OWORD *)(v43 + 1104) = v45[8];
      *(_OWORD *)(v43 + 1120) = v11;
      long long v12 = v45[3];
      *(_OWORD *)(v43 + 1008) = v45[2];
      *(_OWORD *)(v43 + 1024) = v12;
      long long v13 = v45[5];
      *(_OWORD *)(v43 + 1040) = v45[4];
      *(_OWORD *)(v43 + 1056) = v13;
      long long v14 = v45[1];
      *uint64_t v7 = v45[0];
      *(_OWORD *)(v43 + 992) = v14;
      nullsub_1(v7);
      sub_24E4F65AC((uint64_t)v7, v6);
      unint64_t v16 = *(void *)(v44 + 16);
      unint64_t v15 = *(void *)(v44 + 24);
      if (v16 >= v15 >> 1) {
        sub_24E4F1DD8(v15 > 1, v16 + 1, 1);
      }
      ++v5;
      *(void *)(v44 + 16) = v16 + 1;
      sub_24E4F65AC(v6, v44 + 160 * v16 + 32);
    }
    while (v2 != v5);
  }
  uint64_t v17 = *(void *)(v3 + 16);
  if (v17)
  {
    uint64_t v18 = v43 + 336;
    uint64_t v19 = v43 + 496;
    uint64_t v41 = v43 + 656;
    uint64_t v20 = (_OWORD *)(v43 + 816);
    uint64_t v21 = v3 + 32;
    swift_bridgeObjectRetain();
    uint64_t v22 = v17 - 1;
    uint64_t v23 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      sub_24E4F65AC(v21, v19);
      sub_24E4F65AC(v19, v18);
      if (sub_24E4F66C0(v18) != 1)
      {
        sub_24E4F65AC(v19, v41);
        sub_24E4F6614(v41);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v23 = sub_24E4F1164(0, v23[2] + 1, 1, v23);
        }
        unint64_t v25 = v23[2];
        unint64_t v24 = v23[3];
        if (v25 >= v24 >> 1) {
          uint64_t v23 = sub_24E4F1164((void *)(v24 > 1), v25 + 1, 1, v23);
        }
        sub_24E4F65AC(v19, (uint64_t)v20);
        v23[2] = v25 + 1;
        int64_t v26 = &v23[20 * v25];
        long long v27 = *(_OWORD *)(v43 + 832);
        v26[2] = *v20;
        v26[3] = v27;
        long long v28 = *(_OWORD *)(v43 + 896);
        long long v30 = *(_OWORD *)(v43 + 848);
        long long v29 = *(_OWORD *)(v43 + 864);
        v26[6] = *(_OWORD *)(v43 + 880);
        v26[7] = v28;
        v26[4] = v30;
        v26[5] = v29;
        long long v31 = *(_OWORD *)(v43 + 960);
        long long v33 = *(_OWORD *)(v43 + 912);
        long long v32 = *(_OWORD *)(v43 + 928);
        _OWORD v26[10] = *(_OWORD *)(v43 + 944);
        v26[11] = v31;
        v26[8] = v33;
        v26[9] = v32;
      }
      if (!v22) {
        break;
      }
      --v22;
      v21 += 160;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = (void *)MEMORY[0x263F8EE78];
  }
  *(void *)(v43 + 1176) = v23;
  uint64_t v42 = *(void *)(v43 + 1152);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t))(*(void *)(v42 + 56)
                                                                             + **(int **)(v42 + 56));
  unint64_t v35 = (void *)swift_task_alloc();
  *(void *)(v43 + 1184) = v35;
  *unint64_t v35 = v43;
  v35[1] = sub_24E526EFC;
  uint64_t v36 = *(void *)(v43 + 1168);
  uint64_t v37 = *(void *)(v43 + 1152);
  uint64_t v38 = *(void *)(v43 + 1160);
  return v39(v38, v36, v23, ObjectType, v37);
}

uint64_t sub_24E526EFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_24E52703C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MessagingDelegateTrampoline()
{
  return self;
}

uint64_t sub_24E5270A8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E527184;
  return v6(a1);
}

uint64_t sub_24E527184()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E527280()
{
  long long v6 = *(_OWORD *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_24E4FBA64;
  *(void *)(v3 + 1168) = v2;
  *(_OWORD *)(v3 + 1152) = v6;
  *(_OWORD *)(v3 + 1136) = v4;
  return MEMORY[0x270FA2498](sub_24E526AE8, 0, 0);
}

uint64_t sub_24E52734C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E527384(uint64_t a1)
{
  long long v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E4FA1A0;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698EE9D0 + dword_2698EE9D0);
  return v6(a1, v4);
}

uint64_t sub_24E52743C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = a4;
  uint64_t v9 = sub_24E52CEC0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  long long v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for CorrelationIdentifier();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E52D620();
  sub_24E52B460(a1, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v16, v9);
    sub_24E52D630();
    sub_24E52B408();
    sub_24E52CFB0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    sub_24E52D630();
    sub_24E52D010();
    swift_bridgeObjectRelease();
  }
  sub_24E52D660();
  unint64_t v17 = sub_24E52D2A0();
  *(void *)((char *)a5 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v17;
  uint64_t result = sub_24E52B4C8(a1, a5[6] + *(void *)(v14 + 72) * v17, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
  uint64_t v19 = a5[7] + 24 * v17;
  *(unsigned char *)uint64_t v19 = a2;
  uint64_t v20 = v21;
  *(void *)(v19 + 8) = a3;
  *(void *)(v19 + 16) = v20;
  ++a5[2];
  return result;
}

uint64_t sub_24E5276E0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEAA8);
  char v38 = a2;
  uint64_t v6 = sub_24E52D480();
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
  unint64_t v35 = v2;
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
    uint64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = *(void *)(v5 + 48) + 24 * v20;
    char v30 = *(unsigned char *)v29;
    uint64_t v32 = *(void *)(v29 + 8);
    uint64_t v31 = *(void *)(v29 + 16);
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24E52D620();
    sub_24E52D630();
    sub_24E52D010();
    uint64_t result = sub_24E52D660();
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
    uint64_t v18 = *(void *)(v7 + 48) + 24 * v17;
    *(unsigned char *)uint64_t v18 = v30;
    *(void *)(v18 + 8) = v32;
    *(void *)(v18 + 16) = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24E527A14(uint64_t a1, char a2)
{
  return sub_24E528514(a1, a2, &qword_2698EE5A0, (void (*)(uint64_t, unsigned char *))sub_24E4F7148);
}

uint64_t sub_24E527A34(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24E52CEC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA80);
  int v45 = a2;
  uint64_t v10 = sub_24E52D480();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v41 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v42 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v44 = v6;
  unint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v17 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  for (i = v9; ; uint64_t v9 = i)
  {
    if (v15)
    {
      unint64_t v21 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v22 = v21 | (v19 << 6);
      goto LABEL_22;
    }
    int64_t v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int64_t v24 = v41;
    unint64_t v25 = v41[v23];
    ++v19;
    if (!v25)
    {
      int64_t v19 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v25 = v41[v19];
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v25 = v41[v26];
        if (!v25)
        {
          while (1)
          {
            int64_t v19 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v40) {
              goto LABEL_34;
            }
            unint64_t v25 = v41[v19];
            ++v26;
            if (v25) {
              goto LABEL_21;
            }
          }
        }
        int64_t v19 = v26;
      }
    }
LABEL_21:
    unint64_t v15 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v19 << 6);
LABEL_22:
    uint64_t v27 = *(void *)(v44 + 72);
    unint64_t v28 = *(void *)(v9 + 48) + v27 * v22;
    if (v45)
    {
      (*v16)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
    }
    else
    {
      (*v42)(v8, v28, v5);
      uint64_t v29 = *(void *)(*(void *)(v9 + 56) + 8 * v22);
      swift_retain();
    }
    sub_24E52B408();
    uint64_t result = sub_24E52CFA0();
    uint64_t v30 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v31) & ~*(void *)(v17 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v20 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v11 + 48) + v27 * v20, v8, v5);
    *(void *)(*(void *)(v11 + 56) + 8 * v20) = v29;
    ++*(void *)(v11 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = v41;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v9 + 32);
  if (v37 >= 64) {
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v37;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_24E527E28(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for CorrelationIdentifier();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA88);
  char v33 = (void *)sub_24E52D480();
  if (*(void *)(v9 + 16))
  {
    uint64_t v10 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v11 = *(void *)(v9 + 64);
    unint64_t v31 = v2;
    unint64_t v32 = (void *)(v9 + 64);
    uint64_t v12 = -1;
    if (v10 < 64) {
      uint64_t v12 = ~(-1 << v10);
    }
    unint64_t v13 = v12 & v11;
    int64_t v14 = (unint64_t)(v10 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v16 = 0;
    while (1)
    {
      if (v13)
      {
        unint64_t v21 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v22 = v21 | (v16 << 6);
      }
      else
      {
        int64_t v23 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        int64_t v24 = v32;
        if (v23 >= v14) {
          goto LABEL_23;
        }
        unint64_t v25 = v32[v23];
        ++v16;
        if (!v25)
        {
          int64_t v16 = v23 + 1;
          if (v23 + 1 >= v14) {
            goto LABEL_23;
          }
          unint64_t v25 = v32[v16];
          if (!v25)
          {
            int64_t v26 = v23 + 2;
            if (v26 >= v14)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v31;
                goto LABEL_30;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v9 + 32);
              if (v29 >= 64) {
                bzero(v24, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *int64_t v24 = -1 << v29;
              }
              uint64_t v3 = v31;
              *(void *)(v9 + 16) = 0;
              break;
            }
            unint64_t v25 = v32[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v16 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_32;
                }
                if (v16 >= v14) {
                  goto LABEL_23;
                }
                unint64_t v25 = v32[v16];
                ++v26;
                if (v25) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v16 = v26;
          }
        }
LABEL_20:
        unint64_t v13 = (v25 - 1) & v25;
        unint64_t v22 = __clz(__rbit64(v25)) + (v16 << 6);
      }
      uint64_t v27 = *(void *)(v9 + 48) + *(void *)(v6 + 72) * v22;
      if (a2)
      {
        sub_24E52B4C8(v27, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
        uint64_t v28 = *(void *)(v9 + 56) + 24 * v22;
        char v18 = *(unsigned char *)v28;
        uint64_t v19 = *(void *)(v28 + 8);
        uint64_t v20 = *(void *)(v28 + 16);
      }
      else
      {
        sub_24E52B460(v27, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
        uint64_t v17 = *(void *)(v9 + 56) + 24 * v22;
        char v18 = *(unsigned char *)v17;
        uint64_t v19 = *(void *)(v17 + 8);
        uint64_t v20 = *(void *)(v17 + 16);
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_24E52743C((uint64_t)v8, v18, v19, v20, v33);
    }
  }
  uint64_t result = swift_release();
LABEL_30:
  *uint64_t v3 = v33;
  return result;
}

uint64_t sub_24E528110(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for CorrelationIdentifier();
  uint64_t v45 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v47 = (uint64_t)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698EEA90);
  int v46 = a2;
  uint64_t v8 = sub_24E52D480();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v43) {
      break;
    }
    unint64_t v22 = v44;
    unint64_t v23 = v44[v21];
    ++v16;
    if (!v23)
    {
      int64_t v16 = v21 + 1;
      if (v21 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v23 = v44[v16];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v44[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v16 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v43) {
              goto LABEL_34;
            }
            unint64_t v23 = v44[v16];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v24;
      }
    }
LABEL_21:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v7 + 56);
    uint64_t v26 = v7;
    uint64_t v27 = *(void *)(v7 + 48) + 24 * v20;
    char v28 = *(unsigned char *)v27;
    uint64_t v30 = *(void *)(v27 + 8);
    uint64_t v29 = *(void *)(v27 + 16);
    uint64_t v31 = *(void *)(v45 + 72);
    uint64_t v32 = v25 + v31 * v20;
    if (v46)
    {
      sub_24E52B4C8(v32, v47, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    }
    else
    {
      sub_24E52B460(v32, v47, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
      swift_bridgeObjectRetain();
    }
    sub_24E52D620();
    sub_24E52D630();
    sub_24E52D010();
    uint64_t result = sub_24E52D660();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v14 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v17 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = *(void *)(v9 + 48) + 24 * v17;
    *(unsigned char *)uint64_t v18 = v28;
    *(void *)(v18 + 8) = v30;
    *(void *)(v18 + 16) = v29;
    uint64_t result = sub_24E52B4C8(v47, *(void *)(v9 + 56) + v31 * v17, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v26;
  }
  swift_release();
  uint64_t v3 = v42;
  unint64_t v22 = v44;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v22, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_24E528514(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, unsigned char *))
{
  uint64_t v6 = v4;
  uint64_t v8 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v9 = sub_24E52D480();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v38 = v8 + 64;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & *(void *)(v8 + 64);
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v14 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v37) {
      break;
    }
    unint64_t v22 = (void *)(v8 + 64);
    unint64_t v23 = *(void *)(v38 + 8 * v21);
    ++v16;
    if (!v23)
    {
      int64_t v16 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v38 + 8 * v16);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v37)
        {
LABEL_34:
          swift_release();
          if ((v39 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v38 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v16 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v37) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v38 + 8 * v16);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v24;
      }
    }
LABEL_21:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_22:
    uint64_t v25 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v20);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    uint64_t v28 = *(void *)(v8 + 56) + 32 * v20;
    if (v39)
    {
      a4(v28, v40);
    }
    else
    {
      sub_24E4E0D08(v28, (uint64_t)v40);
      swift_bridgeObjectRetain();
    }
    sub_24E52D620();
    sub_24E52D010();
    uint64_t result = sub_24E52D660();
    uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v14 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v30) & ~*(void *)(v14 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v14 + 8 * v31);
      }
      while (v35 == -1);
      unint64_t v17 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v10 + 48) + 16 * v17);
    *uint64_t v18 = v27;
    v18[1] = v26;
    uint64_t result = ((uint64_t (*)(unsigned char *, unint64_t))a4)(v40, *(void *)(v10 + 56) + 32 * v17);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v8 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
  if (v36 >= 64) {
    bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v36;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v6 = v10;
  return result;
}

uint64_t sub_24E528844(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_24E52D430();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1838);
  int v45 = a2;
  uint64_t v9 = sub_24E52D480();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    uint64_t v38 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v40 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v39 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    int v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v42 = v8;
    int64_t v43 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v39) {
          goto LABEL_34;
        }
        unint64_t v22 = v40[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v39) {
            goto LABEL_34;
          }
          unint64_t v22 = v40[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v39)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v38;
              if (v45)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                if (v36 >= 64) {
                  bzero(v40, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v40 = -1 << v36;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v40[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v22 = v40[v17];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_21:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
      uint64_t v27 = v43;
      uint64_t v28 = v44;
      if (v45)
      {
        (*v46)(v43, v26, v44);
        sub_24E4F7148((_OWORD *)(*(void *)(v8 + 56) + 32 * v20), v47);
      }
      else
      {
        (*v41)(v43, v26, v44);
        sub_24E4E0D08(*(void *)(v8 + 56) + 32 * v20, (uint64_t)v47);
      }
      uint64_t result = sub_24E52CFA0();
      uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v35 = *(void *)(v15 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      (*v46)((char *)(*(void *)(v10 + 48) + v25 * v18), (unint64_t)v27, v28);
      uint64_t result = (uint64_t)sub_24E4F7148(v47, (_OWORD *)(*(void *)(v10 + 56) + 32 * v18));
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      uint64_t v8 = v42;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

void *sub_24E528C40()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEAA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E52D470();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v18 = *(void *)(v17 + 16);
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    *(unsigned char *)uint64_t v22 = *(unsigned char *)v17;
    *(void *)(v22 + 8) = v19;
    *(void *)(v22 + 16) = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24E528E04()
{
  return sub_24E529638(&qword_2698EE5A0, (void (*)(unsigned char *, uint64_t))sub_24E4F7148);
}

void *sub_24E528E24()
{
  uint64_t v1 = sub_24E52CEC0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA80);
  int64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24E52D470();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *int64_t v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
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
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    uint64_t result = (void *)swift_retain();
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

char *sub_24E5290BC()
{
  uint64_t v1 = type metadata accessor for CorrelationIdentifier();
  uint64_t v36 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v35 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698EEA88);
  char v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_24E52D470();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v38 = v4;
  if (!v5)
  {
    uint64_t result = (char *)swift_release();
    uint64_t v30 = v38;
    uint64_t v29 = v32;
LABEL_25:
    *uint64_t v29 = v30;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (char *)(v4 + 64);
  uint64_t v8 = (char *)(v3 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  uint64_t v33 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    uint64_t result = (char *)memmove(result, v8, 8 * v9);
    uint64_t v6 = v38;
  }
  int64_t v10 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v37 = v3;
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v34 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v14 = (uint64_t)v35;
  uint64_t v15 = v38;
  while (1)
  {
    if (v13)
    {
      unint64_t v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v17 = v16 | (v10 << 6);
      uint64_t v18 = v37;
      goto LABEL_9;
    }
    int64_t v26 = v10 + 1;
    uint64_t v18 = v37;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    ++v10;
    if (!v27)
    {
      int64_t v10 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v10);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v27 - 1) & v27;
    unint64_t v17 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v36 + 72) * v17;
    sub_24E52B460(*(void *)(v18 + 48) + v19, v14, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t v20 = 24 * v17;
    uint64_t v21 = *(void *)(v18 + 56) + 24 * v17;
    char v22 = *(unsigned char *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    uint64_t v24 = *(void *)(v21 + 16);
    sub_24E52B4C8(v14, *(void *)(v15 + 48) + v19, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t v25 = *(void *)(v15 + 56) + v20;
    *(unsigned char *)uint64_t v25 = v22;
    *(void *)(v25 + 8) = v23;
    *(void *)(v25 + 16) = v24;
    uint64_t result = (char *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_23:
    uint64_t result = (char *)swift_release();
    uint64_t v29 = v32;
    uint64_t v30 = v38;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v28);
  if (v27)
  {
    int64_t v10 = v28;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v10 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v10);
    ++v28;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24E529384()
{
  uint64_t v1 = type metadata accessor for CorrelationIdentifier();
  uint64_t v33 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698EEA90);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_24E52D470();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v34 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v34;
    unint64_t v27 = v30;
LABEL_25:
    *unint64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v34;
  }
  uint64_t v31 = v4 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v4 + 48) + 24 * v15;
    char v18 = *(unsigned char *)v17;
    uint64_t v20 = *(void *)(v17 + 8);
    uint64_t v19 = *(void *)(v17 + 16);
    unint64_t v21 = *(void *)(v33 + 72) * v15;
    sub_24E52B460(*(void *)(v4 + 56) + v21, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t v22 = v34;
    uint64_t v23 = *(void *)(v34 + 48) + v16;
    *(unsigned char *)uint64_t v23 = v18;
    *(void *)(v23 + 8) = v20;
    *(void *)(v23 + 16) = v19;
    sub_24E52B4C8((uint64_t)v3, *(void *)(v22 + 56) + v21, (uint64_t (*)(void))type metadata accessor for CorrelationIdentifier);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    unint64_t v27 = v30;
    uint64_t v28 = v34;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24E529638(uint64_t *a1, void (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v5 = *v2;
  uint64_t v6 = sub_24E52D470();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v4 = v7;
    return result;
  }
  unint64_t v27 = v4;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
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
      goto LABEL_12;
    }
    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v11);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = 32 * v17;
    sub_24E4E0D08(*(void *)(v5 + 56) + 32 * v17, (uint64_t)v29);
    uint64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v23 = v20;
    v23[1] = v21;
    a2(v29, *(void *)(v7 + 56) + v22);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v4 = v27;
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24E529828()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24E52D430();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C1838);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24E52D470();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v23 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v25 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v23 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 32 * v16;
    sub_24E4E0D08(*(void *)(v6 + 56) + v18, (uint64_t)v26);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = sub_24E4F7148(v26, (_OWORD *)(*(void *)(v8 + 56) + v18));
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v24)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void sub_24E529AD0(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  sub_24E4FB9C8(a1 + 32, (uint64_t)&v44, &qword_2698EE470);
  uint64_t v7 = v44;
  uint64_t v8 = v45;
  uint64_t v42 = v44;
  uint64_t v43 = v45;
  sub_24E4F7148(v46, v41);
  unint64_t v9 = (void *)*a3;
  unint64_t v11 = sub_24E4FF2E8(v7, v8);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_24E529638(&qword_2698EEA30, (void (*)(unsigned char *, uint64_t))sub_24E4F7148);
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    unint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    int64_t v21 = (uint64_t *)(v20[6] + 16 * v11);
    uint64_t *v21 = v7;
    v21[1] = v8;
    sub_24E4F7148(v41, (_OWORD *)(v20[7] + 32 * v11));
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    uint64_t v25 = v4 - 1;
    if (!v25)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v26 = a1 + 80;
    while (1)
    {
      sub_24E4FB9C8(v26, (uint64_t)&v44, &qword_2698EE470);
      uint64_t v28 = v44;
      uint64_t v27 = v45;
      uint64_t v42 = v44;
      uint64_t v43 = v45;
      sub_24E4F7148(v46, v41);
      uint64_t v29 = (void *)*a3;
      unint64_t v30 = sub_24E4FF2E8(v28, v27);
      uint64_t v32 = v29[2];
      BOOL v33 = (v31 & 1) == 0;
      BOOL v23 = __OFADD__(v32, v33);
      uint64_t v34 = v32 + v33;
      if (v23) {
        break;
      }
      char v35 = v31;
      if (v29[3] < v34)
      {
        sub_24E528514(v34, 1, &qword_2698EEA30, (void (*)(uint64_t, unsigned char *))sub_24E4F7148);
        unint64_t v30 = sub_24E4FF2E8(v28, v27);
        if ((v35 & 1) != (v36 & 1)) {
          goto LABEL_25;
        }
      }
      if (v35) {
        goto LABEL_10;
      }
      uint64_t v37 = (void *)*a3;
      *(void *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      uint64_t v38 = (uint64_t *)(v37[6] + 16 * v30);
      *uint64_t v38 = v28;
      v38[1] = v27;
      sub_24E4F7148(v41, (_OWORD *)(v37[7] + 32 * v30));
      uint64_t v39 = v37[2];
      BOOL v23 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v37[2] = v40;
      v26 += 48;
      if (!--v25) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_24E528514(v14, a2 & 1, &qword_2698EEA30, (void (*)(uint64_t, unsigned char *))sub_24E4F7148);
  unint64_t v16 = sub_24E4FF2E8(v7, v8);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v18 = (void *)swift_allocError();
    swift_willThrow();
    id v47 = v18;
    id v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C19D0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_24E52D5D0();
  __break(1u);
LABEL_26:
  sub_24E52D380();
  sub_24E52D020();
  sub_24E52D410();
  sub_24E52D020();
  sub_24E52D450();
  __break(1u);
}

void sub_24E529EF8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x25333D390](a1, a2, v7);
      sub_24E4F6554(0, &qword_2698EE9F8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_24E52D2D0() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_24E52D2E0();
  sub_24E4F6554(0, &qword_2698EE9F8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_24E52D220();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_24E52D230();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_24E52D230();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  char v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_24E52A170(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

id sub_24E52A1F8(int a1, Class a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6 = (char *)objc_allocWithZone(a2);
  *(void *)&v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a4;
  swift_unknownObjectWeakAssign();
  v8.receiver = v6;
  v8.super_class = a2;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_24E52A274()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24E52A2C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  char v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *char v11 = v2;
  v11[1] = sub_24E4FBA64;
  return sub_24E525FD0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24E52A3A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E52A3F4()
{
  uint64_t v1 = sub_24E52CEC0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24E52A4F8()
{
  uint64_t v2 = *(void *)(sub_24E52CEC0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = *(void *)(v0 + v4);
  uint64_t v8 = *(void *)(v0 + v4 + 8);
  uint64_t v9 = swift_task_alloc();
  long long v10 = *(_OWORD *)(v0 + 32);
  long long v11 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v9;
  *(void *)uint64_t v9 = v1;
  *(void *)(v9 + 8) = sub_24E4FBA64;
  *(void *)(v9 + 128) = v7;
  *(void *)(v9 + 136) = v8;
  *(void *)(v9 + 120) = v6;
  *(_OWORD *)(v9 + 104) = v11;
  *(void *)(v9 + 96) = v5;
  *(_OWORD *)(v9 + 80) = v10;
  return MEMORY[0x270FA2498](sub_24E524F24, 0, 0);
}

uint64_t sub_24E52A638()
{
  uint64_t v1 = sub_24E52CEC0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFF8) + v0;
  unint64_t v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v8, v6);
}

uint64_t sub_24E52A738()
{
  uint64_t v2 = *(void *)(sub_24E52CEC0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = v0 + v3;
  char v7 = *(unsigned char *)(v0 + v4);
  uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFFF8) + v0 + 8);
  uint64_t v9 = swift_task_alloc();
  long long v10 = *(_OWORD *)(v0 + 32);
  long long v11 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v9;
  *(void *)uint64_t v9 = v1;
  *(void *)(v9 + 8) = sub_24E4FBA64;
  *(unsigned char *)(v9 + 96) = v7;
  *(void *)(v9 + 72) = v6;
  *(void *)(v9 + 80) = v8;
  *(_OWORD *)(v9 + 56) = v11;
  *(void *)(v9 + 48) = v5;
  *(_OWORD *)(v9 + 32) = v10;
  return MEMORY[0x270FA2498](sub_24E523E9C, 0, 0);
}

uint64_t sub_24E52A878()
{
  uint64_t v1 = type metadata accessor for MessageContext();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 96) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  if (!v8) {
    v9(v0 + v3, v6);
  }
  v9(v5 + *(int *)(v1 + 20), v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v5 + *(int *)(v1 + 44);
  uint64_t v11 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24E52AA74()
{
  uint64_t v2 = *(void *)(type metadata accessor for MessageContext() - 8);
  uint64_t v3 = *(void *)(v0 + 48);
  long long v10 = *(_OWORD *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v0 + 32);
  long long v8 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v6;
  *(void *)uint64_t v6 = v1;
  *(void *)(v6 + 8) = sub_24E4FBA64;
  *(void *)(v6 + 136) = v4;
  *(void *)(v6 + 144) = v5;
  *(_OWORD *)(v6 + 120) = v10;
  *(_OWORD *)(v6 + 104) = v8;
  *(void *)(v6 + 96) = v3;
  *(_OWORD *)(v6 + 80) = v7;
  return MEMORY[0x270FA2498](sub_24E522E28, 0, 0);
}

uint64_t sub_24E52AB94(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24E52AC54()
{
  uint64_t v1 = sub_24E52CDF0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for MessageContext();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v5 + v7 + 16) & ~v7;
  uint64_t v17 = *(void *)(*(void *)(v6 - 8) + 64);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v8;
  uint64_t v10 = sub_24E52CEC0();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v0 + v8, 1, v10);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  if (!v12) {
    v13(v0 + v8, v10);
  }
  v13(v9 + *(int *)(v6 + 20), v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v9 + *(int *)(v6 + 44);
  uint64_t v15 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v8 + v17, v3 | v7 | 7);
}

uint64_t sub_24E52AEF4()
{
  uint64_t v2 = *(void *)(sub_24E52CDF0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(type metadata accessor for MessageContext() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v9 = *(void *)(v0 + v4);
  uint64_t v10 = v0 + v5;
  uint64_t v11 = *(void *)(v0 + v5);
  uint64_t v12 = *(void *)(v10 + 8);
  uint64_t v13 = v0 + v7;
  uint64_t v14 = swift_task_alloc();
  long long v15 = *(_OWORD *)(v0 + 32);
  long long v16 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v14;
  *(void *)uint64_t v14 = v1;
  *(void *)(v14 + 8) = sub_24E4FBA64;
  *(void *)(v14 + 144) = v12;
  *(void *)(v14 + 152) = v13;
  *(void *)(v14 + 128) = v9;
  *(void *)(v14 + 136) = v11;
  *(void *)(v14 + 120) = v0 + v3;
  *(_OWORD *)(v14 + 104) = v16;
  *(void *)(v14 + 96) = v8;
  *(_OWORD *)(v14 + 80) = v15;
  return MEMORY[0x270FA2498](sub_24E521BA4, 0, 0);
}

uint64_t sub_24E52B08C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E4F6988(a1, a2);
  }
  return a1;
}

uint64_t sub_24E52B0A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E4FB4A0(a1, a2);
  }
  return a1;
}

uint64_t sub_24E52B0B4()
{
  uint64_t v1 = type metadata accessor for MessageContext();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 112) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  sub_24E4F6988(*(void *)(v0 + 72), *(void *)(v0 + 80));
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  uint64_t v6 = sub_24E52CEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  if (!v8) {
    v9(v0 + v3, v6);
  }
  v9(v5 + *(int *)(v1 + 20), v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v5 + *(int *)(v1 + 44);
  uint64_t v11 = sub_24E52CE60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24E52B2B0()
{
  uint64_t v2 = *(void *)(type metadata accessor for MessageContext() - 8);
  uint64_t v3 = *(void *)(v0 + 48);
  long long v12 = *(_OWORD *)(v0 + 72);
  char v4 = *(unsigned char *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v7 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v8 = swift_task_alloc();
  long long v9 = *(_OWORD *)(v0 + 32);
  long long v10 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 16) = v8;
  *(void *)uint64_t v8 = v1;
  *(void *)(v8 + 8) = sub_24E4FBA64;
  *(void *)(v8 + 120) = v6;
  *(void *)(v8 + 128) = v7;
  *(void *)(v8 + 112) = v5;
  *(unsigned char *)(v8 + 152) = v4;
  *(_OWORD *)(v8 + 80) = v10;
  *(_OWORD *)(v8 + 96) = v12;
  *(void *)(v8 + 72) = v3;
  *(_OWORD *)(v8 + 56) = v9;
  return MEMORY[0x270FA2498](sub_24E520720, 0, 0);
}

uint64_t sub_24E52B3E0(uint64_t a1)
{
  return a1;
}

unint64_t sub_24E52B408()
{
  unint64_t result = qword_26B1C1840;
  if (!qword_26B1C1840)
  {
    sub_24E52CEC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C1840);
  }
  return result;
}

uint64_t sub_24E52B460(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E52B4C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24E52B584()
{
  long long v6 = *(_OWORD *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_24E4FA1A0;
  *(void *)(v3 + 1168) = v2;
  *(_OWORD *)(v3 + 1152) = v6;
  *(_OWORD *)(v3 + 1136) = v4;
  return MEMORY[0x270FA2498](sub_24E526AE8, 0, 0);
}

void sub_24E52B650(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_uniqueID);
  if (v4)
  {

    id v5 = objc_msgSend(a1, sel_uniqueIDOverride);
    if (v5)
    {

      id v6 = objc_msgSend(a1, sel_modelIdentifier);
      if (v6)
      {

        id v7 = objc_msgSend(a1, sel_productName);
        if (v7)
        {

          id v8 = objc_msgSend(a1, sel_productVersion);
          if (v8)
          {

            id v9 = objc_msgSend(a1, sel_productBuildVersion);
            if (v9)
            {

              id v10 = objc_msgSend(a1, sel_name);
              if (v10)
              {

                id v11 = objc_msgSend(a1, sel_service);
                if (v11)
                {

                  id v12 = objc_msgSend(a1, sel_uniqueID);
                  if (v12)
                  {
                    uint64_t v13 = v12;
                    uint64_t v71 = sub_24E52CFF0();
                    uint64_t v70 = v14;
                  }
                  else
                  {
                    uint64_t v71 = 0;
                    uint64_t v70 = 0;
                  }
                  id v19 = objc_msgSend(a1, sel_uniqueIDOverride);
                  if (v19)
                  {
                    unint64_t v20 = v19;
                    uint64_t v21 = sub_24E52CFF0();
                    uint64_t v69 = v22;

                    id v23 = objc_msgSend(a1, sel_modelIdentifier);
                    if (v23)
                    {
                      uint64_t v24 = v23;
                      uint64_t v25 = sub_24E52CFF0();
                      uint64_t v68 = v26;

                      id v27 = objc_msgSend(a1, sel_productName);
                      if (v27)
                      {
                        uint64_t v28 = v27;
                        uint64_t v29 = sub_24E52CFF0();
                        uint64_t v67 = v30;

                        id v31 = objc_msgSend(a1, sel_productVersion);
                        if (v31)
                        {
                          uint64_t v32 = v31;
                          uint64_t v33 = sub_24E52CFF0();
                          uint64_t v66 = v34;

                          id v35 = objc_msgSend(a1, sel_productBuildVersion);
                          if (v35)
                          {
                            char v36 = v35;
                            uint64_t v37 = sub_24E52CFF0();
                            uint64_t v65 = v38;

                            id v39 = objc_msgSend(a1, sel_name);
                            if (v39)
                            {
                              uint64_t v40 = v39;
                              uint64_t v62 = v29;
                              uint64_t v63 = v25;
                              uint64_t v64 = v21;
                              uint64_t v41 = sub_24E52CFF0();
                              uint64_t v60 = v42;
                              uint64_t v61 = v41;

                              id v43 = objc_msgSend(a1, sel_service);
                              if (v43)
                              {
                                uint64_t v44 = v43;
                                uint64_t v58 = v37;
                                uint64_t v59 = v33;
                                uint64_t v45 = sub_24E52CFF0();
                                uint64_t v56 = v46;
                                uint64_t v57 = v45;

                                unsigned __int8 v55 = objc_msgSend(a1, sel_isLocallyPaired);
                                unsigned __int8 v47 = objc_msgSend(a1, sel_isActive);
                                unsigned __int8 v48 = objc_msgSend(a1, sel_isNearby);
                                unsigned __int8 v49 = objc_msgSend(a1, sel_isConnected);
                                uint64_t v50 = IDSCopyIDForDevice();
                                if (v50)
                                {
                                  uint64_t v51 = (void *)v50;
                                  uint64_t v52 = sub_24E52CFF0();
                                  uint64_t v54 = v53;

                                  *(void *)a2 = v71;
                                  *(void *)(a2 + 8) = v70;
                                  *(void *)(a2 + 16) = v64;
                                  *(void *)(a2 + 24) = v69;
                                  *(void *)(a2 + 32) = v63;
                                  *(void *)(a2 + 40) = v68;
                                  *(void *)(a2 + 48) = v62;
                                  *(void *)(a2 + 56) = v67;
                                  *(void *)(a2 + 64) = v59;
                                  *(void *)(a2 + 72) = v66;
                                  *(void *)(a2 + 80) = v58;
                                  *(void *)(a2 + 88) = v65;
                                  *(void *)(a2 + 96) = v61;
                                  *(void *)(a2 + 104) = v60;
                                  *(void *)(a2 + 112) = v57;
                                  *(void *)(a2 + 120) = v56;
                                  *(unsigned char *)(a2 + 128) = v55;
                                  *(unsigned char *)(a2 + 129) = v47;
                                  *(unsigned char *)(a2 + 130) = v48;
                                  *(unsigned char *)(a2 + 131) = v49;
                                  *(unsigned char *)(a2 + 136) = 4;
                                  *(void *)(a2 + 144) = v52;
                                  *(void *)(a2 + 152) = v54;
                                  return;
                                }
                                goto LABEL_33;
                              }
LABEL_32:
                              __break(1u);
LABEL_33:
                              __break(1u);
                              return;
                            }
LABEL_31:
                            __break(1u);
                            goto LABEL_32;
                          }
LABEL_30:
                          __break(1u);
                          goto LABEL_31;
                        }
LABEL_29:
                        __break(1u);
                        goto LABEL_30;
                      }
LABEL_28:
                      __break(1u);
                      goto LABEL_29;
                    }
                  }
                  else
                  {
                    __break(1u);
                  }
                  __break(1u);
                  goto LABEL_28;
                }
              }
            }
          }
        }
      }
    }
  }
  if (qword_2698EE338 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24E52CEF0();
  __swift_project_value_buffer(v15, (uint64_t)qword_2698EEB50);
  long long v16 = sub_24E52CED0();
  os_log_type_t v17 = sub_24E52D1E0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_24E4DA000, v16, v17, "Some IDSDevice Properties are found nil", v18, 2u);
    MEMORY[0x25333DD20](v18, -1, -1);
  }

  sub_24E52CBD0();
  swift_allocError();
  swift_willThrow();
}

uint64_t static DeviceError.== infix(_:_:)()
{
  return 1;
}

uint64_t DeviceError.hash(into:)()
{
  return sub_24E52D630();
}

uint64_t DeviceError.hashValue.getter()
{
  return sub_24E52D660();
}

uint64_t sub_24E52BB84()
{
  return sub_24E52D660();
}

uint64_t sub_24E52BBC8()
{
  return sub_24E52D630();
}

uint64_t sub_24E52BBF0()
{
  return sub_24E52D660();
}

uint64_t Device.uniqueID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.uniqueIDOverride.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.modelIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.productName.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.productVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.productBuildVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.service.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.isLocallyPaired.getter()
{
  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t Device.isActive.getter()
{
  return *(unsigned __int8 *)(v0 + 129);
}

uint64_t Device.isNearby.getter()
{
  return *(unsigned __int8 *)(v0 + 130);
}

uint64_t Device.isConnected.getter()
{
  return *(unsigned __int8 *)(v0 + 131);
}

uint64_t Device.destination.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 144);
  uint64_t v2 = *(void *)(v1 + 152);
  *(unsigned char *)a1 = *(unsigned char *)(v1 + 136);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t Device.hash(into:)()
{
  if (*(void *)(v0 + 8))
  {
    sub_24E52D640();
    swift_bridgeObjectRetain();
    sub_24E52D010();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24E52D640();
  }
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  swift_bridgeObjectRelease();
  sub_24E52D640();
  sub_24E52D640();
  sub_24E52D640();
  sub_24E52D640();
  sub_24E52D630();
  swift_bridgeObjectRetain();
  sub_24E52D010();
  return swift_bridgeObjectRelease();
}

uint64_t Device.hashValue.getter()
{
  return sub_24E52D660();
}

uint64_t sub_24E52C080()
{
  return sub_24E52D660();
}

uint64_t sub_24E52C0C4()
{
  return sub_24E52D660();
}

uint64_t Device.description.getter()
{
  return 60;
}

BOOL _s15FindMyMessaging6DeviceV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v55 = *(void *)(a1 + 56);
  uint64_t v56 = *(void *)(a1 + 48);
  uint64_t v54 = *(void *)(a1 + 64);
  uint64_t v52 = *(void *)(a1 + 72);
  uint64_t v50 = *(void *)(a1 + 80);
  uint64_t v48 = *(void *)(a1 + 88);
  uint64_t v46 = *(void *)(a1 + 96);
  uint64_t v44 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 40);
  uint64_t v12 = *(void *)(a2 + 48);
  uint64_t v14 = *(void *)(a2 + 56);
  uint64_t v53 = *(void *)(a2 + 64);
  uint64_t v51 = *(void *)(a2 + 72);
  uint64_t v49 = *(void *)(a2 + 80);
  uint64_t v47 = *(void *)(a2 + 88);
  uint64_t v45 = *(void *)(a2 + 96);
  uint64_t v42 = *(void *)(a2 + 112);
  uint64_t v43 = *(void *)(a2 + 104);
  uint64_t v41 = *(void *)(a2 + 120);
  int v40 = *(unsigned __int8 *)(a2 + 130);
  if (!v3)
  {
    int v32 = *(unsigned __int8 *)(a1 + 131);
    int v33 = *(unsigned __int8 *)(a1 + 130);
    int v36 = *(unsigned __int8 *)(a2 + 128);
    int v37 = *(unsigned __int8 *)(a2 + 129);
    int v30 = *(unsigned __int8 *)(a1 + 136);
    int v31 = *(unsigned __int8 *)(a2 + 131);
    uint64_t v34 = *(void *)(a1 + 120);
    uint64_t v35 = *(void *)(a1 + 112);
    int v29 = *(unsigned __int8 *)(a2 + 136);
    int v38 = *(unsigned __int8 *)(a1 + 128);
    int v39 = *(unsigned __int8 *)(a1 + 129);
    uint64_t v25 = *(void *)(a2 + 152);
    uint64_t v26 = *(void *)(a2 + 144);
    uint64_t v27 = *(void *)(a1 + 152);
    uint64_t v28 = *(void *)(a1 + 144);
    if (v8) {
      return 0;
    }
LABEL_10:
    if (v4 == v9 && v6 == v10 || (char v17 = sub_24E52D5A0(), result = 0, (v17 & 1) != 0))
    {
      if (v5 == v11 && v7 == v13 || (char v18 = sub_24E52D5A0(), result = 0, (v18 & 1) != 0))
      {
        if (v56 == v12 && v55 == v14 || (char v19 = sub_24E52D5A0(), result = 0, (v19 & 1) != 0))
        {
          if (v54 == v53 && v52 == v51 || (char v20 = sub_24E52D5A0(), result = 0, (v20 & 1) != 0))
          {
            if (v50 == v49 && v48 == v47 || (v21 = sub_24E52D5A0(), BOOL result = 0, (v21 & 1) != 0))
            {
              if (v46 == v45 && v44 == v43 || (char v22 = sub_24E52D5A0(), result = 0, (v22 & 1) != 0))
              {
                int v23 = v33 ^ v40;
                if (v35 == v42 && v34 == v41)
                {
                  BOOL result = 0;
                  if ((v38 ^ v36 | v39 ^ v37 | v23)) {
                    return result;
                  }
                }
                else
                {
                  char v24 = sub_24E52D5A0();
                  BOOL result = 0;
                  if ((v38 ^ v36) & 1 | ((v24 & 1) == 0) | (v39 ^ v37 | v23) & 1) {
                    return result;
                  }
                }
                if ((v32 ^ v31)) {
                  return result;
                }
                return v30 == v29 && (v28 == v26 && v27 == v25 || (sub_24E52D5A0() & 1) != 0);
              }
            }
          }
        }
      }
    }
    return result;
  }
  if (!v8) {
    return 0;
  }
  int v32 = *(unsigned __int8 *)(a1 + 131);
  int v33 = *(unsigned __int8 *)(a1 + 130);
  int v36 = *(unsigned __int8 *)(a2 + 128);
  int v37 = *(unsigned __int8 *)(a2 + 129);
  int v30 = *(unsigned __int8 *)(a1 + 136);
  int v31 = *(unsigned __int8 *)(a2 + 131);
  uint64_t v34 = *(void *)(a1 + 120);
  uint64_t v35 = *(void *)(a1 + 112);
  int v29 = *(unsigned __int8 *)(a2 + 136);
  int v38 = *(unsigned __int8 *)(a1 + 128);
  int v39 = *(unsigned __int8 *)(a1 + 129);
  uint64_t v25 = *(void *)(a2 + 152);
  uint64_t v26 = *(void *)(a2 + 144);
  uint64_t v27 = *(void *)(a1 + 152);
  uint64_t v28 = *(void *)(a1 + 144);
  if (*(void *)a1 == *(void *)a2 && v3 == v8) {
    goto LABEL_10;
  }
  char v15 = sub_24E52D5A0();
  BOOL result = 0;
  if (v15) {
    goto LABEL_10;
  }
  return result;
}

unint64_t sub_24E52C560()
{
  unint64_t result = qword_26B1C19E0;
  if (!qword_26B1C19E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C19E0);
  }
  return result;
}

unint64_t sub_24E52C5B8()
{
  unint64_t result = qword_2698EEB10;
  if (!qword_2698EEB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EEB10);
  }
  return result;
}

unint64_t sub_24E52C610()
{
  unint64_t result = qword_26B1C18E0;
  if (!qword_26B1C18E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C18E0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DeviceError(unsigned char *result, int a2, int a3)
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
        void *result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24E52C700);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceError()
{
  return &type metadata for DeviceError;
}

uint64_t destroy for Device()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Device(uint64_t a1, uint64_t a2)
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
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v10;
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  uint64_t v11 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Device(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  *(unsigned char *)(a1 + 130) = *(unsigned char *)(a2 + 130);
  *(unsigned char *)(a1 + 131) = *(unsigned char *)(a2 + 131);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for Device(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  *(unsigned char *)(a1 + 130) = *(unsigned char *)(a2 + 130);
  *(unsigned char *)(a1 + 131) = *(unsigned char *)(a2 + 131);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  uint64_t v12 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Device(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 160)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Device(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 160) = 1;
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
    *(unsigned char *)(result + 160) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Device()
{
  return &type metadata for Device;
}

unint64_t sub_24E52CBD0()
{
  unint64_t result = qword_2698EEB18;
  if (!qword_2698EEB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698EEB18);
  }
  return result;
}

uint64_t sub_24E52CC24()
{
  uint64_t v0 = sub_24E52CEF0();
  __swift_allocate_value_buffer(v0, qword_2698EEB50);
  __swift_project_value_buffer(v0, (uint64_t)qword_2698EEB50);
  return sub_24E52CEE0();
}

uint64_t sub_24E52CCB0()
{
  return MEMORY[0x270F28C88]();
}

uint64_t sub_24E52CCC0()
{
  return MEMORY[0x270F28D80]();
}

uint64_t sub_24E52CCD0()
{
  return MEMORY[0x270F28D88]();
}

uint64_t sub_24E52CCE0()
{
  return MEMORY[0x270F28D98]();
}

uint64_t sub_24E52CD00()
{
  return MEMORY[0x270F28DD8]();
}

uint64_t sub_24E52CD10()
{
  return MEMORY[0x270F28E00]();
}

uint64_t sub_24E52CD20()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_24E52CD30()
{
  return MEMORY[0x270EEF240]();
}

uint64_t sub_24E52CD40()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_24E52CD50()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_24E52CD60()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_24E52CD70()
{
  return MEMORY[0x270EEF290]();
}

uint64_t sub_24E52CD80()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_24E52CD90()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_24E52CDA0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24E52CDB0()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_24E52CDC0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24E52CDD0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_24E52CDE0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24E52CDF0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24E52CE00()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24E52CE10()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24E52CE20()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24E52CE30()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_24E52CE40()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_24E52CE50()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24E52CE60()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24E52CE70()
{
  return MEMORY[0x270F28E58]();
}

uint64_t sub_24E52CE80()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24E52CE90()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24E52CEA0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24E52CEB0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24E52CEC0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24E52CED0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E52CEE0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E52CEF0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E52CF00()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24E52CF10()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_24E52CF20()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24E52CF30()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24E52CF40()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24E52CF50()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_24E52CF60()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_24E52CF70()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_24E52CF80()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_24E52CF90()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_24E52CFA0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24E52CFB0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24E52CFC0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24E52CFD0()
{
  return MEMORY[0x270F28E80]();
}

uint64_t sub_24E52CFE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24E52CFF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24E52D000()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24E52D010()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24E52D020()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24E52D030()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E52D040()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24E52D050()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24E52D060()
{
  return MEMORY[0x270F9DAB8]();
}

uint64_t sub_24E52D0A0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24E52D0B0()
{
  return MEMORY[0x270F9DB38]();
}

uint64_t sub_24E52D0C0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24E52D0D0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24E52D0E0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24E52D0F0()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24E52D100()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24E52D110()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24E52D120()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E52D130()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24E52D140()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_24E52D150()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24E52D160()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24E52D170()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24E52D180()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24E52D190()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24E52D1A0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24E52D1B0()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_24E52D1C0()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_24E52D1D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24E52D1E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E52D1F0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24E52D200()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E52D210()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24E52D220()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24E52D230()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24E52D240()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24E52D250()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E52D260()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E52D270()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24E52D280()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24E52D290()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24E52D2A0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24E52D2B0()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_24E52D2C0()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_24E52D2D0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_24E52D2E0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_24E52D2F0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24E52D300()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_24E52D310()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_24E52D320()
{
  return MEMORY[0x270EF2608]();
}

uint64_t sub_24E52D330()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_24E52D340()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24E52D350()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24E52D360()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24E52D370()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24E52D380()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24E52D390()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E52D3A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24E52D3B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E52D3C0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24E52D3D0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24E52D3E0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24E52D3F0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24E52D400()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24E52D410()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24E52D420()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_24E52D430()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_24E52D440()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E52D450()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24E52D460()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24E52D470()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24E52D480()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24E52D490()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24E52D4A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E52D4B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24E52D4C0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24E52D4D0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24E52D4E0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24E52D4F0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24E52D500()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24E52D510()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24E52D520()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24E52D530()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24E52D540()
{
  return MEMORY[0x270F28EB0]();
}

uint64_t sub_24E52D550()
{
  return MEMORY[0x270F28EB8]();
}

uint64_t sub_24E52D560()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E52D590()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_24E52D5A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E52D5C0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24E52D5D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24E52D5E0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E52D5F0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E52D600()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E52D610()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E52D620()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E52D630()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E52D640()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24E52D650()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24E52D660()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24E52D670()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24E52D680()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x270F3C980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x270F3C988]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x270F3C9A8]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
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