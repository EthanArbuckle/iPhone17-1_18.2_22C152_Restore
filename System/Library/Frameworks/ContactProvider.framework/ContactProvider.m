id ContactProviderExtension.configuration.getter@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  id result;

  result = sub_243284740(v1);
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of ContactProviderExtension.configure(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ContactProviderExtension.invalidate()(uint64_t a1, uint64_t a2)
{
  v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_243284460;
  return v7(a1, a2);
}

uint64_t sub_243284460()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_243284554()
{
  type metadata accessor for _ExtensionConfiguration();

  return swift_getWitnessTable();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2432845AC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2432845CC(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_24328461C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_243284664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for _ExtensionConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_243284684(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26F89CC80);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_243284720(void *a1)
{
  sub_243284684(a1, *v1);
  return 1;
}

id sub_243284740(uint64_t a1)
{
  return sub_2432A1AB8(a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2432847A4(uint64_t *a1, void *a2, long long *a3, char a4, uint64_t a5)
{
  uint64_t v11 = *a1;
  uint64_t v10 = a1[1];
  *(void *)(v5 + 152) = 0;
  *(void *)(v5 + 160) = 0;
  *(void *)(v5 + 144) = 0;
  *(_OWORD *)(v5 + 168) = xmmword_2432AD3E0;
  *(_OWORD *)(v5 + 192) = xmmword_2432AD3F0;
  sub_243286F34((uint64_t)a2, v5 + 16);
  uint64_t v12 = a2[3];
  uint64_t v13 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v12);
  v15[0] = v11;
  v15[1] = v10;
  (*(void (**)(long long *__return_ptr, void *, uint64_t, uint64_t))(v13 + 8))(v16, v15, v12, v13);
  swift_bridgeObjectRelease();
  sub_243286F98(v16, v5 + 104);
  sub_243286F98(a3, v5 + 56);
  *(unsigned char *)(v5 + 96) = a4;
  *(void *)(v5 + 184) = a5;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
  return v5;
}

uint64_t sub_24328489C(uint64_t a1)
{
  *(void *)(v2 + 344) = v1;
  uint64_t v4 = sub_2432AC918();
  *(void *)(v2 + 352) = v4;
  *(void *)(v2 + 360) = *(void *)(v4 - 8);
  *(void *)(v2 + 368) = swift_task_alloc();
  *(void *)(v2 + 376) = swift_task_alloc();
  uint64_t v5 = sub_2432AC938();
  *(void *)(v2 + 384) = v5;
  *(void *)(v2 + 392) = *(void *)(v5 - 8);
  *(void *)(v2 + 400) = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91018);
  *(void *)(v2 + 408) = v6;
  *(void *)(v2 + 416) = *(void *)(v6 - 8);
  *(void *)(v2 + 424) = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91020);
  *(void *)(v2 + 432) = v7;
  *(void *)(v2 + 440) = *(void *)(v7 - 8);
  *(void *)(v2 + 448) = swift_task_alloc();
  *(_OWORD *)(v2 + 456) = *(_OWORD *)a1;
  *(void *)(v2 + 472) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_243284AA0, 0, 0);
}

uint64_t sub_243284AA0()
{
  uint64_t v1 = *(void **)(v0 + 344);
  v29 = v1;
  if (v1[18])
  {
    swift_retain();
    sub_2432AC538();
    swift_release();
    uint64_t v1 = *(void **)(v0 + 344);
  }
  unint64_t v27 = *(void *)(v0 + 464);
  uint64_t v28 = *(void *)(v0 + 472);
  uint64_t v2 = *(void *)(v0 + 448);
  uint64_t v26 = *(void *)(v0 + 456);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v4 = *(void *)(v0 + 440);
  uint64_t v5 = *(void *)(v0 + 424);
  uint64_t v24 = *(void *)(v0 + 416);
  uint64_t v25 = *(void *)(v0 + 408);
  sub_243286F34((uint64_t)(v1 + 7), v0 + 16);
  type metadata accessor for ItemChangeObserverImpl();
  uint64_t v6 = swift_allocObject();
  *(void *)(v0 + 480) = v6;
  uint64_t v7 = v6 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  *(void *)(v0 + 136) = 0;
  *(void *)(v0 + 144) = 0;
  *(void *)(v0 + 128) = 0;
  *(unsigned char *)(v0 + 152) = 0x80;
  sub_2432AC548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v7, v2, v3);
  *(void *)(v6 + 16) = 5;
  sub_243286F98((long long *)(v0 + 16), v6 + 24);
  swift_beginAccess();
  sub_2432AC558();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_243286C80();
  uint64_t v8 = sub_2432AC5A8();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v5, v25);
  v29[18] = v8;
  swift_release();
  uint64_t v9 = v1[20];
  unint64_t v10 = v1[21];
  v1[20] = v26;
  v1[21] = v27;
  v1[22] = v28;
  sub_2432868A0(v26, v27);
  sub_24328672C(v9, v10);
  unint64_t v11 = v1[21];
  if (v11 >> 60 == 15)
  {
    uint64_t v12 = *(void **)(*(void *)(v0 + 344) + 152);
    if (!v12) {
      goto LABEL_12;
    }
    sub_243286BA8();
    uint64_t v13 = (void *)swift_allocError();
    unsigned char *v14 = 7;
    id v15 = v12;
    id v16 = v12;
    char v17 = == infix(_:_:)();

    if (v17)
    {
      sub_243286F34(*(void *)(v0 + 344) + 104, v0 + 56);
      v30 = (uint64_t (*)(uint64_t))((char *)&dword_268D912F0 + dword_268D912F0);
      v18 = (void *)swift_task_alloc();
      *(void *)(v0 + 568) = v18;
      void *v18 = v0;
      v18[1] = sub_243285F78;
      return v30(v0 + 56);
    }
    else
    {
LABEL_12:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v23 = *(uint64_t (**)(void))(v0 + 8);
      return v23();
    }
  }
  else
  {
    *(void *)(v0 + 488) = v11;
    v20 = *(void **)(v0 + 344);
    uint64_t v21 = v20[20];
    *(void *)(v0 + 496) = v21;
    *(void *)(v0 + 504) = v20[22];
    uint64_t v22 = v20[23];
    *(void *)(v0 + 512) = v22;
    sub_2432868A0(v21, v11);
    return MEMORY[0x270FA2498](sub_243284EA8, v22, 0);
  }
}

uint64_t sub_243284EA8()
{
  *(unsigned char *)(v0 + 121) = *(unsigned char *)(*(void *)(v0 + 512) + 112);
  return MEMORY[0x270FA2498](sub_243284ED0, 0, 0);
}

uint64_t sub_243284ED0()
{
  if (*(unsigned char *)(v0 + 121))
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2432AC528();
    __swift_project_value_buffer(v1, (uint64_t)qword_268D92920);
    uint64_t v2 = sub_2432AC508();
    os_log_type_t v3 = sub_2432AC7B8();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_243282000, v2, v3, "ItemChangeSession.sync() stopping, extension was invalidated", v4, 2u);
      MEMORY[0x245678AE0](v4, -1, -1);
    }

    sub_243286BA8();
    uint64_t v5 = (void *)swift_allocError();
    *uint64_t v6 = 8;
    char v7 = sub_2432916AC();
    uint64_t v8 = *(void *)(v0 + 496);
    unint64_t v9 = *(void *)(v0 + 488);
    if (v7)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      *(void *)(v0 + 104) = 0;
      *(void *)(v0 + 112) = 0;
      *(void *)(v0 + 96) = v5;
      *(unsigned char *)(v0 + 120) = 64;
      swift_retain();
      sub_2432AC588();
    }
    else
    {
    }
    sub_24328672C(v8, v9);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 496);
    uint64_t v10 = *(void *)(v0 + 504);
    uint64_t v13 = *(void *)(v0 + 480);
    unint64_t v12 = *(void *)(v0 + 488);
    uint64_t v14 = *(void *)(v0 + 400);
    uint64_t v15 = *(void *)(v0 + 368);
    uint64_t v26 = *(void *)(v0 + 376);
    uint64_t v16 = *(void *)(v0 + 360);
    uint64_t v28 = *(void *)(v0 + 352);
    uint64_t v17 = *(void *)(v0 + 344);
    swift_beginAccess();
    uint64_t v24 = ((qword_268D912D8 >> 63) & 0xF21F494C589C0000)
        + (((unint64_t)qword_268D912D8 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    uint64_t v25 = 1000000000000000000 * qword_268D912D8;
    v18 = (void *)swift_allocObject();
    *(void *)(v0 + 520) = v18;
    v18[2] = v17;
    v18[3] = v11;
    v18[4] = v12;
    v18[5] = v10;
    v18[6] = v13;
    sub_243286E34(v11, v12);
    swift_retain();
    swift_retain();
    sub_2432AC928();
    sub_2432AC8F8();
    MEMORY[0x245678240](v25, v24);
    v19 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    *(void *)(v0 + 528) = v19;
    *(void *)(v0 + 536) = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v19(v15, v28);
    v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v20;
    v20[2] = &unk_268D91038;
    v20[3] = v18;
    v20[4] = v26;
    v20[5] = v14;
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 552) = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_2432852C8;
    return MEMORY[0x270FA22B8]();
  }
}

uint64_t sub_2432852C8()
{
  *(void *)(*(void *)v1 + 560) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_243285664;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2432853E4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432853E4()
{
  uint64_t v1 = *(void *)(v0 + 496);
  unint64_t v2 = *(void *)(v0 + 488);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v5 = *(void *)(v0 + 384);
  (*(void (**)(void, void))(v0 + 528))(*(void *)(v0 + 376), *(void *)(v0 + 352));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  sub_24328672C(v1, v2);
  uint64_t v6 = *(void **)(v0 + 344);
  unint64_t v7 = v6[21];
  if (v7 >> 60 == 15)
  {
    uint64_t v8 = (void *)v6[19];
    if (!v8) {
      goto LABEL_10;
    }
    sub_243286BA8();
    unint64_t v9 = (void *)swift_allocError();
    *uint64_t v10 = 7;
    id v11 = v8;
    id v12 = v8;
    char v13 = == infix(_:_:)();

    if (v13)
    {
      sub_243286F34(*(void *)(v0 + 344) + 104, v0 + 56);
      v19 = (uint64_t (*)(uint64_t))((char *)&dword_268D912F0 + dword_268D912F0);
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 568) = v14;
      void *v14 = v0;
      v14[1] = sub_243285F78;
      return v19(v0 + 56);
    }
    else
    {
LABEL_10:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v18 = *(uint64_t (**)(void))(v0 + 8);
      return v18();
    }
  }
  else
  {
    *(void *)(v0 + 488) = v7;
    uint64_t v16 = v6[20];
    *(void *)(v0 + 496) = v16;
    *(void *)(v0 + 504) = v6[22];
    uint64_t v17 = v6[23];
    *(void *)(v0 + 512) = v17;
    sub_2432868A0(v16, v7);
    return MEMORY[0x270FA2498](sub_243284EA8, v17, 0);
  }
}

uint64_t sub_243285664()
{
  uint64_t v1 = *(void **)(v0 + 560);
  unint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v4 = *(void *)(v0 + 400);
  uint64_t v6 = *(void *)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 384);
  uint64_t v7 = *(void *)(v0 + 352);
  swift_task_dealloc();
  v2(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  swift_release();
  *(void *)(v0 + 336) = v1;
  id v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
  if (swift_dynamicCast())
  {

    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2432AC528();
    __swift_project_value_buffer(v9, (uint64_t)qword_268D92920);
    uint64_t v10 = sub_2432AC508();
    os_log_type_t v11 = sub_2432AC7B8();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_243282000, v10, v11, "ItemChangeSession.sync() did timeout", v12, 2u);
      MEMORY[0x245678AE0](v12, -1, -1);
    }

    sub_243286BA8();
    char v13 = (void *)swift_allocError();
    unsigned char *v14 = 7;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2432AC578();
    swift_release();
    swift_release();
    uint64_t v15 = *(void *)(v0 + 192);
    unint64_t v16 = *(void *)(v0 + 200);
    uint64_t v17 = *(void *)(v0 + 208);
    unsigned int v18 = *(unsigned __int8 *)(v0 + 216);
    v19 = (void *)swift_allocError();
    unsigned char *v20 = 7;
    if (v18 >> 6 == 1)
    {
      sub_243286F18(v15, v16, v17, v18);
      id v21 = v19;
      char v22 = == infix(_:_:)();
      sub_243286884(v15, v16, v17, v18);
      sub_243286884((uint64_t)v19, 0, 0, 0x40u);

      sub_243286884(v15, v16, v17, v18);
      if (v22)
      {

LABEL_15:
        uint64_t v36 = *(void *)(v0 + 496);
        unint64_t v37 = *(void *)(v0 + 488);
        v38 = *(void **)(v0 + 344);
        uint64_t v39 = v38[20];
        unint64_t v40 = v38[21];
        *((_OWORD *)v38 + 10) = xmmword_2432AD400;
        v38[22] = 0;
        sub_24328672C(v39, v40);
        sub_24328672C(v36, v37);
        v41 = *(void **)(v0 + 336);
        goto LABEL_23;
      }
    }
    else
    {
      sub_243286F18(v15, v16, v17, v18);
      id v35 = v19;
      sub_243286884(v15, v16, v17, v18);
      sub_243286884((uint64_t)v19, 0, 0, 0x40u);

      sub_243286884(v15, v16, v17, v18);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)(v0 + 168) = 0;
    *(void *)(v0 + 176) = 0;
    *(void *)(v0 + 160) = v13;
    *(unsigned char *)(v0 + 184) = 64;
    swift_retain();
    sub_2432AC588();
    goto LABEL_15;
  }

  if (qword_268D90D20 != -1) {
    swift_once();
  }
  v23 = *(void **)(v0 + 560);
  uint64_t v24 = sub_2432AC528();
  __swift_project_value_buffer(v24, (uint64_t)qword_268D92920);
  id v25 = v23;
  id v26 = v23;
  uint64_t v27 = sub_2432AC508();
  os_log_type_t v28 = sub_2432AC7B8();
  BOOL v29 = os_log_type_enabled(v27, v28);
  v30 = *(void **)(v0 + 560);
  if (v29)
  {
    uint64_t v31 = swift_slowAlloc();
    v32 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 138543362;
    id v33 = v30;
    uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v31 + 4) = v34;
    void *v32 = v34;

    _os_log_impl(&dword_243282000, v27, v28, "ItemChangeSession.sync() error %{public}@", (uint8_t *)v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v32, -1, -1);
    MEMORY[0x245678AE0](v31, -1, -1);
  }
  else
  {
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();
  swift_release();
  uint64_t v43 = *(void *)(v0 + 224);
  unint64_t v42 = *(void *)(v0 + 232);
  uint64_t v44 = *(void *)(v0 + 240);
  unsigned int v45 = *(unsigned __int8 *)(v0 + 248);
  sub_243286BA8();
  v46 = (void *)swift_allocError();
  unsigned char *v47 = 7;
  if (v45 >> 6 == 1)
  {
    sub_243286F18(v43, v42, v44, v45);
    id v48 = v46;
    char v49 = == infix(_:_:)();
    sub_243286884(v43, v42, v44, v45);
    sub_243286884((uint64_t)v46, 0, 0, 0x40u);

    sub_243286884(v43, v42, v44, v45);
    if (v49) {
      goto LABEL_22;
    }
  }
  else
  {
    sub_243286F18(v43, v42, v44, v45);
    id v50 = v46;
    sub_243286884(v43, v42, v44, v45);
    sub_243286884((uint64_t)v46, 0, 0, 0x40u);

    sub_243286884(v43, v42, v44, v45);
  }
  v51 = *(void **)(v0 + 560);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 264) = 0;
  *(void *)(v0 + 272) = 0;
  *(void *)(v0 + 256) = v51;
  *(unsigned char *)(v0 + 280) = 64;
  swift_retain();
  id v52 = v51;
  sub_2432AC588();
LABEL_22:
  v53 = *(void **)(v0 + 560);
  uint64_t v54 = *(void *)(v0 + 496);
  unint64_t v55 = *(void *)(v0 + 488);
  v56 = *(void **)(v0 + 344);
  uint64_t v57 = v56[20];
  unint64_t v58 = v56[21];
  *((_OWORD *)v56 + 10) = xmmword_2432AD400;
  v56[22] = 0;
  sub_24328672C(v57, v58);
  sub_24328672C(v54, v55);
  v41 = v53;
LABEL_23:

  v59 = *(void **)(v0 + 344);
  unint64_t v60 = v59[21];
  if (v60 >> 60 == 15)
  {
    v61 = (void *)v59[19];
    if (!v61) {
      goto LABEL_32;
    }
    sub_243286BA8();
    v62 = (void *)swift_allocError();
    unsigned char *v63 = 7;
    id v64 = v61;
    id v65 = v61;
    char v66 = == infix(_:_:)();

    if (v66)
    {
      sub_243286F34(*(void *)(v0 + 344) + 104, v0 + 56);
      v72 = (uint64_t (*)(uint64_t))((char *)&dword_268D912F0 + dword_268D912F0);
      v67 = (void *)swift_task_alloc();
      *(void *)(v0 + 568) = v67;
      void *v67 = v0;
      v67[1] = sub_243285F78;
      return v72(v0 + 56);
    }
    else
    {
LABEL_32:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v71 = *(uint64_t (**)(void))(v0 + 8);
      return v71();
    }
  }
  else
  {
    *(void *)(v0 + 488) = v60;
    uint64_t v69 = v59[20];
    *(void *)(v0 + 496) = v69;
    *(void *)(v0 + 504) = v59[22];
    uint64_t v70 = v59[23];
    *(void *)(v0 + 512) = v70;
    sub_2432868A0(v69, v60);
    return MEMORY[0x270FA2498](sub_243284EA8, v70, 0);
  }
}

uint64_t sub_243285F78()
{
  uint64_t v1 = *v0 + 56;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return MEMORY[0x270FA2498](sub_243286080, 0, 0);
}

uint64_t sub_243286080()
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

uint64_t sub_24328611C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  char v4 = *((unsigned char *)a1 + 24);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    v6[0] = v1;
    v6[1] = v2;
    v6[2] = v3;
    char v7 = v4;
    sub_2432864A4((uint64_t)v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_2432861A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[18] = a5;
  v6[19] = a6;
  v6[16] = a3;
  v6[17] = a4;
  v6[15] = a2;
  return MEMORY[0x270FA2498](sub_2432861C8, 0, 0);
}

uint64_t sub_2432861C8()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  long long v8 = *(_OWORD *)(v0 + 128);
  sub_243286F34(*(void *)(v0 + 120) + 104, v0 + 16);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v3);
  *(_OWORD *)(v0 + 96) = v8;
  *(void *)(v0 + 112) = v2;
  *(void *)(v0 + 80) = type metadata accessor for ItemChangeObserverImpl();
  *(void *)(v0 + 88) = &protocol witness table for ItemChangeObserverImpl;
  *(void *)(v0 + 56) = v1;
  char v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 16) + **(int **)(v4 + 16));
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v5;
  void *v5 = v0;
  v5[1] = sub_243286338;
  return v7(v0 + 96, v0 + 56, v3, v4);
}

uint64_t sub_243286338()
{
  uint64_t v1 = *v0 + 56;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return MEMORY[0x270FA2498](sub_243286440, 0, 0);
}

uint64_t sub_243286440()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_2432864A4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = *(unsigned __int8 *)(a1 + 24);
  if (v6 >> 6)
  {
    if (v6 >> 6 != 1) {
      return;
    }
    char v7 = (void *)v1[19];
    v2[19] = v4;
    id v8 = v4;
    id v9 = v4;

    sub_243286F34((uint64_t)(v2 + 7), (uint64_t)v27);
    uint64_t v10 = v28;
    uint64_t v11 = v29;
    __swift_project_boxed_opaque_existential_1(v27, v28);
    (*(void (**)(void *, uint64_t, uint64_t))(v11 + 128))(v4, v10, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    uint64_t v12 = v2[20];
    unint64_t v13 = v2[21];
    *((_OWORD *)v2 + 10) = xmmword_2432AD400;
    v2[22] = 0;
    sub_24328672C(v12, v13);
    uint64_t v14 = (uint64_t)v4;
    unint64_t v15 = v3;
    uint64_t v16 = v5;
  }
  else
  {
    sub_243286F34((uint64_t)(v1 + 7), (uint64_t)v27);
    uint64_t v17 = v28;
    uint64_t v18 = v29;
    __swift_project_boxed_opaque_existential_1(v27, v28);
    v26[0] = v4;
    v26[1] = v3;
    v26[2] = v5;
    uint64_t v25 = v5;
    v19 = *(void (**)(void *, void, uint64_t, uint64_t))(v18 + 120);
    sub_2432868A0((uint64_t)v4, v3);
    v19(v26, v6 & 1, v17, v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    if (v6)
    {
      sub_2432868A0((uint64_t)v4, v3);
      uint64_t v20 = v4;
      unint64_t v21 = v3;
      uint64_t v22 = v25;
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v22 = 0;
      unint64_t v21 = 0xF000000000000000;
    }
    uint64_t v23 = v1[20];
    unint64_t v24 = v1[21];
    v1[20] = v20;
    v1[21] = v21;
    v1[22] = v22;
    sub_24328672C(v23, v24);
    uint64_t v14 = (uint64_t)v4;
    unint64_t v15 = v3;
    uint64_t v16 = v25;
  }
  sub_243286884(v14, v15, v16, v6);
}

uint64_t ItemChangeSession.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_24328672C(*(void *)(v0 + 160), *(void *)(v0 + 168));
  swift_release();
  return v0;
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

uint64_t sub_24328672C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_243286740(a1, a2);
  }
  return a1;
}

uint64_t sub_243286740(uint64_t a1, unint64_t a2)
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

uint64_t ItemChangeSession.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_24328672C(*(void *)(v0 + 160), *(void *)(v0 + 168));
  swift_release();

  return MEMORY[0x270FA0228](v0, 208, 7);
}

uint64_t type metadata accessor for ItemChangeSession()
{
  return self;
}

uint64_t method lookup function for ItemChangeSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ItemChangeSession);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_243286884(uint64_t a1, unint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 >> 6 == 1)
  {
  }
  else if (!(a4 >> 6))
  {
    sub_243286740(a1, a2);
  }
}

uint64_t sub_2432868A0(uint64_t a1, unint64_t a2)
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

void sub_2432868F8(void *a1)
{
  if ((uint64_t)a1[24] <= 0)
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2432AC528();
    __swift_project_value_buffer(v16, (uint64_t)qword_268D92920);
    uint64_t v17 = sub_2432AC508();
    os_log_type_t v18 = sub_2432AC7B8();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_243282000, v17, v18, "ItemChangeSession.sync() will retry enumerating the sync anchor", v19, 2u);
      MEMORY[0x245678AE0](v19, -1, -1);
    }

    uint64_t v20 = a1[24];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      a1[24] = v22;
      return;
    }
    __break(1u);
  }
  else
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2432AC528();
    __swift_project_value_buffer(v2, (uint64_t)qword_268D92920);
    unint64_t v3 = sub_2432AC508();
    os_log_type_t v4 = sub_2432AC7B8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_243282000, v3, v4, "ItemChangeSession.sync() did fail to save", v5, 2u);
      MEMORY[0x245678AE0](v5, -1, -1);
    }

    sub_243286BA8();
    uint64_t v6 = swift_allocError();
    *char v7 = 2;
    id v8 = (void *)a1[19];
    a1[19] = v6;

    sub_243286F34((uint64_t)(a1 + 7), (uint64_t)v23);
    uint64_t v9 = v24;
    uint64_t v10 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    uint64_t v11 = (void *)a1[19];
    if (v11)
    {
      uint64_t v12 = *(void (**)(void *, uint64_t, uint64_t))(v10 + 112);
      id v13 = v11;
      v12(v11, v9, v10);

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      uint64_t v14 = a1[20];
      unint64_t v15 = a1[21];
      *((_OWORD *)a1 + 10) = xmmword_2432AD400;
      a1[22] = 0;
      sub_24328672C(v14, v15);
      return;
    }
  }
  __break(1u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_243286BA8()
{
  unint64_t result = qword_268D915F0;
  if (!qword_268D915F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D915F0);
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

uint64_t sub_243286C40()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_243286C78(uint64_t *a1)
{
  return sub_24328611C(a1);
}

unint64_t sub_243286C80()
{
  unint64_t result = qword_268D91028;
  if (!qword_268D91028)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268D91028);
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

uint64_t sub_243286D24()
{
  swift_release();
  sub_243286740(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_243286D6C()
{
  long long v5 = *(_OWORD *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_243286FB0;
  *(void *)(v3 + 152) = v2;
  *(_OWORD *)(v3 + 136) = v5;
  *(_OWORD *)(v3 + 120) = v6;
  return MEMORY[0x270FA2498](sub_2432861C8, 0, 0);
}

uint64_t sub_243286E34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2432868A0(a1, a2);
  }
  return a1;
}

uint64_t sub_243286E48(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_243284460;
  return sub_24329E914(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_243286F18(uint64_t a1, unint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 >> 6 == 1) {
    return (uint64_t)(id)a1;
  }
  if (!(a4 >> 6)) {
    return sub_2432868A0(a1, a2);
  }
  return a1;
}

uint64_t sub_243286F34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_243286F98(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_243286FB4(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5)
{
  void (*v13)(long long *__return_ptr, void *, uint64_t, uint64_t);
  void v15[2];
  long long v16[2];

  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *(void *)(v6 + 144) = 0;
  *(void *)(v6 + 152) = 0;
  *(void *)(v6 + 160) = 0;
  *(_OWORD *)(v6 + 168) = xmmword_2432AD3E0;
  *(_OWORD *)(v6 + 192) = xmmword_2432AD3F0;
  sub_243286F34((uint64_t)a2, v6 + 16);
  sub_243286F34(a3, v6 + 56);
  *(unsigned char *)(v6 + 96) = a4;
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v11);
  if (qword_268D90D10 != -1) {
    swift_once();
  }
  v15[0] = qword_268D91258;
  v15[1] = unk_268D91260;
  id v13 = *(void (**)(long long *__return_ptr, void *, uint64_t, uint64_t))(v12 + 8);
  swift_bridgeObjectRetain();
  v13(v16, v15, v11, v12);
  __swift_destroy_boxed_opaque_existential_1(a3);
  swift_bridgeObjectRelease();
  sub_243286F98(v16, v6 + 104);
  *(void *)(v6 + 184) = a5;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
  return v6;
}

uint64_t sub_2432870F8(uint64_t a1)
{
  *(void *)(v2 + 376) = v1;
  uint64_t v4 = sub_2432AC918();
  *(void *)(v2 + 384) = v4;
  *(void *)(v2 + 392) = *(void *)(v4 - 8);
  *(void *)(v2 + 400) = swift_task_alloc();
  *(void *)(v2 + 408) = swift_task_alloc();
  uint64_t v5 = sub_2432AC938();
  *(void *)(v2 + 416) = v5;
  *(void *)(v2 + 424) = *(void *)(v5 - 8);
  *(void *)(v2 + 432) = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91060);
  *(void *)(v2 + 440) = v6;
  *(void *)(v2 + 448) = *(void *)(v6 - 8);
  *(void *)(v2 + 456) = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91068);
  *(void *)(v2 + 464) = v7;
  *(void *)(v2 + 472) = *(void *)(v7 - 8);
  *(void *)(v2 + 480) = swift_task_alloc();
  *(_OWORD *)(v2 + 488) = *(_OWORD *)a1;
  *(void *)(v2 + 504) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_2432872FC, 0, 0);
}

uint64_t sub_2432872FC()
{
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v2 = v1;
  if (*(void *)(v1 + 144))
  {
    swift_retain();
    sub_2432AC538();
    swift_release();
    uint64_t v2 = *(void *)(v0 + 376);
  }
  uint64_t v4 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 480);
  uint64_t v5 = *(void *)(v0 + 464);
  uint64_t v31 = *(void *)(v0 + 448);
  uint64_t v29 = *(void *)(v0 + 456);
  uint64_t v30 = *(void *)(v0 + 440);
  sub_243286F34(v2 + 56, v0 + 16);
  uint64_t v6 = type metadata accessor for ItemContentObserverImpl();
  uint64_t v7 = swift_allocObject();
  *(void *)(v0 + 512) = v7;
  uint64_t v8 = v7 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  *(_OWORD *)(v0 + 320) = xmmword_2432AD500;
  *(void *)(v0 + 336) = 0;
  sub_2432AC548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v8, v3, v5);
  *(void *)(v7 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize) = 20;
  sub_243286F98((long long *)(v0 + 16), v7 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  swift_beginAccess();
  sub_2432AC558();
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  sub_243289054();
  uint64_t v9 = sub_2432AC5A8();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
  *(void *)(v1 + 144) = v9;
  swift_release();
  uint64_t v10 = &protocol witness table for ItemContentObserverImpl;
  if (*(unsigned char *)(v2 + 96) == 1)
  {
    *(void *)(v0 + 240) = v6;
    *(void *)(v0 + 248) = &protocol witness table for ItemContentObserverImpl;
    *(void *)(v0 + 216) = v7;
    uint64_t v6 = type metadata accessor for ItemContentObserverActivityLoggingDecorator();
    uint64_t v11 = swift_allocObject();
    sub_243286F98((long long *)(v0 + 216), v11 + 16);
    uint64_t v10 = &protocol witness table for ItemContentObserverActivityLoggingDecorator;
  }
  else
  {
    uint64_t v11 = v7;
  }
  uint64_t v12 = *(void *)(v0 + 488);
  uint64_t v13 = *(void *)(v0 + 376);
  *(void *)(v0 + 160) = v6;
  *(void *)(v0 + 168) = v10;
  *(void *)(v0 + 136) = v11;
  uint64_t v14 = *(void *)(v13 + 160);
  unint64_t v15 = *(void *)(v13 + 168);
  long long v32 = *(_OWORD *)(v0 + 496);
  *(void *)(v13 + 160) = v12;
  *(_OWORD *)(v13 + 168) = v32;
  swift_retain();
  sub_2432868A0(v12, v32);
  sub_24328672C(v14, v15);
  unint64_t v16 = *(void *)(v13 + 168);
  if (v16 >> 60 == 15)
  {
    uint64_t v17 = *(void **)(*(void *)(v0 + 376) + 152);
    if (!v17) {
      goto LABEL_15;
    }
    sub_243286BA8();
    os_log_type_t v18 = (void *)swift_allocError();
    unsigned char *v19 = 7;
    id v20 = v17;
    id v21 = v17;
    char v22 = == infix(_:_:)();

    if (v22)
    {
      sub_243286F34(*(void *)(v0 + 376) + 104, v0 + 176);
      id v33 = (uint64_t (*)(uint64_t))((char *)&dword_268D912F0 + dword_268D912F0);
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 600) = v23;
      void *v23 = v0;
      v23[1] = sub_2432885AC;
      return v33(v0 + 176);
    }
    else
    {
LABEL_15:
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 136);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
      return v28();
    }
  }
  else
  {
    *(void *)(v0 + 520) = v16;
    uint64_t v25 = *(void **)(v0 + 376);
    uint64_t v26 = v25[20];
    *(void *)(v0 + 528) = v26;
    *(void *)(v0 + 536) = v25[22];
    uint64_t v27 = v25[23];
    *(void *)(v0 + 544) = v27;
    sub_2432868A0(v26, v16);
    return MEMORY[0x270FA2498](sub_2432877A0, v27, 0);
  }
}

uint64_t sub_2432877A0()
{
  *(unsigned char *)(v0 + 608) = *(unsigned char *)(*(void *)(v0 + 544) + 112);
  return MEMORY[0x270FA2498](sub_2432877C8, 0, 0);
}

