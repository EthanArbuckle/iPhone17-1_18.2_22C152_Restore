uint64_t ScreenSharingAnnotationUIService.coordinator.getter@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  long long v10;
  uint64_t v11;
  void *v12;

  v3 = (uint64_t)v1 + OBJC_IVAR___ScreenSharingAnnotationUIService____lazy_storage___coordinator;
  swift_beginAccess();
  sub_63C0(v3, (uint64_t)&v10, &qword_C6A8);
  if (v11) {
    return sub_28B4(&v10, (uint64_t)a1);
  }
  sub_65AC((uint64_t)&v10, &qword_C6A8);
  v5 = sub_6760();
  swift_allocObject();
  v6 = sub_6750();
  v11 = v5;
  v12 = &protocol witness table for ScreenSharingAnnotationDisplayManager;
  *(void *)&v10 = v6;
  v7 = sub_6740();
  swift_allocObject();
  swift_retain();
  v8 = v1;
  v9 = sub_6730();
  a1[3] = v7;
  a1[4] = (uint64_t)&protocol witness table for ScreenSharingAnnotationCoordinator;
  swift_release();
  *a1 = v9;
  sub_2850((uint64_t)a1, (uint64_t)&v10);
  swift_beginAccess();
  sub_664C((uint64_t)&v10, v3, &qword_C6A8);
  return swift_endAccess();
}

uint64_t sub_280C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2850(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_28B4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_28CC@<X0>(uint64_t *a1@<X8>)
{
  return ScreenSharingAnnotationUIService.coordinator.getter(a1);
}

uint64_t sub_28F0(uint64_t a1, uint64_t *a2)
{
  sub_2850(a1, (uint64_t)v7);
  uint64_t v3 = *a2;
  sub_28B4(v7, (uint64_t)v6);
  uint64_t v4 = v3 + OBJC_IVAR___ScreenSharingAnnotationUIService____lazy_storage___coordinator;
  swift_beginAccess();
  sub_664C((uint64_t)v6, v4, &qword_C6A8);
  return swift_endAccess();
}

uint64_t ScreenSharingAnnotationUIService.coordinator.setter(long long *a1)
{
  sub_28B4(a1, (uint64_t)v4);
  uint64_t v2 = v1 + OBJC_IVAR___ScreenSharingAnnotationUIService____lazy_storage___coordinator;
  swift_beginAccess();
  sub_664C((uint64_t)v4, v2, &qword_C6A8);
  return swift_endAccess();
}

void (*ScreenSharingAnnotationUIService.coordinator.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = (uint64_t *)malloc(0x98uLL);
  *a1 = v3;
  v3[18] = v1;
  ScreenSharingAnnotationUIService.coordinator.getter(v3);
  return sub_2A34;
}

void sub_2A34(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  uint64_t v3 = (long long *)(*a1 + 40);
  uint64_t v4 = *a1 + 80;
  if (a2)
  {
    uint64_t v5 = v2[18];
    sub_2850(*a1, (uint64_t)v3);
    sub_28B4(v3, v4);
    uint64_t v6 = v5 + OBJC_IVAR___ScreenSharingAnnotationUIService____lazy_storage___coordinator;
    swift_beginAccess();
    sub_664C(v4, v6, &qword_C6A8);
    swift_endAccess();
    sub_5F04((uint64_t)v2);
  }
  else
  {
    uint64_t v7 = v2[18];
    sub_28B4((long long *)*a1, (uint64_t)v3);
    uint64_t v8 = v7 + OBJC_IVAR___ScreenSharingAnnotationUIService____lazy_storage___coordinator;
    swift_beginAccess();
    sub_664C((uint64_t)v3, v8, &qword_C6A8);
    swift_endAccess();
  }

  free(v2);
}

id ScreenSharingAnnotationUIService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

char *ScreenSharingAnnotationUIService.init()()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_280C(&qword_C6B8);
  ((void (*)(void))__chkstk_darwin)();
  v29 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_280C(&qword_C6C0);
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_280C(&qword_C6C8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v28 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v28 - v12;
  v14 = &v1[OBJC_IVAR___ScreenSharingAnnotationUIService____lazy_storage___coordinator];
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((void *)v14 + 4) = 0;
  v15 = &v1[OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageContinuation];
  uint64_t v16 = sub_280C(&qword_C6B0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  *(void *)&v1[OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageTask] = 0;
  v30.receiver = v1;
  v30.super_class = ObjectType;
  id v17 = objc_msgSendSuper2(&v30, "init");
  sub_280C(&qword_C6D0);
  swift_allocObject();
  swift_unknownObjectUnownedInit();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v4);
  id v18 = v17;
  sub_68F0();
  swift_release();
  uint64_t v19 = sub_68A0();
  uint64_t v20 = (uint64_t)v29;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v29, 1, 1, v19);
  v21 = v28;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v28, v13, v8);
  sub_6880();
  v22 = (char *)v18;
  uint64_t v23 = sub_6870();
  unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v25 = (v10 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v23;
  *(void *)(v26 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v26 + v24, v21, v8);
  *(void *)(v26 + v25) = v22;
  *(void *)&v22[OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageTask] = sub_4D90(v20, (uint64_t)&unk_C6E0, v26);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  return v22;
}

