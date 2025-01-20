uint64_t LockedCameraCaptureExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(void *)(a1 - 8);
  v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a1);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_24457CE80();
}

uint64_t sub_244571A58()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_244571AE0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))();
}

uint64_t sub_244571B4C()
{
  uint64_t v0 = sub_24457CEC0();
  __swift_allocate_value_buffer(v0, qword_268E8BF38);
  __swift_project_value_buffer(v0, (uint64_t)qword_268E8BF38);
  return sub_24457CEA0();
}

uint64_t LockedCameraCaptureUIScene.session.getter()
{
  return swift_retain();
}

id LockedCameraCaptureUIScene.init(content:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v44 = a3;
  v41 = a4;
  v42 = a1;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v43 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v35 - v8;
  uint64_t v10 = sub_24457CE60();
  uint64_t v39 = *(void *)(v10 - 8);
  uint64_t v40 = v10;
  MEMORY[0x270FA5388](v10);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268E8BF30 != -1) {
    swift_once();
  }
  uint64_t v45 = a2;
  uint64_t v13 = sub_24457CEC0();
  __swift_project_value_buffer(v13, (uint64_t)qword_268E8BF38);
  uint64_t v14 = sub_24457CEB0();
  uint64_t v37 = v15;
  uint64_t v38 = v14;
  id v16 = objc_msgSend(objc_allocWithZone((Class)sub_24457CEF0()), sel_init);
  sub_24457CF60();
  swift_allocObject();
  id v17 = v16;
  uint64_t v18 = sub_24457CF10();
  type metadata accessor for LockedCameraCaptureSession();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  swift_retain();
  swift_retain();
  v20 = (void *)sub_24457CF00();
  id v21 = objc_msgSend(v20, sel_url);

  sub_24457CE50();
  if (qword_268E8BF58 != -1) {
    uint64_t v22 = swift_once();
  }
  MEMORY[0x270FA5388](v22);
  *(&v35 - 2) = (uint64_t)v12;
  uint64_t v24 = v23 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v23 + 16);
  uint64_t v25 = (*(unsigned int *)(*(void *)v23 + 48) + 3) & 0x1FFFFFFFCLL;
  v36 = v12;
  v26 = (os_unfair_lock_s *)(v23 + v25);
  os_unfair_lock_lock((os_unfair_lock_t)(v23 + v25));
  sub_244572218(v24);
  os_unfair_lock_unlock(v26);
  v42(v19);
  uint64_t v27 = v45;
  sub_24457CFC0();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v43, v9, v27);
  v28 = (void *)sub_24457CFB0();
  id result = objc_msgSend(v28, sel_view);
  if (result)
  {
    v30 = result;
    id v31 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v30, sel_setBackgroundColor_, v31);

    id v32 = v28;
    sub_24457CEE0();

    swift_release();
    swift_release();

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v27);
    id result = (id)(*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v36, v40);
    v33 = v41;
    uint64_t v34 = v38;
    uint64_t *v41 = v19;
    v33[1] = v34;
    v33[2] = v37;
  }
  else
  {
    __break(1u);
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

uint64_t sub_24457204C(uint64_t a1, uint64_t a2)
{
  sub_244572534(a1);
  uint64_t v4 = sub_24457CE60();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
}

uint64_t LockedCameraCaptureUIScene.body.getter(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(a1 + 16);
  *(void *)(v6 + 32) = v3;
  *(void *)(v6 + 40) = v4;
  *(void *)(v6 + 48) = v5;
  swift_bridgeObjectRetain_n();
  swift_retain();
  return sub_24457CE70();
}

uint64_t sub_244572208()
{
  return 0;
}

uint64_t sub_244572218(uint64_t a1)
{
  return sub_24457204C(a1, *(void *)(v1 + 16));
}

uint64_t sub_244572234()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_244572274()
{
  return sub_24457CF20();
}

uint64_t sub_24457229C(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2445722D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of LockedCameraCaptureExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_244572330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24457233C()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_244572378(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_2445723B8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
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

void *sub_244572434(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24457247C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2445724C4(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for LockedCameraCaptureUIScene()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24457251C()
{
  return MEMORY[0x263F04E30];
}

void sub_244572528(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_244572534(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_268E8BFF0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268E8BFF0);
    }
  }
}

uint64_t sub_2445726C4()
{
  uint64_t v0 = sub_24457CF90();
  __swift_allocate_value_buffer(v0, qword_268E8C830);
  __swift_project_value_buffer(v0, (uint64_t)qword_268E8C830);
  return sub_24457CF80();
}

void LockedCameraCaptureSession.sessionContentURL.getter()
{
  uint64_t v0 = (void *)sub_24457CF00();
  id v1 = objc_msgSend(v0, sel_url);

  sub_24457CE50();
}

uint64_t sub_2445727A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244574600(a1, a2);
}

uint64_t sub_2445727D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388]();
  id v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24457CE60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E8C0F0);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_244574600((uint64_t)v1, v3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v3 + 16));
  uint64_t result = sub_2445745A4((uint64_t)v1, &qword_268E8BFE8);
  qword_268E8C848 = v3;
  return result;
}

BOOL static LockedCameraCaptureSession.hasActiveSession.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268E8BF58 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_268E8C848 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)qword_268E8C848 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(qword_268E8C848
                          + ((*(unsigned int *)(*(void *)qword_268E8C848 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_2445727A8(v3, (uint64_t)v2);
  os_unfair_lock_unlock(v4);
  uint64_t v5 = sub_24457CE60();
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v2, 1, v5) != 1;
  sub_2445745A4((uint64_t)v2, &qword_268E8BFE8);
  return v6;
}

uint64_t LockedCameraCaptureSession.urlsToOpen.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C060);
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = (void *)sub_24457CF20();
  sub_24457CED0();

  sub_24457CE60();
  sub_244574248(&qword_268E8C070, &qword_268E8C060);
  return sub_24457D250();
}

uint64_t sub_244572BB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_244572BD8);
}

uint64_t sub_244572BD8()
{
  sub_24457D080();
  *(void *)(v0 + 32) = sub_24457D070();
  sub_24457D060();
  return MEMORY[0x270FA2498](sub_244572C6C);
}

uint64_t sub_244572C6C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 40) = objc_msgSend(v1, sel_URL);
  return MEMORY[0x270FA2498](sub_244572CF0);
}

uint64_t sub_244572CF0()
{
  uint64_t v1 = *(void **)(v0 + 40);
  sub_24457CE50();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
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

uint64_t LockedCameraCaptureSession.openApplication(for:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return MEMORY[0x270FA2498](sub_244572DEC);
}

uint64_t sub_244572DEC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_244572E8C;
  uint64_t v2 = *(void *)(v0 + 16);
  return MEMORY[0x270F5CF80](v2);
}

uint64_t sub_244572E8C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_244572FC0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_244572FC0()
{
  uint64_t v1 = *(void **)(v0 + 48);
  sub_244573320();
  swift_allocError();
  sub_244573070((uint64_t)v1, v2);
  swift_willThrow();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_244573070@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C0E0);
  MEMORY[0x270FA5388](v4 - 8);
  BOOL v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_24457CF40();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v18[-v12];
  uint64_t v19 = a1;
  MEMORY[0x245692E90](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C0E8);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *a2 = v18[7];
    return result;
  }
  uint64_t v19 = a1;
  MEMORY[0x245692E90](a1);
  int v15 = swift_dynamicCast();
  id v16 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (!v15)
  {
    v16(v6, 1, 1, v7);
    uint64_t result = sub_2445745A4((uint64_t)v6, &qword_268E8C0E0);
    goto LABEL_8;
  }
  v16(v6, 0, 1, v7);
  id v17 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32);
  v17(v13, v6, v7);
  v17(v11, v13, v7);
  uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 88))(v11, v7);
  if (result == *MEMORY[0x263F67CB0])
  {
LABEL_8:
    *a2 = 0;
    return result;
  }
  if (result == *MEMORY[0x263F67CA0])
  {
    *a2 = 1;
  }
  else if (result == *MEMORY[0x263F67CA8])
  {
    *a2 = 2;
  }
  else
  {
    *a2 = 0;
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
  }
  return result;
}

unint64_t sub_244573320()
{
  unint64_t result = qword_268E8C080;
  if (!qword_268E8C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E8C080);
  }
  return result;
}

uint64_t LockedCameraCaptureSession.openApplicationAfterTransitionCompletion(for:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  sub_24457D080();
  v2[5] = sub_24457D070();
  v2[6] = sub_24457D060();
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_244573434);
}

uint64_t sub_244573434()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2445734D4;
  uint64_t v2 = *(void *)(v0 + 16);
  return MEMORY[0x270F5CF90](v2);
}

uint64_t sub_2445734D4()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_244573674;
  }
  else {
    uint64_t v2 = sub_244573610;
  }
  return MEMORY[0x270FA2498](v2);
}

uint64_t sub_244573610()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_244573674()
{
  uint64_t v1 = *(void **)(v0 + 72);
  swift_release();
  sub_244573320();
  swift_allocError();
  sub_244573070((uint64_t)v1, v2);
  swift_willThrow();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t LockedCameraCaptureSession.invalidateSessionContent()()
{
  *(void *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C098);
  *(void *)(v1 + 24) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2445737BC);
}

uint64_t sub_2445737BC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = sub_24457D0A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v1;
  swift_retain();
  sub_244573B2C(v2, (uint64_t)&unk_268E8C0A8, (uint64_t)v4);
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2445738B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2445738D8);
}

uint64_t sub_2445738D8()
{
  uint64_t v1 = (void *)sub_24457CF00();
  objc_msgSend(v1, sel_invalidate);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_244573950()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_244573990()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_244573A38;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2445738D8);
}

