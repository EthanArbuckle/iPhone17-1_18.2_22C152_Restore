unint64_t GroupSessionState.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

BOOL sub_24640442C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_246404440()
{
  return sub_246426A00();
}

uint64_t sub_246404488()
{
  return sub_2464269F0();
}

uint64_t sub_2464044B4()
{
  return sub_246426A00();
}

uint64_t *sub_2464044F8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void sub_246404514(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_246404520(uint64_t a1)
{
  BOOL v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR___WKURLActivity_urlActivity];
  uint64_t v5 = sub_2464263F0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v9.receiver = v3;
  v9.super_class = v1;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v7;
}

uint64_t URLActivityWrapper.fallbackURL.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  sub_2464263E0();
  swift_endAccess();
  uint64_t v2 = sub_2464262C0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

id URLActivityWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void URLActivityWrapper.init()()
{
}

unint64_t variable initialization expression of GroupSessionWrapper.cancellables()
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) == 0 || !sub_246426950()) {
    return MEMORY[0x263F8EE88];
  }
  unint64_t v2 = MEMORY[0x263F8EE78];
  return sub_24640704C(v2);
}

id sub_246404970(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_2464049A4(a1);
}

id sub_2464049A4(uint64_t a1)
{
  v25[0] = swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AEF0);
  uint64_t v27 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  v26 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AEF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2464263F0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v1;
  uint64_t v28 = v3;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_246426950()) {
    unint64_t v14 = sub_24640704C(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v14 = MEMORY[0x263F8EE88];
  }
  *(void *)&v13[OBJC_IVAR___WKGroupSession_cancellables] = v14;
  v15 = &v13[OBJC_IVAR___WKGroupSession_newActivityCallback];
  *(void *)v15 = 0;
  *((void *)v15 + 1) = 0;
  v16 = &v13[OBJC_IVAR___WKGroupSession_stateChangedCallback];
  *(void *)v16 = 0;
  *((void *)v16 + 1) = 0;
  *(void *)&v13[OBJC_IVAR___WKGroupSession_groupSession] = a1;
  swift_retain();
  sub_2464263B0();
  v17 = (objc_class *)type metadata accessor for URLActivityWrapper();
  v18 = (char *)objc_allocWithZone(v17);
  v25[1] = a1;
  id v19 = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v18[OBJC_IVAR___WKURLActivity_urlActivity], v12, v9);
  v30.receiver = v19;
  v30.super_class = v17;
  id v20 = objc_msgSendSuper2(&v30, sel_init);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(void *)&v13[OBJC_IVAR___WKGroupSession_activityWrapper] = v20;

  v29.receiver = v13;
  v29.super_class = (Class)v25[0];
  id v21 = objc_msgSendSuper2(&v29, sel_init);
  swift_retain();
  sub_2464263C0();
  swift_release();
  swift_allocObject();
  swift_unknownObjectUnownedInit();
  sub_246407B48(&qword_268F7AF28, &qword_268F7AEF8);
  sub_2464266B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_beginAccess();
  sub_246426690();
  swift_endAccess();
  swift_release();
  swift_retain();
  v22 = v26;
  sub_246426390();
  swift_release();
  swift_allocObject();
  swift_unknownObjectUnownedInit();
  sub_246407B48(&qword_268F7AF30, &qword_268F7AEF0);
  uint64_t v23 = v28;
  sub_2464266B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v23);
  swift_beginAccess();
  sub_246426690();
  swift_endAccess();
  swift_release();

  swift_release();
  return v21;
}

uint64_t variable initialization expression of GroupSessionWrapper.newActivityCallback()
{
  return 0;
}

uint64_t variable initialization expression of GroupSessionWrapper.stateChangedCallback()
{
  return 0;
}

uint64_t sub_246404E94()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2464263F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_2464263B0();
  swift_release();
  uint64_t v6 = (objc_class *)type metadata accessor for URLActivityWrapper();
  id v7 = objc_allocWithZone(v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))((uint64_t)v7 + OBJC_IVAR___WKURLActivity_urlActivity, v5, v2);
  v17.receiver = v7;
  v17.super_class = v6;
  id v8 = objc_msgSendSuper2(&v17, sel_init);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = OBJC_IVAR___WKGroupSession_activityWrapper;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR___WKGroupSession_activityWrapper);
  *(void *)(v1 + OBJC_IVAR___WKGroupSession_activityWrapper) = v8;

  uint64_t v11 = (void (**)(void))(v1 + OBJC_IVAR___WKGroupSession_newActivityCallback);
  uint64_t result = swift_beginAccess();
  v13 = *v11;
  if (*v11)
  {
    unint64_t v14 = *(void **)(v1 + v9);
    sub_246407464((uint64_t)v13);
    id v15 = v14;
    v13();

    return sub_246407474((uint64_t)v13);
  }
  return result;
}

void sub_246405044(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AF38);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (void **)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  Strong = (char *)swift_unknownObjectUnownedLoadStrong();
  id v7 = &Strong[OBJC_IVAR___WKGroupSession_stateChangedCallback];
  swift_beginAccess();
  id v8 = *(void (**)(uint64_t))v7;
  if (*(void *)v7)
  {
    (*(void (**)(void **, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    int v9 = (*(uint64_t (**)(void **, uint64_t))(v3 + 88))(v5, v2);
    if (v9 == *MEMORY[0x263F08EE8])
    {
      (*(void (**)(void **, uint64_t))(v3 + 96))(v5, v2);
      uint64_t v10 = *v5;
      swift_retain();

LABEL_9:
      uint64_t v11 = 2;
      goto LABEL_10;
    }
    if (v9 == *MEMORY[0x263F08EF8])
    {
      swift_retain();
      uint64_t v11 = 0;
    }
    else
    {
      if (v9 != *MEMORY[0x263F08EF0])
      {
        v12 = *(void (**)(void **, uint64_t))(v3 + 8);
        swift_retain();
        v12(v5, v2);
        goto LABEL_9;
      }
      swift_retain();
      uint64_t v11 = 1;
    }
LABEL_10:
    v8(v11);
    sub_246407474((uint64_t)v8);
  }
}

id GroupSessionWrapper.activity.getter()
{
  return *(id *)(v0 + OBJC_IVAR___WKGroupSession_activityWrapper);
}

uint64_t GroupSessionWrapper.uuid.getter()
{
  swift_retain();
  sub_246426370();

  return swift_release();
}

uint64_t GroupSessionWrapper.state.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AF38);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (id *)((char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - v5;
  swift_retain();
  sub_246426380();
  swift_release();
  (*(void (**)(id *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  int v7 = (*(uint64_t (**)(id *, uint64_t))(v1 + 88))(v4, v0);
  if (v7 == *MEMORY[0x263F08EE8])
  {
    (*(void (**)(id *, uint64_t))(v1 + 96))(v4, v0);

LABEL_8:
    uint64_t v8 = 2;
    goto LABEL_9;
  }
  if (v7 == *MEMORY[0x263F08EF8])
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (v7 != *MEMORY[0x263F08EF0])
    {
      (*(void (**)(id *, uint64_t))(v1 + 8))(v4, v0);
      goto LABEL_8;
    }
    uint64_t v8 = 1;
  }
LABEL_9:
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v8;
}

uint64_t GroupSessionWrapper.newActivityCallback.getter()
{
  return sub_246405E48(&OBJC_IVAR___WKGroupSession_newActivityCallback, (void (*)(void, void))sub_246407BD8);
}

uint64_t GroupSessionWrapper.newActivityCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_246405FDC(a1, a2, &OBJC_IVAR___WKGroupSession_newActivityCallback, (uint64_t (*)(uint64_t, uint64_t))sub_246407BDC);
}

uint64_t (*GroupSessionWrapper.newActivityCallback.modify())()
{
  return j__swift_endAccess;
}

uint64_t GroupSessionWrapper.stateChangedCallback.getter()
{
  return sub_246405E48(&OBJC_IVAR___WKGroupSession_stateChangedCallback, (void (*)(void, void))sub_246407464);
}

uint64_t sub_2464058E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t GroupSessionWrapper.stateChangedCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_246405FDC(a1, a2, &OBJC_IVAR___WKGroupSession_stateChangedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_246407474);
}

uint64_t (*GroupSessionWrapper.stateChangedCallback.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall GroupSessionWrapper.join()()
{
}

Swift::Void __swiftcall GroupSessionWrapper.leave()()
{
}

uint64_t sub_246405AA0(void (*a1)(uint64_t))
{
  uint64_t v2 = swift_retain();
  a1(v2);

  return swift_release();
}

uint64_t sub_246405B08(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v4 = a1;
  uint64_t v5 = swift_retain();
  a3(v5);

  return swift_release();
}

Swift::Void __swiftcall GroupSessionWrapper.coordinate(coordinator:)(AVPlaybackCoordinator coordinator)
{
  swift_retain();
  sub_246426870();

  swift_release();
}

void GroupSessionWrapper.init()()
{
}

id _s14libWebKitSwift18URLActivityWrapperCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of GroupSessionObserver.newSessionCallback()
{
  return 0;
}

uint64_t GroupSessionObserver.newSessionCallback.getter()
{
  return sub_246405E48(&OBJC_IVAR___WKGroupSessionObserver_newSessionCallback, (void (*)(void, void))sub_246407BD8);
}

uint64_t sub_246405E48(void *a1, void (*a2)(void, void))
{
  id v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

void sub_246405EB0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t GroupSessionObserver.newSessionCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_246405FDC(a1, a2, &OBJC_IVAR___WKGroupSessionObserver_newSessionCallback, (uint64_t (*)(uint64_t, uint64_t))sub_246407BDC);
}

uint64_t sub_246405FDC(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*GroupSessionObserver.newSessionCallback.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of GroupSessionObserver.incomingSessionsTask()
{
  return 0;
}

char *GroupSessionObserver.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = &v0[OBJC_IVAR___WKGroupSessionObserver_newSessionCallback];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v0[OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask] = 0;
  uint64_t v5 = (objc_class *)type metadata accessor for GroupSessionObserver();
  v12.receiver = v0;
  v12.super_class = v5;
  uint64_t v6 = (char *)objc_msgSendSuper2(&v12, sel_init);
  uint64_t v7 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  uint64_t v10 = sub_246406B18((uint64_t)v3, (uint64_t)&unk_268F7AF58, (uint64_t)v9);
  sub_2464076A8((uint64_t)v3);
  *(void *)&v6[OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask] = v10;
  swift_release();
  return v6;
}

uint64_t sub_246406210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[14] = a4;
  uint64_t v5 = sub_2464266C0();
  v4[15] = v5;
  v4[16] = *(void *)(v5 - 8);
  v4[17] = swift_task_alloc();
  uint64_t v6 = sub_2464266E0();
  v4[18] = v6;
  v4[19] = *(void *)(v6 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AF80);
  v4[21] = v7;
  v4[22] = *(void *)(v7 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AF88);
  v4[24] = v8;
  v4[25] = *(void *)(v8 - 8);
  v4[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2464063EC, 0, 0);
}

uint64_t sub_2464063EC()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  sub_2464263F0();
  sub_246407B8C(&qword_268F7AF90, MEMORY[0x263F08F40]);
  sub_2464263D0();
  sub_2464263A0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  uint64_t v4 = sub_246407B48(&qword_268F7AF98, &qword_268F7AF88);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[27] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24640657C;
  uint64_t v6 = v0[24];
  return MEMORY[0x270FA1E80](v0 + 11, v6, v4);
}

uint64_t sub_24640657C()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_246406A50;
  }
  else {
    uint64_t v2 = sub_246406690;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_246406690()
{
  *(void *)(v0 + 232) = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_2464066B4, 0, 0);
}

uint64_t sub_2464066B4()
{
  uint64_t v1 = v0[29];
  if (v1)
  {
    uint64_t v2 = v0[20];
    uint64_t v18 = v0[18];
    uint64_t v15 = v0[17];
    uint64_t v3 = v0[15];
    uint64_t v16 = v0[16];
    uint64_t v17 = v0[19];
    uint64_t v4 = v0[14] + 16;
    sub_2464079E8();
    unint64_t v14 = (void *)sub_246426850();
    uint64_t v5 = swift_allocObject();
    uint64_t v6 = (void *)MEMORY[0x24C52C7D0](v4);
    swift_unknownObjectWeakInit();

    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    *(void *)(v7 + 24) = v1;
    v0[6] = sub_246407A68;
    v0[7] = v7;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_246406AD4;
    v0[5] = &block_descriptor_49;
    uint64_t v8 = _Block_copy(v0 + 2);
    swift_retain();
    swift_retain();
    sub_2464266D0();
    v0[13] = MEMORY[0x263F8EE78];
    sub_246407B8C(&qword_268F7AFB0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AFB8);
    sub_246407B48(&qword_268F7AFC0, &qword_268F7AFB8);
    sub_2464268B0();
    MEMORY[0x24C52BFC0](0, v2, v15, v8);
    _Block_release(v8);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v3);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v18);
    swift_release();
    swift_release();
    uint64_t v9 = sub_246407B48(&qword_268F7AF98, &qword_268F7AF88);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[27] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_24640657C;
    uint64_t v11 = v0[24];
    return MEMORY[0x270FA1E80](v0 + 11, v11, v9);
  }
  else
  {
    (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    objc_super v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_246406A50()
{
  *(void *)(v0 + 96) = *(void *)(v0 + 224);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AFA0);
  uint64_t v1 = MEMORY[0x263F8E628];
  uint64_t v2 = swift_dynamicCast();
  uint64_t v3 = MEMORY[0x263F8E658];
  return MEMORY[0x270FA0678](v2, v1, v3);
}

uint64_t sub_246406AD4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_246406B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246407890(a1, (uint64_t)v8);
  uint64_t v9 = sub_246426800();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2464076A8((uint64_t)v8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_2464267A0();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_2464267F0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

id GroupSessionObserver.__deallocating_deinit()
{
  if (*(void *)&v0[OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask])
  {
    swift_retain();
    sub_246426810();
    swift_release();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GroupSessionObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246406E78(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_246406F54;
  return v6(a1);
}

uint64_t sub_246406F54()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_24640704C(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_246426950();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AFC8);
      uint64_t result = sub_2464268D0();
      unint64_t v3 = result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_246426950();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  unint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  unint64_t v8 = v3 + 56;
  unint64_t v22 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v21 = v1;
  while (v22)
  {
    uint64_t result = MEMORY[0x24C52C070](v7, v1);
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_26;
    }
LABEL_18:
    sub_2464266A0();
    sub_246407B8C(&qword_268F7AFD0, MEMORY[0x263EFDD18]);
    uint64_t result = sub_2464266F0();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)(v8 + 8 * (v12 >> 6));
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_246407B8C(&qword_268F7AFD8, MEMORY[0x263EFDD18]);
      do
      {
        uint64_t result = sub_246426720();
        if (result)
        {
          uint64_t result = swift_release();
          unint64_t v1 = v21;
          goto LABEL_11;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)(v8 + 8 * (v12 >> 6));
        uint64_t v15 = 1 << v12;
      }
      while ((v14 & (1 << v12)) != 0);
      unint64_t v1 = v21;
    }
    *(void *)(v8 + 8 * v13) = v15 | v14;
    *(void *)(*(void *)(v3 + 48) + 8 * v12) = v9;
    uint64_t v17 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v17, 1);
    uint64_t v18 = v17 + 1;
    if (v10) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v18;
LABEL_11:
    if (v7 == v5) {
      return v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_28;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  uint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
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

uint64_t type metadata accessor for URLActivityWrapper()
{
  uint64_t result = qword_268F7B7D0;
  if (!qword_268F7B7D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246407390()
{
  swift_unknownObjectUnownedDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2464073C8()
{
  id Strong = (id)swift_unknownObjectUnownedLoadStrong();
  sub_246404E94();
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

void sub_24640745C(uint64_t a1)
{
}

uint64_t sub_246407464(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_246407474(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for GroupSessionObserver()
{
  return self;
}

uint64_t sub_2464074A8()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2464074E0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246407520()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_2464075B4;
  return sub_246406210((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_2464075B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2464076A8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24640770C()
{
  unint64_t result = qword_268F7AF60;
  if (!qword_268F7AF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F7AF60);
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupSessionState()
{
  return &type metadata for GroupSessionState;
}

uint64_t sub_246407770()
{
  return type metadata accessor for URLActivityWrapper();
}

uint64_t sub_246407778()
{
  uint64_t result = sub_2464263F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for GroupSessionWrapper()
{
  return self;
}

uint64_t sub_24640782C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_24640787C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_246407890(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2464078F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246407930(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2464075B4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268F7AF70 + dword_268F7AF70);
  return v6(a1, v4);
}

unint64_t sub_2464079E8()
{
  unint64_t result = qword_268F7AFA8;
  if (!qword_268F7AFA8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F7AFA8);
  }
  return result;
}

uint64_t sub_246407A28()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_246407A68()
{
  uint64_t v1 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x24C52C7D0](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x60))();
    if (v4)
    {
      uint64_t v5 = (void (*)(void))v4;
      id v6 = objc_allocWithZone((Class)type metadata accessor for GroupSessionWrapper());
      uint64_t v7 = swift_retain();
      id v8 = sub_2464049A4(v7);
      v5();

      sub_246407474((uint64_t)v5);
    }
  }
}

uint64_t sub_246407B48(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_246407B8C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246407C0C()
{
  uint64_t v0 = sub_246426560();
  __swift_allocate_value_buffer(v0, qword_268F7B7E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_268F7B7E8);
  return sub_246426550();
}

uint64_t static MarketplaceKitWrapper.requestAppInstallation(topOrigin:url:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a3;
  uint64_t v29 = a4;
  uint64_t v31 = a1;
  uint64_t v5 = sub_2464262C0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  objc_super v30 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  BOOL v10 = (char *)&v28 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v15(v10, a2, v5);
  v15((char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v5);
  sub_2464267E0();
  swift_retain();
  uint64_t v16 = sub_2464267D0();
  uint64_t v17 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = (v7 + v17 + v18) & ~v17;
  unint64_t v20 = (v7 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = MEMORY[0x263F8F500];
  *(void *)(v21 + 16) = v16;
  *(void *)(v21 + 24) = v22;
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v6 + 32);
  v23(v21 + v18, v10, v5);
  v23(v21 + v19, v30, v5);
  uint64_t v24 = v33;
  *(void *)(v21 + v20) = v32;
  v25 = (void *)(v21 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v26 = v29;
  void *v25 = v24;
  v25[1] = v26;
  sub_246408A30((uint64_t)v13, (uint64_t)&unk_268F7AFE8, v21);
  return swift_release();
}

uint64_t sub_246407F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a4;
  v8[8] = a5;
  uint64_t v9 = sub_2464262C0();
  v8[11] = v9;
  v8[12] = *(void *)(v9 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  sub_2464267E0();
  v8[17] = sub_2464267D0();
  uint64_t v11 = sub_2464267A0();
  v8[18] = v11;
  v8[19] = v10;
  return MEMORY[0x270FA2498](sub_246408030, v11, v10);
}

uint64_t sub_246408030()
{
  sub_246426360();
  v0[20] = sub_246426350();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[21] = v1;
  void *v1 = v0;
  v1[1] = sub_2464080E0;
  uint64_t v3 = v0[7];
  uint64_t v2 = v0[8];
  return MEMORY[0x270EF5968](v3, v2);
}

uint64_t sub_2464080E0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 144);
    uint64_t v4 = *(void *)(v2 + 152);
    uint64_t v5 = sub_246408510;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 144);
    uint64_t v4 = *(void *)(v2 + 152);
    uint64_t v5 = sub_2464081FC;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2464081FC()
{
  uint64_t v28 = v0;
  swift_release();
  if (qword_268F7B7E0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v7 = sub_246426560();
  __swift_project_value_buffer(v7, (uint64_t)qword_268F7B7E8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8(v2, v6, v4);
  v8(v3, v1, v4);
  uint64_t v9 = sub_246426540();
  os_log_type_t v10 = sub_246426830();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v13 = *(void *)(v0 + 120);
  uint64_t v12 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 88);
  uint64_t v15 = *(void *)(v0 + 96);
  if (v11)
  {
    uint64_t v25 = *(void *)(v0 + 120);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = v26;
    *(_DWORD *)uint64_t v16 = 136643075;
    sub_2464099F8();
    uint64_t v17 = sub_2464269A0();
    *(void *)(v0 + 40) = sub_2464093A0(v17, v18, &v27);
    sub_246426890();
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v19(v12, v14);
    *(_WORD *)(v16 + 12) = 2085;
    uint64_t v20 = sub_2464269A0();
    *(void *)(v0 + 48) = sub_2464093A0(v20, v21, &v27);
    sub_246426890();
    swift_bridgeObjectRelease();
    v19(v25, v14);
    _os_log_impl(&dword_246402000, v9, v10, "WKMarketplaceKit.requestAppInstallation with top origin %{sensitive}s for %{sensitive}s succeeded", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C52C6E0](v26, -1, -1);
    MEMORY[0x24C52C6E0](v16, -1, -1);
  }
  else
  {
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v22(*(void *)(v0 + 128), *(void *)(v0 + 88));
    v22(v13, v14);
  }
  (*(void (**)(void))(v0 + 72))(0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_246408510()
{
  v39 = v0;
  swift_release();
  swift_release();
  if (qword_268F7B7E0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[22];
  uint64_t v3 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[12];
  uint64_t v7 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v8 = sub_246426560();
  __swift_project_value_buffer(v8, (uint64_t)qword_268F7B7E8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v9(v2, v6, v4);
  v9(v3, v7, v4);
  id v10 = v1;
  id v11 = v1;
  uint64_t v12 = sub_246426540();
  os_log_type_t v13 = sub_246426840();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = (void *)v0[22];
  uint64_t v17 = v0[13];
  uint64_t v16 = v0[14];
  uint64_t v19 = v0[11];
  uint64_t v18 = v0[12];
  if (v14)
  {
    log = v12;
    uint64_t v20 = swift_slowAlloc();
    v35 = (void *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v38 = v37;
    *(_DWORD *)uint64_t v20 = 136643331;
    sub_2464099F8();
    uint64_t v21 = sub_2464269A0();
    os_log_type_t type = v13;
    v0[2] = sub_2464093A0(v21, v22, &v38);
    sub_246426890();
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v23(v16, v19);
    *(_WORD *)(v20 + 12) = 2085;
    uint64_t v24 = sub_2464269A0();
    v0[3] = sub_2464093A0(v24, v25, &v38);
    sub_246426890();
    swift_bridgeObjectRelease();
    v23(v17, v19);
    *(_WORD *)(v20 + 22) = 2114;
    id v26 = v15;
    uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v27;
    sub_246426890();
    void *v35 = v27;

    _os_log_impl(&dword_246402000, log, type, "WKMarketplaceKit.requestAppInstallation with top origin %{sensitive}s for %{sensitive}s failed: %{public}@", (uint8_t *)v20, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B008);
    swift_arrayDestroy();
    MEMORY[0x24C52C6E0](v35, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C52C6E0](v37, -1, -1);
    MEMORY[0x24C52C6E0](v20, -1, -1);
  }
  else
  {
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v28(v0[14], v0[11]);
    v28(v17, v19);
  }
  uint64_t v29 = (void *)v0[22];
  objc_super v30 = (void (*)(void *))v0[9];
  id v31 = v29;
  v30(v29);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t sub_246408908()
{
  uint64_t v2 = *(void *)(sub_2464262C0() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (v5 + v3 + v4) & ~v3;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = (uint64_t *)(v0 + ((((v5 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v12;
  void *v12 = v1;
  v12[1] = sub_246409B64;
  return sub_246407F10((uint64_t)v12, v13, v14, v7, v8, v15, v10, v11);
}

uint64_t sub_246408A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246426800();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2464267F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2464076A8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2464267A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_246408F40(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_246426290();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id MarketplaceKitWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id MarketplaceKitWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id MarketplaceKitWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MarketplaceKitWrapper()
{
  return self;
}

uint64_t sub_2464090B0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2464090E8(uint64_t a1)
{
  sub_246408F40(a1, *(void *)(v1 + 16));
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_2464262C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  unint64_t v8 = ((((v5 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v8, v6);
}

uint64_t sub_246409208()
{
  uint64_t v2 = *(void *)(sub_2464262C0() - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (v5 + v3 + v4) & ~v3;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = v0 + v6;
  uint64_t v9 = (uint64_t *)(v0 + ((((v5 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v12;
  void *v12 = v1;
  v12[1] = sub_2464075B4;
  return sub_246407F10((uint64_t)v12, v13, v14, v7, v8, v15, v10, v11);
}

uint64_t sub_246409330()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2464093A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_246409474(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_246409AA0((uint64_t)v12, *a3);
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
      sub_246409AA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_246409474(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2464268A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_246409630(a5, a6);
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
  uint64_t v8 = sub_246426920();
  if (!v8)
  {
    sub_246426930();
    __break(1u);
LABEL_17:
    uint64_t result = sub_246426990();
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

uint64_t sub_246409630(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2464096C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2464098A8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2464098A8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2464096C8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_246409840(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2464268F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_246426930();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_246426770();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_246426990();
    __break(1u);
LABEL_14:
    uint64_t result = sub_246426930();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_246409840(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B010);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2464098A8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B010);
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
  uint64_t result = sub_246426990();
  __break(1u);
  return result;
}

unint64_t sub_2464099F8()
{
  unint64_t result = qword_268F7B000;
  if (!qword_268F7B000)
  {
    sub_2464262C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F7B000);
  }
  return result;
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

uint64_t sub_246409AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_246409B68()
{
  uint64_t v0 = type metadata accessor for PlatformIntelligenceTextEffectID();
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  size_t v5 = (char *)&v8 - v4;
  sub_246426900();
  sub_246426900();
  char v6 = sub_2464262E0();
  sub_246409CA4((uint64_t)v3);
  sub_246409CA4((uint64_t)v5);
  return v6 & 1;
}

uint64_t type metadata accessor for PlatformIntelligenceTextEffectID()
{
  uint64_t result = qword_268F7BE20;
  if (!qword_268F7BE20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246409CA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PlatformIntelligenceTextEffectID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246409D00(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_246409D34(uint64_t a1, uint64_t a2, void *a3, const void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v7 - 8);
  int64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  size_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268F7B128;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268F7B130;
  v14[5] = v13;
  id v15 = a3;
  swift_retain();
  sub_24640EEA4((uint64_t)v9, (uint64_t)&unk_268F7B138, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_246409EB4(uint64_t a1, uint64_t a2, void *a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = *a3;
  sub_2464267E0();
  v3[6] = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_246409F78, v5, v4);
}

uint64_t sub_246409F78()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = (const void *)v0[3];
  uint64_t v3 = (void *)v0[2];
  swift_release();
  v0[7] = _Block_copy(v2);
  id v4 = v3;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[8] = v5;
  uint64_t v6 = *(void *)(v1 + 80);
  uint64_t v7 = *(void *)(v1 + 88);
  *uint64_t v5 = v0;
  v5[1] = sub_24640A044;
  uint64_t v8 = v0[2];
  return sub_2464112DC(v8, v6, v7);
}

uint64_t sub_24640A044(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 56);
  id v4 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();
  id v5 = a1;
  swift_release();

  ((void (**)(void, id))v3)[2](v3, v5);
  _Block_release(v3);

  uint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_24640A1B4(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 128) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  *(void *)(v3 + 32) = *v2;
  sub_2464267E0();
  *(void *)(v3 + 40) = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  *(void *)(v3 + 48) = v5;
  *(void *)(v3 + 56) = v4;
  return MEMORY[0x270FA2498](sub_24640A278, v5, v4);
}

uint64_t sub_24640A278()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v21 = *(void *)(v1 + 88);
  *(void *)(v0 + 64) = v21;
  uint64_t v3 = *(void *)(v1 + 80);
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = swift_getAssociatedTypeWitness();
  *(void *)(v0 + 88) = swift_getAssociatedConformanceWitness();
  type metadata accessor for UIPonderingTextEffectTextChunkAdapter();
  uint64_t v4 = (void *)swift_dynamicCastClass();
  if (v4)
  {
    *(void *)(v0 + 96) = *(void *)(*(void *)(v0 + 24) + 16);
    uint64_t v19 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 32) + **(int **)(v21 + 32));
    uint64_t v5 = (char *)v4 + *(void *)(qword_268F7BD00 + (*MEMORY[0x263F8EED0] & *v4) + 16);
    id v6 = v2;
    swift_unknownObjectRetain();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_24640A5C4;
    uint64_t v8 = *(unsigned __int8 *)(v0 + 128);
    uint64_t v9 = v5;
    uint64_t v10 = v3;
    uint64_t v11 = v21;
    uint64_t v12 = v19;
LABEL_5:
    return v12(v9, v8, v10, v11);
  }
  type metadata accessor for UIReplacementTextEffectTextChunkAdapter();
  uint64_t v13 = (void *)swift_dynamicCastClass();
  if (v13)
  {
    *(void *)(v0 + 112) = *(void *)(*(void *)(v0 + 24) + 16);
    uint64_t v20 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 + 32) + **(int **)(v21 + 32));
    uint64_t v14 = (char *)v13 + *(void *)(qword_268F7BD90 + (*MEMORY[0x263F8EED0] & *v13) + 16);
    id v15 = v2;
    swift_unknownObjectRetain();
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v16;
    void *v16 = v0;
    v16[1] = sub_24640A8CC;
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v8 = *(unsigned __int8 *)(v0 + 128);
    uint64_t v9 = v14;
    uint64_t v12 = v20;
    goto LABEL_5;
  }
  swift_release();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_24640A5C4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24640A708, v3, v2);
}

uint64_t sub_24640A708()
{
  uint64_t v1 = *(void **)(v0 + 16);
  type metadata accessor for UIReplacementTextEffectTextChunkAdapter();
  uint64_t v2 = (void *)swift_dynamicCastClass();
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 64);
    *(void *)(v0 + 112) = *(void *)(*(void *)(v0 + 24) + 16);
    uint64_t v12 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 32) + **(int **)(v3 + 32));
    uint64_t v4 = (char *)v2 + *(void *)(qword_268F7BD90 + (*MEMORY[0x263F8EED0] & *v2) + 16);
    id v5 = v1;
    swift_unknownObjectRetain();
    id v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v6;
    *id v6 = v0;
    v6[1] = sub_24640A8CC;
    uint64_t v8 = *(void *)(v0 + 64);
    uint64_t v7 = *(void *)(v0 + 72);
    uint64_t v9 = *(unsigned __int8 *)(v0 + 128);
    return v12(v4, v9, v7, v8);
  }
  else
  {
    swift_release();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_24640A8CC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24640AA10, v3, v2);
}

uint64_t sub_24640AA10()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24640AA78(uint64_t a1, uint64_t a2, void *a3, char a4, const void *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = a1;
  uint64_t v14 = sub_246426800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268F7B0E0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  void v16[4] = &unk_268F7B0F0;
  v16[5] = v15;
  id v17 = a3;
  swift_retain();
  sub_24640EEA4((uint64_t)v11, (uint64_t)&unk_268F7B100, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_24640AC00(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = a4;
  *(unsigned char *)(v4 + 64) = a2;
  *(void *)(v4 + 16) = a1;
  sub_2464267E0();
  *(void *)(v4 + 40) = sub_2464267D0();
  uint64_t v6 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24640ACA0, v6, v5);
}

uint64_t sub_24640ACA0()
{
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = _Block_copy(v1);
  id v3 = v2;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_24640AD6C;
  char v5 = *(unsigned char *)(v0 + 64);
  uint64_t v6 = *(void *)(v0 + 16);
  return sub_24640A1B4(v6, v5);
}

uint64_t sub_24640AD6C()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 48);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_release();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24640AEC8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

void sub_24640AF00()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B250);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246426620();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x24C52C7D0](v0 + 24);
  if (v9)
  {
    uint64_t v10 = (char *)v9;
    sub_246426570();
    uint64_t v11 = &v10[qword_268F7B040];
    swift_beginAccess();
    uint64_t v12 = *(void *)v11;
    if (*(void *)(v12 + 16) && (unint64_t v13 = sub_24640F12C((uint64_t)v8), (v14 & 1) != 0))
    {
      sub_246412638(*(void *)(v12 + 56) + 40 * v13, (uint64_t)&v21);
    }
    else
    {
      uint64_t v23 = 0;
      long long v21 = 0u;
      long long v22 = 0u;
    }
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (*((void *)&v22 + 1))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B0A8);
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      type metadata accessor for PlatformIntelligenceReplacementTextEffect();
      if (swift_dynamicCast())
      {
        uint64_t v15 = v20[1];
        uint64_t v16 = sub_246426800();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 1, 1, v16);
        sub_2464267E0();
        swift_retain();
        swift_retain();
        uint64_t v17 = sub_2464267D0();
        uint64_t v18 = (void *)swift_allocObject();
        uint64_t v19 = MEMORY[0x263F8F500];
        v18[2] = v17;
        v18[3] = v19;
        v18[4] = v1;
        v18[5] = v15;
        sub_246408A30((uint64_t)v4, (uint64_t)&unk_268F7B0B8, (uint64_t)v18);

        swift_release();
        swift_release();
        return;
      }
    }
    else
    {
      sub_24641269C((uint64_t)&v21, &qword_268F7B0A0);
    }
  }
}

uint64_t sub_24640B22C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  v5[4] = *a4;
  sub_2464267E0();
  v5[5] = sub_2464267D0();
  uint64_t v7 = sub_2464267A0();
  v5[6] = v7;
  v5[7] = v6;
  return MEMORY[0x270FA2498](sub_24640B2EC, v7, v6);
}

uint64_t sub_24640B2EC()
{
  uint64_t v1 = v0[4];
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 + 56) + **(int **)(v2 + 56));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  void *v4 = v0;
  v4[1] = sub_24640B3F0;
  uint64_t v5 = v0[3];
  return v7(v5, v3, v2);
}

uint64_t sub_24640B3F0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24640B510, v3, v2);
}

uint64_t sub_24640B510()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24640B570()
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24640B5B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  uint64_t v9 = *(void *)(a4 + 80);
  uint64_t v10 = *(void *)(a4 + 88);
  *uint64_t v7 = v4;
  v7[1] = sub_24640B64C;
  return sub_246411588(a1, v8, v9, v10);
}

uint64_t sub_24640B64C(void *a1)
{
  uint64_t v6 = *v1;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void *))(v6 + 8);
  id v3 = a1;
  return v5(a1);
}

uint64_t sub_24640B754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_246409B64;
  return MEMORY[0x270F81A90](a1, a2, a3, a4, a5);
}

void sub_24640B81C()
{
}

uint64_t sub_24640B840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_246409B64;
  return MEMORY[0x270F81A90](a1, a2, a3, a4, a5);
}

void sub_24640B908()
{
}

void sub_24640B918()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v0) + qword_268F7BD00)
                                             - 8)
                                 + 8))(&v0[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v0) + qword_268F7BD00 + 16)]);
  uint64_t v2 = *(void **)&v0[*(void *)(qword_268F7BD00 + (*v1 & *(void *)v0) + 24)];
}

void sub_24640BA00(char *a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + qword_268F7BD00)
                                             - 8)
                                 + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + qword_268F7BD00 + 16)]);
  id v3 = *(void **)&a1[*(void *)(qword_268F7BD00 + (*v2 & *(void *)a1) + 24)];
}