uint64_t sub_2F88()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_2FC0(uint64_t a1)
{
  sub_280C(&qword_C6F0);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  uint64_t v5 = sub_280C(&qword_C6B0);
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v3, a1, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v3, 0, 1, v5);
  uint64_t v7 = (uint64_t)Strong + OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageContinuation;
  swift_beginAccess();
  sub_664C((uint64_t)v3, v7, &qword_C6F0);
  swift_endAccess();
}

void sub_310C(uint64_t a1)
{
}

id ScreenSharingAnnotationUIService.__deallocating_deinit()
{
  id v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_280C(&qword_C6B0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &v1[OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageContinuation];
  swift_beginAccess();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v7, 1, v3))
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
    sub_68C0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  if (*(void *)&v1[OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageTask])
  {
    swift_retain();
    sub_280C(&qword_C6E8);
    sub_6900();
    swift_release();
  }
  v10.receiver = v1;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, "dealloc");
}

uint64_t sub_3370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[22] = a4;
  v5[23] = a5;
  uint64_t v6 = sub_6720();
  v5[24] = v6;
  v5[25] = *(void *)(v6 - 8);
  v5[26] = swift_task_alloc();
  uint64_t v7 = sub_67D0();
  v5[27] = v7;
  v5[28] = *(void *)(v7 - 8);
  v5[29] = swift_task_alloc();
  uint64_t v8 = sub_67B0();
  v5[30] = v8;
  v5[31] = *(void *)(v8 - 8);
  v5[32] = swift_task_alloc();
  uint64_t v9 = sub_66F0();
  v5[33] = v9;
  v5[34] = *(void *)(v9 - 8);
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  v5[37] = swift_task_alloc();
  sub_280C(&qword_C7B8);
  v5[38] = swift_task_alloc();
  uint64_t v10 = sub_280C((uint64_t *)&unk_C7C0);
  v5[39] = v10;
  v5[40] = *(void *)(v10 - 8);
  v5[41] = swift_task_alloc();
  v5[42] = sub_6880();
  v5[43] = sub_6870();
  uint64_t v12 = sub_6860();
  v5[44] = v12;
  v5[45] = v11;
  return _swift_task_switch(sub_3628, v12, v11);
}

uint64_t sub_3628()
{
  sub_280C(&qword_C6C8);
  sub_68D0();
  *(_DWORD *)(v0 + 456) = enum case for AnnotationUIServicesMessageID.startAnnotationService(_:);
  *(_DWORD *)(v0 + 460) = enum case for AnnotationUIServicesMessageID.stopAnnotationService(_:);
  *(_DWORD *)(v0 + 464) = enum case for AnnotationUIServicesMessageID.sendTapGesture(_:);
  *(_DWORD *)(v0 + 468) = enum case for AnnotationUIServicesMessageID.sendDragGesture(_:);
  *(void *)(v0 + 368) = 0;
  uint64_t v1 = sub_6870();
  *(void *)(v0 + 376) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_3740;
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v4 = *(void *)(v0 + 312);
  return AsyncStream.Iterator.next(isolation:)(v3, v1, &protocol witness table for MainActor, v4);
}

uint64_t sub_3740()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 360);
  uint64_t v3 = *(void *)(v1 + 352);
  return _swift_task_switch(sub_3884, v3, v2);
}