uint64_t sub_2432877C8()
{
  if (*(unsigned char *)(v0 + 608))
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2432AC528();
    __swift_project_value_buffer(v1, (uint64_t)qword_268D92920);
    uint64_t v2 = sub_2432AC508();
    os_log_type_t v3 = sub_2432AC7B8();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_243282000, v2, v3, "ItemContentSession.enumerate() stopping, extension was invalidated", v4, 2u);
      MEMORY[0x245678AE0](v4, -1, -1);
    }
    uint64_t v5 = *(void *)(v0 + 528);
    unint64_t v6 = *(void *)(v0 + 520);

    sub_243286F34(v0 + 136, v0 + 56);
    uint64_t v7 = *(void *)(v0 + 80);
    uint64_t v8 = *(void *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v7);
    sub_243286BA8();
    uint64_t v9 = (void *)swift_allocError();
    *uint64_t v10 = 8;
    (*(void (**)(void *, uint64_t, uint64_t))(v8 + 32))(v9, v7, v8);
    sub_24328672C(v5, v6);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 136);

    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 536);
    uint64_t v14 = *(void *)(v0 + 528);
    unint64_t v15 = *(void *)(v0 + 520);
    uint64_t v16 = *(void *)(v0 + 400);
    uint64_t v25 = *(void *)(v0 + 432);
    uint64_t v26 = *(void *)(v0 + 408);
    uint64_t v17 = *(void *)(v0 + 392);
    uint64_t v28 = *(void *)(v0 + 384);
    uint64_t v18 = *(void *)(v0 + 376);
    swift_beginAccess();
    uint64_t v24 = 1000000000000000000 * qword_268D912D8;
    uint64_t v19 = ((qword_268D912D8 >> 63) & 0xF21F494C589C0000)
        + (((unint64_t)qword_268D912D8 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
    sub_243286F34(v0 + 136, v0 + 256);
    id v20 = (void *)swift_allocObject();
    *(void *)(v0 + 552) = v20;
    v20[2] = v18;
    v20[3] = v14;
    v20[4] = v15;
    v20[5] = v13;
    sub_243286F98((long long *)(v0 + 256), (uint64_t)(v20 + 6));
    sub_243286E34(v14, v15);
    swift_retain();
    sub_2432AC928();
    sub_2432AC8F8();
    MEMORY[0x245678240](v24, v19);
    id v21 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    *(void *)(v0 + 560) = v21;
    *(void *)(v0 + 568) = (v17 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v21(v16, v28);
    char v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 576) = v22;
    v22[2] = &unk_268D91080;
    v22[3] = v20;
    v22[4] = v26;
    v22[5] = v25;
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 584) = v23;
    void *v23 = v0;
    v23[1] = sub_243287BE0;
    return MEMORY[0x270FA22B8]();
  }
}

uint64_t sub_243287BE0()
{
  *(void *)(*(void *)v1 + 592) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_243287F88;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_243287CFC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243287CFC()
{
  uint64_t v1 = *(void *)(v0 + 528);
  unint64_t v2 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v5 = *(void *)(v0 + 416);
  (*(void (**)(void, void))(v0 + 560))(*(void *)(v0 + 408), *(void *)(v0 + 384));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_release();
  sub_24328672C(v1, v2);
  unint64_t v6 = *(void **)(v0 + 376);
  unint64_t v7 = v6[21];
  if (v7 >> 60 == 15)
  {
    uint64_t v8 = (void *)v6[19];
    if (!v8) {
      goto LABEL_10;
    }
    sub_243286BA8();
    uint64_t v9 = (void *)swift_allocError();
    *uint64_t v10 = 7;
    id v11 = v8;
    id v12 = v8;
    char v13 = == infix(_:_:)();

    if (v13)
    {
      sub_243286F34(*(void *)(v0 + 376) + 104, v0 + 176);
      uint64_t v19 = (uint64_t (*)(uint64_t))((char *)&dword_268D912F0 + dword_268D912F0);
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 600) = v14;
      void *v14 = v0;
      v14[1] = sub_2432885AC;
      return v19(v0 + 176);
    }
    else
    {
LABEL_10:
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 136);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
      return v18();
    }
  }
  else
  {
    *(void *)(v0 + 520) = v7;
    uint64_t v16 = v6[20];
    *(void *)(v0 + 528) = v16;
    *(void *)(v0 + 536) = v6[22];
    uint64_t v17 = v6[23];
    *(void *)(v0 + 544) = v17;
    sub_2432868A0(v16, v7);
    return MEMORY[0x270FA2498](sub_2432877A0, v17, 0);
  }
}

uint64_t sub_243287F88()
{
  uint64_t v1 = *(void **)(v0 + 592);
  v56 = (void *)(v0 + 136);
  unint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 560);
  uint64_t v3 = *(void *)(v0 + 424);
  uint64_t v4 = *(void *)(v0 + 432);
  uint64_t v6 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 416);
  uint64_t v7 = *(void *)(v0 + 384);
  swift_task_dealloc();
  v2(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  swift_release();
  *(void *)(v0 + 368) = v1;
  id v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
  if (swift_dynamicCast())
  {

    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2432AC528();
    __swift_project_value_buffer(v9, (uint64_t)qword_268D92920);
    uint64_t v10 = sub_2432AC508();
    os_log_type_t v11 = sub_2432AC7B8();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_243282000, v10, v11, "ItemContentSession.enumerate() did timeout", v12, 2u);
      MEMORY[0x245678AE0](v12, -1, -1);
    }
    uint64_t v13 = *(void *)(v0 + 528);
    unint64_t v14 = *(void *)(v0 + 520);
    unint64_t v15 = *(void **)(v0 + 376);

    sub_243286F34((uint64_t)v56, v0 + 96);
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v17 = *(void *)(v0 + 128);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), v16);
    sub_243286BA8();
    uint64_t v18 = (void *)swift_allocError();
    unsigned char *v19 = 7;
    (*(void (**)(void *, uint64_t, uint64_t))(v17 + 32))(v18, v16, v17);

    __swift_destroy_boxed_opaque_existential_1(v0 + 96);
    uint64_t v20 = v15[20];
    unint64_t v21 = v15[21];
    *((_OWORD *)v15 + 10) = xmmword_2432AD400;
    v15[22] = 0;
    sub_24328672C(v20, v21);
    sub_24328672C(v13, v14);
    char v22 = *(void **)(v0 + 368);
  }
  else
  {

    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v23 = *(void **)(v0 + 592);
    uint64_t v24 = sub_2432AC528();
    __swift_project_value_buffer(v24, (uint64_t)qword_268D92920);
    id v25 = v23;
    id v26 = v23;
    uint64_t v27 = sub_2432AC508();
    os_log_type_t v28 = sub_2432AC7B8();
    BOOL v29 = os_log_type_enabled(v27, v28);
    uint64_t v30 = *(void **)(v0 + 592);
    if (v29)
    {
      uint64_t v31 = swift_slowAlloc();
      long long v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138543362;
      id v33 = v30;
      uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v31 + 4) = v34;
      void *v32 = v34;

      _os_log_impl(&dword_243282000, v27, v28, "ItemContentSession.enumerate() error %{public}@", (uint8_t *)v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v32, -1, -1);
      MEMORY[0x245678AE0](v31, -1, -1);
    }
    else
    {
    }
    id v35 = *(void **)(v0 + 592);
    uint64_t v36 = *(void *)(v0 + 528);
    unint64_t v37 = *(void *)(v0 + 520);
    v38 = *(void **)(v0 + 376);

    uint64_t v39 = *(void *)(v0 + 160);
    uint64_t v40 = *(void *)(v0 + 168);
    __swift_project_boxed_opaque_existential_1(v56, v39);
    (*(void (**)(void *, uint64_t, uint64_t))(v40 + 32))(v35, v39, v40);
    uint64_t v41 = v38[20];
    unint64_t v42 = v38[21];
    *((_OWORD *)v38 + 10) = xmmword_2432AD400;
    v38[22] = 0;
    sub_24328672C(v41, v42);
    sub_24328672C(v36, v37);
    char v22 = v35;
  }

  uint64_t v43 = *(void **)(v0 + 376);
  unint64_t v44 = v43[21];
  if (v44 >> 60 == 15)
  {
    unsigned int v45 = (void *)v43[19];
    if (!v45) {
      goto LABEL_22;
    }
    sub_243286BA8();
    v46 = (void *)swift_allocError();
    unsigned char *v47 = 7;
    id v48 = v45;
    id v49 = v45;
    char v50 = == infix(_:_:)();

    if (v50)
    {
      sub_243286F34(*(void *)(v0 + 376) + 104, v0 + 176);
      uint64_t v57 = (uint64_t (*)(uint64_t))((char *)&dword_268D912F0 + dword_268D912F0);
      v51 = (void *)swift_task_alloc();
      *(void *)(v0 + 600) = v51;
      void *v51 = v0;
      v51[1] = sub_2432885AC;
      return v57(v0 + 176);
    }
    else
    {
LABEL_22:
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v55 = *(uint64_t (**)(void))(v0 + 8);
      return v55();
    }
  }
  else
  {
    *(void *)(v0 + 520) = v44;
    uint64_t v53 = v43[20];
    *(void *)(v0 + 528) = v53;
    *(void *)(v0 + 536) = v43[22];
    uint64_t v54 = v43[23];
    *(void *)(v0 + 544) = v54;
    sub_2432868A0(v53, v44);
    return MEMORY[0x270FA2498](sub_2432877A0, v54, 0);
  }
}

uint64_t sub_2432885AC()
{
  uint64_t v1 = *v0 + 176;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return MEMORY[0x270FA2498](sub_2432886B4, 0, 0);
}

uint64_t sub_2432886B4()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24328875C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    v5[0] = v1;
    v5[1] = v2;
    v5[2] = v3;
    sub_243288A3C((uint64_t)v5);
    return swift_release();
  }
  return result;
}

uint64_t sub_2432887D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a3;
  v6[12] = a4;
  v6[10] = a2;
  return MEMORY[0x270FA2498](sub_243288800, 0, 0);
}

uint64_t sub_243288800()
{
  uint64_t v1 = *(void *)(v0 + 104);
  long long v8 = *(_OWORD *)(v0 + 88);
  sub_243286F34(*(void *)(v0 + 80) + 104, v0 + 16);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
  *(_OWORD *)(v0 + 56) = v8;
  *(void *)(v0 + 72) = v1;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_243288940;
  uint64_t v5 = *(void *)(v0 + 112);
  return v7(v0 + 56, v5, v2, v3);
}

uint64_t sub_243288940()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_243286440, 0, 0);
}

void sub_243288A3C(uint64_t a1)
{
  uint64_t v3 = *(void **)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = v1;
  switch((v2 >> 60) & 3)
  {
    case 1uLL:
      uint64_t v11 = v1[10];
      uint64_t v12 = v1[11];
      __swift_project_boxed_opaque_existential_1(v1 + 7, v11);
      uint64_t v13 = *(void (**)(void *, unint64_t, uint64_t, uint64_t))(v12 + 104);
      sub_2432868A0((uint64_t)v3, v2 & 0xCFFFFFFFFFFFFFFFLL);
      v13(v3, v2 & 0xCFFFFFFFFFFFFFFFLL, v11, v12);
      goto LABEL_5;
    case 2uLL:
      unint64_t v14 = (void *)v1[19];
      v5[19] = v3;
      id v15 = v3;
      id v16 = v3;

      uint64_t v17 = v5[10];
      uint64_t v18 = v5[11];
      __swift_project_boxed_opaque_existential_1(v5 + 7, v17);
      (*(void (**)(void *, uint64_t, uint64_t))(v18 + 112))(v3, v17, v18);
LABEL_5:
      uint64_t v19 = v5[20];
      unint64_t v20 = v5[21];
      *((_OWORD *)v5 + 10) = xmmword_2432AD400;
      v5[22] = 0;
      sub_24328672C(v19, v20);
      sub_243288D70(v3, v2);
      break;
    case 3uLL:
      return;
    default:
      uint64_t v6 = v1[10];
      uint64_t v7 = v1[11];
      __swift_project_boxed_opaque_existential_1(v1 + 7, v6);
      v21[0] = v3;
      v21[1] = v2;
      v21[2] = v4;
      long long v8 = *(void (**)(void *, uint64_t, uint64_t))(v7 + 96);
      sub_2432868A0((uint64_t)v3, v2);
      v8(v21, v6, v7);
      uint64_t v9 = v1[20];
      unint64_t v10 = v1[21];
      v1[20] = v3;
      v1[21] = v2;
      v1[22] = v4;
      sub_24328672C(v9, v10);
      v1[24] = 0;
      break;
  }
}

uint64_t ItemContentSession.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_24328672C(*(void *)(v0 + 160), *(void *)(v0 + 168));
  swift_release();
  return v0;
}

uint64_t ItemContentSession.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();

  sub_24328672C(*(void *)(v0 + 160), *(void *)(v0 + 168));
  swift_release();

  return MEMORY[0x270FA0228](v0, 208, 7);
}

uint64_t type metadata accessor for ItemContentSession()
{
  return self;
}

uint64_t method lookup function for ItemContentSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ItemContentSession);
}

void sub_243288D70(void *a1, unint64_t a2)
{
  uint64_t v2 = (a2 >> 60) & 3;
  if (v2 == 2)
  {
  }
  else
  {
    if (v2 == 1)
    {
      a2 &= 0xCFFFFFFFFFFFFFFFLL;
    }
    else if (v2)
    {
      return;
    }
    sub_243286740((uint64_t)a1, a2);
  }
}

void sub_243288D9C(void *a1)
{
  if ((uint64_t)a1[24] <= 0)
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2432AC528();
    __swift_project_value_buffer(v16, (uint64_t)qword_268D92920);
    uint64_t v17 = sub_2432AC508();
    os_log_type_t v18 = sub_2432AC7B8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_243282000, v17, v18, "ItemContentSession.enumerate() will retry enumerating the page", v19, 2u);
      MEMORY[0x245678AE0](v19, -1, -1);
    }

    uint64_t v20 = a1[24];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      a1[24] = v22;
      return;
    }
    __break(1u);
  }
  else
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2432AC528();
    __swift_project_value_buffer(v2, (uint64_t)qword_268D92920);
    uint64_t v3 = sub_2432AC508();
    os_log_type_t v4 = sub_2432AC7B8();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_243282000, v3, v4, "ItemContentSession.enumerate() did fail to save", v5, 2u);
      MEMORY[0x245678AE0](v5, -1, -1);
    }

    sub_243286BA8();
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = 2;
    long long v8 = (void *)a1[19];
    a1[19] = v6;

    sub_243286F34((uint64_t)(a1 + 7), (uint64_t)v23);
    uint64_t v9 = v24;
    uint64_t v10 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    uint64_t v11 = (void *)a1[19];
    if (v11)
    {
      uint64_t v12 = *(void (**)(void *, uint64_t, uint64_t))(v10 + 112);
      id v13 = v11;
      v12(v11, v9, v10);

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      uint64_t v14 = a1[20];
      unint64_t v15 = a1[21];
      *((_OWORD *)a1 + 10) = xmmword_2432AD400;
      a1[22] = 0;
      sub_24328672C(v14, v15);
      return;
    }
  }
  __break(1u);
}

uint64_t sub_243289014()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24328904C(uint64_t *a1)
{
  return sub_24328875C(a1);
}

unint64_t sub_243289054()
{
  unint64_t result = qword_268D91070;
  if (!qword_268D91070)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268D91070);
  }
  return result;
}

uint64_t sub_2432890B0()
{
  swift_release();
  sub_243286740(*(void *)(v0 + 24), *(void *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_2432890F8()
{
  long long v6 = *(_OWORD *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_243286FB0;
  *(void *)(v4 + 104) = v3;
  *(void *)(v4 + 112) = v0 + 48;
  *(void *)(v4 + 96) = v2;
  *(_OWORD *)(v4 + 80) = v6;
  return MEMORY[0x270FA2498](sub_243288800, 0, 0);
}

uint64_t ItemContentObserverImpl.__allocating_init(suggestedPageSize:store:)(uint64_t a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  sub_2432AC548();
  *(void *)(v4 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize) = a1;
  sub_243286F98(a2, v4 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  return v4;
}

double sub_24328925C@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_2432892E4(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24328AF50(v1, v2);
  swift_retain();
  return sub_2432AC588();
}

uint64_t sub_243289378()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();

  return swift_release();
}

uint64_t sub_2432893F0()
{
  return swift_endAccess();
}

uint64_t sub_243289458(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91060);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  long long v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  long long v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91068);
  sub_2432AC568();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_2432895CC()
{
  return swift_endAccess();
}

uint64_t sub_243289630()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_243289678(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2432896C4())()
{
  return j__swift_endAccess;
}

uint64_t ItemContentObserverImpl.init(suggestedPageSize:store:)(uint64_t a1, long long *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91068);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  long long v11 = xmmword_2432AD500;
  uint64_t v12 = 0;
  sub_2432AC548();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  *(void *)(v2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize) = a1;
  sub_243286F98(a2, v2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  return v2;
}

uint64_t sub_24328985C(uint64_t a1)
{
  uint64_t result = sub_243289CAC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    long long v12 = xmmword_2432AD5A0;
    uint64_t v13 = 0;
    swift_retain();
    uint64_t result = sub_2432AC588();
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4)
    {
      uint64_t v11 = v1 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store;
      swift_bridgeObjectRetain();
      uint64_t v5 = (unsigned char *)(a1 + 56);
      do
      {
        uint64_t v7 = (void *)*((void *)v5 - 3);
        if (*v5)
        {
          sub_243286F34(v11, (uint64_t)&v12);
          uint64_t v6 = v15;
          __swift_project_boxed_opaque_existential_1(&v12, v14);
          uint64_t v10 = *(void (**)(void))(v6 + 48);
        }
        else
        {
          sub_243286F34(v11, (uint64_t)&v12);
          uint64_t v8 = v15;
          __swift_project_boxed_opaque_existential_1(&v12, v14);
          uint64_t v10 = *(void (**)(void))(v8 + 32);
        }
        sub_243289E08(v7);
        id v9 = v7;
        v10();

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
        sub_243289E40(v7);
        v5 += 32;
        --v4;
      }
      while (v4);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_243289A58(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  uint64_t result = sub_243289CAC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2432868A0(v1, v2);
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_243289AEC(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_243289CAC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2432868A0(a1, a2);
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_243289B84(void *a1)
{
  uint64_t result = sub_243289CAC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v3 = a1;
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

void *sub_243289C10@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();
  swift_release();
  uint64_t result = v5;
  unint64_t v3 = v6;
  uint64_t v4 = v7;
  if ((v6 & 0x3000000000000000) != 0)
  {
    sub_243288D70(v5, v6);
    uint64_t result = 0;
    uint64_t v4 = 0;
    unint64_t v3 = 0xF000000000000000;
  }
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_243289CAC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();
  swift_release();
  sub_243286BA8();
  uint64_t v0 = (void *)swift_allocError();
  unsigned char *v1 = 7;
  sub_24328AF50(v6, v7);
  id v2 = v0;
  if ((v7 & 0x3000000000000000) == 0x2000000000000000)
  {
    char v3 = == infix(_:_:)();
    sub_243288D70(v6, v7);
    sub_243288D70(v0, 0x2000000000000000uLL);

    char v4 = v3 ^ 1;
  }
  else
  {
    sub_243288D70(v6, v7);
    sub_243288D70(v0, 0x2000000000000000uLL);

    char v4 = 1;
  }
  sub_243288D70(v6, v7);
  return v4 & 1;
}

uint64_t sub_243289E08(void *a1)
{
  id v1 = a1;

  return swift_bridgeObjectRetain();
}

uint64_t sub_243289E40(void *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t ItemContentObserverImpl.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91068);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  return v0;
}

uint64_t ItemContentObserverImpl.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91068);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_store);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_243289FAC(uint64_t a1)
{
  return sub_24328985C(a1);
}

uint64_t sub_243289FD0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  uint64_t result = sub_243289CAC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2432868A0(v1, v2);
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_24328A068(uint64_t a1, unint64_t a2)
{
  uint64_t result = sub_243289CAC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2432868A0(a1, a2);
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_24328A104(void *a1)
{
  uint64_t result = sub_243289CAC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v3 = a1;
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_24328A194()
{
  uint64_t v1 = *v0 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_24328A1E0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91090);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2432AD5C0;
  sub_2432AC888();
  swift_bridgeObjectRelease();
  sub_2432ACA08();
  sub_2432AC638();
  swift_bridgeObjectRelease();
  sub_2432AC638();
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  *(void *)(v3 + 32) = 0xD00000000000001BLL;
  *(void *)(v3 + 40) = 0x80000002432B0EB0;
  sub_2432ACAE8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v1[5];
  uint64_t v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v5, v4);
}

uint64_t sub_24328A330()
{
  return 32;
}

uint64_t sub_24328A33C()
{
  return 10;
}

uint64_t sub_24328A348(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91090);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2432AD5C0;
  sub_2432AC888();
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_2432AC638();
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  sub_2432AC948();
  *(void *)(v5 + 56) = MEMORY[0x263F8D310];
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0xE000000000000000;
  sub_2432ACAE8();
  swift_bridgeObjectRelease();
  uint64_t v7 = v1[5];
  uint64_t v6 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v7);
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(&v9, v7, v6);
}

uint64_t sub_24328A488(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91090);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2432AD5C0;
  *(void *)(v5 + 56) = MEMORY[0x263F8D310];
  *(void *)(v5 + 32) = 0xD000000000000027;
  *(void *)(v5 + 40) = 0x80000002432B0F00;
  sub_2432ACAE8();
  swift_bridgeObjectRelease();
  uint64_t v6 = v2[5];
  uint64_t v7 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6, v7);
}

uint64_t sub_24328A560(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91090);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2432AD5C0;
  sub_2432AC888();
  sub_2432AC638();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
  sub_2432AC948();
  *(void *)(v3 + 56) = MEMORY[0x263F8D310];
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0xE000000000000000;
  sub_2432ACAE8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v1[5];
  uint64_t v4 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a1, v5, v4);
}

uint64_t sub_24328A690()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91090);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2432AD5C0;
  sub_2432AC888();
  swift_bridgeObjectRelease();
  sub_2432ACA08();
  sub_2432AC638();
  swift_bridgeObjectRelease();
  *(void *)(v4 + 56) = MEMORY[0x263F8D310];
  *(void *)(v4 + 32) = 0xD000000000000015;
  *(void *)(v4 + 40) = 0x80000002432B0F70;
  sub_2432ACAE8();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t ItemContentObserverActivityLoggingDecorator.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t ItemContentObserverActivityLoggingDecorator.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_24328A810(uint64_t a1)
{
  return sub_24328A1E0(a1);
}

uint64_t sub_24328A834(uint64_t *a1)
{
  return sub_24328A348(a1);
}

uint64_t sub_24328A858(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)*v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91090);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2432AD5C0;
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  *(void *)(v6 + 32) = 0xD000000000000027;
  *(void *)(v6 + 40) = 0x80000002432B0F00;
  sub_24328A330();
  sub_24328A33C();
  sub_2432ACAE8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = v5[5];
  uint64_t v8 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 24))(a1, a2, v7, v8);
}

uint64_t sub_24328A964(uint64_t a1)
{
  return sub_24328A560(a1);
}

uint64_t sub_24328A988()
{
  return sub_24328A690();
}

BOOL _s15ContactProvider23ItemContentObserverImplC5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = (v2 >> 60) & 3;
  if (v8)
  {
    if (v8 == 2)
    {
      if ((v5 & 0x3000000000000000) == 0x2000000000000000)
      {
        sub_24328AF50(*(id *)a1, v2);
        sub_24328AF50(v6, v5);
        char v17 = == infix(_:_:)();
        sub_243288D70(v3, v2);
        sub_243288D70(v6, v5);
        return v17 & 1;
      }
      goto LABEL_31;
    }
    if (v8 != 3
      || v3 != (id)1
      || v2 != 0x3000000000000000
      || v4 != 0
      || (v5 & 0x3000000000000000) != 0x3000000000000000
      || v6 != (void *)1
      || v5 != 0x3000000000000000
      || v7 != 0)
    {
LABEL_31:
      sub_24328AF50(*(id *)a1, v2);
      sub_24328AF50(v6, v5);
      sub_243288D70(v3, v2);
      sub_243288D70(v6, v5);
      return 0;
    }
    BOOL v16 = 1;
    sub_243288D70((void *)1, 0x3000000000000000uLL);
    sub_243288D70((void *)1, 0x3000000000000000uLL);
  }
  else
  {
    if ((v5 & 0x3000000000000000) != 0) {
      goto LABEL_31;
    }
    v20[0] = *(void *)a1;
    v20[1] = v2;
    v20[2] = v4;
    v19[0] = (uint64_t)v6;
    v19[1] = v5;
    v19[2] = v7;
    sub_24328AF50(v3, v2);
    sub_24328AF50(v6, v5);
    sub_24328AF50(v3, v2);
    sub_24328AF50(v6, v5);
    BOOL v16 = _s15ContactProvider0A8ItemPageV2eeoiySbAC_ACtFZ_0(v20, v19);
    sub_243288D70(v3, v2);
    sub_243288D70(v6, v5);
    sub_243288D70(v6, v5);
    sub_243288D70(v3, v2);
  }
  return v16;
}

uint64_t sub_24328ABC0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24328AC14(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR____TtC15ContactProvider23ItemContentObserverImpl_suggestedPageSize);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

uint64_t sub_24328AC64()
{
  return type metadata accessor for ItemContentObserverImpl();
}

uint64_t type metadata accessor for ItemContentObserverImpl()
{
  uint64_t result = qword_268D91098;
  if (!qword_268D91098) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24328ACB8()
{
  sub_24328AEF4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ItemContentObserverImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ItemContentObserverImpl);
}

uint64_t dispatch thunk of ItemContentObserverImpl.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.suggestedPageSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.suggestedPageSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.suggestedPageSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.__allocating_init(suggestedPageSize:store:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didEnumerate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didFinishEnumeratingPage(upTo:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didFinishEnumeratingContent(upTo:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.didFinishEnumeratingContentWithError(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of ItemContentObserverImpl.nextPage.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

void sub_24328AEF4()
{
  if (!qword_268D910A8)
  {
    unint64_t v0 = sub_2432AC598();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D910A8);
    }
  }
}

id sub_24328AF50(id result, unint64_t a2)
{
  uint64_t v2 = (a2 >> 60) & 3;
  if (v2 == 2) {
    return result;
  }
  if (v2 == 1)
  {
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  else if (v2)
  {
    return result;
  }
  return (id)sub_2432868A0((uint64_t)result, a2);
}

void destroy for ItemContentObserverImpl.State(uint64_t a1)
{
}

void *_s15ContactProvider23ItemContentObserverImplC5StateOwCP_0(void *a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  sub_24328AF50(*(id *)a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t assignWithCopy for ItemContentObserverImpl.State(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  sub_24328AF50(*(id *)a2, v4);
  uint64_t v6 = *(void **)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  sub_243288D70(v6, v7);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ItemContentObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *(void **)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  sub_243288D70(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ItemContentObserverImpl.State(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ItemContentObserverImpl.State(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

uint64_t sub_24328B0D4(uint64_t a1)
{
  if (((*(void *)(a1 + 8) >> 60) & 3) == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return (*(void *)(a1 + 8) >> 60) & 3;
  }
}

uint64_t sub_24328B0F0(uint64_t result)
{
  *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

void *sub_24328B100(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *__n128 result = (a2 - 3);
    *(_OWORD *)(result + 1) = xmmword_2432AD5D0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ItemContentObserverImpl.State()
{
  return &type metadata for ItemContentObserverImpl.State;
}

uint64_t type metadata accessor for ItemContentObserverActivityLoggingDecorator()
{
  return self;
}

uint64_t method lookup function for ItemContentObserverActivityLoggingDecorator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ItemContentObserverActivityLoggingDecorator);
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didEnumerate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didFinishEnumeratingPage(upTo:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didFinishEnumeratingContent(upTo:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.didFinishEnumeratingContentWithError(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ItemContentObserverActivityLoggingDecorator.suggestedPageSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ContactItemEnumerating.enumerator(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ContactItemEnumerator.enumerateContent(in:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_243286FB0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ContactItemEnumerator.enumerateChanges(startingAt:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_243286FB0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ContactItemEnumerator.invalidate()(uint64_t a1, uint64_t a2)
{
  unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_243284460;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ContactItemContentObserver.didEnumerate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ContactItemContentObserver.didFinishEnumeratingPage(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ContactItemContentObserver.didFinishEnumeratingContent(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ContactItemContentObserver.didFinishEnumeratingContentWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ContactItemContentObserver.suggestedPageSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didUpdate(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didDelete(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didFinishEnumeratingChanges(upTo:moreComing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.didFinishEnumeratingChangesWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ContactItemChangeObserver.suggestedBatchSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t ContactProviderManager.__allocating_init(domainIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  ContactProviderManager.init(domainIdentifier:)(a1, a2);
  return v4;
}

uint64_t ContactProviderManager.init(domainIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  *(_OWORD *)(v2 + 64) = 0u;
  uint64_t v8 = v2 + 64;
  *(void *)(v2 + 16) = 0;
  *(_OWORD *)(v2 + 80) = 0u;
  *(void *)(v2 + 96) = 0;
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v9 = _s15ContactProvider0aB7ManagerC17registeredDomainsSayAA0aB6Domain_pGvgZ_0();
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    id v35 = v3;
    uint64_t v49 = v2;
    uint64_t v11 = v9 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_243286F34(v11, (uint64_t)&v36);
      uint64_t v13 = v37;
      uint64_t v12 = v38;
      __swift_project_boxed_opaque_existential_1(&v36, v37);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v13, v12) == a1 && v14 == a2) {
        break;
      }
      char v16 = sub_2432ACA28();
      swift_bridgeObjectRelease();
      if (v16) {
        goto LABEL_12;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
      v11 += 40;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = v49;
        uint64_t v4 = v35;
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    uint64_t v5 = v49;
    uint64_t v4 = v35;
    swift_bridgeObjectRelease();
    sub_243286F98(&v36, (uint64_t)&v39);
  }
  else
  {
LABEL_10:
    uint64_t v41 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v40 + 1))
  {
    swift_bridgeObjectRelease();
    sub_243286F98(&v39, (uint64_t)&v42);
    sub_24328DFEC((uint64_t)&v46);
    uint64_t result = sub_243286F98(&v42, (uint64_t)&v46);
    goto LABEL_15;
  }
  sub_24328DFEC((uint64_t)&v39);
  if (qword_268D90D30 != -1) {
    swift_once();
  }
  if (qword_268D91640 == a1 && *(void *)algn_268D91648 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v31 = sub_2432ACA28();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
    {
      sub_243286BA8();
      swift_allocError();
      *uint64_t v34 = 10;
      swift_willThrow();
      goto LABEL_31;
    }
  }
  unint64_t v44 = &type metadata for DefaultContactProviderDomain;
  unsigned int v45 = &protocol witness table for DefaultContactProviderDomain;
  unint64_t v32 = sub_24328D628(MEMORY[0x263F8EE78]);
  *(void *)&long long v42 = 0;
  *((void *)&v42 + 1) = 0xE000000000000000;
  unint64_t v43 = v32;
  sub_24328E070((uint64_t)&v42, (uint64_t)&v46);
  uint64_t result = sub_24328E9D8((uint64_t)&v46, (uint64_t)&v42, qword_268D910C8);
  if (!v44) {
    goto LABEL_35;
  }
  sub_24328E0D8(&v42);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v42);
  if (v4)
  {
    sub_243286BA8();
    swift_allocError();
    *id v33 = 10;
    swift_willThrow();

LABEL_31:
    type metadata accessor for ContactProviderManager();
    sub_24328DFEC((uint64_t)&v46);

    sub_24328DFEC(v8);
    swift_deallocPartialClassInstance();
    return v5;
  }
LABEL_15:
  uint64_t v18 = *((void *)&v47 + 1);
  if (*((void *)&v47 + 1))
  {
    uint64_t v19 = v48;
    uint64_t v20 = __swift_project_boxed_opaque_existential_1(&v46, *((uint64_t *)&v47 + 1));
    uint64_t v21 = *(void *)(v18 - 8);
    MEMORY[0x270FA5388](v20);
    uint64_t v23 = (char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v21 + 16))(v23);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v18);
    id v24 = objc_allocWithZone(MEMORY[0x263EFEA38]);
    uint64_t v25 = (void *)sub_2432AC5E8();
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend(v24, sel_initWithDomainIdentifier_, v25);

    uint64_t v27 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v26;

    uint64_t result = sub_24328E9D8((uint64_t)&v46, (uint64_t)&v42, qword_268D910C8);
    if (v44)
    {
      sub_243286F98(&v42, v5 + 24);
      id v28 = objc_msgSend(self, sel_processInfo);
      unsigned __int8 v29 = objc_msgSend(v28, sel_isiOSAppOnMac);

      if (v29) {
        char v30 = 0;
      }
      else {
        char v30 = objc_msgSend(self, sel_isiOSAppOnVision) ^ 1;
      }
      *(unsigned char *)(v5 + 104) = v30;
      sub_24328DFEC((uint64_t)&v46);
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void static ContactProviderManager.addDomain(_:)(void *a1)
{
}

uint64_t sub_24328BB9C@<X0>(uint64_t a1@<X8>)
{
  return sub_243286F34(v1 + 24, a1);
}

id sub_24328BBA8()
{
  if (*(unsigned char *)(v0 + 104) != 1) {
    return 0;
  }
  id result = *(id *)(v0 + 16);
  if (result) {
    return objc_msgSend(result, sel_isDomainEnabled);
  }
  return result;
}

uint64_t sub_24328BBE8()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24328BC08, 0, 0);
}

uint64_t sub_24328BC08()
{
  uint64_t v1 = v0[15];
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    uint64_t v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_24328BD88;
      uint64_t v3 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_24328BE98;
      v0[13] = &block_descriptor;
      v0[14] = v3;
      objc_msgSend(v2, sel_enableDomainWithCompletionHandler_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v4 = 5;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  return v5();
}

uint64_t sub_24328BD88()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_24328EA84;
  }
  else {
    uint64_t v2 = sub_24328EA88;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24328BE98(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_24328BF30()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24328BF50, 0, 0);
}

uint64_t sub_24328BF50()
{
  uint64_t v1 = v0[15];
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    uint64_t v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_24328BD88;
      uint64_t v3 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_24328BE98;
      v0[13] = &block_descriptor_2;
      v0[14] = v3;
      objc_msgSend(v2, sel_disableDomainWithCompletionHandler_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v4 = 5;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  return v5();
}

uint64_t sub_24328C0D0()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24328C0F0, 0, 0);
}

uint64_t sub_24328C0F0()
{
  uint64_t v1 = *(void *)(v0 + 120);
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    uint64_t v2 = v1 + 64;
    swift_beginAccess();
    sub_24328E9D8(v2, v0 + 56, qword_268D910C8);
    if (*(void *)(v0 + 80))
    {
      sub_243286F98((long long *)(v0 + 56), v0 + 16);
    }
    else
    {
      sub_243286F34(*(void *)(v0 + 120) + 24, v0 + 16);
      sub_24328DFEC(v0 + 56);
    }
    uint64_t v5 = *(void *)(v0 + 120);
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA48]), sel_init);
    *(void *)(v0 + 128) = v6;
    objc_msgSend(v6, sel_setSynchronizationReason_, *MEMORY[0x263EFE0E0]);
    uint64_t v7 = *(void *)(v0 + 40);
    uint64_t v8 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
    uint64_t v9 = (void *)sub_2432AC5E8();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setDisplayName_, v9);

    uint64_t v10 = *(void *)(v0 + 40);
    uint64_t v11 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v10);
    (*(void (**)(uint64_t, uint64_t))(v11 + 24))(v10, v11);
    uint64_t v12 = (void *)sub_2432AC5C8();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setUserInfo_, v12);

    uint64_t v13 = *(void **)(v5 + 16);
    *(void *)(v0 + 136) = v13;
    if (v13)
    {
      v13;
      id v14 = v6;
      uint64_t v15 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v15;
      *uint64_t v15 = v0;
      v15[1] = sub_24328C3C8;
      return MEMORY[0x270EE4090](v6);
    }

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v3 = 5;
    swift_willThrow();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v4();
}

uint64_t sub_24328C3C8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24328C558;
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 136);

    uint64_t v3 = sub_24328C4E8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24328C4E8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24328C558()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v3 = (void *)v0[16];
  uint64_t v2 = (void *)v0[17];

  _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v1);
  swift_willThrow();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24328C600()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24328C620, 0, 0);
}

uint64_t sub_24328C620()
{
  uint64_t v1 = v0[15];
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    uint64_t v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_24328C7A0;
      uint64_t v3 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_24328BE98;
      v0[13] = &block_descriptor_6;
      v0[14] = v3;
      objc_msgSend(v2, sel_invalidateExtensionWithCompletionHandler_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v4 = 5;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  return v5();
}

uint64_t sub_24328C7A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 136) = v1;
  if (v1) {
    uint64_t v2 = sub_24328C914;
  }
  else {
    uint64_t v2 = sub_24328C8B0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24328C8B0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24328C914()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = (void *)v0[17];
  swift_willThrow();

  _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v2);
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24328C9A4()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24328C9C4, 0, 0);
}

uint64_t sub_24328C9C4()
{
  uint64_t v1 = v0[15];
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    uint64_t v2 = *(void **)(v1 + 16);
    v0[16] = v2;
    if (v2)
    {
      v0[2] = v0;
      v0[3] = sub_24328BD88;
      uint64_t v3 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_24328BE98;
      v0[13] = &block_descriptor_8;
      v0[14] = v3;
      objc_msgSend(v2, sel_resetEnumerationWithCompletionHandler_, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v4 = 5;
    swift_willThrow();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }
  return v5();
}

uint64_t ContactProviderManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  sub_24328DFEC(v0 + 64);
  return v0;
}

uint64_t ContactProviderManager.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  sub_24328DFEC(v0 + 64);

  return MEMORY[0x270FA0228](v0, 105, 7);
}

uint64_t sub_24328CBBC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91130);
    uint64_t v2 = sub_2432AC998();
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
    sub_24328E964(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24328E9C0(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_24328E9C0(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_24328E9C0(v36, v37);
    sub_24328E9C0(v37, &v33);
    uint64_t result = sub_2432AC858();
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
    uint64_t result = (uint64_t)sub_24328E9C0(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24328E9D0();
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

void static ContactProviderManager.removeDomain(_:)()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_processInfo);
  unsigned __int8 v1 = objc_msgSend(v0, sel_isiOSAppOnMac);

  if (v1 & 1) != 0 || (objc_msgSend(self, sel_isiOSAppOnVision))
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v2 = 5;
    swift_willThrow();
  }
  else
  {
    uint64_t v3 = self;
    uint64_t v4 = (void *)sub_2432AC5E8();
    v9[0] = 0;
    unsigned int v5 = objc_msgSend(v3, sel_removeDomain_error_, v4, v9);

    if (v5)
    {
      id v6 = v9[0];
    }
    else
    {
      id v7 = v9[0];
      int64_t v8 = (void *)sub_2432AC4A8();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v8);
      swift_willThrow();
    }
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContactProviderManager.enableExtension(_:)(Swift::String a1)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    uint64_t v2 = self;
    uint64_t v3 = (void *)sub_2432AC5E8();
    uint64_t v4 = (void *)sub_2432AC5E8();
    v10[0] = 0;
    unsigned int v5 = objc_msgSend(v2, sel_enableDomain_bundleIdentifier_shouldSynchronize_error_, v3, v4, 0, v10);

    if (v5)
    {
      id v6 = v10[0];
    }
    else
    {
      id v8 = v10[0];
      unint64_t v9 = (void *)sub_2432AC4A8();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v9);
      swift_willThrow();
    }
  }
  else
  {
    sub_243286BA8();
    swift_allocError();
    *id v7 = 5;
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContactProviderManager.disableExtension(_:)(Swift::String a1)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    uint64_t v2 = self;
    uint64_t v3 = (void *)sub_2432AC5E8();
    uint64_t v4 = (void *)sub_2432AC5E8();
    v10[0] = 0;
    unsigned int v5 = objc_msgSend(v2, sel_disableDomain_bundleIdentifier_error_, v3, v4, v10);

    if (v5)
    {
      id v6 = v10[0];
    }
    else
    {
      id v8 = v10[0];
      unint64_t v9 = (void *)sub_2432AC4A8();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v9);
      swift_willThrow();
    }
  }
  else
  {
    sub_243286BA8();
    swift_allocError();
    *id v7 = 5;
    swift_willThrow();
  }
}