void sub_24640BAE8()
{
}

void sub_24640BAF8()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v0) + qword_268F7BD90)
                                             - 8)
                                 + 8))(&v0[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v0) + qword_268F7BD90 + 16)]);

  uint64_t v2 = *(void **)&v0[*(void *)(qword_268F7BD90 + (*v1 & *(void *)v0) + 32)];
}

void sub_24640BC1C(char *a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + qword_268F7BD90)
                                             - 8)
                                 + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + qword_268F7BD90 + 16)]);

  id v3 = *(void **)&a1[*(void *)(qword_268F7BD90 + (*v2 & *(void *)a1) + 32)];
}

uint64_t sub_24640BD44()
{
  return sub_246426A00();
}

uint64_t sub_24640BDCC()
{
  sub_246426320();
  sub_246412730(&qword_268F7B018, MEMORY[0x263F07508]);

  return sub_246426700();
}

uint64_t sub_24640BE50()
{
  return sub_246426A00();
}

unint64_t sub_24640BED8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F7B160);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B150);
  uint64_t v6 = sub_246426980();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (long long *)&v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_246412C90(v12, (uint64_t)v5, (uint64_t *)&unk_268F7B160);
    unint64_t result = sub_24640F12C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_246426620();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = sub_246412C78(v9, v7[7] + 40 * v16);
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

unint64_t sub_24640C0D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B158);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B148);
  uint64_t v6 = sub_246426980();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_246412C90(v12, (uint64_t)v5, &qword_268F7B158);
    unint64_t result = sub_24640F1C4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for PlatformIntelligenceTextEffectID();
    sub_246412C14((uint64_t)v5, v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16);
    uint64_t v19 = v7[7];
    uint64_t v20 = sub_246426620();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v16, v9, v20);
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v7[2] = v23;
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

void sub_24640C2F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  sub_246411864();
}

id sub_24640C31C(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_2464118FC(a1);
  swift_unknownObjectRelease();
  return v4;
}

id sub_24640C360()
{
  uint64_t v1 = *(void **)&v0[qword_268F7B020];
  objc_msgSend(v0, sel_addSubview_, v1);
  objc_msgSend(v0, sel_bounds);

  return objc_msgSend(v1, sel_setFrame_);
}

uint64_t sub_24640C3C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  uint64_t v8 = *MEMORY[0x263F8EED0] & *v4;
  v5[6] = sub_2464267E0();
  v5[7] = sub_2464267D0();
  uint64_t v13 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 48) + **(int **)(a4 + 48));
  uint64_t v9 = (void *)swift_task_alloc();
  v5[8] = v9;
  uint64_t v10 = *(void *)(v8 + 80);
  uint64_t v11 = *(void *)(v8 + 88);
  *uint64_t v9 = v5;
  v9[1] = sub_24640C538;
  return v13(v4, v10, v11, a3, a4);
}

uint64_t sub_24640C538()
{
  swift_task_dealloc();
  uint64_t v1 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24640C674, v1, v0);
}

uint64_t sub_24640C674()
{
  swift_release();
  sub_246426900();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24640C6F4(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  v2[10] = swift_task_alloc();
  uint64_t v3 = sub_246426620();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  sub_2464267E0();
  v2[15] = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24640C828, v5, v4);
}

uint64_t sub_24640C828()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[8];
  swift_release();
  swift_beginAccess();
  sub_24640F570(v4, v3);
  swift_endAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24641269C(v0[10], &qword_268F7B170);
  }
  else
  {
    uint64_t v6 = v0[13];
    uint64_t v5 = v0[14];
    uint64_t v7 = v0[11];
    uint64_t v8 = v0[12];
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 32))(v5, v0[10], v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    uint64_t v12 = 0;
    memset(v11, 0, sizeof(v11));
    swift_beginAccess();
    sub_24640C9F8((uint64_t)v11, v6);
    swift_endAccess();
    sub_2464265D0();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_24640C9F8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_246412C78((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_24641099C(v9, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v8;
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_246426620();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_24641269C(a1, &qword_268F7B0A0);
    sub_24640F728(a2, (uint64_t)v9);
    uint64_t v7 = sub_246426620();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a2, v7);
    return sub_24641269C((uint64_t)v9, &qword_268F7B0A0);
  }
}

uint64_t sub_24640CB18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246426620();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_24641269C(a1, &qword_268F7B170);
    sub_24640F570(a2, (uint64_t)v8);
    sub_246409CA4(a2);
    return sub_24641269C((uint64_t)v8, &qword_268F7B170);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2464107D4((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16;
    swift_bridgeObjectRelease();
    return sub_246409CA4(a2);
  }
}

uint64_t sub_24640CCE4()
{
  uint64_t v1 = v0;
  sub_246426630();
  uint64_t v2 = MEMORY[0x263F8EE78];
  unint64_t v3 = sub_24640C0D8(MEMORY[0x263F8EE78]);
  uint64_t v4 = (unint64_t *)(v1 + qword_268F7B038);
  swift_beginAccess();
  unint64_t *v4 = v3;
  swift_bridgeObjectRelease();
  unint64_t v5 = sub_24640BED8(v2);
  uint64_t v6 = (unint64_t *)(v1 + qword_268F7B040);
  swift_beginAccess();
  *uint64_t v6 = v5;
  return swift_bridgeObjectRelease();
}

void sub_24640CD9C()
{
}

uint64_t sub_24640CDE0(uint64_t a1)
{
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24640CE5C(uint64_t a1)
{
  return sub_24640E180(a1, (void (*)(uint64_t))sub_24640CE74);
}

uint64_t *sub_24640CE74(uint64_t a1)
{
  uint64_t v3 = *v1;
  sub_246426310();
  *((unsigned char *)v1 + *(void *)(*v1 + 112)) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 32))((uint64_t)v1 + *(void *)(*v1 + 104), a1);
  return v1;
}

uint64_t sub_24640CF24(void *a1)
{
  v2[15] = a1;
  v2[16] = v1;
  v2[17] = *v1;
  v2[18] = *MEMORY[0x263F8EED0] & *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  v2[19] = swift_task_alloc();
  type metadata accessor for PlatformIntelligenceTextEffectID();
  v2[20] = swift_task_alloc();
  uint64_t v3 = sub_246426620();
  v2[21] = v3;
  v2[22] = *(void *)(v3 - 8);
  v2[23] = swift_task_alloc();
  uint64_t v4 = sub_246426680();
  v2[24] = v4;
  v2[25] = *(void *)(v4 - 8);
  v2[26] = swift_task_alloc();
  sub_2464267E0();
  v2[27] = sub_2464267D0();
  uint64_t v6 = sub_2464267A0();
  v2[28] = v6;
  v2[29] = v5;
  return MEMORY[0x270FA2498](sub_24640D130, v6, v5);
}

uint64_t sub_24640D130()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[16];
  v0[30] = *(void *)(v0[15] + qword_268F7B048);
  uint64_t v3 = *(void *)(*(void *)v2 + 104);
  v0[31] = v3;
  uint64_t v4 = *(void *)(v1 + 88);
  v0[32] = v4;
  uint64_t v5 = *(int **)(v4 + 24);
  uint64_t v6 = *(void *)(v1 + 80);
  v0[33] = v6;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v5 + *v5);
  uint64_t v7 = v2 + v3;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[34] = v8;
  void *v8 = v0;
  v8[1] = sub_24640D26C;
  return v10(v7, v6, v4);
}

uint64_t sub_24640D26C(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 280) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 232);
  uint64_t v4 = *(void *)(v2 + 224);
  return MEMORY[0x270FA2498](sub_24640D394, v4, v3);
}

uint64_t sub_24640D394()
{
  if (v0[35])
  {
    uint64_t v1 = v0[31];
    uint64_t v2 = v0[16];
    uint64_t v8 = (uint64_t (*)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v0[32] + 32)
                                                                   + **(int **)(v0[32] + 32));
    uint64_t v3 = (void *)swift_task_alloc();
    v0[36] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24640D4FC;
    uint64_t v5 = v0[32];
    uint64_t v4 = v0[33];
    return v8(v2 + v1, 0, v4, v5);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_24640D4FC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 232);
  uint64_t v3 = *(void *)(v1 + 224);
  return MEMORY[0x270FA2498](sub_24640D61C, v3, v2);
}

uint64_t sub_24640D61C()
{
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v4 = v0[16];
  uint64_t v3 = v0[17];
  v0[37] = *(void *)(v3 + 80);
  v0[38] = *(void *)(v3 + 88);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128))(*(void *)(v1 + 40)
                                                                                   + **(int **)(v1 + 40));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[39] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24640D730;
  uint64_t v7 = v0[32];
  uint64_t v6 = v0[33];
  uint64_t v8 = v0[16];
  v9.n128_u64[0] = 0;
  v10.n128_u64[0] = 0;
  return v12(v4 + v2, v8, v6, v7, v9, v10);
}

uint64_t sub_24640D730(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 232);
  uint64_t v4 = *(void *)(v2 + 224);
  return MEMORY[0x270FA2498](sub_24640D858, v4, v3);
}

uint64_t sub_24640D858()
{
  uint64_t v1 = *(void **)(v0 + 320);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 280);
    uint64_t v24 = *(void *)(v0 + 240);
    uint64_t v3 = *(void *)(v0 + 120);
    uint64_t v4 = *(void *)(v0 + 128) + *(void *)(v0 + 248);
    uint64_t v5 = *(void *)(v0 + 208);
    uint64_t v25 = *(void *)(v0 + 200);
    uint64_t v26 = *(void *)(v0 + 192);
    uint64_t v28 = *(void *)(v0 + 256);
    uint64_t v6 = (objc_class *)type metadata accessor for UIReplacementTextEffectTextChunkAdapter();
    id v7 = v2;
    id v8 = v1;
    __n128 v9 = (char *)objc_allocWithZone(v6);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v11 = (void *)MEMORY[0x263F8EED0];
    (*(void (**)(char *, uint64_t))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v9)
                                                                    + qword_268F7BD90)
                                                        - 8)
                                            + 16))(&v9[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v9) + qword_268F7BD90 + 16)], v4);
    *(void *)&v9[*(void *)(qword_268F7BD90 + (*v11 & *(void *)v9) + 24)] = v7;
    *(void *)&v9[*(void *)(qword_268F7BD90 + (*v11 & *(void *)v9) + 32)] = v8;
    *(void *)(v0 + 104) = v9;
    *(void *)(v0 + 112) = ObjectType;
    id v12 = objc_msgSendSuper2((objc_super *)(v0 + 104), sel_init);
    *(void *)(v0 + 328) = v12;
    type metadata accessor for UIReplacementTextEffectDelegateAdapter();
    uint64_t v13 = swift_allocObject();
    *(void *)(v0 + 336) = v13;
    swift_unknownObjectWeakInit();
    *(void *)(v13 + 16) = v24;
    swift_unknownObjectWeakAssign();
    uint64_t v14 = *(void **)(v3 + qword_268F7B020);
    *(void *)(v0 + 344) = v14;
    swift_getWitnessTable();
    swift_unknownObjectRetain();
    id v15 = v12;
    id v16 = v14;
    swift_retain();
    sub_246426670();
    sub_246426660();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v5, v26);
    *(void *)(v0 + 352) = sub_2464265B0();
    swift_allocObject();
    *(void *)(v0 + 360) = sub_246426580();
    uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 + 48) + **(int **)(v28 + 48));
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 368) = v17;
    void *v17 = v0;
    v17[1] = sub_24640DC48;
    uint64_t v19 = *(void *)(v0 + 256);
    uint64_t v18 = *(void *)(v0 + 264);
    uint64_t v20 = *(void *)(v0 + 128);
    return v27(v20, v18, v19);
  }
  else
  {
    BOOL v22 = *(void **)(v0 + 280);
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
}

uint64_t sub_24640DC48()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 232);
  uint64_t v3 = *(void *)(v1 + 224);
  return MEMORY[0x270FA2498](sub_24640DD68, v3, v2);
}

uint64_t sub_24640DD68()
{
  id v16 = v0;
  uint64_t v2 = v0[44];
  uint64_t v1 = v0[45];
  uint64_t v14 = (void *)v0[41];
  uint64_t v13 = (void *)v0[40];
  id v12 = (void *)v0[35];
  uint64_t v4 = v0[22];
  uint64_t v3 = v0[23];
  uint64_t v5 = v0[21];
  uint64_t v11 = v0[20];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[16];
  swift_release();
  uint64_t v8 = MEMORY[0x263F81E50];
  v0[5] = v2;
  v0[6] = v8;
  v0[2] = v1;
  swift_retain();
  sub_2464265C0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  sub_246426570();
  v15[3] = type metadata accessor for PlatformIntelligenceReplacementTextEffect();
  v15[4] = swift_getWitnessTable();
  v15[0] = v7;
  swift_beginAccess();
  swift_retain();
  sub_24640C9F8((uint64_t)v15, v3);
  swift_endAccess();
  sub_246411AA0(v7 + qword_268F7C780, v11);
  sub_246426570();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
  swift_beginAccess();
  sub_24640CB18(v6, v11);
  swift_endAccess();

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  __n128 v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_24640DFD4()
{
  return sub_24640EAE4(&qword_268F7C780);
}

uint64_t sub_24640DFE4(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 152) + **(int **)(**(void **)v1 + 152));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_246409B64;
  return v6(a1);
}

uint64_t sub_24640E0EC()
{
  return sub_246409B68() & 1;
}

uint64_t sub_24640E150@<X0>(uint64_t a1@<X8>)
{
  return sub_246411AA0(*v1 + qword_268F7C780, a1);
}