uint64_t sub_3884()
{
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = sub_280C(&qword_C6D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 320) + 8))(*(void *)(v0 + 328), *(void *)(v0 + 312));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
LABEL_3:
    return v3();
  }
  int v5 = *(_DWORD *)(v0 + 456);
  uint64_t v7 = *(void *)(v0 + 288);
  uint64_t v6 = *(void *)(v0 + 296);
  uint64_t v8 = *(void *)(v0 + 264);
  uint64_t v9 = *(void *)(v0 + 272);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v6, v1, v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v10(v7, v6, v8);
  int v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v7, v8);
  if (v11 == v5)
  {
    swift_bridgeObjectRelease();
    ScreenSharingAnnotationUIService.coordinator.getter((uint64_t *)(v0 + 136));
    uint64_t v12 = *(void *)(v0 + 160);
    uint64_t v13 = *(void *)(v0 + 168);
    sub_6608((void *)(v0 + 136), v12);
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 392) = v14;
    void *v14 = v0;
    v14[1] = sub_3FE0;
    return dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.startAnnotationUIService()(v12, v13);
  }
  if (v11 == *(_DWORD *)(v0 + 460))
  {
    swift_bridgeObjectRelease();
    ScreenSharingAnnotationUIService.coordinator.getter((uint64_t *)(v0 + 96));
    uint64_t v15 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v0 + 128);
    sub_6608((void *)(v0 + 96), v15);
    id v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v17;
    *id v17 = v0;
    v17[1] = sub_4200;
    return dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.stopAnnotationUIService()(v15, v16);
  }
  if (v11 == *(_DWORD *)(v0 + 464))
  {
    uint64_t v18 = *(void *)(v0 + 368);
    sub_67C0();
    *(void *)(v0 + 424) = v18;
    if (!v18)
    {
      ScreenSharingAnnotationUIService.coordinator.getter((uint64_t *)(v0 + 56));
      uint64_t v19 = *(void *)(v0 + 80);
      uint64_t v20 = *(void *)(v0 + 88);
      sub_6608((void *)(v0 + 56), v19);
      v21 = (void *)swift_task_alloc();
      *(void *)(v0 + 432) = v21;
      void *v21 = v0;
      v21[1] = sub_4420;
      uint64_t v22 = *(void *)(v0 + 256);
      return dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.processTapGestureMessage(_:)(v22, v19, v20);
    }
LABEL_21:
    uint64_t v25 = *(void *)(v0 + 320);
    uint64_t v24 = *(void *)(v0 + 328);
    uint64_t v26 = *(void *)(v0 + 312);
    uint64_t v27 = *(void *)(v0 + 296);
    uint64_t v28 = *(void *)(v0 + 264);
    uint64_t v29 = *(void *)(v0 + 272);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_3;
  }
  if (v11 == *(_DWORD *)(v0 + 468))
  {
    uint64_t v23 = *(void *)(v0 + 368);
    sub_67E0();
    *(void *)(v0 + 440) = v23;
    if (v23) {
      goto LABEL_21;
    }
    ScreenSharingAnnotationUIService.coordinator.getter((uint64_t *)(v0 + 16));
    uint64_t v52 = *(void *)(v0 + 40);
    uint64_t v53 = *(void *)(v0 + 48);
    sub_6608((void *)(v0 + 16), v52);
    v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 448) = v54;
    void *v54 = v0;
    v54[1] = sub_464C;
    uint64_t v55 = *(void *)(v0 + 232);
    return dispatch thunk of ScreenSharingAnnotationCoordinatorProtocol.processDragGestureMessage(_:)(v55, v52, v53);
  }
  else
  {
    uint64_t v30 = *(void *)(v0 + 296);
    uint64_t v31 = *(void *)(v0 + 280);
    uint64_t v32 = *(void *)(v0 + 264);
    swift_bridgeObjectRelease();
    sub_6700();
    v10(v31, v30, v32);
    v33 = sub_6710();
    os_log_type_t v34 = sub_6930();
    BOOL v35 = os_log_type_enabled(v33, v34);
    uint64_t v36 = *(void *)(v0 + 280);
    uint64_t v37 = *(void *)(v0 + 264);
    v38 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 272) + 8);
    if (v35)
    {
      uint64_t v39 = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 134349056;
      uint64_t v40 = sub_66E0();
      v41 = *v38;
      (*v38)(v36, v37);
      *(void *)(v39 + 4) = v40;
      _os_log_impl(&dword_0, v33, v34, "Unhandled service message: %{public}ld", (uint8_t *)v39, 0xCu);
      swift_slowDealloc();
    }
    else
    {
      v41 = *v38;
      (*v38)(*(void *)(v0 + 280), *(void *)(v0 + 264));
    }
    uint64_t v43 = *(void *)(v0 + 288);
    uint64_t v42 = *(void *)(v0 + 296);
    uint64_t v44 = *(void *)(v0 + 264);
    uint64_t v46 = *(void *)(v0 + 200);
    uint64_t v45 = *(void *)(v0 + 208);
    uint64_t v47 = *(void *)(v0 + 192);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    v41(v42, v44);
    v41(v43, v44);
    uint64_t v48 = sub_6870();
    *(void *)(v0 + 376) = v48;
    v49 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v49;
    void *v49 = v0;
    v49[1] = sub_3740;
    uint64_t v50 = *(void *)(v0 + 304);
    uint64_t v51 = *(void *)(v0 + 312);
    return AsyncStream.Iterator.next(isolation:)(v50, v48, &protocol witness table for MainActor, v51);
  }
}