uint64_t sub_244573A38()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_244573B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24457D0A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24457D090();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2445745A4(a1, &qword_268E8C098);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24457D060();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t static LockedCameraCaptureSession.ApplicationLaunchError.errorDomain.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t LockedCameraCaptureSession.ApplicationLaunchError.errorCode.getter()
{
  return *v0;
}

unint64_t LockedCameraCaptureSession.ApplicationLaunchError.failureReason.getter()
{
  unint64_t v1 = 0xD000000000000033;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000042;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000023;
  }
}

BOOL static LockedCameraCaptureSession.ApplicationLaunchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LockedCameraCaptureSession.ApplicationLaunchError.hash(into:)()
{
  return sub_24457D330();
}

uint64_t LockedCameraCaptureSession.ApplicationLaunchError.hashValue.getter()
{
  return sub_24457D340();
}

BOOL sub_244573DE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_244573DF8()
{
  return sub_24457D340();
}

uint64_t sub_244573E40()
{
  return sub_24457D330();
}

uint64_t sub_244573E6C()
{
  return sub_24457D340();
}

unint64_t sub_244573EB0()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_244573ECC()
{
  return *v0;
}

uint64_t sub_244573EE8(uint64_t a1)
{
  unint64_t v2 = sub_24457428C();

  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_244573F24(uint64_t a1)
{
  unint64_t v2 = sub_24457428C();

  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t LockedCameraCaptureSession.deinit()
{
  swift_release();
  return v0;
}

uint64_t LockedCameraCaptureSession.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

unint64_t sub_244573FC4()
{
  unint64_t result = qword_268E8C0B0;
  if (!qword_268E8C0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E8C0B0);
  }
  return result;
}

uint64_t type metadata accessor for LockedCameraCaptureSession()
{
  return self;
}

uint64_t method lookup function for LockedCameraCaptureSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LockedCameraCaptureSession);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LockedCameraCaptureSession.ApplicationLaunchError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LockedCameraCaptureSession.ApplicationLaunchError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2445741C4);
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

uint64_t sub_2445741EC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2445741F4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LockedCameraCaptureSession.ApplicationLaunchError()
{
  return &type metadata for LockedCameraCaptureSession.ApplicationLaunchError;
}

uint64_t sub_24457420C()
{
  return sub_244574248(&qword_268E8C0B8, &qword_268E8C0C0);
}

uint64_t sub_244574248(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_24457428C()
{
  unint64_t result = qword_268E8C0C8;
  if (!qword_268E8C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E8C0C8);
  }
  return result;
}

uint64_t sub_2445742E0(uint64_t a1, int *a2)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_2445743BC;
  return v6(a1);
}

uint64_t sub_2445743BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2445744B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2445744EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_244573A38;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268E8C0D0 + dword_268E8C0D0);
  return v6(a1, v4);
}

uint64_t sub_2445745A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244574600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244574668(void (*a1)(uint64_t), uint64_t a2)
{
  v73 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2A0);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v69 = (uint64_t)&v59 - v7;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2A8);
  uint64_t v8 = MEMORY[0x270FA5388](v64);
  v63 = (void (**)(char *, uint64_t, uint64_t))((char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  v74 = (uint64_t *)((char *)&v59 - v10);
  uint64_t locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  MEMORY[0x270FA5388](locked);
  v71 = (uint64_t *)((char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2B0);
  uint64_t v61 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  int v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v60 = (char *)&v59 - v16;
  uint64_t v17 = sub_24457CE60();
  uint64_t v76 = *(void *)(v17 - 8);
  uint64_t v77 = v17;
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v67 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  id v21 = (char *)&v59 - v20;
  id v22 = objc_msgSend(self, sel_finalizedSessionPathsWithType_, 1);
  sub_24457A258(0, &qword_268E8C2B8);
  unint64_t v23 = sub_24457D050();

  uint64_t v72 = a2;
  uint64_t v70 = v3;
  v59 = v6;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24457D280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  v68 = v15;
  if (v24)
  {
    v78[0] = MEMORY[0x263F8EE78];
    sub_24457B204(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      uint64_t result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    v65 = (void (*)(void, char *, uint64_t))v12;
    uint64_t v26 = 0;
    uint64_t v25 = v78[0];
    unint64_t v27 = v23 & 0xC000000000000001;
    unint64_t v28 = v23;
    do
    {
      if (v27) {
        id v29 = (id)MEMORY[0x245692A80](v26, v23);
      }
      else {
        id v29 = *(id *)(v23 + 8 * v26 + 32);
      }
      v30 = v29;
      id v31 = objc_msgSend(v29, sel_url, v59);
      sub_24457CE50();

      v78[0] = v25;
      unint64_t v33 = *(void *)(v25 + 16);
      unint64_t v32 = *(void *)(v25 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_24457B204(v32 > 1, v33 + 1, 1);
        uint64_t v25 = v78[0];
      }
      ++v26;
      *(void *)(v25 + 16) = v33 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v76 + 32))(v25+ ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80))+ *(void *)(v76 + 72) * v33, v21, v77);
      unint64_t v23 = v28;
    }
    while (v24 != v26);
    uint64_t v12 = (uint64_t)v65;
  }
  if (v24 >= *(void *)(v25 + 16)) {
    uint64_t v34 = *(void *)(v25 + 16);
  }
  else {
    uint64_t v34 = v24;
  }
  if (v34)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2C0);
    uint64_t v35 = sub_24457D2B0();
  }
  else
  {
    uint64_t v35 = MEMORY[0x263F8EE80];
  }
  uint64_t v36 = (uint64_t)v74;
  v78[0] = v35;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_24457A294(v25, v23, 1, v78);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v37 = v78[0];
  v78[0] = v25;
  uint64_t v38 = v66;
  v78[4] = *(void *)(v66 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2C8);
  sub_244574248(&qword_268E8C2D0, &qword_268E8C2C8);
  sub_24457B2F0(&qword_268E8C2D8, MEMORY[0x263F06EA8]);
  uint64_t v39 = v60;
  sub_24457D010();
  *(void *)(v38 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v38 + 128) = v37;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v38 + 112))
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = (uint64_t)v63;
    v65 = *(void (**)(void, char *, uint64_t))(v61 + 16);
    uint64_t v66 = v61 + 16;
    v65(v63, v39, v12);
    uint64_t v41 = sub_244574248(&qword_268E8C2E0, &qword_268E8C2B0);
    sub_24457D0D0();
    uint64_t v42 = v64;
    *(void *)(v40 + *(int *)(v64 + 36)) = v78[0];
    sub_24457B28C(v40, v36, &qword_268E8C2A8);
    v74 = (uint64_t *)(v36 + *(int *)(v42 + 36));
    uint64_t locked = v41;
    uint64_t v43 = *v74;
    sub_24457D0E0();
    uint64_t v44 = (uint64_t)v59;
    if (v43 != v78[0])
    {
      v63 = (void (**)(char *, uint64_t, uint64_t))(v76 + 32);
      uint64_t v64 = v61 + 8;
      v62 = (void (**)(uint64_t, char *, uint64_t))(v76 + 16);
      v76 += 8;
      uint64_t v45 = (uint64_t)v71;
      do
      {
        v46 = (void (*)(void *, void))sub_24457D100();
        uint64_t v47 = v36;
        uint64_t v48 = v69;
        sub_24457B224(v49, v69);
        v46(v78, 0);
        v50 = v68;
        v65(v68, (char *)v47, v12);
        sub_24457D0F0();
        (*(void (**)(char *, uint64_t))v64)(v50, v12);
        uint64_t v51 = v48;
        uint64_t v36 = v47;
        uint64_t v52 = v77;
        v53 = v73;
        sub_24457B28C(v51, v44, &qword_268E8C2A0);
        swift_getEnumCaseMultiPayload();
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2E8);
        v55 = v67;
        (*v63)(v67, v44 + *(int *)(v54 + 48), v52);
        (*v62)(v45, v55, v52);
        swift_storeEnumTagMultiPayload();
        v53(v45);
        sub_2445799F4(v45);
        (*(void (**)(char *, uint64_t))v76)(v55, v52);
        uint64_t v56 = *v74;
        sub_24457D0E0();
      }
      while (v56 != v78[0]);
    }
    sub_2445745A4(v36, &qword_268E8C2A8);
    return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v60, v12);
  }
  else
  {
    uint64_t v58 = (uint64_t)v71;
    uint64_t *v71 = v25;
    swift_storeEnumTagMultiPayload();
    v73(v58);
    sub_2445799F4(v58);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v39, v12);
    *(unsigned char *)(v38 + 112) = 1;
  }
  return result;
}