uint64_t ContactProviderManager.allDomains()()
{
  if (*(unsigned char *)(v0 + 104) != 1)
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v3 = 5;
    swift_willThrow();
    return v0;
  }
  unint64_t v0 = sub_24328E3C4();
  unint64_t v2 = sub_2432AC7C8();
  if (v1)
  {
    _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v1);
    swift_willThrow();

    return v0;
  }
  unint64_t v5 = v2;
  if (!(v2 >> 62))
  {
    uint64_t v6 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_8;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2432AC968();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_18;
  }
LABEL_8:
  unint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24328D780(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = 0;
    unint64_t v0 = v17;
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x2456781E0](v7, v5);
      }
      else {
        id v8 = *(id *)(v5 + 8 * v7 + 32);
      }
      unint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_bundleIdentifier);
      uint64_t v11 = sub_2432AC5F8();
      uint64_t v13 = v12;

      unint64_t v15 = *(void *)(v17 + 16);
      unint64_t v14 = *(void *)(v17 + 24);
      if (v15 >= v14 >> 1) {
        sub_24328D780(v14 > 1, v15 + 1, 1);
      }
      ++v7;
      *(void *)(v17 + 16) = v15 + 1;
      unint64_t v16 = v17 + 16 * v15;
      *(void *)(v16 + 32) = v11;
      *(void *)(v16 + 40) = v13;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease();
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t ContactProviderManager.overrideDomain(_:)(uint64_t a1)
{
  sub_243286F34(a1, (uint64_t)v3);
  swift_beginAccess();
  sub_24328E070((uint64_t)v3, v1 + 64);
  return swift_endAccess();
}

unint64_t sub_24328D628(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91138);
  uint64_t v2 = sub_2432AC998();
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
    sub_24328E9D8(v6, (uint64_t)&v15, &qword_268D91140);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2432A6050(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24328E9C0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_24328D760(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24328D7C0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24328D780(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24328D964(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24328D7A0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24328DAD0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24328D7C0(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91148);
    char v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    id v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91150);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2432AC9A8();
  __break(1u);
  return result;
}

uint64_t sub_24328D964(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268D91610);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_2432AC9A8();
  __break(1u);
  return result;
}

uint64_t sub_24328DAD0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91128);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 32 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2432AC9A8();
  __break(1u);
  return result;
}

uint64_t _s15ContactProvider0aB7ManagerC17registeredDomainsSayAA0aB6Domain_pGvgZ_0()
{
  id v0 = objc_msgSend(self, sel_processInfo);
  unsigned __int8 v1 = objc_msgSend(v0, sel_isiOSAppOnMac);

  if (v1) {
    return MEMORY[0x263F8EE78];
  }
  unsigned __int8 v3 = objc_msgSend(self, sel_isiOSAppOnVision);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v3) {
    return v2;
  }
  sub_24328E3C4();
  unint64_t v4 = sub_2432AC7D8();
  unint64_t v5 = v4;
  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_6;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2432AC968();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_26;
  }
LABEL_6:
  uint64_t v39 = v2;
  uint64_t result = sub_24328D760(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    uint64_t v2 = v39;
    unint64_t v9 = v5 & 0xC000000000000001;
    uint64_t v32 = v6;
    while (1)
    {
      if (v9) {
        id v10 = (id)MEMORY[0x2456781E0](v8, v5);
      }
      else {
        id v10 = *(id *)(v5 + 8 * v8 + 32);
      }
      int64_t v11 = v10;
      id v12 = objc_msgSend(v10, sel_domainIdentifier);
      uint64_t v13 = sub_2432AC5F8();
      uint64_t v15 = v14;

      if (qword_268D90D30 != -1) {
        swift_once();
      }
      if (v13 == qword_268D91640 && v15 == *(void *)algn_268D91648) {
        break;
      }
      char v17 = sub_2432ACA28();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_20;
      }
      id v18 = objc_msgSend(v11, sel_domainIdentifier);
      uint64_t v19 = sub_2432AC5F8();
      uint64_t v33 = v20;
      uint64_t v34 = v19;

      sub_24328D628(MEMORY[0x263F8EE78]);
      unint64_t v21 = v9;
      id v22 = objc_msgSend(v11, sel_displayName);
      uint64_t v23 = sub_2432AC5F8();
      uint64_t v25 = v24;

      id v26 = objc_msgSend(v11, sel_userInfo);
      unint64_t v27 = v5;
      uint64_t v28 = sub_2432AC5D8();
      swift_bridgeObjectRelease();

      unint64_t v9 = v21;
      uint64_t v37 = &type metadata for CustomContactProviderDomain;
      uint64_t v38 = &protocol witness table for CustomContactProviderDomain;
      long long v29 = (void *)swift_allocObject();
      *(void *)&long long v35 = v29;

      v29[2] = v34;
      v29[3] = v33;
      v29[4] = v23;
      v29[5] = v25;
      uint64_t v6 = v32;
      v29[6] = v28;
      unint64_t v5 = v27;
LABEL_21:
      uint64_t v39 = v2;
      unint64_t v31 = *(void *)(v2 + 16);
      unint64_t v30 = *(void *)(v2 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_24328D760(v30 > 1, v31 + 1, 1);
        uint64_t v2 = v39;
      }
      ++v8;
      *(void *)(v2 + 16) = v31 + 1;
      sub_243286F98(&v35, v2 + 40 * v31 + 32);
      if (v6 == v8) {
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v37 = &type metadata for DefaultContactProviderDomain;
    uint64_t v38 = &protocol witness table for DefaultContactProviderDomain;

    *(void *)&long long v35 = 0;
    *((void *)&v35 + 1) = 0xE000000000000000;
    uint64_t v36 = MEMORY[0x263F8EE80];
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_24328DFEC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_268D910C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ContactProviderManager()
{
  return self;
}

uint64_t sub_24328E070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_268D910C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_24328E0D8(void *a1)
{
  v21[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = objc_msgSend(self, sel_processInfo);
  unsigned __int8 v3 = objc_msgSend(v2, sel_isiOSAppOnMac);

  if (v3 & 1) != 0 || (objc_msgSend(self, sel_isiOSAppOnVision))
  {
    sub_243286BA8();
    swift_allocError();
    *uint64_t v4 = 5;
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = a1[3];
    uint64_t v6 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v5);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v7);
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
    uint64_t v9 = a1[3];
    uint64_t v10 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v9);
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
    sub_24328CBBC(v11);
    swift_bridgeObjectRelease();
    id v12 = objc_allocWithZone(MEMORY[0x263EFEA40]);
    uint64_t v13 = (void *)sub_2432AC5E8();
    swift_bridgeObjectRelease();
    uint64_t v14 = (void *)sub_2432AC5E8();
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)sub_2432AC5C8();
    swift_bridgeObjectRelease();
    uint64_t v16 = (void *)sub_2432AC5E8();
    id v17 = objc_msgSend(v12, sel_initWithDomainIdentifer_displayName_userInfo_bundleIdentifier_registered_enabled_, v13, v14, v15, v16, 0, 0);

    v21[0] = 0;
    if (objc_msgSend(self, sel_addDomain_error_, v17, v21))
    {
      id v18 = v21[0];
    }
    else
    {
      id v19 = v21[0];
      uint64_t v20 = (void *)sub_2432AC4A8();

      swift_willThrow();
      _s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(v20);
      swift_willThrow();
    }
  }
}

unint64_t sub_24328E3C4()
{
  unint64_t result = qword_268D910F8;
  if (!qword_268D910F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D910F8);
  }
  return result;
}

uint64_t method lookup function for ContactProviderManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContactProviderManager);
}

uint64_t dispatch thunk of ContactProviderManager.__allocating_init(domainIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ContactProviderManager.domain.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of ContactProviderManager.isEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of ContactProviderManager.enable()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 208) + **(int **)(*(void *)v0 + 208));
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *id v2 = v1;
  v2[1] = sub_243286FB0;
  return v4();
}

uint64_t dispatch thunk of ContactProviderManager.disable()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 216) + **(int **)(*(void *)v0 + 216));
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *id v2 = v1;
  v2[1] = sub_243286FB0;
  return v4();
}

uint64_t dispatch thunk of ContactProviderManager.signalEnumerator(for:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 224) + **(int **)(*(void *)v1 + 224));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_243286FB0;
  return v6(a1);
}

uint64_t dispatch thunk of ContactProviderManager.invalidate()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 232) + **(int **)(*(void *)v0 + 232));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_243284460;
  return v4();
}

uint64_t dispatch thunk of ContactProviderManager.reset()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 240) + **(int **)(*(void *)v0 + 240));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_243286FB0;
  return v4();
}

uint64_t sub_24328E964(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_24328E9C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24328E9D0()
{
  return swift_release();
}

uint64_t sub_24328E9D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24328EA3C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24328EA8C()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24328EAD4(int a1)
{
  uint64_t v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_24328EB20())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24328EB7C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24328EBC4(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_24328EC10())()
{
  return j__swift_endAccess;
}

uint64_t StampedeManager.__allocating_init(notifyBatchSize:waitDivisor:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  StampedeManager.init(notifyBatchSize:waitDivisor:)(a1, a2);
  return v4;
}

uint64_t StampedeManager.init(notifyBatchSize:waitDivisor:)(uint64_t a1, uint64_t a2)
{
  sub_2432AC518();
  *(void *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) = 0;
  *(_DWORD *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait) = 1;
  *(void *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_notifyBatchSize) = a1;
  *(void *)(v2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitDivisor) = a2;
  return v2;
}

void sub_24328EDA8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v3;
  }
}

uint64_t sub_24328EDC8(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  BOOL v3 = __OFADD__(v2, result);
  uint64_t v4 = v2 + result;
  if (v3) {
    __break(1u);
  }
  else {
    *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v4;
  }
  return result;
}

void sub_24328EDE8()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 1;
}

void sub_24328EDFC()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 1;
}

uint64_t sub_24328EE10(uint64_t result)
{
  uint64_t v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch;
  if ((result & 1) == 0) {
    uint64_t v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges;
  }
  *(unsigned char *)(v1 + *v2) = 1;
  return result;
}

void sub_24328EE38()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) = 1;
  sub_243286BA8();
  uint64_t v2 = (void *)swift_allocError();
  *BOOL v3 = 8;
  char v4 = == infix(_:_:)();

  if (v4)
  {
    uint64_t v5 = sub_2432AC508();
    os_log_type_t v6 = sub_2432AC7B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_243282000, v5, v6, "didFinishEnumeratingWithError(extensionInvalidated) - will not wait for stamepede after save", v7, 2u);
      MEMORY[0x245678AE0](v7, -1, -1);
    }

    uint64_t v8 = (unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
    swift_beginAccess();
    *uint64_t v8 = 0;
  }
}

uint64_t sub_24328EF5C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  BOOL v2 = ((*(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) & 1) != 0
     || *(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges) == 1)
    && v1 > 0;
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_notifyBatchSize);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) == 1
    && *(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) == 1)
  {
    if (v1 >= v3) {
      BOOL v2 = 1;
    }
    if (!v2) {
      return v1 > 0;
    }
    return 1;
  }
  char v5 = v1 >= v3 || v2;
  return (v5 & 1) != 0;
}

BOOL sub_24328F004()
{
  return *(void *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) > 0;
}

uint64_t sub_24328F01C()
{
  uint64_t v1 = v0;
  BOOL v2 = (unsigned int *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  swift_beginAccess();
  *BOOL v2 = 0;
  uint64_t result = sub_24328EF5C();
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v4 = OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount;
  double v5 = ceil((double)*(uint64_t *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount)/ (double)*(uint64_t *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitDivisor));
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 <= -1.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v5 >= 4294967300.0)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  *BOOL v2 = v5;
  os_log_type_t v6 = (unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  uint64_t result = swift_beginAccess();
  if (*v6 == 1)
  {
    swift_retain_n();
    uint64_t v7 = sub_2432AC508();
    os_log_type_t v8 = sub_2432AC7B8();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67240448;
      sub_2432AC828();
      *(_WORD *)(v9 + 8) = 2050;
      swift_release();
      sub_2432AC828();
      swift_release();
      _os_log_impl(&dword_243282000, v7, v8, "didSave() - sleeping %{public}u seconds for %{public}ld items", (uint8_t *)v9, 0x12u);
      MEMORY[0x245678AE0](v9, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t result = sleep(*v2);
  }
  *(void *)(v1 + v4) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishWithError) = 0;
  *os_log_type_t v6 = 1;
  return result;
}

uint64_t StampedeManager.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_logger;
  uint64_t v2 = sub_2432AC528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t StampedeManager.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_logger;
  uint64_t v2 = sub_2432AC528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

void sub_24328F368()
{
  uint64_t v1 = *(void *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v3;
  }
}

uint64_t sub_24328F38C(uint64_t result)
{
  uint64_t v2 = *(void *)(*v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount);
  BOOL v3 = __OFADD__(v2, result);
  uint64_t v4 = v2 + result;
  if (v3) {
    __break(1u);
  }
  else {
    *(void *)(*v1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) = v4;
  }
  return result;
}

void sub_24328F3B0()
{
  *(unsigned char *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch) = 1;
}

void sub_24328F3C8()
{
  *(unsigned char *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishContent) = 1;
}

uint64_t sub_24328F3E0(uint64_t result)
{
  uint64_t v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishBatch;
  if ((result & 1) == 0) {
    uint64_t v2 = &OBJC_IVAR____TtC15ContactProvider15StampedeManager_didFinishChanges;
  }
  *(unsigned char *)(*v1 + *v2) = 1;
  return result;
}

void sub_24328F40C()
{
}

uint64_t sub_24328F430()
{
  return sub_24328EF5C() & 1;
}

BOOL sub_24328F458()
{
  return *(void *)(*v0 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_itemCount) > 0;
}

uint64_t sub_24328F474()
{
  return sub_24328F01C();
}

uint64_t sub_24328F498(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24328F4A8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_24328F4E4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_24328F4F4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_2432AC9A8();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_24328F598@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_24328F5C8@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  BOOL v3 = (_DWORD *)(*a1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24328F61C(int *a1, void *a2)
{
  int v2 = *a1;
  BOOL v3 = (_DWORD *)(*a2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_waitTimeInterval);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = v2;
  return result;
}

uint64_t sub_24328F66C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24328F6C0(char *a1, void *a2)
{
  char v2 = *a1;
  BOOL v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC15ContactProvider15StampedeManager_shouldWait);
  uint64_t result = swift_beginAccess();
  *BOOL v3 = v2;
  return result;
}

uint64_t dispatch thunk of StampedeManagerProtocol.didAddItem()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didUpdateItem()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didDeleteItems(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingPage()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingContent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingChanges(moreComing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didFinishEnumeratingWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.shouldNotify.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.shouldSave.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of StampedeManagerProtocol.didSave()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_24328F7D8()
{
  return type metadata accessor for StampedeManager();
}

uint64_t type metadata accessor for StampedeManager()
{
  uint64_t result = qword_268D91190;
  if (!qword_268D91190) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24328F82C()
{
  uint64_t result = sub_2432AC528();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for StampedeManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StampedeManager);
}

uint64_t dispatch thunk of StampedeManager.waitTimeInterval.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of StampedeManager.waitTimeInterval.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of StampedeManager.waitTimeInterval.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of StampedeManager.shouldWait.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of StampedeManager.shouldWait.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of StampedeManager.shouldWait.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of StampedeManager.__allocating_init(notifyBatchSize:waitDivisor:)()
{
  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t dispatch thunk of StampedeManager.didAddItem()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of StampedeManager.didUpdateItem()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of StampedeManager.didDeleteItems(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingPage()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingContent()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingChanges(moreComing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of StampedeManager.didFinishEnumeratingWithError(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of StampedeManager.shouldNotify.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of StampedeManager.shouldSave.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of StampedeManager.didSave()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t ContactItemPage.init(generationMarker:offset:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t ContactItemPage.generationMarker.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_2432868A0(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t ContactItemPage.generationMarker.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_243286740(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ContactItemPage.generationMarker.modify())()
{
  return nullsub_1;
}

uint64_t ContactItemPage.offset.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ContactItemPage.offset.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*ContactItemPage.offset.modify())()
{
  return nullsub_1;
}

uint64_t sub_24328FCAC(char a1)
{
  if (a1) {
    return 0x74657366666FLL;
  }
  else {
    return 0xD000000000000010;
  }
}

BOOL sub_24328FCE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24328FCFC()
{
  return sub_2432ACB18();
}

uint64_t sub_24328FD44()
{
  return sub_2432ACB08();
}

uint64_t sub_24328FD70()
{
  return sub_2432ACB18();
}

uint64_t sub_24328FDB4()
{
  return sub_24328FCAC(*v0);
}

uint64_t sub_24328FDBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2432908E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24328FDE4()
{
  return 0;
}

void sub_24328FDF0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24328FDFC(uint64_t a1)
{
  unint64_t v2 = sub_243290388();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24328FE38(uint64_t a1)
{
  unint64_t v2 = sub_243290388();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContactItemPage.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D911A0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  os_log_type_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  v11[0] = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243290388();
  sub_2432ACB38();
  uint64_t v12 = v8;
  uint64_t v13 = v7;
  char v14 = 0;
  sub_2432903DC();
  uint64_t v9 = v11[1];
  sub_2432AC9F8();
  if (!v9)
  {
    LOBYTE(v12) = 1;
    sub_2432AC9E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ContactItemPage.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D911B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243290388();
  sub_2432ACB28();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v15 = 0;
  sub_243290430();
  sub_2432AC9D8();
  uint64_t v9 = v13;
  unint64_t v10 = v14;
  LOBYTE(v13) = 1;
  sub_2432868A0(v9, v14);
  uint64_t v11 = sub_2432AC9C8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_243286740(v9, v10);
}

uint64_t sub_2432901E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ContactItemPage.init(from:)(a1, a2);
}

uint64_t sub_243290200(void *a1)
{
  return ContactItemPage.encode(to:)(a1);
}

double static ContactItemPage.initialPage.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = xmmword_2432AD8D0;
  *(void *)(a1 + 16) = 0;
  return result;
}

BOOL _s15ContactProvider0A8ItemPageV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = *a2;
  unint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x243290368);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(v6 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(v5) - v5;
          if (__OFSUB__(HIDWORD(v5), v5)) {
            goto LABEL_19;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12 && (v8 < 1 || (sub_2432868A0(*a2, a2[1]), (sub_243296678(v2, v3, v5, v6) & 1) != 0))) {
            return v4 == v7;
          }
          else {
            return 0;
          }
        case 2uLL:
          uint64_t v14 = *(void *)(v5 + 16);
          uint64_t v13 = *(void *)(v5 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_20;
        case 3uLL:
          if (v8) {
            return 0;
          }
          return v4 == v7;
        default:
          uint64_t v12 = BYTE6(v6);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(v2 + 16);
      uint64_t v9 = *(void *)(v2 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(v3);
      goto LABEL_6;
  }
}

unint64_t sub_243290388()
{
  unint64_t result = qword_268D911A8;
  if (!qword_268D911A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D911A8);
  }
  return result;
}

unint64_t sub_2432903DC()
{
  unint64_t result = qword_268D911B0;
  if (!qword_268D911B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D911B0);
  }
  return result;
}

unint64_t sub_243290430()
{
  unint64_t result = qword_268D911C0;
  if (!qword_268D911C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D911C0);
  }
  return result;
}

uint64_t destroy for ContactItemSyncAnchor(uint64_t a1)
{
  return sub_243286740(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *_s15ContactProvider21ContactItemSyncAnchorVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2432868A0(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  return a1;
}

uint64_t *assignWithCopy for ContactItemSyncAnchor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_2432868A0(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_243286740(v6, v7);
  a1[2] = a2[2];
  return a1;
}

uint64_t *assignWithTake for ContactItemSyncAnchor(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_243286740(v4, v5);
  a1[2] = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactItemSyncAnchor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ContactItemSyncAnchor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactItemPage()
{
  return &type metadata for ContactItemPage;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactItemPage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContactItemPage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243290794);
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

uint64_t sub_2432907BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2432907C4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactItemPage.CodingKeys()
{
  return &type metadata for ContactItemPage.CodingKeys;
}

unint64_t sub_2432907E4()
{
  unint64_t result = qword_268D911C8;
  if (!qword_268D911C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D911C8);
  }
  return result;
}

unint64_t sub_24329083C()
{
  unint64_t result = qword_268D911D0;
  if (!qword_268D911D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D911D0);
  }
  return result;
}

unint64_t sub_243290894()
{
  unint64_t result = qword_268D911D8;
  if (!qword_268D911D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D911D8);
  }
  return result;
}

uint64_t sub_2432908E8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000002432B12D0 || (sub_2432ACA28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74657366666FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_2432ACA28();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t Int.init(_:)(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 >> 62;
  uint64_t v5 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      if (v6 != 8)
      {
        uint64_t v5 = 0;
        goto LABEL_17;
      }
      uint64_t v5 = a1;
      if (v2)
      {
        if (v2 != 1)
        {
          uint64_t v14 = *(void *)(a1 + 16);
          swift_retain();
          swift_retain();
          uint64_t v15 = sub_2432AC448();
          if (!v15)
          {
LABEL_24:
            sub_2432AC458();
            __break(1u);
            JUMPOUT(0x243290B74);
          }
          uint64_t v16 = v15;
          uint64_t v17 = sub_2432AC468();
          BOOL v9 = __OFSUB__(v14, v17);
          uint64_t v18 = v14 - v17;
          if (!v9)
          {
            sub_2432AC458();
            uint64_t v5 = *(void *)(v16 + v18);
            swift_release();
            swift_release();
            goto LABEL_17;
          }
          goto LABEL_21;
        }
        if ((int)a1 <= a1 >> 32)
        {
          uint64_t v10 = sub_2432AC448();
          if (!v10)
          {
LABEL_23:
            sub_2432AC458();
            __break(1u);
            goto LABEL_24;
          }
          uint64_t v11 = v10;
          uint64_t v12 = sub_2432AC468();
          uint64_t v13 = (int)a1 - v12;
          if (!__OFSUB__((int)a1, v12))
          {
            sub_2432AC458();
            uint64_t v5 = *(void *)(v11 + v13);
            goto LABEL_17;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
LABEL_17:
      sub_243286740(a1, a2);
      return v5;
    case 2uLL:
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v7 = *(void *)(a1 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_17;
    default:
      uint64_t v6 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t ItemChangeObserverImpl.__allocating_init(suggestedBatchSize:store:)(uint64_t a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  sub_2432AC548();
  *(void *)(v4 + 16) = a1;
  sub_243286F98(a2, v4 + 24);
  return v4;
}

uint64_t == infix(_:_:)()
{
  uint64_t v0 = (void *)sub_2432AC498();
  uint64_t v1 = (void *)sub_2432AC498();
  id v2 = objc_msgSend(v0, sel_code);
  if (v2 != objc_msgSend(v1, sel_code)) {
    goto LABEL_7;
  }
  id v3 = objc_msgSend(v0, sel_domain);
  uint64_t v4 = sub_2432AC5F8();
  uint64_t v6 = v5;

  id v7 = objc_msgSend(v1, sel_domain);
  uint64_t v8 = sub_2432AC5F8();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  char v12 = sub_2432ACA28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
    sub_2432AC948();
    sub_2432AC948();
    char v13 = 1;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13 & 1;
  }
LABEL_7:

  char v13 = 0;
  return v13 & 1;
}

uint64_t sub_243290DF8()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t sub_243290E2C(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_243290E6C())()
{
  return j__swift_endAccess;
}

double sub_243290EC0@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_243290F50(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243286F18(v1, v2, v3, v4);
  swift_retain();
  return sub_2432AC588();
}

uint64_t sub_243290FF8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();

  return swift_release();
}

uint64_t sub_243291070()
{
  return swift_endAccess();
}

uint64_t sub_2432910D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91018);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91020);
  sub_2432AC568();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_24329124C()
{
  return swift_endAccess();
}

uint64_t ItemChangeObserverImpl.init(suggestedBatchSize:store:)(uint64_t a1, long long *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91020);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  memset(v11, 0, sizeof(v11));
  char v12 = 0x80;
  sub_2432AC548();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  *(void *)(v2 + 16) = a1;
  sub_243286F98(a2, v2 + 24);
  return v2;
}

uint64_t sub_2432913D8(uint64_t a1)
{
  uint64_t result = sub_2432916AC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v6[1] = 0;
    v6[2] = 0;
    v6[0] = 1;
    LOBYTE(v7) = 0x80;
    swift_retain();
    sub_2432AC588();
    sub_243286F34(v1 + 24, (uint64_t)v6);
    uint64_t v4 = v7;
    uint64_t v5 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, v4, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return result;
}

uint64_t sub_2432914A8(uint64_t a1)
{
  uint64_t result = sub_2432916AC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v6[1] = 0;
    v6[2] = 0;
    v6[0] = 1;
    LOBYTE(v7) = 0x80;
    swift_retain();
    sub_2432AC588();
    sub_243286F34(v1 + 24, (uint64_t)v6);
    uint64_t v4 = v7;
    uint64_t v5 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 64))(a1, v4, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return result;
}

uint64_t sub_243291578(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  uint64_t result = sub_2432916AC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2432868A0(v1, v2);
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_243291620(void *a1)
{
  uint64_t result = sub_2432916AC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v3 = a1;
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_2432916AC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432AC578();
  swift_release();
  swift_release();
  sub_243286BA8();
  uint64_t v0 = (void *)swift_allocError();
  unsigned char *v1 = 7;
  sub_243286F18(v6, v7, v8, v9);
  id v2 = v0;
  if (v9 >> 6 == 1)
  {
    char v3 = == infix(_:_:)();
    sub_243286884(v6, v7, v8, v9);
    sub_243286884((uint64_t)v0, 0, 0, 0x40u);

    char v4 = v3 ^ 1;
  }
  else
  {
    sub_243286884(v6, v7, v8, v9);
    sub_243286884((uint64_t)v0, 0, 0, 0x40u);

    char v4 = 1;
  }
  sub_243286884(v6, v7, v8, v9);
  return v4 & 1;
}

uint64_t ItemChangeObserverImpl.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ItemChangeObserverImpl.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider22ItemChangeObserverImpl__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_243291958(uint64_t a1)
{
  return sub_2432913D8(a1);
}

uint64_t sub_24329197C(uint64_t a1)
{
  return sub_2432914A8(a1);
}

uint64_t sub_2432919A0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  uint64_t result = sub_2432916AC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2432868A0(v1, v2);
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_243291A4C(void *a1)
{
  uint64_t result = sub_2432916AC();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v3 = a1;
    swift_retain();
    return sub_2432AC588();
  }
  return result;
}

uint64_t sub_243291ADC()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(void *)(v1 + 16);
}

uint64_t static Equatable<>.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = *(void (**)(char *))(v5 + 16);
  v11((char *)&v20 - v9);
  uint64_t v12 = sub_2432ACA18();
  if (v12)
  {
    char v13 = (void *)v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, a3);
  }
  else
  {
    char v13 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v14, v10, a3);
  }
  ((void (*)(char *, uint64_t, uint64_t))v11)(v8, a2, a3);
  uint64_t v15 = sub_2432ACA18();
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a3);
  }
  else
  {
    uint64_t v16 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v17, v8, a3);
  }
  char v18 = == infix(_:_:)();

  return v18 & 1;
}