uint64_t sub_24640E168(uint64_t a1)
{
  return sub_24640E180(a1, (void (*)(uint64_t))sub_24640E1D0);
}

uint64_t sub_24640E180(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4 = swift_allocObject();
  a2(a1);
  return v4;
}

uint64_t *sub_24640E1D0(uint64_t a1)
{
  uint64_t v3 = *v1;
  sub_246426310();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 80) - 8) + 32))((uint64_t)v1 + *(void *)(*v1 + 104), a1);
  return v1;
}

uint64_t sub_24640E268(void *a1)
{
  v2[15] = a1;
  v2[16] = v1;
  v2[17] = *v1;
  v2[18] = *MEMORY[0x263F8EED0] & *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  v2[19] = swift_task_alloc();
  type metadata accessor for PlatformIntelligenceTextEffectID();
  v2[20] = swift_task_alloc();
  uint64_t v3 = sub_246426620();
  v2[21] = v3;
  v2[22] = *(void *)(v3 - 8);
  v2[23] = swift_task_alloc();
  sub_246426680();
  v2[24] = swift_task_alloc();
  sub_2464267E0();
  v2[25] = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  v2[26] = v5;
  v2[27] = v4;
  return MEMORY[0x270FA2498](sub_24640E444, v5, v4);
}

uint64_t sub_24640E444()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[16];
  uint64_t v3 = *(void *)(*(void *)v2 + 104);
  v0[28] = v3;
  uint64_t v5 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 88);
  __n128 v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 24) + **(int **)(v4 + 24));
  uint64_t v6 = v2 + v3;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[29] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24640E570;
  return v9(v6, v5, v4);
}

uint64_t sub_24640E570(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 216);
  uint64_t v4 = *(void *)(v2 + 208);
  return MEMORY[0x270FA2498](sub_24640E698, v4, v3);
}

uint64_t sub_24640E698()
{
  uint64_t v26 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 240);
  swift_release();
  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + 240);
    uint64_t v4 = *(void *)(v1 + 184);
    uint64_t v19 = *(void *)(v1 + 176);
    uint64_t v20 = *(void *)(v1 + 168);
    uint64_t v23 = *(void *)(v1 + 160);
    uint64_t v24 = *(void *)(v1 + 152);
    uint64_t v5 = *(void *)(v1 + 120);
    uint64_t v6 = *(void *)(v1 + 128) + *(void *)(v1 + 224);
    uint64_t v21 = *(void *)(v1 + 128);
    uint64_t v7 = (objc_class *)type metadata accessor for UIPonderingTextEffectTextChunkAdapter();
    id v22 = v3;
    uint64_t v8 = (char *)objc_allocWithZone(v7);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = (void *)MEMORY[0x263F8EED0];
    (*(void (**)(char *, uint64_t))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v8)
                                                                    + qword_268F7BD00)
                                                        - 8)
                                            + 16))(&v8[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v8) + qword_268F7BD00 + 16)], v6);
    *(void *)&v8[*(void *)(qword_268F7BD00 + (*v10 & *(void *)v8) + 24)] = v22;
    *(void *)(v1 + 104) = v8;
    *(void *)(v1 + 112) = ObjectType;
    id v11 = objc_msgSendSuper2((objc_super *)(v1 + 104), sel_init);
    id v12 = *(void **)(v5 + qword_268F7B020);
    id v18 = v11;
    id v13 = v12;
    sub_246426670();
    uint64_t v14 = sub_246426600();
    swift_allocObject();
    *(void *)(v1 + 16) = sub_2464265F0();
    uint64_t v15 = MEMORY[0x263F81E58];
    *(void *)(v1 + 40) = v14;
    *(void *)(v1 + 48) = v15;
    swift_retain();
    sub_2464265C0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v4, v20);
    __swift_destroy_boxed_opaque_existential_0(v1 + 16);
    sub_2464265E0();
    v25[3] = type metadata accessor for PlatformIntelligencePonderingTextEffect();
    v25[4] = swift_getWitnessTable();
    v25[0] = v21;
    swift_beginAccess();
    swift_retain();
    sub_24640C9F8((uint64_t)v25, v4);
    swift_endAccess();
    sub_246411AA0(v21 + qword_268F7C788, v23);
    sub_2464265E0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v24, 0, 1, v20);
    swift_beginAccess();
    sub_24640CB18(v24, v23);
    swift_endAccess();

    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v16 = *(uint64_t (**)(void))(v1 + 8);
  return v16();
}

uint64_t *sub_24640EA54(void *a1)
{
  uint64_t v2 = *v1;
  sub_246409CA4((uint64_t)v1 + *a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 80) - 8) + 8))((uint64_t)v1 + *(void *)(*v1 + 104));
  return v1;
}

uint64_t sub_24640EAD8()
{
  return sub_24640EAE4(&qword_268F7C788);
}

uint64_t sub_24640EAE4(void *a1)
{
  sub_24640EA54(a1);
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v1 + 52);

  return MEMORY[0x270FA0228](v1, v2, v3);
}

uint64_t sub_24640EB3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(*(void *)(a1 + 80) - 8) + 16))(a2, *(void *)v2 + *(void *)(**(void **)v2 + 104));
}

uint64_t sub_24640EB88(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 120) + **(int **)(**(void **)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_246409B64;
  return v6(a1);
}

uint64_t sub_24640EC90()
{
  return sub_246409B68() & 1;
}

uint64_t sub_24640ECF4@<X0>(uint64_t a1@<X8>)
{
  return sub_246411AA0(*v1 + qword_268F7C788, a1);
}

uint64_t sub_24640ED0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_246409B64;
  return v6();
}

uint64_t sub_24640EDD8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_246409B64;
  return v7();
}

uint64_t sub_24640EEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246426800();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2464267F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24641269C(a1, &qword_268F7B250);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2464267A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24640F050(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_246412D2C;
  return v6(a1);
}

unint64_t sub_24640F12C(uint64_t a1)
{
  sub_246426620();
  sub_246412730(&qword_268F7B0C0, MEMORY[0x263F81E60]);
  uint64_t v2 = sub_2464266F0();

  return sub_24640F278(a1, v2);
}

unint64_t sub_24640F1C4(uint64_t a1)
{
  sub_2464269E0();
  sub_246426320();
  sub_246412730(&qword_268F7B018, MEMORY[0x263F07508]);
  sub_246426700();
  uint64_t v2 = sub_246426A00();

  return sub_24640F438(a1, v2);
}

unint64_t sub_24640F278(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_246426620();
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
    id v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    id v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_246412730(&qword_268F7B0C8, MEMORY[0x263F81E60]);
      char v15 = sub_246426720();
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

unint64_t sub_24640F438(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlatformIntelligenceTextEffectID() - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v11 = *(void *)(v5 + 72);
    do
    {
      sub_246411AA0(*(void *)(v2 + 48) + v11 * v9, (uint64_t)v7);
      char v12 = sub_2464262E0();
      sub_246409CA4((uint64_t)v7);
      if (v12) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_24640F570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24640F1C4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_246410D18();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = type metadata accessor for PlatformIntelligenceTextEffectID();
    sub_246409CA4(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = sub_246426620();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_246410174(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_246426620();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

double sub_24640F728@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24640F12C(a1);
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
      sub_246411030();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_246426620();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_246412C78((long long *)(*(void *)(v9 + 56) + 40 * v6), a2);
    sub_2464104B8(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_24640F85C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v48 = sub_246426620();
  uint64_t v5 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  v47 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PlatformIntelligenceTextEffectID();
  uint64_t v45 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B148);
  int v46 = a2;
  uint64_t v11 = sub_246426970();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 64);
  v41 = (void *)(v10 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  v39 = v2;
  int64_t v40 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v42 = v5 + 16;
  uint64_t v43 = v5;
  uint64_t v17 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v18 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  uint64_t v44 = v10;
  while (1)
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
    if (v24 >= v40) {
      break;
    }
    uint64_t v25 = v41;
    unint64_t v26 = v41[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v26 = v41[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v41[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v40) {
              goto LABEL_34;
            }
            unint64_t v26 = v41[v20];
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
    uint64_t v29 = *(void *)(v10 + 48) + v28 * v23;
    if (v46)
    {
      sub_246412C14(v29, (uint64_t)v9);
      uint64_t v30 = *(void *)(v43 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v43 + 32))(v47, *(void *)(v10 + 56) + v30 * v23, v48);
    }
    else
    {
      sub_246411AA0(v29, (uint64_t)v9);
      uint64_t v30 = *(void *)(v43 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v43 + 16))(v47, *(void *)(v10 + 56) + v30 * v23, v48);
    }
    sub_2464269E0();
    sub_246426320();
    sub_246412730(&qword_268F7B018, MEMORY[0x263F07508]);
    sub_246426700();
    uint64_t result = sub_246426A00();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v10 = v44;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      uint64_t v10 = v44;
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
    sub_246412C14((uint64_t)v9, *(void *)(v12 + 48) + v28 * v21);
    uint64_t result = (*v17)(*(void *)(v12 + 56) + v30 * v21, v47, v48);
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v25 = v41;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v10 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v25 = -1 << v38;
  }
  *(void *)(v10 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_24640FD24(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_246426620();
  uint64_t v5 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B150);
  int v45 = a2;
  uint64_t v9 = sub_246426970();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  int64_t v40 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v38 = v2;
  int64_t v39 = (unint64_t)(v11 + 63) >> 6;
  v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  int v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  uint64_t v42 = v8;
  uint64_t v43 = v7;
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
    if (v21 >= v39) {
      break;
    }
    unint64_t v22 = v40;
    unint64_t v23 = v40[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v23 = v40[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v40[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v39) {
              goto LABEL_34;
            }
            unint64_t v23 = v40[v17];
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
    uint64_t v25 = v5;
    uint64_t v26 = *(void *)(v5 + 72);
    unint64_t v27 = *(void *)(v8 + 48) + v26 * v20;
    uint64_t v28 = v43;
    uint64_t v29 = v44;
    if (v45)
    {
      (*v46)(v43, v27, v44);
      sub_246412C78((long long *)(*(void *)(v8 + 56) + 40 * v20), (uint64_t)v47);
    }
    else
    {
      (*v41)(v43, v27, v44);
      sub_246412638(*(void *)(v8 + 56) + 40 * v20, (uint64_t)v47);
    }
    sub_246412730(&qword_268F7B0C0, MEMORY[0x263F81E60]);
    uint64_t result = sub_2464266F0();
    uint64_t v30 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v36 = *(void *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    (*v46)((char *)(*(void *)(v10 + 48) + v26 * v18), (unint64_t)v28, v29);
    uint64_t result = sub_246412C78(v47, *(void *)(v10 + 56) + 40 * v18);
    ++*(void *)(v10 + 16);
    uint64_t v5 = v25;
    uint64_t v8 = v42;
  }
  swift_release();
  uint64_t v3 = v38;
  unint64_t v22 = v40;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v8 + 32);
  if (v37 >= 64) {
    bzero(v22, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v37;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

unint64_t sub_246410174(int64_t a1, uint64_t a2)
{
  uint64_t v33 = type metadata accessor for PlatformIntelligenceTextEffectID();
  uint64_t v4 = *(void *)(v33 - 8);
  unint64_t result = MEMORY[0x270FA5388](v33);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a2 + 64;
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    unint64_t result = sub_2464268C0();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v34 = (result + 1) & v11;
      uint64_t v12 = *(void *)(v4 + 72);
      uint64_t v13 = v11;
      do
      {
        uint64_t v14 = v12;
        int64_t v15 = v12 * v10;
        uint64_t v16 = v13;
        sub_246411AA0(*(void *)(a2 + 48) + v12 * v10, (uint64_t)v7);
        sub_2464269E0();
        sub_246426320();
        sub_246412730(&qword_268F7B018, MEMORY[0x263F07508]);
        sub_246426700();
        uint64_t v17 = sub_246426A00();
        unint64_t result = sub_246409CA4((uint64_t)v7);
        uint64_t v13 = v16;
        unint64_t v18 = v17 & v16;
        if (a1 >= (uint64_t)v34)
        {
          if (v18 < v34)
          {
            uint64_t v12 = v14;
          }
          else
          {
            uint64_t v12 = v14;
            if (a1 >= (uint64_t)v18) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v12 = v14;
          if (v18 >= v34 || a1 >= (uint64_t)v18)
          {
LABEL_12:
            if (v12 * a1 < v15
              || *(void *)(a2 + 48) + v12 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v15 + v12))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v12 * a1 != v15)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = *(void *)(*(void *)(sub_246426620() - 8) + 72);
            int64_t v21 = v20 * a1;
            unint64_t result = v19 + v20 * a1;
            int64_t v22 = v20 * v10;
            unint64_t v23 = v19 + v20 * v10 + v20;
            if (v21 < v22 || result >= v23)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              uint64_t v12 = v14;
              uint64_t v13 = v16;
            }
            else
            {
              a1 = v10;
              BOOL v25 = v21 == v22;
              uint64_t v12 = v14;
              uint64_t v13 = v16;
              if (!v25)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                uint64_t v13 = v16;
                a1 = v10;
              }
            }
          }
        }
        unint64_t v10 = (v10 + 1) & v13;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  uint64_t *v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2464104B8(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426620();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_2464268C0();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      unint64_t v37 = (result + 1) & v12;
      uint64_t v38 = v13;
      uint64_t v14 = *(void *)(v5 + 72);
      uint64_t v39 = v5 + 16;
      uint64_t v36 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v15 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v14;
        int64_t v18 = v14 * v11;
        uint64_t v19 = v15;
        v38(v8, *(void *)(a2 + 48) + v14 * v11, v4);
        sub_246412730(&qword_268F7B0C0, MEMORY[0x263F81E60]);
        uint64_t v20 = sub_2464266F0();
        unint64_t result = (*v36)(v8, v4);
        uint64_t v15 = v19;
        unint64_t v21 = v20 & v19;
        if (a1 >= (uint64_t)v37)
        {
          if (v21 >= v37 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            uint64_t v24 = *(void *)(a2 + 48);
            unint64_t result = v24 + v17 * a1;
            uint64_t v9 = v16;
            if (v17 * a1 < v18 || (uint64_t v14 = v17, result >= v24 + v18 + v17))
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              uint64_t v14 = v17;
              uint64_t v15 = v19;
            }
            else if (v17 * a1 != v18)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            uint64_t v25 = *(void *)(a2 + 56);
            unint64_t v26 = v25 + 40 * a1;
            uint64_t v27 = (long long *)(v25 + 40 * v11);
            if (a1 != v11 || (a1 = v11, v26 >= (unint64_t)v27 + 40))
            {
              long long v28 = *v27;
              long long v29 = v27[1];
              *(void *)(v26 + 32) = *((void *)v27 + 4);
              *(_OWORD *)unint64_t v26 = v28;
              *(_OWORD *)(v26 + 16) = v29;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v37 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
        uint64_t v14 = v17;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v15;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    BOOL v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  *BOOL v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2464107D4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for PlatformIntelligenceTextEffectID();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_24640F1C4(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 < v16 || (a3 & 1) == 0)
  {
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_246410D18();
      goto LABEL_7;
    }
    sub_24640F85C(v16, a3 & 1);
    unint64_t v27 = sub_24640F1C4(a2);
    if ((v17 & 1) == (v28 & 1))
    {
      unint64_t v13 = v27;
      uint64_t v19 = *v4;
      if (v17) {
        goto LABEL_8;
      }
LABEL_13:
      sub_246411AA0(a2, (uint64_t)v10);
      return sub_246410B78(v13, (uint64_t)v10, a1, v19);
    }
LABEL_15:
    uint64_t result = sub_2464269D0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v19 = *v4;
  if ((v17 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v20 = v19[7];
  uint64_t v21 = sub_246426620();
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 40);
  uint64_t v24 = v21;
  uint64_t v25 = v20 + *(void *)(v22 + 72) * v13;

  return v23(v25, a1, v24);
}

uint64_t sub_24641099C(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_246426620();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = (void *)*v3;
  unint64_t v14 = sub_24640F12C(a2);
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
      sub_246411030();
      goto LABEL_7;
    }
    sub_24640FD24(v17, a3 & 1);
    unint64_t v23 = sub_24640F12C(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_246410C54(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_2464269D0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7] + 40 * v14;
  __swift_destroy_boxed_opaque_existential_0(v21);

  return sub_246412C78(a1, v21);
}

uint64_t sub_246410B78(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for PlatformIntelligenceTextEffectID();
  sub_246412C14(a2, v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_246426620();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_246410C54(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_246426620();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_246412C78(a3, a4[7] + 40 * a1);
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

void *sub_246410D18()
{
  uint64_t v1 = sub_246426620();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for PlatformIntelligenceTextEffectID();
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B148);
  char v24 = v0;
  uint64_t v8 = *v0;
  uint64_t v9 = sub_246426960();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *char v24 = v10;
    return result;
  }
  uint64_t result = (void *)(v9 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12) {
    uint64_t result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  }
  int64_t v13 = 0;
  *(void *)(v10 + 16) = *(void *)(v8 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v8 + 64);
  uint64_t v25 = v8 + 64;
  int64_t v26 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v27 = v2 + 32;
  uint64_t v28 = v2 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v25 + 8 * v13);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v29 + 72) * v18;
    sub_246411AA0(*(void *)(v8 + 48) + v19, (uint64_t)v7);
    unint64_t v20 = *(void *)(v2 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v8 + 56) + v20, v1);
    sub_246412C14((uint64_t)v7, *(void *)(v10 + 48) + v19);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v10 + 56) + v20, v4, v1);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v26) {
    goto LABEL_23;
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v25 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_246411030()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_246426620();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B150);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_246426960();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  int64_t v23 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
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
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
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
    uint64_t v18 = 40 * v16;
    sub_246412638(*(void *)(v6 + 56) + v18, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = (void *)sub_246412C78(v27, *(void *)(v8 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
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
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2464112DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_2464267E0();
  v3[5] = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_246411378, v5, v4);
}

uint64_t sub_246411378()
{
  swift_release();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for UIPonderingTextEffectTextChunkAdapter();
  uint64_t v1 = (void *)swift_dynamicCastClass();
  if (v1)
  {
    uint64_t v2 = &qword_268F7BD00;
  }
  else
  {
    type metadata accessor for UIReplacementTextEffectTextChunkAdapter();
    uint64_t v1 = (void *)swift_dynamicCastClass();
    if (!v1)
    {
      sub_2464268E0();
      sub_246426760();
      swift_getObjectType();
      sub_246426A10();
      sub_246426760();
      swift_bridgeObjectRelease();
      sub_246426760();
      return sub_246426940();
    }
    uint64_t v2 = &qword_268F7BD90;
  }
  uint64_t v3 = *(void *)((char *)v1 + *(void *)(*v2 + (*MEMORY[0x263F8EED0] & *v1) + 24));
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_246411588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a1;
  sub_2464267E0();
  v4[5] = sub_2464267D0();
  uint64_t v6 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_246411624, v6, v5);
}

uint64_t sub_246411624()
{
  swift_release();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for UIReplacementTextEffectTextChunkAdapter();
  uint64_t v1 = (void *)swift_dynamicCastClass();
  if (v1)
  {
    uint64_t v2 = *(void *)((char *)v1 + *(void *)(qword_268F7BD90 + (*MEMORY[0x263F8EED0] & *v1) + 32));
    uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v3(v2);
  }
  else
  {
    sub_2464268E0();
    sub_246426760();
    swift_getObjectType();
    sub_246426A10();
    sub_246426760();
    swift_bridgeObjectRelease();
    sub_246426760();
    return sub_246426940();
  }
}

void sub_246411804()
{
}

void sub_246411834()
{
}

void sub_246411864()
{
  uint64_t v1 = qword_268F7B040;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)&v0[v1] = sub_24640BED8(MEMORY[0x263F8EE78]);
  uint64_t v3 = qword_268F7B038;
  *(void *)&v0[v3] = sub_24640C0D8(v2);

  sub_246426940();
  __break(1u);
}

id sub_2464118FC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = qword_268F7B040;
  uint64_t v6 = v2;
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)&v2[v5] = sub_24640BED8(MEMORY[0x263F8EE78]);
  uint64_t v8 = qword_268F7B038;
  *(void *)&v6[v8] = sub_24640C0D8(v7);
  *(void *)&v6[qword_268F7B048] = a1;
  type metadata accessor for UITextEffectViewSourceAdapter();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)&v6[qword_268F7B050] = v9;
  objc_allocWithZone((Class)sub_246426650());
  swift_unknownObjectRetain_n();
  swift_retain();
  unint64_t v10 = (void *)sub_246426640();
  *(void *)&v6[qword_268F7B020] = v10;
  id v11 = v10;
  objc_msgSend(v11, sel_setClipsToBounds_, 1);

  v13.receiver = v6;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

void sub_246411A70()
{
}

uint64_t sub_246411AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlatformIntelligenceTextEffectID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UIReplacementTextEffectTextChunkAdapter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for UIReplacementTextEffectDelegateAdapter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PlatformIntelligenceReplacementTextEffect()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for UIPonderingTextEffectTextChunkAdapter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for PlatformIntelligencePonderingTextEffect()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_246411B7C()
{
  return sub_246412730((unint64_t *)&unk_268F7B068, (void (*)(uint64_t))type metadata accessor for PlatformIntelligenceTextEffectID);
}

uint64_t sub_246411BC4(uint64_t a1)
{
  return sub_246411C6C(a1);
}

uint64_t sub_246411BF0()
{
  return sub_246412730(qword_268F7B078, (void (*)(uint64_t))type metadata accessor for PlatformIntelligenceTextEffectID);
}

uint64_t sub_246411C38(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_246411C40(uint64_t a1)
{
  return sub_246411C6C(a1);
}

uint64_t sub_246411C6C(uint64_t a1)
{
  *(void *)(a1 + 8) = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_246411CBC()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for UITextEffectViewSourceAdapter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_246411D18()
{
  return swift_initClassMetadata2();
}

uint64_t sub_246411D64()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_246411E10()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_246411EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_246411F2C(uint64_t a1)
{
  uint64_t v2 = sub_246426320();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_246411F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_246411FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_246412058(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2464120BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_246412120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246412134);
}

uint64_t sub_246412134(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_2464121A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2464121B4);
}

uint64_t sub_2464121B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_246412224()
{
  uint64_t result = sub_246426320();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2464122B0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PlatformIntelligenceTextEffectView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_246412338()
{
  uint64_t result = sub_246426320();
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

uint64_t sub_246412410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_246412428(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_246412448(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for PlatformIntelligenceReplacementTextEffect.AnimationParameters()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_246412488()
{
  uint64_t result = sub_246426320();
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

uint64_t sub_246412558()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2464125A0()
{
  unint64_t v2 = *(void **)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_246409B64;
  return sub_24640B22C((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_246412638(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24641269C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2464126F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246412730(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246412778()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2464127C0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_246409B64;
  uint64_t v7 = (uint64_t (*)(uint64_t, char, uint64_t, uint64_t))((char *)&dword_268F7B0D8 + dword_268F7B0D8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_246412888()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_246409B64;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268F7B0E8 + dword_268F7B0E8);
  return v6(v2, v3, v4);
}

uint64_t sub_24641294C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_246409B64;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268F7B0F8 + dword_268F7B0F8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_246412A18(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_246409B64;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268F7B108 + dword_268F7B108);
  return v6(a1, v4);
}

uint64_t sub_246412AD0()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246412B18()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2464075B4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, void *))((char *)&dword_268F7B120 + dword_268F7B120);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_36Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_246412C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PlatformIntelligenceTextEffectID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246412C78(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_246412C90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

unint64_t WKTextAnimationType.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

uint64_t sub_246412D44()
{
  uint64_t v0 = sub_246426560();
  __swift_allocate_value_buffer(v0, qword_268F7C0B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_268F7C0B8);
  return sub_246426550();
}

id sub_246412DC4(uint64_t a1)
{
  long long v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[qword_268F7C790];
  uint64_t v5 = sub_246426320();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v9.receiver = v3;
  v9.super_class = v1;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v7;
}

id _s14libWebKitSwift20TextAnimationManagerCACycfC_0()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void sub_246412ED4()
{
}

uint64_t sub_246412F04()
{
  uint64_t v1 = v0 + qword_268F7C790;
  uint64_t v2 = sub_246426320();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t sub_246412F70(uint64_t a1)
{
  uint64_t v1 = a1 + qword_268F7C790;
  uint64_t v2 = sub_246426320();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t variable initialization expression of TextAnimationManager.currentEffect@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_246426620();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

id sub_246413048()
{
  uint64_t v1 = OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView];
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_allocWithZone((Class)sub_246426650());
    uint64_t v6 = v0;
    id v7 = (void *)sub_246426640();
    uint64_t v8 = *(void **)&v0[v1];
    *(void *)&v4[v1] = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

uint64_t variable initialization expression of TextAnimationManager.$__lazy_storage_$_effectView()
{
  return 0;
}

uint64_t variable initialization expression of TextAnimationManager.chunkToEffect()
{
  return MEMORY[0x263F8EE80];
}

uint64_t variable initialization expression of TextAnimationManager.delegate()
{
  return 0;
}

uint64_t TextAnimationManager.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  return MEMORY[0x24C52C7D0](v1);
}

uint64_t TextAnimationManager.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*TextAnimationManager.delegate.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___WKSTextAnimationManager_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x24C52C7D0](v5);
  return sub_2464132B8;
}

void sub_2464132B8(void **a1, char a2)
{
  id v3 = *a1;
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

id TextAnimationManager.__allocating_init(with:)(void *a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = &v3[OBJC_IVAR___WKSTextAnimationManager_currentEffect];
  uint64_t v5 = sub_246426620();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)&v3[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView] = 0;
  *(void *)&v3[OBJC_IVAR___WKSTextAnimationManager_chunkToEffect] = MEMORY[0x263F8EE80];
  swift_unknownObjectWeakInit();
  v11.receiver = v3;
  v11.super_class = v1;
  id v6 = objc_msgSendSuper2(&v11, sel_init);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  id v7 = v6;
  id v8 = objc_msgSend(a1, sel_containingViewForTextAnimationType);
  id v9 = sub_246413048();
  objc_msgSend(v8, sel_addSubview_, v9);

  swift_unknownObjectRelease();
  return v7;
}

id TextAnimationManager.init(with:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR___WKSTextAnimationManager_currentEffect];
  uint64_t v5 = sub_246426620();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)&v1[OBJC_IVAR___WKSTextAnimationManager____lazy_storage___effectView] = 0;
  *(void *)&v1[OBJC_IVAR___WKSTextAnimationManager_chunkToEffect] = MEMORY[0x263F8EE80];
  swift_unknownObjectWeakInit();
  v11.receiver = v1;
  v11.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v11, sel_init);
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  id v7 = v6;
  id v8 = objc_msgSend(a1, sel_containingViewForTextAnimationType);
  id v9 = sub_246413048();
  objc_msgSend(v8, sel_addSubview_, v9);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t TextAnimationManager.beginEffect(for:style:)(char *a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246426680();
  v41 = *(void (***)(char *, uint64_t))(v9 - 8);
  MEMORY[0x270FA5388](v9);
  objc_super v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_246426320();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_246426620();
  uint64_t v44 = *(void *)(v16 - 8);
  uint64_t result = MEMORY[0x270FA5388](v16);
  int v45 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 != 2)
  {
    uint64_t v42 = v16;
    uint64_t v43 = v8;
    uint64_t v39 = a1;
    if (a2 == 1)
    {
      id v38 = sub_246413048();
      int64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
      v19(v15, (uint64_t)a1, v12);
      unint64_t v20 = (void (*)(char *, char *, uint64_t))v19;
      int64_t v21 = (objc_class *)type metadata accessor for TextAnimationManager.TextEffectChunk(0);
      uint64_t v22 = (char *)objc_allocWithZone(v21);
      v20(&v22[qword_268F7C790], v15, v12);
      v47.receiver = v22;
      v47.super_class = v21;
      id v37 = objc_msgSendSuper2(&v47, sel_init);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      sub_246413048();
      uint64_t v49 = ObjectType;
      uint64_t v50 = sub_24641898C(&qword_268F7B178, (void (*)(uint64_t))type metadata accessor for TextAnimationManager);
      v48[0] = v3;
      v3;
      sub_246426670();
      sub_246426660();
      v41[1](v11, v9);
      uint64_t v23 = sub_2464265B0();
      swift_allocObject();
      uint64_t v24 = v42;
      uint64_t v25 = sub_246426580();
      uint64_t v49 = v23;
      uint64_t v50 = MEMORY[0x263F81E50];
      v48[0] = v25;
      uint64_t v26 = v45;
      uint64_t v27 = v38;
      sub_2464265C0();

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
      v20(v15, v39, v12);
      uint64_t v29 = (uint64_t)v43;
      uint64_t v28 = v44;
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v43, v26, v24);
    }
    else
    {
      if (a2)
      {
        v48[0] = a2;
        uint64_t result = sub_2464269C0();
        __break(1u);
        return result;
      }
      v41 = (void (**)(char *, uint64_t))sub_246413048();
      BOOL v30 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
      v30(v15, (uint64_t)a1, v12);
      uint64_t v31 = (void (*)(char *, char *, uint64_t))v30;
      uint64_t v32 = (objc_class *)type metadata accessor for TextAnimationManager.TextEffectChunk(0);
      uint64_t v33 = (char *)objc_allocWithZone(v32);
      v31(&v33[qword_268F7C790], v15, v12);
      v46.receiver = v33;
      v46.super_class = v32;
      objc_msgSendSuper2(&v46, sel_init);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      sub_246413048();
      sub_246426670();
      uint64_t v34 = sub_246426600();
      swift_allocObject();
      uint64_t v35 = sub_2464265F0();
      uint64_t v49 = v34;
      uint64_t v50 = MEMORY[0x263F81E58];
      v48[0] = v35;
      uint64_t v26 = v45;
      uint64_t v36 = v41;
      sub_2464265C0();

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
      v31(v15, v39, v12);
      uint64_t v29 = (uint64_t)v43;
      uint64_t v28 = v44;
      uint64_t v24 = v42;
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v43, v26, v42);
    }
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v29, 0, 1, v24);
    swift_beginAccess();
    sub_246413C48(v29, (uint64_t)v15);
    swift_endAccess();
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v26, v24);
  }
  return result;
}

uint64_t type metadata accessor for TextAnimationManager.TextEffectChunk(uint64_t a1)
{
  return sub_246413C10(a1, (uint64_t *)&unk_268F7C300);
}

uint64_t type metadata accessor for TextAnimationManager(uint64_t a1)
{
  return sub_246413C10(a1, (uint64_t *)&unk_268F7C2F0);
}

uint64_t sub_246413C10(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_246413C48(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246426620();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_24641269C(a1, &qword_268F7B170);
    sub_246416ABC(a2, (uint64_t)v8);
    uint64_t v13 = sub_246426320();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_24641269C((uint64_t)v8, &qword_268F7B170);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *id v3 = 0x8000000000000000;
    sub_246417590((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *id v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_246426320();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t TextAnimationManager.endEffect(for:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246426620();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_246416ABC(a1, (uint64_t)v4);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_24641269C((uint64_t)v4, &qword_268F7B170);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id v10 = sub_246413048();
  sub_2464265D0();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void TextAnimationManager.init()()
{
}

uint64_t TextAnimationManager.targetedPreview(for:)(uint64_t a1)
{
  v2[19] = a1;
  v2[20] = v1;
  sub_2464267E0();
  v2[21] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[22] = v4;
  v2[23] = v3;
  return MEMORY[0x270FA2498](sub_246414384, v4, v3);
}

uint64_t sub_246414384()
{
  uint64_t v1 = *(void *)(v0 + 160) + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C52C7D0](v1);
  *(void *)(v0 + 192) = v2;
  if (!v2)
  {
    swift_release();
    if (qword_268F7C0B0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_246426560();
    __swift_project_value_buffer(v17, (uint64_t)qword_268F7C0B8);
    uint64_t v18 = sub_246426540();
    os_log_type_t v19 = sub_246426830();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_246402000, v18, v19, "Can't obtain Targeted Preview. Missing delegate.", v20, 2u);
      MEMORY[0x24C52C6E0](v20, -1, -1);
    }

    int64_t v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CC8]), sel_initWithView_, v21);
    goto LABEL_16;
  }
  uint64_t v3 = (void *)v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82AD0]), sel_init);
  id v6 = objc_msgSend(v3, sel_containingViewForTextAnimationType);
  id v7 = objc_msgSend(v3, sel_containingViewForTextAnimationType);
  objc_msgSend(v7, sel_center);
  double v9 = v8;
  double v11 = v10;

  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82AE0]), sel_initWithContainer_center_, v6, v9, v11);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CC8]), sel_initWithView_parameters_target_, v4, v5, v12);
  *(void *)(v0 + 200) = v13;

  type metadata accessor for TextAnimationManager.TextEffectChunk(0);
  if (swift_dynamicCastClass())
  {
    id v14 = *(id *)(v0 + 152);
    uint64_t v15 = sub_2464262D0();
    *(void *)(v0 + 208) = v15;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 144;
    *(void *)(v0 + 24) = sub_24641481C;
    uint64_t v16 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_246414AA8;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v16;
    objc_msgSend(v3, sel_targetedPreviewForID_completionHandler_, v15, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  swift_release();
  if (qword_268F7C0B0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_246426560();
  __swift_project_value_buffer(v22, (uint64_t)qword_268F7C0B8);
  int64_t v21 = sub_246426540();
  os_log_type_t v23 = sub_246426830();
  if (!os_log_type_enabled(v21, v23))
  {
    swift_unknownObjectRelease();
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v24 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v24 = 0;
  _os_log_impl(&dword_246402000, v21, v23, "Can't get text preview. Incorrect UITextEffectTextChunk subclass", v24, 2u);
  MEMORY[0x24C52C6E0](v24, -1, -1);

  swift_unknownObjectRelease();
LABEL_17:
  uint64_t v25 = *(uint64_t (**)(id))(v0 + 8);
  return v25(v13);
}

uint64_t sub_24641481C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  uint64_t v2 = *(void *)(*(void *)v0 + 176);
  return MEMORY[0x270FA2498](sub_246414924, v2, v1);
}

uint64_t sub_246414924()
{
  uint64_t v1 = *(void **)(v0 + 208);
  swift_release();
  uint64_t v2 = *(void *)(v0 + 144);

  if (v2)
  {
    uint64_t v3 = *(void **)(v0 + 152);

    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_268F7C0B0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_246426560();
    __swift_project_value_buffer(v4, (uint64_t)qword_268F7C0B8);
    id v5 = sub_246426540();
    os_log_type_t v6 = sub_246426830();
    BOOL v7 = os_log_type_enabled(v5, v6);
    double v8 = *(void **)(v0 + 152);
    if (v7)
    {
      double v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_246402000, v5, v6, "Could not generate a UITargetedPreview", v9, 2u);
      MEMORY[0x24C52C6E0](v9, -1, -1);

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    uint64_t v2 = *(void *)(v0 + 200);
  }
  double v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v10(v2);
}

uint64_t sub_246414AA8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  os_log_type_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_246418928((uint64_t)&v6, v3, &qword_268F7B2A8);
  return swift_continuation_resume();
}

uint64_t sub_246414C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_2464267E0();
  v3[5] = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_246414D24, v5, v4);
}