void sub_244574F90(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 120);
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = *(void *)(v1 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24457509C(a1, v2);
    char v6 = v5;
    swift_bridgeObjectRelease();
    if (*(void *)(v4 + 16) && (unint64_t v7 = sub_24457A8F0(a1), (v8 & 1) != 0))
    {
      id v9 = *(id *)(*(void *)(v4 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0 && (objc_msgSend(v9, sel_isTemporaryPath) & 1) == 0) {
        objc_msgSend(v9, sel_invalidate);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_24457509C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *(void *)(sub_24457CE60() - 8);
  uint64_t v5 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = *(void *)(v4 + 72);
  sub_24457B2F0(&qword_268E8C2D8, MEMORY[0x263F06EA8]);
  uint64_t v7 = 0;
  while ((sub_24457D020() & 1) == 0)
  {
    ++v7;
    v5 += v6;
    if (v2 == v7) {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_2445751C0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_244575200()
{
  return v0;
}

void sub_24457520C(uint64_t (**a1)(uint64_t a1), uint64_t a2)
{
  v63 = a1;
  uint64_t v64 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C098);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v69 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_24457CFD0();
  uint64_t v68 = *(void *)(v70 - 8);
  MEMORY[0x270FA5388](v70);
  v67 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24457CFF0();
  uint64_t v65 = *(void *)(v6 - 8);
  uint64_t v66 = v6;
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24457D160();
  uint64_t v62 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24457CE60();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v59 - v20;
  uint64_t v71 = v2;
  if (*(void *)(v2 + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    if ((sub_24457D180() & 1) == 0)
    {
      if (qword_268E8BF50 != -1) {
        swift_once();
      }
      uint64_t v47 = sub_24457CF90();
      __swift_project_value_buffer(v47, (uint64_t)qword_268E8C830);
      uint64_t v72 = sub_24457CF70();
      os_log_type_t v48 = sub_24457D110();
      if (os_log_type_enabled(v72, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v49 = 0;
        _os_log_impl(&dword_24456F000, v72, v48, "Already observing directory changes when beginObservingChanges called, bailing.", v49, 2u);
        MEMORY[0x245692FD0](v49, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
        uint64_t v54 = v72;
      }
      return;
    }
    swift_unknownObjectRelease();
  }
  id v22 = objc_allocWithZone(MEMORY[0x263F52710]);
  unint64_t v23 = (void *)sub_24457D030();
  uint64_t v24 = objc_msgSend(v22, sel_initWithTypeIdentifier_, v23);

  uint64_t v72 = v24;
  id v25 = [v24 finalizedSessionsContainerURLForCurrentApplication];
  if (v25)
  {
    uint64_t v26 = v25;
    sub_24457CE50();

    unint64_t v27 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v27(v14, v19, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
    {
      unint64_t v28 = v21;
      v27(v21, v14, v15);
      sub_24457CE40();
      if (aBlock == -1)
      {
        if (qword_268E8BF50 != -1) {
          swift_once();
        }
        uint64_t v55 = sub_24457CF90();
        __swift_project_value_buffer(v55, (uint64_t)qword_268E8C830);
        uint64_t v56 = sub_24457CF70();
        os_log_type_t v57 = sub_24457D130();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v58 = 0;
          _os_log_impl(&dword_24456F000, v56, v57, "Unable to acquire fd for session container URL", v58, 2u);
          MEMORY[0x245692FD0](v58, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
      }
      else
      {
        int v60 = aBlock;
        uint64_t v59 = sub_24457A258(0, &qword_268E8C240);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C248);
        uint64_t v29 = v62;
        uint64_t v61 = v28;
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_24457DBC0;
        sub_24457D150();
        uint64_t aBlock = v30;
        sub_24457B2F0(&qword_268E8C250, MEMORY[0x263F8F168]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C258);
        sub_244574248(&qword_268E8C260, &qword_268E8C258);
        sub_24457D210();
        uint64_t v31 = sub_24457D170();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v9);
        uint64_t v32 = *(void *)(v71 + 152);
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v34 = (void *)swift_allocObject();
        v34[2] = v31;
        v34[3] = v32;
        uint64_t v35 = v64;
        v34[4] = v63;
        v34[5] = v35;
        uint64_t v77 = sub_24457A068;
        v78 = v34;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v74 = 1107296256;
        v63 = &v75;
        v75 = sub_244576308;
        uint64_t v76 = &block_descriptor;
        uint64_t v36 = _Block_copy(&aBlock);
        swift_unknownObjectRetain();
        swift_retain();
        swift_retain();
        sub_24457CFE0();
        uint64_t v37 = v67;
        uint64_t v62 = ObjectType;
        sub_24457643C();
        sub_24457D190();
        _Block_release(v36);
        uint64_t v68 = *(void *)(v68 + 8);
        ((void (*)(char *, uint64_t))v68)(v37, v70);
        uint64_t v38 = v66;
        uint64_t v65 = *(void *)(v65 + 8);
        ((void (*)(char *, uint64_t))v65)(v8, v66);
        swift_release();
        uint64_t v39 = swift_allocObject();
        *(_DWORD *)(v39 + 16) = v60;
        uint64_t v77 = sub_24457A09C;
        v78 = (void *)v39;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v74 = 1107296256;
        v75 = sub_244576308;
        uint64_t v76 = &block_descriptor_46;
        uint64_t v40 = _Block_copy(&aBlock);
        sub_24457CFE0();
        sub_24457643C();
        sub_24457D1A0();
        _Block_release(v40);
        ((void (*)(char *, uint64_t))v68)(v37, v70);
        ((void (*)(char *, uint64_t))v65)(v8, v38);
        swift_release();
        uint64_t v41 = v71;
        *(void *)(v71 + 112) = v31;
        swift_unknownObjectRetain();
        swift_unknownObjectRelease();
        uint64_t v42 = sub_24457D0A0();
        uint64_t v43 = (uint64_t)v69;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v69, 1, 1, v42);
        sub_24457D080();
        swift_retain();
        uint64_t v44 = sub_24457D070();
        uint64_t v45 = (void *)swift_allocObject();
        uint64_t v46 = MEMORY[0x263F8F500];
        v45[2] = v44;
        v45[3] = v46;
        v45[4] = v41;
        sub_244573B2C(v43, (uint64_t)&unk_268E8C270, (uint64_t)v45);
        swift_release();

        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v61, v15);
      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  }
  sub_2445745A4((uint64_t)v14, &qword_268E8BFE8);
  if (qword_268E8BF50 != -1) {
    swift_once();
  }
  uint64_t v50 = sub_24457CF90();
  __swift_project_value_buffer(v50, (uint64_t)qword_268E8C830);
  uint64_t v51 = sub_24457CF70();
  os_log_type_t v52 = sub_24457D130();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v53 = 0;
    _os_log_impl(&dword_24456F000, v51, v52, "beginObservingChanges: Unable to build sessions container URL for current application.", v53, 2u);
    MEMORY[0x245692FD0](v53, -1, -1);
  }
}

uint64_t sub_244575D9C@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  if (a1)
  {
    uint64_t result = sub_24457CFA0();
  }
  else
  {
    if (qword_268E8BF50 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24457CF90();
    __swift_project_value_buffer(v4, (uint64_t)qword_268E8C830);
    uint64_t v5 = sub_24457CF70();
    os_log_type_t v6 = sub_24457D130();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_24456F000, v5, v6, "unable to get fs path for sessionContainerURL", v7, 2u);
      MEMORY[0x245692FD0](v7, -1, -1);
    }

    uint64_t result = 0xFFFFFFFFLL;
  }
  *a2 = result;
  return result;
}

uint64_t sub_244575EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C098);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24457D160();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v35 - v15;
  swift_getObjectType();
  sub_24457D1E0();
  sub_24457D150();
  sub_24457B2F0(&qword_268E8C250, MEMORY[0x263F8F168]);
  char v17 = sub_24457D200();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v14, v10);
  if (v17)
  {
    if (qword_268E8BF50 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24457CF90();
    __swift_project_value_buffer(v19, (uint64_t)qword_268E8C830);
    uint64_t v20 = sub_24457CF70();
    os_log_type_t v21 = sub_24457D140();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = v18;
      uint64_t v23 = a2;
      uint64_t v24 = a4;
      uint64_t v25 = a3;
      uint64_t v26 = v22;
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_24456F000, v20, v21, "Write event received, refreshing session URLs", v22, 2u);
      unint64_t v27 = v26;
      a3 = v25;
      a4 = v24;
      a2 = v23;
      uint64_t v18 = v36;
      MEMORY[0x245692FD0](v27, -1, -1);
    }

    uint64_t v28 = sub_24457D0A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v9, 1, 1, v28);
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = a2;
    v29[5] = a3;
    v29[6] = a4;
    swift_retain();
    swift_retain();
    sub_244573B2C((uint64_t)v9, (uint64_t)&unk_268E8C298, (uint64_t)v29);
    swift_release();
  }
  else
  {
    if (qword_268E8BF50 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_24457CF90();
    __swift_project_value_buffer(v30, (uint64_t)qword_268E8C830);
    uint64_t v31 = sub_24457CF70();
    os_log_type_t v32 = sub_24457D120();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v33 = 0;
      _os_log_impl(&dword_24456F000, v31, v32, "Event received, was not a write (or self == nil), bailing", v33, 2u);
      MEMORY[0x245692FD0](v33, -1, -1);
    }
  }
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v10);
}

uint64_t sub_244576280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_2445762A4);
}

uint64_t sub_2445762A4()
{
  sub_244574668(*(void (**)(uint64_t))(v0 + 24), *(void *)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_244576308(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_24457634C(int a1)
{
  if (qword_268E8BF50 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24457CF90();
  __swift_project_value_buffer(v2, (uint64_t)qword_268E8C830);
  uint64_t v3 = sub_24457CF70();
  os_log_type_t v4 = sub_24457D140();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24456F000, v3, v4, "DispatchSource cancelled, closing file handle", v5, 2u);
    MEMORY[0x245692FD0](v5, -1, -1);
  }

  return close(a1);
}

uint64_t sub_24457643C()
{
  return sub_24457D210();
}

uint64_t sub_244576518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_24457D080();
  v4[3] = sub_24457D070();
  v4[4] = sub_24457D060();
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_2445765B0);
}