uint64_t sub_3FE0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 400) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 360);
  uint64_t v4 = *(void *)(v2 + 352);
  if (v0) {
    int v5 = sub_4878;
  }
  else {
    int v5 = sub_411C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_411C()
{
  (*(void (**)(void, void))(v0[34] + 8))(v0[37], v0[33]);
  sub_5F04((uint64_t)(v0 + 17));
  v0[46] = v0[50];
  uint64_t v1 = sub_6870();
  v0[47] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[48] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_3740;
  uint64_t v3 = v0[38];
  uint64_t v4 = v0[39];
  return AsyncStream.Iterator.next(isolation:)(v3, v1, &protocol witness table for MainActor, v4);
}

uint64_t sub_4200()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 416) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 360);
  uint64_t v4 = *(void *)(v2 + 352);
  if (v0) {
    int v5 = sub_4994;
  }
  else {
    int v5 = sub_433C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_433C()
{
  (*(void (**)(void, void))(v0[34] + 8))(v0[37], v0[33]);
  sub_5F04((uint64_t)(v0 + 12));
  v0[46] = v0[52];
  uint64_t v1 = sub_6870();
  v0[47] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[48] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_3740;
  uint64_t v3 = v0[38];
  uint64_t v4 = v0[39];
  return AsyncStream.Iterator.next(isolation:)(v3, v1, &protocol witness table for MainActor, v4);
}

uint64_t sub_4420()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 360);
  uint64_t v3 = *(void *)(v1 + 352);
  return _swift_task_switch(sub_4540, v3, v2);
}

uint64_t sub_4540()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[34];
  (*(void (**)(void, void))(v0[31] + 8))(v0[32], v0[30]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_5F04((uint64_t)(v0 + 7));
  v0[46] = v0[53];
  uint64_t v4 = sub_6870();
  v0[47] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[48] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_3740;
  uint64_t v6 = v0[38];
  uint64_t v7 = v0[39];
  return AsyncStream.Iterator.next(isolation:)(v6, v4, &protocol witness table for MainActor, v7);
}

uint64_t sub_464C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 360);
  uint64_t v3 = *(void *)(v1 + 352);
  return _swift_task_switch(sub_476C, v3, v2);
}

uint64_t sub_476C()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[34];
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  sub_5F04((uint64_t)(v0 + 2));
  v0[46] = v0[55];
  uint64_t v4 = sub_6870();
  v0[47] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[48] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_3740;
  uint64_t v6 = v0[38];
  uint64_t v7 = v0[39];
  return AsyncStream.Iterator.next(isolation:)(v6, v4, &protocol witness table for MainActor, v7);
}