BOOL _s15ContactProvider22ItemChangeObserverImplC5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  unsigned int v5 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v7 = *(void *)a2;
  unint64_t v6 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  unsigned int v9 = *(unsigned __int8 *)(a2 + 24);
  if (v5 >> 6)
  {
    if (v5 >> 6 == 1)
    {
      if ((v9 & 0xC0) == 0x40)
      {
        sub_243286F18(*(void *)a2, *(void *)(a2 + 8), v8, v9);
        sub_243286F18(v3, v2, v4, v5);
        char v10 = == infix(_:_:)();
        sub_243286884(v3, v2, v4, v5);
        sub_243286884(v7, v6, v8, v9);
        return v10 & 1;
      }
      goto LABEL_15;
    }
    if ((v4 | v2 | v3 || v5 != 128) && (v9 & 0xC0) == 0x80 && v9 == 128 && v7 == 1 && !(v8 | v6))
    {
      BOOL v12 = 1;
      sub_243286884(1, 0, 0, 0x80u);
      sub_243286884(1, 0, 0, 0x80u);
      return v12;
    }
LABEL_15:
    sub_243286F18(*(void *)a2, *(void *)(a2 + 8), v8, v9);
    sub_243286F18(v3, v2, v4, v5);
    sub_243286884(v3, v2, v4, v5);
    sub_243286884(v7, v6, v8, v9);
    return 0;
  }
  if (v9 >= 0x40 || ((v5 & 1) == 0) == (v9 & 1)) {
    goto LABEL_15;
  }
  v14[0] = *(void *)a1;
  v14[1] = v2;
  v14[2] = v4;
  v13[0] = v7;
  v13[1] = v6;
  v13[2] = v8;
  sub_243286F18(v7, v6, v8, v9);
  sub_243286F18(v3, v2, v4, v5);
  sub_243286F18(v7, v6, v8, v9);
  sub_243286F18(v3, v2, v4, v5);
  BOOL v12 = _s15ContactProvider0A14ItemSyncAnchorV2eeoiySbAC_ACtFZ_0(v14, v13);
  sub_243286884(v3, v2, v4, v5);
  sub_243286884(v7, v6, v8, v9);
  sub_243286884(v7, v6, v8, v9);
  sub_243286884(v3, v2, v4, v5);
  return v12;
}

uint64_t sub_243291FA4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return result;
}

uint64_t sub_243291FEC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_243292038()
{
  return type metadata accessor for ItemChangeObserverImpl();
}

uint64_t type metadata accessor for ItemChangeObserverImpl()
{
  uint64_t result = qword_268D911E8;
  if (!qword_268D911E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24329208C()
{
  sub_2432922A4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ItemChangeObserverImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ItemChangeObserverImpl);
}

uint64_t dispatch thunk of ItemChangeObserverImpl.suggestedBatchSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.suggestedBatchSize.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.suggestedBatchSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.__allocating_init(suggestedBatchSize:store:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didUpdate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didDelete(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didFinishEnumeratingChanges(upTo:moreComing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of ItemChangeObserverImpl.didFinishEnumeratingChangesWithError(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

void sub_2432922A4()
{
  if (!qword_268D911F8)
  {
    unint64_t v0 = sub_2432AC598();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D911F8);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ItemChangeObserverImpl.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ItemChangeObserverImpl.State(uint64_t a1)
{
}

uint64_t initializeWithCopy for ItemChangeObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_243286F18(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ItemChangeObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 24);
  sub_243286F18(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  unint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_243286884(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ItemChangeObserverImpl.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_243286884(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ItemChangeObserverImpl.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x1FE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 510);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 24) >> 6) | (4
                                              * ((*(void *)(a1 + 8) >> 60) & 3 | (4
                                                                                  * ((*(unsigned __int8 *)(a1 + 24) >> 1) & 0x1F))))) ^ 0x1FF;
  if (v3 >= 0x1FD) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ItemChangeObserverImpl.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 510;
    if (a3 >= 0x1FE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1FE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = ((-a2 >> 2) & 3) << 60;
      *(void *)(result + 16) = 0;
      *(unsigned char *)(result + 24) = ((((-a2 >> 2) & 0x7F) - (a2 << 7)) >> 1) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_24329253C(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 24);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24329255C(uint64_t result)
{
  *(unsigned char *)(result + 24) &= 0x3Fu;
  return result;
}

uint64_t sub_24329256C(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    char v2 = *(unsigned char *)(result + 24) & 1 | ((_BYTE)a2 << 6);
    *(void *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
    *(unsigned char *)(result + 24) = v2;
  }
  else
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    *(unsigned char *)(result + 24) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for ItemChangeObserverImpl.State()
{
  return &type metadata for ItemChangeObserverImpl.State;
}

uint64_t sub_2432925B8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_243292618()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_243292664(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2432926B8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24329270C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24329276C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2432927A4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2432927EC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_243292840(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2432928A0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2432928D8(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_243292920())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_243292974()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_2432929A8(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_2432929E8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_243292A3C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *(void *)a2 = v4;
  long long v5 = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a2 + 8) = v5;
  return sub_2432868A0(v4, v5);
}

uint64_t sub_243292A94(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  long long v5 = (void *)*a2;
  swift_beginAccess();
  uint64_t v6 = v5[7];
  unint64_t v7 = v5[8];
  v5[7] = v2;
  v5[8] = v3;
  v5[9] = v4;
  sub_2432868A0(v2, v3);
  return sub_243286740(v6, v7);
}

uint64_t sub_243292B0C@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 56);
  *(void *)a1 = v3;
  long long v4 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(a1 + 8) = v4;
  return sub_2432868A0(v3, v4);
}

uint64_t sub_243292B60(long long *a1)
{
  long long v6 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  swift_beginAccess();
  uint64_t v3 = v1[7];
  unint64_t v4 = v1[8];
  *(_OWORD *)(v1 + 7) = v6;
  v1[9] = v2;
  return sub_243286740(v3, v4);
}

uint64_t (*sub_243292BB8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_243292C0C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[10];
  unint64_t v5 = v3[11];
  uint64_t v6 = v3[12];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return sub_243286E34(v4, v5);
}

uint64_t sub_243292C60(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v5 = (void *)*a2;
  swift_beginAccess();
  uint64_t v6 = v5[10];
  unint64_t v7 = v5[11];
  v5[10] = v2;
  v5[11] = v3;
  v5[12] = v4;
  sub_243286E34(v2, v3);
  return sub_24328672C(v6, v7);
}

uint64_t sub_243292CEC@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[10];
  unint64_t v4 = v1[11];
  uint64_t v5 = v1[12];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return sub_243286E34(v3, v4);
}

uint64_t sub_243292D3C(long long *a1)
{
  long long v6 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  swift_beginAccess();
  uint64_t v3 = v1[10];
  unint64_t v4 = v1[11];
  *((_OWORD *)v1 + 5) = v6;
  v1[12] = v2;
  return sub_24328672C(v3, v4);
}

uint64_t (*sub_243292D98())()
{
  return j__swift_endAccess;
}

double LocalStore.__allocating_init(contacts:groups:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 88) = xmmword_2432AD3E0;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0xE000000000000000;
  *(unsigned char *)(v4 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(v4 + 56) = xmmword_2432AD8D0;
  *(void *)(v4 + 72) = 0;
  *(void *)(v4 + 80) = 0;
  return result;
}

uint64_t LocalStore.init(contacts:groups:)(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(v2 + 88) = xmmword_2432AD3E0;
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0xE000000000000000;
  *(unsigned char *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 56) = xmmword_2432AD8D0;
  *(void *)(v2 + 72) = 0;
  *(void *)(v2 + 80) = 0;
  return v2;
}

uint64_t sub_243292E88(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_2432AC5E8();
  objc_msgSend(a1, sel_setExternalIdentifier_, v4);

  swift_beginAccess();
  id v5 = a1;
  MEMORY[0x245677F90]();
  if (*(void *)((*(void *)(v2 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v2 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_2432AC698();
  sub_2432AC6A8();
  sub_2432AC688();
  return swift_endAccess();
}

uint64_t sub_243292F48(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = (unsigned char *)(swift_bridgeObjectRetain() + 56);
    do
    {
      if ((*v3 & 1) == 0)
      {
        uint64_t v4 = *((void *)v3 - 1);
        id v5 = (void *)*((void *)v3 - 3);
        v8[0] = *((void *)v3 - 2);
        v8[1] = v4;
        id v6 = v5;
        swift_bridgeObjectRetain_n();
        id v7 = v6;
        sub_243293038(v7, (uint64_t)v8, v1);
        swift_bridgeObjectRelease();

        sub_243289E40(v5);
      }
      v3 += 32;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_243293038(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(a1, sel_externalURI);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_2432AC5F8();
    uint64_t v9 = v8;

    swift_beginAccess();
    swift_bridgeObjectRetain();
    unint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = sub_243294FE4(v10, v7, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    if (v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_2432ADBA0;
      *(void *)(v12 + 32) = v11;
      sub_2432AC688();
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_2432ADBA0;
      *(void *)(v13 + 32) = a1;
      sub_2432AC688();
      swift_beginAccess();
      id v14 = v11;
      id v15 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91230);
      sub_2432940F4(&qword_268D91238, &qword_268D91230);
      sub_2432940F4(&qword_268D91240, &qword_268D91230);
      sub_243294138(&qword_268D91248, &qword_268D91250);
      sub_2432AC798();
      swift_endAccess();

LABEL_6:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t v16 = (void *)(a3 + 32);
  swift_beginAccess();
  id v17 = a1;
  unint64_t v18 = swift_bridgeObjectRetain();
  id v19 = (void *)sub_243295178(v18, v17);
  swift_bridgeObjectRelease();

  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_2432ADBA0;
    *(void *)(v20 + 32) = v19;
    sub_2432AC688();
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2432ADBA0;
    *(void *)(v21 + 32) = v17;
    sub_2432AC688();
    swift_beginAccess();
    id v22 = v17;
    id v23 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91230);
    sub_2432940F4(&qword_268D91238, &qword_268D91230);
    sub_2432940F4(&qword_268D91240, &qword_268D91230);
    sub_243294138(&qword_268D91248, &qword_268D91250);
    sub_2432AC798();
    swift_endAccess();

    goto LABEL_6;
  }
  uint64_t v25 = (void *)sub_2432AC5E8();
  objc_msgSend(v17, sel_setExternalIdentifier_, v25);

  swift_beginAccess();
  id v26 = v17;
  MEMORY[0x245677F90]();
  if (*(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2432AC698();
  }
  sub_2432AC6A8();
  sub_2432AC688();
  return swift_endAccess();
}

uint64_t sub_24329349C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_2432AC5E8();
  objc_msgSend(a1, sel_setExternalIdentifier_, v4);

  swift_beginAccess();
  id v5 = a1;
  MEMORY[0x245677F90]();
  if (*(void *)((*(void *)(v2 + 40) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v2 + 40) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_2432AC698();
  sub_2432AC6A8();
  sub_2432AC688();
  return swift_endAccess();
}

uint64_t sub_24329355C(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = (unsigned char *)(swift_bridgeObjectRetain() + 56);
    do
    {
      if (*v3 == 1)
      {
        uint64_t v4 = *((void *)v3 - 1);
        id v5 = (void *)*((void *)v3 - 3);
        v8[0] = *((void *)v3 - 2);
        v8[1] = v4;
        id v6 = v5;
        swift_bridgeObjectRetain_n();
        id v7 = v6;
        sub_243293650(v7, (uint64_t)v8, v1);
        swift_bridgeObjectRelease();

        sub_243289E40(v5);
      }
      v3 += 32;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_243293650(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(a1, sel_externalURI);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_2432AC5F8();
    uint64_t v9 = v8;

    swift_beginAccess();
    swift_bridgeObjectRetain();
    unint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = sub_243294FE4(v10, v7, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    if (v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_2432ADBA0;
      *(void *)(v12 + 32) = v11;
      sub_2432AC688();
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_2432ADBA0;
      *(void *)(v13 + 32) = a1;
      sub_2432AC688();
      swift_beginAccess();
      id v14 = v11;
      id v15 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91208);
      sub_2432940F4(&qword_268D91210, &qword_268D91208);
      sub_2432940F4(&qword_268D91218, &qword_268D91208);
      sub_243294138(&qword_268D91220, &qword_268D91228);
      sub_2432AC798();
      swift_endAccess();

LABEL_6:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t v16 = (void *)(a3 + 40);
  swift_beginAccess();
  id v17 = a1;
  unint64_t v18 = swift_bridgeObjectRetain();
  id v19 = (void *)sub_243295178(v18, v17);
  swift_bridgeObjectRelease();

  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_2432ADBA0;
    *(void *)(v20 + 32) = v19;
    sub_2432AC688();
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_2432ADBA0;
    *(void *)(v21 + 32) = v17;
    sub_2432AC688();
    swift_beginAccess();
    id v22 = v17;
    id v23 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91208);
    sub_2432940F4(&qword_268D91210, &qword_268D91208);
    sub_2432940F4(&qword_268D91218, &qword_268D91208);
    sub_243294138(&qword_268D91220, &qword_268D91228);
    sub_2432AC798();
    swift_endAccess();

    goto LABEL_6;
  }
  uint64_t v25 = (void *)sub_2432AC5E8();
  objc_msgSend(v17, sel_setExternalIdentifier_, v25);

  swift_beginAccess();
  id v26 = v17;
  MEMORY[0x245677F90]();
  if (*(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2432AC698();
  }
  sub_2432AC6A8();
  sub_2432AC688();
  return swift_endAccess();
}

void *sub_243293AB4(void *result)
{
  uint64_t v53 = result[2];
  if (!v53) {
    return result;
  }
  id v52 = result + 4;
  swift_bridgeObjectRetain();
  uint64_t v54 = (uint64_t *)(v1 + 32);
  swift_beginAccess();
  v51 = (uint64_t *)(v1 + 40);
  swift_beginAccess();
  uint64_t v2 = 0;
LABEL_5:
  uint64_t v4 = &v52[2 * v2];
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  uint64_t v7 = *v54;
  uint64_t v55 = v2;
  if (!((unint64_t)*v54 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    if (!v8) {
      goto LABEL_24;
    }
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_2432AC968();
  if (v8)
  {
LABEL_7:
    uint64_t v9 = 4;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        double result = (void *)MEMORY[0x2456781E0](v9 - 4, v7);
      }
      else {
        double result = *(id *)(v7 + 8 * v9);
      }
      unint64_t v10 = result;
      uint64_t v11 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
      {
        __break(1u);
        goto LABEL_56;
      }
      id v12 = objc_msgSend(result, sel_externalURI);
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = sub_2432AC5F8();
        uint64_t v16 = v15;

        if (v14 == v5 && v16 == v6)
        {
LABEL_44:
          swift_bridgeObjectRelease();
LABEL_45:
          uint64_t v3 = v55;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
          uint64_t v43 = swift_allocObject();
          *(_OWORD *)(v43 + 16) = xmmword_2432ADBA0;
          *(void *)(v43 + 32) = v10;
          sub_2432AC688();
          swift_beginAccess();
          id v44 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268D91230);
          sub_2432940F4(&qword_268D91238, &qword_268D91230);
          uint64_t v45 = sub_2432940F4(&qword_268D91240, &qword_268D91230);
          long long v46 = &qword_268D91248;
          long long v47 = &qword_268D91250;
LABEL_48:
          uint64_t v49 = v45;
          uint64_t v50 = sub_243294138(v46, v47);
          sub_2432AC798();
          swift_endAccess();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
LABEL_4:
          uint64_t v2 = v3 + 1;
          if (v2 == v53) {
            return (void *)swift_bridgeObjectRelease();
          }
          goto LABEL_5;
        }
        char v18 = sub_2432ACA28();
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_45;
        }
      }
      id v19 = objc_msgSend(v10, sel_identifier, v49, v50);
      uint64_t v20 = sub_2432AC5F8();
      uint64_t v22 = v21;

      if (v20 == v5 && v22 == v6) {
        goto LABEL_44;
      }
      char v24 = sub_2432ACA28();
      swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_45;
      }

      ++v9;
    }
    while (v11 != v8);
  }
LABEL_24:
  swift_bridgeObjectRelease_n();
  uint64_t v25 = *v51;
  if (!((unint64_t)*v51 >> 62))
  {
    uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v26) {
      goto LABEL_26;
    }
LABEL_3:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v3 = v55;
    goto LABEL_4;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v26 = sub_2432AC968();
  if (!v26) {
    goto LABEL_3;
  }
LABEL_26:
  uint64_t v27 = 4;
  while (1)
  {
    double result = (v25 & 0xC000000000000001) != 0
           ? (void *)MEMORY[0x2456781E0](v27 - 4, v25)
           : *(id *)(v25 + 8 * v27);
    uint64_t v28 = result;
    uint64_t v29 = v27 - 3;
    if (__OFADD__(v27 - 4, 1)) {
      break;
    }
    id v30 = objc_msgSend(result, sel_externalURI);
    if (v30)
    {
      unint64_t v31 = v30;
      uint64_t v32 = sub_2432AC5F8();
      uint64_t v34 = v33;

      if (v32 == v5 && v34 == v6)
      {
LABEL_46:
        swift_bridgeObjectRelease();
LABEL_47:
        uint64_t v3 = v55;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
        uint64_t v48 = swift_allocObject();
        *(_OWORD *)(v48 + 16) = xmmword_2432ADBA0;
        *(void *)(v48 + 32) = v28;
        sub_2432AC688();
        swift_beginAccess();
        id v44 = v28;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268D91208);
        sub_2432940F4(&qword_268D91210, &qword_268D91208);
        uint64_t v45 = sub_2432940F4(&qword_268D91218, &qword_268D91208);
        long long v46 = &qword_268D91220;
        long long v47 = &qword_268D91228;
        goto LABEL_48;
      }
      char v36 = sub_2432ACA28();
      swift_bridgeObjectRelease();
      if (v36) {
        goto LABEL_47;
      }
    }
    id v37 = objc_msgSend(v28, sel_identifier, v49, v50);
    uint64_t v38 = sub_2432AC5F8();
    uint64_t v40 = v39;

    if (v38 == v5 && v40 == v6) {
      goto LABEL_46;
    }
    char v42 = sub_2432ACA28();
    swift_bridgeObjectRelease();
    if (v42) {
      goto LABEL_47;
    }

    ++v27;
    if (v29 == v26) {
      goto LABEL_3;
    }
  }
LABEL_56:
  __break(1u);
  return result;
}

uint64_t sub_2432940F4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_243294138(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_243294188(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_243294188(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2432941C4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  swift_beginAccess();
  uint64_t v5 = v1[7];
  unint64_t v6 = v1[8];
  v1[7] = v2;
  v1[8] = v3;
  v1[9] = v4;
  sub_2432868A0(v2, v3);
  return sub_243286740(v5, v6);
}

uint64_t sub_243294240(uint64_t a1, unint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 80);
  unint64_t v6 = *(void *)(v2 + 88);
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  *(void *)(v2 + 96) = 0;
  sub_2432868A0(a1, a2);
  sub_24328672C(v5, v6);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v2 + 48) = 1;
  return result;
}

uint64_t sub_2432942E8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  swift_beginAccess();
  uint64_t v5 = v1[10];
  unint64_t v6 = v1[11];
  v1[10] = v2;
  v1[11] = v3;
  v1[12] = v4;
  sub_2432868A0(v2, v3);
  return sub_24328672C(v5, v6);
}

uint64_t sub_243294374()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 32) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v0 + 40) = v1;
  return swift_bridgeObjectRelease();
}

uint64_t LocalStore.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_243286740(*(void *)(v0 + 56), *(void *)(v0 + 64));
  sub_24328672C(*(void *)(v0 + 80), *(void *)(v0 + 88));
  return v0;
}

uint64_t LocalStore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_243286740(*(void *)(v0 + 56), *(void *)(v0 + 64));
  sub_24328672C(*(void *)(v0 + 80), *(void *)(v0 + 88));

  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t sub_243294480()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2432944D0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_243294528())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_243294580(void *a1)
{
  return sub_243292E88(a1);
}

uint64_t sub_2432945A4(uint64_t a1)
{
  return sub_243292F48(a1);
}

uint64_t sub_2432945C8(void *a1)
{
  return sub_24329349C(a1);
}

uint64_t sub_2432945EC(uint64_t a1)
{
  return sub_24329355C(a1);
}

void *sub_243294610(void *a1)
{
  return sub_243293AB4(a1);
}

uint64_t sub_243294634()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  return *(unsigned __int8 *)(v1 + 48);
}

uint64_t sub_243294674@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 56);
  *(void *)a1 = v4;
  long long v5 = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(a1 + 8) = v5;
  return sub_2432868A0(v4, v5);
}

uint64_t sub_2432946CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = (void *)*v1;
  swift_beginAccess();
  uint64_t v4 = v3[10];
  unint64_t v5 = v3[11];
  uint64_t v6 = v3[12];
  *a1 = v4;
  a1[1] = v5;
  a1[2] = v6;
  return sub_243286E34(v4, v5);
}

uint64_t sub_243294720(uint64_t *a1)
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  swift_beginAccess();
  uint64_t v6 = v2[7];
  unint64_t v7 = v2[8];
  v2[7] = v3;
  v2[8] = v4;
  v2[9] = v5;
  sub_2432868A0(v3, v4);
  return sub_243286740(v6, v7);
}

uint64_t sub_2432947A8(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *v2;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v5 + 80);
  unint64_t v7 = *(void *)(v5 + 88);
  *(void *)(v5 + 80) = a1;
  *(void *)(v5 + 88) = a2;
  *(void *)(v5 + 96) = 0;
  sub_2432868A0(a1, a2);
  sub_24328672C(v6, v7);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v5 + 48) = 1;
  return result;
}

uint64_t sub_243294854(uint64_t *a1)
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  swift_beginAccess();
  uint64_t v6 = v2[10];
  unint64_t v7 = v2[11];
  v2[10] = v3;
  v2[11] = v4;
  v2[12] = v5;
  sub_2432868A0(v3, v4);
  return sub_24328672C(v6, v7);
}

uint64_t sub_2432948E4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  *a2 = *(void *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_243294934@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_243294984@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2432949D4@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 48);
  return result;
}

uint64_t sub_243294A1C(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 48) = v2;
  return result;
}

uint64_t type metadata accessor for LocalStore()
{
  return self;
}

uint64_t method lookup function for LocalStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalStore);
}

uint64_t dispatch thunk of LocalStore.domainIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of LocalStore.domainIdentifier.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of LocalStore.domainIdentifier.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of LocalStore.contacts.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of LocalStore.contacts.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of LocalStore.contacts.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of LocalStore.groups.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of LocalStore.groups.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of LocalStore.groups.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of LocalStore.isContentEnumerated.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of LocalStore.isContentEnumerated.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of LocalStore.isContentEnumerated.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of LocalStore.page.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of LocalStore.page.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of LocalStore.page.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of LocalStore.syncAnchor.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of LocalStore.syncAnchor.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of LocalStore.syncAnchor.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of LocalStore.__allocating_init(contacts:groups:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of LocalStore.add(_:itemIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of LocalStore.update(contactItems:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of LocalStore.update(groupItems:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of LocalStore.remove(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingPage(upTo:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingContent(upTo:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingContentWithError(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingChanges(upTo:moreComing:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of LocalStore.finishEnumeratingChangesWithError(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of LocalStore.save(suppressNotifications:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of LocalStore.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of LocalStore.logState()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

void *sub_243294FE4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_2432AC968())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2456781E0](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v7, sel_externalURI);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_2432AC5F8();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = sub_2432ACA28();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
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

uint64_t sub_243295178(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2432AC968();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v5 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)MEMORY[0x2456781E0](i - 4, a1);
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * i);
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        uint64_t v20 = v6;
        id v8 = objc_msgSend(v6, sel_identifier);
        uint64_t v9 = sub_2432AC5F8();
        uint64_t v11 = v10;

        id v12 = objc_msgSend(a2, sel_identifier);
        uint64_t v13 = sub_2432AC5F8();
        uint64_t v15 = v14;

        if (v9 == v13 && v11 == v15)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          uint64_t v3 = (uint64_t)v20;
          swift_bridgeObjectRelease();
          return v3;
        }
        char v17 = sub_2432ACA28();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v17) {
          goto LABEL_17;
        }

        if (v7 == v3)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static ContactItem.Identifier.rootContainer.getter@<X0>(void *a1@<X8>)
{
  if (qword_268D90D10 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_268D91260;
  *a1 = qword_268D91258;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

void ContactItem.hash(into:)()
{
  uint64_t v1 = *v0;
  sub_2432ACB08();
  id v2 = v1;
  sub_2432AC808();
  sub_2432AC628();
}

uint64_t static ContactItem.Identifier.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2432ACA28();
  }
}

uint64_t ContactItem.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_2432ACAF8();
  sub_2432ACB08();
  id v2 = v1;
  sub_2432AC808();
  sub_2432AC628();

  return sub_2432ACB18();
}

void sub_2432954F4()
{
  uint64_t v1 = *v0;
  sub_2432ACB08();
  id v2 = v1;
  sub_2432AC808();
  sub_2432AC628();
}

uint64_t sub_24329557C()
{
  uint64_t v1 = *v0;
  sub_2432ACAF8();
  sub_2432ACB08();
  id v2 = v1;
  sub_2432AC808();
  sub_2432AC628();

  return sub_2432ACB18();
}

uint64_t ContactItem.Identifier.value.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ContactProvider::ContactItem::Identifier __swiftcall ContactItem.Identifier.init(_:)(ContactProvider::ContactItem::Identifier result)
{
  ContactProvider::ContactItem::Identifier *v1 = result;
  return result;
}

uint64_t ContactItem.Identifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2432AC628();

  return swift_bridgeObjectRelease();
}

uint64_t ContactItem.Identifier.hashValue.getter()
{
  return sub_2432ACB18();
}

uint64_t sub_2432956DC(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2432ACA28();
  }
}

uint64_t sub_24329570C()
{
  return sub_2432ACB18();
}

uint64_t sub_243295758()
{
  return sub_2432AC628();
}

uint64_t sub_243295760()
{
  return sub_2432ACB18();
}

void sub_2432957A8()
{
  qword_268D91258 = 0x746F6F722ELL;
  unk_268D91260 = 0xE500000000000000;
}

BOOL _s15ContactProvider0A4ItemO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  if ((*(unsigned char *)(a1 + 24) & 1) == 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 1) == 0)
    {
      sub_243295ED8();
      sub_243289E08(v5);
      sub_243289E08(v3);
      id v13 = v3;
      id v14 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v15 = sub_2432AC7F8();

      if (v15)
      {
        if (v2 == v6 && v4 == v7) {
          goto LABEL_13;
        }
        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_8:
    sub_243289E08(*(void **)a2);
    sub_243289E08(v3);
    sub_243289E40(v3);
    uint64_t v11 = v5;
LABEL_9:
    sub_243289E40(v11);
    return 0;
  }
  if ((*(unsigned char *)(a2 + 24) & 1) == 0) {
    goto LABEL_8;
  }
  sub_243295ED8();
  sub_243289E08(v5);
  sub_243289E08(v3);
  id v8 = v3;
  id v9 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v10 = sub_2432AC7F8();

  if ((v10 & 1) == 0)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_243289E40(v3);
    uint64_t v11 = v5;
    goto LABEL_9;
  }
  if (v2 == v6 && v4 == v7)
  {
LABEL_13:
    sub_243289E40(v3);
    sub_243289E40(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
LABEL_16:
  char v16 = sub_2432ACA28();
  sub_243289E40(v3);
  sub_243289E40(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v16 & 1) != 0;
}

unint64_t sub_243295B00()
{
  unint64_t result = qword_268D91268;
  if (!qword_268D91268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D91268);
  }
  return result;
}

unint64_t sub_243295B58()
{
  unint64_t result = qword_268D91270;
  if (!qword_268D91270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D91270);
  }
  return result;
}

uint64_t destroy for ContactItem(void **a1)
{
  return sub_243289E40(*a1);
}

uint64_t initializeWithCopy for ContactItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_243289E08(*(void **)a2);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ContactItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_243289E08(*(void **)a2);
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_243289E40(v7);
  return a1;
}