uint64_t sub_2445765B0()
{
  id v1 = objc_msgSend(self, sel_sharedApplication);
  id v2 = objc_msgSend(v1, sel_applicationState);

  if (v2)
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  else
  {
    if (qword_268E8BF50 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24457CF90();
    __swift_project_value_buffer(v5, (uint64_t)qword_268E8C830);
    os_log_type_t v6 = sub_24457CF70();
    os_log_type_t v7 = sub_24457D140();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24456F000, v6, v7, "Application is foreground, begin file system observation", v8, 2u);
      MEMORY[0x245692FD0](v8, -1, -1);
    }

    return MEMORY[0x270FA2498](sub_244576748);
  }
}

uint64_t sub_244576748()
{
  sub_24457680C();
  return MEMORY[0x270FA2498](sub_2445767AC);
}

uint64_t sub_2445767AC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24457680C()
{
  if (*(void *)(v0 + 112))
  {
    uint64_t v1 = v0;
    swift_getObjectType();
    swift_unknownObjectRetain();
    if (sub_24457D180() & 1) != 0 || (*(unsigned char *)(v0 + 144))
    {
      if (qword_268E8BF50 != -1) {
        swift_once();
      }
      uint64_t v2 = sub_24457CF90();
      __swift_project_value_buffer(v2, (uint64_t)qword_268E8C830);
      swift_unknownObjectRetain();
      swift_retain();
      uint64_t v3 = sub_24457CF70();
      os_log_type_t v4 = sub_24457D140();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = swift_slowAlloc();
        *(_DWORD *)uint64_t v5 = 67109376;
        sub_24457D1F0();
        swift_release();
        *(_WORD *)(v5 + 8) = 1024;
        sub_24457D180();
        sub_24457D1F0();
        swift_unknownObjectRelease();
        _os_log_impl(&dword_24456F000, v3, v4, "resumeObservation: Unable to resume file system observation. Already observing: %{BOOL}d, cancelled: %{BOOL}d", (uint8_t *)v5, 0xEu);
        MEMORY[0x245692FD0](v5, -1, -1);
        swift_unknownObjectRelease();
      }
      else
      {

        swift_release();
        swift_unknownObjectRelease_n();
      }
    }
    else
    {
      if (qword_268E8BF50 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_24457CF90();
      __swift_project_value_buffer(v6, (uint64_t)qword_268E8C830);
      os_log_type_t v7 = sub_24457CF70();
      os_log_type_t v8 = sub_24457D140();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_24456F000, v7, v8, "Resuming file system observation", v9, 2u);
        MEMORY[0x245692FD0](v9, -1, -1);
      }

      sub_24457D1C0();
      swift_unknownObjectRelease();
      *(unsigned char *)(v1 + 144) = 1;
    }
  }
}

uint64_t sub_244576AA8()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_244576B00()
{
  type metadata accessor for LockedCameraCaptureManager(0);
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_244576DF0();
  qword_268E8C100 = v0;
  return result;
}

uint64_t static LockedCameraCaptureManager.shared.getter()
{
  if (qword_268E8BF60 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t LockedCameraCaptureManager.sessionContentURLs.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388](v2 - 8);
  os_log_type_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268E8BF58 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_268E8C848 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)qword_268E8C848 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(qword_268E8C848
                          + ((*(unsigned int *)(*(void *)qword_268E8C848 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v6);
  sub_2445727A8(v5, (uint64_t)v4);
  os_unfair_lock_unlock(v6);
  uint64_t v7 = sub_24457CE60();
  LODWORD(v5) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v4, 1, v7);
  sub_2445745A4((uint64_t)v4, &qword_268E8BFE8);
  if (v5 != 1) {
    return MEMORY[0x263F8EE78];
  }
  os_log_type_t v8 = *(os_unfair_lock_s **)(v1 + 32);
  uint64_t v9 = v8 + 4;
  uint64_t v10 = v8 + 6;
  os_unfair_lock_lock(v8 + 6);
  sub_244576D58(v9, v12);
  os_unfair_lock_unlock(v10);
  return v12[0];
}

uint64_t sub_244576D58@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t LockedCameraCaptureManager.sessionContentUpdates.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesStream;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C110);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_244576DF0()
{
  uint64_t v1 = v0;
  uint64_t v56 = sub_24457CE60();
  uint64_t v59 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v51 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v58 = (unint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C330);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C118);
  uint64_t v57 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C110);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver] = 0;
  *(void *)&v1[OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver] = 0;
  *(void *)&v1[OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didBecomeActiveObserver] = 0;
  type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F580], v5);
  sub_24457D0B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  os_log_type_t v52 = v15;
  uint64_t v53 = v13;
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v54 = v12;
  v16(&v1[OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesStream], v15, v12);
  uint64_t v17 = v57;
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  uint64_t v19 = v11;
  uint64_t v55 = v9;
  v18(&v1[OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesContinuation], v11, v9);
  if (qword_268E8BF58 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_268E8C848 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)qword_268E8C848 + 16);
  os_log_type_t v21 = (os_unfair_lock_s *)(qword_268E8C848
                           + ((*(unsigned int *)(*(void *)qword_268E8C848 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v21);
  uint64_t v22 = v58;
  sub_2445727A8(v20, v58);
  os_unfair_lock_unlock(v21);
  uint64_t v23 = v56;
  LODWORD(v20) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v22, 1, v56);
  sub_2445745A4(v22, &qword_268E8BFE8);
  if (v20 != 1)
  {
    type metadata accessor for CaptureManagerURLs();
    uint64_t v38 = swift_allocObject();
    swift_defaultActor_initialize();
    uint64_t v39 = MEMORY[0x263F8EE80];
    *(unsigned char *)(v38 + 112) = 0;
    uint64_t v28 = MEMORY[0x263F8EE78];
    *(void *)(v38 + 120) = MEMORY[0x263F8EE78];
    *(void *)(v38 + 128) = v39;
    swift_bridgeObjectRelease();
    *(void *)(v38 + 128) = v39;
    uint64_t v40 = v52;
LABEL_24:
    swift_bridgeObjectRelease();
    *((void *)v1 + 2) = v38;
    type metadata accessor for CaptureManagerFSObserving();
    uint64_t v45 = swift_allocObject();
    swift_retain();
    swift_defaultActor_initialize();
    *(_OWORD *)(v45 + 112) = 0u;
    *(_OWORD *)(v45 + 128) = 0u;
    *(void *)(v45 + 152) = v38;
    *(unsigned char *)(v45 + 144) = 0;
    *((void *)v1 + 3) = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C338);
    uint64_t v46 = swift_allocObject();
    *(_DWORD *)(v46 + 24) = 0;
    *(void *)(v46 + 16) = v28;
    *((void *)v1 + 4) = v46;
    sub_244577A20((uint64_t)&unk_26F9323B0, (uint64_t)&unk_268E8C360, (uint64_t)&unk_26F9323D8, (uint64_t)&unk_268E8C370);
    sub_24457765C();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v55);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v40, v54);
    return (uint64_t)v1;
  }
  uint64_t v49 = 0;
  uint64_t v50 = v11;
  id v24 = objc_msgSend(self, sel_finalizedSessionPathsWithType_, 1);
  sub_24457A258(0, &qword_268E8C2B8);
  unint64_t v25 = sub_24457D050();

  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_24457D280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v27 = v51;
  uint64_t v28 = MEMORY[0x263F8EE78];
  if (v26)
  {
    uint64_t v60 = MEMORY[0x263F8EE78];
    sub_24457B204(0, v26 & ~(v26 >> 63), 0);
    if (v26 < 0)
    {
      __break(1u);
      goto LABEL_27;
    }
    uint64_t v51 = v1;
    uint64_t v29 = 0;
    unint64_t v58 = v25 & 0xC000000000000001;
    uint64_t v28 = v60;
    unint64_t v30 = v25;
    uint64_t v31 = v26;
    do
    {
      if (v58) {
        id v32 = (id)MEMORY[0x245692A80](v29, v25);
      }
      else {
        id v32 = *(id *)(v25 + 8 * v29 + 32);
      }
      unint64_t v33 = v32;
      id v34 = objc_msgSend(v32, sel_url);
      sub_24457CE50();

      uint64_t v60 = v28;
      uint64_t v35 = v27;
      unint64_t v37 = *(void *)(v28 + 16);
      unint64_t v36 = *(void *)(v28 + 24);
      if (v37 >= v36 >> 1)
      {
        sub_24457B204(v36 > 1, v37 + 1, 1);
        uint64_t v28 = v60;
      }
      ++v29;
      *(void *)(v28 + 16) = v37 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v59 + 32))(v28+ ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))+ *(void *)(v59 + 72) * v37, v35, v23);
      unint64_t v27 = v35;
      unint64_t v25 = v30;
    }
    while (v31 != v29);
    uint64_t v26 = v31;
    uint64_t v1 = v51;
    uint64_t v17 = v57;
  }
  uint64_t v40 = v52;
  if (v26 >= *(void *)(v28 + 16)) {
    uint64_t v26 = *(void *)(v28 + 16);
  }
  uint64_t v41 = MEMORY[0x263F8EE80];
  uint64_t v42 = v49;
  if (v26)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2C0);
    uint64_t v43 = sub_24457D2B0();
  }
  else
  {
    uint64_t v43 = MEMORY[0x263F8EE80];
  }
  uint64_t v60 = v43;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_24457A294(v28, v25, 1, &v60);
  if (!v42)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v44 = v60;
    type metadata accessor for CaptureManagerURLs();
    uint64_t v38 = swift_allocObject();
    swift_bridgeObjectRetain();
    swift_defaultActor_initialize();
    *(unsigned char *)(v38 + 112) = 1;
    *(void *)(v38 + 120) = v28;
    *(void *)(v38 + 128) = v41;
    swift_bridgeObjectRelease();
    *(void *)(v38 + 128) = v44;
    uint64_t v19 = v50;
    goto LABEL_24;
  }