uint64_t sub_246414D24()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v3 = (void *)v0[2];
  uint64_t v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  os_log_type_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  *os_log_type_t v6 = v0;
  v6[1] = sub_246414DE8;
  uint64_t v7 = v0[2];
  return TextAnimationManager.targetedPreview(for:)(v7);
}

uint64_t sub_246414DE8(void *a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 48);
  id v4 = *(void **)(*v1 + 32);
  id v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  ((void (**)(void, void *))v3)[2](v3, a1);
  _Block_release(v3);

  os_log_type_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t TextAnimationManager.updateTextChunkVisibilityForAnimation(_:visible:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 200) = a2;
  *(void *)(v3 + 144) = a1;
  *(void *)(v3 + 152) = v2;
  sub_2464267E0();
  *(void *)(v3 + 160) = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  *(void *)(v3 + 168) = v5;
  *(void *)(v3 + 176) = v4;
  return MEMORY[0x270FA2498](sub_246414FE8, v5, v4);
}

uint64_t sub_246414FE8()
{
  type metadata accessor for TextAnimationManager.TextEffectChunk(0);
  if (swift_dynamicCastClass())
  {
    uint64_t v1 = *(void *)(v0 + 152) + OBJC_IVAR___WKSTextAnimationManager_delegate;
    swift_beginAccess();
    uint64_t v2 = MEMORY[0x24C52C7D0](v1);
    *(void *)(v0 + 184) = v2;
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = *(unsigned __int8 *)(v0 + 200);
      id v5 = *(id *)(v0 + 144);
      uint64_t v6 = sub_2464262D0();
      *(void *)(v0 + 192) = v6;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_246415334;
      uint64_t v7 = swift_continuation_init();
      *(void *)(v0 + 80) = MEMORY[0x263EF8330];
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_2464154BC;
      *(void *)(v0 + 104) = &block_descriptor_1;
      *(void *)(v0 + 112) = v7;
      objc_msgSend(v3, sel_updateUnderlyingTextVisibilityForTextAnimationID_visible_completionHandler_, v6, v4, v0 + 80);
      return MEMORY[0x270FA23F0](v0 + 16);
    }
    id v12 = *(id *)(v0 + 144);
    swift_release();
    if (qword_268F7C0B0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_246426560();
    __swift_project_value_buffer(v13, (uint64_t)qword_268F7C0B8);
    id v14 = sub_246426540();
    os_log_type_t v15 = sub_246426830();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v9 = *(NSObject **)(v0 + 144);
    if (v16)
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_246402000, v14, v15, "Can't update Chunk Visibility. Missing delegate.", v17, 2u);
      MEMORY[0x24C52C6E0](v17, -1, -1);
    }
    else
    {

      uint64_t v9 = v14;
    }
  }
  else
  {
    swift_release();
    if (qword_268F7C0B0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_246426560();
    __swift_project_value_buffer(v8, (uint64_t)qword_268F7C0B8);
    uint64_t v9 = sub_246426540();
    os_log_type_t v10 = sub_246426830();
    if (os_log_type_enabled(v9, v10))
    {
      double v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_246402000, v9, v10, "Can't update text visibility. Incorrect UITextEffectTextChunk subclass", v11, 2u);
      MEMORY[0x24C52C6E0](v11, -1, -1);
    }
  }

  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_246415334()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  uint64_t v2 = *(void *)(*(void *)v0 + 168);
  return MEMORY[0x270FA2498](sub_24641543C, v2, v1);
}

uint64_t sub_24641543C()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = (void *)v0[18];
  swift_release();

  swift_unknownObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2464154BC()
{
  return swift_continuation_resume();
}

uint64_t sub_246415648(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = a4;
  *(unsigned char *)(v4 + 64) = a2;
  *(void *)(v4 + 16) = a1;
  sub_2464267E0();
  *(void *)(v4 + 40) = sub_2464267D0();
  uint64_t v6 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_2464156E8, v6, v5);
}

uint64_t sub_2464156E8()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v3 = *(void **)(v0 + 16);
  uint64_t v2 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = _Block_copy(v2);
  id v4 = v3;
  id v5 = v1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2464157B0;
  char v7 = *(unsigned char *)(v0 + 64);
  uint64_t v8 = *(void *)(v0 + 16);
  return TextAnimationManager.updateTextChunkVisibilityForAnimation(_:visible:)(v8, v7);
}

uint64_t sub_2464157B0()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 48);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t TextAnimationManager.performReplacementAndGeneratePreview(for:effect:animation:)(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_268F7B198 + dword_268F7B198);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2464159C0;
  return v5(a1);
}

uint64_t sub_2464159C0(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

void sub_246415ABC(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F7B2B0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (void *)sub_2464262D0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_246418880;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_246415C84;
  aBlock[3] = &block_descriptor_45;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_callCompletionHandlerForAnimationID_completionHandler_, v7, v10);
  _Block_release(v10);
}

void sub_246415C84(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t TextAnimationManager.replacementEffectDidComplete(_:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B170);
  MEMORY[0x270FA5388](v1 - 8);
  objc_super v47 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B1A0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B1A8);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246426320();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v50 = v9;
  uint64_t v51 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  objc_super v46 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v49 = (char *)&v43 - v13;
  uint64_t v14 = sub_246426620();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = sub_246413048();
  sub_246426570();
  sub_2464265D0();

  int v45 = *(void (**)(char *, uint64_t))(v15 + 8);
  v45(v17, v14);
  uint64_t v48 = v0;
  swift_beginAccess();
  uint64_t v19 = swift_bridgeObjectRetain();
  sub_246416440(v19, (uint64_t (*)(uint64_t, uint64_t))sub_2464183A8, (uint64_t)v5);
  swift_bridgeObjectRelease();
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B1B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v5, 1, v20) == 1)
  {
    sub_24641269C((uint64_t)v5, &qword_268F7B1A0);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B1B8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 1, 1, v21);
    return sub_24641269C((uint64_t)v8, &qword_268F7B1A8);
  }
  uint64_t v22 = &v5[*(int *)(v20 + 48)];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B1B8);
  uint64_t v24 = &v8[*(int *)(v23 + 48)];
  uint64_t v25 = v5;
  uint64_t v26 = v50;
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
  v44(v8, v25, v50);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v24, v22, v14);
  uint64_t v27 = *(void *)(v23 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v8, 0, 1, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v8, 1, v23) == 1) {
    return sub_24641269C((uint64_t)v8, &qword_268F7B1A8);
  }
  uint64_t v29 = v26;
  BOOL v30 = &v8[*(int *)(v23 + 48)];
  uint64_t v31 = v49;
  v44(v49, v8, v29);
  v45(v30, v14);
  uint64_t v32 = v51;
  uint64_t v33 = (uint64_t)v46;
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v46, v31, v29);
  uint64_t v34 = (uint64_t)v47;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v47, 1, 1, v14);
  swift_beginAccess();
  sub_246413C48(v34, v33);
  swift_endAccess();
  uint64_t v35 = v48 + OBJC_IVAR___WKSTextAnimationManager_delegate;
  swift_beginAccess();
  uint64_t v36 = MEMORY[0x24C52C7D0](v35);
  if (v36)
  {
    id v37 = (void *)v36;
    id v38 = (void *)sub_2464262D0();
    objc_msgSend(v37, sel_callCompletionHandlerForAnimationID_, v38);

    objc_msgSend(v37, sel_replacementEffectDidComplete);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_268F7C0B0 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_246426560();
    __swift_project_value_buffer(v39, (uint64_t)qword_268F7C0B8);
    int64_t v40 = sub_246426540();
    os_log_type_t v41 = sub_246426830();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_246402000, v40, v41, "Missing delegate.", v42, 2u);
      MEMORY[0x24C52C6E0](v42, -1, -1);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v31, v29);
}

uint64_t sub_24641635C()
{
  uint64_t v0 = sub_246426620();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246426570();
  char v4 = sub_2464262E0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_246416440@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v39 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B1B0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_246426620();
  uint64_t v7 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  v53 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_246426320();
  uint64_t v9 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v50 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B1A0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v40 = a1 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v14;
  int64_t v41 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v47 = v7 + 16;
  uint64_t v48 = v9 + 16;
  uint64_t v51 = v9;
  uint64_t v55 = v7;
  uint64_t v45 = v7 + 32;
  uint64_t v46 = v9 + 32;
  v57 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v58 = a1;
  uint64_t v44 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  uint64_t v54 = v4;
  uint64_t v49 = v13;
  uint64_t v21 = v51;
  uint64_t v20 = v52;
  uint64_t v22 = v53;
  if (!v17) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v59 = (v17 - 1) & v17;
  int64_t v60 = v19;
  for (unint64_t i = __clz(__rbit64(v17)) | (v19 << 6); ; unint64_t i = __clz(__rbit64(v25)) + (v26 << 6))
  {
    uint64_t v28 = v58;
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v50, *(void *)(v58 + 48) + *(void *)(v21 + 72) * i, v20);
    uint64_t v29 = *(void *)(v28 + 56);
    uint64_t v31 = v55;
    uint64_t v30 = v56;
    (*(void (**)(char *, unint64_t, uint64_t))(v55 + 16))(v22, v29 + *(void *)(v55 + 72) * i, v56);
    uint64_t v32 = v54;
    uint64_t v33 = &v49[*(int *)(v54 + 48)];
    uint64_t v13 = v49;
    (*(void (**)(void))(v21 + 32))();
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
    uint64_t v4 = v32;
    v34(v33, v22, v30);
    uint64_t v35 = *v57;
    (*v57)(v13, 0, 1, v32);
    if ((*v44)(v13, 1, v32) == 1) {
      goto LABEL_28;
    }
    uint64_t v36 = v42;
    sub_246418928((uint64_t)v13, v42, &qword_268F7B1B0);
    if (v43(v36, v36 + *(int *)(v4 + 48)))
    {
      swift_release();
      uint64_t v37 = v39;
      sub_246418928(v36, v39, &qword_268F7B1B0);
      return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v35)(v37, 0, 1, v4);
    }
    uint64_t result = sub_24641269C(v36, &qword_268F7B1B0);
    int64_t v19 = v60;
    unint64_t v17 = v59;
    if (v59) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v24 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v41) {
      goto LABEL_27;
    }
    unint64_t v25 = *(void *)(v40 + 8 * v24);
    int64_t v26 = v19 + 1;
    if (!v25)
    {
      int64_t v26 = v19 + 2;
      if (v19 + 2 >= v41) {
        goto LABEL_27;
      }
      unint64_t v25 = *(void *)(v40 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v19 + 3;
        if (v19 + 3 >= v41) {
          goto LABEL_27;
        }
        unint64_t v25 = *(void *)(v40 + 8 * v26);
        if (!v25)
        {
          int64_t v26 = v19 + 4;
          if (v19 + 4 >= v41) {
            goto LABEL_27;
          }
          unint64_t v25 = *(void *)(v40 + 8 * v26);
          if (!v25) {
            break;
          }
        }
      }
    }
LABEL_20:
    uint64_t v59 = (v25 - 1) & v25;
    int64_t v60 = v26;
  }
  uint64_t v27 = v19 + 5;
  if (v19 + 5 >= v41)
  {
LABEL_27:
    uint64_t v35 = *v57;
    (*v57)(v13, 1, 1, v4);
LABEL_28:
    swift_release();
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v35)(v39, 1, 1, v4);
  }
  unint64_t v25 = *(void *)(v40 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v19 + 5;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v41) {
      goto LABEL_27;
    }
    unint64_t v25 = *(void *)(v40 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_20;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2464169DC(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_268F7B198 + dword_268F7B198);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2464189D4;
  return v5(a1);
}

uint64_t sub_246416A98()
{
  return TextAnimationManager.replacementEffectDidComplete(_:)();
}

uint64_t sub_246416ABC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_246416CB4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_246417A48();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_246426320();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = sub_246426620();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_246417248(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_246426620();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_246416C8C(uint64_t a1)
{
  return a1;
}

unint64_t sub_246416CB4(uint64_t a1)
{
  sub_246426320();
  sub_24641898C(&qword_268F7B018, MEMORY[0x263F07508]);
  uint64_t v2 = sub_2464266F0();

  return sub_246417888(a1, v2);
}

uint64_t sub_246416D4C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = sub_246426620();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246426320();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B2C0);
  int v50 = a2;
  uint64_t v12 = sub_246426970();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  uint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v43) {
      break;
    }
    int64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_24641898C(&qword_268F7B018, MEMORY[0x263F07508]);
    uint64_t result = sub_2464266F0();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v42;
  int64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