uint64_t assignWithTake for ContactItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)a1;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_243289E40(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactItem(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContactItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 255;
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

uint64_t sub_243295D70(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_243295D78(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactItem()
{
  return &type metadata for ContactItem;
}

void *initializeBufferWithCopyOfBuffer for ContactItem.Identifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ContactItem.Identifier()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ContactItem.Identifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ContactItem.Identifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactItem.Identifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ContactItem.Identifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ContactItem.Identifier()
{
  return &type metadata for ContactItem.Identifier;
}

unint64_t sub_243295ED8()
{
  unint64_t result = qword_268D91278;
  if (!qword_268D91278)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D91278);
  }
  return result;
}

uint64_t ContactItemSyncAnchor.init(generationMarker:offset:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t ContactItemSyncAnchor.generationMarker.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_2432868A0(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t ContactItemSyncAnchor.generationMarker.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_243286740(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ContactItemSyncAnchor.generationMarker.modify())()
{
  return nullsub_1;
}

uint64_t ContactItemSyncAnchor.offset.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ContactItemSyncAnchor.offset.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*ContactItemSyncAnchor.offset.modify())()
{
  return nullsub_1;
}

uint64_t sub_243295FE8(uint64_t a1)
{
  unint64_t v2 = sub_243296ABC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243296024(uint64_t a1)
{
  unint64_t v2 = sub_243296ABC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ContactItemSyncAnchor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91280);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  v11[0] = v1[2];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243296ABC();
  sub_2432ACB38();
  uint64_t v12 = v8;
  uint64_t v13 = v7;
  char v14 = 0;
  sub_2432903DC();
  uint64_t v9 = v11[1];
  sub_2432AC9F8();
  if (!v9)
  {
    LOBYTE(v12) = 1;
    sub_2432AC9E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ContactItemSyncAnchor.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91290);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_243296ABC();
  sub_2432ACB28();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v15 = 0;
  sub_243290430();
  sub_2432AC9D8();
  uint64_t v9 = v13;
  unint64_t v10 = v14;
  LOBYTE(v13) = 1;
  sub_2432868A0(v9, v14);
  uint64_t v11 = sub_2432AC9C8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_243286740(v9, v10);
}

uint64_t sub_2432963D4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ContactItemSyncAnchor.init(from:)(a1, a2);
}

uint64_t sub_2432963EC(void *a1)
{
  return ContactItemSyncAnchor.encode(to:)(a1);
}

uint64_t sub_243296404@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_2432868A0(a2, a3);
      unint64_t v10 = (char *)sub_2432AC448();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_2432AC468();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_2432AC458();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x243296668);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_243286740(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      char v17 = (char *)sub_2432AC448();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_2432AC468();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_2432AC458();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_243296678(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_2432868A0(a1, a2);
      char v5 = sub_2432968A8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_243286740(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_2432968A8(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_243286740(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_243296404((uint64_t)__s1, a3, a4, &v14);
      sub_243286740(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_2432968A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_2432AC448();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_2432AC468();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_2432AC458();
  sub_243296404(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

BOOL _s15ContactProvider0A14ItemSyncAnchorV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = *a2;
  unint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x243296A9CLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(v6 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(v5) - v5;
          if (__OFSUB__(HIDWORD(v5), v5)) {
            goto LABEL_19;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12 && (v8 < 1 || (sub_2432868A0(*a2, a2[1]), (sub_243296678(v2, v3, v5, v6) & 1) != 0))) {
            return v4 == v7;
          }
          else {
            return 0;
          }
        case 2uLL:
          uint64_t v14 = *(void *)(v5 + 16);
          uint64_t v13 = *(void *)(v5 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_20;
        case 3uLL:
          if (v8) {
            return 0;
          }
          return v4 == v7;
        default:
          uint64_t v12 = BYTE6(v6);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(v2 + 16);
      uint64_t v9 = *(void *)(v2 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(v3);
      goto LABEL_6;
  }
}

unint64_t sub_243296ABC()
{
  unint64_t result = qword_268D91288;
  if (!qword_268D91288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D91288);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactItemSyncAnchor()
{
  return &type metadata for ContactItemSyncAnchor;
}

unsigned char *storeEnumTagSinglePayload for ContactItemSyncAnchor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243296BECLL);
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

ValueMetadata *type metadata accessor for ContactItemSyncAnchor.CodingKeys()
{
  return &type metadata for ContactItemSyncAnchor.CodingKeys;
}

unint64_t sub_243296C28()
{
  unint64_t result = qword_268D91298;
  if (!qword_268D91298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D91298);
  }
  return result;
}

unint64_t sub_243296C80()
{
  unint64_t result = qword_268D912A0;
  if (!qword_268D912A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D912A0);
  }
  return result;
}

unint64_t sub_243296CD8()
{
  unint64_t result = qword_268D912A8;
  if (!qword_268D912A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D912A8);
  }
  return result;
}

uint64_t sub_243296D2C(char *a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_2432AC4F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(unsigned char *)(v4 + 48) = 0;
  uint64_t result = sub_2432AC518();
  int v34 = a3;
  uint64_t v33 = a2;
  if ((a3 & 1) == 0)
  {
    if (a1) {
      goto LABEL_11;
    }
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v13 = (unint64_t)a1 >> 32;
  if ((unint64_t)a1 >> 32)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a1 >> 11 == 27)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  LODWORD(v13) = a1 >> 16;
  if (a1 >> 16 > 0x10)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    int v27 = (a1 & 0x3F) << 8;
    unsigned int v28 = (v27 | (a1 >> 6)) + 33217;
    unsigned int v29 = (v27 | (a1 >> 6) & 0x3F) << 8;
    unsigned int v30 = (((v29 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    unsigned int v31 = (v29 | (a1 >> 12)) + 8487393;
    if (v13) {
      unsigned int v14 = v30;
    }
    else {
      unsigned int v14 = v31;
    }
    if (a1 < 0x800) {
      unsigned int v14 = v28;
    }
    goto LABEL_10;
  }
  if ((a1 & 0xFFFFFF80) != 0) {
    goto LABEL_18;
  }
  if (a1 > 0xFF)
  {
    __break(1u);
    goto LABEL_25;
  }
  unsigned int v14 = ((_BYTE)a1 + 1);
LABEL_10:
  uint64_t v36 = (v14 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v14) >> 3)) & 7)));
LABEL_11:
  uint64_t v36 = sub_2432AC618();
  unint64_t v37 = v15;
  swift_bridgeObjectRetain();
  sub_2432AC638();
  swift_bridgeObjectRelease();
  uint64_t v16 = v36;
  unint64_t v17 = v37;
  sub_2432AC4E8();
  sub_2432AC4D8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v36 = v16;
  unint64_t v37 = v17;
  swift_bridgeObjectRetain();
  sub_2432AC638();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v36;
  unint64_t v18 = v37;
  *(void *)(v4 + 16) = v36;
  *(void *)(v4 + 24) = v18;
  swift_bridgeObjectRetain_n();
  int64_t v20 = sub_2432AC508();
  os_log_type_t v21 = sub_2432AC7B8();
  if (os_log_type_enabled(v20, v21))
  {
    size_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v36 = v23;
    *(_DWORD *)size_t v22 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_2432A59F8(v19, v18, &v36);
    sub_2432AC828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_243282000, v20, v21, "Opening transaction - %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v23, -1, -1);
    MEMORY[0x245678AE0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  char v24 = v34;
  uint64_t v25 = v33;
  sub_2432AC608();
  swift_bridgeObjectRelease();
  uint64_t v26 = os_transaction_create();
  swift_release();
  *(void *)(v4 + 32) = v26;
  swift_unknownObjectRelease();
  type metadata accessor for OSActivity();
  swift_allocObject();
  *(void *)(v4 + 40) = sub_2432978A4(a1, v25, v24);
  swift_release();
  return v4;
}

void sub_243297180()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 40);
  swift_retain_n();
  oslog = sub_2432AC508();
  if (v2)
  {
    os_log_type_t v3 = sub_2432AC7B8();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      v15[0] = v5;
      *(_DWORD *)uint64_t v4 = 136446210;
      uint64_t v6 = *(void *)(v1 + 16);
      unint64_t v7 = *(void *)(v1 + 24);
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_2432A59F8(v6, v7, v15);
      sub_2432AC828();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243282000, oslog, v3, "Closing transaction - %{public}s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v5, -1, -1);
      MEMORY[0x245678AE0](v4, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    uint64_t v13 = *(void *)(v1 + 40);
    if (v13)
    {
      swift_beginAccess();
      swift_retain();
      os_activity_scope_leave((os_activity_scope_state_t)(v13 + 24));
      swift_endAccess();
      swift_release();
    }
    *(void *)(v1 + 40) = 0;
    swift_release();
    *(void *)(v1 + 32) = 0;
    swift_unknownObjectRelease();
    *(unsigned char *)(v1 + 48) = 1;
  }
  else
  {
    uint64_t v8 = sub_2432AC7A8();
    if (os_log_type_enabled(oslog, (os_log_type_t)v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v15[0] = v10;
      *(_DWORD *)uint64_t v9 = 136446210;
      uint64_t v11 = *(void *)(v1 + 16);
      unint64_t v12 = *(void *)(v1 + 24);
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_2432A59F8(v11, v12, v15);
      sub_2432AC828();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243282000, oslog, (os_log_type_t)v8, "Transaction already closed - %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v10, -1, -1);
      MEMORY[0x245678AE0](v9, -1, -1);
    }
    else
    {
      swift_release_n();
    }
  }
}

uint64_t sub_2432974A8()
{
  uint64_t v1 = v0;
  if ((*(unsigned char *)(v0 + 48) & 1) == 0)
  {
    if (*(void *)(v0 + 40))
    {
      swift_retain();
      uint64_t v2 = sub_2432AC508();
      os_log_type_t v3 = sub_2432AC7A8();
      if (os_log_type_enabled(v2, v3))
      {
        uint64_t v4 = (uint8_t *)swift_slowAlloc();
        uint64_t v5 = swift_slowAlloc();
        uint64_t v11 = v5;
        *(_DWORD *)uint64_t v4 = 136446210;
        uint64_t v6 = *(void *)(v1 + 16);
        unint64_t v7 = *(void *)(v1 + 24);
        swift_bridgeObjectRetain();
        sub_2432A59F8(v6, v7, &v11);
        sub_2432AC828();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_243282000, v2, v3, "Transaction left open - %{public}s. Call complete() on this transaction!", v4, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245678AE0](v5, -1, -1);
        MEMORY[0x245678AE0](v4, -1, -1);
      }
      else
      {

        swift_release();
      }
    }
    sub_243297180();
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v8 = v1 + OBJC_IVAR____TtC15ContactProvider13OSTransaction_logger;
  uint64_t v9 = sub_2432AC528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return v1;
}

uint64_t sub_24329768C()
{
  sub_2432974A8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2432976E4()
{
  return type metadata accessor for OSTransaction();
}

uint64_t type metadata accessor for OSTransaction()
{
  uint64_t result = qword_268D912B8;
  if (!qword_268D912B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_243297738()
{
  uint64_t result = sub_2432AC528();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2432977E8()
{
  return 0x61736E617254534FLL;
}

uint64_t sub_243297880()
{
  return sub_2432977E8();
}

uint64_t sub_2432978A4(char *a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 32) = 0;
  if (a3)
  {
    if ((unint64_t)a1 >> 32)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    unsigned int v8 = a1 >> 11;
    if (a1 >> 11 == 27)
    {
      __break(1u);
    }
    else
    {
      unsigned int v8 = a1 >> 16;
      if (a1 >> 16 > 0x10)
      {
        __break(1u);
      }
      else if ((a1 & 0xFFFFFF80) == 0)
      {
        if (a1 > 0xFF)
        {
          __break(1u);
          goto LABEL_21;
        }
        unsigned int v9 = ((_BYTE)a1 + 1);
LABEL_11:
        *(void *)description = (v9 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v9) & 0x38)) & 0x38));
        if (qword_268D90D18 == -1)
        {
LABEL_12:
          uint64_t v6 = qword_268D912D0;
          unint64_t v7 = description;
          goto LABEL_13;
        }
LABEL_21:
        swift_once();
        goto LABEL_12;
      }
      int v3 = (a1 & 0x3F) << 8;
      if (a1 < 0x800)
      {
        unsigned int v9 = (v3 | (a1 >> 6)) + 33217;
        goto LABEL_11;
      }
    }
    unsigned int v12 = (v3 | (a1 >> 6) & 0x3F) << 8;
    unsigned int v13 = (((v12 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    unsigned int v14 = (v12 | (a1 >> 12)) + 8487393;
    if (v8) {
      unsigned int v9 = v13;
    }
    else {
      unsigned int v9 = v14;
    }
    goto LABEL_11;
  }
  if (!a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (qword_268D90D18 != -1) {
LABEL_16:
  }
    swift_once();
  uint64_t v6 = qword_268D912D0;
  unint64_t v7 = a1;
LABEL_13:
  *(void *)(v4 + 16) = _os_activity_create(&dword_243282000, v7, v6, OS_ACTIVITY_FLAG_DEFAULT);
  swift_beginAccess();
  uint64_t v10 = swift_unknownObjectRetain();
  os_activity_scope_enter(v10, (os_activity_scope_state_t)(v4 + 24));
  swift_endAccess();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_243297A9C()
{
  qword_268D912D0 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");

  return swift_unknownObjectRetain();
}

uint64_t sub_243297AD8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for OSActivity()
{
  return self;
}

void *static SyncManager.shouldInvalidateForError(_:)(void *result)
{
  if (result)
  {
    unint64_t v1 = result;
    sub_243286BA8();
    uint64_t v2 = (void *)swift_allocError();
    *int v3 = 7;
    id v4 = v1;
    char v5 = == infix(_:_:)();

    return (void *)(v5 & 1);
  }
  return result;
}

uint64_t static SyncManager.invalidateEnumerator(_:)(uint64_t a1)
{
  char v5 = (uint64_t (*)(uint64_t))((char *)&dword_268D912F0 + dword_268D912F0);
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_243284460;
  return v5(a1);
}

uint64_t sub_243297C60()
{
  uint64_t v0 = sub_2432AC528();
  __swift_allocate_value_buffer(v0, qword_268D92920);
  __swift_project_value_buffer(v0, (uint64_t)qword_268D92920);
  return sub_2432AC518();
}

uint64_t static SyncManager.enumerationTimeoutLimit.getter()
{
  return qword_268D912D8;
}

uint64_t static SyncManager.enumerationTimeoutLimit.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268D912D8 = a1;
  return result;
}

uint64_t (*static SyncManager.enumerationTimeoutLimit.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t static SyncManager.invalidateTimeoutLimit.getter()
{
  return qword_268D912E0;
}

uint64_t static SyncManager.invalidateTimeoutLimit.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  qword_268D912E0 = a1;
  return result;
}

uint64_t (*static SyncManager.invalidateTimeoutLimit.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_243297EA8()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t sub_243297EDC(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 56) = a1;
  return result;
}

uint64_t SyncManager.__allocating_init(store:)(uint64_t a1)
{
  sub_243286F34(a1, (uint64_t)v5);
  type metadata accessor for ExtensionState();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_WORD *)(v2 + 112) = 0;
  __swift_destroy_boxed_opaque_existential_1(a1);
  type metadata accessor for SyncManager();
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 56) = 0;
  sub_243286F98(v5, v3 + 16);
  *(void *)(v3 + 64) = v2;
  return v3;
}

uint64_t SyncManager.__allocating_init(store:extensionState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  uint64_t v8 = sub_24329A168(v7, a2, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v8;
}

uint64_t SyncManager.init(store:extensionState:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  MEMORY[0x270FA5388](v7);
  unsigned int v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  uint64_t v11 = sub_243299BCC((uint64_t)v9, a2, v2, v5, v6);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v11;
}

uint64_t sub_2432980F8(void *a1, uint64_t a2)
{
  v3[39] = a2;
  unsigned char v3[40] = v2;
  uint64_t v4 = a1[1];
  v3[41] = *a1;
  v3[42] = v4;
  return MEMORY[0x270FA2498](sub_243298120, 0, 0);
}

uint64_t sub_243298120()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 320) + 64);
  *(void *)(v0 + 344) = v1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_243298198, v1, 0);
}

uint64_t sub_243298198()
{
  *(unsigned char *)(v0 + 448) = *(unsigned char *)(*(void *)(v0 + 344) + 112);
  swift_release();
  return MEMORY[0x270FA2498](sub_243298208, 0, 0);
}

uint64_t sub_243298208()
{
  uint64_t v39 = v0;
  if (*(unsigned char *)(v0 + 448))
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2432AC528();
    __swift_project_value_buffer(v1, (uint64_t)qword_268D92920);
    uint64_t v2 = sub_2432AC508();
    os_log_type_t v3 = sub_2432AC7B8();
    if (!os_log_type_enabled(v2, v3))
    {
      char v5 = 8;
      goto LABEL_14;
    }
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_243282000, v2, v3, "ItemContentSession not starting, extension was invalidated", v4, 2u);
    char v5 = 8;
LABEL_12:
    MEMORY[0x245678AE0](v4, -1, -1);
LABEL_14:

    sub_243286BA8();
    swift_allocError();
    *unint64_t v17 = v5;
    swift_willThrow();
    unint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
  uint64_t v6 = *(void **)(v0 + 320);
  uint64_t v7 = v6[5];
  uint64_t v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 136))(v7, v8);
  uint64_t v9 = v6[5];
  uint64_t v10 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v9);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 72))(v9, v10))
  {
    uint64_t v11 = *(void **)(v0 + 320);
    uint64_t v12 = v11[5];
    uint64_t v13 = v11[6];
    __swift_project_boxed_opaque_existential_1(v11 + 2, v12);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 88))(&v37, v12, v13);
    *(void *)(v0 + 392) = v37;
    unint64_t v14 = v38;
    *(_OWORD *)(v0 + 400) = v38;
    if (v14 >> 60 == 15)
    {
      if (qword_268D90D20 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_2432AC528();
      __swift_project_value_buffer(v15, (uint64_t)qword_268D92920);
      uint64_t v2 = sub_2432AC508();
      os_log_type_t v16 = sub_2432AC7A8();
      char v5 = 2;
      if (!os_log_type_enabled(v2, v16)) {
        goto LABEL_14;
      }
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_243282000, v2, v16, "ItemChangeSession not starting, have no sync anchor, throwing cannot enumerate", v4, 2u);
      goto LABEL_12;
    }
    uint64_t v35 = *(void *)(*(void *)(v0 + 320) + 64);
    *(void *)(v0 + 416) = v35;
    swift_retain();
    return MEMORY[0x270FA2498](sub_243298CB4, v35, 0);
  }
  else
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v36 = v6 + 2;
    uint64_t v20 = sub_2432AC528();
    *(void *)(v0 + 352) = __swift_project_value_buffer(v20, (uint64_t)qword_268D92920);
    os_log_type_t v21 = sub_2432AC508();
    os_log_type_t v22 = sub_2432AC7B8();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_243282000, v21, v22, "ItemContentSession starting", v23, 2u);
      MEMORY[0x245678AE0](v23, -1, -1);
    }
    uint64_t v24 = *(void *)(v0 + 328);
    uint64_t v25 = *(void *)(v0 + 336);
    uint64_t v27 = *(void *)(v0 + 312);
    uint64_t v26 = *(void *)(v0 + 320);

    uint64_t v37 = v24;
    *(void *)&long long v38 = v25;
    sub_243286F34(v27, v0 + 16);
    sub_243286F34((uint64_t)v36, v0 + 56);
    swift_beginAccess();
    char v28 = *(unsigned char *)(v26 + 56);
    uint64_t v29 = *(void *)(v26 + 64);
    type metadata accessor for ItemContentSession();
    swift_allocObject();
    swift_retain();
    swift_bridgeObjectRetain();
    *(void *)(v0 + 360) = sub_243286FB4((uint64_t)&v37, (void *)(v0 + 16), v0 + 56, v28, v29);
    uint64_t v30 = v6[5];
    uint64_t v31 = v6[6];
    __swift_project_boxed_opaque_existential_1(v36, v30);
    (*(void (**)(uint64_t, uint64_t))(v31 + 80))(v30, v31);
    uint64_t v32 = *(void *)(v0 + 200);
    *(void *)(v0 + 176) = v32;
    *(void *)(v0 + 368) = v32;
    long long v33 = *(_OWORD *)(v0 + 208);
    *(void *)(v0 + 376) = v33;
    *(_OWORD *)(v0 + 184) = v33;
    int v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v34;
    *int v34 = v0;
    v34[1] = sub_24329876C;
    return sub_2432870F8(v0 + 176);
  }
}

uint64_t sub_24329876C()
{
  unint64_t v1 = *(void *)(*(void *)v0 + 376);
  uint64_t v2 = *(void *)(*(void *)v0 + 368);
  swift_task_dealloc();
  sub_243286740(v2, v1);
  return MEMORY[0x270FA2498](sub_24329889C, 0, 0);
}

uint64_t sub_24329889C()
{
  uint64_t v31 = v0;
  unint64_t v1 = *(void **)(*(void *)(v0 + 360) + 152);
  if (v1)
  {
    id v2 = v1;
    id v3 = v1;
    id v4 = v1;
    char v5 = sub_2432AC508();
    os_log_type_t v6 = sub_2432AC7B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138412290;
      id v9 = v1;
      uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 304) = v10;
      sub_2432AC828();
      *uint64_t v8 = v10;

      _os_log_impl(&dword_243282000, v5, v6, "ItemContentSession ended, throwing error %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v8, -1, -1);
      MEMORY[0x245678AE0](v7, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
    swift_release();
LABEL_14:
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  uint64_t v11 = *(void **)(v0 + 320);
  uint64_t v12 = v11[5];
  uint64_t v13 = v11[6];
  __swift_project_boxed_opaque_existential_1(v11 + 2, v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 136))(v12, v13);
  unint64_t v14 = sub_2432AC508();
  os_log_type_t v15 = sub_2432AC7B8();
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v16 = 0;
    _os_log_impl(&dword_243282000, v14, v15, "ItemContentSession ended", v16, 2u);
    MEMORY[0x245678AE0](v16, -1, -1);
  }
  swift_release();

  unint64_t v17 = *(void **)(v0 + 320);
  uint64_t v18 = v17[5];
  uint64_t v19 = v17[6];
  __swift_project_boxed_opaque_existential_1(v17 + 2, v18);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v19 + 88))(&v29, v18, v19);
  *(void *)(v0 + 392) = v29;
  unint64_t v20 = v30;
  *(_OWORD *)(v0 + 400) = v30;
  if (v20 >> 60 == 15)
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2432AC528();
    __swift_project_value_buffer(v21, (uint64_t)qword_268D92920);
    os_log_type_t v22 = sub_2432AC508();
    os_log_type_t v23 = sub_2432AC7A8();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_243282000, v22, v23, "ItemChangeSession not starting, have no sync anchor, throwing cannot enumerate", v24, 2u);
      MEMORY[0x245678AE0](v24, -1, -1);
    }

    sub_243286BA8();
    swift_allocError();
    *uint64_t v25 = 2;
    swift_willThrow();
    goto LABEL_14;
  }
  uint64_t v28 = *(void *)(*(void *)(v0 + 320) + 64);
  *(void *)(v0 + 416) = v28;
  swift_retain();
  return MEMORY[0x270FA2498](sub_243298CB4, v28, 0);
}

uint64_t sub_243298CB4()
{
  *(unsigned char *)(v0 + 449) = *(unsigned char *)(*(void *)(v0 + 416) + 112);
  swift_release();
  return MEMORY[0x270FA2498](sub_243298D24, 0, 0);
}

uint64_t sub_243298D24()
{
  uint64_t v24 = v0;
  if (*(unsigned char *)(v0 + 449))
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_2432AC528();
    __swift_project_value_buffer(v1, (uint64_t)qword_268D92920);
    uint64_t v2 = sub_2432AC508();
    os_log_type_t v3 = sub_2432AC7B8();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_243282000, v2, v3, "ItemChangeSession not starting, extension was invalidated", v4, 2u);
      MEMORY[0x245678AE0](v4, -1, -1);
    }
    unint64_t v5 = *(void *)(v0 + 400);
    uint64_t v6 = *(void *)(v0 + 392);

    sub_243286BA8();
    swift_allocError();
    *uint64_t v7 = 8;
    swift_willThrow();
    sub_24328672C(v6, v5);
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  else
  {
    if (qword_268D90D20 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2432AC528();
    *(void *)(v0 + 424) = __swift_project_value_buffer(v10, (uint64_t)qword_268D92920);
    uint64_t v11 = sub_2432AC508();
    os_log_type_t v12 = sub_2432AC7B8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_243282000, v11, v12, "ItemChangeSession starting", v13, 2u);
      MEMORY[0x245678AE0](v13, -1, -1);
    }
    uint64_t v14 = *(void *)(v0 + 408);
    long long v22 = *(_OWORD *)(v0 + 392);
    uint64_t v16 = *(void *)(v0 + 328);
    uint64_t v15 = *(void *)(v0 + 336);
    uint64_t v18 = *(void *)(v0 + 312);
    uint64_t v17 = *(void *)(v0 + 320);

    v23[0] = v16;
    v23[1] = v15;
    sub_243286F34(v18, v0 + 136);
    sub_243286F34(v17 + 16, v0 + 96);
    swift_beginAccess();
    char v19 = *(unsigned char *)(v17 + 56);
    uint64_t v20 = *(void *)(v17 + 64);
    type metadata accessor for ItemChangeSession();
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_retain();
    *(void *)(v0 + 432) = sub_2432847A4(v23, (void *)(v0 + 136), (long long *)(v0 + 96), v19, v20);
    *(_OWORD *)(v0 + 272) = v22;
    *(void *)(v0 + 288) = v14;
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 440) = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_243299084;
    return sub_24328489C(v0 + 272);
  }
}

uint64_t sub_243299084()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_243299180, 0, 0);
}

uint64_t sub_243299180()
{
  uint64_t v1 = *(void **)(v0[54] + 152);
  if (v1)
  {
    id v2 = v1;
    id v3 = v1;
    id v4 = v1;
    unint64_t v5 = sub_2432AC508();
    os_log_type_t v6 = sub_2432AC7B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138543362;
      id v9 = v1;
      uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
      v0[37] = v10;
      sub_2432AC828();
      *uint64_t v8 = v10;

      _os_log_impl(&dword_243282000, v5, v6, "ItemChangeSession ended, throwing error %{public}@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v8, -1, -1);
      MEMORY[0x245678AE0](v7, -1, -1);
    }
    else
    {
    }
    unint64_t v20 = v0[50];
    uint64_t v21 = v0[49];

    swift_willThrow();
    swift_release();
    sub_24328672C(v21, v20);
    char v19 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v11 = (void *)v0[40];
    uint64_t v12 = v11[5];
    uint64_t v13 = v11[6];
    __swift_project_boxed_opaque_existential_1(v11 + 2, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 136))(v12, v13);
    uint64_t v14 = sub_2432AC508();
    os_log_type_t v15 = sub_2432AC7B8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_243282000, v14, v15, "ItemChangeSession ended", v16, 2u);
      MEMORY[0x245678AE0](v16, -1, -1);
    }
    unint64_t v17 = v0[50];
    uint64_t v18 = v0[49];
    swift_release();
    sub_24328672C(v18, v17);

    char v19 = (uint64_t (*)(void))v0[1];
  }
  return v19();
}

uint64_t sub_243299438(void *a1, uint64_t a2)
{
  uint64_t v5 = a1[1];
  v3[2] = *a1;
  v3[3] = v5;
  os_log_type_t v6 = (void *)swift_task_alloc();
  v3[4] = v6;
  *os_log_type_t v6 = v3;
  v6[1] = sub_2432994F4;
  v6[39] = a2;
  v6[40] = v2;
  uint64_t v7 = v3[3];
  v6[41] = v3[2];
  v6[42] = v7;
  return MEMORY[0x270FA2498](sub_243298120, 0, 0);
}

uint64_t sub_2432994F4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243299628, 0, 0);
  }
  else
  {
    id v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243299628()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243299640(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  return MEMORY[0x270FA2498](sub_243299660, 0, 0);
}

uint64_t sub_243299660()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  os_log_type_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 24) + **(int **)(v3 + 24));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *id v4 = v0;
  v4[1] = sub_243299760;
  return v6(v2, v3);
}

uint64_t sub_243299760()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t SyncManager.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t SyncManager.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();

  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t sub_2432998C0(void *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = a1[1];
  v3[2] = *a1;
  v3[3] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[4] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_243299980;
  v7[39] = a2;
  v7[40] = v5;
  uint64_t v8 = v3[3];
  v7[41] = v3[2];
  v7[42] = v8;
  return MEMORY[0x270FA2498](sub_243298120, 0, 0);
}

uint64_t sub_243299980()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24329A870, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243299AB4(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_243299AEC(uint64_t (*a1)(void))
{
  return a1();
}

void sub_243299B14(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2432AC828();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_243299BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(a3 + 40) = a4;
  *(void *)(a3 + 48) = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(a3 + 16));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a1, a4);
  *(unsigned char *)(a3 + 56) = 0;
  *(void *)(a3 + 64) = a2;
  return a3;
}

uint64_t sub_243299C48(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  return MEMORY[0x270FA2498](sub_243299C68, 0, 0);
}

uint64_t sub_243299C68()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_beginAccess();
  sub_243286F34(v1, v0 + 16);
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 96) = v2;
  sub_243286F98((long long *)(v0 + 16), v2 + 16);
  uint64_t v5 = (uint64_t (*)(void))((char *)&dword_268D91400 + dword_268D91400);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_243299DB8;
  return v5();
}

uint64_t sub_243299DB8()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_243299EE8;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_243299ED4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243299ED4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243299EE8()
{
  swift_release();
  if (qword_268D90D20 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = sub_2432AC528();
  __swift_project_value_buffer(v2, (uint64_t)qword_268D92920);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2432AC508();
  os_log_type_t v6 = sub_2432AC7B8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[14];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138543362;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v12;
    sub_2432AC828();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_243282000, v5, v6, "ContactItemEnumerator.invalidate() error %{public}@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v10, -1, -1);
    MEMORY[0x245678AE0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t type metadata accessor for SyncManager()
{
  return self;
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

uint64_t sub_24329A168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SyncManager();
  uint64_t v12 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, a4);
  *(void *)(v12 + 40) = a4;
  *(void *)(v12 + 48) = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v12 + 16));
  (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 32))(boxed_opaque_existential_1, v11, a4);
  *(unsigned char *)(v12 + 56) = 0;
  *(void *)(v12 + 64) = a2;
  return v12;
}

uint64_t sub_24329A280@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 56);
  return result;
}

uint64_t sub_24329A2C8(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 56) = v2;
  return result;
}

uint64_t dispatch thunk of SyncManagerProtocol.signalEnumerator(for:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_243286FB0;
  return v11(a1, a2, a3, a4);
}

uint64_t method lookup function for SyncManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SyncManager);
}

uint64_t dispatch thunk of SyncManager.verbose.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of SyncManager.verbose.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of SyncManager.verbose.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of SyncManager.__allocating_init(store:extensionState:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of SyncManager.sync(for:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 160) + **(int **)(*(void *)v2 + 160));
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *os_log_type_t v6 = v3;
  v6[1] = sub_243286FB0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of SyncManager.signalEnumerator(for:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 168) + **(int **)(*(void *)v2 + 168));
  os_log_type_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *os_log_type_t v6 = v3;
  v6[1] = sub_243284460;
  return v8(a1, a2);
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

uint64_t sub_24329A790()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24329A7C8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_243286FB0;
  v2[2] = v0 + 16;
  return MEMORY[0x270FA2498](sub_243299660, 0, 0);
}

uint64_t ContactProviderError.hash(into:)()
{
  return sub_2432ACB08();
}

uint64_t ContactProviderError.hashValue.getter()
{
  return sub_2432ACB18();
}

uint64_t sub_24329A8EC(char *a1, char *a2)
{
  return sub_2432A8530(*a1, *a2);
}

uint64_t sub_24329A8F8(uint64_t a1)
{
  unint64_t v2 = sub_24329B0E8();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_24329A934(uint64_t a1)
{
  unint64_t v2 = sub_24329B0E8();

  return MEMORY[0x270EF2668](a1, v2);
}

unint64_t ContactProviderError.errorDescription.getter()
{
  unint64_t result = 0xD000000000000034;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000020;
      break;
    case 2:
      unint64_t result = 0xD000000000000025;
      break;
    case 3:
      unint64_t result = 0xD000000000000028;
      break;
    case 4:
      unint64_t result = 0xD000000000000031;
      break;
    case 5:
      unint64_t result = 0xD00000000000003CLL;
      break;
    case 6:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000024;
      break;
    case 8:
      unint64_t result = 0xD00000000000004ELL;
      break;
    case 9:
      unint64_t result = 0xD000000000000023;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000027;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t ContactProviderError.failureReason.getter()
{
  int v1 = *v0;
  unint64_t v2 = 0xD000000000000064;
  unint64_t v3 = 0xD000000000000066;
  if (v1 != 7) {
    unint64_t v3 = 0;
  }
  if (v1 != 9) {
    unint64_t v2 = v3;
  }
  if (v1 == 10) {
    return 0xD000000000000067;
  }
  else {
    return v2;
  }
}

unint64_t ContactProviderError.errorUserInfo.getter()
{
  unint64_t v0 = ContactProviderError.errorDescription.getter();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91338);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2432AD5C0;
  *(void *)(inited + 32) = sub_2432AC5F8();
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v0;
  *(void *)(inited + 56) = v2;
  return sub_24328D628(inited);
}

uint64_t ContactProviderError.errorCode.getter()
{
  return *v0 + 1000;
}

uint64_t sub_24329ABC4()
{
  return *v0 + 1000;
}

void *_s15ContactProvider0aB5ErrorO12remapNSErrorys0C0_psAE_pFZ_0(void *a1)
{
  uint64_t v2 = (void *)sub_2432AC498();
  id v3 = objc_msgSend(v2, sel_domain);
  uint64_t v4 = sub_2432AC5F8();
  uint64_t v6 = v5;

  sub_24329B0E8();
  if (v4 == sub_2432AC438() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v9 = sub_2432ACA28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
LABEL_6:
      id v10 = a1;
      goto LABEL_7;
    }
  }
  switch((unint64_t)objc_msgSend(v2, sel_code))
  {
    case 0x3E8uLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      *uint64_t v12 = 0;
      break;
    case 0x3E9uLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      *uint64_t v13 = 1;
      break;
    case 0x3EAuLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      unsigned char *v14 = 2;
      break;
    case 0x3EBuLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      *uint64_t v15 = 3;
      break;
    case 0x3ECuLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      *uint64_t v16 = 4;
      break;
    case 0x3EDuLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      *unint64_t v17 = 5;
      break;
    case 0x3EEuLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      unsigned char *v18 = 6;
      break;
    case 0x3EFuLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      unsigned char *v19 = 7;
      break;
    case 0x3F0uLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      unsigned char *v20 = 8;
      break;
    case 0x3F1uLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      *uint64_t v21 = 9;
      break;
    case 0x3F2uLL:
      sub_243286BA8();
      a1 = (void *)swift_allocError();
      *long long v22 = 10;
      break;
    default:
      goto LABEL_6;
  }
LABEL_7:

  return a1;
}

unint64_t sub_24329AEF4()
{
  unint64_t result = qword_268D91340;
  if (!qword_268D91340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D91340);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContactProviderError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContactProviderError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x24329B0A8);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

unsigned char *sub_24329B0D0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContactProviderError()
{
  return &type metadata for ContactProviderError;
}

unint64_t sub_24329B0E8()
{
  unint64_t result = qword_268D91348[0];
  if (!qword_268D91348[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268D91348);
  }
  return result;
}

uint64_t sub_24329B140()
{
  uint64_t result = sub_2432AC528();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_initClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_24329B21C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  void v5[3] = a2;
  v5[4] = a3;
  long long v5[2] = a1;
  uint64_t v6 = sub_2432AC918();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  uint64_t v7 = sub_2432AC938();
  v5[11] = v7;
  v5[12] = *(void *)(v7 - 8);
  v5[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24329B350, 0, 0);
}

uint64_t sub_24329B350()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v6 = *(void *)(v0 + 32);
  long long v16 = *(_OWORD *)(v0 + 40);
  sub_2432AC928();
  sub_2432AC8F8();
  MEMORY[0x245678240](v7, v6);
  int v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  *(void *)(v0 + 112) = v8;
  *(void *)(v0 + 120) = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v3, v4);
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 128) = v9;
  *(_OWORD *)(v9 + 16) = v16;
  *(void *)(v9 + 32) = v2;
  *(void *)(v9 + 40) = v1;
  id v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v10;
  *id v10 = v0;
  v10[1] = sub_24329B4C4;
  uint64_t v11 = *(void *)(v0 + 16);
  uint64_t v12 = MEMORY[0x263F8EE60] + 8;
  uint64_t v13 = MEMORY[0x263F8EE60] + 8;
  uint64_t v14 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA22B8](v11, v12, v13, 0, 0, &unk_268D91040, v9, v14);
}