LABEL_27:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_244577620()
{
  return sub_244577A20((uint64_t)&unk_26F9323B0, (uint64_t)&unk_268E8C360, (uint64_t)&unk_26F9323D8, (uint64_t)&unk_268E8C370);
}

uint64_t sub_24457765C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C098);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_268E8BF58 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_268E8C848 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)qword_268E8C848 + 16);
  uint64_t v9 = (os_unfair_lock_s *)(qword_268E8C848
                          + ((*(unsigned int *)(*(void *)qword_268E8C848 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v9);
  sub_2445727A8(v8, (uint64_t)v7);
  os_unfair_lock_unlock(v9);
  uint64_t v10 = sub_24457CE60();
  LODWORD(v8) = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v7, 1, v10);
  uint64_t result = sub_2445745A4((uint64_t)v7, &qword_268E8BFE8);
  if (v8 == 1)
  {
    uint64_t v12 = sub_24457D0A0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v1;
    swift_retain();
    sub_244573B2C((uint64_t)v4, (uint64_t)&unk_268E8C348, (uint64_t)v13);
    return swift_release();
  }
  return result;
}

uint64_t LockedCameraCaptureManager.deinit()
{
  sub_244577A20((uint64_t)&unk_26F932338, (uint64_t)&unk_268E8C318, (uint64_t)&unk_26F932360, (uint64_t)&unk_268E8C328);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesStream;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C110);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_sessionContentUpdatesContinuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C118);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_2445779E4()
{
  return sub_244577A20((uint64_t)&unk_26F932338, (uint64_t)&unk_268E8C318, (uint64_t)&unk_26F932360, (uint64_t)&unk_268E8C328);
}

uint64_t sub_244577A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = v4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C098);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_268E8BF58 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_268E8C848 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)qword_268E8C848 + 16);
  uint64_t v15 = (os_unfair_lock_s *)(qword_268E8C848
                           + ((*(unsigned int *)(*(void *)qword_268E8C848 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v15);
  sub_2445727A8(v14, (uint64_t)v13);
  os_unfair_lock_unlock(v15);
  uint64_t v16 = sub_24457CE60();
  LODWORD(v14) = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v13, 1, v16);
  uint64_t result = sub_2445745A4((uint64_t)v13, &qword_268E8BFE8);
  if (v14 == 1)
  {
    uint64_t v18 = sub_24457D0A0();
    uint64_t v19 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    v19(v10, 1, 1, v18);
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = v7;
    swift_retain();
    sub_244573B2C((uint64_t)v10, a2, (uint64_t)v20);
    swift_release();
    v19(v10, 1, 1, v18);
    sub_24457D080();
    swift_retain();
    uint64_t v21 = sub_24457D070();
    uint64_t v22 = (void *)swift_allocObject();
    uint64_t v23 = MEMORY[0x263F8F500];
    v22[2] = v21;
    v22[3] = v23;
    v22[4] = v7;
    sub_244573B2C((uint64_t)v10, a4, (uint64_t)v22);
    return swift_release();
  }
  return result;
}

uint64_t LockedCameraCaptureManager.__deallocating_deinit()
{
  LockedCameraCaptureManager.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_244577D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_244577D68);
}

uint64_t sub_244577D68()
{
  *(void *)(v0 + 24) = *(void *)(*(void *)(v0 + 16) + 16);
  swift_retain();
  return MEMORY[0x270FA2498](sub_244577DDC);
}

uint64_t sub_244577DDC()
{
  sub_24457BBA0(v0[3], v0[2]);
  swift_release();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_244577E48(uint64_t a1)
{
  uint64_t v2 = sub_24457CE60();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v40 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v39 = (char *)&v38 - v5;
  uint64_t locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  uint64_t v7 = MEMORY[0x270FA5388](locked);
  uint64_t v9 = (uint64_t *)((char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C350);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24457C4C4(a1, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C118);
  sub_24457D0C0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_24457C4C4(a1, (uint64_t)v9);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v17 = v41;
      uint64_t v18 = v39;
      uint64_t v19 = v9;
      uint64_t v20 = v42;
      uint64_t v21 = (*(uint64_t (**)(char *, void *, uint64_t))(v41 + 32))(v39, v19, v42);
      MEMORY[0x270FA5388](v21);
      *(&v38 - 2) = (uint64_t)v18;
      p_os_unfair_lock_opaque = (unint64_t *)&v22[4]._os_unfair_lock_opaque;
      id v24 = v22 + 6;
      os_unfair_lock_lock(v22 + 6);
      sub_24457C544(p_os_unfair_lock_opaque);
      os_unfair_lock_unlock(v24);
      return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v18, v20);
    }
    else
    {
      unint64_t v30 = v40;
      uint64_t v31 = v41;
      id v32 = v9;
      uint64_t v33 = v42;
      uint64_t v34 = (*(uint64_t (**)(char *, void *, uint64_t))(v41 + 32))(v40, v32, v42);
      MEMORY[0x270FA5388](v34);
      *(&v38 - 2) = (uint64_t)v30;
      uint64_t v36 = (uint64_t)&v35[4];
      unint64_t v37 = v35 + 6;
      os_unfair_lock_lock(v35 + 6);
      sub_24457C528(v36);
      os_unfair_lock_unlock(v37);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v30, v33);
    }
  }
  else
  {
    uint64_t v26 = *v9;
    MEMORY[0x270FA5388](EnumCaseMultiPayload);
    *(&v38 - 2) = v26;
    uint64_t v28 = v27 + 4;
    uint64_t v29 = v27 + 6;
    os_unfair_lock_lock(v27 + 6);
    sub_24457C560(v28);
    os_unfair_lock_unlock(v29);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24457820C(unint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_24457CE60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  unint64_t v8 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v8 = sub_244579DB8(0, *(void *)(v8 + 16) + 1, 1, v8);
  }
  unint64_t v10 = *(void *)(v8 + 16);
  unint64_t v9 = *(void *)(v8 + 24);
  if (v10 >= v9 >> 1) {
    unint64_t v8 = sub_244579DB8(v9 > 1, v10 + 1, 1, v8);
  }
  *(void *)(v8 + 16) = v10 + 1;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v10, v7, v4);
  *a1 = v8;
  return result;
}

uint64_t sub_244578384(uint64_t a1, uint64_t a2)
{
  v5[2] = a2;
  uint64_t result = sub_24457B78C((uint64_t (*)(unint64_t))sub_24457C700, (uint64_t)v5);
  int64_t v4 = *(void *)(*(void *)a1 + 16);
  if (v4 >= result) {
    return sub_24457C730(result, v4);
  }
  __break(1u);
  return result;
}

uint64_t sub_2445783EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24457840C);
}

uint64_t sub_24457840C()
{
  *(void *)(v0 + 24) = *(void *)(*(void *)(v0 + 16) + 24);
  swift_retain();
  return MEMORY[0x270FA2498](sub_244578480);
}

uint64_t sub_244578480()
{
  sub_24457520C((uint64_t (**)(uint64_t))sub_24457CDA0, *(void *)(v0 + 16));
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_244578500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  sub_24457D080();
  *(void *)(v4 + 72) = sub_24457D070();
  sub_24457D060();
  return MEMORY[0x270FA2498](sub_244578598);
}

uint64_t sub_244578598()
{
  uint64_t v1 = v0[8];
  swift_release();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_defaultCenter);
  uint64_t v4 = *MEMORY[0x263F83330];
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  v0[6] = sub_24457CAB4;
  v0[7] = v5;
  uint64_t v31 = MEMORY[0x263EF8330];
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_244578B6C;
  v0[5] = &block_descriptor_80;
  uint64_t v6 = _Block_copy(v0 + 2);
  swift_release();
  id v7 = objc_msgSend(v3, sel_addObserverForName_object_queue_usingBlock_, v4, 0, 0, v6);
  _Block_release(v6);

  uint64_t v8 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver;
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver);
  if (v9)
  {
    swift_unknownObjectRetain();
    id v10 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v10, sel_removeObserver_, v9);

    swift_unknownObjectRelease();
  }
  uint64_t v11 = v0[8];
  *(void *)(v1 + v8) = v7;
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v2, sel_defaultCenter);
  uint64_t v13 = *MEMORY[0x263F833B8];
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  v0[6] = sub_24457CAEC;
  v0[7] = v14;
  v0[2] = v31;
  v0[3] = 1107296256;
  v0[4] = sub_244578B6C;
  v0[5] = &block_descriptor_84;
  uint64_t v15 = _Block_copy(v0 + 2);
  swift_release();
  id v16 = objc_msgSend(v12, sel_addObserverForName_object_queue_usingBlock_, v13, 0, 0, v15);
  _Block_release(v15);

  uint64_t v17 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver;
  uint64_t v18 = *(void *)(v11 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver);
  if (v18)
  {
    swift_unknownObjectRetain();
    id v19 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v19, sel_removeObserver_, v18);

    swift_unknownObjectRelease();
  }
  uint64_t v20 = v0[8];
  *(void *)(v11 + v17) = v16;
  swift_unknownObjectRelease();
  id v21 = objc_msgSend(v2, sel_defaultCenter);
  uint64_t v22 = *MEMORY[0x263F83318];
  uint64_t v23 = swift_allocObject();
  swift_weakInit();
  v0[6] = sub_24457CB24;
  v0[7] = v23;
  v0[2] = v31;
  v0[3] = 1107296256;
  v0[4] = sub_244578B6C;
  v0[5] = &block_descriptor_88;
  id v24 = _Block_copy(v0 + 2);
  swift_release();
  id v25 = objc_msgSend(v21, sel_addObserverForName_object_queue_usingBlock_, v22, 0, 0, v24);
  _Block_release(v24);

  uint64_t v26 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didBecomeActiveObserver;
  uint64_t v27 = *(void *)(v20 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didBecomeActiveObserver);
  if (v27)
  {
    swift_unknownObjectRetain();
    id v28 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v28, sel_removeObserver_, v27);

    swift_unknownObjectRelease();
  }
  *(void *)(v20 + v26) = v25;
  swift_unknownObjectRelease();
  uint64_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t sub_2445789DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2445789FC);
}