unint64_t sub_246417248(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246426320();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_2464268C0();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      char v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      unint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_24641898C(&qword_268F7B018, MEMORY[0x263F07508]);
        uint64_t v19 = sub_2464266F0();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(sub_246426620() - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *uint64_t v29 = v31 & v30;
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

uint64_t sub_246417590(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_246426320();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_246416CB4(a2);
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
      sub_246417A48();
      goto LABEL_7;
    }
    sub_246416D4C(v17, a3 & 1);
    unint64_t v28 = sub_246416CB4(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      unint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_246417794(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_2464269D0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = sub_246426620();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;

  return v24(v26, a1, v25);
}

uint64_t sub_246417794(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_246426320();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_246426620();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

unint64_t sub_246417888(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_246426320();
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
      sub_24641898C(&qword_268F7B2C8, MEMORY[0x263F07508]);
      char v15 = sub_246426720();
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

void *sub_246417A48()
{
  uint64_t v42 = sub_246426620();
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_246426320();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B2C0);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_246426960();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  char v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    uint64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_246417DF0(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  v2[8] = sub_2464267E0();
  v2[9] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[10] = v4;
  v2[11] = v3;
  return MEMORY[0x270FA2498](sub_246417E8C, v4, v3);
}

uint64_t sub_246417E8C()
{
  type metadata accessor for TextAnimationManager.TextEffectChunk(0);
  uint64_t v1 = swift_dynamicCastClass();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)(v0 + 56) + OBJC_IVAR___WKSTextAnimationManager_delegate;
    swift_beginAccess();
    uint64_t v4 = MEMORY[0x24C52C7D0](v3);
    *(void *)(v0 + 96) = v4;
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = *(id *)(v0 + 48);
      uint64_t v7 = sub_2464267D0();
      *(void *)(v0 + 104) = v7;
      uint64_t v8 = swift_task_alloc();
      *(void *)(v0 + 112) = v8;
      *(void *)(v8 + 16) = v5;
      *(void *)(v8 + 24) = v2;
      int64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v9;
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B2A8);
      *int64_t v9 = v0;
      v9[1] = sub_2464181D0;
      uint64_t v11 = MEMORY[0x263F8F500];
      return MEMORY[0x270FA2318](v0 + 40, v7, v11, 0xD00000000000003BLL, 0x8000000246428D70, sub_2464187E4, v8, v10);
    }
    id v16 = *(id *)(v0 + 48);
    swift_release();
    if (qword_268F7C0B0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_246426560();
    __swift_project_value_buffer(v17, (uint64_t)qword_268F7C0B8);
    uint64_t v13 = sub_246426540();
    os_log_type_t v18 = sub_246426830();
    BOOL v19 = os_log_type_enabled(v13, v18);
    unint64_t v20 = *(void **)(v0 + 48);
    if (v19)
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_246402000, v13, v18, "Can't obtain Targeted Preview. Missing delegate.", v21, 2u);
      MEMORY[0x24C52C6E0](v21, -1, -1);
    }
  }
  else
  {
    swift_release();
    if (qword_268F7C0B0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_246426560();
    __swift_project_value_buffer(v12, (uint64_t)qword_268F7C0B8);
    uint64_t v13 = sub_246426540();
    os_log_type_t v14 = sub_246426830();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v15 = 0;
      _os_log_impl(&dword_246402000, v13, v14, "Can't get text preview. Incorrect UITextEffectTextChunk subclass", v15, 2u);
      MEMORY[0x24C52C6E0](v15, -1, -1);
    }
  }

  unint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22(0);
}

uint64_t sub_2464181D0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 80);
  return MEMORY[0x270FA2498](sub_246418330, v3, v2);
}

uint64_t sub_246418330()
{
  uint64_t v1 = (void *)v0[6];
  swift_unknownObjectRelease();

  swift_release();
  uint64_t v2 = v0[5];
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_2464183A8()
{
  return sub_24641635C();
}

unint64_t sub_2464183B8()
{
  unint64_t result = qword_268F7B1C0[0];
  if (!qword_268F7B1C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268F7B1C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WKTextAnimationType()
{
  return &type metadata for WKTextAnimationType;
}

uint64_t sub_24641841C()
{
  return type metadata accessor for TextAnimationManager(0);
}

void sub_246418424()
{
  sub_2464184D4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2464184D4()
{
  if (!qword_268F7B1E8)
  {
    sub_246426620();
    unint64_t v0 = sub_246426880();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F7B1E8);
    }
  }
}

uint64_t sub_24641852C()
{
  uint64_t result = sub_246426320();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2464185C4()
{
  return type metadata accessor for TextAnimationManager.TextEffectChunk(0);
}

uint64_t sub_2464185CC()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_246418614()
{
  uint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_2464075B4;
  uint64_t v7 = (uint64_t (*)(uint64_t, char, uint64_t, uint64_t))((char *)&dword_268F7B258 + dword_268F7B258);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_2464186E0()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246418728()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_246409B64;
  id v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268F7B288 + dword_268F7B288);
  return v6(v2, v3, v4);
}

void sub_2464187E4(uint64_t a1)
{
  sub_246415ABC(a1, *(void **)(v1 + 16));
}

uint64_t sub_2464187EC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F7B2B0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_246418880(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F7B2B0);
  id v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268F7B2B0);
  return sub_2464267B0();
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

uint64_t sub_246418928(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24641898C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.effectView()
{
  return 0;
}

uint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.processedRangeOffset()
{
  return 0;
}

uint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.contextRange()
{
  return 0;
}

uint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.activePonderingEffect()
{
  return 0;
}

uint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.activeReplacementEffect()
{
  return 0;
}

unint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.textVisibilityRegionIdentifiers()
{
  return sub_246418A18(MEMORY[0x263F8EE78]);
}

unint64_t sub_246418A18(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B508);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4B8);
  uint64_t v6 = sub_246426980();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24642256C(v12, (uint64_t)v5);
    uint64_t v14 = *v5;
    unint64_t result = sub_2464200F4(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v7[6] + 8 * result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_246426320();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

uint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.replacementQueue()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of WKIntelligenceTextEffectCoordinator.onFlushCompletion()
{
  return 0;
}

id WKIntelligenceTextEffectCoordinator.init(delegate:)(uint64_t a1)
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDelegate_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  id v1;

  id v1 = sub_246421140(a1);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t WKIntelligenceTextEffectCoordinator.startAnimation(for:)(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  sub_2464267E0();
  v3[9] = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  v3[10] = v5;
  v3[11] = v4;
  return MEMORY[0x270FA2498](sub_246418DE0, v5, v4);
}

uint64_t sub_246418DE0()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView);
  if (v3)
  {
    id v4 = v3;
    sub_24640CCE4();

    uint64_t v5 = *(void **)(v1 + v2);
    if (v5)
    {
      objc_msgSend(v5, sel_removeFromSuperview);
      uint64_t v3 = *(void **)(v1 + v2);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  uint64_t v6 = v0[8];
  uint64_t v7 = v0[6];
  *(void *)(v1 + v2) = 0;

  *(void *)(v6 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_processedRangeOffset) = 0;
  uint64_t v8 = v6 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_contextRange;
  *(void *)uint64_t v8 = 0;
  *(void *)(v8 + 8) = 0;
  *(unsigned char *)(v8 + 16) = 1;
  *(void *)(v6 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect) = 0;
  swift_release();
  *(void *)(v6 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect) = 0;
  swift_release();
  uint64_t v9 = MEMORY[0x263F8EE78];
  unint64_t v10 = sub_246418A18(MEMORY[0x263F8EE78]);
  unint64_t v11 = (unint64_t *)(v6 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_textVisibilityRegionIdentifiers);
  swift_beginAccess();
  *unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  *(void *)(v6 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue) = v9;
  swift_bridgeObjectRelease();
  uint64_t result = sub_246426210();
  if (result == v7)
  {
    swift_release();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  else
  {
    uint64_t v15 = v0[6];
    uint64_t v14 = v0[7];
    uint64_t v16 = v15 + v14;
    if (__OFADD__(v15, v14))
    {
      __break(1u);
    }
    else
    {
      uint64_t v17 = v0[8] + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_contextRange;
      *(void *)uint64_t v17 = v15;
      *(void *)(v17 + 8) = v16;
      *(unsigned char *)(v17 + 16) = 0;
      _s5ChunkC9PonderingCMa(0);
      uint64_t v18 = swift_allocObject();
      v0[12] = v18;
      sub_246426310();
      uint64_t v19 = (void *)(v18 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range);
      *uint64_t v19 = v15;
      v19[1] = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B340);
      v0[5] = v18;
      swift_retain();
      uint64_t v20 = sub_24640E168((uint64_t)(v0 + 5));
      v0[13] = v20;
      BOOL v21 = (void *)swift_task_alloc();
      v0[14] = v21;
      *BOOL v21 = v0;
      v21[1] = sub_246419068;
      return sub_2464191FC(v20);
    }
  }
  return result;
}

uint64_t sub_246419068()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 80);
  return MEMORY[0x270FA2498](sub_246419188, v3, v2);
}

uint64_t sub_246419188()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2464191FC(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4C0);
  v2[5] = swift_task_alloc();
  sub_2464267E0();
  v2[6] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[7] = v4;
  v2[8] = v3;
  return MEMORY[0x270FA2498](sub_2464192C4, v4, v3);
}

uint64_t sub_2464192C4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect;
  v0[9] = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect;
  uint64_t v4 = *(void *)(v2 + v3);
  if (v4)
  {
    if (!v1)
    {
      uint64_t v5 = *(void *)(v4 + *(void *)(*(void *)v4 + 104));
      v0[12] = v5;
      swift_retain();
      uint64_t v6 = (void *)swift_task_alloc();
      v0[13] = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_246419794;
      return sub_24641D068(v5, 1, 1);
    }
    goto LABEL_11;
  }
  if (!v1)
  {
LABEL_11:
    swift_release();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  swift_retain();
  sub_24641CF3C();
  uint64_t v8 = *(void **)(v2 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView);
  v0[10] = v8;
  if (!v8)
  {
    uint64_t v14 = v0[5];
    swift_release();
    swift_release();
    uint64_t v15 = type metadata accessor for PlatformIntelligenceTextEffectID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
    sub_24641269C(v0[5], &qword_268F7B4C0);
    *(void *)(v0[4] + v0[9]) = v0[3];
    swift_retain();
    goto LABEL_11;
  }
  v0[2] = v1;
  v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[11] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B340);
  uint64_t v11 = sub_246407B48(&qword_268F7B500, &qword_268F7B340);
  *uint64_t v9 = v0;
  v9[1] = sub_246419574;
  uint64_t v12 = v0[5];
  return sub_24640C3C8(v12, (uint64_t)(v0 + 2), v10, v11);
}

uint64_t sub_246419574()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 80);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_2464196B4, v4, v3);
}

uint64_t sub_2464196B4()
{
  uint64_t v1 = v0[5];
  swift_release();
  swift_release();
  uint64_t v2 = type metadata accessor for PlatformIntelligenceTextEffectID();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  sub_24641269C(v0[5], &qword_268F7B4C0);
  *(void *)(v0[4] + v0[9]) = v0[3];
  swift_retain();
  swift_release();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_246419794()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_2464198D8, v3, v2);
}

void sub_2464198D8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView;
  v0[14] = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView;
  uint64_t v3 = *(void **)(v1 + v2);
  v0[15] = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(v1 + v0[9]);
    if (v4)
    {
      uint64_t v5 = v4 + qword_268F7C788;
      v3;
      uint64_t v6 = (void *)swift_task_alloc();
      v0[16] = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_246419A80;
      sub_24640C6F4(v5);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_release();
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[4];
    if (!*(void *)(v8 + v7)
      && !*(void *)(v8 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect))
    {
      uint64_t v9 = v0[14];
      uint64_t v10 = *(void **)(v8 + v9);
      if (v10)
      {
        objc_msgSend(v10, sel_removeFromSuperview);
        uint64_t v11 = *(void **)(v8 + v9);
        uint64_t v9 = v0[14];
        uint64_t v8 = v0[4];
      }
      else
      {
        uint64_t v11 = 0;
      }
      *(void *)(v8 + v9) = 0;

      uint64_t v7 = v0[9];
      uint64_t v8 = v0[4];
    }
    *(void *)(v8 + v7) = v0[3];
    swift_retain();
    swift_release();
    swift_task_dealloc();
    uint64_t v12 = (void (*)(void))v0[1];
    v12();
  }
}

uint64_t sub_246419A80()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 120);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_246419BC0, v4, v3);
}

uint64_t sub_246419BC0()
{
  swift_release();
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[4];
  if (!*(void *)(v2 + v1)
    && !*(void *)(v2 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect))
  {
    uint64_t v3 = v0[14];
    uint64_t v4 = *(void **)(v2 + v3);
    if (v4)
    {
      objc_msgSend(v4, sel_removeFromSuperview);
      uint64_t v5 = *(void **)(v2 + v3);
      uint64_t v3 = v0[14];
      uint64_t v2 = v0[4];
    }
    else
    {
      uint64_t v5 = 0;
    }
    *(void *)(v2 + v3) = 0;

    uint64_t v1 = v0[9];
    uint64_t v2 = v0[4];
  }
  *(void *)(v2 + v1) = v0[3];
  swift_retain();
  swift_release();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_246419E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  sub_2464267E0();
  v4[6] = sub_2464267D0();
  uint64_t v6 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_246419EBC, v6, v5);
}

uint64_t sub_246419EBC()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = (const void *)v0[4];
  swift_release();
  v0[7] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  void *v4 = v0;
  v4[1] = sub_246419F74;
  uint64_t v6 = v0[2];
  uint64_t v5 = v0[3];
  return WKIntelligenceTextEffectCoordinator.startAnimation(for:)(v6, v5);
}

uint64_t sub_246419F74()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 56);
  uint64_t v2 = *(void **)(*v0 + 40);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t WKIntelligenceTextEffectCoordinator.requestReplacement(withProcessedRange:finished:characterDelta:operation:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 96) = a6;
  *(void *)(v7 + 104) = v6;
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 88) = a5;
  *(unsigned char *)(v7 + 152) = a3;
  *(void *)(v7 + 64) = a1;
  *(void *)(v7 + 72) = a2;
  sub_2464267E0();
  *(void *)(v7 + 112) = sub_2464267D0();
  uint64_t v9 = sub_2464267A0();
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 128) = v8;
  return MEMORY[0x270FA2498](sub_24641A150, v9, v8);
}

uint64_t sub_24641A150()
{
  uint64_t v3 = *(void *)(v0 + 64);
  if (sub_246426210() == v3) {
    goto LABEL_11;
  }
  uint64_t v5 = *(char **)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = &v5[v4];
  if (__OFADD__(v5, v4))
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)(v0 + 96);
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88);
  char v10 = *(unsigned char *)(v0 + 152);
  uint64_t v11 = swift_allocObject();
  *(void *)(v0 + 136) = v11;
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = v7;
  *(void *)(v0 + 16) = v5;
  *(void *)(v0 + 24) = v6;
  *(unsigned char *)(v0 + 32) = v10;
  *(void *)(v0 + 40) = v9;
  *(void *)(v0 + 48) = &unk_268F7B360;
  *(void *)(v0 + 56) = v11;
  uint64_t v2 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue;
  uint64_t v5 = *(char **)(v1 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue);
  swift_retain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + v2) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_15:
    uint64_t v5 = sub_246420288(0, *((void *)v5 + 2) + 1, 1, v5);
    *(void *)(v1 + v2) = v5;
  }
  uint64_t v13 = (long long *)(v0 + 16);
  unint64_t v15 = *((void *)v5 + 2);
  unint64_t v14 = *((void *)v5 + 3);
  if (v15 >= v14 >> 1)
  {
    uint64_t v5 = sub_246420288((char *)(v14 > 1), v15 + 1, 1, v5);
    *(void *)(v1 + v2) = v5;
  }
  *((void *)v5 + 2) = v15 + 1;
  uint64_t v16 = &v5[48 * v15];
  long long v17 = *v13;
  long long v18 = *(_OWORD *)(v0 + 48);
  *((_OWORD *)v16 + 3) = *(_OWORD *)(v0 + 32);
  *((_OWORD *)v16 + 4) = v18;
  *((_OWORD *)v16 + 2) = v17;
  if (*(void *)(*(void *)(v1 + v2) + 16) == 1)
  {
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_24641A374;
    return sub_24641A500((uint64_t)v13);
  }
  swift_release();
LABEL_11:
  swift_release();
  BOOL v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_24641A374()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = *(void *)(v1 + 120);
  return MEMORY[0x270FA2498](sub_24641A494, v3, v2);
}

uint64_t sub_24641A494()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24641A500(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  sub_2464267E0();
  v2[5] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_24641A598, v4, v3);
}

void sub_24641A598()
{
  uint64_t v1 = (uint64_t *)v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = *v1;
  uint64_t v4 = v1[3];
  uint64_t v5 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_processedRangeOffset;
  v0[8] = v4;
  v0[9] = v5;
  uint64_t v6 = *(void *)(v2 + v5);
  uint64_t v7 = v3 + v6;
  if (__OFADD__(v3, v6))
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v8 = v1[1];
  uint64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = v9 + v4;
  if (__OFADD__(v9, v4))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  if (v9 < v7 || v10 < v7) {
    goto LABEL_14;
  }
  char v12 = *((unsigned char *)v1 + 16);
  uint64_t v14 = v1[4];
  uint64_t v13 = v1[5];
  _s5ChunkC11ReplacementCMa(0);
  uint64_t v15 = swift_allocObject();
  v0[10] = v15;
  uint64_t v16 = (void *)(v15
                 + OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_rangeAfterReplacement);
  void *v16 = v7;
  v16[1] = v10;
  *(unsigned char *)(v15
           + OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_finished) = v12;
  long long v17 = (void *)(v15
                 + OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_replacement);
  void *v17 = v14;
  v17[1] = v13;
  swift_retain();
  sub_246426310();
  long long v18 = (void *)(v15 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range);
  void *v18 = v7;
  v18[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4C8);
  v0[2] = v15;
  swift_retain();
  uint64_t v19 = sub_24640CE5C((uint64_t)(v0 + 2));
  v0[11] = v19;
  uint64_t v20 = (void *)swift_task_alloc();
  v0[12] = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_24641A744;
  sub_24641C940(v19);
}

uint64_t sub_24641A744()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24641A864, v3, v2);
}

uint64_t sub_24641A864()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[4];
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v5 = *(void *)(v3 + v1);
  BOOL v6 = __OFADD__(v5, v2);
  uint64_t v7 = v5 + v2;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0[4] + v0[9]) = v7;
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  return result;
}

uint64_t sub_24641AAB4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 48) = a6;
  *(void *)(v7 + 56) = a7;
  *(void *)(v7 + 32) = a4;
  *(void *)(v7 + 40) = a5;
  *(unsigned char *)(v7 + 96) = a3;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  sub_2464267E0();
  *(void *)(v7 + 64) = sub_2464267D0();
  uint64_t v9 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24641AB58, v9, v8);
}

uint64_t sub_24641AB58()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(const void **)(v0 + 40);
  uint64_t v3 = *(const void **)(v0 + 48);
  swift_release();
  uint64_t v4 = _Block_copy(v2);
  *(void *)(v0 + 72) = _Block_copy(v3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 80) = v5;
  *(void *)(v5 + 16) = v4;
  id v6 = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24641AC64;
  uint64_t v8 = *(void *)(v0 + 24);
  uint64_t v9 = *(void *)(v0 + 32);
  char v10 = *(unsigned char *)(v0 + 96);
  uint64_t v11 = *(void *)(v0 + 16);
  return WKIntelligenceTextEffectCoordinator.requestReplacement(withProcessedRange:finished:characterDelta:operation:)(v11, v8, v10, v9, (uint64_t)sub_24642215C, v5);
}

uint64_t sub_24641AC64()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 72);
  uint64_t v2 = *(void **)(*v0 + 56);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_release();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24641ADC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_246406AD4;
  v7[3] = &block_descriptor_96;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t WKIntelligenceTextEffectCoordinator.flushReplacements()()
{
  v1[2] = v0;
  v1[3] = sub_2464267E0();
  v1[4] = sub_2464267D0();
  uint64_t v3 = sub_2464267A0();
  v1[5] = v3;
  v1[6] = v2;
  return MEMORY[0x270FA2498](sub_24641AF18, v3, v2);
}

uint64_t sub_24641AF18()
{
  uint64_t v1 = *(void *)(*(void *)(v0[2] + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue) + 16);
  uint64_t v2 = sub_2464267D0();
  v0[7] = v2;
  if (v1)
  {
    uint64_t v3 = v0[2];
    uint64_t v4 = swift_task_alloc();
    v0[12] = v4;
    *(void *)(v4 + 16) = v3;
    uint64_t v5 = (void *)swift_task_alloc();
    v0[13] = v5;
    *uint64_t v5 = v0;
    uint64_t v6 = MEMORY[0x263F8EE60];
    v5[1] = sub_24641B5D0;
    uint64_t v7 = MEMORY[0x263F8F500];
    return MEMORY[0x270FA2318](v5, v2, v7, 0xD000000000000013, 0x8000000246428DD0, sub_246421324, v4, v6 + 8);
  }
  else
  {
    uint64_t v9 = sub_2464267A0();
    v0[8] = v9;
    v0[9] = v8;
    return MEMORY[0x270FA2498](sub_24641B088, v9, v8);
  }
}

uint64_t sub_24641B088()
{
  uint64_t v1 = v0[2];
  if (*(void *)(v1 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect))
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[10] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24641B1E8;
    return sub_2464191FC(0);
  }
  else if (*(void *)(v1 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect))
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[11] = v4;
    void *v4 = v0;
    v4[1] = sub_24641B3EC;
    return sub_24641C940(0);
  }
  else
  {
    swift_release();
    uint64_t v5 = v0[5];
    uint64_t v6 = v0[6];
    return MEMORY[0x270FA2498](sub_24641B570, v5, v6);
  }
}

uint64_t sub_24641B1E8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_24641B308, v3, v2);
}

uint64_t sub_24641B308()
{
  if (*(void *)(v0[2] + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect))
  {
    uint64_t v1 = (void *)swift_task_alloc();
    v0[11] = v1;
    void *v1 = v0;
    v1[1] = sub_24641B3EC;
    return sub_24641C940(0);
  }
  else
  {
    swift_release();
    uint64_t v3 = v0[5];
    uint64_t v4 = v0[6];
    return MEMORY[0x270FA2498](sub_24641B570, v3, v4);
  }
}

uint64_t sub_24641B3EC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_24641B50C, v3, v2);
}

uint64_t sub_24641B50C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  return MEMORY[0x270FA2498](sub_24641B570, v1, v2);
}

uint64_t sub_24641B570()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24641B5D0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](sub_246422810, v3, v2);
}

uint64_t sub_24641B730(uint64_t a1, char *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v9 = &a2[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_onFlushCompletion];
  uint64_t v10 = *(void *)&a2[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_onFlushCompletion];
  *(void *)uint64_t v9 = &unk_268F7B4F0;
  *((void *)v9 + 1) = v8;
  uint64_t v11 = a2;
  return sub_246407474(v10);
}

uint64_t sub_24641B884(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_2464267E0();
  v2[5] = sub_2464267D0();
  v2[6] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[7] = v4;
  v2[8] = v3;
  return MEMORY[0x270FA2498](sub_24641B92C, v4, v3);
}

uint64_t sub_24641B92C()
{
  uint64_t v1 = v0[2];
  if (*(void *)(v1 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect))
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[9] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24641BAA8;
    return sub_2464191FC(0);
  }
  else if (*(void *)(v1 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect))
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[10] = v4;
    void *v4 = v0;
    v4[1] = sub_24641BCC8;
    return sub_24641C940(0);
  }
  else
  {
    swift_release();
    uint64_t v6 = sub_2464267A0();
    return MEMORY[0x270FA2498](sub_24641BE68, v6, v5);
  }
}

uint64_t sub_24641BAA8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_24641BBC8, v3, v2);
}

uint64_t sub_24641BBC8()
{
  if (*(void *)(*(void *)(v0 + 16) + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect))
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v1;
    void *v1 = v0;
    v1[1] = sub_24641BCC8;
    return sub_24641C940(0);
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_2464267A0();
    return MEMORY[0x270FA2498](sub_24641BE68, v4, v3);
  }
}

uint64_t sub_24641BCC8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_24641BDE8, v3, v2);
}

uint64_t sub_24641BDE8()
{
  swift_release();
  uint64_t v1 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24641BE68, v1, v0);
}

uint64_t sub_24641BE68()
{
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4E0);
  sub_2464267B0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24641C048(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_2464267E0();
  v2[4] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24641C0E0, v4, v3);
}

uint64_t sub_24641C0E0()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  void *v4 = v0;
  v4[1] = sub_24642281C;
  return WKIntelligenceTextEffectCoordinator.flushReplacements()();
}

uint64_t WKIntelligenceTextEffectCoordinator.restoreSelection(acceptedReplacements:)(char a1)
{
  *(void *)(v2 + 120) = v1;
  *(unsigned char *)(v2 + 152) = a1;
  sub_2464267E0();
  *(void *)(v2 + 128) = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  *(void *)(v2 + 136) = v4;
  *(void *)(v2 + 144) = v3;
  return MEMORY[0x270FA2498](sub_24641C22C, v4, v3);
}