uint64_t sub_24329B4C4()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24329B698;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24329B5E0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24329B5E0()
{
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 88);
  (*(void (**)(void, void))(v0 + 112))(*(void *)(v0 + 80), *(void *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24329B698()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[7];
  swift_task_dealloc();
  v2(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24329B760()
{
  return sub_2432ACB08();
}

uint64_t sub_24329B788()
{
  return sub_2432ACB18();
}

uint64_t sub_24329B7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getWitnessTable();

  return static Equatable<>.== infix(_:_:)(a1, a2, a3);
}

uint64_t sub_24329B84C()
{
  return sub_24329B788();
}

uint64_t sub_24329B854()
{
  return sub_24329B760();
}

uint64_t sub_24329B85C()
{
  return sub_2432ACB18();
}

uint64_t sub_24329B8A4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2432AC718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = 0;
  void v11[3] = 0;
  v11[4] = v3;
  v11[5] = a1;
  v11[6] = a2;
  v11[7] = a3;
  id v12 = v3;
  id v13 = a1;
  swift_retain();
  sub_24329BA84((uint64_t)v9, (uint64_t)&unk_268D914D8, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_24329B9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v12 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v12;
  *id v12 = v7;
  v12[1] = sub_243286FB0;
  v12[5] = a7;
  v12[6] = a4;
  v12[3] = a5;
  v12[4] = a6;
  return MEMORY[0x270FA2498](sub_24329C034, 0, 0);
}

uint64_t sub_24329BA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2432AC718();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2432AC708();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2432A11A8(a1, &qword_268D91420);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2432AC6B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_24329BC30(void *a1, int a2, void *a3, void *aBlock)
{
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v9 = a3;
  id v8 = a1;
  sub_24329B8A4(v9, (uint64_t)sub_2432A1C7C, v7);
  swift_release();
}

void sub_24329BCDC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_2432AC498();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_24329BD40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2432AC718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  uint64_t v13[3] = 0;
  v13[4] = v4;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  v13[8] = a4;
  id v14 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24329BA84((uint64_t)v11, (uint64_t)&unk_268D914C8, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_24329BE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  void *v14 = v8;
  v14[1] = sub_243286FB0;
  v14[11] = a8;
  v14[12] = a4;
  v14[9] = a6;
  v14[10] = a7;
  v14[8] = a5;
  return MEMORY[0x270FA2498](sub_24329D770, 0, 0);
}

void sub_24329BF44(void *a1, int a2, int a3, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = sub_2432AC5F8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = a1;
  sub_24329BD40(v6, v8, (uint64_t)sub_2432A1B5C, v9);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_24329C010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](sub_24329C034, 0, 0);
}

uint64_t sub_24329C034()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 48) + *(void *)((*MEMORY[0x263F8EED0] & **(void **)(v0 + 48)) + 0x70));
  *(void *)(v0 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24329C07C, v1, 0);
}

uint64_t sub_24329C07C()
{
  *(unsigned char *)(*(void *)(v0 + 56) + 113) = 1;
  return MEMORY[0x270FA2498](sub_24329C0A4, 0, 0);
}

uint64_t sub_24329C0A4()
{
  type metadata accessor for OSTransaction();
  swift_allocObject();
  *(void *)(v0 + 64) = sub_243296D2C("synchronize", 11, 2);
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *(void *)uint64_t v1 = v0;
  *(void *)(v1 + 8) = sub_24329C18C;
  uint64_t v2 = *(void *)(v0 + 48);
  long long v3 = *(_OWORD *)(v0 + 24);
  *(void *)(v1 + 40) = *(void *)(v0 + 40);
  *(_OWORD *)(v1 + 24) = v3;
  *(void *)(v1 + 16) = v2;
  return MEMORY[0x270FA2498](sub_24329C560, 0, 0);
}

uint64_t sub_24329C18C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24329C32C;
  }
  else {
    uint64_t v2 = sub_24329C2A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24329C2A0()
{
  sub_243297180();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 56);
  return MEMORY[0x270FA2498](sub_24329C310, v1, 0);
}

uint64_t sub_24329C310()
{
  *(unsigned char *)(*(void *)(v0 + 56) + 113) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24329C32C()
{
  uint64_t v1 = (void *)v0[10];
  sub_243297180();
  swift_release();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_2432AC508();
  os_log_type_t v5 = sub_2432AC7B8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[10];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138543362;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_2432AC828();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_243282000, v4, v5, "handleSynchronize - caught error %{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v8, -1, -1);
    MEMORY[0x245678AE0](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[10];
  }
  uint64_t v12 = (void *)v0[10];
  id v13 = (void (*)(void *))v0[4];
  id v14 = v12;
  v13(v12);

  uint64_t v15 = v0[7];
  return MEMORY[0x270FA2498](sub_24329C310, v15, 0);
}

uint64_t sub_24329C53C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_24329C560, 0, 0);
}

uint64_t sub_24329C560()
{
  sub_24329C7B4(*(void **)(v0 + 24));
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *(void *)uint64_t v1 = v0;
  *(void *)(v1 + 8) = sub_24329C618;
  *(int8x16_t *)(v1 + 24) = vextq_s8(*(int8x16_t *)(v0 + 16), *(int8x16_t *)(v0 + 16), 8uLL);
  return MEMORY[0x270FA2498](sub_24329C9F0, 0, 0);
}

uint64_t sub_24329C618()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24329C748, 0, 0);
  }
}

uint64_t sub_24329C748()
{
  (*(void (**)(void))(v0 + 32))(0);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329C7B4(void *a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  id v4 = objc_msgSend(a1, sel_userInfo);
  uint64_t v5 = sub_2432AC5D8();

  sub_24328D628(MEMORY[0x263F8EE78]);
  if (qword_268D90D30 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_268D91640;
  uint64_t v6 = *(void *)algn_268D91648;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24328D628(MEMORY[0x263F8EE78]);
  id v8 = objc_msgSend(a1, sel_displayName);
  uint64_t v9 = sub_2432AC5F8();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();

  v18[3] = &type metadata for CustomContactProviderDomain;
  v18[4] = &protocol witness table for CustomContactProviderDomain;
  uint64_t v12 = (void *)swift_allocObject();
  v18[0] = v12;
  v12[2] = v7;
  v12[3] = v6;
  v12[4] = v9;
  v12[5] = v11;
  v12[6] = v5;
  uint64_t v15 = v3 + 80;
  uint64_t v13 = *(void *)(v3 + 80);
  uint64_t v14 = *(void *)(v15 + 8);
  uint64_t v16 = *(void (**)(void *, uint64_t, uint64_t))(v14 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16(v18, v13, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24329C9D0(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24329C9F0, 0, 0);
}

uint64_t sub_24329C9F0()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = objc_msgSend(*(id *)(v0 + 24), sel_synchronizationReason);
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  *(void *)(v0 + 48) = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x60);
  id v4 = v2;
  uint64_t v5 = sub_2432AC508();
  os_log_type_t v6 = sub_2432AC7B8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v8 = v33;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = sub_2432AC5F8();
    *(void *)(v0 + 16) = sub_2432A59F8(v9, v10, &v33);
    sub_2432AC828();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243282000, v5, v6, "Synchronize reason: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v8, -1, -1);
    uint64_t v11 = v7;
    uint64_t v3 = (void *)MEMORY[0x263F8EED0];
    MEMORY[0x245678AE0](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v12 = sub_2432AC5F8();
  uint64_t v14 = v13;
  if (sub_2432AC5F8() == v12 && v15 == v14) {
    goto LABEL_11;
  }
  char v17 = sub_2432ACA28();
  swift_bridgeObjectRelease();
  if (v17)
  {
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    char v19 = sub_2432AC508();
    os_log_type_t v20 = sub_2432AC7B8();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_243282000, v19, v20, "Will sync contacts", v21, 2u);
      MEMORY[0x245678AE0](v21, -1, -1);
    }

    long long v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v22;
    *long long v22 = v0;
    v22[1] = sub_24329CE74;
    uint64_t v23 = *(void **)(v0 + 32);
    v22[21] = v23;
    v22[22] = *v3 & *v23;
    return MEMORY[0x270FA2498](sub_24329D128, 0, 0);
  }
  if (sub_2432AC5F8() == v12 && v18 == v14) {
    goto LABEL_11;
  }
  char v24 = sub_2432ACA28();
  swift_bridgeObjectRelease();
  if (v24) {
    goto LABEL_12;
  }
  if (sub_2432AC5F8() == v12 && v25 == v14)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  char v26 = sub_2432ACA28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v26) {
    goto LABEL_13;
  }
  uint64_t v27 = sub_2432AC508();
  os_log_type_t v28 = sub_2432AC7B8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_243282000, v27, v28, "Unknown synchronize reason", v29, 2u);
    MEMORY[0x245678AE0](v29, -1, -1);
  }
  long long v30 = *(void **)(v0 + 40);

  uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

uint64_t sub_24329CE74()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_24329D06C;
  }
  else {
    id v2 = sub_24329CF88;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24329CF88()
{
  uint64_t v1 = sub_2432AC508();
  os_log_type_t v2 = sub_2432AC7B8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_243282000, v1, v2, "Did sync contacts", v3, 2u);
    MEMORY[0x245678AE0](v3, -1, -1);
  }

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24329D06C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329D0D0()
{
  *(void *)(v1 + 168) = v0;
  *(void *)(v1 + 176) = *MEMORY[0x263F8EED0] & *v0;
  return MEMORY[0x270FA2498](sub_24329D128, 0, 0);
}

uint64_t sub_24329D128()
{
  uint64_t v1 = type metadata accessor for ProviderStore();
  swift_allocObject();
  uint64_t v2 = sub_2432A1E18();
  v0[23] = v2;
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v5 = (void *)v0[21];
    uint64_t v4 = v0[22];
    uint64_t v6 = *(void *)((char *)v5 + *(void *)((*MEMORY[0x263F8EED0] & *v5) + 0x70));
    type metadata accessor for SyncManager();
    uint64_t inited = swift_initStackObject();
    v0[24] = inited;
    *(void *)(inited + 40) = v1;
    *(void *)(inited + 48) = &off_26F898A20;
    *(void *)(inited + 16) = v3;
    *(unsigned char *)(inited + 56) = 0;
    *(void *)(inited + 64) = v6;
    swift_beginAccess();
    *(unsigned char *)(inited + 56) = 1;
    uint64_t v8 = (char *)v5 + *(void *)((*MEMORY[0x263F8EED0] & *v5) + 0x68);
    uint64_t v9 = *(void *)(v4 + 80);
    v0[14] = v9;
    v0[15] = *(void *)(*(void *)(v4 + 88) + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 11);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(boxed_opaque_existential_1, v8, v9);
    uint64_t v11 = qword_268D90D10;
    swift_retain();
    swift_retain();
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v12 = unk_268D91260;
    v0[19] = qword_268D91258;
    v0[20] = v12;
    uint64_t v13 = (void *)swift_task_alloc();
    v0[25] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_24329D490;
    return sub_2432980F8(v0 + 19, (uint64_t)(v0 + 11));
  }
  else
  {
    uint64_t v15 = sub_2432AC508();
    os_log_type_t v16 = sub_2432AC7B8();
    if (os_log_type_enabled(v15, v16))
    {
      char v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v17 = 0;
      _os_log_impl(&dword_243282000, v15, v16, "Missing Contact Provider contact store", v17, 2u);
      MEMORY[0x245678AE0](v17, -1, -1);
    }

    type metadata accessor for ExtensionHost.HostError();
    swift_getWitnessTable();
    swift_allocError();
    unsigned char *v18 = 1;
    swift_willThrow();
    char v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_24329D490()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24329D6D0;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 88);
    uint64_t v3 = sub_24329D5AC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24329D5AC()
{
  uint64_t v1 = sub_2432AC508();
  os_log_type_t v2 = sub_2432AC7B8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_243282000, v1, v2, "Synced contacts", v3, 2u);
    MEMORY[0x245678AE0](v3, -1, -1);
  }
  uint64_t v4 = *(void *)(v0 + 192);

  swift_release();
  swift_setDeallocating();
  __swift_destroy_boxed_opaque_existential_1(v4 + 16);
  swift_release();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24329D6D0()
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329D748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[11] = a4;
  v5[12] = v4;
  v5[9] = a2;
  v5[10] = a3;
  v5[8] = a1;
  return MEMORY[0x270FA2498](sub_24329D770, 0, 0);
}

uint64_t sub_24329D770()
{
  uint64_t v12 = v0;
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  swift_bridgeObjectRetain_n();
  os_log_type_t v2 = sub_2432AC508();
  os_log_type_t v3 = sub_2432AC7B8();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = v0[9];
    uint64_t v5 = v0[8];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_bridgeObjectRetain();
    v0[7] = sub_2432A59F8(v5, v4, &v11);
    sub_2432AC828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_243282000, v2, v3, "ExtensionHost.handleInvalidate() for %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v7, -1, -1);
    uint64_t v8 = v6;
    uint64_t v1 = (void *)MEMORY[0x263F8EED0];
    MEMORY[0x245678AE0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v9 = *(void *)(v0[12] + *(void *)((*v1 & *(void *)v0[12]) + 0x70));
  v0[13] = v9;
  return MEMORY[0x270FA2498](sub_24329D96C, v9, 0);
}

uint64_t sub_24329D96C()
{
  *(unsigned char *)(*(void *)(v0 + 104) + 112) = 1;
  return MEMORY[0x270FA2498](sub_24329D994, 0, 0);
}

uint64_t sub_24329D994()
{
  uint64_t v1 = (void *)v0[12];
  swift_beginAccess();
  uint64_t v2 = 1000000000000000000 * qword_268D912E0;
  uint64_t v3 = ((qword_268D912E0 >> 63) & 0xF21F494C589C0000)
     + (((unint64_t)qword_268D912E0 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  uint64_t v4 = swift_allocObject();
  v0[14] = v4;
  *(void *)(v4 + 16) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268D91400 + dword_268D91400);
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[15] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24329DAD8;
  return v8((uint64_t)v8, v2, v3, (uint64_t)&unk_268D913F8, v4);
}

uint64_t sub_24329DAD8()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24329DEA4;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_24329DBF4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24329DBF4()
{
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = 1000000000000000000 * qword_268D912E0;
  uint64_t v3 = ((qword_268D912E0 >> 63) & 0xF21F494C589C0000)
     + (((unint64_t)qword_268D912E0 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  uint64_t v4 = swift_allocObject();
  v0[17] = v4;
  *(void *)(v4 + 16) = v1;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268D91400 + dword_268D91400);
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[18] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24329DD20;
  return v8((uint64_t)v8, v2, v3, (uint64_t)&unk_268D91410, v4);
}

uint64_t sub_24329DD20()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24329E13C;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_24329DE3C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24329DE3C()
{
  (*(void (**)(void))(v0 + 80))(0);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329DEA4()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();
  *(void *)(v0 + 40) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
  if (swift_dynamicCast())
  {

    sub_243286BA8();
    uint64_t v1 = (void *)swift_allocError();
    *uint64_t v3 = 9;
  }

  id v4 = v1;
  if (qword_268D90D20 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2432AC528();
  __swift_project_value_buffer(v5, (uint64_t)qword_268D92920);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2432AC508();
  os_log_type_t v9 = sub_2432AC7B8();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v10 = 138543362;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v13;
    sub_2432AC828();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_243282000, v8, v9, "ExtensionHost.handleInvalidate() error %{public}@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v11, -1, -1);
    MEMORY[0x245678AE0](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = *(void (**)(void *))(v0 + 80);

  id v15 = v1;
  v14(v1);

  os_log_type_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_24329E13C()
{
  uint64_t v1 = *(void **)(v0 + 152);
  swift_release();
  *(void *)(v0 + 40) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
  if (swift_dynamicCast())
  {

    sub_243286BA8();
    uint64_t v1 = (void *)swift_allocError();
    *uint64_t v3 = 9;
  }

  id v4 = v1;
  if (qword_268D90D20 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2432AC528();
  __swift_project_value_buffer(v5, (uint64_t)qword_268D92920);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_2432AC508();
  os_log_type_t v9 = sub_2432AC7B8();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v10 = 138543362;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v13;
    sub_2432AC828();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_243282000, v8, v9, "ExtensionHost.handleInvalidate() error %{public}@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v11, -1, -1);
    MEMORY[0x245678AE0](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v14 = *(void (**)(void *))(v0 + 80);

  id v15 = v1;
  v14(v1);

  os_log_type_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_24329E3D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *a2) + 0x58);
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *a2) + 0x50);
  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 32) + **(int **)(v3 + 32));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_243284460;
  return v7(v4, v3);
}

uint64_t sub_24329E51C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  return MEMORY[0x270FA2498](sub_24329E53C, 0, 0);
}

uint64_t sub_24329E53C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + *(void *)((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x70));
  *(void *)(v0 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24329E584, v1, 0);
}

uint64_t sub_24329E584()
{
  *(unsigned char *)(v0 + 32) = *(unsigned char *)(*(void *)(v0 + 24) + 113);
  return MEMORY[0x270FA2498](sub_24329E5AC, 0, 0);
}

uint64_t sub_24329E5AC()
{
  if (*(unsigned char *)(v0 + 32) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 24);
    sleep(1u);
    return MEMORY[0x270FA2498](sub_24329E658, v1, 0);
  }
  else
  {
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24329E658()
{
  *(unsigned char *)(v0 + 33) = *(unsigned char *)(*(void *)(v0 + 24) + 113);
  return MEMORY[0x270FA2498](sub_24329E680, 0, 0);
}

uint64_t sub_24329E680()
{
  if (*(unsigned char *)(v0 + 33) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 24);
    sleep(1u);
    return MEMORY[0x270FA2498](sub_24329E658, v1, 0);
  }
  else
  {
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

void sub_24329E72C()
{
}

id sub_24329E770()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtensionHost();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24329E7E4(char *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *(void *)a1;
  uint64_t v4 = &a1[*(void *)(v3 + 0x60)];
  uint64_t v5 = sub_2432AC528();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  (*(void (**)(char *))(*(void *)(*(void *)(v3 + 80) - 8) + 8))(&a1[*(void *)((*v2 & *(void *)a1)
                                                                                                 + 0x68)]);

  return swift_release();
}

uint64_t type metadata accessor for ExtensionHost()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24329E914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  void v6[3] = a3;
  v6[4] = a4;
  v6[2] = a2;
  uint64_t v7 = sub_2432AC938();
  v6[7] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[8] = v8;
  v6[9] = *(void *)(v8 + 64);
  v6[10] = swift_task_alloc();
  uint64_t v9 = sub_2432AC918();
  v6[11] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[12] = v10;
  v6[13] = *(void *)(v10 + 64);
  v6[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  v6[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24329EA78, 0, 0);
}

uint64_t sub_24329EA78()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[12];
  uint64_t v22 = v0[13];
  uint64_t v23 = v0 + 18;
  uint64_t v4 = v0[11];
  uint64_t v21 = v0[10];
  uint64_t v17 = v0[8];
  uint64_t v18 = v0[14];
  uint64_t v19 = v0[6];
  uint64_t v20 = v0[7];
  uint64_t v5 = v0[4];
  uint64_t v16 = v0[5];
  uint64_t v6 = v0[3];
  uint64_t v7 = sub_2432AC718();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v2, 1, 1, v7);
  uint64_t v9 = (void *)swift_allocObject();
  id v9[2] = 0;
  v9[3] = 0;
  v9[4] = v6;
  v9[5] = v5;
  swift_retain();
  sub_2432A0458(v2, (uint64_t)&unk_268D91430, (uint64_t)v9);
  sub_2432A11A8(v2, &qword_268D91420);
  v8(v2, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v18, v16, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v21, v19, v20);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v11 = (v22 + *(unsigned __int8 *)(v17 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v12 + v10, v18, v4);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v12 + v11, v21, v20);
  sub_2432A0458(v2, (uint64_t)&unk_268D91440, v12);
  sub_2432A11A8(v2, &qword_268D91420);
  uint64_t v13 = (void *)swift_task_alloc();
  v1[16] = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91448);
  *uint64_t v13 = v1;
  v13[1] = sub_24329ED4C;
  return MEMORY[0x270FA2048](v23, 0, 0, v14);
}

uint64_t sub_24329ED4C()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24329EFAC;
  }
  else {
    uint64_t v2 = sub_24329EE60;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24329EE60()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91048);
  sub_2432AC768();
  if (*(unsigned char *)(v0 + 144))
  {
    sub_2432AC6F8();
    sub_2432A110C(&qword_268D91450, MEMORY[0x263F8F488]);
    swift_allocError();
    sub_2432AC5B8();
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329EFAC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329F02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  v5[6] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91468);
  v5[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24329F0C4, 0, 0);
}

uint64_t sub_24329F0C4()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91470);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91478);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 80) = v3;
  *(_DWORD *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_24328E9D8(v1, v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16), &qword_268D91468);
  sub_2432A11A8(v1, &qword_268D91468);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91480);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 88) = inited;
  *(_DWORD *)(inited + 24) = 0;
  *(void *)(inited + 16) = 0;
  sub_2432AC738();
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 96) = v5;
  long long v6 = *(_OWORD *)(v0 + 56);
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = inited;
  *(_OWORD *)(v5 + 32) = v6;
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 104) = v7;
  *(void *)(v7 + 16) = inited;
  *(void *)(v7 + 24) = v3;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24329F368;
  uint64_t v9 = *(void *)(v0 + 48);
  uint64_t v10 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2338](v9, &unk_268D91490, v5, sub_2432A12BC, v7, 0, 0, v10);
}

uint64_t sub_24329F368()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24329F518;
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = sub_24329F48C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24329F48C()
{
  swift_setDeallocating();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329F518()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24329F5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  void v5[3] = a2;
  v5[4] = a3;
  long long v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24329F5D0, 0, 0);
}

uint64_t sub_24329F5D0()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  long long v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 32) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24329F6C8;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v4, 0, 0, 0xD00000000000001CLL, 0x80000002432B18D0, sub_2432A12C4, v1, v5);
}

uint64_t sub_24329F6C8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24329F804, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24329F804()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24329F868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a2 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(void *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_2432A12D0(v4);
  os_unfair_lock_unlock(v5);
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_2432A12EC((uint64_t *)(a3 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
}

uint64_t sub_24329F950(uint64_t a1, uint64_t a2)
{
  sub_2432A11A8(a1, &qword_268D91468);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91470);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
}

uint64_t sub_24329FA14(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_release();
  uint64_t v11 = sub_2432AC718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a2;
  v12[5] = a3;
  v12[6] = a4;
  swift_retain();
  swift_retain();
  uint64_t result = sub_24329BA84((uint64_t)v10, (uint64_t)&unk_268D914A0, (uint64_t)v12);
  *a1 = result;
  return result;
}

uint64_t sub_24329FB44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_24329FB68, 0, 0);
}

uint64_t sub_24329FB68()
{
  sub_2432AC738();
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(v0 + 16) + **(int **)(v0 + 16));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_24329FD34;
  return v3();
}

uint64_t sub_24329FD34()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24329FF4C;
  }
  else {
    uint64_t v2 = sub_24329FE48;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24329FE48()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[4];
  swift_task_alloc();
  uint64_t v3 = v2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v2 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_2432A1664(v3);
  os_unfair_lock_unlock(v4);
  if (!v1)
  {
    swift_task_dealloc();
    uint64_t v5 = (void (*)(void))v0[1];
    v5();
  }
}

uint64_t sub_24329FF4C()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v2 = v0[4];
  *(void *)(swift_task_alloc() + 16) = v1;
  uint64_t v3 = v2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v2 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_2432A14F8(v3);
  os_unfair_lock_unlock(v4);

  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2432A0060(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91470);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v10[1] = a2;
    id v8 = a2;
    sub_2432AC6C8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_2432A11A8(a1, &qword_268D91468);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
}

void sub_2432A01CC(os_unfair_lock_s *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)&a1[4];
  uint64_t v4 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_2432AAFFC(v3, &v7);
  os_unfair_lock_unlock(v4);
  uint64_t v5 = a2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a2 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(void *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2432A029C(v5);

  os_unfair_lock_unlock(v6);
}

uint64_t sub_2432A029C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91470);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    sub_2432AC6F8();
    sub_2432A110C(&qword_268D91450, MEMORY[0x263F8F488]);
    uint64_t v6 = swift_allocError();
    sub_2432AC5B8();
    v8[1] = v6;
    sub_2432AC6C8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2432A11A8(a1, &qword_268D91468);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
}

uint64_t sub_2432A0458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  MEMORY[0x270FA5388]();
  id v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24328E9D8(a1, (uint64_t)v8, &qword_268D91420);
  uint64_t v9 = sub_2432AC718();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2432A11A8((uint64_t)v8, &qword_268D91420);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_2432AC6B8();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2432AC708();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = *v4;
  id v15 = (void *)(v13 | v11);
  if (v13 | v11)
  {
    v18[0] = 0;
    v18[1] = 0;
    id v15 = v18;
    v18[2] = v11;
    v18[3] = v13;
  }
  v17[1] = 1;
  v17[2] = v15;
  v17[3] = v14;
  swift_task_create();
  return swift_release();
}

uint64_t sub_2432A0638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 40) = a4;
  *(void *)(v5 + 48) = a5;
  return MEMORY[0x270FA2498](sub_2432A0658, 0, 0);
}

uint64_t sub_2432A0658()
{
  sub_2432AC738();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = sub_2432AC938();
  uint64_t v3 = sub_2432A110C(&qword_268D91458, MEMORY[0x263F8F740]);
  void *v1 = v0;
  v1[1] = sub_2432A079C;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  return MEMORY[0x270FA1FF8](v4, v0 + 16, v5, v2, v3);
}

uint64_t sub_2432A079C()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2432A0938;
  }
  else {
    uint64_t v2 = sub_2432A08B0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432A08B0()
{
  sub_2432A1154();
  swift_allocError();
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2432A0938()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2432A0950()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2432A0988(uint64_t a1)
{
  uint64_t v4 = *(void **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_243286FB0;
  return sub_24329E3D4(a1, v4);
}

uint64_t sub_2432A0A28(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2432A0B04;
  return v6(a1);
}

uint64_t sub_2432A0B04()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2432A0BFC()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_243286FB0;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24329E53C, 0, 0);
}

uint64_t sub_2432A0CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_243286FB0;
  return sub_24329E914(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_2432A0D6C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2432A0DAC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_243286FB0;
  return sub_24329F02C(a1, v4, v5, v7, v6);
}

uint64_t sub_2432A0E6C()
{
  uint64_t v1 = sub_2432AC918();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_2432AC938();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_2432A0FC4()
{
  uint64_t v2 = *(void *)(sub_2432AC918() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(sub_2432AC938() - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_243284460;
  v9[5] = v7;
  v9[6] = v8;
  return MEMORY[0x270FA2498](sub_2432A0658, 0, 0);
}

uint64_t sub_2432A110C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2432A1154()
{
  unint64_t result = qword_268D91460;
  if (!qword_268D91460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D91460);
  }
  return result;
}

uint64_t sub_2432A11A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2432A1204(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  long long v6 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_243286FB0;
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24329F5D0, 0, 0);
}

void sub_2432A12BC()
{
  sub_2432A01CC(*(os_unfair_lock_s **)(v0 + 16), *(void *)(v0 + 24));
}

void sub_2432A12C4(uint64_t a1)
{
  sub_24329F868(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2432A12D0(uint64_t a1)
{
  return sub_24329F950(a1, *(void *)(v1 + 16));
}

uint64_t sub_2432A12EC(uint64_t *a1)
{
  return sub_24329FA14(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2432A130C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2432A1354()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_243284460;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return MEMORY[0x270FA2498](sub_24329FB68, 0, 0);
}

uint64_t sub_2432A1408()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2432A1440(uint64_t a1)
{
  long long v4 = *(int **)(v1 + 16);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_243286FB0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D914A8 + dword_268D914A8);
  return v6(a1, v4);
}

uint64_t sub_2432A14F8(uint64_t a1)
{
  return sub_2432A0060(a1, *(void **)(v1 + 16));
}

uint64_t sub_2432A1514(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91470);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    sub_2432AC6D8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2432A11A8(a1, &qword_268D91468);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
}

uint64_t sub_2432A1664(uint64_t a1)
{
  return sub_2432A1514(a1);
}

uint64_t type metadata accessor for ExtensionHost.HostError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2432A1698()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2432A16E0()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2432A1730(uint64_t a1)
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
  v11[1] = sub_243286FB0;
  return sub_24329BE70(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2432A180C()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2432A185C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_243286FB0;
  return sub_24329B9C0(a1, v4, v5, v6, v7, v9, v8);
}

id sub_2432A1930(uint64_t a1)
{
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v5 = v1;
  sub_2432AC518();
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)(v4 + 80) - 8) + 16))(&v5[*(void *)((*v3 & *(void *)v5) + 0x68)], a1, *(void *)(v4 + 80));
  type metadata accessor for ExtensionState();
  uint64_t v6 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_WORD *)(v6 + 112) = 0;
  *(void *)&v5[*(void *)((*v3 & *(void *)v5) + 0x70)] = v6;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for ExtensionHost();
  return objc_msgSendSuper2(&v8, sel_init);
}

id sub_2432A1AB8(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for ExtensionHost());
  return sub_2432A1930(a1);
}

void sub_2432A1AF4()
{
}

uint64_t sub_2432A1B24()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2432A1B5C(uint64_t a1)
{
  sub_24329BCDC(a1, *(void *)(v1 + 16));
}

uint64_t sub_2432A1B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_2432A1B6C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2432A1C38);
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

uint64_t sub_2432A1C60()
{
  return swift_getWitnessTable();
}

uint64_t dispatch thunk of ProviderStoreProtocol.domainIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.domainIdentifier.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.domainIdentifier.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.add(_:itemIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.update(contactItems:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.update(groupItems:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.remove(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.isContentEnumerated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.page.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.syncAnchor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingPage(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingContent(upTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingContentWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingChanges(upTo:moreComing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.finishEnumeratingChangesWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 128))();
}

uint64_t dispatch thunk of ProviderStoreProtocol.logState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t sub_2432A1E18()
{
  uint64_t v1 = v0;
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v2 = v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_logger;
  sub_2432AC518();
  uint64_t v3 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_contactProviderSupport;
  id v4 = objc_allocWithZone(MEMORY[0x263EFEA38]);
  uint64_t v5 = (void *)sub_2432AC5E8();
  id v6 = objc_msgSend(v4, sel_initWithDomainIdentifier_, v5);

  *(void *)(v1 + v3) = v6;
  uint64_t v7 = sub_2432AC508();
  os_log_type_t v8 = sub_2432AC7B8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_243282000, v7, v8, "ProviderStore.init", v9, 2u);
    MEMORY[0x245678AE0](v9, -1, -1);
  }

  uint64_t v10 = *(void **)(v1 + v3);
  id v11 = objc_msgSend(v10, sel_contactStore);
  if (!v11) {
    goto LABEL_16;
  }
  uint64_t v12 = v11;
  id v13 = objc_msgSend(v10, sel_domainContainerIdentifier);
  if (!v13)
  {

LABEL_16:
    uint64_t v36 = sub_2432AC528();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v36 - 8) + 8))(v2, v36);

    type metadata accessor for ProviderStore();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_2432AC5F8();
  uint64_t v17 = v16;

  uint64_t v18 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268D91610);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_2432AD5C0;
  *(void *)(v19 + 32) = v15;
  *(void *)(v19 + 40) = v17;
  swift_bridgeObjectRetain();
  uint64_t v20 = (void *)sub_2432AC668();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v18, sel_predicateForContainersWithIdentifiers_, v20);

  *(void *)&long long v39 = 0;
  id v22 = objc_msgSend(v12, sel_containersMatchingPredicate_error_, v21, &v39);

  uint64_t v23 = (void *)v39;
  if (!v22)
  {
    id v33 = (id)v39;
    swift_bridgeObjectRelease();
    uint64_t v34 = (void *)sub_2432AC4A8();

    swift_willThrow();
    goto LABEL_16;
  }
  sub_243294188(0, &qword_268D91630);
  unint64_t v24 = sub_2432AC678();
  id v25 = v23;

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_2432AC968();
    swift_bridgeObjectRelease();
    if (v35) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_15:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