uint64_t sub_2445789FC()
{
  *(void *)(v0 + 24) = *(void *)(*(void *)(v0 + 16) + 24);
  return MEMORY[0x270FA2498](sub_244578A20);
}

uint64_t sub_244578A20()
{
  if (qword_268E8BF50 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24457CF90();
  __swift_project_value_buffer(v1, (uint64_t)qword_268E8C830);
  uint64_t v2 = sub_24457CF70();
  os_log_type_t v3 = sub_24457D140();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24456F000, v2, v3, "File system observation is suspended", v4, 2u);
    MEMORY[0x245692FD0](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 24);

  if (*(void *)(v5 + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24457D1D0();
    swift_unknownObjectRelease();
  }
  *(unsigned char *)(*(void *)(v0 + 24) + 144) = 0;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_244578B6C(uint64_t a1)
{
  uint64_t v2 = sub_24457CDE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_24457CDD0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_244578C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_244578C80);
}

uint64_t sub_244578C80()
{
  *(void *)(v0 + 24) = *(void *)(*(void *)(v0 + 16) + 24);
  return MEMORY[0x270FA2498](sub_244578CA4);
}

uint64_t sub_244578CA4()
{
  sub_24457680C();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_244578D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C098);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = sub_24457D0A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    sub_244573B2C((uint64_t)v7, a4, (uint64_t)v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_244578E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_244578E38);
}

uint64_t sub_244578E38()
{
  *(void *)(v0 + 24) = *(void *)(*(void *)(v0 + 16) + 24);
  return MEMORY[0x270FA2498](sub_24457CDCC);
}

uint64_t sub_244578E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_244578E7C);
}

uint64_t sub_244578E7C()
{
  *(void *)(v0 + 24) = *(void *)(*(void *)(v0 + 16) + 24);
  return MEMORY[0x270FA2498](sub_244578EA0);
}

uint64_t sub_244578EA0()
{
  if (qword_268E8BF50 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24457CF90();
  __swift_project_value_buffer(v1, (uint64_t)qword_268E8C830);
  uint64_t v2 = sub_24457CF70();
  os_log_type_t v3 = sub_24457D140();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24456F000, v2, v3, "File system observation is ended", v4, 2u);
    MEMORY[0x245692FD0](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 24);

  if (*(void *)(v5 + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24457D1B0();
    swift_unknownObjectRelease();
  }
  *(unsigned char *)(*(void *)(v0 + 24) + 144) = 0;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_244578FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_24457D080();
  *(void *)(v4 + 24) = sub_24457D070();
  sub_24457D060();
  return MEMORY[0x270FA2498](sub_244579084);
}

uint64_t sub_244579084()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  uint64_t v2 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver;
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didEnterBackgroundObserver);
  if (v3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    id v5 = objc_msgSend(v4, sel_defaultCenter);
    objc_msgSend(v5, sel_removeObserver_, v3);

    swift_unknownObjectRelease();
  }
  uint64_t v6 = *(void *)(v0 + 16);
  *(void *)(v1 + v2) = 0;
  swift_unknownObjectRelease();
  uint64_t v7 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver;
  uint64_t v8 = *(void *)(v6 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_willEnterForegroundObserver);
  if (v8)
  {
    uint64_t v9 = self;
    swift_unknownObjectRetain();
    id v10 = objc_msgSend(v9, sel_defaultCenter);
    objc_msgSend(v10, sel_removeObserver_, v8);

    swift_unknownObjectRelease();
  }
  uint64_t v11 = *(void *)(v0 + 16);
  *(void *)(v6 + v7) = 0;
  swift_unknownObjectRelease();
  uint64_t v12 = OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didBecomeActiveObserver;
  uint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC19LockedCameraCapture26LockedCameraCaptureManager_didBecomeActiveObserver);
  if (v13)
  {
    uint64_t v14 = self;
    swift_unknownObjectRetain();
    id v15 = objc_msgSend(v14, sel_defaultCenter);
    objc_msgSend(v15, sel_removeObserver_, v13);

    swift_unknownObjectRelease();
  }
  *(void *)(v11 + v12) = 0;
  swift_unknownObjectRelease();
  id v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t LockedCameraCaptureManager.invalidateSessionContent(at:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_244579268);
}

uint64_t sub_244579268()
{
  *(void *)(v0 + 32) = *(void *)(*(void *)(v0 + 24) + 16);
  return MEMORY[0x270FA2498](sub_24457928C);
}