uint64_t sub_24641C22C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 120);
  uint64_t v3 = (uint64_t *)(v2 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_contextRange);
  if ((*(unsigned char *)(v2 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_contextRange + 16) & 1) == 0)
  {
    uint64_t v7 = *v3;
    uint64_t v6 = v3[1];
    if (*(unsigned char *)(v1 + 152) == 1)
    {
      uint64_t v8 = *(void *)(v2 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_processedRangeOffset);
      BOOL v9 = __OFADD__(v6, v8);
      v6 += v8;
      if (v9)
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      if (v6 < v7)
      {
LABEL_14:
        __break(1u);
        return MEMORY[0x270FA23F0](a1);
      }
    }
    uint64_t v10 = v6 - v7;
    if (!__OFSUB__(v6, v7))
    {
      uint64_t v11 = *(void **)(v2 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_delegate);
      *(void *)(v1 + 16) = v1;
      *(void *)(v1 + 24) = sub_24641C3D4;
      uint64_t v12 = swift_continuation_init();
      *(void *)(v1 + 80) = MEMORY[0x263EF8330];
      *(void *)(v1 + 88) = 0x40000000;
      *(void *)(v1 + 96) = sub_2464154BC;
      *(void *)(v1 + 104) = &block_descriptor_0;
      *(void *)(v1 + 112) = v12;
      objc_msgSend(v11, sel_intelligenceTextEffectCoordinator_setSelectionForRange_completion_, v2, v7, v10, v1 + 80);
      a1 = v1 + 16;
      return MEMORY[0x270FA23F0](a1);
    }
    __break(1u);
    goto LABEL_13;
  }
  swift_release();
  uint64_t v4 = *(uint64_t (**)(void))(v1 + 8);
  return v4();
}

uint64_t sub_24641C3D4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  uint64_t v2 = *(void *)(*(void *)v0 + 136);
  return MEMORY[0x270FA2498](sub_24641C4DC, v2, v1);
}

uint64_t sub_24641C4DC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24641C6B4(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  sub_2464267E0();
  *(void *)(v3 + 32) = sub_2464267D0();
  uint64_t v5 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24641C750, v5, v4);
}

uint64_t sub_24641C750()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = *(const void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 40) = _Block_copy(v2);
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v4;
  void *v4 = v0;
  v4[1] = sub_24641C808;
  char v5 = *(unsigned char *)(v0 + 56);
  return WKIntelligenceTextEffectCoordinator.restoreSelection(acceptedReplacements:)(v5);
}

uint64_t sub_24641C808()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24641C940(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4C0);
  v2[5] = swift_task_alloc();
  sub_2464267E0();
  v2[6] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[7] = v4;
  v2[8] = v3;
  return MEMORY[0x270FA2498](sub_24641CA08, v4, v3);
}

uint64_t sub_24641CA08()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect;
  v0[9] = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect;
  uint64_t v4 = *(void *)(v2 + v3);
  if (v4)
  {
    if (v1) {
      goto LABEL_19;
    }
    uint64_t v5 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView;
    v0[12] = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView;
    uint64_t v6 = *(void **)(v2 + v5);
    v0[13] = v6;
    if (v6)
    {
      uint64_t v7 = v4 + qword_268F7C780;
      v6;
      uint64_t v8 = (void *)swift_task_alloc();
      v0[14] = v8;
      void *v8 = v0;
      v8[1] = sub_24641CD20;
      return sub_24640C6F4(v7);
    }
    swift_release();
    uint64_t v15 = v0[4];
    if (!*(void *)(v15 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect)
      && !*(void *)(v15 + v0[9]))
    {
      uint64_t v16 = v0[12];
      long long v17 = *(void **)(v15 + v16);
      if (v17)
      {
        objc_msgSend(v17, sel_removeFromSuperview);
        long long v18 = *(void **)(v15 + v16);
        uint64_t v16 = v0[12];
        uint64_t v15 = v0[4];
      }
      else
      {
        long long v18 = 0;
      }
      *(void *)(v15 + v16) = 0;
    }
LABEL_18:
    *(void *)(v0[4] + v0[9]) = v0[3];
    swift_retain();
LABEL_19:
    swift_release();
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
  if (!v1) {
    goto LABEL_19;
  }
  swift_retain();
  sub_24641CF3C();
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView);
  v0[10] = v10;
  if (!v10)
  {
    uint64_t v19 = v0[5];
    swift_release();
    swift_release();
    uint64_t v20 = type metadata accessor for PlatformIntelligenceTextEffectID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
    sub_24641269C(v0[5], &qword_268F7B4C0);
    goto LABEL_18;
  }
  v0[2] = v1;
  v10;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[11] = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4C8);
  uint64_t v13 = sub_246407B48(&qword_268F7B4D0, &qword_268F7B4C8);
  *uint64_t v11 = v0;
  v11[1] = sub_246419574;
  uint64_t v14 = v0[5];
  return sub_24640C3C8(v14, (uint64_t)(v0 + 2), v12, v13);
}

uint64_t sub_24641CD20()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 104);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_24641CE60, v4, v3);
}

uint64_t sub_24641CE60()
{
  swift_release();
  uint64_t v1 = v0[4];
  if (!*(void *)(v1 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect)
    && !*(void *)(v1 + v0[9]))
  {
    uint64_t v2 = v0[12];
    uint64_t v3 = *(void **)(v1 + v2);
    if (v3)
    {
      objc_msgSend(v3, sel_removeFromSuperview);
      uint64_t v4 = *(void **)(v1 + v2);
      uint64_t v2 = v0[12];
      uint64_t v1 = v0[4];
    }
    else
    {
      uint64_t v4 = 0;
    }
    *(void *)(v1 + v2) = 0;

    uint64_t v1 = v0[4];
  }
  *(void *)(v1 + v0[9]) = v0[3];
  swift_retain();
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

void sub_24641CF3C()
{
  uint64_t v1 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView;
  if (!*(void *)&v0[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView])
  {
    uint64_t v2 = v0;
    id v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_delegate], sel_viewForIntelligenceTextEffectCoordinator_, v0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4D8);
    id v4 = sub_24640C31C((uint64_t)v0);
    objc_msgSend(v4, sel_setUserInteractionEnabled_, 0);
    id v5 = v4;
    objc_msgSend(v3, sel_frame);
    objc_msgSend(v5, sel_setFrame_);

    id v6 = objc_msgSend(v3, sel_superview);
    if (v6)
    {
      uint64_t v7 = v6;
      objc_msgSend(v6, sel_addSubview_, v5);

      sub_24640C360();
      uint64_t v8 = *(void **)&v2[v1];
      *(void *)&v2[v1] = v5;
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_24641D068(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(v4 + 257) = a3;
  *(unsigned char *)(v4 + 256) = a2;
  *(void *)(v4 + 168) = a1;
  *(void *)(v4 + 176) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4B0);
  *(void *)(v4 + 184) = swift_task_alloc();
  *(void *)(v4 + 192) = swift_task_alloc();
  uint64_t v5 = sub_246426320();
  *(void *)(v4 + 200) = v5;
  *(void *)(v4 + 208) = *(void *)(v5 - 8);
  *(void *)(v4 + 216) = swift_task_alloc();
  sub_2464267E0();
  *(void *)(v4 + 224) = sub_2464267D0();
  uint64_t v7 = sub_2464267A0();
  *(void *)(v4 + 232) = v7;
  *(void *)(v4 + 240) = v6;
  return MEMORY[0x270FA2498](sub_24641D1A4, v7, v6);
}

uint64_t sub_24641D1A4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + 256);
  char v2 = *(unsigned char *)(v0 + 257);
  int v3 = *(unsigned __int8 *)(v0 + 256);
  _s5ChunkC9PonderingCMa(0);
  if (swift_dynamicCastClass()) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && (v2 & 1) == 0)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  uint64_t v7 = *(void *)(v0 + 176) + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_textVisibilityRegionIdentifiers;
  swift_beginAccess();
  uint64_t v8 = *(void *)v7;
  if (*(void *)(*(void *)v7 + 16))
  {
    uint64_t v9 = swift_retain();
    unint64_t v10 = sub_2464200F4(v9);
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v12 = *(void *)(v0 + 208);
    uint64_t v13 = *(void *)(v0 + 192);
    if (v14)
    {
      (*(void (**)(void, unint64_t, void))(v12 + 16))(*(void *)(v0 + 192), *(void *)(v8 + 56) + *(void *)(v12 + 72) * v10, *(void *)(v0 + 200));
      uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
      v15(v13, 0, 1, v11);
    }
    else
    {
      uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
      v15(*(void *)(v0 + 192), 1, 1, v11);
    }
    uint64_t v16 = *(void *)(v0 + 200);
    uint64_t v17 = *(void *)(v0 + 208);
    uint64_t v18 = *(void *)(v0 + 192);
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v16) != 1)
    {
      (*(void (**)(void, void, void))(*(void *)(v0 + 208) + 32))(*(void *)(v0 + 216), *(void *)(v0 + 192), *(void *)(v0 + 200));
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 208) + 56);
    v15(*(void *)(v0 + 192), 1, 1, *(void *)(v0 + 200));
  }
  uint64_t v20 = *(void *)(v0 + 208);
  uint64_t v19 = *(void *)(v0 + 216);
  uint64_t v21 = *(void *)(v0 + 200);
  uint64_t v22 = *(void *)(v0 + 184);
  uint64_t v23 = *(void *)(v0 + 168);
  sub_24641269C(*(void *)(v0 + 192), &qword_268F7B4B0);
  swift_endAccess();
  sub_246426310();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v22, v19, v21);
  v15(v22, 0, 1, v21);
  swift_beginAccess();
  swift_retain();
  uint64_t v24 = v23;
  uint64_t v1 = (unsigned __int8 *)(v0 + 256);
  sub_24641DBDC(v22, v24);
LABEL_17:
  uint64_t v25 = swift_endAccess();
  int64_t v26 = (uint64_t *)(*(void *)(v0 + 168)
                  + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range);
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  uint64_t v29 = v27 - v28;
  if (__OFSUB__(v27, v28))
  {
    __break(1u);
  }
  else
  {
    uint64_t v30 = *(void *)(v0 + 176);
    uint64_t v31 = *v1;
    uint64_t v32 = *(void **)(v30 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_delegate);
    uint64_t v33 = sub_2464262D0();
    *(void *)(v0 + 248) = v33;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_24641D560;
    uint64_t v34 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_2464154BC;
    *(void *)(v0 + 104) = &block_descriptor_119;
    *(void *)(v0 + 112) = v34;
    objc_msgSend(v32, sel_intelligenceTextEffectCoordinator_updateTextVisibilityForRange_visible_identifier_completion_, v30, v28, v29, v31, v33, v0 + 80);
    uint64_t v25 = v0 + 16;
  }
  return MEMORY[0x270FA23F0](v25);
}

uint64_t sub_24641D560()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 240);
  uint64_t v2 = *(void *)(*(void *)v0 + 232);
  return MEMORY[0x270FA2498](sub_24641D668, v2, v1);
}

uint64_t sub_24641D668()
{
  uint64_t v1 = (void *)v0[31];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[26];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

void __swiftcall WKIntelligenceTextEffectCoordinator.init()(WKIntelligenceTextEffectCoordinator *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

void WKIntelligenceTextEffectCoordinator.init()()
{
}

uint64_t sub_24641D848(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  sub_2464267E0();
  v2[18] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[19] = v4;
  v2[20] = v3;
  return MEMORY[0x270FA2498](sub_24641D8E0, v4, v3);
}

uint64_t sub_24641D8E0(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1[16] + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range);
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  uint64_t v5 = v3 - v4;
  if (__OFSUB__(v3, v4))
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = v1[17];
    uint64_t v7 = *(void **)(v6 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_delegate);
    v1[2] = v1;
    v1[7] = v1 + 15;
    v1[3] = sub_24641DA1C;
    uint64_t v8 = swift_continuation_init();
    v1[10] = MEMORY[0x263EF8330];
    v1[11] = 0x40000000;
    v1[12] = sub_24641DB88;
    v1[13] = &block_descriptor_7;
    v1[14] = v8;
    objc_msgSend(v7, sel_intelligenceTextEffectCoordinator_textPreviewsForRange_completion_, v6, v4, v5, v1 + 10);
    a1 = v1 + 2;
  }
  return MEMORY[0x270FA23F0](a1);
}

uint64_t sub_24641DA1C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  return MEMORY[0x270FA2498](sub_24641DB24, v2, v1);
}

uint64_t sub_24641DB24()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24641DB88(uint64_t a1, void *a2)
{
  **(void **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  id v2 = a2;

  return swift_continuation_resume();
}

uint64_t sub_24641DBDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4B0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246426320();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_24641269C(a1, &qword_268F7B4B0);
    sub_2464203A4(a2, (uint64_t)v8);
    swift_release();
    return sub_24641269C((uint64_t)v8, &qword_268F7B4B0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_246420B44((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16;
    swift_release();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24641DDAC(uint64_t a1)
{
  v2[35] = a1;
  v2[36] = v1;
  v2[37] = sub_2464267E0();
  v2[38] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[39] = v4;
  v2[40] = v3;
  return MEMORY[0x270FA2498](sub_24641DE48, v4, v3);
}

uint64_t sub_24641DE48()
{
  uint64_t v1 = v0[36] + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_contextRange;
  v0[41] = *(void *)(v1 + 8);
  if ((*(unsigned char *)(v1 + 16) & 1) != 0
    || (v0[42] = *(void *)(v0[35] + *(void *)(*(void *)v0[35] + 104)),
        _s5ChunkC11ReplacementCMa(0),
        uint64_t v2 = swift_dynamicCastClass(),
        (v0[43] = v2) == 0))
  {
    swift_release();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v3 = v2 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range;
    v0[44] = *(void *)(v2 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range);
    v0[45] = *(void *)(v3 + 8);
    swift_retain();
    uint64_t v4 = (void *)swift_task_alloc();
    v0[46] = v4;
    void *v4 = v0;
    v4[1] = sub_24641DF98;
    return sub_24641C940(0);
  }
}

uint64_t sub_24641DF98()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 320);
  uint64_t v3 = *(void *)(v1 + 312);
  return MEMORY[0x270FA2498](sub_24641E0B8, v3, v2);
}

uint64_t sub_24641E0B8(void *a1)
{
  uint64_t v3 = v1[44];
  uint64_t v2 = v1[45];
  uint64_t v4 = v2 - v3;
  if (__OFSUB__(v2, v3))
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v1[36];
    uint64_t v6 = *(void **)(v5 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_delegate);
    v1[2] = v1;
    v1[3] = sub_24641E1DC;
    uint64_t v7 = swift_continuation_init();
    v1[24] = MEMORY[0x263EF8330];
    v1[25] = 0x40000000;
    v1[26] = sub_2464154BC;
    v1[27] = &block_descriptor_12;
    v1[28] = v7;
    objc_msgSend(v6, sel_intelligenceTextEffectCoordinator_decorateReplacementsForRange_completion_, v5, v3, v4, v1 + 24);
    a1 = v1 + 2;
  }
  return MEMORY[0x270FA23F0](a1);
}

uint64_t sub_24641E1DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 320);
  uint64_t v2 = *(void *)(*(void *)v0 + 312);
  return MEMORY[0x270FA2498](sub_24641E2E4, v2, v1);
}

uint64_t sub_24641E2E4(void *a1)
{
  if (*(unsigned char *)(v1[43]
                + OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_finished) == 1)
  {
    uint64_t v2 = (char *)v1[36];
    if (*(void *)(*(void *)&v2[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue] + 16))
    {
      swift_retain();
      sub_2464219C4(0, 1);
      swift_release();
      v1[10] = v1;
      v1[11] = sub_24641E4A4;
      uint64_t v3 = swift_continuation_init();
      v1[29] = MEMORY[0x263EF8330];
      v1[30] = 0x40000000;
      v1[31] = sub_2464154BC;
      v1[32] = &block_descriptor_17;
      v1[33] = v3;
      objc_msgSend(v2, sel_restoreSelectionAcceptedReplacements_completion_, 1, v1 + 29);
      a1 = v1 + 10;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA23F0](a1);
  }
  else
  {
    v1[47] = sub_2464267D0();
    uint64_t v5 = sub_2464267A0();
    v1[48] = v5;
    v1[49] = v4;
    return MEMORY[0x270FA2498](sub_24641E5AC, v5, v4);
  }
}

uint64_t sub_24641E4A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 320);
  uint64_t v2 = *(void *)(*(void *)v0 + 312);
  return MEMORY[0x270FA2498](sub_246422814, v2, v1);
}

uint64_t sub_24641E5AC(void (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3[36];
  uint64_t v5 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_onFlushCompletion;
  v3[50] = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_onFlushCompletion;
  uint64_t v6 = (int **)(v4 + v5);
  uint64_t v7 = *v6;
  v3[51] = *v6;
  v3[52] = v6[1];
  if (!v7)
  {
    swift_release();
    a2 = v3[39];
    a3 = v3[40];
    a1 = sub_24641ECEC;
    return MEMORY[0x270FA2498](a1, a2, a3);
  }
  uint64_t v8 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue;
  v3[53] = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue;
  uint64_t v9 = *(void *)(v4 + v8);
  v3[54] = v9;
  unint64_t v10 = *(void *)(v9 + 16);
  v3[55] = v10;
  unint64_t v11 = v10 != 0;
  if (v10 != v11)
  {
    v3[56] = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_processedRangeOffset;
    if (v10 > v11)
    {
      sub_246407464((uint64_t)v7);
      v3[58] = v11;
      char v14 = (void *)(v3[54] + 48 * v11);
      v3[59] = v14[7];
      uint64_t v15 = (int *)v14[8];
      v3[60] = v14[9];
      uint64_t v17 = (uint64_t (*)(void))((char *)v15 + *v15);
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v12 = (void *)swift_task_alloc();
      v3[61] = v12;
      void *v12 = v3;
      uint64_t v13 = sub_24641EA1C;
      goto LABEL_9;
    }
    __break(1u);
    return MEMORY[0x270FA2498](a1, a2, a3);
  }
  uint64_t v17 = (uint64_t (*)(void))((char *)v7 + *v7);
  swift_retain();
  uint64_t v12 = (void *)swift_task_alloc();
  v3[57] = v12;
  void *v12 = v3;
  uint64_t v13 = sub_24641E7E0;
LABEL_9:
  v12[1] = v13;
  return v17();
}

uint64_t sub_24641E7E0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 392);
  uint64_t v3 = *(void *)(v1 + 384);
  return MEMORY[0x270FA2498](sub_24641E900, v3, v2);
}

uint64_t sub_24641E900()
{
  uint64_t v1 = v0[53];
  uint64_t v3 = v0[50];
  uint64_t v2 = v0[51];
  uint64_t v4 = v0[36];
  swift_release();
  uint64_t v5 = (uint64_t *)(v4 + v3);
  sub_246407474(v2);
  *(void *)(v4 + v1) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v6 = *v5;
  *uint64_t v5 = 0;
  v5[1] = 0;
  sub_246407474(v6);
  uint64_t v7 = v0[39];
  uint64_t v8 = v0[40];
  return MEMORY[0x270FA2498](sub_24641E9B0, v7, v8);
}

uint64_t sub_24641E9B0()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24641EA1C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 392);
  uint64_t v3 = *(void *)(v1 + 384);
  return MEMORY[0x270FA2498](sub_24641EB3C, v3, v2);
}

uint64_t sub_24641EB3C()
{
  uint64_t v1 = v0[59];
  uint64_t v2 = v0[56];
  uint64_t v3 = v0[36];
  uint64_t result = swift_release();
  uint64_t v5 = *(void *)(v3 + v2);
  uint64_t v6 = v5 + v1;
  if (__OFADD__(v5, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = v0[55];
    uint64_t v8 = v0[58] + 1;
    *(void *)(v0[36] + v0[56]) = v6;
    if (v8 == v7)
    {
      swift_bridgeObjectRelease();
      uint64_t v13 = (uint64_t (*)(void))(v0[51] + *(int *)v0[51]);
      uint64_t v9 = (void *)swift_task_alloc();
      v0[57] = v9;
      *uint64_t v9 = v0;
      uint64_t v10 = sub_24641E7E0;
    }
    else
    {
      v0[58] = v8;
      unint64_t v11 = (void *)(v0[54] + 48 * v8);
      v0[59] = v11[7];
      uint64_t v12 = (int *)v11[8];
      v0[60] = v11[9];
      uint64_t v13 = (uint64_t (*)(void))((char *)v12 + *v12);
      swift_retain();
      uint64_t v9 = (void *)swift_task_alloc();
      v0[61] = v9;
      *uint64_t v9 = v0;
      uint64_t v10 = sub_24641EA1C;
    }
    v9[1] = v10;
    return v13();
  }
  return result;
}

void sub_24641ECEC()
{
  uint64_t v1 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(*(void *)(v0 + 288) + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_processedRangeOffset);
  uint64_t v3 = v1 + v2;
  if (__OFADD__(v1, v2))
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)(v0 + 360);
  if (v3 < v4)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _s5ChunkC9PonderingCMa(0);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 496) = v5;
  sub_246426310();
  uint64_t v6 = (void *)(v5 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range);
  *uint64_t v6 = v4;
  v6[1] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B340);
  *(void *)(v0 + 272) = v5;
  swift_retain();
  uint64_t v7 = sub_24640E168(v0 + 272);
  *(void *)(v0 + 504) = v7;
  if (*v6 == v6[1])
  {
    uint64_t v8 = *(void *)(v0 + 288) + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue;
    if (*(void *)(*(void *)v8 + 16))
    {
      swift_retain();
      sub_2464219C4(0, 1);
      swift_release();
      uint64_t v9 = *(_OWORD **)v8;
      if (*(void *)(*(void *)v8 + 16))
      {
        long long v10 = v9[2];
        long long v11 = v9[4];
        *(_OWORD *)(v0 + 160) = v9[3];
        *(_OWORD *)(v0 + 176) = v11;
        *(_OWORD *)(v0 + 144) = v10;
        swift_retain();
        uint64_t v12 = (void *)swift_task_alloc();
        *(void *)(v0 + 520) = v12;
        void *v12 = v0;
        v12[1] = sub_24641F200;
        sub_24641A500(v0 + 144);
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v15 = *(void (**)(void))(v0 + 8);
        v15();
      }
      return;
    }
LABEL_17:
    __break(1u);
    return;
  }
  uint64_t v13 = v7;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 512) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_24641EF7C;
  sub_2464191FC(v13);
}

uint64_t sub_24641EF7C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 320);
  uint64_t v3 = *(void *)(v1 + 312);
  return MEMORY[0x270FA2498](sub_24641F09C, v3, v2);
}

void sub_24641F09C()
{
  uint64_t v1 = *(void *)(v0 + 288) + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue;
  if (*(void *)(*(void *)v1 + 16))
  {
    swift_retain();
    sub_2464219C4(0, 1);
    swift_release();
    uint64_t v2 = *(_OWORD **)v1;
    if (*(void *)(*(void *)v1 + 16))
    {
      long long v3 = v2[2];
      long long v4 = v2[4];
      *(_OWORD *)(v0 + 160) = v2[3];
      *(_OWORD *)(v0 + 176) = v4;
      *(_OWORD *)(v0 + 144) = v3;
      swift_retain();
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v0 + 520) = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_24641F200;
      sub_24641A500(v0 + 144);
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v6 = *(void (**)(void))(v0 + 8);
      v6();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24641F200()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 320);
  uint64_t v3 = *(void *)(v1 + 312);
  return MEMORY[0x270FA2498](sub_24641F320, v3, v2);
}

uint64_t sub_24641F320()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_246421AEC(v0 + 144);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24641F3B4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2464159C0;
  return sub_24641D848(v2);
}

uint64_t sub_24641F448(uint64_t *a1, char a2)
{
  uint64_t v4 = *a1;
  v2[2] = sub_2464267E0();
  v2[3] = sub_2464267D0();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24641F510;
  return sub_24641D068(v4, a2, 0);
}

uint64_t sub_24641F510()
{
  swift_task_dealloc();
  uint64_t v1 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_246422818, v1, v0);
}

uint64_t sub_24641F64C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_268F7B3D8 + dword_268F7B3D8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2464189D4;
  return v5(v2);
}

uint64_t sub_24641F6F8()
{
  v0[2] = sub_2464267E0();
  v0[3] = sub_2464267D0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_24641F7A8;
  return sub_2464191FC(0);
}

uint64_t sub_24641F7A8()
{
  swift_task_dealloc();
  uint64_t v1 = sub_2464267A0();
  return MEMORY[0x270FA2498](sub_24641F8E4, v1, v0);
}