uint64_t sub_4878()
{
  uint64_t v2 = v0[40];
  uint64_t v1 = v0[41];
  uint64_t v3 = v0[39];
  uint64_t v4 = v0[37];
  uint64_t v5 = v0[33];
  uint64_t v6 = v0[34];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_5F04((uint64_t)(v0 + 17));
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

uint64_t sub_4994()
{
  uint64_t v2 = v0[40];
  uint64_t v1 = v0[41];
  uint64_t v3 = v0[39];
  uint64_t v4 = v0[37];
  uint64_t v5 = v0[33];
  uint64_t v6 = v0[34];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_5F04((uint64_t)(v0 + 12));
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

uint64_t sub_4AB0()
{
  uint64_t v1 = sub_280C(&qword_C6C8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_4B9C()
{
  uint64_t v2 = *(void *)(sub_280C(&qword_C6C8) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *unint64_t v6 = v1;
  v6[1] = sub_4C9C;
  return sub_3370((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_4C9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_4D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_68A0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_6890();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_65AC(a1, &qword_C6B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_6860();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

unint64_t ScreenSharingAnnotationUIService.processMessage(_:withIdentifier:fromClientWithIdentifier:)(unint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5 = v4;
  v66 = a4;
  uint64_t v61 = a3;
  uint64_t v71 = a2;
  unint64_t v69 = a1;
  uint64_t v62 = sub_280C(&qword_C6D0);
  __chkstk_darwin(v62);
  v65 = &v54[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v67 = sub_280C(&qword_C6F8);
  uint64_t v64 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  v63 = &v54[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_6720();
  uint64_t v72 = *(void *)(v8 - 8);
  uint64_t v73 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  int v11 = &v54[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  v70 = &v54[-v12];
  uint64_t v13 = sub_280C(&qword_C700);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = &v54[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_66F0();
  uint64_t v68 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v18 = &v54[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = sub_280C(&qword_C6F0);
  __chkstk_darwin(v19 - 8);
  v21 = &v54[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v22 = sub_280C(&qword_C6B0);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = &v54[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v26 = v5 + OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageContinuation;
  swift_beginAccess();
  sub_63C0(v26, (uint64_t)v21, &qword_C6F0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    sub_65AC((uint64_t)v21, &qword_C6F0);
    sub_6700();
    uint64_t v27 = sub_6710();
    os_log_type_t v28 = sub_6910();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_0, v27, v28, "Message arrived before monitoring enabled", v29, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v72 + 8))(v11, v73);
    return sub_579C((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    unint64_t v32 = v69;
    uint64_t v31 = v70;
    v60 = v18;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v23 + 32))(v25, v21, v22);
    sub_66D0();
    uint64_t v33 = v68;
    os_log_type_t v34 = v25;
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v68 + 48))(v15, 1, v16) == 1)
    {
      sub_65AC((uint64_t)v15, &qword_C700);
      unint64_t v30 = sub_67F0();
      sub_5A80();
      swift_allocError();
      (*(void (**)(uint64_t, void, unint64_t))(*(void *)(v30 - 8) + 104))(v35, enum case for AnnotationUIServiceError.unknownServiceUIMessage(_:), v30);
      swift_willThrow();
      (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v25, v22);
    }
    else
    {
      uint64_t v36 = v33;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v33 + 32))(v60, v15, v16);
      if (v32) {
        unint64_t v37 = v32;
      }
      else {
        unint64_t v37 = sub_579C((uint64_t)&_swiftEmptyArrayStorage);
      }
      unint64_t v38 = (unint64_t)v66;
      swift_bridgeObjectRetain();
      unint64_t v69 = v37;
      v66 = (char *)&type metadata for Any + 8;
      uint64_t v56 = sub_6820();
      unint64_t v40 = v39;
      sub_6700();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v41 = sub_6710();
      os_log_type_t v42 = sub_6920();
      int v55 = v42;
      BOOL v43 = os_log_type_enabled(v41, v42);
      v58 = v34;
      uint64_t v59 = v23;
      uint64_t v57 = v22;
      if (v43)
      {
        uint64_t v44 = swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 134349570;
        uint64_t v74 = v71;
        sub_6950();
        *(_WORD *)(v44 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v74 = sub_5AD8(v61, v38, &v75);
        sub_6950();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v44 + 22) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v74 = sub_5AD8(v56, v40, &v75);
        sub_6950();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v41, (os_log_type_t)v55, "Service got a message: %{public}ld from client: %{public}s. Payload: %{public}s", (uint8_t *)v44, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(unsigned char *, uint64_t))(v72 + 8))(v70, v73);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(unsigned char *, uint64_t))(v72 + 8))(v31, v73);
      }
      uint64_t v45 = v64;
      uint64_t v46 = v65;
      uint64_t v47 = v63;
      uint64_t v48 = *(int *)(v62 + 48);
      v49 = v60;
      uint64_t v50 = v16;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v36 + 16))(v65, v60, v16);
      *(void *)&v46[v48] = v69;
      uint64_t v51 = v57;
      uint64_t v52 = v58;
      sub_68B0();
      (*(void (**)(unsigned char *, uint64_t))(v45 + 8))(v47, v67);
      unint64_t v30 = sub_579C((uint64_t)&_swiftEmptyArrayStorage);
      (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v49, v50);
      (*(void (**)(unsigned char *, uint64_t))(v59 + 8))(v52, v51);
    }
  }
  return v30;
}

unint64_t sub_579C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_280C(&qword_C7A8);
  uint64_t v2 = sub_69C0();
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
    sub_63C0(v6, (uint64_t)v15, &qword_C7B0);
    unint64_t result = sub_637C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_6424(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_5A80()
{
  unint64_t result = qword_C708;
  if (!qword_C708)
  {
    sub_67F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C708);
  }
  return result;
}

uint64_t sub_5AD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5D48(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_5F54((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_5F54((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_5F04((uint64_t)v12);
  return v7;
}

uint64_t sub_5BAC()
{
  return type metadata accessor for ScreenSharingAnnotationUIService();
}

uint64_t type metadata accessor for ScreenSharingAnnotationUIService()
{
  uint64_t result = qword_C840;
  if (!qword_C840) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_5C00()
{
  sub_5CA4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_5CA4()
{
  if (!qword_C738)
  {
    sub_5D00(&qword_C6B0);
    unint64_t v0 = sub_6940();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C738);
    }
  }
}

uint64_t sub_5D00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5D48(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_6960();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_5FB0(a5, a6);
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
  uint64_t v8 = sub_69A0();
  if (!v8)
  {
    sub_69B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_69D0();
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

uint64_t sub_5F04(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_5F54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_5FB0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_6048(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6228(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6228(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_6048(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_61C0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_6990();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_69B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_6850();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_69D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_69B0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_61C0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_280C(&qword_C7A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_6228(char a1, int64_t a2, char a3, char *a4)
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
    sub_280C(&qword_C7A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_69D0();
  __break(1u);
  return result;
}

unint64_t sub_637C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_6970(*(void *)(v2 + 40));

  return sub_6434(a1, v4);
}

uint64_t sub_63C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_280C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_6424(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_6434(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_64FC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_6980();
      sub_6558((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_64FC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_6558(uint64_t a1)
{
  return a1;
}

uint64_t sub_65AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_280C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_6608(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_664C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_280C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_66B0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _s32ScreenSharingAccessibilityServer0aB19AnnotationUIServiceC39requiredEntitlementForProcessingMessage14withIdentifierSSSgSi_tFZ_0()
{
  return static AnnotationServiceConstants.accessibilityServiceEntitlement.getter();
}

uint64_t sub_66D0()
{
  return AnnotationUIServicesMessageID.init(rawValue:)();
}

uint64_t sub_66E0()
{
  return AnnotationUIServicesMessageID.rawValue.getter();
}

uint64_t sub_66F0()
{
  return type metadata accessor for AnnotationUIServicesMessageID();
}

uint64_t sub_6700()
{
  return static Logger.annotation.getter();
}

uint64_t sub_6710()
{
  return Logger.logObject.getter();
}

uint64_t sub_6720()
{
  return type metadata accessor for Logger();
}

uint64_t sub_6730()
{
  return ScreenSharingAnnotationCoordinator.init(withService:displayManager:)();
}

uint64_t sub_6740()
{
  return type metadata accessor for ScreenSharingAnnotationCoordinator();
}

uint64_t sub_6750()
{
  return ScreenSharingAnnotationDisplayManager.init()();
}

uint64_t sub_6760()
{
  return type metadata accessor for ScreenSharingAnnotationDisplayManager();
}

uint64_t sub_67B0()
{
  return type metadata accessor for TapGestureMessage();
}

uint64_t sub_67C0()
{
  return TapGestureMessage.init(_:)();
}

uint64_t sub_67D0()
{
  return type metadata accessor for DragGestureMessage();
}

uint64_t sub_67E0()
{
  return DragGestureMessage.init(_:)();
}

uint64_t sub_67F0()
{
  return type metadata accessor for AnnotationUIServiceError();
}

NSDictionary sub_6800()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_6810()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6820()
{
  return Dictionary.description.getter();
}

NSString sub_6830()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6840()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_6850()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_6860()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_6870()
{
  return static MainActor.shared.getter();
}

uint64_t sub_6880()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_6890()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_68A0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_68B0()
{
  return AsyncStream.Continuation.yield(_:)();
}

void sub_68C0()
{
}

uint64_t sub_68D0()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_68F0()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void sub_6900()
{
}

uint64_t sub_6910()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_6920()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_6930()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_6940()
{
  return type metadata accessor for Optional();
}

uint64_t sub_6950()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6960()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_6970(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_6980()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_6990()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_69A0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_69B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_69C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_69D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}