LABEL_8:
  if ((v24 & 0xC000000000000001) != 0)
  {
    id v26 = (id)MEMORY[0x2456781E0](0, v24);
  }
  else
  {
    if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v26 = *(id *)(v24 + 32);
  }
  uint64_t v27 = v26;
  swift_bridgeObjectRelease();
  *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_store) = v12;
  os_log_type_t v28 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_containerIdentifier);
  *os_log_type_t v28 = v15;
  v28[1] = v17;
  id v29 = v12;
  objc_msgSend(v27, sel_mutableCopy);
  sub_2432AC848();
  swift_unknownObjectRelease();
  sub_243294188(0, &qword_268D91638);
  swift_dynamicCast();
  *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container) = v38;
  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB48]), sel_init);
  *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest) = v30;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 0;
  uint64_t v31 = type metadata accessor for StampedeManager();
  swift_allocObject();
  uint64_t v32 = StampedeManager.init(notifyBatchSize:waitDivisor:)(1000, 350);
  uint64_t v40 = v31;
  uint64_t v41 = &protocol witness table for StampedeManager;

  *(void *)&long long v39 = v32;
  sub_243286F98(&v39, v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
  return v1;
}

uint64_t sub_2432A233C(void *a1, uint64_t a2)
{
  return sub_2432A31CC(a1, a2, (SEL *)&selRef_addContact_toContainerWithIdentifier_);
}

uint64_t sub_2432A2348(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return result;
  }
  uint64_t v3 = result;
  swift_retain();
  uint64_t v54 = sub_2432A71F4(v3);
  swift_release();
  uint64_t v56 = v1;
  swift_bridgeObjectRetain();
  uint64_t v57 = (void *)MEMORY[0x263F8EE80];
  id v4 = (unsigned char *)(v3 + 56);
  do
  {
    uint64_t v7 = (void *)*((void *)v4 - 3);
    uint64_t v6 = *((void *)v4 - 2);
    uint64_t v8 = *((void *)v4 - 1);
    if (*v4)
    {
      id v9 = v7;
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_2432AC508();
      os_log_type_t v11 = sub_2432AC7A8();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_243282000, v10, v11, "update contact items - failed to map a contact by its identifier", v12, 2u);
        MEMORY[0x245678AE0](v12, -1, -1);
      }

      uint64_t v5 = v7;
    }
    else
    {
      sub_243289E08(*((void **)v4 - 3));
      sub_243289E08(v7);
      id v13 = v7;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v60 = v57;
      unint64_t v16 = sub_2432A6050(v6, v8);
      uint64_t v17 = v57[2];
      BOOL v18 = (v15 & 1) == 0;
      uint64_t v19 = v17 + v18;
      if (__OFADD__(v17, v18))
      {
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      char v20 = v15;
      if (v57[3] >= v19)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_2432A6F4C();
        }
      }
      else
      {
        sub_2432A6C3C(v19, isUniquelyReferenced_nonNull_native);
        unint64_t v21 = sub_2432A6050(v6, v8);
        if ((v20 & 1) != (v22 & 1)) {
          goto LABEL_49;
        }
        unint64_t v16 = v21;
      }
      uint64_t v23 = v60;
      uint64_t v57 = v60;
      if (v20)
      {
        uint64_t v24 = v60[7];

        *(void *)(v24 + 8 * v16) = v13;
      }
      else
      {
        v60[(v16 >> 6) + 8] |= 1 << v16;
        id v25 = (uint64_t *)(v23[6] + 16 * v16);
        *id v25 = v6;
        v25[1] = v8;
        *(void *)(v23[7] + 8 * v16) = v13;
        uint64_t v26 = v23[2];
        BOOL v27 = __OFADD__(v26, 1);
        uint64_t v28 = v26 + 1;
        if (v27) {
          goto LABEL_30;
        }
        v23[2] = v28;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v5 = v7;
    }
    sub_243289E40(v5);
    v4 += 32;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  if (qword_268D90D28 == -1) {
    goto LABEL_20;
  }
LABEL_31:
  swift_once();
LABEL_20:
  unint64_t v29 = sub_2432A45BC((uint64_t)v54);
  swift_bridgeObjectRelease();
  unint64_t v60 = (void *)MEMORY[0x263F8EE78];
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2432AC968();
    if (v30) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v30)
    {
LABEL_22:
      if (v30 < 1)
      {
        __break(1u);
LABEL_49:
        unint64_t result = sub_2432ACA68();
        __break(1u);
        return result;
      }
      uint64_t v31 = 0;
      do
      {
        if ((v29 & 0xC000000000000001) != 0) {
          id v32 = (id)MEMORY[0x2456781E0](v31, v29);
        }
        else {
          id v32 = *(id *)(v29 + 8 * v31 + 32);
        }
        id v33 = v32;
        ++v31;
        id v59 = v32;
        sub_2432A29A4(&v59, (uint64_t)v57, v56, &v60);
      }
      while (v30 != v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_34:
  swift_bridgeObjectRelease();
  uint64_t v34 = swift_bridgeObjectRetain();
  uint64_t v35 = sub_2432A73B4(v34);
  swift_retain();
  uint64_t v36 = swift_bridgeObjectRetain();
  uint64_t v37 = sub_2432A744C(v36, v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v38 = *(void *)(v37 + 16);
  if (v38)
  {
    uint64_t v58 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest;
    uint64_t v55 = (void *)(v56 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
    swift_bridgeObjectRetain();
    long long v39 = (unsigned char *)(v37 + 56);
    uint64_t v40 = 1;
    while (1)
    {
      uint64_t v41 = (void *)*((void *)v39 - 3);
      char v42 = *v39;
      id v43 = v41;
      swift_bridgeObjectRetain();
      if (v42)
      {
        id v44 = sub_2432AC508();
        os_log_type_t v45 = sub_2432AC7A8();
        if (os_log_type_enabled(v44, v45))
        {
          long long v46 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v46 = 0;
          _os_log_impl(&dword_243282000, v44, v45, "update contact items - failed to add an item", v46, 2u);
          MEMORY[0x245678AE0](v46, -1, -1);
        }

        long long v47 = v41;
      }
      else
      {
        id v48 = v43;
        swift_bridgeObjectRetain();
        uint64_t v49 = (void *)sub_2432AC5E8();
        objc_msgSend(v48, sel_setExternalUUID_, v49);

        id v50 = *(id *)(v56 + v58);
        v51 = (void *)sub_2432AC5E8();
        objc_msgSend(v50, sel_addContact_toContainerWithIdentifier_, v48, v51);

        uint64_t v52 = v55[3];
        uint64_t v53 = v55[4];
        __swift_project_boxed_opaque_existential_1(v55, v52);
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v53);
        swift_bridgeObjectRelease();

        long long v47 = v41;
      }
      sub_243289E40(v47);
      if (v38 == v40) {
        break;
      }
      v39 += 32;
      BOOL v27 = __OFADD__(v40++, 1);
      if (v27)
      {
        __break(1u);
        break;
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_2432A29A4(id *a1, uint64_t a2, uint64_t a3, void **a4)
{
  id v7 = *a1;
  id v8 = objc_msgSend(*a1, sel_externalUUID);
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = v8;
  uint64_t v10 = sub_2432AC5F8();
  uint64_t v12 = v11;

  if (!*(void *)(a2 + 16))
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    id v27 = v7;
    uint64_t v28 = sub_2432AC508();
    os_log_type_t v29 = sub_2432AC7A8();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v37[0] = v31;
      *(_DWORD *)uint64_t v30 = 136446210;
      id v32 = objc_msgSend(v27, sel_externalUUID, v37[0]);
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = sub_2432AC5F8();
        unint64_t v36 = v35;
      }
      else
      {
        unint64_t v36 = 0xE500000000000000;
        uint64_t v34 = 0x3E6C696E3CLL;
      }
      id v38 = (id)sub_2432A59F8(v34, v36, v37);
      sub_2432AC828();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243282000, v28, v29, "update contact items - failed find update contact for identifier %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v31, -1, -1);
      MEMORY[0x245678AE0](v30, -1, -1);
    }
    else
    {
    }
    return;
  }
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_2432A6050(v10, v12);
  if ((v14 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  id v15 = *(id *)(*(void *)(a2 + 56) + 8 * v13);
  swift_bridgeObjectRelease();
  id v16 = sub_2432A2D40(v15, v7);
  if (v16)
  {
    uint64_t v17 = v16;
    id v18 = *(id *)(a3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
    objc_msgSend(v17, sel_mutableCopy);
    sub_2432AC848();
    swift_unknownObjectRelease();
    sub_243294188(0, &qword_268D91250);
    swift_dynamicCast();
    objc_msgSend(v18, sel_updateContact_, v38);

    uint64_t v19 = (void *)(a3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
    uint64_t v20 = *(void *)(a3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
    uint64_t v21 = v19[4];
    __swift_project_boxed_opaque_existential_1(v19, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
    char v22 = *a4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v22 = sub_2432A5848(0, v22[2] + 1, 1, v22);
      *a4 = v22;
    }
    unint64_t v25 = v22[2];
    unint64_t v24 = v22[3];
    if (v25 >= v24 >> 1)
    {
      char v22 = sub_2432A5848((void *)(v24 > 1), v25 + 1, 1, v22);
      *a4 = v22;
    }
    v22[2] = v25 + 1;
    uint64_t v26 = &v22[2 * v25];
    v26[4] = v10;
    v26[5] = v12;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

id sub_2432A2D40(void *a1, void *a2)
{
  v36[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA10]), sel_init);
  objc_msgSend(v4, sel_setIgnoreUnavailableKeys_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2432AE310;
  uint64_t v6 = (void *)*MEMORY[0x263EFDFD8];
  id v7 = (void *)*MEMORY[0x263EFDFB0];
  *(void *)(v5 + 32) = *MEMORY[0x263EFDFD8];
  *(void *)(v5 + 40) = v7;
  sub_2432AC688();
  id v8 = v6;
  id v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D915E0);
  uint64_t v10 = (void *)sub_2432AC668();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setIgnoredKeys_, v10);

  uint64_t v11 = self;
  v36[0] = 0;
  id v12 = v4;
  id v13 = a1;
  id v14 = a2;
  id v15 = objc_msgSend(v11, sel_diffContact_to_options_error_, v14, v13, v12, v36);
  if (!v15)
  {
    id v23 = v36[0];
    unint64_t v24 = (void *)sub_2432AC4A8();

    swift_willThrow();
    id v25 = v24;
    id v26 = v24;
    id v27 = sub_2432AC508();
    os_log_type_t v28 = sub_2432AC7A8();
    if (os_log_type_enabled(v27, v28))
    {
      os_log_type_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v29 = 138543362;
      id v31 = v24;
      id v32 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v36[0] = v32;
      sub_2432AC828();
      void *v30 = v32;

      _os_log_impl(&dword_243282000, v27, v28, "update contact items - failed contact diff: %{public}@", v29, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v30, -1, -1);
      MEMORY[0x245678AE0](v29, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  id v16 = v15;
  id v17 = v36[0];

  id v18 = v16;
  uint64_t v19 = sub_2432AC508();
  os_log_type_t v20 = sub_2432AC7B8();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    unint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 138412290;
    v36[0] = v18;
    id v22 = v18;
    sub_2432AC828();
    *unint64_t v35 = v16;

    _os_log_impl(&dword_243282000, v19, v20, "update contact items - contact diff: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
    swift_arrayDestroy();
    MEMORY[0x245678AE0](v35, -1, -1);
    MEMORY[0x245678AE0](v21, -1, -1);
  }
  else
  {
  }
  id result = objc_msgSend(v18, sel_contactByApplyingUpdatesToContact_, v14);
  if (result)
  {
    id v34 = result;

    return v34;
  }
  __break(1u);
  return result;
}

uint64_t sub_2432A31C0(void *a1, uint64_t a2)
{
  return sub_2432A31CC(a1, a2, (SEL *)&selRef_addGroup_toContainerWithIdentifier_);
}

uint64_t sub_2432A31CC(void *a1, uint64_t a2, SEL *a3)
{
  uint64_t v6 = (void *)sub_2432AC5E8();
  objc_msgSend(a1, sel_setExternalUUID_, v6);

  id v7 = *(id *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
  id v8 = (void *)sub_2432AC5E8();
  objc_msgSend(v7, *a3, a1, v8);

  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  uint64_t v10 = *(void *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
}

uint64_t sub_2432A32AC(uint64_t result)
{
  if (!*(void *)(result + 16)) {
    return result;
  }
  unint64_t v2 = sub_2432A45BC(result);
  unint64_t v3 = v2;
  unint64_t v4 = v2 >> 62;
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = sub_2432AC968();
    uint64_t v5 = result;
    if (result) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_4:
      if (v5 < 1)
      {
        __break(1u);
        return result;
      }
      unint64_t v14 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest;
      do
      {
        if ((v3 & 0xC000000000000001) != 0) {
          id v8 = (id)MEMORY[0x2456781E0](v6, v3);
        }
        else {
          id v8 = *(id *)(v3 + 8 * v6 + 32);
        }
        uint64_t v9 = v8;
        ++v6;
        id v10 = *(id *)(v1 + v7);
        objc_msgSend(v9, sel_mutableCopy);
        sub_2432AC848();
        swift_unknownObjectRelease();
        sub_243294188(0, &qword_268D91250);
        swift_dynamicCast();
        objc_msgSend(v10, sel_deleteContact_, v15);
      }
      while (v5 != v6);
      swift_bridgeObjectRelease();
      unint64_t v4 = v14;
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v11);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2432AC968();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 24))(v13, v11, v12);
}

id sub_2432A34B8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v2 = objc_msgSend(v1, sel_providerMetadata);
  if (!v2) {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v3 = objc_msgSend(v1, sel_providerMetadata);

  if (!v3) {
    objc_msgSend(v1, sel_setProviderMetadata_, v2);
  }
  id v4 = objc_msgSend(v2, sel_isContentEnumerated);

  return v4;
}

void sub_2432A3574(uint64_t *a1@<X8>)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v4 = objc_msgSend(v3, sel_providerMetadata);
  if (!v4) {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v5 = objc_msgSend(v3, sel_providerMetadata);

  if (!v5) {
    objc_msgSend(v3, sel_setProviderMetadata_, v4);
  }
  id v6 = objc_msgSend(v4, sel_itemAnchor);
  if (v6)
  {
    uint64_t v7 = sub_2432AC4C8();
    unint64_t v9 = v8;

    id v6 = objc_msgSend(v4, sel_itemOffset);
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xC000000000000000;
  }

  *a1 = v7;
  a1[1] = v9;
  a1[2] = (uint64_t)v6;
}

void sub_2432A3680(uint64_t *a1@<X8>)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v4 = objc_msgSend(v3, sel_providerMetadata);
  if (!v4) {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v5 = objc_msgSend(v3, sel_providerMetadata);

  if (!v5) {
    objc_msgSend(v3, sel_setProviderMetadata_, v4);
  }
  if (!objc_msgSend(v4, sel_isContentEnumerated))
  {
    uint64_t v12 = sub_2432AC508();
    os_log_type_t v13 = sub_2432AC7A8();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v14 = 0;
      id v15 = "syncAnchor not available as all content is not enumerated";
LABEL_12:
      _os_log_impl(&dword_243282000, v12, v13, v15, v14, 2u);
      MEMORY[0x245678AE0](v14, -1, -1);
    }
LABEL_13:

    uint64_t v8 = 0;
    id v11 = 0;
    unint64_t v10 = 0xF000000000000000;
    goto LABEL_14;
  }
  id v6 = objc_msgSend(v4, sel_itemAnchor);
  if (!v6)
  {
    uint64_t v12 = sub_2432AC508();
    os_log_type_t v13 = sub_2432AC7A8();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v14 = 0;
      id v15 = "syncAnchor is missing after all content was enumerated";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_2432AC4C8();
  unint64_t v10 = v9;

  id v11 = objc_msgSend(v4, sel_itemOffset);
LABEL_14:

  *a1 = v8;
  a1[1] = v10;
  a1[2] = (uint64_t)v11;
}

void sub_2432A386C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 + 16);
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v5 = objc_msgSend(v4, sel_providerMetadata);
  if (!v5) {
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v6 = objc_msgSend(v4, sel_providerMetadata);

  if (!v6) {
    objc_msgSend(v4, sel_setProviderMetadata_, v5);
  }
  uint64_t v7 = (void *)sub_2432AC4B8();
  objc_msgSend(v5, sel_setItemAnchor_, v7);

  objc_msgSend(v5, sel_setItemOffset_, v3);
  objc_msgSend(v4, sel_setProviderMetadata_, v5);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
  sub_2432A49A4();
}

void sub_2432A39E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v3 = objc_msgSend(v2, sel_providerMetadata);
  if (!v3) {
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v4 = objc_msgSend(v2, sel_providerMetadata);

  if (!v4) {
    objc_msgSend(v2, sel_setProviderMetadata_, v3);
  }
  id v5 = (void *)sub_2432AC4B8();
  objc_msgSend(v3, sel_setItemAnchor_, v5);

  objc_msgSend(v3, sel_setItemOffset_, 0);
  objc_msgSend(v3, sel_setIsContentEnumerated_, 1);
  objc_msgSend(v2, sel_setProviderMetadata_, v3);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v6, v7);
  sub_2432A49A4();
}

void sub_2432A3B60(uint64_t a1)
{
}

void sub_2432A3B78(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v7 = objc_msgSend(v6, sel_providerMetadata);
  if (!v7) {
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v8 = objc_msgSend(v6, sel_providerMetadata);

  if (!v8) {
    objc_msgSend(v6, sel_setProviderMetadata_, v7);
  }
  uint64_t v9 = (void *)sub_2432AC4B8();
  objc_msgSend(v7, sel_setItemAnchor_, v9);

  objc_msgSend(v7, sel_setItemOffset_, v5);
  uint64_t v10 = a2 & 1;
  objc_msgSend(v7, sel_setIsMoreComing_, v10);
  objc_msgSend(v6, sel_setProviderMetadata_, v7);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  uint64_t v12 = *(void *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v3 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, v11, v12);
  sub_2432A49A4();
}

void sub_2432A3D0C(uint64_t a1)
{
}

void sub_2432A3D24(uint64_t a1, char a2, const char *a3)
{
  uint64_t v6 = v3;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB48]), sel_init);
  uint64_t v9 = *(void **)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
  *(void *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest) = v8;

  sub_243286BA8();
  uint64_t v10 = (void *)swift_allocError();
  *uint64_t v11 = a2;
  char v12 = == infix(_:_:)();

  if (v12)
  {
    os_log_type_t v13 = sub_2432AC508();
    os_log_type_t v14 = sub_2432AC7B8();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_243282000, v13, v14, a3, v15, 2u);
      MEMORY[0x245678AE0](v15, -1, -1);
    }

    sub_2432A42D0();
  }
  else
  {
    id v16 = (void *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
    uint64_t v17 = *(void *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
    uint64_t v18 = *(void *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v6 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 56))(a1, v17, v18);
    uint64_t v19 = v16[3];
    uint64_t v20 = v16[4];
    __swift_project_boxed_opaque_existential_1(v16, v19);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v20 + 72))(v19, v20)) {
      sub_2432A49A4();
    }
  }
}

void sub_2432A407C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v2 = objc_msgSend(v1, sel_providerMetadata);
  if (!v2) {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v3 = objc_msgSend(v1, sel_providerMetadata);

  if (!v3) {
    objc_msgSend(v1, sel_setProviderMetadata_, v2);
  }
  id v4 = v2;
  oslog = sub_2432AC508();
  os_log_type_t v5 = sub_2432AC7B8();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67240960;
    objc_msgSend(v4, sel_isResetRequested);
    sub_2432AC828();
    *(_WORD *)(v6 + 8) = 1026;
    objc_msgSend(v4, sel_isContentEnumerated);
    sub_2432AC828();
    *(_WORD *)(v6 + 14) = 1026;
    objc_msgSend(v4, sel_isMoreComing);
    sub_2432AC828();

    *(_WORD *)(v6 + 20) = 2050;
    objc_msgSend(v4, sel_itemOffset);

    sub_2432AC828();
    _os_log_impl(&dword_243282000, oslog, v5, "isResetRequested = %{BOOL,public}d, isContentEnumerated = %{BOOL,public}d, isMoreComing = %{BOOL,public}d, itemOffset = %{public}ld", (uint8_t *)v6, 0x1Eu);
    MEMORY[0x245678AE0](v6, -1, -1);
  }
  else
  {
  }
}

void sub_2432A42D0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v2 = objc_msgSend(v1, sel_providerMetadata);
  if (!v2) {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB40]), sel_init);
  }
  id v5 = v2;
  id v3 = objc_msgSend(v1, sel_providerMetadata);

  if (!v3) {
    objc_msgSend(v1, sel_setProviderMetadata_, v5);
  }
  id v4 = (void *)sub_2432AC4B8();
  objc_msgSend(v5, sel_setItemAnchor_, v4);

  objc_msgSend(v5, sel_setItemOffset_, 0);
  objc_msgSend(v5, sel_setIsContentEnumerated_, 0);
  objc_msgSend(v5, sel_setIsMoreComing_, 0);
  objc_msgSend(v1, sel_setProviderMetadata_, v5);
  *(unsigned char *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  sub_2432A49A4();
}

uint64_t sub_2432A45BC(uint64_t a1)
{
  uint64_t v2 = v1;
  v35[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = objc_allocWithZone(MEMORY[0x263EFEA18]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D915E0);
  id v5 = (void *)sub_2432AC668();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_initWithKeysToFetch_, v5);

  int64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    v35[0] = (id)MEMORY[0x263F8EE78];
    sub_24328D780(0, v7, 0);
    id v8 = v35[0];
    uint64_t v9 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v11 = *(v9 - 1);
      uint64_t v10 = *v9;
      v35[0] = v8;
      unint64_t v12 = v8[2];
      unint64_t v13 = v8[3];
      swift_bridgeObjectRetain();
      if (v12 >= v13 >> 1)
      {
        sub_24328D780(v13 > 1, v12 + 1, 1);
        id v8 = v35[0];
      }
      v9 += 2;
      void v8[2] = v12 + 1;
      os_log_type_t v14 = &v8[2 * v12];
      v14[4] = v11;
      v14[5] = v10;
      --v7;
    }
    while (v7);
  }
  id v15 = self;
  id v16 = (void *)sub_2432AC668();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v15, sel_predicateForContactsMatchingExternalUUIDs_, v16);

  objc_msgSend(v6, sel_setPredicate_, v17);
  objc_msgSend(v6, sel_setUnifyResults_, 0);
  uint64_t v18 = *(void **)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_store);
  v35[0] = 0;
  id v19 = objc_msgSend(v18, sel_executeFetchRequest_error_, v6, v35);
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = v35[0];
    id v22 = objc_msgSend(v20, sel_value);

    v35[0] = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D915E8);
    swift_dynamicCast();
    return v34;
  }
  else
  {
    id v24 = v35[0];
    id v25 = (void *)sub_2432AC4A8();

    swift_willThrow();
    id v26 = v25;
    id v27 = v25;
    os_log_type_t v28 = sub_2432AC508();
    os_log_type_t v29 = sub_2432AC7A8();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      id v31 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138543362;
      id v32 = v25;
      id v33 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v35[0] = v33;
      sub_2432AC828();
      *id v31 = v33;

      _os_log_impl(&dword_243282000, v28, v29, "fetchContacts() - failed to fetch: %{public}@", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v31, -1, -1);
      MEMORY[0x245678AE0](v30, -1, -1);
    }
    else
    {
    }
    return MEMORY[0x263F8EE78];
  }
}

void sub_2432A49A4()
{
  uint64_t v1 = v0;
  v35[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 24);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager), v3);
  char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 64))(v3, v4);
  if (v5)
  {
    id v6 = sub_2432AC508();
    os_log_type_t v7 = sub_2432AC7B8();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_243282000, v6, v7, "save() - will notify", v8, 2u);
      MEMORY[0x245678AE0](v8, -1, -1);
    }
  }
  uint64_t v9 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  id v11 = *(id *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_saveRequest);
  id v12 = objc_msgSend(v10, sel_providerIdentifier);
  objc_msgSend(v11, sel_setTransactionAuthor_, v12);

  objc_msgSend(*(id *)(v1 + v9), sel_setIgnoresContactProviderRestrictions_, 1);
  objc_msgSend(*(id *)(v1 + v9), sel_setSuppressChangeNotifications_, (v5 & 1) == 0);
  uint64_t v13 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) == 1)
  {
    objc_msgSend(*(id *)(v1 + v9), sel_updateContainer_, v10);
    *(unsigned char *)(v1 + v13) = 0;
  }
  os_log_type_t v14 = *(void **)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_store);
  uint64_t v15 = *(void *)(v1 + v9);
  v35[0] = 0;
  if (objc_msgSend(v14, sel_executeSaveRequest_error_, v15, v35))
  {
    id v16 = v35[0];
    id v17 = sub_2432AC508();
    os_log_type_t v18 = sub_2432AC7B8();
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_243282000, v17, v18, "save() - did save", v19, 2u);
      MEMORY[0x245678AE0](v19, -1, -1);
    }

    uint64_t v20 = v2[3];
    uint64_t v21 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 80))(v20, v21);
  }
  else
  {
    id v22 = v35[0];
    id v23 = (void *)sub_2432AC4A8();

    swift_willThrow();
    id v24 = v23;
    id v25 = v23;
    id v26 = sub_2432AC508();
    os_log_type_t v27 = sub_2432AC7A8();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v28 = 138543362;
      id v29 = v23;
      uint64_t v30 = v23;
      id v31 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v35[0] = v31;
      sub_2432AC828();
      *uint64_t v34 = v31;

      _os_log_impl(&dword_243282000, v26, v27, "save() - did fail: %{public}@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91050);
      swift_arrayDestroy();
      MEMORY[0x245678AE0](v34, -1, -1);
      MEMORY[0x245678AE0](v28, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB48]), sel_init);
  id v33 = *(void **)(v1 + v9);
  *(void *)(v1 + v9) = v32;
}

id sub_2432A4DEC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91200);
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = (void **)MEMORY[0x263EFE148];
  *(_OWORD *)(v0 + 16) = xmmword_2432AE320;
  uint64_t v2 = *v1;
  uint64_t v3 = (void *)*MEMORY[0x263EFE040];
  *(void *)(v0 + 32) = *v1;
  *(void *)(v0 + 40) = v3;
  uint64_t v4 = (void *)*MEMORY[0x263EFDFC8];
  char v5 = (void *)*MEMORY[0x263EFE038];
  *(void *)(v0 + 48) = *MEMORY[0x263EFDFC8];
  *(void *)(v0 + 56) = v5;
  id v6 = (void *)*MEMORY[0x263EFDFB8];
  os_log_type_t v7 = (void *)*MEMORY[0x263EFE0B8];
  id v8 = (void **)MEMORY[0x263EFE048];
  *(void *)(v0 + 64) = *MEMORY[0x263EFDFB8];
  *(void *)(v0 + 72) = v7;
  uint64_t v9 = *v8;
  uint64_t v10 = (void *)*MEMORY[0x263EFE050];
  *(void *)(v0 + 80) = *v8;
  *(void *)(v0 + 88) = v10;
  id v11 = (void *)*MEMORY[0x263EFE068];
  uint64_t v53 = (void *)*MEMORY[0x263EFDF70];
  uint64_t v12 = *MEMORY[0x263EFDF70];
  *(void *)(v0 + 96) = *MEMORY[0x263EFE068];
  *(void *)(v0 + 104) = v12;
  uint64_t v52 = (void *)*MEMORY[0x263EFE018];
  uint64_t v54 = (void *)*MEMORY[0x263EFE088];
  uint64_t v13 = *MEMORY[0x263EFE088];
  os_log_type_t v14 = (void **)MEMORY[0x263EFE090];
  *(void *)(v0 + 112) = *MEMORY[0x263EFE018];
  *(void *)(v0 + 120) = v13;
  uint64_t v55 = *v14;
  uint64_t v58 = (void *)*MEMORY[0x263EFE080];
  uint64_t v15 = *MEMORY[0x263EFE080];
  *(void *)(v0 + 128) = v55;
  *(void *)(v0 + 136) = v15;
  uint64_t v56 = (void *)*MEMORY[0x263EFE098];
  id v59 = (void *)*MEMORY[0x263EFDFF8];
  uint64_t v16 = *MEMORY[0x263EFDFF8];
  *(void *)(v0 + 144) = *MEMORY[0x263EFE098];
  *(void *)(v0 + 152) = v16;
  uint64_t v57 = (void *)*MEMORY[0x263EFE070];
  unint64_t v60 = (void *)*MEMORY[0x263EFDF80];
  uint64_t v17 = *MEMORY[0x263EFDF80];
  os_log_type_t v18 = (void **)MEMORY[0x263EFE0A0];
  *(void *)(v0 + 160) = *MEMORY[0x263EFE070];
  *(void *)(v0 + 168) = v17;
  v61 = *v18;
  id v64 = (void *)*MEMORY[0x263EFE150];
  uint64_t v19 = *MEMORY[0x263EFE150];
  *(void *)(v0 + 176) = v61;
  *(void *)(v0 + 184) = v19;
  v62 = (void *)*MEMORY[0x263EFE0F8];
  id v65 = (void *)*MEMORY[0x263EFE110];
  uint64_t v20 = *MEMORY[0x263EFE110];
  *(void *)(v0 + 192) = *MEMORY[0x263EFE0F8];
  *(void *)(v0 + 200) = v20;
  v63 = (void *)*MEMORY[0x263EFE010];
  char v66 = (void *)*MEMORY[0x263EFDF48];
  uint64_t v21 = *MEMORY[0x263EFDF48];
  id v22 = (void **)MEMORY[0x263EFE058];
  *(void *)(v0 + 208) = *MEMORY[0x263EFE010];
  *(void *)(v0 + 216) = v21;
  id v23 = *v22;
  v67 = *v22;
  uint64_t v24 = *MEMORY[0x263EFDF68];
  uint64_t v69 = (void *)*MEMORY[0x263EFDF68];
  *(void *)(v0 + 224) = v23;
  *(void *)(v0 + 232) = v24;
  v68 = (void *)*MEMORY[0x263EFDFB0];
  *(void *)(v0 + 240) = *MEMORY[0x263EFDFB0];
  uint64_t v70 = v0;
  sub_2432AC688();
  qword_268D91560 = v70;
  id v25 = v2;
  id v26 = v3;
  id v27 = v4;
  id v28 = v5;
  id v29 = v6;
  id v30 = v7;
  id v31 = v9;
  id v32 = v10;
  id v33 = v11;
  id v34 = v53;
  id v35 = v52;
  id v36 = v54;
  id v37 = v55;
  id v38 = v58;
  id v39 = v56;
  id v40 = v59;
  id v41 = v57;
  id v42 = v60;
  id v43 = v61;
  id v44 = v64;
  id v45 = v62;
  id v46 = v65;
  id v47 = v63;
  id v48 = v66;
  id v49 = v67;
  id v50 = v69;

  return v68;
}

uint64_t sub_2432A50F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_logger;
  uint64_t v2 = sub_2432AC528();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_stampedeManager);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2432A51F4()
{
  return type metadata accessor for ProviderStore();
}

uint64_t type metadata accessor for ProviderStore()
{
  uint64_t result = qword_268D91570;
  if (!qword_268D91570) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2432A5248()
{
  uint64_t result = sub_2432AC528();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2432A5308()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*v0
                                                             + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container), sel_externalIdentifier));
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2432AC5F8();

  return v3;
}

void sub_2432A537C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_container);
  uint64_t v3 = (void *)sub_2432AC5E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setExternalIdentifier_, v3);

  *(unsigned char *)(v1 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
}

void (*sub_2432A53EC(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = *v1;
  uint64_t v4 = OBJC_IVAR____TtC15ContactProvider13ProviderStore_container;
  a1[2] = *v1;
  a1[3] = v4;
  id v5 = objc_msgSend(*(id *)(v3 + v4), sel_externalIdentifier);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_2432AC5F8();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xE000000000000000;
  }
  *a1 = v7;
  a1[1] = v9;
  return sub_2432A5480;
}

void sub_2432A5480(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)(v2 + *(void *)(a1 + 24));
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_2432AC5E8();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setExternalIdentifier_, v4);

    *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = (void *)sub_2432AC5E8();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setExternalIdentifier_, v5);

    *(unsigned char *)(v2 + OBJC_IVAR____TtC15ContactProvider13ProviderStore_isContainerDirty) = 1;
  }
}

uint64_t sub_2432A5560(void *a1, uint64_t a2)
{
  return sub_2432A233C(a1, a2);
}

uint64_t sub_2432A5584(uint64_t a1)
{
  return sub_2432A2348(a1);
}

uint64_t sub_2432A55A8(void *a1, uint64_t a2)
{
  return sub_2432A31C0(a1, a2);
}

uint64_t sub_2432A55CC(uint64_t a1)
{
  return sub_2432A32AC(a1);
}

unint64_t sub_2432A55F0()
{
  return (unint64_t)sub_2432A34B8() & 1;
}

void sub_2432A5618(uint64_t *a1@<X8>)
{
}

void sub_2432A563C(uint64_t *a1@<X8>)
{
}

void sub_2432A5660(uint64_t a1)
{
}

void sub_2432A5684()
{
}

void sub_2432A56A8(uint64_t a1)
{
}