uint64_t sub_24641F8E4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24641F944(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_246409B64;
  return sub_24641DDAC(a1);
}

uint64_t sub_24641F9D8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_id;
  uint64_t v2 = sub_246426320();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24641FA78()
{
  return swift_release();
}

uint64_t sub_24641FA8C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_id;
  uint64_t v2 = sub_246426320();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24641FB40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_id;
  uint64_t v4 = sub_246426320();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_24641FBB8()
{
  return sub_246426A00();
}

uint64_t sub_24641FC08()
{
  return sub_246426300();
}

uint64_t sub_24641FC38()
{
  return sub_246426A00();
}

uint64_t sub_24641FC84()
{
  return sub_2464262E0();
}

uint64_t sub_24641FCA0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_2464267E0();
  v2[5] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[6] = v4;
  v2[7] = v3;
  return MEMORY[0x270FA2498](sub_24641FD3C, v4, v3);
}

uint64_t sub_24641FD3C()
{
  long long v7 = *(_OWORD *)(v0 + 16);
  uint64_t v1 = sub_2464267D0();
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *(_OWORD *)(v2 + 16) = v7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24641FE4C;
  uint64_t v4 = MEMORY[0x263F8EE60] + 8;
  uint64_t v5 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2318](v3, v1, v5, 0x3A5F28636E797361, 0xE900000000000029, sub_246422468, v2, v4);
}

uint64_t sub_24641FE4C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24640B510, v3, v2);
}

uint64_t sub_24641FFAC(uint64_t a1, void (*a2)(uint64_t (*)(), uint64_t))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  a2(sub_246422504, v8);
  return swift_release();
}

unint64_t sub_2464200F4(uint64_t a1)
{
  sub_2464269E0();
  sub_246426300();
  uint64_t v2 = sub_246426A00();

  return sub_246420168(a1, v2);
}

unint64_t sub_246420168(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    swift_retain();
    char v6 = sub_2464262E0();
    swift_release();
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = ~v4;
      for (unint64_t i = (i + 1) & v7; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v7)
      {
        swift_retain();
        char v8 = sub_2464262E0();
        swift_release();
        if (v8) {
          break;
        }
      }
    }
  }
  return i;
}

char *sub_246420288(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4F8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
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

uint64_t sub_2464203A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2464200F4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_246420D60();
      uint64_t v9 = v19;
    }
    swift_release();
    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = sub_246426320();
    uint64_t v18 = *(void *)(v11 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v18 + 32))(a2, v10 + *(void *)(v18 + 72) * v6, v11);
    sub_24642092C(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = sub_246426320();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }

  return v12(v13, v14, 1, v15);
}

uint64_t sub_246420540(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v45 = sub_246426320();
  uint64_t v5 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4B8);
  int v43 = a2;
  uint64_t v8 = sub_246426970();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v41 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  unint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v42 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
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
    if (v21 >= v40) {
      break;
    }
    uint64_t v22 = v41;
    unint64_t v23 = v41[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v23 = v41[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v41[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v40) {
              goto LABEL_34;
            }
            unint64_t v23 = v41[v17];
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
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v7 + 56);
    uint64_t v26 = v7;
    uint64_t v27 = *(void *)(*(void *)(v7 + 48) + 8 * v20);
    uint64_t v28 = v5;
    uint64_t v29 = *(void *)(v5 + 72);
    uint64_t v30 = v25 + v29 * v20;
    if (v43)
    {
      (*v14)(v44, v30, v45);
    }
    else
    {
      (*v42)(v44, v30, v45);
      swift_retain();
    }
    sub_2464269E0();
    sub_246426300();
    uint64_t result = sub_246426A00();
    uint64_t v31 = -1 << *(unsigned char *)(v9 + 32);
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
    *(void *)(*(void *)(v9 + 48) + 8 * v18) = v27;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v29 * v18, v44, v45);
    ++*(void *)(v9 + 16);
    uint64_t v5 = v28;
    uint64_t v7 = v26;
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v22 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v7 + 32);
  if (v38 >= 64) {
    bzero(v22, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v38;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

unint64_t sub_24642092C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2464268C0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_2464269E0();
        swift_retain();
        sub_246426300();
        uint64_t v9 = sub_246426A00();
        uint64_t result = swift_release();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (void *)(v11 + 8 * v3);
        unint64_t v13 = (void *)(v11 + 8 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          void *v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_246426320() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_246420B44(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_2464200F4(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_246420D60();
      goto LABEL_7;
    }
    sub_246420540(v13, a3 & 1);
    unint64_t v24 = sub_2464200F4(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      int64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    _s5ChunkCMa(0);
    uint64_t result = sub_2464269D0();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = sub_246426320();
    uint64_t v19 = *(void *)(v18 - 8);
    unint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:
  sub_246420CB4(v10, a2, a1, v16);

  return swift_retain();
}

uint64_t sub_246420CB4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_246426320();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

void *sub_246420D60()
{
  uint64_t v1 = sub_246426320();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4B8);
  uint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_246426960();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *uint64_t v23 = v7;
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
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v5 + 48) + 8 * v15);
    unint64_t v18 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v18, v1);
    *(void *)(*(void *)(v7 + 48) + v16) = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v18, v4, v1);
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

uint64_t _sSo35WKIntelligenceTextEffectCoordinatorC14libWebKitSwiftE14characterDelta22forReceivedSuggestionsSiSaySo16WTTextSuggestionCG_tFZ_0(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v2)
  {
    while (v2 >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      while (1)
      {
        id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24C52C070](v4, a1) : *(id *)(a1 + 8 * v4 + 32);
        uint64_t v7 = v6;
        id v8 = objc_msgSend(v6, sel_replacement);
        sub_246426740();

        uint64_t v9 = sub_246426750();
        swift_bridgeObjectRelease();
        objc_msgSend(v7, sel_originalRange);
        uint64_t v11 = v10;

        uint64_t v12 = v9 - v11;
        if (__OFSUB__(v9, v11)) {
          break;
        }
        BOOL v13 = __OFADD__(v5, v12);
        v5 += v12;
        if (v13) {
          goto LABEL_13;
        }
        if (v2 == ++v4) {
          goto LABEL_16;
        }
      }
      __break(1u);
LABEL_13:
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      uint64_t result = sub_246426950();
      uint64_t v2 = result;
      if (!result) {
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    uint64_t v5 = 0;
LABEL_16:
    swift_bridgeObjectRelease();
    return v5;
  }
  return result;
}

id sub_246421140(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_effectView] = 0;
  *(void *)&v1[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_processedRangeOffset] = 0;
  uint64_t v3 = &v1[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_contextRange];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  *(void *)&v1[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect] = 0;
  *(void *)&v1[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activeReplacementEffect] = 0;
  uint64_t v4 = OBJC_IVAR___WKIntelligenceTextEffectCoordinator_textVisibilityRegionIdentifiers;
  uint64_t v5 = v1;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)&v1[v4] = sub_246418A18(MEMORY[0x263F8EE78]);
  *(void *)&v5[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_replacementQueue] = v6;
  uint64_t v7 = &v5[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_onFlushCompletion];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  *(void *)&v5[OBJC_IVAR___WKIntelligenceTextEffectCoordinator_delegate] = a1;
  swift_unknownObjectRetain();

  v9.receiver = v5;
  v9.super_class = (Class)WKIntelligenceTextEffectCoordinator;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t _s5ChunkC9PonderingCMa(uint64_t a1)
{
  return sub_246413C10(a1, (uint64_t *)&unk_268F7C5B8);
}

uint64_t sub_246421254()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24642128C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_2464075B4;
  return sub_24641FCA0(v2, v3);
}

uint64_t sub_246421324(uint64_t a1)
{
  return sub_24641B730(a1, *(char **)(v1 + 16));
}

uint64_t sub_24642132C(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  sub_2464267E0();
  v2[18] = sub_2464267D0();
  uint64_t v4 = sub_2464267A0();
  v2[19] = v4;
  v2[20] = v3;
  return MEMORY[0x270FA2498](sub_2464213C4, v4, v3);
}

uint64_t sub_2464213C4()
{
  _s5ChunkC11ReplacementCMa(0);
  uint64_t result = swift_dynamicCastClass();
  v0[21] = result;
  if (!result) {
    return sub_246426940();
  }
  uint64_t v2 = OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_rangeAfterReplacement;
  v0[22] = OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_rangeAfterReplacement;
  uint64_t v3 = *(void *)(result + v2 + 8);
  uint64_t v4 = OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range;
  v0[23] = v3;
  v0[24] = v4;
  uint64_t v5 = *(void *)(result + v4 + 8);
  v0[25] = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))(*(void *)(result
                                       + OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_replacement)
                           + **(int **)(result
                                      + OBJC_IVAR____TtCCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5ChunkP33_DD5526F81BA56B2640300E787442968911Replacement_replacement));
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[26] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_246421550;
    return v7();
  }
  return result;
}

uint64_t sub_246421550()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_246421670, v3, v2);
}

uint64_t sub_246421670(void *a1)
{
  uint64_t v3 = v1[23];
  uint64_t v2 = v1 + 23;
  uint64_t v4 = v1[21];
  uint64_t v5 = v1[17];
  uint64_t v6 = (uint64_t *)(v4 + v1[24]);
  uint64_t v7 = *(void *)(v4 + v1[22]);
  *uint64_t v6 = v7;
  v6[1] = v3;
  uint64_t v8 = *(void *)(v5 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_activePonderingEffect);
  if (v8)
  {
    uint64_t v9 = v1[25];
    uint64_t v10 = (void *)(*(void *)(v8 + *(void *)(*(void *)v8 + 104))
                   + OBJC_IVAR____TtCE14libWebKitSwiftCSo35WKIntelligenceTextEffectCoordinator5Chunk_range);
    uint64_t v11 = v10[1];
    BOOL v12 = __OFADD__(v11, v9);
    uint64_t v13 = v11 + v9;
    if (v12)
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
    if (v13 < *v2)
    {
LABEL_12:
      __break(1u);
      return MEMORY[0x270FA23F0](a1);
    }
    unint64_t v14 = (uint64_t *)(v1[21] + v1[24]);
    *uint64_t v10 = *v2;
    v10[1] = v13;
    uint64_t v16 = *v14;
    unint64_t v15 = v14 + 1;
    uint64_t v7 = v16;
  }
  else
  {
    unint64_t v15 = v1 + 23;
  }
  uint64_t v17 = *v15 - v7;
  if (__OFSUB__(*v15, v7))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v18 = v1[17];
  int64_t v19 = *(void **)(v18 + OBJC_IVAR___WKIntelligenceTextEffectCoordinator_delegate);
  v1[2] = v1;
  v1[7] = v1 + 15;
  v1[3] = sub_24642182C;
  uint64_t v20 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_24641DB88;
  v1[13] = &block_descriptor_117;
  v1[14] = v20;
  objc_msgSend(v19, sel_intelligenceTextEffectCoordinator_textPreviewsForRange_completion_, v18, v7, v17, v1 + 10);
  a1 = v1 + 2;
  return MEMORY[0x270FA23F0](a1);
}

uint64_t sub_24642182C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  return MEMORY[0x270FA2498](sub_246421934, v2, v1);
}

uint64_t sub_246421934()
{
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t _s5ChunkC11ReplacementCMa(uint64_t a1)
{
  return sub_246413C10(a1, qword_268F7C5D8);
}

uint64_t sub_2464219C4(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *((void *)v4 + 3) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_246420288(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_25;
  }
  unint64_t v15 = &v4[48 * a2 + 32];
  if (v6 != a2 || &v4[48 * v6 + 32] >= &v15[48 * v14]) {
    uint64_t result = (uint64_t)memmove(&v4[48 * v6 + 32], v15, 48 * v14);
  }
  uint64_t v16 = *((void *)v4 + 2);
  BOOL v13 = __OFADD__(v16, v8);
  uint64_t v17 = v16 - v7;
  if (!v13)
  {
    *((void *)v4 + 2) = v17;
LABEL_19:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_246421AEC(uint64_t a1)
{
  return a1;
}

uint64_t sub_246421B18()
{
  return sub_246421BD8(qword_268F7B3E8, (void (*)(uint64_t))_s5ChunkCMa);
}

uint64_t _s5ChunkCMa(uint64_t a1)
{
  return sub_246413C10(a1, (uint64_t *)&unk_268F7C5A8);
}

uint64_t sub_246421B80(uint64_t a1)
{
  uint64_t result = sub_246421BD8(&qword_268F7B418, (void (*)(uint64_t))_s5ChunkCMa);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_246421BD8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246421C20()
{
  return sub_246421BD8(&qword_268F7B018, MEMORY[0x263F07508]);
}

uint64_t sub_246421C68()
{
  return sub_246421BD8(&qword_268F7B420, (void (*)(uint64_t))_s5ChunkCMa);
}

uint64_t type metadata accessor for WKIntelligenceTextEffectCoordinator(uint64_t a1)
{
  return sub_246422284(a1, &qword_268F7C5A0);
}

uint64_t sub_246421CC4()
{
  return _s5ChunkCMa(0);
}

uint64_t sub_246421CCC()
{
  uint64_t result = sub_246426320();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_246421D64()
{
  return _s5ChunkC9PonderingCMa(0);
}

uint64_t sub_246421D6C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_246421DA4()
{
  return _s5ChunkC11ReplacementCMa(0);
}

uint64_t sub_246421DAC()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_246421E08()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246421E48()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  int64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *int64_t v5 = v1;
  v5[1] = sub_246409B64;
  uint64_t v6 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_268F7B428 + dword_268F7B428);
  return v6(v2, v4, v3);
}

uint64_t sub_246421F04()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246421F44()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_246409B64;
  int64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_268F7B448 + dword_268F7B448);
  return v5(v2, v3);
}

uint64_t sub_246421FF8()
{
  _Block_release(*(const void **)(v0 + 48));
  _Block_release(*(const void **)(v0 + 56));

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_246422040()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 48);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 64);
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *int64_t v9 = v1;
  v9[1] = sub_246409B64;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268F7B468
                                                                                           + dword_268F7B468);
  return v10(v2, v3, v4, v5, v6, v8, v7);
}

uint64_t sub_246422124()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24642215C(uint64_t a1, uint64_t a2)
{
  return sub_24641ADC0(a1, a2, *(void *)(v2 + 16));
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

uint64_t sub_24642217C()
{
  _Block_release(*(const void **)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2464221BC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_246409B64;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268F7B488 + dword_268F7B488);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_246422284(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2464222C0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4E0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_246422390()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4E0) - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_246409B64;
  return sub_24641B884(v3, v4);
}

uint64_t sub_246422468(uint64_t a1)
{
  return sub_24641FFAC(a1, *(void (**)(uint64_t (*)(), uint64_t))(v1 + 16));
}

uint64_t sub_246422470()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B4E0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_246422504()
{
  return sub_2464267B0();
}

uint64_t sub_24642256C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s27ReplacementOperationRequestVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s27ReplacementOperationRequestVwxx()
{
  return swift_release();
}

uint64_t _s27ReplacementOperationRequestVwcp(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = v4;
  swift_retain();
  return a1;
}

uint64_t _s27ReplacementOperationRequestVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_release();
  return a1;
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

uint64_t _s27ReplacementOperationRequestVwta(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t _s27ReplacementOperationRequestVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s27ReplacementOperationRequestVwst(uint64_t result, int a2, int a3)
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
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s27ReplacementOperationRequestVMa()
{
  return &_s27ReplacementOperationRequestVN;
}

void type metadata accessor for _NSRange()
{
  if (!qword_268F7B510)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268F7B510);
    }
  }
}

double WKTextExtractionItem.rectInWebView.getter()
{
  return sub_246423D40(&OBJC_IVAR___WKTextExtractionItem_rectInWebView);
}

uint64_t WKTextExtractionItem.children.getter()
{
  return swift_bridgeObjectRetain();
}

id WKTextExtractionItem.__allocating_init(with:children:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  int64_t v11 = (char *)objc_allocWithZone(v5);
  uint64_t v12 = (double *)&v11[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  double *v12 = a2;
  v12[1] = a3;
  v12[2] = a4;
  uint64_t v12[3] = a5;
  *(void *)&v11[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v14.receiver = v11;
  v14.super_class = v5;
  return objc_msgSendSuper2(&v14, sel_init);
}

id WKTextExtractionItem.init(with:children:)(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6 = (double *)&v5[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *uint64_t v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  *(void *)&v5[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t type metadata accessor for WKTextExtractionItem()
{
  return self;
}

id WKTextExtractionItem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void WKTextExtractionItem.init()()
{
}

id WKTextExtractionItem.__deallocating_deinit()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionItem);
}

unint64_t WKTextExtractionContainer.init(rawValue:)(unint64_t a1)
{
  return sub_2464240F0(a1);
}

unint64_t sub_246422A40@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2464240F0(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t WKTextExtractionContainerItem.container.getter()
{
  return *(void *)(v0 + OBJC_IVAR___WKTextExtractionContainerItem_container);
}

id WKTextExtractionContainerItem.__allocating_init(container:rectInWebView:children:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  BOOL v13 = (char *)objc_allocWithZone(v6);
  *(void *)&v13[OBJC_IVAR___WKTextExtractionContainerItem_container] = a1;
  objc_super v14 = (double *)&v13[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *objc_super v14 = a3;
  v14[1] = a4;
  v14[2] = a5;
  v14[3] = a6;
  *(void *)&v13[OBJC_IVAR___WKTextExtractionItem_children] = a2;
  v16.receiver = v13;
  v16.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v16, sel_init);
}

id WKTextExtractionContainerItem.init(container:rectInWebView:children:)(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  *(void *)&v6[OBJC_IVAR___WKTextExtractionContainerItem_container] = a1;
  uint64_t v7 = (double *)&v6[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *uint64_t v7 = a3;
  v7[1] = a4;
  v7[2] = a5;
  v7[3] = a6;
  *(void *)&v6[OBJC_IVAR___WKTextExtractionItem_children] = a2;
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v9, sel_init);
}

void WKTextExtractionContainerItem.__allocating_init(with:children:)()
{
}

void WKTextExtractionContainerItem.init(with:children:)()
{
}

id WKTextExtractionContainerItem.__deallocating_deinit()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionContainerItem);
}

uint64_t WKTextExtractionEditable.label.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WKTextExtractionEditable_label);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WKTextExtractionEditable.placeholder.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WKTextExtractionEditable_placeholder);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WKTextExtractionEditable.isSecure.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WKTextExtractionEditable_isSecure);
}

uint64_t WKTextExtractionEditable.isFocused.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WKTextExtractionEditable_isFocused);
}

id WKTextExtractionEditable.__allocating_init(label:placeholder:isSecure:isFocused:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  BOOL v13 = objc_allocWithZone(v6);
  objc_super v14 = &v13[OBJC_IVAR___WKTextExtractionEditable_label];
  *objc_super v14 = a1;
  v14[1] = a2;
  unint64_t v15 = &v13[OBJC_IVAR___WKTextExtractionEditable_placeholder];
  void *v15 = a3;
  v15[1] = a4;
  v13[OBJC_IVAR___WKTextExtractionEditable_isSecure] = a5;
  v13[OBJC_IVAR___WKTextExtractionEditable_isFocused] = a6;
  v17.receiver = v13;
  v17.super_class = v6;
  return objc_msgSendSuper2(&v17, sel_init);
}

id WKTextExtractionEditable.init(label:placeholder:isSecure:isFocused:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  uint64_t v7 = &v6[OBJC_IVAR___WKTextExtractionEditable_label];
  *uint64_t v7 = a1;
  v7[1] = a2;
  objc_super v8 = &v6[OBJC_IVAR___WKTextExtractionEditable_placeholder];
  void *v8 = a3;
  v8[1] = a4;
  v6[OBJC_IVAR___WKTextExtractionEditable_isSecure] = a5;
  v6[OBJC_IVAR___WKTextExtractionEditable_isFocused] = a6;
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for WKTextExtractionEditable();
  return objc_msgSendSuper2(&v10, sel_init);
}

void WKTextExtractionEditable.init()()
{
}

id WKTextExtractionEditable.__deallocating_deinit()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionEditable);
}

id WKTextExtractionLink.url.getter()
{
  return *(id *)(v0 + OBJC_IVAR___WKTextExtractionLink_url);
}

uint64_t WKTextExtractionLink.range.getter()
{
  return *(void *)(v0 + OBJC_IVAR___WKTextExtractionLink_range);
}

id WKTextExtractionLink.__allocating_init(url:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR___WKTextExtractionLink_url] = a1;
  objc_super v8 = &v7[OBJC_IVAR___WKTextExtractionLink_range];
  *(void *)objc_super v8 = a2;
  *((void *)v8 + 1) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id WKTextExtractionLink.init(url:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR___WKTextExtractionLink_url] = a1;
  char v4 = &v3[OBJC_IVAR___WKTextExtractionLink_range];
  *(void *)char v4 = a2;
  *((void *)v4 + 1) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for WKTextExtractionLink();
  return objc_msgSendSuper2(&v6, sel_init);
}

void WKTextExtractionLink.init()()
{
}

id WKTextExtractionLink.__deallocating_deinit()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionLink);
}

uint64_t WKTextExtractionTextItem.content.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WKTextExtractionTextItem_content);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WKTextExtractionTextItem.selectedRange.getter()
{
  return *(void *)(v0 + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
}

id sub_246423238(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  swift_bridgeObjectRetain();
  char v4 = (void *)sub_246426780();
  swift_bridgeObjectRelease();

  return v4;
}

uint64_t WKTextExtractionTextItem.links.getter()
{
  return swift_bridgeObjectRetain();
}

void *WKTextExtractionTextItem.editable.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___WKTextExtractionTextItem_editable);
  id v2 = v1;
  return v1;
}

id WKTextExtractionTextItem.__allocating_init(content:selectedRange:links:editable:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  uint64_t v23 = (char *)objc_allocWithZone(v11);
  uint64_t v24 = &v23[OBJC_IVAR___WKTextExtractionTextItem_content];
  *(void *)uint64_t v24 = a1;
  *((void *)v24 + 1) = a2;
  int64_t v25 = &v23[OBJC_IVAR___WKTextExtractionTextItem_selectedRange];
  *(void *)int64_t v25 = a3;
  *((void *)v25 + 1) = a4;
  *(void *)&v23[OBJC_IVAR___WKTextExtractionTextItem_links] = a5;
  *(void *)&v23[OBJC_IVAR___WKTextExtractionTextItem_editable] = a6;
  uint64_t v26 = (double *)&v23[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  double *v26 = a8;
  v26[1] = a9;
  v26[2] = a10;
  v26[3] = a11;
  *(void *)&v23[OBJC_IVAR___WKTextExtractionItem_children] = a7;
  v28.receiver = v23;
  v28.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v28, sel_init);
}

id WKTextExtractionTextItem.init(content:selectedRange:links:editable:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11)
{
  uint64_t v12 = &v11[OBJC_IVAR___WKTextExtractionTextItem_content];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  BOOL v13 = &v11[OBJC_IVAR___WKTextExtractionTextItem_selectedRange];
  *(void *)BOOL v13 = a3;
  *((void *)v13 + 1) = a4;
  *(void *)&v11[OBJC_IVAR___WKTextExtractionTextItem_links] = a5;
  *(void *)&v11[OBJC_IVAR___WKTextExtractionTextItem_editable] = a6;
  objc_super v14 = (double *)&v11[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *objc_super v14 = a8;
  v14[1] = a9;
  v14[2] = a10;
  v14[3] = a11;
  *(void *)&v11[OBJC_IVAR___WKTextExtractionItem_children] = a7;
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v16, sel_init);
}

void WKTextExtractionTextItem.__allocating_init(with:children:)()
{
}

void WKTextExtractionTextItem.init(with:children:)()
{
}

void sub_2464235C8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___WKTextExtractionTextItem_editable);
}

id WKTextExtractionTextItem.__deallocating_deinit()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionTextItem);
}

double WKTextExtractionScrollableItem.contentSize.getter()
{
  return *(double *)(v0 + OBJC_IVAR___WKTextExtractionScrollableItem_contentSize);
}