uint64_t sub_24457928C()
{
  sub_244574F90(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::Void __swiftcall LockedCameraCaptureManager.applicationDidCompleteTransition()()
{
}

Swift::Void __swiftcall LockedCameraCaptureManager.beginDelayingAppearance()()
{
}

Swift::Void __swiftcall LockedCameraCaptureManager.endDelayingAppearance()()
{
}

void sub_244579318(SEL *a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  [v2 *a1];
}

uint64_t type metadata accessor for CaptureManagerURLs()
{
  return self;
}

uint64_t type metadata accessor for CaptureManagerFSObserving()
{
  return self;
}

uint64_t sub_2445793C8()
{
  return type metadata accessor for LockedCameraCaptureManager(0);
}

uint64_t type metadata accessor for LockedCameraCaptureManager(uint64_t a1)
{
  return sub_244579548(a1, (uint64_t *)&unk_268E8C1F8);
}

void sub_2445793F0()
{
  sub_244579580(319, &qword_268E8C208, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_244579580(319, &qword_268E8C210, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for LockedCameraCaptureManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LockedCameraCaptureManager);
}

uint64_t type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1)
{
  return sub_244579548(a1, qword_268E8C218);
}

uint64_t sub_244579548(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_244579580(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(255);
    unint64_t v7 = a3(a1, locked);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for LockedCameraCaptureManager.SessionContentUpdate(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_24457CE60();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    uint64_t v3 = sub_24457CE60();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (!result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for LockedCameraCaptureManager.SessionContentUpdate(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = sub_24457CE60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for LockedCameraCaptureManager.SessionContentUpdate(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_2445799F4((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v5 = sub_24457CE60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2445799F4(uint64_t a1)
{
  uint64_t locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(locked - 8) + 8))(a1, locked);
  return a1;
}

void *initializeWithTake for LockedCameraCaptureManager.SessionContentUpdate(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = sub_24457CE60();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for LockedCameraCaptureManager.SessionContentUpdate(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2445799F4((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_24457CE60();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for LockedCameraCaptureManager.SessionContentUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_244579CD4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_244579CE4()
{
  uint64_t result = sub_24457CE60();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_244579D7C()
{
  return sub_244574248((unint64_t *)&unk_268E8C230, &qword_268E8C110);
}

uint64_t sub_244579DB8(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C308);
  uint64_t v10 = *(void *)(sub_24457CE60() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24457D260();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24457CE60() - 8);
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
    sub_24457C5A8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24457A020()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24457A068()
{
  return sub_244575EA0(v0[2], v0[3], v0[4], v0[5]);
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

uint64_t sub_24457A08C()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

uint64_t sub_24457A09C()
{
  return sub_24457634C(*(_DWORD *)(v0 + 16));
}

uint64_t sub_24457A0A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_244573A38;
  return sub_244576518(a1, v4, v5, v6);
}

uint64_t sub_24457A15C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24457A1A4()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_24457CDC8;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return MEMORY[0x270FA2498](sub_2445762A4);
}

uint64_t sub_24457A258(uint64_t a1, unint64_t *a2)
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

void sub_24457A294(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v61 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8BFE8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24457CE60();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v62 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v60 = (char *)v45 - v14;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E8C2F0);
  MEMORY[0x270FA5388](v56);
  uint64_t v55 = (char *)v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v52 = v16;
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
LABEL_30:
    sub_2445745A4((uint64_t)v9, &qword_268E8BFE8);
LABEL_31:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return;
  }
  unint64_t v17 = 0;
  uint64_t v57 = v11 + 56;
  uint64_t v53 = v11 + 48;
  uint64_t v54 = v11 + 16;
  uint64_t v64 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v18 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v59 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0) {
    uint64_t v18 = a2;
  }
  v45[0] = v18;
  uint64_t v49 = a1;
  unint64_t v50 = a2 & 0xC000000000000001;
  uint64_t v63 = v10;
  uint64_t v47 = v9;
  uint64_t v48 = a2;
  uint64_t v51 = v11;
  while (1)
  {
    if (v17 >= *(void *)(a1 + 16))
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      sub_24457D2D0();
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v19 = *(void *)(v11 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v9, a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)) + v19 * v17, v10);
    uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v46(v9, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
      goto LABEL_30;
    }
    uint64_t v20 = v9;
    id v21 = *v64;
    (*v64)(v60, v20, v10);
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_24457D280();
      swift_bridgeObjectRelease();
      if (v17 == v43)
      {
LABEL_29:
        (*(void (**)(char *, uint64_t))(v51 + 8))(v60, v10);
        goto LABEL_31;
      }
    }
    else if (v17 == *(void *)(v59 + 16))
    {
      goto LABEL_29;
    }
    uint64_t v58 = v19;
    if (v50)
    {
      id v22 = (id)MEMORY[0x245692A80](v17, a2);
    }
    else
    {
      if (v17 >= *(void *)(v59 + 16)) {
        goto LABEL_35;
      }
      id v22 = *(id *)(a2 + 8 * v17 + 32);
    }
    id v23 = v22;
    id v24 = v55;
    uint64_t v25 = *(int *)(v56 + 48);
    uint64_t v26 = v63;
    v21(v55, v60, v63);
    uint64_t v27 = v23;
    *(void *)&v24[v25] = v23;
    uint64_t v28 = (uint64_t)v62;
    v21(v62, v24, v26);
    uint64_t v29 = (void *)*v61;
    unint64_t v31 = sub_24457A8F0(v28);
    uint64_t v32 = v29[2];
    BOOL v33 = (v30 & 1) == 0;
    uint64_t v34 = v32 + v33;
    if (__OFADD__(v32, v33)) {
      goto LABEL_34;
    }
    char v35 = v30;
    if (v29[3] < v34) {
      break;
    }
    if (a3)
    {
      if (v30) {
        goto LABEL_26;
      }
    }
    else
    {
      sub_24457A988();
      if (v35) {
        goto LABEL_26;
      }
    }
LABEL_19:
    uint64_t v38 = (uint64_t)v62;
    uint64_t v39 = (void *)*v61;
    *(void *)(*v61 + 8 * (v31 >> 6) + 64) |= 1 << v31;
    v21((char *)(v39[6] + v31 * v58), (char *)v38, v63);
    *(void *)(v39[7] + 8 * v31) = v27;
    uint64_t v40 = v39[2];
    BOOL v41 = __OFADD__(v40, 1);
    uint64_t v42 = v40 + 1;
    if (v41) {
      goto LABEL_36;
    }
    ++v17;
    v39[2] = v42;
    a3 = 1;
    uint64_t v11 = v51;
    a2 = v48;
    a1 = v49;
    uint64_t v10 = v63;
    uint64_t v9 = v47;
    if (v52 == v17)
    {
      v46(v47, 1, 1, v63);
      goto LABEL_30;
    }
  }
  sub_24457AC20(v34, a3 & 1);
  unint64_t v36 = sub_24457A8F0((uint64_t)v62);
  if ((v35 & 1) != (v37 & 1)) {
    goto LABEL_37;
  }
  unint64_t v31 = v36;
  if ((v35 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_26:
  uint64_t v44 = (void *)swift_allocError();
  swift_willThrow();
  id v67 = v44;
  MEMORY[0x245692E90](v44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C0E8);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v62, v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_38:
  uint64_t v65 = 0;
  unint64_t v66 = 0xE000000000000000;
  sub_24457D220();
  sub_24457D040();
  sub_24457D240();
  sub_24457D040();
  sub_24457D270();
  __break(1u);
}

unint64_t sub_24457A8F0(uint64_t a1)
{
  sub_24457CE60();
  sub_24457B2F0(&qword_268E8C300, MEMORY[0x263F06EA8]);
  uint64_t v2 = sub_24457D000();

  return sub_24457B044(a1, v2);
}

id sub_24457A988()
{
  uint64_t v1 = sub_24457CE60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  long long v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2C0);
  id v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24457D290();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *id v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
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
    uint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
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

uint64_t sub_24457AC20(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24457CE60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2C0);
  int v46 = a2;
  uint64_t v10 = sub_24457D2A0();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    int64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_24457B2F0(&qword_268E8C300, MEMORY[0x263F06EA8]);
    uint64_t result = sub_24457D000();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  int64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

unint64_t sub_24457B044(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24457CE60();
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
      sub_24457B2F0(&qword_268E8C2D8, MEMORY[0x263F06EA8]);
      char v15 = sub_24457D020();
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

uint64_t sub_24457B204(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24457B338(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24457B224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24457B28C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24457B2F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24457B338(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C308);
  uint64_t v10 = *(void *)(sub_24457CE60() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24457CE60() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24457D2C0();
  __break(1u);
  return result;
}

uint64_t sub_24457B580()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24457CDC8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_244578E7C);
}

uint64_t sub_24457B62C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *int64_t v7 = v2;
  v7[1] = sub_24457CDC8;
  return sub_244578FEC(a1, v4, v5, v6);
}

uint64_t sub_24457B6E4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24457CDC8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_244577D68);
}

uint64_t sub_24457B78C(uint64_t (*a1)(unint64_t), uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_24457CE60();
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v42 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int64_t v41 = (char *)&v33 - v11;
  MEMORY[0x270FA5388](v10);
  size_t v14 = (char *)&v33 - v13;
  uint64_t v44 = v4;
  unint64_t v15 = *v4;
  uint64_t v16 = *(void *)(*v4 + 16);
  if (!v16) {
    return 0;
  }
  unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v35 = v12;
  uint64_t v45 = *(void *)(v12 + 72);
  swift_bridgeObjectRetain();
  unint64_t v18 = 0;
  unint64_t v36 = v17;
  while (1)
  {
    char v19 = a1(v15 + v17);
    if (v3)
    {
      swift_bridgeObjectRelease();
      return v18;
    }
    if (v19) {
      break;
    }
    ++v18;
    v17 += v45;
    if (v16 == v18)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v15 + 16);
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v18, 1))
  {
    unint64_t v21 = *(void *)(v15 + 16);
    if (v18 + 1 == v21) {
      return v18;
    }
    uint64_t v22 = v45 + v17;
    unint64_t v23 = v18 + 1;
    int64_t v24 = (void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    uint64_t v39 = a1;
    uint64_t v40 = (uint64_t (**)(char *, uint64_t))(v35 + 8);
    unint64_t v33 = (uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 40);
    uint64_t v37 = v14;
    uint64_t v38 = a2;
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    while (v23 < v21)
    {
      uint64_t v25 = v15 + v22;
      unint64_t v26 = (uint64_t (*)(char *))a1;
      int64_t v27 = *v24;
      (*v24)(v14, v25, v7);
      LOBYTE(v26) = v26(v14);
      uint64_t result = (*v40)(v14, v7);
      if (v26)
      {
        a1 = v39;
        int64_t v24 = v43;
      }
      else
      {
        int64_t v24 = v43;
        if (v23 != v18)
        {
          if ((v18 & 0x8000000000000000) != 0) {
            goto LABEL_32;
          }
          unint64_t v28 = *v44;
          if (v18 >= *(void *)(*v44 + 16)) {
            goto LABEL_33;
          }
          unint64_t v35 = *(void *)(*v44 + 16);
          uint64_t v34 = v18 * v45;
          uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v27)(v41, v28 + v36 + v18 * v45, v7);
          if (v23 >= v35) {
            goto LABEL_34;
          }
          v27(v42, v28 + v22, v7);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v44 = v28;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_24457BB8C(v28);
            unint64_t v28 = result;
            *uint64_t v44 = result;
          }
          if (v18 >= *(void *)(v28 + 16)) {
            goto LABEL_35;
          }
          unint64_t v29 = v28 + v36 + v34;
          id v30 = *v33;
          uint64_t result = (*v33)(v29, v42, v7);
          if (v23 >= *(void *)(*v44 + 16)) {
            goto LABEL_36;
          }
          uint64_t result = v30(*v44 + v22, v41, v7);
          int64_t v24 = v43;
        }
        BOOL v31 = __OFADD__(v18++, 1);
        a1 = v39;
        if (v31) {
          goto LABEL_31;
        }
      }
      unint64_t v32 = v23 + 1;
      size_t v14 = v37;
      if (__OFADD__(v23, 1)) {
        goto LABEL_30;
      }
      unint64_t v15 = *v44;
      unint64_t v21 = *(void *)(*v44 + 16);
      ++v23;
      v22 += v45;
      if (v32 == v21) {
        return v18;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
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
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24457BB8C(unint64_t a1)
{
  return sub_244579DB8(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_24457BBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v75 = a2;
  uint64_t v73 = a1;
  uint64_t v2 = sub_24457CE60();
  uint64_t v78 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v64 = (char *)&v59 - v6;
  uint64_t locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  MEMORY[0x270FA5388](locked);
  uint64_t v9 = (uint64_t *)((char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2A0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v62 = (char *)&v59 - v14;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2A8);
  uint64_t v15 = MEMORY[0x270FA5388](v70);
  uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))((char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v15);
  uint64_t v61 = (uint64_t)&v59 - v17;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2B0);
  uint64_t v67 = *(void *)(v65 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v65);
  uint64_t v60 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  unint64_t v21 = (char *)&v59 - v20;
  id v22 = objc_msgSend(self, sel_finalizedSessionPathsWithType_, 1);
  sub_24457A258(0, &qword_268E8C2B8);
  unint64_t v23 = sub_24457D050();

  uint64_t v79 = v23;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24457D280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v76 = v9;
  uint64_t v77 = locked;
  uint64_t v74 = v10;
  uint64_t v63 = v13;
  unint64_t v66 = v21;
  if (v24)
  {
    v80[0] = MEMORY[0x263F8EE78];
    sub_24457B204(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      swift_release();
      uint64_t result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    uint64_t v26 = 0;
    uint64_t v25 = v80[0];
    unint64_t v27 = v79 & 0xC000000000000001;
    uint64_t v28 = v2;
    do
    {
      if (v27) {
        id v29 = (id)MEMORY[0x245692A80](v26, v79);
      }
      else {
        id v29 = *(id *)(v79 + 8 * v26 + 32);
      }
      id v30 = v29;
      id v31 = objc_msgSend(v29, sel_url);
      sub_24457CE50();

      v80[0] = v25;
      unint64_t v33 = *(void *)(v25 + 16);
      unint64_t v32 = *(void *)(v25 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_24457B204(v32 > 1, v33 + 1, 1);
        uint64_t v25 = v80[0];
      }
      ++v26;
      *(void *)(v25 + 16) = v33 + 1;
      uint64_t v2 = v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v78 + 32))(v25+ ((*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80))+ *(void *)(v78 + 72) * v33, v5, v28);
    }
    while (v24 != v26);
    uint64_t v9 = v76;
    unint64_t v21 = v66;
  }
  if (v24 >= *(void *)(v25 + 16)) {
    uint64_t v34 = *(void *)(v25 + 16);
  }
  else {
    uint64_t v34 = v24;
  }
  if (v34)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2C0);
    uint64_t v35 = sub_24457D2B0();
  }
  else
  {
    uint64_t v35 = MEMORY[0x263F8EE80];
  }
  uint64_t v36 = v79;
  v80[0] = v35;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_24457A294(v25, v36, 1, v80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v37 = v80[0];
  v80[0] = v25;
  uint64_t v38 = v73;
  v80[4] = *(void *)(v73 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2C8);
  sub_244574248(&qword_268E8C2D0, &qword_268E8C2C8);
  sub_24457B2F0(&qword_268E8C2D8, MEMORY[0x263F06EA8]);
  sub_24457D010();
  *(void *)(v38 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v38 + 128) = v37;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v38 + 112))
  {
    swift_bridgeObjectRelease();
    uint64_t v73 = v2;
    uint64_t v39 = v64;
    uint64_t v40 = (uint64_t)v69;
    uint64_t v41 = v65;
    uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
    uint64_t v72 = v67 + 16;
    v71((char *)v69, v21, v65);
    uint64_t v42 = sub_244574248(&qword_268E8C2E0, &qword_268E8C2B0);
    sub_24457D0D0();
    uint64_t v43 = v70;
    *(void *)(v40 + *(int *)(v70 + 36)) = v80[0];
    uint64_t v44 = v61;
    sub_24457B28C(v40, v61, &qword_268E8C2A8);
    uint64_t v45 = (uint64_t *)(v44 + *(int *)(v43 + 36));
    uint64_t v46 = *v45;
    sub_24457D0E0();
    uint64_t v47 = (uint64_t)v63;
    uint64_t v48 = (uint64_t)v62;
    uint64_t v49 = v60;
    if (v46 != v80[0])
    {
      uint64_t v69 = (void (**)(char *, uint64_t, uint64_t))(v78 + 32);
      uint64_t v70 = v67 + 8;
      uint64_t v68 = (void (**)(uint64_t *, char *, uint64_t))(v78 + 16);
      v78 += 8;
      uint64_t v79 = v42;
      do
      {
        unint64_t v50 = (void (*)(void *, void))sub_24457D100();
        sub_24457B224(v51, v48);
        v50(v80, 0);
        v71(v49, (char *)v44, v41);
        sub_24457D0F0();
        (*(void (**)(char *, uint64_t))v70)(v49, v41);
        sub_24457B28C(v48, v47, &qword_268E8C2A0);
        swift_getEnumCaseMultiPayload();
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E8C2E8);
        uint64_t v53 = v73;
        (*v69)(v39, v47 + *(int *)(v52 + 48), v73);
        uint64_t v54 = v48;
        uint64_t v55 = (uint64_t)v76;
        (*v68)(v76, v39, v53);
        swift_storeEnumTagMultiPayload();
        sub_244577E48(v55);
        uint64_t v56 = v55;
        uint64_t v48 = v54;
        sub_2445799F4(v56);
        (*(void (**)(char *, uint64_t))v78)(v39, v53);
        uint64_t v57 = *v45;
        sub_24457D0E0();
      }
      while (v57 != v80[0]);
    }
    sub_2445745A4(v44, &qword_268E8C2A8);
    return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v66, v41);
  }
  else
  {
    uint64_t *v9 = v25;
    swift_storeEnumTagMultiPayload();
    sub_244577E48((uint64_t)v9);
    sub_2445799F4((uint64_t)v9);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v21, v65);
    *(unsigned char *)(v38 + 112) = 1;
  }
  return result;
}