void sub_2432A56CC(uint64_t a1, char a2)
{
}

void sub_2432A56F0(uint64_t a1)
{
}

void sub_2432A5714()
{
}

void *sub_2432A5738(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D91628);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2432A7100(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2432A5848(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268D91610);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2432A773C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2432A5958(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2432A5980(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2432A59F8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2432AC828();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2432A59F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2432A5ACC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24328E964((uint64_t)v12, *a3);
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
      sub_24328E964((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2432A5ACC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2432AC838();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2432A5C88(a5, a6);
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
  uint64_t v8 = sub_2432AC8D8();
  if (!v8)
  {
    sub_2432AC958();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2432AC9A8();
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

uint64_t sub_2432A5C88(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2432A5D20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2432A5F00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2432A5F00(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2432A5D20(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2432A5E98(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2432AC898();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2432AC958();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2432AC648();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2432AC9A8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2432AC958();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2432A5E98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91620);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2432A5F00(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D91620);
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
  uint64_t result = sub_2432AC9A8();
  __break(1u);
  return result;
}

unint64_t sub_2432A6050(uint64_t a1, uint64_t a2)
{
  sub_2432ACAF8();
  sub_2432AC628();
  uint64_t v4 = sub_2432ACB18();

  return sub_2432A60C8(a1, a2, v4);
}

unint64_t sub_2432A60C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2432ACA28() & 1) == 0)
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
      while (!v14 && (sub_2432ACA28() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2432A61AC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2432ACAF8();
  swift_bridgeObjectRetain();
  sub_2432AC628();
  uint64_t v8 = sub_2432ACB18();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2432ACA28() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      os_log_type_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2432ACA28() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2432A663C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2432A635C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91608);
  uint64_t v3 = sub_2432AC878();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
      sub_2432ACAF8();
      sub_2432AC628();
      uint64_t result = sub_2432ACB18();
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

uint64_t sub_2432A663C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2432A635C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2432A67D8();
      goto LABEL_22;
    }
    sub_2432A698C();
  }
  uint64_t v11 = *v4;
  sub_2432ACAF8();
  sub_2432AC628();
  uint64_t result = sub_2432ACB18();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2432ACA28(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2432ACA58();
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
          uint64_t result = sub_2432ACA28();
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

void *sub_2432A67D8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91608);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2432AC868();
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

uint64_t sub_2432A698C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91608);
  uint64_t v3 = sub_2432AC878();
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
    sub_2432ACAF8();
    swift_bridgeObjectRetain();
    sub_2432AC628();
    uint64_t result = sub_2432ACB18();
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

uint64_t sub_2432A6C3C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91600);
  char v38 = a2;
  uint64_t v6 = sub_2432AC988();
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
  id v35 = v2;
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
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    id v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_2432ACAF8();
    sub_2432AC628();
    uint64_t result = sub_2432ACB18();
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

id sub_2432A6F4C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91600);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2432AC978();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
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

uint64_t sub_2432A7100(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2432AC9A8();
  __break(1u);
  return result;
}

void *sub_2432A71F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = (unsigned char *)(swift_bridgeObjectRetain() + 56);
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v5 = *((void *)v2 - 2);
    uint64_t v4 = *((void *)v2 - 1);
    if (*v2)
    {
      unint64_t v6 = (void *)*((void *)v2 - 3);
      id v7 = v6;
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_2432AC508();
      os_log_type_t v9 = sub_2432AC7A8();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = v3;
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_243282000, v8, v9, "update contact items - failed to map a contact's identifier", v11, 2u);
        unint64_t v12 = v11;
        uint64_t v3 = v10;
        MEMORY[0x245678AE0](v12, -1, -1);
      }

      sub_243289E40(v6);
    }
    else
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_2432A5738(0, v3[2] + 1, 1, v3);
      }
      unint64_t v14 = v3[2];
      unint64_t v13 = v3[3];
      if (v14 >= v13 >> 1) {
        uint64_t v3 = sub_2432A5738((void *)(v13 > 1), v14 + 1, 1, v3);
      }
      v3[2] = v14 + 1;
      unint64_t v15 = &v3[2 * v14];
      v15[4] = v5;
      v15[5] = v4;
    }
    v2 += 32;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_2432A73B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_2432AC788();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2432A61AC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2432A744C(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v4 = 0;
  uint64_t v32 = result + 32;
  uint64_t v30 = MEMORY[0x263F8EE78];
  uint64_t v34 = a2 + 56;
  unint64_t v31 = *(void *)(result + 16);
  do
  {
    if (v4 <= v2) {
      unint64_t v5 = v2;
    }
    else {
      unint64_t v5 = v4;
    }
    unint64_t v33 = v5;
    while (1)
    {
      if (v4 == v33)
      {
        __break(1u);
        return result;
      }
      uint64_t v6 = v32 + 32 * v4;
      uint64_t v7 = *(void **)v6;
      uint64_t v8 = *(void *)(v6 + 8);
      uint64_t v9 = *(void *)(v6 + 16);
      ++v4;
      if (*(unsigned char *)(v6 + 24))
      {
        id v10 = v7;
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_2432AC508();
        os_log_type_t v12 = sub_2432AC7A8();
        if (os_log_type_enabled(v11, v12))
        {
          unint64_t v13 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v13 = 0;
          _os_log_impl(&dword_243282000, v11, v12, "update contact items - failed filter an add item", v13, 2u);
          unint64_t v14 = v13;
          unint64_t v2 = v31;
          MEMORY[0x245678AE0](v14, -1, -1);
        }

        goto LABEL_8;
      }
      uint64_t v15 = *(void *)(a2 + 16);
      swift_bridgeObjectRetain_n();
      id v16 = v7;
      if (!v15) {
        goto LABEL_28;
      }
      sub_2432ACAF8();
      sub_2432AC628();
      uint64_t v17 = sub_2432ACB18();
      uint64_t v18 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v19 = v17 & ~v18;
      if (((*(void *)(v34 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        goto LABEL_28;
      }
      uint64_t v20 = *(void *)(a2 + 48);
      int64_t v21 = (void *)(v20 + 16 * v19);
      BOOL v22 = *v21 == v8 && v9 == v21[1];
      if (!v22 && (sub_2432ACA28() & 1) == 0) {
        break;
      }
LABEL_27:
      swift_bridgeObjectRelease();
      unint64_t v2 = v31;
LABEL_8:
      uint64_t result = sub_243289E40(v7);
      if (v4 == v2) {
        return v30;
      }
    }
    uint64_t v23 = ~v18;
    while (1)
    {
      unint64_t v19 = (v19 + 1) & v23;
      if (((*(void *)(v34 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        break;
      }
      int64_t v24 = (void *)(v20 + 16 * v19);
      BOOL v25 = *v24 == v8 && v9 == v24[1];
      if (v25 || (sub_2432ACA28() & 1) != 0) {
        goto LABEL_27;
      }
    }
LABEL_28:
    swift_bridgeObjectRelease();
    uint64_t v26 = v30;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_24328D7A0(0, *(void *)(v30 + 16) + 1, 1);
      uint64_t v26 = v30;
    }
    unint64_t v28 = *(void *)(v26 + 16);
    unint64_t v27 = *(void *)(v26 + 24);
    if (v28 >= v27 >> 1)
    {
      uint64_t result = sub_24328D7A0(v27 > 1, v28 + 1, 1);
      uint64_t v26 = v30;
    }
    *(void *)(v26 + 16) = v28 + 1;
    uint64_t v30 = v26;
    uint64_t v29 = v26 + 32 * v28;
    *(void *)(v29 + 32) = v7;
    *(void *)(v29 + 40) = v8;
    *(void *)(v29 + 48) = v9;
    *(unsigned char *)(v29 + 56) = 0;
    unint64_t v2 = v31;
  }
  while (v4 != v31);
  return v30;
}

uint64_t sub_2432A773C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2432AC9A8();
  __break(1u);
  return result;
}

uint64_t static DefaultContactProviderDomain.identifier.getter()
{
  if (qword_268D90D30 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268D91640;
  swift_bridgeObjectRetain();
  return v0;
}

ContactProvider::DefaultContactProviderDomain __swiftcall DefaultContactProviderDomain.init()()
{
  uint64_t v1 = v0;
  unint64_t v2 = sub_24328D628(MEMORY[0x263F8EE78]);
  void *v1 = 0;
  v1[1] = 0xE000000000000000;
  v1[2] = v2;
  result.userInfo._rawValue = v4;
  result.displayName._object = v3;
  result.displayName._countAndFlagsBits = v2;
  return result;
}

void __swiftcall CustomContactProviderDomain.init(identifier:)(ContactProvider::CustomContactProviderDomain *__return_ptr retstr, Swift::String identifier)
{
  object = identifier._object;
  uint64_t countAndFlagsBits = identifier._countAndFlagsBits;
  unint64_t v5 = (void *)sub_24328D628(MEMORY[0x263F8EE78]);
  retstr->identifier._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->identifier._object = object;
  retstr->displayName._uint64_t countAndFlagsBits = 0;
  retstr->displayName._object = (void *)0xE000000000000000;
  retstr->userInfo._rawValue = v5;
}

uint64_t DefaultContactProviderDomain.identifier.getter()
{
  if (qword_268D90D30 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268D91640;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_2432A7984()
{
  *(_WORD *)&algn_268D91648[6] = -4864;
}

uint64_t DefaultContactProviderDomain.displayName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DefaultContactProviderDomain.userInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2432A79EC()
{
  if (qword_268D90D30 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268D91640;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_2432A7A54()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2432A7A84()
{
  return swift_bridgeObjectRetain();
}

uint64_t CustomContactProviderDomain.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CustomContactProviderDomain.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CustomContactProviderDomain.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*CustomContactProviderDomain.displayName.modify())()
{
  return nullsub_1;
}

uint64_t CustomContactProviderDomain.userInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CustomContactProviderDomain.userInfo.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*CustomContactProviderDomain.userInfo.modify())()
{
  return nullsub_1;
}

uint64_t sub_2432A7B98()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2432A7BC8()
{
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of ContactProviderDomain.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ContactProviderDomain.displayName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ContactProviderDomain.userInfo.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t destroy for DefaultContactProviderDomain()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s15ContactProvider28DefaultContactProviderDomainVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DefaultContactProviderDomain(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DefaultContactProviderDomain(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultContactProviderDomain(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultContactProviderDomain(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for DefaultContactProviderDomain()
{
  return &type metadata for DefaultContactProviderDomain;
}

uint64_t destroy for CustomContactProviderDomain()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CustomContactProviderDomain(void *a1, void *a2)
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

void *assignWithCopy for CustomContactProviderDomain(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CustomContactProviderDomain(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomContactProviderDomain(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomContactProviderDomain(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CustomContactProviderDomain()
{
  return &type metadata for CustomContactProviderDomain;
}

uint64_t withTimeout<A>(_:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  void v6[3] = a2;
  uint64_t v7 = sub_2432AC918();
  v6[8] = v7;
  v6[9] = *(void *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = swift_task_alloc();
  uint64_t v8 = sub_2432AC938();
  v6[12] = v8;
  v6[13] = *(void *)(v8 - 8);
  v6[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2432A8138, 0, 0);
}

uint64_t sub_2432A8138()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  sub_2432AC928();
  sub_2432AC8F8();
  MEMORY[0x245678240](v5, v4);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 120) = v6;
  *(void *)(v0 + 128) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 136) = v7;
  uint64_t v8 = sub_2432ABEA4(&qword_268D91458, MEMORY[0x263F8F740]);
  *(void *)uint64_t v7 = v0;
  *(void *)(v7 + 8) = sub_2432A82AC;
  uint64_t v9 = *(void *)(v0 + 112);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 56);
  uint64_t v12 = *(void *)(v0 + 16);
  long long v13 = *(_OWORD *)(v0 + 40);
  *(void *)(v7 + 64) = *(void *)(v0 + 96);
  *(void *)(v7 + 72) = v8;
  *(void *)(v7 + 56) = v11;
  *(_OWORD *)(v7 + 40) = v13;
  *(void *)(v7 + 24) = v10;
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 16) = v12;
  return MEMORY[0x270FA2498](sub_2432A8814, 0, 0);
}

uint64_t sub_2432A82AC()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2432A8478;
  }
  else {
    uint64_t v2 = sub_2432A83C0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432A83C0()
{
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  (*(void (**)(void, void))(v0 + 120))(*(void *)(v0 + 88), *(void *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2432A8478()
{
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  (*(void (**)(void, void))(v0 + 120))(*(void *)(v0 + 88), *(void *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2432A8530(char a1, char a2)
{
  sub_243286BA8();
  uint64_t v3 = sub_2432ACA18();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
  }
  else
  {
    uint64_t v4 = (void *)swift_allocError();
    unsigned char *v5 = a1;
  }
  char v11 = a2;
  uint64_t v6 = sub_2432ACA18();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = (void *)swift_allocError();
    *uint64_t v8 = v11;
  }
  char v9 = == infix(_:_:)();

  return v9 & 1;
}

uint64_t sub_2432A861C()
{
  sub_2432A1154();
  uint64_t v0 = sub_2432ACA18();
  if (!v0) {
    uint64_t v0 = swift_allocError();
  }
  uint64_t v1 = (void *)v0;
  uint64_t v2 = sub_2432ACA18();
  if (!v2) {
    uint64_t v2 = swift_allocError();
  }
  uint64_t v3 = (void *)v2;
  char v4 = == infix(_:_:)();

  return v4 & 1;
}

uint64_t AsyncTimeoutError.hash(into:)()
{
  return sub_2432ACB08();
}

uint64_t AsyncTimeoutError.hashValue.getter()
{
  return sub_2432ACB18();
}

uint64_t sub_2432A873C()
{
  return sub_2432ACB18();
}

uint64_t sub_2432A8780()
{
  return sub_2432ACB08();
}

uint64_t sub_2432A87A8()
{
  return sub_2432ACB18();
}

uint64_t withDeadline<A, B>(_:clock:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  void v8[2] = a1;
  v8[3] = a2;
  return MEMORY[0x270FA2498](sub_2432A8814, 0, 0);
}

uint64_t sub_2432A8814()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  long long v3 = *(_OWORD *)(v0 + 40);
  long long v4 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 56);
  *(void *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  *(_OWORD *)(v2 + 56) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v5;
  void *v5 = v0;
  v5[1] = sub_2432A8910;
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x270FA22B8](v7, v6, v6, 0, 0, &unk_268D91668, v2, v6);
}

uint64_t sub_2432A8910()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2432A8A4C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2432A8A4C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t withTimeout<A, B>(_:clock:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  void v8[2] = a1;
  v8[3] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[10] = AssociatedTypeWitness;
  v8[11] = *(void *)(AssociatedTypeWitness - 8);
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2432A8BA4, 0, 0);
}

uint64_t sub_2432A8BA4()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 88);
  sub_2432ACA78();
  swift_getAssociatedConformanceWitness();
  sub_2432AC8E8();
  long long v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 112) = v4;
  *(void *)(v0 + 120) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v4(v1, v2);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 128) = v5;
  *(void *)uint64_t v5 = v0;
  *(void *)(v5 + 8) = sub_2432A8CF8;
  uint64_t v6 = *(void *)(v0 + 104);
  uint64_t v7 = *(void *)(v0 + 16);
  long long v8 = *(_OWORD *)(v0 + 32);
  long long v9 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v5 + 48) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v5 + 64) = v9;
  *(_OWORD *)(v5 + 32) = v8;
  *(void *)(v5 + 16) = v7;
  *(void *)(v5 + 24) = v6;
  return MEMORY[0x270FA2498](sub_2432A8814, 0, 0);
}

uint64_t sub_2432A8CF8()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2432A8E8C;
  }
  else {
    uint64_t v2 = sub_2432A8E0C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432A8E0C()
{
  (*(void (**)(void, void))(v0 + 112))(*(void *)(v0 + 104), *(void *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2432A8E8C()
{
  (*(void (**)(void, void))(v0 + 112))(*(void *)(v0 + 104), *(void *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2432A8F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a8;
  v8[10] = v16;
  v8[7] = a6;
  v8[8] = a7;
  v8[5] = a4;
  v8[6] = a5;
  v8[3] = a2;
  v8[4] = a3;
  void v8[2] = a1;
  uint64_t v10 = sub_2432AC818();
  v8[11] = v10;
  v8[12] = *(void *)(v10 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  uint64_t v11 = *(void *)(a8 - 8);
  v8[15] = v11;
  v8[16] = *(void *)(v11 + 64);
  v8[17] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[18] = AssociatedTypeWitness;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  v8[19] = v13;
  v8[20] = *(void *)(v13 + 64);
  v8[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  v8[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2432A9108, 0, 0);
}

uint64_t sub_2432A9108()
{
  uint64_t v1 = v0[22];
  uint64_t v21 = v0[21];
  uint64_t v23 = v0[20];
  uint64_t v18 = v0[19];
  uint64_t v24 = v0[18];
  uint64_t v22 = v0[17];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[8];
  uint64_t v19 = v0[15];
  uint64_t v20 = v0[7];
  uint64_t v5 = v0[5];
  uint64_t v17 = v0[6];
  uint64_t v15 = v0[4];
  uint64_t v6 = sub_2432AC718();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  long long v8 = (void *)swift_allocObject();
  void v8[2] = 0;
  v8[3] = 0;
  v8[4] = v4;
  v8[5] = v2;
  v8[6] = v3;
  v8[7] = v15;
  v8[8] = v5;
  swift_retain();
  v0[23] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  uint64_t v16 = sub_2432AC778();
  sub_2432AB264(v1, (uint64_t)&unk_268D91688, (uint64_t)v8);
  sub_2432ABB58(v1);
  v7(v1, 1, 1, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, v17, v24);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v22, v20, v2);
  unint64_t v9 = (*(unsigned __int8 *)(v18 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  unint64_t v10 = (v23 + *(unsigned __int8 *)(v19 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 4) = v4;
  *((void *)v11 + 5) = v2;
  *((void *)v11 + 6) = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(&v11[v9], v21, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(&v11[v10], v22, v2);
  sub_2432AB264(v1, (uint64_t)&unk_268D91698, (uint64_t)v11);
  sub_2432ABB58(v1);
  uint64_t v12 = (void *)swift_task_alloc();
  v0[24] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_2432A9424;
  uint64_t v13 = v0[14];
  return MEMORY[0x270FA2048](v13, 0, 0, v16);
}

uint64_t sub_2432A9424()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2432A9798;
  }
  else {
    uint64_t v2 = sub_2432A9538;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432A9538()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[8];
  sub_2432AC768();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v1, 1, v5);
  long long v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  if (v7 == 1)
  {
    uint64_t v9 = v0[14];
    uint64_t v10 = v0[11];
    v8(v0[13], v10);
    sub_2432AC6F8();
    sub_2432ABEA4(&qword_268D91450, MEMORY[0x263F8F488]);
    swift_allocError();
    sub_2432AC5B8();
    swift_willThrow();
    v8(v9, v10);
  }
  else
  {
    uint64_t v12 = v0[13];
    uint64_t v13 = v0[8];
    uint64_t v14 = v0[2];
    v8(v0[14], v0[11]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v14, v12, v13);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_2432A9798()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2432A9834(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v11 = v2[8];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_243284460;
  return sub_2432A8F0C(a1, a2, v8, v9, v10, v11, v6, v7);
}

uint64_t sub_2432A9924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a1;
  v8[7] = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  v8[12] = sub_2432AC6E8();
  uint64_t v9 = sub_2432AC818();
  v8[13] = v9;
  v8[14] = *(void *)(v9 - 8);
  v8[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2432A9A1C, 0, 0);
}

uint64_t sub_2432A9A1C()
{
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v0 + 96) - 8) + 56))(v1, 1, 1);
  uint64_t v4 = sub_2432ABF54();
  *(void *)(v0 + 128) = v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D91480);
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 136) = inited;
  *(_DWORD *)(inited + 24) = 0;
  *(void *)(inited + 16) = 0;
  sub_2432AC738();
  uint64_t v7 = *(void *)(v0 + 80);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 144) = v9;
  long long v10 = *(_OWORD *)(v0 + 56);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = v7;
  *(void *)(v9 + 32) = v6;
  *(void *)(v9 + 40) = v4;
  *(void *)(v9 + 48) = inited;
  *(_OWORD *)(v9 + 56) = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v11;
  void v11[2] = v8;
  void v11[3] = v7;
  v11[4] = v6;
  v11[5] = inited;
  v11[6] = v4;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_2432A9C3C;
  uint64_t v13 = *(void *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 48);
  return MEMORY[0x270FA2338](v14, &unk_268D916A8, v9, sub_2432AC0A4, v11, 0, 0, v13);
}

uint64_t sub_2432A9C3C()
{
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2432A9DEC;
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = sub_2432A9D60;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432A9D60()
{
  swift_setDeallocating();
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2432A9DEC()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2432A9E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  void v8[2] = a1;
  v8[3] = a2;
  return MEMORY[0x270FA2498](sub_2432A9EA8, 0, 0);
}

uint64_t sub_2432A9EA8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  long long v3 = *(_OWORD *)(v0 + 24);
  long long v4 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 56);
  *(void *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  *(_OWORD *)(v2 + 56) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v5;
  void *v5 = v0;
  v5[1] = sub_2432A9FAC;
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v7, 0, 0, 0xD00000000000001CLL, 0x80000002432B18D0, sub_2432AC0D4, v2, v6);
}

uint64_t sub_2432A9FAC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2432AC338, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

void sub_2432AA0E8(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  sub_2432AC6E8();
  sub_2432AC818();
  uint64_t v5 = a2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a2 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(void *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2432AC0E8(v5);
  os_unfair_lock_unlock(v6);
  uint64_t v7 = (uint64_t *)&a3[4];
  a3 += 6;
  os_unfair_lock_lock(a3);
  sub_2432AC108(v7);
  os_unfair_lock_unlock(a3);
}

uint64_t sub_2432AA21C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  uint64_t v4 = sub_2432AC6E8();
  uint64_t v5 = sub_2432AC818();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  uint64_t v6 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v4);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v4);
}

uint64_t sub_2432AA32C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_release();
  uint64_t v17 = sub_2432AC718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  void v18[4] = a5;
  void v18[5] = a6;
  v18[6] = a7;
  v18[7] = a2;
  v18[8] = a3;
  v18[9] = a4;
  swift_retain();
  swift_retain();
  uint64_t result = sub_24329BA84((uint64_t)v16, (uint64_t)&unk_268D916B8, (uint64_t)v18);
  *a1 = result;
  return result;
}

uint64_t sub_2432AA47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a8;
  v8[7] = v11;
  v8[4] = a6;
  v8[5] = a7;
  void v8[2] = a4;
  v8[3] = a5;
  v8[8] = *(void *)(a7 - 8);
  v8[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2432AA540, 0, 0);
}

uint64_t sub_2432AA540()
{
  sub_2432AC738();
  uint64_t v4 = (uint64_t (*)(uint64_t))(v0[2] + *(int *)v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[10] = v1;
  void *v1 = v0;
  v1[1] = sub_2432AA744;
  uint64_t v2 = v0[9];
  return v4(v2);
}

uint64_t sub_2432AA744()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2432AA9B8;
  }
  else {
    uint64_t v2 = sub_2432AA858;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432AA858()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = swift_task_alloc();
  long long v10 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v5 + 16) = v10;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  sub_2432AC6E8();
  sub_2432AC818();
  uint64_t v6 = v4 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v4 + 16);
  uint64_t v7 = (os_unfair_lock_s *)(v4 + ((*(unsigned int *)(*(void *)v4 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  sub_2432AC280(v6);
  os_unfair_lock_unlock(v7);
  swift_task_dealloc();
  (*(void (**)(uint64_t, void))(v2 + 8))(v1, v10);
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_2432AA9B8()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v4 + 32) = v2;
  *(void *)(v4 + 40) = v1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  sub_2432AC6E8();
  sub_2432AC818();
  uint64_t v5 = v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2432AC260(v5);
  os_unfair_lock_unlock(v6);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2432AAAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  uint64_t v9 = sub_2432AC6E8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v15 - v11;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, a3);
    sub_2432AC6D8();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  uint64_t v13 = sub_2432AC818();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, 1, 1, v9);
}

uint64_t sub_2432AAD34(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  uint64_t v4 = sub_2432AC6E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - v6;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v11[1] = a2;
    id v8 = a2;
    sub_2432AC6C8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v9 = sub_2432AC818();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
}

void sub_2432AAEE4(os_unfair_lock_s *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)&a1[4];
  uint64_t v4 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_2432AAFFC(v3, &v7);
  os_unfair_lock_unlock(v4);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  sub_2432AC6E8();
  sub_2432AC818();
  uint64_t v5 = a2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a2 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(void *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2432AC0B4(v5);
  os_unfair_lock_unlock(v6);
}

uint64_t *sub_2432AAFFC@<X0>(uint64_t *result@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result) {
    uint64_t result = (uint64_t *)sub_2432AC728();
  }
  *a2 = v3 == 0;
  return result;
}

uint64_t sub_2432AB064(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D91048);
  uint64_t v2 = sub_2432AC6E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v9 - v4;
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    sub_2432AC6F8();
    sub_2432ABEA4(&qword_268D91450, MEMORY[0x263F8F488]);
    uint64_t v6 = swift_allocError();
    sub_2432AC5B8();
    v9[1] = v6;
    sub_2432AC6C8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v7 = sub_2432AC818();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
}

uint64_t sub_2432AB264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2432ABEEC(a1, (uint64_t)v9);
  uint64_t v10 = sub_2432AC718();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_2432ABB58((uint64_t)v9);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_2432AC6B8();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2432AC708();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = *v4;
  uint64_t v16 = (void *)(v14 | v12);
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    uint64_t v16 = v19;
    v19[2] = v12;
    uint64_t v19[3] = v14;
  }
  v18[1] = 1;
  v18[2] = v16;
  v18[3] = v15;
  swift_task_create();
  return swift_release();
}

uint64_t sub_2432AB438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a7;
  v8[5] = a8;
  void v8[2] = a4;
  v8[3] = a5;
  v8[6] = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_2432AC818();
  v8[7] = v9;
  v8[8] = *(void *)(v9 - 8);
  v8[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2432AB524, 0, 0);
}

uint64_t sub_2432AB524()
{
  sub_2432AC738();
  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0[6] - 8) + 56))(v0[9], 1, 1);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[10] = v1;
  void *v1 = v0;
  v1[1] = sub_2432AB650;
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[2];
  uint64_t v5 = v0[3];
  return MEMORY[0x270FA1FF8](v6, v2, v5, v3, v4);
}

uint64_t sub_2432AB650()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_2432AB850;
  }
  else {
    uint64_t v5 = sub_2432AB7C0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2432AB7C0()
{
  sub_2432A1154();
  swift_allocError();
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2432AB850()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_2432AB8B8()
{
  unint64_t result = qword_268D91678;
  if (!qword_268D91678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268D91678);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AsyncTimeoutError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AsyncTimeoutError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
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
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2432AB9FCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2432ABA24()
{
  return 0;
}

ValueMetadata *type metadata accessor for AsyncTimeoutError()
{
  return &type metadata for AsyncTimeoutError;
}

uint64_t sub_2432ABA3C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2432ABA7C(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_243286FB0;
  return sub_2432A9924(a1, v6, v7, v9, v10, v4, v5, v8);
}

uint64_t sub_2432ABB58(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2432ABBB8()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 56) & ~v4;
  uint64_t v6 = *(void *)(v1 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + *(void *)(v3 + 64) + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v4 | v7 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v1);

  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_2432ABD1C(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v6 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = (uint64_t)v1 + v9;
  uint64_t v13 = (uint64_t)v1
      + ((v9 + *(void *)(v8 + 64) + *(unsigned __int8 *)(*(void *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v14;
  void *v14 = v3;
  v14[1] = sub_243286FB0;
  return sub_2432AB438(a1, v10, v11, v12, v13, v6, v5, v7);
}

uint64_t sub_2432ABEA4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2432ABEEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D91420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2432ABF54()
{
  return sub_2432AC8B8();
}

uint64_t sub_2432ABFD0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 40);
  long long v7 = *(_OWORD *)(v1 + 56);
  long long v8 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_243286FB0;
  *(void *)(v5 + 72) = v4;
  *(_OWORD *)(v5 + 56) = v8;
  *(_OWORD *)(v5 + 40) = v7;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2432A9EA8, 0, 0);
}

void sub_2432AC0A4()
{
  sub_2432AAEE4(*(os_unfair_lock_s **)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_2432AC0B4(uint64_t a1)
{
  return sub_2432AB064(a1);
}

void sub_2432AC0D4(uint64_t a1)
{
  sub_2432AA0E8(a1, *(void *)(v1 + 40), *(os_unfair_lock_s **)(v1 + 48));
}

uint64_t sub_2432AC0E8(uint64_t a1)
{
  return sub_2432AA21C(a1, *(void *)(v1 + 40));
}

uint64_t sub_2432AC108(uint64_t *a1)
{
  return sub_2432AA32C(a1, v1[5], v1[6], v1[7], v1[2], v1[3], v1[4]);
}

uint64_t sub_2432AC12C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_2432AC174(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v9 = v1[9];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_243284460;
  return sub_2432AA47C(a1, v6, v7, v8, v10, v9, v4, v5);
}

uint64_t sub_2432AC260(uint64_t a1)
{
  return sub_2432AAD34(a1, *(void **)(v1 + 40));
}

uint64_t sub_2432AC280(uint64_t a1)
{
  return sub_2432AAAFC(a1, *(void *)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t sub_2432AC2A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(v4 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v4 + *MEMORY[0x263F8DD00]) - 8) + 16))(a2, v3);
}

uint64_t sub_2432AC33C(uint64_t result)
{
  *(unsigned char *)(v1 + 112) = result;
  return result;
}

uint64_t sub_2432AC344(uint64_t result)
{
  *(unsigned char *)(v1 + 113) = result;
  return result;
}

uint64_t ExtensionState.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ExtensionState.__deallocating_deinit()
{
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t ExtensionState.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_2432AC3A8()
{
  return v0;
}

uint64_t type metadata accessor for ExtensionState()
{
  return self;
}

uint64_t method lookup function for ExtensionState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ExtensionState);
}

uint64_t dispatch thunk of ExtensionState.setShouldInvalidate(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of ExtensionState.setIsSynchronizing(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t sub_2432AC438()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_2432AC448()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2432AC458()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2432AC468()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2432AC478()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2432AC488()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2432AC498()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2432AC4A8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2432AC4B8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2432AC4C8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2432AC4D8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2432AC4E8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2432AC4F8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2432AC508()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2432AC518()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2432AC528()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2432AC538()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_2432AC548()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2432AC558()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2432AC568()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2432AC578()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2432AC588()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2432AC598()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2432AC5A8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2432AC5B8()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_2432AC5C8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2432AC5D8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2432AC5E8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2432AC5F8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2432AC608()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2432AC618()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_2432AC628()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2432AC638()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2432AC648()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2432AC658()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2432AC668()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2432AC678()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2432AC688()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2432AC698()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2432AC6A8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2432AC6B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2432AC6C8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2432AC6D8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2432AC6E8()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_2432AC6F8()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2432AC708()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2432AC718()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2432AC728()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2432AC738()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2432AC768()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_2432AC778()
{
  return MEMORY[0x270FA2070]();
}

uint64_t sub_2432AC788()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2432AC798()
{
  return MEMORY[0x270FA2BC0]();
}

uint64_t sub_2432AC7A8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2432AC7B8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2432AC7C8()
{
  return MEMORY[0x270EE4080]();
}

uint64_t sub_2432AC7D8()
{
  return MEMORY[0x270EE4088]();
}

uint64_t sub_2432AC7F8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2432AC808()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2432AC818()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2432AC828()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2432AC838()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2432AC848()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2432AC858()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2432AC868()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2432AC878()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2432AC888()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2432AC898()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2432AC8A8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2432AC8B8()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_2432AC8C8()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_2432AC8D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2432AC8E8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2432AC8F8()
{
  return MEMORY[0x270FA21B8]();
}

uint64_t sub_2432AC908()
{
  return MEMORY[0x270FA21E8]();
}

uint64_t sub_2432AC918()
{
  return MEMORY[0x270FA21F8]();
}

uint64_t sub_2432AC928()
{
  return MEMORY[0x270FA2200]();
}

uint64_t sub_2432AC938()
{
  return MEMORY[0x270FA2208]();
}

uint64_t sub_2432AC948()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2432AC958()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2432AC968()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2432AC978()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2432AC988()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2432AC998()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2432AC9A8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2432AC9C8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2432AC9D8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2432AC9E8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2432AC9F8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2432ACA08()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2432ACA18()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_2432ACA28()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2432ACA58()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2432ACA68()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2432ACA78()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_2432ACAA8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2432ACAB8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2432ACAC8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2432ACAD8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2432ACAE8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2432ACAF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2432ACB08()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2432ACB18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2432ACB28()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2432ACB38()
{
  return MEMORY[0x270F9FD98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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