id WKTextExtractionScrollableItem.__allocating_init(contentSize:rectInWebView:children:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  unint64_t v15 = (char *)objc_allocWithZone(v7);
  objc_super v16 = (double *)&v15[OBJC_IVAR___WKTextExtractionScrollableItem_contentSize];
  double *v16 = a2;
  v16[1] = a3;
  objc_super v17 = (double *)&v15[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  double *v17 = a4;
  v17[1] = a5;
  v17[2] = a6;
  v17[3] = a7;
  *(void *)&v15[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v19.receiver = v15;
  v19.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v19, sel_init);
}

id WKTextExtractionScrollableItem.init(contentSize:rectInWebView:children:)(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  objc_super v8 = (double *)&v7[OBJC_IVAR___WKTextExtractionScrollableItem_contentSize];
  double *v8 = a2;
  v8[1] = a3;
  objc_super v9 = (double *)&v7[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  *objc_super v9 = a4;
  v9[1] = a5;
  long long v9[2] = a6;
  v9[3] = a7;
  *(void *)&v7[OBJC_IVAR___WKTextExtractionItem_children] = a1;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v11, sel_init);
}

void WKTextExtractionScrollableItem.__allocating_init(with:children:)()
{
}

void WKTextExtractionScrollableItem.init(with:children:)()
{
}

id WKTextExtractionScrollableItem.__deallocating_deinit()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionScrollableItem);
}

uint64_t WKTextExtractionImageItem.name.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WKTextExtractionImageItem_name);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_24642392C()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_246426730();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t WKTextExtractionImageItem.altText.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WKTextExtractionImageItem_altText);
  swift_bridgeObjectRetain();
  return v1;
}

id WKTextExtractionImageItem.__allocating_init(name:altText:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  objc_super v19 = (char *)objc_allocWithZone(v9);
  uint64_t v20 = &v19[OBJC_IVAR___WKTextExtractionImageItem_name];
  *(void *)uint64_t v20 = a1;
  *((void *)v20 + 1) = a2;
  int64_t v21 = &v19[OBJC_IVAR___WKTextExtractionImageItem_altText];
  *(void *)int64_t v21 = a3;
  *((void *)v21 + 1) = a4;
  uint64_t v22 = (double *)&v19[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  double *v22 = a6;
  v22[1] = a7;
  void v22[2] = a8;
  v22[3] = a9;
  *(void *)&v19[OBJC_IVAR___WKTextExtractionItem_children] = a5;
  v24.receiver = v19;
  v24.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v24, sel_init);
}

id WKTextExtractionImageItem.init(name:altText:rectInWebView:children:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  objc_super v10 = &v9[OBJC_IVAR___WKTextExtractionImageItem_name];
  *(void *)objc_super v10 = a1;
  *((void *)v10 + 1) = a2;
  objc_super v11 = &v9[OBJC_IVAR___WKTextExtractionImageItem_altText];
  *(void *)objc_super v11 = a3;
  *((void *)v11 + 1) = a4;
  uint64_t v12 = (double *)&v9[OBJC_IVAR___WKTextExtractionItem_rectInWebView];
  double *v12 = a6;
  v12[1] = a7;
  v12[2] = a8;
  uint64_t v12[3] = a9;
  *(void *)&v9[OBJC_IVAR___WKTextExtractionItem_children] = a5;
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for WKTextExtractionItem();
  return objc_msgSendSuper2(&v14, sel_init);
}

void WKTextExtractionImageItem.__allocating_init(with:children:)()
{
}

void sub_246423C10()
{
}

void WKTextExtractionImageItem.init(with:children:)()
{
}

uint64_t sub_246423C5C()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id WKTextExtractionImageItem.__deallocating_deinit()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionImageItem);
}

uint64_t sub_246423CD0()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

double sub_246423D2C(uint64_t a1, uint64_t a2, void *a3)
{
  return *(double *)(a1 + *a3);
}

double sub_246423D40(void *a1)
{
  return *(double *)(v1 + *a1);
}

id sub_246423D54(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  BOOL v13 = (char *)objc_allocWithZone(v6);
  objc_super v14 = (uint64_t *)&v13[OBJC_IVAR___WKTextExtractionRequest_completionHandler];
  *objc_super v14 = 0;
  v14[1] = 0;
  unint64_t v15 = (double *)&v13[OBJC_IVAR___WKTextExtractionRequest_rectInWebView];
  double *v15 = a3;
  v15[1] = a4;
  v15[2] = a5;
  v15[3] = a6;
  uint64_t v16 = *v14;
  *objc_super v14 = a1;
  v14[1] = a2;
  swift_retain();
  sub_246407474(v16);
  v19.receiver = v13;
  v19.super_class = v6;
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  swift_release();
  return v17;
}

uint64_t sub_246423F0C(uint64_t result)
{
  id v2 = (uint64_t *)(v1 + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  long long v3 = *(void (**)(uint64_t))(v1 + OBJC_IVAR___WKTextExtractionRequest_completionHandler);
  if (v3)
  {
    uint64_t v4 = result;
    swift_retain();
    v3(v4);
    uint64_t v5 = *v2;
    *id v2 = 0;
    v2[1] = 0;
    sub_246407474(v5);
    return sub_246407474((uint64_t)v3);
  }
  return result;
}

id sub_24642408C()
{
  return sub_2464240A4(type metadata accessor for WKTextExtractionRequest);
}

id sub_2464240A4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2464240F0(unint64_t result)
{
  if (result > 8) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for WKTextExtractionContainerItem()
{
  return self;
}

uint64_t type metadata accessor for WKTextExtractionEditable()
{
  return self;
}

uint64_t type metadata accessor for WKTextExtractionLink()
{
  return self;
}

uint64_t type metadata accessor for WKTextExtractionTextItem()
{
  return self;
}

uint64_t type metadata accessor for WKTextExtractionScrollableItem()
{
  return self;
}

uint64_t type metadata accessor for WKTextExtractionImageItem()
{
  return self;
}

uint64_t type metadata accessor for WKTextExtractionRequest()
{
  return self;
}

unint64_t sub_246424200()
{
  unint64_t result = qword_268F7B5A8;
  if (!qword_268F7B5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F7B5A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for WKTextExtractionContainer()
{
  return &type metadata for WKTextExtractionContainer;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_246424284(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2464242A4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_2464242E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_246424330(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_246424388@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5D8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5E0);
  MEMORY[0x270FA5388](v6 - 8);
  objc_super v8 = (char *)v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5E8);
  MEMORY[0x270FA5388](v9 - 8);
  v84 = (char *)v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7AF68);
  MEMORY[0x270FA5388](v11 - 8);
  v89 = (char *)v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5F0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v79 - v17;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5F8);
  uint64_t v94 = *(void *)(v97 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v97);
  uint64_t v88 = (uint64_t)v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v90 = (uint64_t)v79 - v22;
  MEMORY[0x270FA5388](v21);
  objc_super v24 = (char *)v79 - v23;
  uint64_t v25 = sub_246426260();
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v99 = sub_246426220();
  uint64_t v26 = *(void *)(v99 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v99);
  v83 = (char *)v79 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v96 = (char *)v79 - v30;
  MEMORY[0x270FA5388](v29);
  unint64_t v32 = (char *)v79 - v31;
  type metadata accessor for WKTextExtractionTextItem();
  uint64_t v33 = swift_dynamicCastClass();
  if (v33)
  {
    v82 = v8;
    uint64_t v34 = v33;
    id v35 = a1;
    swift_bridgeObjectRetain();
    sub_246426250();
    sub_246426230();
    uint64_t v85 = v34;
    uint64_t v36 = *(void *)(v34 + OBJC_IVAR___WKTextExtractionTextItem_selectedRange);
    uint64_t v37 = sub_246426210();
    id v80 = v35;
    if (v36 != v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v96, v32, v99);
      sub_2464261B0(&qword_268F7B600, MEMORY[0x263F06828]);
      sub_246426820();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v94 + 48))(v18, 1, v97) == 1)
      {
        uint64_t v38 = &qword_268F7B5F0;
        uint64_t v39 = (uint64_t)v18;
      }
      else
      {
        sub_246425FB8((uint64_t)v18, (uint64_t)v24);
        uint64_t v45 = v90;
        sub_246426020((uint64_t)v24, v90);
        uint64_t KeyPath = swift_getKeyPath();
        v79[-2] = MEMORY[0x270FA5388](KeyPath);
        swift_getKeyPath();
        char v100 = 1;
        sub_24642610C();
        int64_t v47 = (void (*)(unsigned char *, void))sub_246426240();
        sub_2464261B0(&qword_268F7B618, MEMORY[0x263F819E0]);
        sub_246426270();
        v47(v101, 0);
        sub_24641269C(v45, &qword_268F7B5F8);
        uint64_t v39 = (uint64_t)v24;
        uint64_t v38 = &qword_268F7B5F8;
      }
      sub_24641269C(v39, v38);
    }
    unint64_t v91 = *(void *)(v85 + OBJC_IVAR___WKTextExtractionTextItem_links);
    if (v91 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_246426950();
      uint64_t v48 = result;
    }
    else
    {
      uint64_t v48 = *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
    }
    v98 = v32;
    uint64_t v81 = v26;
    if (v48)
    {
      uint64_t v87 = v48;
      if (v48 < 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v49 = 0;
      unint64_t v50 = v91;
      v93 = (unsigned int (**)(char *, uint64_t, uint64_t))(v94 + 48);
      uint64_t v94 = v26 + 16;
      unint64_t v95 = v91 & 0xC000000000000001;
      v79[1] = (v26 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v51 = v87;
      uint64_t v52 = v98;
      do
      {
        if (v95) {
          id v55 = (id)MEMORY[0x24C52C070](v49, v50);
        }
        else {
          id v55 = *(id *)(v50 + 8 * v49 + 32);
        }
        uint64_t v56 = v55;
        v92 = *(void (**)(char *, char *, uint64_t))v94;
        v92(v96, v52, v99);
        sub_2464261B0(&qword_268F7B600, MEMORY[0x263F06828]);
        sub_246426820();
        if ((*v93)(v16, 1, v97) == 1)
        {

          uint64_t v53 = (uint64_t)v16;
          uint64_t v54 = &qword_268F7B5F0;
        }
        else
        {
          uint64_t v57 = v88;
          sub_246425FB8((uint64_t)v16, v88);
          uint64_t v58 = v90;
          sub_246426020(v57, v90);
          uint64_t v59 = swift_getKeyPath();
          v79[-2] = MEMORY[0x270FA5388](v59);
          swift_getKeyPath();
          int64_t v60 = v16;
          v61 = v89;
          sub_2464262B0();
          uint64_t v62 = sub_2464262C0();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v61, 0, 1, v62);
          sub_24642610C();
          v63 = (void (*)(unsigned char *, void))sub_246426240();
          sub_24642608C();
          uint64_t v16 = v60;
          unint64_t v50 = v91;
          sub_246426270();
          v63(v101, 0);

          uint64_t v64 = v58;
          uint64_t v51 = v87;
          sub_24641269C(v64, &qword_268F7B5F8);
          uint64_t v53 = v57;
          uint64_t v54 = &qword_268F7B5F8;
        }
        sub_24641269C(v53, v54);
        ++v49;
      }
      while (v51 != v49);
      swift_bridgeObjectRelease();
      v92(v83, v98, v99);
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v83, v32, v99);
    }
    v65 = v84;
    v66 = *(void **)(v85 + OBJC_IVAR___WKTextExtractionTextItem_editable);
    if (v66)
    {
      id v67 = v66;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_246426480();
      uint64_t v68 = sub_246426490();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v65, 0, 1, v68);
    }
    else
    {
      uint64_t v69 = sub_246426490();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v65, 1, 1, v69);
    }
    uint64_t v70 = sub_2464264E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v82, 1, 1, v70);
    uint64_t v71 = v86;
    sub_246426450();

    (*(void (**)(char *, uint64_t))(v81 + 8))(v98, v99);
    uint64_t v72 = *MEMORY[0x263F81A40];
    uint64_t v73 = sub_2464264B0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 104))(v71, v72, v73);
  }
  else
  {
    type metadata accessor for WKTextExtractionImageItem();
    if (swift_dynamicCastClass())
    {
      uint64_t v40 = v86;
      uint64_t v41 = sub_246426420();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v5, 1, 1, v41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2464264A0();
      uint64_t v42 = *MEMORY[0x263F81A48];
      uint64_t v43 = sub_2464264B0();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v40, v42, v43);
    }
    else
    {
      uint64_t v74 = *MEMORY[0x263F81A30];
      uint64_t v75 = sub_2464264B0();
      v76 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 104);
      uint64_t v77 = v75;
      uint64_t v78 = v86;
      return v76(v78, v74, v77);
    }
  }
}

uint64_t sub_246425010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2464250CC(a1, a2, a3, &qword_268F7B620);
}

uint64_t sub_24642501C(uint64_t a1, uint64_t a2)
{
  return sub_246425130(a1, a2, &qword_268F7B620);
}

uint64_t sub_246425028()
{
  sub_2464261B0(&qword_268F7B618, MEMORY[0x263F819E0]);

  return sub_246426280();
}

uint64_t sub_24642509C()
{
  return sub_246426470();
}

uint64_t sub_2464250C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2464250CC(a1, a2, a3, &qword_268F7B628);
}

uint64_t sub_2464250CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_246426720() & 1;
}

uint64_t sub_246425124(uint64_t a1, uint64_t a2)
{
  return sub_246425130(a1, a2, &qword_268F7B628);
}

uint64_t sub_246425130(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_246426710();
}

void sub_246425174()
{
}

void sub_24642519C()
{
}

size_t sub_2464251B8@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = sub_2464264C0();
  uint64_t v4 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2464264B0();
  MEMORY[0x270FA5388](v7 - 8);
  sub_246424388(a1, (uint64_t)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_246426430();
  unint64_t v10 = *(void *)&a1[OBJC_IVAR___WKTextExtractionItem_children];
  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return sub_246426440();
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_246426950();
  if (!v11) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v21 = v9;
  size_t result = sub_246425DC4(0, v11 & ~(v11 >> 63), 0);
  if ((v11 & 0x8000000000000000) == 0)
  {
    v19[1] = a2;
    uint64_t v13 = 0;
    uint64_t v14 = v21;
    do
    {
      if ((v10 & 0xC000000000000001) != 0) {
        id v15 = (id)MEMORY[0x24C52C070](v13, v10);
      }
      else {
        id v15 = *(id *)(v10 + 8 * v13 + 32);
      }
      uint64_t v16 = v15;
      sub_2464251B8();

      uint64_t v21 = v14;
      unint64_t v18 = *(void *)(v14 + 16);
      unint64_t v17 = *(void *)(v14 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_246425DC4(v17 > 1, v18 + 1, 1);
        uint64_t v14 = v21;
      }
      ++v13;
      *(void *)(v14 + 16) = v18 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v14+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v18, v6, v20);
    }
    while (v11 != v13);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_246425474()
{
  sub_2464254A8();

  return swift_getObjCClassFromMetadata();
}

unint64_t WKWebView._intelligenceBaseClass.getter()
{
  return sub_2464254A8();
}

unint64_t sub_2464254A8()
{
  unint64_t result = qword_268F7B5C8;
  if (!qword_268F7B5C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F7B5C8);
  }
  return result;
}

uint64_t WKWebView._intelligenceCollectContent(in:collector:)()
{
  uint64_t v0 = sub_2464264B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246426410();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  sub_2464264D0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F81A58], v0);
  sub_246426400();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_246425668(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_2464264B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  id v10 = a1;
  sub_246426410();
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  sub_2464264D0();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F81A58], v5);
  sub_246426400();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
}

uint64_t WKWebView._intelligenceCollectRemoteContent(in:remoteContextWrapper:)(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  sub_246426530();
  uint64_t v10 = sub_246426520();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v5;
  *(double *)(v11 + 24) = a1;
  *(double *)(v11 + 32) = a2;
  *(double *)(v11 + 40) = a3;
  *(double *)(v11 + 48) = a4;
  *(void *)(v11 + 56) = v10;
  id v12 = v5;
  swift_retain();
  sub_246426510();
  swift_release();

  return swift_release();
}

uint64_t sub_246425890(uint64_t result, void *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    *(void *)(v14 + 24) = a3;
    void v16[4] = sub_246425DA4;
    v16[5] = v14;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1107296256;
    v16[2] = sub_246415C84;
    v16[3] = &block_descriptor_2;
    id v15 = _Block_copy(v16);
    swift_retain_n();
    swift_retain();
    swift_release();
    objc_msgSend(a2, sel__requestTextExtractionIn_completionHandler_, v15, a4, a5, a6, a7);
    _Block_release(v15);
    return swift_release();
  }
  return result;
}

uint64_t sub_2464259D0(void *a1)
{
  uint64_t v2 = sub_2464264C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v6 = a1;
    sub_2464251B8(v6, (uint64_t)v5);
    sub_2464264F0();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_246426500();
}

uint64_t sub_246425AC8(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  sub_246426530();
  id v13 = a7;
  id v14 = a1;
  uint64_t v15 = sub_246426520();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(double *)(v16 + 24) = a2;
  *(double *)(v16 + 32) = a3;
  *(double *)(v16 + 40) = a4;
  *(double *)(v16 + 48) = a5;
  *(void *)(v16 + 56) = v15;
  id v17 = v14;
  swift_retain();
  sub_246426510();

  swift_release();

  return swift_release();
}

uint64_t sub_246425BB8(void *a1, int a2, void *aBlock, double a4, double a5, double a6, double a7)
{
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  type metadata accessor for WKTextExtractionRequest();
  id v14 = a1;
  swift_retain();
  id v15 = sub_246423D54((uint64_t)sub_24640787C, v13, a4, a5, a6, a7);
  uint64_t v16 = sub_246426330();
  id v17 = v14;
  objc_msgSend(v17, sel_performSelector_withObject_, v16, v15);

  return swift_release();
}

uint64_t sub_246425CD4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t objectdestroyTm_0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_246425D50(uint64_t a1)
{
  return sub_246425890(a1, *(void **)(v1 + 16), *(void *)(v1 + 56), *(double *)(v1 + 24), *(double *)(v1 + 32), *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t sub_246425D64()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246425DA4(void *a1)
{
  return sub_2464259D0(a1);
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

size_t sub_246425DC4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_246425DE4(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_246425DE4(size_t result, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5D0);
  uint64_t v10 = *(void *)(sub_2464264C0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
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
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_2464264C0() - 8);
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

uint64_t sub_246425FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246426020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F7B5F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24642608C()
{
  unint64_t result = qword_268F7B608;
  if (!qword_268F7B608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F7B608);
  }
  return result;
}

uint64_t sub_2464260E0()
{
  return 8;
}

uint64_t sub_2464260EC()
{
  return swift_release();
}

uint64_t sub_2464260F4(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_246426100(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_24642610C()
{
  unint64_t result = qword_268F7B610;
  if (!qword_268F7B610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F7B5F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F7B610);
  }
  return result;
}

uint64_t sub_246426168()
{
  return sub_2464261B0(&qword_268F7B618, MEMORY[0x263F819E0]);
}

uint64_t sub_2464261B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2464261F8()
{
  return 8;
}

uint64_t sub_246426210()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_246426220()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_246426230()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_246426240()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_246426250()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_246426260()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_246426270()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_246426280()
{
  return MEMORY[0x270F80B30]();
}

uint64_t sub_246426290()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2464262A0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2464262B0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2464262C0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2464262D0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2464262E0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2464262F0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_246426300()
{
  return MEMORY[0x270EF0CC8]();
}

uint64_t sub_246426310()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_246426320()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_246426330()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_246426350()
{
  return MEMORY[0x270EF5998]();
}

uint64_t sub_246426360()
{
  return MEMORY[0x270EF59A0]();
}

uint64_t sub_246426370()
{
  return MEMORY[0x270EF2F80]();
}

uint64_t sub_246426380()
{
  return MEMORY[0x270EF2FA8]();
}

uint64_t sub_246426390()
{
  return MEMORY[0x270EF2FB0]();
}

uint64_t sub_2464263A0()
{
  return MEMORY[0x270EF2FB8]();
}

uint64_t sub_2464263B0()
{
  return MEMORY[0x270EF2FC0]();
}

uint64_t sub_2464263C0()
{
  return MEMORY[0x270EF2FC8]();
}

uint64_t sub_2464263D0()
{
  return MEMORY[0x270EF3000]();
}

uint64_t sub_2464263E0()
{
  return MEMORY[0x270EF3020]();
}

uint64_t sub_2464263F0()
{
  return MEMORY[0x270EF3028]();
}

uint64_t sub_246426400()
{
  return MEMORY[0x270F80B60]();
}

uint64_t sub_246426410()
{
  return MEMORY[0x270F80B68]();
}

uint64_t sub_246426420()
{
  return MEMORY[0x270F80C98]();
}

uint64_t sub_246426430()
{
  return MEMORY[0x270F80D88]();
}

uint64_t sub_246426440()
{
  return MEMORY[0x270F80DC0]();
}

uint64_t sub_246426450()
{
  return MEMORY[0x270F80E98]();
}

uint64_t sub_246426460()
{
  return MEMORY[0x270F80EA8]();
}

uint64_t sub_246426470()
{
  return MEMORY[0x270F80EB0]();
}

uint64_t sub_246426480()
{
  return MEMORY[0x270F80EC8]();
}

uint64_t sub_246426490()
{
  return MEMORY[0x270F80ED0]();
}

uint64_t sub_2464264A0()
{
  return MEMORY[0x270F80EE0]();
}

uint64_t sub_2464264B0()
{
  return MEMORY[0x270F80FA8]();
}

uint64_t sub_2464264C0()
{
  return MEMORY[0x270F81038]();
}

uint64_t sub_2464264D0()
{
  return MEMORY[0x270F811B0]();
}

uint64_t sub_2464264E0()
{
  return MEMORY[0x270F811F8]();
}

uint64_t sub_2464264F0()
{
  return MEMORY[0x270F81418]();
}

uint64_t sub_246426500()
{
  return MEMORY[0x270F81450]();
}

uint64_t sub_246426510()
{
  return MEMORY[0x270F81458]();
}

uint64_t sub_246426520()
{
  return MEMORY[0x270F81460]();
}

uint64_t sub_246426530()
{
  return MEMORY[0x270F81468]();
}

uint64_t sub_246426540()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_246426550()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_246426560()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_246426570()
{
  return MEMORY[0x270F81A80]();
}

uint64_t sub_246426580()
{
  return MEMORY[0x270F81A88]();
}

uint64_t sub_2464265A0()
{
  return MEMORY[0x270F81A98]();
}

uint64_t sub_2464265B0()
{
  return MEMORY[0x270F81AA0]();
}

uint64_t sub_2464265C0()
{
  return MEMORY[0x270F81AA8]();
}

uint64_t sub_2464265D0()
{
  return MEMORY[0x270F81AB0]();
}

uint64_t sub_2464265E0()
{
  return MEMORY[0x270F81AB8]();
}

uint64_t sub_2464265F0()
{
  return MEMORY[0x270F81AC0]();
}

uint64_t sub_246426600()
{
  return MEMORY[0x270F81AC8]();
}

uint64_t sub_246426610()
{
  return MEMORY[0x270F81AD0]();
}

uint64_t sub_246426620()
{
  return MEMORY[0x270F81AD8]();
}

uint64_t sub_246426630()
{
  return MEMORY[0x270F81AE0]();
}

uint64_t sub_246426640()
{
  return MEMORY[0x270F81AE8]();
}

uint64_t sub_246426650()
{
  return MEMORY[0x270F81AF0]();
}

uint64_t sub_246426660()
{
  return MEMORY[0x270F82078]();
}

uint64_t sub_246426670()
{
  return MEMORY[0x270F82080]();
}

uint64_t sub_246426680()
{
  return MEMORY[0x270F82088]();
}

uint64_t sub_246426690()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_2464266A0()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_2464266B0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2464266C0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2464266D0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2464266E0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2464266F0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_246426700()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_246426710()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_246426720()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_246426730()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246426740()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_246426750()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_246426760()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_246426770()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_246426780()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_246426790()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2464267A0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2464267B0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2464267D0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2464267E0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2464267F0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_246426800()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_246426810()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_246426820()
{
  return MEMORY[0x270EF1D30]();
}

uint64_t sub_246426830()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_246426840()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_246426850()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_246426860()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_246426870()
{
  return MEMORY[0x270EF3098]();
}

uint64_t sub_246426880()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_246426890()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2464268A0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2464268B0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2464268C0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2464268D0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2464268E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2464268F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_246426900()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_246426910()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_246426920()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_246426930()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_246426940()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_246426950()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_246426960()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_246426970()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_246426980()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_246426990()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2464269A0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2464269C0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2464269D0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2464269E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2464269F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_246426A00()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_246426A10()
{
  return MEMORY[0x270FA0128]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
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