uint64_t sub_24457C4C4(uint64_t a1, uint64_t a2)
{
  uint64_t locked = type metadata accessor for LockedCameraCaptureManager.SessionContentUpdate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(locked - 8) + 16))(a2, a1, locked);
  return a2;
}

uint64_t sub_24457C528(uint64_t a1)
{
  return sub_244578384(a1, *(void *)(v1 + 16));
}

uint64_t sub_24457C544(unint64_t *a1)
{
  return sub_24457820C(a1, *(void *)(v1 + 16));
}

uint64_t sub_24457C560(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRelease();
  *a1 = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24457C5A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_24457CE60() - 8);
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
  uint64_t result = sub_24457D2C0();
  __break(1u);
  return result;
}

uint64_t sub_24457C700(uint64_t a1)
{
  return MEMORY[0x245692680](a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_24457C730(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_244579DB8(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(sub_24457CE60() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_24457D2C0();
  __break(1u);
  return result;
}

uint64_t sub_24457C91C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24457CDC8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24457840C);
}

uint64_t sub_24457C9C8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24457CDC8;
  return sub_244578500(a1, v4, v5, v6);
}

uint64_t sub_24457CA7C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24457CAB4(uint64_t a1)
{
  return sub_244578D04(a1, v1, (uint64_t)&unk_26F9324F0, (uint64_t)&unk_268E8C3A0);
}

uint64_t sub_24457CAEC(uint64_t a1)
{
  return sub_244578D04(a1, v1, (uint64_t)&unk_26F9324C8, (uint64_t)&unk_268E8C390);
}

uint64_t sub_24457CB24(uint64_t a1)
{
  return sub_244578D04(a1, v1, (uint64_t)&unk_26F9324A0, (uint64_t)&unk_268E8C380);
}

uint64_t sub_24457CB60()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24457CDC8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_244578E38);
}

uint64_t sub_24457CC0C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24457CDC8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_244578C80);
}

uint64_t objectdestroy_48Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24457CCF8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24457CDC8;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2445789FC);
}

uint64_t sub_24457CDD0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24457CDE0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24457CDF0()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_24457CE00()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_24457CE10()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_24457CE20()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_24457CE30()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_24457CE40()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t sub_24457CE50()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24457CE60()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24457CE70()
{
  return MEMORY[0x270EEB950]();
}

uint64_t sub_24457CE80()
{
  return MEMORY[0x270EEB970]();
}

uint64_t sub_24457CE90()
{
  return MEMORY[0x270EEB978]();
}

uint64_t sub_24457CEA0()
{
  return MEMORY[0x270EEB998]();
}

uint64_t sub_24457CEB0()
{
  return MEMORY[0x270EEB9A0]();
}

uint64_t sub_24457CEC0()
{
  return MEMORY[0x270EEB9A8]();
}

uint64_t sub_24457CED0()
{
  return MEMORY[0x270F5CF50]();
}

uint64_t sub_24457CEE0()
{
  return MEMORY[0x270F5CF58]();
}

uint64_t sub_24457CEF0()
{
  return MEMORY[0x270F5CF60]();
}

uint64_t sub_24457CF00()
{
  return MEMORY[0x270F5CF68]();
}

uint64_t sub_24457CF10()
{
  return MEMORY[0x270F5CF70]();
}

uint64_t sub_24457CF20()
{
  return MEMORY[0x270F5CF78]();
}

uint64_t sub_24457CF40()
{
  return MEMORY[0x270F5CF88]();
}

uint64_t sub_24457CF60()
{
  return MEMORY[0x270F5CF98]();
}

uint64_t sub_24457CF70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24457CF80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24457CF90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24457CFA0()
{
  return MEMORY[0x270FA08C0]();
}

uint64_t sub_24457CFB0()
{
  return MEMORY[0x270F01690]();
}

uint64_t sub_24457CFC0()
{
  return MEMORY[0x270F016D0]();
}

uint64_t sub_24457CFD0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24457CFE0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24457CFF0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24457D000()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24457D010()
{
  return MEMORY[0x270F9D468]();
}

uint64_t sub_24457D020()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24457D030()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24457D040()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24457D050()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24457D060()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24457D070()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24457D080()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24457D090()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24457D0A0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24457D0B0()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_24457D0C0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24457D0D0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24457D0E0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24457D0F0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24457D100()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24457D110()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24457D120()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24457D130()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24457D140()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24457D150()
{
  return MEMORY[0x270FA0E08]();
}

uint64_t sub_24457D160()
{
  return MEMORY[0x270FA0E20]();
}

uint64_t sub_24457D170()
{
  return MEMORY[0x270FA0E88]();
}

uint64_t sub_24457D180()
{
  return MEMORY[0x270FA0E90]();
}

uint64_t sub_24457D190()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_24457D1A0()
{
  return MEMORY[0x270FA0EA8]();
}

uint64_t sub_24457D1B0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_24457D1C0()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_24457D1D0()
{
  return MEMORY[0x270FA0ED8]();
}

uint64_t sub_24457D1E0()
{
  return MEMORY[0x270FA0F70]();
}

uint64_t sub_24457D1F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24457D200()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_24457D210()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24457D220()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24457D230()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24457D240()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24457D250()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_24457D260()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24457D270()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24457D280()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24457D290()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24457D2A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24457D2B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24457D2C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24457D2D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24457D300()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24457D310()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24457D320()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24457D330()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24457D340()
{
  return MEMORY[0x270F9FC90]();
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

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
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