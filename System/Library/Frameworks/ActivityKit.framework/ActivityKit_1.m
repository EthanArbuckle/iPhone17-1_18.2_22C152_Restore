uint64_t sub_242FC38C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  if (qword_268D5CA88 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  sub_242FDBD70();
  result = sub_242FDC360();
  if (!v1) {
    return v3;
  }
  return result;
}

id ActivityQoSObservationClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ActivityQoSObservationClient.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityQoSObservationClient();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ActivityQoSObservationClient.__deallocating_deinit(uint64_t a1)
{
  return sub_242FC53F8(a1, type metadata accessor for ActivityQoSObservationClient);
}

id sub_242FC3A78()
{
  id result = objc_msgSend(objc_allocWithZone((Class)_s11ActivityKit9SingletonCMa_3()), sel_init);
  qword_268D5E7E8 = (uint64_t)result;
  return result;
}

uint64_t sub_242FC3B08()
{
  uint64_t v21 = sub_242FDC340();
  uint64_t v1 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_242FDC320();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_242FDBFA0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v20 = OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue;
  v19[0] = sub_242F34A14(0, (unint64_t *)&qword_26B0B8880);
  v6 = v0;
  sub_242FDBF70();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_242F40410();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0B88B0);
  sub_242F34F68((unint64_t *)&qword_26B0B8A60, (uint64_t *)&unk_26B0B88B0);
  sub_242FDC470();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v21);
  *(void *)(v19[1] + v20) = sub_242FDC380();
  uint64_t v7 = OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection;
  *(void *)&v6[OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection] = 0;
  *(_DWORD *)&v6[OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_serverStartupToken] = -1;
  uint64_t v8 = OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__qosPublisher;
  uint64_t v9 = MEMORY[0x263F8EE78];
  aBlock[0] = sub_242FB200C(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E830);
  swift_allocObject();
  *(void *)&v6[v8] = sub_242FDBE40();
  *(void *)&v6[OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__queue_qos] = MEMORY[0x263F8EE80];
  *(void *)&v6[OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__queue_predicates] = v9;
  v10 = *(void **)&v6[v7];
  *(void *)&v6[v7] = 0;

  v11 = (objc_class *)_s11ActivityKit9SingletonCMa_3();
  v23.receiver = v6;
  v23.super_class = v11;
  v12 = (char *)objc_msgSendSuper2(&v23, sel_init);
  v13 = *(NSObject **)&v12[OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_242FC6C10;
  *(void *)(v15 + 24) = v14;
  aBlock[4] = sub_242F34A0C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_242F555E4;
  aBlock[3] = &block_descriptor_56_1;
  v16 = _Block_copy(aBlock);
  v17 = v12;
  swift_retain();
  swift_release();
  dispatch_sync(v13, v16);

  _Block_release(v16);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v13 & 1) == 0) {
    return (uint64_t)v17;
  }
  __break(1u);
  return result;
}

void sub_242FC3F5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_242FDBFD0();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  v6 = (void *)((char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue];
  void *v6 = v7;
  (*(void (**)(void *, void, uint64_t, double))(v3 + 104))(v6, *MEMORY[0x263F8F0E0], v2, v4);
  id v8 = v7;
  LOBYTE(v7) = sub_242FDBFF0();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v6, v2);
  if ((v7 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v9 = OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection;
  if (!*(void *)&v1[OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection])
  {
    sub_242F34A14(0, &qword_26B0B88C0);
    sub_242FC6B44();
    v10 = (void *)sub_242FDC3E0();
    if (v10)
    {
      v11 = *(void **)&v1[v9];
      *(void *)&v1[v9] = v10;
      id v12 = v10;

      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = v1;
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = sub_242FC6BD0;
      *(void *)(v14 + 24) = v13;
      aBlock[4] = sub_242FC6BE8;
      aBlock[5] = v14;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_242FC2DF4;
      aBlock[3] = &block_descriptor_38_3;
      uint64_t v15 = _Block_copy(aBlock);
      v1;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_configureConnection_, v15);
      _Block_release(v15);
      LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((v15 & 1) == 0)
      {
        sub_242FC47B0();
        swift_release();

        return;
      }
LABEL_8:
      __break(1u);
    }
  }
}

void sub_242FC4204(void *a1, uint64_t a2)
{
  double v4 = (void *)sub_242FDC0C0();
  id v5 = objc_msgSend(self, sel_interfaceWithIdentifier_, v4);

  v6 = self;
  id v7 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_26F8818C8);
  objc_msgSend(v5, sel_setClient_, v7);

  id v8 = objc_msgSend(v6, sel_protocolForProtocol_, &unk_26F8822E8);
  objc_msgSend(v5, sel_setServer_, v8);

  id v9 = objc_msgSend(self, sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v9);

  objc_msgSend(a1, sel_setInterface_, v5);
  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  objc_msgSend(a1, sel_setTargetQueue_, *(void *)(a2 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue));
  v17 = sub_242FC44FC;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_242FC2D64;
  v16 = &block_descriptor_41_3;
  v10 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setActivationHandler_, v10);
  _Block_release(v10);
  v17 = sub_242FC4508;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_242FC2D64;
  v16 = &block_descriptor_44_2;
  v11 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setInterruptionHandler_, v11);
  _Block_release(v11);
  v17 = sub_242FC4514;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  uint64_t v15 = sub_242FC2D64;
  v16 = &block_descriptor_47_1;
  id v12 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setInvalidationHandler_, v12);
  _Block_release(v12);
}

void sub_242FC44FC(uint64_t a1)
{
}

void sub_242FC4508(uint64_t a1)
{
}

void sub_242FC4514(uint64_t a1)
{
}

void sub_242FC4520(uint64_t a1, const char *a2)
{
  if (qword_268D5CA80 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_242FDBD20();
  __swift_project_value_buffer(v3, (uint64_t)qword_268D5E7D0);
  oslog = sub_242FDBD00();
  os_log_type_t v4 = sub_242FDC2D0();
  if (os_log_type_enabled(oslog, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_242F21000, oslog, v4, a2, v5, 2u);
    MEMORY[0x245671D00](v5, -1, -1);
  }
}

void sub_242FC4610()
{
  uint64_t v1 = sub_242FDBFD0();
  uint64_t v2 = *(void *)(v1 - 8);
  double v3 = MEMORY[0x270FA5388](v1);
  id v5 = (void *)((char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue);
  *id v5 = v6;
  (*(void (**)(void *, void, uint64_t, double))(v2 + 104))(v5, *MEMORY[0x263F8F0E0], v1, v3);
  id v7 = v6;
  LOBYTE(v6) = sub_242FDBFF0();
  (*(void (**)(void *, uint64_t))(v2 + 8))(v5, v1);
  if (v6)
  {
    sub_242FC3F5C();
    id v8 = *(void **)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection);
    if (v8)
    {
      id v9 = v8;
      if (objc_msgSend(v9, sel_remoteTarget))
      {
        sub_242FDC460();

        swift_unknownObjectRelease();
        sub_242F34DDC((uint64_t)v10, &qword_26B0B87A8);
      }
      else
      {
        memset(v10, 0, sizeof(v10));
        sub_242F34DDC((uint64_t)v10, &qword_26B0B87A8);
        objc_msgSend(v9, sel_activate);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_242FC47B0()
{
  sub_242FDBC90();
  uint64_t v1 = *(NSObject **)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10[4] = sub_242FC6B3C;
  v10[5] = v2;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  _OWORD v10[2] = sub_242FC2E48;
  v10[3] = &block_descriptor_29_3;
  double v3 = _Block_copy(v10);
  swift_release();
  uint64_t v4 = sub_242FDC0F0();
  swift_bridgeObjectRelease();
  id v5 = (int *)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_serverStartupToken);
  swift_beginAccess();
  LODWORD(v1) = notify_register_dispatch((const char *)(v4 + 32), v5, v1, v3);
  swift_endAccess();
  _Block_release(v3);
  swift_release();
  if (v1)
  {
    if (qword_268D5CA80 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_242FDBD20();
    __swift_project_value_buffer(v6, (uint64_t)qword_268D5E7D0);
    id v7 = sub_242FDBD00();
    os_log_type_t v8 = sub_242FDC2E0();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_242F21000, v7, v8, "Could not register for daemon startup notifications", v9, 2u);
      MEMORY[0x245671D00](v9, -1, -1);
    }
  }
}

void sub_242FC49B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x245671DD0](v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    sub_242FC50D0();
  }
}

uint64_t sub_242FC4A04()
{
  uint64_t v1 = sub_242FDBFD0();
  Class isa = v1[-1].isa;
  double v3 = MEMORY[0x270FA5388](v1);
  id v5 = (void *)((char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue);
  *id v5 = v6;
  (*((void (**)(void *, void, NSObject *, double))isa + 13))(v5, *MEMORY[0x263F8F0E0], v1, v3);
  id v7 = v6;
  LOBYTE(v6) = sub_242FDBFF0();
  (*((void (**)(void *, NSObject *))isa + 1))(v5, v1);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_15;
  }
  sub_242FC4610();
  os_log_type_t v8 = *(void **)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_connection);
  if (!v8)
  {
    if (qword_268D5CA80 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_242FDBD20();
    __swift_project_value_buffer(v9, (uint64_t)qword_268D5E7D0);
    uint64_t v1 = sub_242FDBD00();
    os_log_type_t v10 = sub_242FDC2F0();
    if (os_log_type_enabled(v1, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_242F21000, v1, v10, "ActivityQoSObservationClient: Failed to establish a connection", v11, 2u);
      MEMORY[0x245671D00](v11, -1, -1);
    }
    goto LABEL_18;
  }
  uint64_t v1 = v8;
  if ([v1 remoteTarget])
  {
    sub_242FDC460();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_242F402C4((uint64_t)v18, (uint64_t)v19);
  if (v20)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E820);
    if (swift_dynamicCast())
    {

      return v17[1];
    }
  }
  else
  {
    sub_242F34DDC((uint64_t)v19, &qword_26B0B87A8);
  }
  if (qword_268D5CA80 != -1) {
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v13 = sub_242FDBD20();
  __swift_project_value_buffer(v13, (uint64_t)qword_268D5E7D0);
  uint64_t v14 = sub_242FDBD00();
  os_log_type_t v15 = sub_242FDC2F0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_242F21000, v14, v15, "ActivityQoSObservationClient: Failed to cast connection to server interface protocol", v16, 2u);
    MEMORY[0x245671D00](v16, -1, -1);
  }

LABEL_18:
  return 0;
}

uint64_t sub_242FC4D3C(void **a1)
{
  uint64_t v2 = v1;
  v37[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_242FDBFD0();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v8 = (id *)((char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *a1;
  os_log_type_t v10 = *(void **)(v2 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue);
  *os_log_type_t v8 = v10;
  (*(void (**)(void *, void, uint64_t, double))(v5 + 104))(v8, *MEMORY[0x263F8F0E0], v4, v6);
  id v11 = v10;
  LOBYTE(v10) = sub_242FDBFF0();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v8, v4);
  if ((v10 & 1) == 0) {
    __break(1u);
  }
  id v12 = (uint64_t *)(v2 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__queue_predicates);
  swift_beginAccess();
  uint64_t v13 = *v12;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_242FC30B4(v9, v13);
  char v16 = v15;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
    swift_beginAccess();
    sub_242FC32E8(v14, (uint64_t (*)(uint64_t))sub_242FC611C, v37);
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t result = sub_242FC4A04();
    if (result)
    {
      uint64_t v18 = (void *)result;
      uint64_t v19 = *v12;
      id v20 = (id)MEMORY[0x263F8EE78];
      v36[0] = (id)MEMORY[0x263F8EE78];
      uint64_t v21 = *(void *)(v19 + 16);
      if (v21)
      {
        swift_bridgeObjectRetain();
        uint64_t v22 = 0;
        while (*(void *)(v19 + 8 * v22 + 32))
        {
          ++v22;
          uint64_t v23 = swift_bridgeObjectRetain();
          sub_242FC33D0(v23);
          if (v21 == v22)
          {
            swift_bridgeObjectRelease();
            id v20 = v36[0];
            goto LABEL_10;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v20 = 0;
      }
LABEL_10:
      v36[0] = v20;
      sub_242FDBB60();
      swift_allocObject();
      sub_242FDBB50();
      sub_242FAA97C();
      uint64_t v24 = sub_242FDBB40();
      unint64_t v26 = v25;
      v27 = (void *)sub_242FDBBD0();
      sub_242F26068(v24, v26);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v28 = sub_242FDBBF0();
      unint64_t v30 = v29;

      v31 = (void *)sub_242FDBBD0();
      v36[0] = 0;
      LOBYTE(v24) = objc_msgSend(v18, sel_subscribeToActivityQoSMatchingPredicate_error_, v31, v36);

      if (v24)
      {
        id v32 = v36[0];
        sub_242F26068(v28, v30);
      }
      else
      {
        id v33 = v36[0];
        v34 = (void *)sub_242FDBB80();

        swift_willThrow();
        sub_242F26068(v28, v30);
      }
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_242FC50D0()
{
  v29[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_242FDBFD0();
  uint64_t v2 = *(void *)(v1 - 8);
  double v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (id *)((char *)&v29[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v6 = *(void **)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t, double))(v2 + 104))(v5, *MEMORY[0x263F8F0E0], v1, v3);
  id v7 = v6;
  LOBYTE(v6) = sub_242FDBFF0();
  uint64_t v8 = (*(uint64_t (**)(void *, uint64_t))(v2 + 8))(v5, v1);
  if ((v6 & 1) == 0) {
    __break(1u);
  }
  uint64_t result = sub_242FC4A04(v8);
  if (result)
  {
    os_log_type_t v10 = (void *)result;
    id v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__queue_predicates);
    swift_beginAccess();
    uint64_t v12 = *v11;
    id v13 = (id)MEMORY[0x263F8EE78];
    v29[0] = (id)MEMORY[0x263F8EE78];
    uint64_t v14 = *(void *)(v12 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = 0;
      while (*(void *)(v12 + 8 * v15 + 32))
      {
        ++v15;
        uint64_t v16 = swift_bridgeObjectRetain();
        sub_242FC33D0(v16);
        if (v14 == v15)
        {
          swift_bridgeObjectRelease();
          id v13 = v29[0];
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v13 = 0;
    }
LABEL_9:
    v29[0] = v13;
    sub_242FDBB60();
    swift_allocObject();
    sub_242FDBB50();
    sub_242FAA97C();
    uint64_t v17 = sub_242FDBB40();
    unint64_t v19 = v18;
    id v20 = (void *)sub_242FDBBD0();
    sub_242F26068(v17, v19);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_242FDBBF0();
    unint64_t v23 = v22;

    uint64_t v24 = (void *)sub_242FDBBD0();
    v29[0] = 0;
    LOBYTE(v17) = objc_msgSend(v10, sel_subscribeToActivityQoSMatchingPredicate_error_, v24, v29);

    if (v17)
    {
      id v25 = v29[0];
      sub_242F26068(v21, v23);
    }
    else
    {
      id v26 = v29[0];
      v27 = (void *)sub_242FDBB80();

      swift_willThrow();
      sub_242F26068(v21, v23);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_242FC53DC()
{
  return sub_242FC53F8(0, _s11ActivityKit9SingletonCMa_3);
}

id sub_242FC53F8(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_242FC54AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7C50);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_242FDE0B0;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  v9[5] = a4;
  sub_242FDBD70();
  swift_bridgeObjectRetain_n();
  swift_retain();
  sub_242FDC360();
  swift_release();
  swift_bridgeObjectRelease();
  os_log_type_t v10 = (objc_class *)type metadata accessor for CancellableAssertion();
  id v11 = objc_allocWithZone(v10);
  swift_allocObject();
  swift_retain();
  uint64_t v12 = (char *)v11;
  *(void *)&v12[OBJC_IVAR____TtC11ActivityKit20CancellableAssertion_token] = sub_242FDBD80();

  v15.receiver = v12;
  v15.super_class = v10;
  id v13 = objc_msgSendSuper2(&v15, sel_init);
  swift_release();
  return v13;
}

uint64_t sub_242FC56B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_242F5AB24(a2, a3);
    if (v9) {
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
    }
    else {
      uint64_t v10 = 1;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 1;
  }
  return a4(v10);
}

uint64_t sub_242FC5808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v65 = a3;
  v67[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8140);
  MEMORY[0x270FA5388](v10 - 8);
  v64 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E838);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  objc_super v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (void *)sub_242FC4A04();
  if (v16)
  {
    v57 = v15;
    id v63 = v16;
    uint64_t v59 = v13;
    uint64_t v17 = (void **)(a1 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__queue_predicates);
    swift_beginAccess();
    unint64_t v18 = *v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v61 = a5;
    uint64_t v58 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v18 = sub_242F5A984(0, v18[2] + 1, 1, v18);
    }
    unint64_t v21 = v18[2];
    unint64_t v20 = v18[3];
    unint64_t v22 = v21 + 1;
    if (v21 >= v20 >> 1) {
      unint64_t v18 = sub_242F5A984((void *)(v20 > 1), v21 + 1, 1, v18);
    }
    _OWORD v18[2] = v22;
    v18[v21 + 4] = a2;
    v67[0] = (id)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    uint64_t v23 = 0;
    uint64_t v60 = v12;
    uint64_t v56 = a2;
    while (v18[v23 + 4])
    {
      ++v23;
      uint64_t v24 = swift_bridgeObjectRetain();
      sub_242FC33D0(v24);
      if (v22 == v23)
      {
        swift_bridgeObjectRelease();
        id v25 = v67[0];
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v25 = 0;
LABEL_12:
    v67[0] = v25;
    sub_242FDBB60();
    swift_allocObject();
    sub_242FDBB50();
    sub_242FAA97C();
    uint64_t v28 = sub_242FDBB40();
    if (v5)
    {
      uint64_t result = swift_unexpectedError();
      __break(1u);
    }
    else
    {
      uint64_t v30 = v28;
      unint64_t v31 = v29;
      id v32 = (void *)sub_242FDBBD0();
      sub_242F26068(v30, v31);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v33 = sub_242FDBBF0();
      unint64_t v35 = v34;

      uint64_t v62 = v33;
      v36 = (void *)sub_242FDBBD0();
      v67[0] = 0;
      LOBYTE(v31) = objc_msgSend(v63, sel_subscribeToActivityQoSMatchingPredicate_error_, v36, v67);

      id v37 = v67[0];
      if (v31)
      {
        char *v17 = v18;
        id v38 = v37;
        swift_bridgeObjectRelease();
        v39 = *(void **)(a1 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__qosPublisher);
        id v66 = *(id *)(a1 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue);
        id v40 = v66;
        v67[0] = v39;
        uint64_t v41 = sub_242FDC330();
        v42 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56);
        unint64_t v55 = v35;
        uint64_t v43 = (uint64_t)v64;
        v42(v64, 1, 1, v41);
        swift_retain();
        id v44 = v40;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E830);
        sub_242F34A14(0, (unint64_t *)&qword_26B0B8880);
        sub_242F34F68(&qword_268D5E840, &qword_268D5E830);
        sub_242F4049C();
        v45 = v57;
        sub_242FDBEF0();
        sub_242F34DDC(v43, &qword_26B0B8140);

        swift_release();
        uint64_t v46 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v47 = swift_allocObject();
        uint64_t v48 = v56;
        *(void *)(v47 + 16) = v46;
        *(void *)(v47 + 24) = v48;
        v49 = (void *)swift_allocObject();
        uint64_t v50 = v65;
        v49[2] = v48;
        v49[3] = v50;
        v49[4] = v58;
        sub_242F34F68(&qword_268D5E848, &qword_268D5E838);
        swift_bridgeObjectRetain_n();
        swift_retain();
        uint64_t v51 = v60;
        uint64_t v52 = sub_242FDBEB0();
        sub_242F26068(v62, v55);
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v45, v51);
        uint64_t *v61 = v52;
      }
      else
      {
        id v53 = v67[0];
        swift_bridgeObjectRelease();
        sub_242FDBB80();

        swift_willThrow();
        sub_242F26068(v62, v35);
        return swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    sub_242F3B6D0();
    swift_allocError();
    *(_OWORD *)uint64_t v26 = xmmword_242FDE010;
    *(_OWORD *)(v26 + 16) = 0u;
    *(_OWORD *)(v26 + 32) = 0u;
    *(_OWORD *)(v26 + 48) = 0u;
    *(void *)(v26 + 64) = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_242FC5E54@<X0>(uint64_t *a1@<X8>)
{
  return sub_242FC5808(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t type metadata accessor for ActivityQoSObservationClient()
{
  return self;
}

uint64_t method lookup function for ActivityQoSObservationClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityQoSObservationClient);
}

uint64_t dispatch thunk of ActivityQoSObservationClient.listenForActivityQoS(activityIdentifier:handler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of ActivityQoSObservationClient.subscribeToActivityQoS(matching:handler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t _s11ActivityKit9SingletonCMa_3()
{
  return self;
}

void sub_242FC5F50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x245671DD0](v4);
  if (v5)
  {
    double v6 = (void *)v5;
    id v7 = a3;
    sub_242FC4D3C(&v7);
  }
}

uint64_t sub_242FC5FB0(uint64_t a1, void *a2, void (*a3)(uint64_t))
{
  swift_bridgeObjectRetain();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_242FC6660(v5, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a3(v6);

  return swift_release();
}

void *sub_242FC60F4(void *a1)
{
  return sub_242F5A520(0, a1[2], 0, a1);
}

void *sub_242FC6108(void *a1)
{
  return sub_242F5A850(0, a1[2], 0, a1);
}

void *sub_242FC611C(void *a1)
{
  return sub_242F5A984(0, a1[2], 0, a1);
}

uint64_t sub_242FC6130(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268D5E660);
  uint64_t result = sub_242FDC5D0();
  uint64_t v8 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v31) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v31) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v31) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v31) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v31) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(v4 + 56) + 8 * v13);
    sub_242FDC840();
    swift_bridgeObjectRetain();
    sub_242FDC110();
    uint64_t result = sub_242FDC880();
    uint64_t v21 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    unint64_t v29 = (void *)(*(void *)(v8 + 48) + 16 * v24);
    *unint64_t v29 = v19;
    v29[1] = v18;
    *(void *)(*(void *)(v8 + 56) + 8 * v24) = v20;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_242FC63D8(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = 0;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 64);
  int64_t v32 = (unint64_t)(v9 + 63) >> 6;
  unint64_t v29 = a4 + 9;
  uint64_t v30 = (unint64_t *)result;
  uint64_t v27 = a3 + 64;
  while (1)
  {
LABEL_6:
    while (!v11)
    {
      BOOL v12 = __OFADD__(v7++, 1);
      if (v12) {
        goto LABEL_48;
      }
      if (v7 >= v32) {
        return sub_242FC6130(v30, a2, v6, v5);
      }
      unint64_t v14 = *(void *)(v8 + 8 * v7);
      if (!v14)
      {
        int64_t v15 = v7 + 1;
        if (v7 + 1 >= v32) {
          return sub_242FC6130(v30, a2, v6, v5);
        }
        unint64_t v14 = *(void *)(v8 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v7 + 2;
          if (v7 + 2 >= v32) {
            return sub_242FC6130(v30, a2, v6, v5);
          }
          unint64_t v14 = *(void *)(v8 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v7 + 3;
            if (v7 + 3 >= v32) {
              return sub_242FC6130(v30, a2, v6, v5);
            }
            unint64_t v14 = *(void *)(v8 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                int64_t v7 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_50;
                }
                if (v7 >= v32) {
                  return sub_242FC6130(v30, a2, v6, v5);
                }
                unint64_t v14 = *(void *)(v8 + 8 * v7);
                ++v15;
                if (v14) {
                  goto LABEL_19;
                }
              }
            }
          }
        }
        int64_t v7 = v15;
      }
LABEL_19:
      unint64_t v11 = (v14 - 1) & v14;
      unint64_t v33 = __clz(__rbit64(v14)) + (v7 << 6);
      if (a4) {
        goto LABEL_20;
      }
LABEL_5:
      *(unint64_t *)((char *)v30 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
      BOOL v12 = __OFADD__(v6++, 1);
      if (v12) {
        goto LABEL_49;
      }
    }
    unint64_t v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v33 = v13 | (v7 << 6);
    if (!a4) {
      goto LABEL_5;
    }
LABEL_20:
    uint64_t v16 = a4[2];
    if (v16)
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v33);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      uint64_t result = a4[4];
      if (result == *v17 && a4[5] == v19) {
        goto LABEL_5;
      }
      uint64_t result = sub_242FDC770();
      if (result) {
        goto LABEL_5;
      }
      if (v16 != 1)
      {
        uint64_t result = a4[6];
        if (result == v18 && a4[7] == v19) {
          goto LABEL_5;
        }
        uint64_t result = sub_242FDC770();
        if (result) {
          goto LABEL_5;
        }
        if (v16 != 2) {
          break;
        }
      }
    }
  }
  uint64_t v31 = v6;
  unint64_t v22 = v29;
  uint64_t v23 = 2;
  while (1)
  {
    uint64_t v24 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    uint64_t result = *(v22 - 1);
    BOOL v25 = result == v18 && *v22 == v19;
    if (v25 || (uint64_t result = sub_242FDC770(), (result & 1) != 0))
    {
      uint64_t v8 = v27;
      uint64_t v5 = a3;
      uint64_t v6 = v31;
      goto LABEL_5;
    }
    v22 += 2;
    ++v23;
    if (v24 == v16)
    {
      uint64_t v8 = v27;
      uint64_t v5 = a3;
      uint64_t v6 = v31;
      goto LABEL_6;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_242FC6660(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_242FC63D8((uint64_t)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_242FC63D8((uint64_t)v11, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x245671D00](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_242FC681C(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v6 = sub_242FDBFD0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = (void *)sub_242FDBBD0();
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v11 = sub_242FDBBF0();
  unint64_t v13 = v12;
  sub_242F4AAAC();
  sub_242FDBB10();
  sub_242F26068(v11, v13);
  swift_release();
  uint64_t v14 = v19;
  if (v19)
  {

    int64_t v15 = *(void **)(a3 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton_queue);
    *uint64_t v9 = v15;
    (*(void (**)(void *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F0E0], v6);
    id v16 = v15;
    LOBYTE(v15) = sub_242FDBFF0();
    (*(void (**)(void *, uint64_t))(v7 + 8))(v9, v6);
    if (v15)
    {
      *(void *)(a3 + OBJC_IVAR____TtC11ActivityKitP33_6DC02F3CDAFEFBE600E2E479E61466209Singleton__queue_qos) = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v19 = v14;
      swift_bridgeObjectRetain();
      sub_242FDBE00();
      swift_bridgeObjectRelease();
      a4[2](a4, 0);
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  _Block_release(a4);
  __break(1u);
  _Block_release(a4);
  sub_242F26068(v11, v13);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_242FC6A80()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_242FC6AB8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_242FC6AF8(uint64_t a1)
{
  return sub_242FC56B4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(uint64_t))(v1 + 32));
}

uint64_t sub_242FC6B04()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_242FC6B3C(uint64_t a1)
{
  sub_242FC49B0(a1, v1);
}

unint64_t sub_242FC6B44()
{
  unint64_t result = qword_268D5E828;
  if (!qword_268D5E828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E828);
  }
  return result;
}

uint64_t sub_242FC6B98()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_242FC6BD0(void *a1)
{
  sub_242FC4204(a1, *(void *)(v1 + 16));
}

uint64_t sub_242FC6BD8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_242FC6BE8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_242FC6C10()
{
}

uint64_t sub_242FC6C34()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_242FC6C44(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_242FC6C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    sub_242F33690(a3, a4);
  }
}

uint64_t sub_242FC6CCC(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_242FC6D10()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_242FC6D50(uint64_t a1)
{
  sub_242FC5F50(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_242FC6D58()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_242FC6D98(uint64_t a1)
{
  return sub_242FC5FB0(a1, *(void **)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t sub_242FC6DBC@<X0>(uint64_t *a1@<X8>)
{
  return sub_242FC5E54(a1);
}

uint64_t PushType.contentSourceRequest.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[1];
  if (v2) {
    uint64_t v3 = *v1;
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v2;
  *(_OWORD *)(a1 + 16) = xmmword_242FE16A0;
  *(unsigned char *)(a1 + 32) = 0;
  return swift_bridgeObjectRetain();
}

void static PushType.token.getter(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t static PushType.channel(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_242FC6E28(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E890);
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E898);
  uint64_t v16 = *(void *)(v7 - 8);
  uint64_t v17 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E8A0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC7ABC();
  uint64_t v14 = v20;
  sub_242FDC8A0();
  if (v14)
  {
    char v22 = 1;
    sub_242FC7B10();
    sub_242FDC6C0();
    sub_242FDC6F0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
  }
  else
  {
    char v21 = 0;
    sub_242FC7B64();
    sub_242FDC6C0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_242FC7110(uint64_t a1)
{
  unint64_t v2 = sub_242FC7B10();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC714C(uint64_t a1)
{
  unint64_t v2 = sub_242FC7B10();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC7188()
{
  if (*v0) {
    return 0x6C656E6E616863;
  }
  else {
    return 0x6E656B6F74;
  }
}

uint64_t sub_242FC71C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FC7BB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FC71E8(uint64_t a1)
{
  unint64_t v2 = sub_242FC7ABC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC7224(uint64_t a1)
{
  unint64_t v2 = sub_242FC7ABC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC7260(uint64_t a1)
{
  unint64_t v2 = sub_242FC7B64();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC729C(uint64_t a1)
{
  unint64_t v2 = sub_242FC7B64();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC72D8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_242FC7CA4(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_242FC7304(void *a1)
{
  return sub_242FC6E28(a1, *v1, v1[1]);
}

uint64_t static PushType.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_242FDC770() & 1) != 0) {
        return 1;
      }
    }
  }
  else if (!v4)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_242FC7380()
{
  return 0x74736575716572;
}

uint64_t sub_242FC7398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_242FDC770();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_242FC7430(uint64_t a1)
{
  unint64_t v2 = sub_242FC7640();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC746C(uint64_t a1)
{
  unint64_t v2 = sub_242FC7640();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC74A8(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (!v3) {
    return v4 == 0;
  }
  if (!v4) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v4) {
    return 1;
  }
  else {
    return sub_242FDC770();
  }
}

uint64_t PushType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E850);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC7640();
  sub_242FDC8A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_242FC7694();
  sub_242FDC720();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_242FC7640()
{
  unint64_t result = qword_268D5E858;
  if (!qword_268D5E858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E858);
  }
  return result;
}

unint64_t sub_242FC7694()
{
  unint64_t result = qword_268D5E860;
  if (!qword_268D5E860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E860);
  }
  return result;
}

uint64_t PushType.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E868);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC7640();
  sub_242FDC890();
  if (!v2)
  {
    sub_242FC7854();
    sub_242FDC690();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_242FC7854()
{
  unint64_t result = qword_268D5E870;
  if (!qword_268D5E870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E870);
  }
  return result;
}

uint64_t sub_242FC78A8@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return PushType.init(from:)(a1, a2);
}

uint64_t sub_242FC78C0(void *a1)
{
  return PushType.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for PushType()
{
  return &type metadata for PushType;
}

uint64_t getEnumTagSinglePayload for DeviceIdentifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DeviceIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PushType.Request()
{
  return &type metadata for PushType.Request;
}

ValueMetadata *type metadata accessor for PushType.CodingKeys()
{
  return &type metadata for PushType.CodingKeys;
}

unint64_t sub_242FC79B8()
{
  unint64_t result = qword_268D5E878;
  if (!qword_268D5E878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E878);
  }
  return result;
}

unint64_t sub_242FC7A10()
{
  unint64_t result = qword_268D5E880;
  if (!qword_268D5E880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E880);
  }
  return result;
}

unint64_t sub_242FC7A68()
{
  unint64_t result = qword_268D5E888;
  if (!qword_268D5E888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E888);
  }
  return result;
}

unint64_t sub_242FC7ABC()
{
  unint64_t result = qword_268D5E8A8;
  if (!qword_268D5E8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8A8);
  }
  return result;
}

unint64_t sub_242FC7B10()
{
  unint64_t result = qword_268D5E8B0;
  if (!qword_268D5E8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8B0);
  }
  return result;
}

unint64_t sub_242FC7B64()
{
  unint64_t result = qword_268D5E8B8;
  if (!qword_268D5E8B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8B8);
  }
  return result;
}

uint64_t sub_242FC7BB8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E656B6F74 && a2 == 0xE500000000000000;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_242FC7CA4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E8C0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E8C8);
  uint64_t v27 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E8D0);
  uint64_t v26 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC7ABC();
  uint64_t v13 = (uint64_t)v28;
  sub_242FDC890();
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v14 = v27;
  uint64_t v23 = v6;
  uint64_t v28 = a1;
  uint64_t v15 = sub_242FDC6A0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v19 = sub_242FDC510();
    swift_allocError();
    char v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D6F0);
    *char v21 = &type metadata for PushType.Request;
    uint64_t v12 = (uint64_t)v11;
    sub_242FDC620();
    sub_242FDC500();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    a1 = v28;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v12;
  }
  if (*(unsigned char *)(v15 + 32))
  {
    char v30 = 1;
    sub_242FC7B10();
    sub_242FDC610();
    uint64_t v16 = v24;
    uint64_t v12 = sub_242FDC660();
    uint64_t v17 = v5;
    uint64_t v18 = v26;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v9);
  }
  else
  {
    char v29 = 0;
    sub_242FC7B64();
    sub_242FDC610();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    uint64_t v12 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v12;
}

unsigned char *storeEnumTagSinglePayload for PushType.Request.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x242FC8204);
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

ValueMetadata *type metadata accessor for PushType.Request.CodingKeys()
{
  return &type metadata for PushType.Request.CodingKeys;
}

ValueMetadata *type metadata accessor for PushType.Request.TokenCodingKeys()
{
  return &type metadata for PushType.Request.TokenCodingKeys;
}

unsigned char *_s11ActivityKit8PushTypeV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x242FC82E8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PushType.Request.ChannelCodingKeys()
{
  return &type metadata for PushType.Request.ChannelCodingKeys;
}

unint64_t sub_242FC8324()
{
  unint64_t result = qword_268D5E8D8;
  if (!qword_268D5E8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8D8);
  }
  return result;
}

unint64_t sub_242FC837C()
{
  unint64_t result = qword_268D5E8E0;
  if (!qword_268D5E8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8E0);
  }
  return result;
}

unint64_t sub_242FC83D4()
{
  unint64_t result = qword_268D5E8E8;
  if (!qword_268D5E8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8E8);
  }
  return result;
}

unint64_t sub_242FC842C()
{
  unint64_t result = qword_268D5E8F0;
  if (!qword_268D5E8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8F0);
  }
  return result;
}

unint64_t sub_242FC8484()
{
  unint64_t result = qword_268D5E8F8;
  if (!qword_268D5E8F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E8F8);
  }
  return result;
}

unint64_t sub_242FC84DC()
{
  unint64_t result = qword_268D5E900;
  if (!qword_268D5E900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E900);
  }
  return result;
}

unint64_t sub_242FC8534()
{
  unint64_t result = qword_268D5E908;
  if (!qword_268D5E908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E908);
  }
  return result;
}

unint64_t sub_242FC858C()
{
  unint64_t result = qword_268D5E910;
  if (!qword_268D5E910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E910);
  }
  return result;
}

ActivityKit::ActivityPresenter __swiftcall ActivityPresenter.init(bundleIdentifier:presentations:)(Swift::String bundleIdentifier, Swift::OpaquePointer presentations)
{
  *(Swift::String *)uint64_t v2 = bundleIdentifier;
  *(Swift::OpaquePointer *)(v2 + 16) = presentations;
  result.bundleIdentifier = bundleIdentifier;
  result.presentations = presentations;
  return result;
}

uint64_t sub_242FC85F4()
{
  if (*v0) {
    return 0xD000000000000011;
  }
  else {
    return 0x6E656E696D6F7270;
  }
}

uint64_t sub_242FC8638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FCB8BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FC8660(uint64_t a1)
{
  unint64_t v2 = sub_242FC8A6C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC869C(uint64_t a1)
{
  unint64_t v2 = sub_242FC8A6C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC86D8(uint64_t a1)
{
  unint64_t v2 = sub_242FC8B14();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC8714(uint64_t a1)
{
  unint64_t v2 = sub_242FC8B14();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC8750(uint64_t a1)
{
  unint64_t v2 = sub_242FC8AC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC878C(uint64_t a1)
{
  unint64_t v2 = sub_242FC8AC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityPresentationState.ForegroundModifier.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E918);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E920);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E928);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC8A6C();
  sub_242FDC8A0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_242FC8AC0();
    uint64_t v14 = v18;
    sub_242FDC6C0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_242FC8B14();
    sub_242FDC6C0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_242FC8A6C()
{
  unint64_t result = qword_268D5E930;
  if (!qword_268D5E930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E930);
  }
  return result;
}

unint64_t sub_242FC8AC0()
{
  unint64_t result = qword_268D5E938;
  if (!qword_268D5E938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E938);
  }
  return result;
}

unint64_t sub_242FC8B14()
{
  unint64_t result = qword_268D5E940;
  if (!qword_268D5E940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E940);
  }
  return result;
}

uint64_t ActivityPresentationState.ForegroundModifier.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E948);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E950);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E958);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC8A6C();
  uint64_t v11 = v32;
  sub_242FDC890();
  if (v11) {
    goto LABEL_6;
  }
  int64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_242FDC6A0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_242FDC510();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D6F0);
    *char v22 = &type metadata for ActivityPresentationState.ForegroundModifier;
    sub_242FDC620();
    sub_242FDC500();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_242FC8AC0();
    uint64_t v18 = v14;
    sub_242FDC610();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_242FC8B14();
    sub_242FDC610();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  unsigned char *v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_242FC8FC4@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return ActivityPresentationState.ForegroundModifier.init(from:)(a1, a2);
}

uint64_t sub_242FC8FDC(void *a1)
{
  return ActivityPresentationState.ForegroundModifier.encode(to:)(a1);
}

BOOL static ActivityPresentationState.DisplacementReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ActivityPresentationState.DisplacementReason.hash(into:)()
{
  return sub_242FDC850();
}

uint64_t sub_242FC9038()
{
  if (*v0) {
    return 0x6D6574737973;
  }
  else {
    return 0x65746E4972657375;
  }
}

uint64_t sub_242FC907C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FCB9B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FC90A4(uint64_t a1)
{
  unint64_t v2 = sub_242FC94B0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC90E0(uint64_t a1)
{
  unint64_t v2 = sub_242FC94B0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC911C(uint64_t a1)
{
  unint64_t v2 = sub_242FC9504();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC9158(uint64_t a1)
{
  unint64_t v2 = sub_242FC9504();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC9194(uint64_t a1)
{
  unint64_t v2 = sub_242FC9558();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC91D0(uint64_t a1)
{
  unint64_t v2 = sub_242FC9558();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityPresentationState.DisplacementReason.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E960);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E968);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E970);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC94B0();
  sub_242FDC8A0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_242FC9504();
    uint64_t v14 = v18;
    sub_242FDC6C0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_242FC9558();
    sub_242FDC6C0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_242FC94B0()
{
  unint64_t result = qword_268D5E978;
  if (!qword_268D5E978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E978);
  }
  return result;
}

unint64_t sub_242FC9504()
{
  unint64_t result = qword_268D5E980;
  if (!qword_268D5E980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E980);
  }
  return result;
}

unint64_t sub_242FC9558()
{
  unint64_t result = qword_268D5E988;
  if (!qword_268D5E988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E988);
  }
  return result;
}

uint64_t ActivityPresentationState.DisplacementReason.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E990);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E998);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E9A0);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FC94B0();
  uint64_t v11 = v32;
  sub_242FDC890();
  if (v11) {
    goto LABEL_6;
  }
  int64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_242FDC6A0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_242FDC510();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D6F0);
    *char v22 = &type metadata for ActivityPresentationState.DisplacementReason;
    sub_242FDC620();
    sub_242FDC500();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_242FC9504();
    uint64_t v18 = v14;
    sub_242FDC610();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_242FC9558();
    sub_242FDC610();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  unsigned char *v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_242FC9A08@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return ActivityPresentationState.DisplacementReason.init(from:)(a1, a2);
}

uint64_t sub_242FC9A20(void *a1)
{
  return ActivityPresentationState.DisplacementReason.encode(to:)(a1);
}

uint64_t sub_242FC9A3C(uint64_t a1)
{
  unint64_t v2 = sub_242FCB718();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC9A78(uint64_t a1)
{
  unint64_t v2 = sub_242FCB718();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC9AB4()
{
  uint64_t v1 = 0x756F72676B636162;
  if (*v0 != 1) {
    uint64_t v1 = 0x6563616C70736964;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x756F726765726F66;
  }
}

uint64_t sub_242FC9B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FCBAC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FC9B3C(uint64_t a1)
{
  unint64_t v2 = sub_242FCB61C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC9B78(uint64_t a1)
{
  unint64_t v2 = sub_242FCB61C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC9BB4()
{
  return 0x6E6F73616572;
}

uint64_t sub_242FC9BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_242FDC770();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_242FC9C58(uint64_t a1)
{
  unint64_t v2 = sub_242FCB670();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC9C94(uint64_t a1)
{
  unint64_t v2 = sub_242FCB670();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FC9CD0()
{
  return 0x7265696669646F6DLL;
}

uint64_t sub_242FC9CE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7265696669646F6DLL && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_242FDC770();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_242FC9D80(uint64_t a1)
{
  unint64_t v2 = sub_242FCB76C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FC9DBC(uint64_t a1)
{
  unint64_t v2 = sub_242FCB76C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityPresentationState.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B75E8);
  uint64_t v29 = *(void *)(v4 - 8);
  uint64_t v30 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v28 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B75F0);
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v27 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B75F8);
  uint64_t v25 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B75E0);
  uint64_t v31 = *(void *)(v12 - 8);
  uint64_t v32 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v15 = *v2;
  int v16 = v2[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FCB61C();
  sub_242FDC8A0();
  if (v16)
  {
    if (v16 == 1)
    {
      char v17 = v15 & 1;
      char v37 = 2;
      sub_242FCB670();
      uint64_t v18 = v28;
      uint64_t v19 = v32;
      sub_242FDC6C0();
      char v36 = v17;
      sub_242FCB6C4();
      uint64_t v20 = v30;
      sub_242FDC720();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v20);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v14, v19);
    }
    else
    {
      char v35 = 1;
      sub_242FCB718();
      uint64_t v23 = v32;
      sub_242FDC6C0();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v27);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v14, v23);
    }
  }
  else
  {
    char v34 = 0;
    sub_242FCB76C();
    uint64_t v22 = v32;
    sub_242FDC6C0();
    char v33 = v15;
    sub_242FCB7C0();
    sub_242FDC6E0();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v14, v22);
  }
}

uint64_t ActivityPresentationState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  char v37 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C208);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  uint64_t v36 = v4;
  MEMORY[0x270FA5388](v3);
  v39 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C530);
  uint64_t v38 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C538);
  uint64_t v34 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C528);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  id v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_242FCB61C();
  uint64_t v16 = v41;
  sub_242FDC890();
  if (v16) {
    goto LABEL_9;
  }
  uint64_t v32 = v8;
  uint64_t v18 = v38;
  char v17 = v39;
  uint64_t v41 = v12;
  uint64_t v19 = sub_242FDC6A0();
  if (*(void *)(v19 + 16) != 1)
  {
    uint64_t v22 = sub_242FDC510();
    swift_allocError();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D6F0);
    *uint64_t v24 = &type metadata for ActivityPresentationState;
    sub_242FDC620();
    sub_242FDC500();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
LABEL_9:
    uint64_t v27 = (uint64_t)v40;
    return __swift_destroy_boxed_opaque_existential_1(v27);
  }
  if (*(unsigned char *)(v19 + 32))
  {
    if (*(unsigned char *)(v19 + 32) == 1)
    {
      char v44 = 1;
      sub_242FCB718();
      sub_242FDC610();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
      char v20 = 0;
      char v21 = 2;
    }
    else
    {
      char v46 = 2;
      sub_242FCB670();
      uint64_t v26 = v17;
      sub_242FDC610();
      sub_242FCB814();
      uint64_t v29 = v35;
      sub_242FDC690();
      uint64_t v30 = v41;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v26, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v11);
      char v20 = v45;
      char v21 = 1;
    }
  }
  else
  {
    char v43 = 0;
    sub_242FCB76C();
    sub_242FDC610();
    sub_242FCB868();
    uint64_t v25 = v32;
    sub_242FDC650();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v25);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
    char v21 = 0;
    char v20 = v42;
  }
  uint64_t v27 = (uint64_t)v40;
  uint64_t v31 = v37;
  *char v37 = v20;
  v31[1] = v21;
  return __swift_destroy_boxed_opaque_existential_1(v27);
}

uint64_t sub_242FCA838@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return ActivityPresentationState.init(from:)(a1, a2);
}

uint64_t sub_242FCA850(void *a1)
{
  return ActivityPresentationState.encode(to:)(a1);
}

unint64_t ActivityPresentationFlattenedState.init(rawValue:)(unint64_t a1)
{
  return sub_242FCBC44(a1);
}

unint64_t sub_242FCA88C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_242FCBC44(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

unsigned __int8 *ActivityPresentationState.resolving(state:)@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  int v5 = v2[1];
  if (v2[1])
  {
    if (!result[1])
    {
      *(_WORD *)a2 = v3;
      return result;
    }
    if (result[1] == 1)
    {
      if (v5 != 1 || (v4 & 1) != 0 && (v3 &= 1u) != 0)
      {
        *(unsigned char *)a2 = v3;
LABEL_13:
        *(unsigned char *)(a2 + 1) = 1;
        return result;
      }
      *(_WORD *)a2 = 256;
    }
    else
    {
      if (v5 == 1)
      {
        *(unsigned char *)a2 = v4;
        goto LABEL_13;
      }
      *(_WORD *)a2 = 512;
    }
  }
  else if (result[1])
  {
    *(_WORD *)a2 = v4;
  }
  else if ((v4 | v3))
  {
    *(_WORD *)a2 = 1;
  }
  else if (v3 == 2 && v4 == 2)
  {
    *(_WORD *)a2 = 2;
  }
  else
  {
    *(_WORD *)a2 = 0;
  }
  return result;
}

uint64_t ActivityPresentation.activityIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void ActivityPresentation.state.getter(_WORD *a1@<X8>)
{
  *a1 = *(_WORD *)(v1 + 16);
}

uint64_t ActivityPresentation.init(activityIdentifier:state:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, __int16 *a3@<X2>, uint64_t a4@<X8>)
{
  __int16 v4 = *a3;
  *(void *)a4 = result;
  *(void *)(a4 + 8) = a2;
  *(_WORD *)(a4 + 16) = v4;
  return result;
}

uint64_t sub_242FCA9CC()
{
  if (*v0) {
    return 0x6574617473;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t sub_242FCAA08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FCD16C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FCAA30(uint64_t a1)
{
  unint64_t v2 = sub_242FCBC54();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FCAA6C(uint64_t a1)
{
  unint64_t v2 = sub_242FCBC54();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityPresentation.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E9C8);
  uint64_t v9 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(unsigned __int8 *)(v1 + 16);
  HIDWORD(v8) = *(unsigned __int8 *)(v1 + 17);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FCBC54();
  sub_242FDC8A0();
  char v14 = 0;
  sub_242FDC6F0();
  if (!v2)
  {
    char v12 = v10;
    char v13 = BYTE4(v8);
    char v11 = 1;
    sub_242FCBCA8();
    sub_242FDC720();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v4);
}

uint64_t ActivityPresentation.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E9E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FCBC54();
  sub_242FDC890();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v17 = 0;
  uint64_t v9 = sub_242FDC660();
  uint64_t v11 = v10;
  char v15 = 1;
  sub_242FCBCFC();
  swift_bridgeObjectRetain();
  sub_242FDC690();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __int16 v12 = v16;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(_WORD *)(a2 + 16) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_242FCAE44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ActivityPresentation.init(from:)(a1, a2);
}

uint64_t sub_242FCAE5C(void *a1)
{
  return ActivityPresentation.encode(to:)(a1);
}

uint64_t ActivityPresenter.bundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityPresenter.presentations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static ActivityPresenter.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_242FDC770() & 1) == 0) {
    return 0;
  }

  return sub_242F72C38(v2, v3);
}

uint64_t sub_242FCAF24()
{
  if (*v0) {
    return 0x61746E6573657270;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_242FCAF70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FCD254(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FCAF98(uint64_t a1)
{
  unint64_t v2 = sub_242FCBD50();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FCAFD4(uint64_t a1)
{
  unint64_t v2 = sub_242FCBD50();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityPresenter.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5E9F0);
  uint64_t v10 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FCBD50();
  sub_242FDC8A0();
  char v13 = 0;
  sub_242FDC6F0();
  if (!v2)
  {
    uint64_t v11 = v9;
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5EA00);
    sub_242FCBDF8(&qword_268D5EA08, (void (*)(void))sub_242FCBDA4);
    sub_242FDC720();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t ActivityPresenter.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5EA18);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FCBD50();
  sub_242FDC890();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v16 = 0;
  uint64_t v9 = sub_242FDC660();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D5EA00);
  char v15 = 1;
  sub_242FCBDF8(&qword_268D5EA20, (void (*)(void))sub_242FCBE68);
  swift_bridgeObjectRetain();
  sub_242FDC690();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_242FCB430@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return ActivityPresenter.init(from:)(a1, a2);
}

uint64_t sub_242FCB448(void *a1)
{
  return ActivityPresenter.encode(to:)(a1);
}

uint64_t sub_242FCB460(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_242FDC770() & 1) == 0) {
    return 0;
  }

  return sub_242F72C38(v2, v3);
}

uint64_t _s11ActivityKit0A12PresentationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 17);
  int v4 = *(unsigned __int8 *)(a2 + 16);
  int v5 = *(unsigned __int8 *)(a2 + 17);
  BOOL v6 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v6 || (v7 = sub_242FDC770(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v3)
    {
      if (v3 == 1)
      {
        if (v5 != 1 || ((v4 ^ v2) & 1) != 0) {
          return 0;
        }
      }
      else if (v5 != 2 || v4 != 0)
      {
        return 0;
      }
      return 1;
    }
    if (!v5)
    {
      if (v2 == 2)
      {
        if (v4 != 2) {
          return 0;
        }
      }
      else if (v4 == 2 || ((v4 ^ v2) & 1) != 0)
      {
        return 0;
      }
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL _s11ActivityKit0A17PresentationStateO2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  int v4 = a2[1];
  if (a1[1])
  {
    if (a1[1] == 1)
    {
      if (v4 == 1) {
        return ((v3 ^ v2) & 1) == 0;
      }
      return 0;
    }
    if (v4 != 2 || v3 != 0) {
      return 0;
    }
  }
  else
  {
    if (a2[1]) {
      return 0;
    }
    if (v2 == 2)
    {
      if (v3 != 2) {
        return 0;
      }
    }
    else
    {
      int v7 = (v3 ^ v2) & 1;
      if (v3 == 2 || v7 != 0) {
        return 0;
      }
    }
  }
  return 1;
}

unint64_t sub_242FCB61C()
{
  unint64_t result = qword_26B0B7550;
  if (!qword_26B0B7550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7550);
  }
  return result;
}

unint64_t sub_242FCB670()
{
  unint64_t result = qword_268D5E9A8;
  if (!qword_268D5E9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9A8);
  }
  return result;
}

unint64_t sub_242FCB6C4()
{
  unint64_t result = qword_268D5E9B0;
  if (!qword_268D5E9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9B0);
  }
  return result;
}

unint64_t sub_242FCB718()
{
  unint64_t result = qword_268D5E9B8;
  if (!qword_268D5E9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9B8);
  }
  return result;
}

unint64_t sub_242FCB76C()
{
  unint64_t result = qword_26B0B7588;
  if (!qword_26B0B7588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7588);
  }
  return result;
}

unint64_t sub_242FCB7C0()
{
  unint64_t result = qword_26B0B7568;
  if (!qword_26B0B7568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7568);
  }
  return result;
}

unint64_t sub_242FCB814()
{
  unint64_t result = qword_268D5E9C0;
  if (!qword_268D5E9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9C0);
  }
  return result;
}

unint64_t sub_242FCB868()
{
  unint64_t result = qword_268D5C450;
  if (!qword_268D5C450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5C450);
  }
  return result;
}

uint64_t sub_242FCB8BC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E656E696D6F7270 && a2 == 0xE900000000000074;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000242FECEB0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_242FCB9B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65746E4972657375 && a2 == 0xEF6E6F6974636172;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6574737973 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_242FCBAC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x756F726765726F66 && a2 == 0xEA0000000000646ELL;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F72676B636162 && a2 == 0xEA0000000000646ELL || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6563616C70736964 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_242FCBC44(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

unint64_t sub_242FCBC54()
{
  unint64_t result = qword_268D5E9D0;
  if (!qword_268D5E9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9D0);
  }
  return result;
}

unint64_t sub_242FCBCA8()
{
  unint64_t result = qword_268D5E9D8;
  if (!qword_268D5E9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9D8);
  }
  return result;
}

unint64_t sub_242FCBCFC()
{
  unint64_t result = qword_268D5E9E8;
  if (!qword_268D5E9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9E8);
  }
  return result;
}

unint64_t sub_242FCBD50()
{
  unint64_t result = qword_268D5E9F8;
  if (!qword_268D5E9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5E9F8);
  }
  return result;
}

unint64_t sub_242FCBDA4()
{
  unint64_t result = qword_268D5EA10;
  if (!qword_268D5EA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA10);
  }
  return result;
}

uint64_t sub_242FCBDF8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D5EA00);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_242FCBE68()
{
  unint64_t result = qword_268D5EA28;
  if (!qword_268D5EA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA28);
  }
  return result;
}

unint64_t sub_242FCBEC0()
{
  unint64_t result = qword_268D5EA30;
  if (!qword_268D5EA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA30);
  }
  return result;
}

unint64_t sub_242FCBF18()
{
  unint64_t result = qword_268D5EA38;
  if (!qword_268D5EA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA38);
  }
  return result;
}

unint64_t sub_242FCBF70()
{
  unint64_t result = qword_268D5EA40;
  if (!qword_268D5EA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA40);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityPresentationState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 65282 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65282 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65282;
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
      return (*a1 | (v4 << 16)) - 65282;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  if (v6 <= 2) {
    int v7 = -1;
  }
  else {
    int v7 = v6 ^ 0xFF;
  }
  return (v7 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityPresentationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65282 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65282 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 254) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 254;
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
        JUMPOUT(0x242FCC128);
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
          *(unsigned char *)(result + 1) = -(char)a2;
        break;
    }
  }
  return result;
}

uint64_t sub_242FCC150(unsigned __int8 *a1)
{
  if (a1[1] <= 1u) {
    return a1[1];
  }
  else {
    return *a1 + 2;
  }
}

unsigned char *sub_242FCC168(unsigned char *result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  result[1] = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActivityPresentationState()
{
  return &type metadata for ActivityPresentationState;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.ForegroundModifier()
{
  return &type metadata for ActivityPresentationState.ForegroundModifier;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.DisplacementReason()
{
  return &type metadata for ActivityPresentationState.DisplacementReason;
}

ValueMetadata *type metadata accessor for ActivityPresentationFlattenedState()
{
  return &type metadata for ActivityPresentationFlattenedState;
}

uint64_t sub_242FCC1C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ActivityPresentation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ActivityPresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityPresentation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityPresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityPresentation()
{
  return &type metadata for ActivityPresentation;
}

ValueMetadata *type metadata accessor for ActivityPresenter()
{
  return &type metadata for ActivityPresenter;
}

ValueMetadata *type metadata accessor for ActivityPresenter.CodingKeys()
{
  return &type metadata for ActivityPresenter.CodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentation.CodingKeys()
{
  return &type metadata for ActivityPresentation.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ActivityPresentationState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x242FCC440);
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

ValueMetadata *type metadata accessor for ActivityPresentationState.CodingKeys()
{
  return &type metadata for ActivityPresentationState.CodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.ForegroundCodingKeys()
{
  return &type metadata for ActivityPresentationState.ForegroundCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.BackgroundCodingKeys()
{
  return &type metadata for ActivityPresentationState.BackgroundCodingKeys;
}

unsigned char *_s11ActivityKit25ActivityPresentationStateO20ForegroundCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x242FCC538);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.DisplacedCodingKeys()
{
  return &type metadata for ActivityPresentationState.DisplacedCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.DisplacementReason.CodingKeys()
{
  return &type metadata for ActivityPresentationState.DisplacementReason.CodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.DisplacementReason.UserInteractionCodingKeys()
{
  return &type metadata for ActivityPresentationState.DisplacementReason.UserInteractionCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.DisplacementReason.SystemCodingKeys()
{
  return &type metadata for ActivityPresentationState.DisplacementReason.SystemCodingKeys;
}

unsigned char *_s11ActivityKit25ActivityPresentationStateO18ForegroundModifierOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x242FCC66CLL);
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

ValueMetadata *type metadata accessor for ActivityPresentationState.ForegroundModifier.CodingKeys()
{
  return &type metadata for ActivityPresentationState.ForegroundModifier.CodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.ForegroundModifier.ProminentCodingKeys()
{
  return &type metadata for ActivityPresentationState.ForegroundModifier.ProminentCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityPresentationState.ForegroundModifier.RestrictedUpdatesCodingKeys()
{
  return &type metadata for ActivityPresentationState.ForegroundModifier.RestrictedUpdatesCodingKeys;
}

unint64_t sub_242FCC6C8()
{
  unint64_t result = qword_268D5EA48;
  if (!qword_268D5EA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA48);
  }
  return result;
}

unint64_t sub_242FCC720()
{
  unint64_t result = qword_268D5EA50;
  if (!qword_268D5EA50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA50);
  }
  return result;
}

unint64_t sub_242FCC778()
{
  unint64_t result = qword_268D5EA58;
  if (!qword_268D5EA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA58);
  }
  return result;
}

unint64_t sub_242FCC7D0()
{
  unint64_t result = qword_268D5EA60;
  if (!qword_268D5EA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA60);
  }
  return result;
}

unint64_t sub_242FCC828()
{
  unint64_t result = qword_268D5EA68;
  if (!qword_268D5EA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA68);
  }
  return result;
}

unint64_t sub_242FCC880()
{
  unint64_t result = qword_268D5EA70;
  if (!qword_268D5EA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA70);
  }
  return result;
}

unint64_t sub_242FCC8D8()
{
  unint64_t result = qword_268D5EA78;
  if (!qword_268D5EA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA78);
  }
  return result;
}

unint64_t sub_242FCC930()
{
  unint64_t result = qword_268D5EA80;
  if (!qword_268D5EA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA80);
  }
  return result;
}

unint64_t sub_242FCC988()
{
  unint64_t result = qword_268D5EA88;
  if (!qword_268D5EA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA88);
  }
  return result;
}

unint64_t sub_242FCC9E0()
{
  unint64_t result = qword_268D5EA90;
  if (!qword_268D5EA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA90);
  }
  return result;
}

unint64_t sub_242FCCA38()
{
  unint64_t result = qword_268D5EA98;
  if (!qword_268D5EA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EA98);
  }
  return result;
}

unint64_t sub_242FCCA90()
{
  unint64_t result = qword_26B0B7598;
  if (!qword_26B0B7598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7598);
  }
  return result;
}

unint64_t sub_242FCCAE8()
{
  unint64_t result = qword_26B0B7590;
  if (!qword_26B0B7590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7590);
  }
  return result;
}

unint64_t sub_242FCCB40()
{
  unint64_t result = qword_26B0B7580;
  if (!qword_26B0B7580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7580);
  }
  return result;
}

unint64_t sub_242FCCB98()
{
  unint64_t result = qword_26B0B7578;
  if (!qword_26B0B7578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7578);
  }
  return result;
}

unint64_t sub_242FCCBF0()
{
  unint64_t result = qword_26B0B6B78;
  if (!qword_26B0B6B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B6B78);
  }
  return result;
}

unint64_t sub_242FCCC48()
{
  unint64_t result = qword_26B0B7570;
  if (!qword_26B0B7570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7570);
  }
  return result;
}

unint64_t sub_242FCCCA0()
{
  unint64_t result = qword_26B0B7560;
  if (!qword_26B0B7560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7560);
  }
  return result;
}

unint64_t sub_242FCCCF8()
{
  unint64_t result = qword_26B0B7558;
  if (!qword_26B0B7558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7558);
  }
  return result;
}

unint64_t sub_242FCCD50()
{
  unint64_t result = qword_268D5EAA0;
  if (!qword_268D5EAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAA0);
  }
  return result;
}

unint64_t sub_242FCCDA8()
{
  unint64_t result = qword_268D5EAA8;
  if (!qword_268D5EAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAA8);
  }
  return result;
}

unint64_t sub_242FCCE00()
{
  unint64_t result = qword_268D5EAB0;
  if (!qword_268D5EAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAB0);
  }
  return result;
}

unint64_t sub_242FCCE58()
{
  unint64_t result = qword_268D5EAB8;
  if (!qword_268D5EAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAB8);
  }
  return result;
}

unint64_t sub_242FCCEB0()
{
  unint64_t result = qword_268D5EAC0;
  if (!qword_268D5EAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAC0);
  }
  return result;
}

unint64_t sub_242FCCF08()
{
  unint64_t result = qword_268D5EAC8;
  if (!qword_268D5EAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAC8);
  }
  return result;
}

unint64_t sub_242FCCF60()
{
  unint64_t result = qword_268D5EAD0;
  if (!qword_268D5EAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAD0);
  }
  return result;
}

unint64_t sub_242FCCFB8()
{
  unint64_t result = qword_268D5EAD8;
  if (!qword_268D5EAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAD8);
  }
  return result;
}

unint64_t sub_242FCD010()
{
  unint64_t result = qword_268D5EAE0;
  if (!qword_268D5EAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAE0);
  }
  return result;
}

unint64_t sub_242FCD068()
{
  unint64_t result = qword_268D5EAE8;
  if (!qword_268D5EAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAE8);
  }
  return result;
}

unint64_t sub_242FCD0C0()
{
  unint64_t result = qword_268D5EAF0;
  if (!qword_268D5EAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAF0);
  }
  return result;
}

unint64_t sub_242FCD118()
{
  unint64_t result = qword_268D5EAF8;
  if (!qword_268D5EAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EAF8);
  }
  return result;
}

uint64_t sub_242FCD16C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x8000000242FECED0 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_242FCD254(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000242FEB040 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xED0000736E6F6974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_242FCD370@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F010];
  uint64_t v3 = sub_242FDBF50();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_242FCD3E4@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = *MEMORY[0x263F8EFE0];
  uint64_t v3 = sub_242FDBF50();
  unsigned int v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_242FCD460()
{
  return sub_242FDC470();
}

uint64_t sub_242FCD528()
{
  uint64_t v0 = sub_242FDBD20();
  __swift_allocate_value_buffer(v0, qword_268D6FF60);
  __swift_project_value_buffer(v0, (uint64_t)qword_268D6FF60);
  return sub_242FDBD10();
}

uint64_t sub_242FCD5AC(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v31 = a5;
  uint64_t v32 = a7;
  int v36 = a2;
  uint64_t v35 = a1;
  uint64_t v14 = sub_242FDC340();
  uint64_t v33 = *(void *)(v14 - 8);
  uint64_t v34 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v30 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_242FDC320();
  MEMORY[0x270FA5388](v16);
  uint64_t v17 = sub_242FDBFA0();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v18 = (void *)swift_allocObject();
  _OWORD v18[2] = a4;
  v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  v18[6] = a8;
  v29[1] = sub_242F34A14(0, (unint64_t *)&qword_26B0B8880);
  v29[0] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_242FDBF70();
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  sub_242FCEF10((unint64_t *)&qword_26B0B8A70, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0B88B0);
  sub_242FCEF58((unint64_t *)&qword_26B0B8A60, (uint64_t *)&unk_26B0B88B0);
  sub_242FDC470();
  (*(void (**)(char *, void, uint64_t))(v33 + 104))(v30, *MEMORY[0x263F8F130], v34);
  uint64_t v19 = (void *)v29[0];
  uint64_t v20 = sub_242FDC380();
  *(_OWORD *)(a3 + 56) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 104) = xmmword_242FE8C20;
  *(unsigned char *)(a3 + 120) = 0;
  *(void *)(a3 + 128) = 0;
  *(void *)(a3 + 16) = v20;
  *(void *)(a3 + 24) = sub_242FCEF00;
  *(void *)(a3 + 32) = v18;
  swift_retain();
  sub_242F348E4(0);
  *(void *)(a3 + 40) = v35;
  *(unsigned char *)(a3 + 48) = v36 & 1;
  sub_242F54184(v31, a6, v32, a8, &v42);
  if (v43)
  {
    sub_242F3B658(&v42, (uint64_t)&aBlock);
    if (qword_268D5C0E0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_242FDBD20();
    __swift_project_value_buffer(v21, (uint64_t)qword_268D6FF60);
    uint64_t v22 = sub_242FDBD00();
    os_log_type_t v23 = sub_242FDC300();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_242F21000, v22, v23, "Created inner cancellable on the first attempt", v24, 2u);
      MEMORY[0x245671D00](v24, -1, -1);
    }

    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a3 + 120) = 1;
    sub_242F3B658(&aBlock, (uint64_t)&v42);
    swift_beginAccess();
    sub_242FCEDE8((uint64_t)&v42, a3 + 64);
    swift_endAccess();
    return a3;
  }
  sub_242FCEBCC((uint64_t)&v42);
  uint64_t v25 = *(NSObject **)(a3 + 16);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_242FCEFA8;
  *(void *)(v26 + 24) = a3;
  id v40 = sub_242F34A0C;
  uint64_t v41 = v26;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  uint64_t v38 = sub_242F555E4;
  v39 = &block_descriptor_38_4;
  uint64_t v27 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v25, v27);
  _Block_release(v27);
  LOBYTE(v25) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if ((v25 & 1) == 0) {
    return a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_242FCDB48()
{
  if (v0[7])
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_242FDC3C0();
    swift_unknownObjectRelease();
  }
  v0[7] = 0;
  swift_unknownObjectRelease();
  swift_beginAccess();
  sub_242FCEE50((uint64_t)(v0 + 8), (uint64_t)&v4);
  if (*((void *)&v5 + 1))
  {
    sub_242F43164((uint64_t)&v4, (uint64_t)v3);
    sub_242FCEBCC((uint64_t)&v4);
    __swift_project_boxed_opaque_existential_1(v3, v3[3]);
    sub_242FDBD30();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    sub_242FCEBCC((uint64_t)&v4);
  }
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  swift_beginAccess();
  sub_242FCEDE8((uint64_t)&v4, (uint64_t)(v0 + 8));
  swift_endAccess();
  uint64_t v1 = v0[3];
  v0[3] = 0;
  v0[4] = 0;
  return sub_242F348E4(v1);
}

uint64_t sub_242FCDC74()
{
  uint64_t v54 = sub_242FDBF60();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v50 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_242FDBFA0();
  uint64_t v49 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v48 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_242FDBFC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  uint64_t v59 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v57 = (char *)&v45 - v8;
  uint64_t v56 = sub_242FDBF50();
  uint64_t v53 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v47 = (char *)&v45 - v12;
  MEMORY[0x270FA5388](v13);
  unint64_t v55 = (uint64_t *)((char *)&v45 - v14);
  uint64_t v15 = sub_242FDC390();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_242FDBFD0();
  uint64_t v20 = *(void *)(v19 - 8);
  double v21 = MEMORY[0x270FA5388](v19);
  os_log_type_t v23 = (uint64_t *)((char *)&v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = *(void **)(v0 + 16);
  *os_log_type_t v23 = v24;
  (*(void (**)(void *, void, uint64_t, double))(v20 + 104))(v23, *MEMORY[0x263F8F0E0], v19, v21);
  char v46 = v24;
  LOBYTE(v24) = sub_242FDBFF0();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v20 + 8))(v23, v19);
  if ((v24 & 1) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  double v26 = *(double *)(v0 + 104) * 1000000.0;
  if ((~*(void *)&v26 & 0x7FF0000000000000) == 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v26 <= -9.22337204e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v26 >= 9.22337204e18)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v45 = v0;
  if ((uint64_t)v26 >= 0x7FFFFFFF) {
    uint64_t v27 = 0x7FFFFFFFLL;
  }
  else {
    uint64_t v27 = (uint64_t)v26;
  }
  sub_242F34A14(0, (unint64_t *)&qword_26B0B76F0);
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_242FCEF10((unint64_t *)&qword_26B0B76E0, MEMORY[0x263F8F148]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7690);
  sub_242FCEF58((unint64_t *)&qword_26B0B76D0, &qword_26B0B7690);
  sub_242FDC470();
  uint64_t v28 = sub_242FDC3A0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v29 = v55;
  uint64_t v30 = v56;
  *unint64_t v55 = v27;
  uint64_t v31 = v53;
  uint64_t v32 = *(void (**)(uint64_t *, void, uint64_t))(v53 + 104);
  v32(v29, *MEMORY[0x263F8EFE8], v30);
  sub_242FDBFB0();
  uint64_t v33 = (uint64_t *)v10;
  uint64_t v34 = v57;
  MEMORY[0x245670C50](v6, v29);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v59 + 8);
  v59 += 8;
  char v46 = v35;
  v35(v6, v58);
  uint64_t ObjectType = swift_getObjectType();
  char v37 = v47;
  v32((uint64_t *)v47, *MEMORY[0x263F8F010], v30);
  *uint64_t v33 = 0;
  v32(v33, *MEMORY[0x263F8EFE0], v30);
  MEMORY[0x245671060](v34, v37, v33, ObjectType);
  uint64_t v38 = v33;
  v39 = *(void (**)(uint64_t *, uint64_t))(v31 + 8);
  v39(v38, v30);
  v39((uint64_t *)v37, v30);
  uint64_t v40 = swift_allocObject();
  uint64_t v41 = v45;
  swift_weakInit();
  aBlock[4] = sub_242FCEBC4;
  aBlock[5] = v40;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_242F7545C;
  aBlock[3] = &block_descriptor_13;
  long long v42 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v43 = v48;
  sub_242FDBF70();
  char v44 = v50;
  sub_242FCD460();
  sub_242FDC3B0();
  _Block_release(v42);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v44, v54);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v43, v51);
  swift_release();
  swift_release();
  *(void *)(v41 + 56) = v28;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  if (*(void *)(v41 + 56))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_242FDC3D0();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  v46(v57, v58);
  return ((uint64_t (*)(uint64_t *, uint64_t))v39)(v55, v56);
}

uint64_t sub_242FCE438()
{
  void (*v2)(long long *__return_ptr, uint64_t);
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  unsigned char v22[40];
  long long v23;
  uint64_t v24;
  void v25[5];

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v3 = (void *)(result + 24);
    uint64_t v2 = *(void (**)(long long *__return_ptr, uint64_t))(result + 24);
    if (v2)
    {
      swift_retain();
      v2(&v23, v1);
      if (v24)
      {
        sub_242F3B658(&v23, (uint64_t)v25);
        sub_242F43164((uint64_t)v25, (uint64_t)&v23);
        sub_242FCED80((uint64_t)&v23, (uint64_t)v22);
        swift_beginAccess();
        sub_242FCEDE8((uint64_t)v22, v1 + 64);
        swift_endAccess();
        *(unsigned char *)(v1 + 120) = 1;
        if (qword_268D5C0E0 != -1) {
          swift_once();
        }
        uint64_t v4 = sub_242FDBD20();
        __swift_project_value_buffer(v4, (uint64_t)qword_268D6FF60);
        swift_retain();
        uint64_t v5 = sub_242FDBD00();
        uint64_t v6 = sub_242FDC300();
        if (os_log_type_enabled(v5, v6))
        {
          uint64_t v7 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v7 = 134349056;
          *(void *)&os_log_type_t v23 = *(void *)(v1 + 128);
          sub_242FDC440();
          swift_release();
          _os_log_impl(&dword_242F21000, v5, v6, "Created inner cancellable after %{public}ld attempts", v7, 0xCu);
          MEMORY[0x245671D00](v7, -1, -1);

          if (*(void *)(v1 + 56))
          {
LABEL_8:
            swift_getObjectType();
            swift_unknownObjectRetain();
            sub_242FDC3C0();
            sub_242F348E4((uint64_t)v2);
            swift_unknownObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
LABEL_22:
            *(void *)(v1 + 56) = 0;
            swift_unknownObjectRelease();
            uint64_t v17 = *(void *)(v1 + 24);
            void *v3 = 0;
            v3[1] = 0;
            sub_242F348E4(v17);
            return swift_release();
          }
        }
        else
        {

          swift_release();
          if (*(void *)(v1 + 56)) {
            goto LABEL_8;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
        sub_242F348E4((uint64_t)v2);
        goto LABEL_22;
      }
      sub_242FCEBCC((uint64_t)&v23);
      uint64_t v8 = *(void *)(v1 + 128);
      uint64_t v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9)
      {
        __break(1u);
      }
      else
      {
        *(void *)(v1 + 128) = v10;
        uint64_t v11 = *(double *)(v1 + 104) + *(double *)(v1 + 104);
        if (*(double *)(v1 + 112) < v11) {
          uint64_t v11 = *(double *)(v1 + 112);
        }
        *(double *)(v1 + 104) = v11;
        if ((*(unsigned char *)(v1 + 48) & 1) == 0 && v10 >= *(void *)(v1 + 40))
        {
          if (qword_268D5C0E0 != -1) {
            swift_once();
          }
          uint64_t v18 = sub_242FDBD20();
          __swift_project_value_buffer(v18, (uint64_t)qword_268D6FF60);
          swift_retain();
          uint64_t v19 = sub_242FDBD00();
          uint64_t v20 = sub_242FDC2E0();
          if (os_log_type_enabled(v19, v20))
          {
            double v21 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)double v21 = 134349056;
            v25[0] = *(void *)(v1 + 128);
            sub_242FDC440();
            swift_release();
            _os_log_impl(&dword_242F21000, v19, v20, "Failed to create inner cancellable after %{public}ld attempts; giving up as maximum reached",
              v21,
              0xCu);
            MEMORY[0x245671D00](v21, -1, -1);
            sub_242F348E4((uint64_t)v2);
          }
          else
          {
            sub_242F348E4((uint64_t)v2);

            swift_release();
          }
          *(unsigned char *)(v1 + 120) = 2;
          return swift_release();
        }
        if (qword_268D5C0E0 == -1) {
          goto LABEL_18;
        }
      }
      swift_once();
LABEL_18:
      uint64_t v12 = sub_242FDBD20();
      __swift_project_value_buffer(v12, (uint64_t)qword_268D6FF60);
      swift_retain();
      uint64_t v13 = sub_242FDBD00();
      uint64_t v14 = sub_242FDC300();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 134349312;
        v25[0] = *(void *)(v1 + 128);
        sub_242FDC440();
        *(_WORD *)(v15 + 12) = 2050;
        v25[0] = *(void *)(v1 + 104);
        sub_242FDC440();
        swift_release();
        _os_log_impl(&dword_242F21000, v13, v14, "Failed to create inner cancellable after %{public}ld attempts; trying again in %{public}fs",
          (uint8_t *)v15,
          0x16u);
        MEMORY[0x245671D00](v15, -1, -1);
      }
      else
      {

        uint64_t v16 = swift_release();
      }
      sub_242FCDC74(v16);
      sub_242F348E4((uint64_t)v2);
      return swift_release();
    }
    if (*(void *)(result + 56))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_242FDC3C0();
      swift_unknownObjectRelease();
    }
    *(void *)(v1 + 56) = 0;
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_242FCE998()
{
  sub_242F348E4(*(void *)(v0 + 24));
  swift_unknownObjectRelease();
  sub_242FCEBCC(v0 + 64);

  return MEMORY[0x270FA0228](v0, 136, 7);
}

uint64_t type metadata accessor for RetryingCancellable()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for RetryingCancellable.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x242FCEAD8);
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

ValueMetadata *type metadata accessor for RetryingCancellable.State()
{
  return &type metadata for RetryingCancellable.State;
}

unint64_t sub_242FCEB14()
{
  unint64_t result = qword_268D5EB00;
  if (!qword_268D5EB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB00);
  }
  return result;
}

uint64_t sub_242FCEB68()
{
  return sub_242FCDB48();
}

uint64_t sub_242FCEB8C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_242FCEBC4()
{
  return sub_242FCE438();
}

uint64_t sub_242FCEBCC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C100);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_242FCEC2C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_242FDC5E0();
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

uint64_t sub_242FCECD0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_242FCED00(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_242FCED28(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_242FDC440();
  *a1 = v5;
  return result;
}

uint64_t sub_242FCED80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_242FCEDE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_242FCEE50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_242FCEEB8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_242FCEF00@<X0>(void *a1@<X8>)
{
  return sub_242F54184(v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_242FCEF10(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_242FCEF58(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_242FCEFAC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t ActivityDescriptorContentState.init(descriptor:state:contentState:content:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v10 = *a2;
  sub_242FCF0A8(a1, a6, (uint64_t (*)(void))type metadata accessor for ActivityDescriptor);
  uint64_t v11 = (int *)type metadata accessor for ActivityDescriptorContentState();
  *(unsigned char *)(a6 + v11[5]) = v10;
  uint64_t v12 = (void *)(a6 + v11[6]);
  void *v12 = a3;
  v12[1] = a4;
  return sub_242FCF0A8(a5, a6 + v11[7], (uint64_t (*)(void))type metadata accessor for OpaqueActivityContent);
}

uint64_t type metadata accessor for ActivityDescriptorContentState()
{
  uint64_t result = qword_26B0B87F8;
  if (!qword_26B0B87F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_242FCF0A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t ActivityDescriptorContentState.descriptor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242F46B1C(v1, a1, (uint64_t (*)(void))type metadata accessor for ActivityDescriptor);
}

uint64_t ActivityDescriptorContentState.state.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ActivityDescriptorContentState();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t ActivityDescriptorContentState.contentState.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for ActivityDescriptorContentState() + 24);
  uint64_t v2 = *(void *)v1;
  sub_242F34D20(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t ActivityDescriptorContentState.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ActivityDescriptorContentState();
  return sub_242F46B1C(v1 + *(int *)(v3 + 28), a1, (uint64_t (*)(void))type metadata accessor for OpaqueActivityContent);
}

uint64_t sub_242FCF20C()
{
  uint64_t result = 0x7470697263736564;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6574617473;
      break;
    case 2:
      uint64_t result = 0x53746E65746E6F63;
      break;
    case 3:
      uint64_t result = 0x746E65746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_242FCF2A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FD2424(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FCF2CC(uint64_t a1)
{
  unint64_t v2 = sub_242FD0984();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FCF308(uint64_t a1)
{
  unint64_t v2 = sub_242FD0984();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityDescriptorContentState.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C080);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD0984();
  sub_242FDC8A0();
  LOBYTE(v11) = 0;
  type metadata accessor for ActivityDescriptor();
  sub_242FD0B6C(&qword_26B0B76A0, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  sub_242FDC720();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for ActivityDescriptorContentState();
    LOBYTE(v11) = *(unsigned char *)(v3 + *(int *)(v9 + 20));
    char v12 = 1;
    sub_242F6D534();
    sub_242FDC720();
    long long v11 = *(_OWORD *)(v3 + *(int *)(v9 + 24));
    char v12 = 2;
    sub_242F4D898();
    sub_242FDC720();
    LOBYTE(v11) = 3;
    type metadata accessor for OpaqueActivityContent();
    sub_242FD0B6C(&qword_26B0B77B8, (void (*)(uint64_t))type metadata accessor for OpaqueActivityContent);
    sub_242FDC720();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ActivityDescriptorContentState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v3 = type metadata accessor for OpaqueActivityContent();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ActivityDescriptor();
  MEMORY[0x270FA5388](v6);
  uint64_t v22 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C348);
  uint64_t v20 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = (int *)type metadata accessor for ActivityDescriptorContentState();
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  uint64_t v25 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_242FD0984();
  os_log_type_t v23 = v9;
  uint64_t v14 = v26;
  sub_242FDC890();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  }
  uint64_t v15 = (uint64_t)v12;
  uint64_t v16 = v21;
  LOBYTE(v27) = 0;
  sub_242FD0B6C(&qword_26B0B8170, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  uint64_t v17 = (uint64_t)v22;
  sub_242FDC690();
  sub_242FCF0A8(v17, v15, (uint64_t (*)(void))type metadata accessor for ActivityDescriptor);
  char v28 = 1;
  sub_242F66048();
  sub_242FDC690();
  *(unsigned char *)(v15 + v10[5]) = v27;
  char v28 = 2;
  sub_242F4D6D4();
  sub_242FDC690();
  *(_OWORD *)(v15 + v10[6]) = v27;
  LOBYTE(v27) = 3;
  sub_242FD0B6C(&qword_26B0B7CD8, (void (*)(uint64_t))type metadata accessor for OpaqueActivityContent);
  sub_242FDC690();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v24);
  sub_242FCF0A8((uint64_t)v5, v15 + v10[7], (uint64_t (*)(void))type metadata accessor for OpaqueActivityContent);
  sub_242F46B1C(v15, v16, (uint64_t (*)(void))type metadata accessor for ActivityDescriptorContentState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return sub_242F46B84(v15, (uint64_t (*)(void))type metadata accessor for ActivityDescriptorContentState);
}

uint64_t sub_242FCFA68@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ActivityDescriptorContentState.init(from:)(a1, a2);
}

uint64_t sub_242FCFA80(void *a1)
{
  return ActivityDescriptorContentState.encode(to:)(a1);
}

uint64_t sub_242FCFA9C()
{
  sub_242FDBB60();
  swift_allocObject();
  sub_242FDBB50();
  sub_242FD0B6C(&qword_268D5C468, (void (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState);
  uint64_t v0 = sub_242FDBB40();
  unint64_t v2 = v1;
  uint64_t v3 = sub_242FDBBD0();
  sub_242F26068(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_242FCFB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B6B30);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v8 = sub_242FDBBF0();
  unint64_t v10 = v9;
  sub_242FD0B6C(&qword_26B0B8548, (void (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState);
  sub_242FDBB10();
  sub_242FD2684(a2);
  sub_242F26068(v8, v10);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v7, 0, 1, a3);
  return sub_242FD26E4((uint64_t)v7, a2);
}

ActivityKit::XPCCodableActivityDescriptorContentStates __swiftcall XPCCodableActivityDescriptorContentStates.init(descriptorContentStates:)(ActivityKit::XPCCodableActivityDescriptorContentStates descriptorContentStates)
{
  v1->descriptorContentStates._rawValue = descriptorContentStates.descriptorContentStates._rawValue;
  return descriptorContentStates;
}

unint64_t sub_242FCFD3C()
{
  return 0xD000000000000017;
}

uint64_t sub_242FCFD58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FD25FC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_242FCFD84(uint64_t a1)
{
  unint64_t v2 = sub_242FD09D8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FCFDC0(uint64_t a1)
{
  unint64_t v2 = sub_242FD09D8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t XPCCodableActivityDescriptorContentStates.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_268D5C220);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD09D8();
  sub_242FDC8A0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8850);
  sub_242FD0A2C(&qword_268D5C500, &qword_268D5C468);
  sub_242FDC720();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t XPCCodableActivityDescriptorContentStates.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8558);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD09D8();
  sub_242FDC890();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8850);
    sub_242FD0A2C(&qword_26B0B8550, &qword_26B0B8548);
    sub_242FDC690();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_242FD0134@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return XPCCodableActivityDescriptorContentStates.init(from:)(a1, a2);
}

uint64_t sub_242FD014C(void *a1)
{
  return XPCCodableActivityDescriptorContentStates.encode(to:)(a1);
}

uint64_t sub_242FD0164()
{
  sub_242FDBB60();
  swift_allocObject();
  sub_242FDBB50();
  sub_242FD0BEC();
  uint64_t v0 = sub_242FDBB40();
  unint64_t v2 = v1;
  uint64_t v3 = sub_242FDBBD0();
  sub_242F26068(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_242FD022C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
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
      sub_242F34D20(a2, a3);
      unint64_t v10 = (char *)sub_242FDBAA0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_242FDBAC0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_242FDBAB0();
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
        JUMPOUT(0x242FD0490);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_242F26068(a2, a3);
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
      uint64_t v17 = (char *)sub_242FDBAA0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_242FDBAC0();
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
      uint64_t v21 = sub_242FDBAB0();
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

uint64_t sub_242FD04A0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_242F34D20(a1, a2);
      char v5 = sub_242FD06D0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_242F26068(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_242FD06D0(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_242F26068(a3, a4);
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
      sub_242FD022C((uint64_t)__s1, a3, a4, &v14);
      sub_242F26068(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_242FD06D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_242FDBAA0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_242FDBAC0();
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
  sub_242FDBAB0();
  sub_242FD022C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_242FD0788(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x242FD08C4);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_242F34D20(a3, a4);
              char v15 = sub_242FD04A0(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

BOOL _s11ActivityKit0A22DescriptorContentStateV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((_s11ActivityKit0A10DescriptorV2eeoiySbAC_ACtFZ_0(a1, a2) & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ActivityDescriptorContentState();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = v4;
  if ((sub_242FD0788(*(void *)(a1 + *(int *)(v4 + 24)), *(void *)(a1 + *(int *)(v4 + 24) + 8), *(void *)(a2 + *(int *)(v4 + 24)), *(void *)(a2 + *(int *)(v4 + 24) + 8)) & 1) == 0)return 0; {
  uint64_t v6 = *(int *)(v5 + 28);
  }

  return static OpaqueActivityContent.== infix(_:_:)((uint64_t *)(a1 + v6), (uint64_t *)(a2 + v6));
}

unint64_t sub_242FD0984()
{
  unint64_t result = qword_268D5C840;
  if (!qword_268D5C840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5C840);
  }
  return result;
}

unint64_t sub_242FD09D8()
{
  unint64_t result = qword_26B0B8680;
  if (!qword_26B0B8680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8680);
  }
  return result;
}

uint64_t sub_242FD0A2C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B0B8850);
    sub_242FD0B6C(a2, (void (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_242FD0AC0(void *a1)
{
  a1[1] = sub_242FD0B6C(&qword_26B0B8548, (void (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState);
  a1[2] = sub_242FD0B6C(&qword_268D5C468, (void (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState);
  uint64_t result = sub_242FD0B6C(&qword_268D5EB08, (void (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState);
  a1[3] = result;
  return result;
}

uint64_t sub_242FD0B6C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_242FD0BB4(void *a1)
{
  a1[1] = sub_242F34C64();
  a1[2] = sub_242FD0BEC();
  unint64_t result = sub_242FD0C40();
  a1[3] = result;
  return result;
}

unint64_t sub_242FD0BEC()
{
  unint64_t result = qword_268D5C420;
  if (!qword_268D5C420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5C420);
  }
  return result;
}

unint64_t sub_242FD0C40()
{
  unint64_t result = qword_268D5C428;
  if (!qword_268D5C428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5C428);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityDescriptorContentState(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v46 = *a2;
    *(void *)a1 = *a2;
    a1 = v46 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[4];
    unint64_t v10 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_242F34D20(v9, v10);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    uint64_t v11 = a2[6];
    uint64_t v12 = a2[7];
    uint64_t v13 = a2[8];
    uint64_t v14 = a2[9];
    uint64_t v15 = a2[10];
    char v16 = *((unsigned char *)a2 + 88);
    sub_242F47F68();
    *(void *)(a1 + 48) = v11;
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v13;
    *(void *)(a1 + 72) = v14;
    *(void *)(a1 + 80) = v15;
    *(unsigned char *)(a1 + 88) = v16;
    uint64_t v17 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v17;
    *(_DWORD *)(a1 + 112) = *((_DWORD *)a2 + 28);
    *(unsigned char *)(a1 + 116) = *((unsigned char *)a2 + 116);
    uint64_t v18 = (void *)a2[15];
    *(void *)(a1 + 120) = v18;
    *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
    *(unsigned char *)(a1 + 129) = *((unsigned char *)a2 + 129);
    BOOL v19 = (int *)type metadata accessor for ActivityDescriptor();
    uint64_t v20 = v19[12];
    uint64_t v48 = (uint64_t)a2 + v20;
    uint64_t v49 = a1 + v20;
    uint64_t v21 = sub_242FDBC30();
    uint64_t v50 = *(void *)(v21 - 8);
    size_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v23 = v18;
    v22(v49, v48, v21);
    uint64_t v24 = v19[13];
    uint64_t v25 = (void *)(a1 + v24);
    __int16 v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = v26[1];
    *uint64_t v25 = *v26;
    v25[1] = v27;
    uint64_t v28 = v19[14];
    char v29 = (void *)(a1 + v28);
    char v30 = (uint64_t *)((char *)a2 + v28);
    uint64_t v31 = v30[1];
    *char v29 = *v30;
    v29[1] = v31;
    *(unsigned char *)(a1 + v19[15]) = *((unsigned char *)a2 + v19[15]);
    uint64_t v32 = a3[6];
    *(unsigned char *)(a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v33 = (uint64_t *)(a1 + v32);
    uint64_t v34 = *(uint64_t *)((char *)a2 + v32);
    unint64_t v35 = *(uint64_t *)((char *)a2 + v32 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_242F34D20(v34, v35);
    *uint64_t v33 = v34;
    v33[1] = v35;
    uint64_t v36 = a3[7];
    char v37 = (uint64_t *)(a1 + v36);
    uint64_t v38 = (uint64_t)a2 + v36;
    uint64_t v39 = *(uint64_t *)((char *)a2 + v36);
    unint64_t v40 = *(void *)(v38 + 8);
    sub_242F34D20(v39, v40);
    *char v37 = v39;
    v37[1] = v40;
    uint64_t v41 = type metadata accessor for OpaqueActivityContent();
    uint64_t v42 = *(int *)(v41 + 20);
    uint64_t v43 = (char *)v37 + v42;
    char v44 = (const void *)(v38 + v42);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v38 + v42, 1, v21))
    {
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7CB0);
      memcpy(v43, v44, *(void *)(*(void *)(v45 - 8) + 64));
    }
    else
    {
      v22((uint64_t)v43, (uint64_t)v44, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v43, 0, 1, v21);
    }
    *(uint64_t *)((char *)v37 + *(int *)(v41 + 24)) = *(void *)(v38 + *(int *)(v41 + 24));
  }
  return a1;
}

uint64_t destroy for ActivityDescriptorContentState(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_242F26068(*(void *)(a1 + 32), *(void *)(a1 + 40));
  sub_242F4952C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(type metadata accessor for ActivityDescriptor() + 48);
  uint64_t v5 = sub_242FDBC30();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_242F26068(*(void *)(a1 + *(int *)(a2 + 24)), *(void *)(a1 + *(int *)(a2 + 24) + 8));
  uint64_t v7 = a1 + *(int *)(a2 + 28);
  sub_242F26068(*(void *)v7, *(void *)(v7 + 8));
  uint64_t v8 = v7 + *(int *)(type metadata accessor for OpaqueActivityContent() + 20);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v5);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v5);
  }
  return result;
}

uint64_t initializeWithCopy for ActivityDescriptorContentState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  unint64_t v8 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_242F34D20(v7, v8);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 80);
  char v14 = *(unsigned char *)(a2 + 88);
  sub_242F47F68();
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v13;
  *(unsigned char *)(a1 + 88) = v14;
  uint64_t v15 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v15;
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(a2 + 116);
  char v16 = *(void **)(a2 + 120);
  *(void *)(a1 + 120) = v16;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  uint64_t v17 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v18 = v17[12];
  uint64_t v46 = a1 + v18;
  uint64_t v19 = a2 + v18;
  uint64_t v20 = sub_242FDBC30();
  uint64_t v47 = *(void *)(v20 - 8);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v22 = v16;
  v21(v46, v19, v20);
  uint64_t v23 = v17[13];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = v17[14];
  uint64_t v28 = (void *)(a1 + v27);
  char v29 = (void *)(a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  *(unsigned char *)(a1 + v17[15]) = *(unsigned char *)(a2 + v17[15]);
  uint64_t v31 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v32 = (uint64_t *)(a1 + v31);
  uint64_t v33 = *(void *)(a2 + v31);
  unint64_t v34 = *(void *)(a2 + v31 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_242F34D20(v33, v34);
  *uint64_t v32 = v33;
  v32[1] = v34;
  uint64_t v35 = a3[7];
  uint64_t v36 = (uint64_t *)(a1 + v35);
  uint64_t v37 = a2 + v35;
  uint64_t v38 = *(void *)(a2 + v35);
  unint64_t v39 = *(void *)(v37 + 8);
  sub_242F34D20(v38, v39);
  uint64_t *v36 = v38;
  v36[1] = v39;
  uint64_t v40 = type metadata accessor for OpaqueActivityContent();
  uint64_t v41 = *(int *)(v40 + 20);
  uint64_t v42 = (char *)v36 + v41;
  uint64_t v43 = (const void *)(v37 + v41);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v37 + v41, 1, v20))
  {
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7CB0);
    memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
  }
  else
  {
    v21((uint64_t)v42, (uint64_t)v43, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v42, 0, 1, v20);
  }
  *(uint64_t *)((char *)v36 + *(int *)(v40 + 24)) = *(void *)(v37 + *(int *)(v40 + 24));
  return a1;
}

uint64_t assignWithCopy for ActivityDescriptorContentState(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  unint64_t v7 = *(void *)(a2 + 40);
  sub_242F34D20(v6, v7);
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  sub_242F26068(v8, v9);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v12 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  char v15 = *(unsigned char *)(a2 + 88);
  sub_242F47F68();
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(unsigned char *)(a1 + 88) = v15;
  sub_242F4952C();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  *(unsigned char *)(a1 + 115) = *(unsigned char *)(a2 + 115);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(a2 + 116);
  char v16 = *(void **)(a1 + 120);
  uint64_t v17 = *(void **)(a2 + 120);
  *(void *)(a1 + 120) = v17;
  id v18 = v17;

  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  uint64_t v19 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v20 = v19[12];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_242FDBC30();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 24);
  v52(v21, v22, v23);
  uint64_t v25 = v19[13];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v28 = v19[14];
  char v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  *char v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v19[15]) = *(unsigned char *)(a2 + v19[15]);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v31 = a3[6];
  uint64_t v32 = (uint64_t *)(a1 + v31);
  uint64_t v33 = (uint64_t *)(a2 + v31);
  uint64_t v34 = *v33;
  unint64_t v35 = v33[1];
  sub_242F34D20(*v33, v35);
  uint64_t v36 = *v32;
  unint64_t v37 = v32[1];
  *uint64_t v32 = v34;
  v32[1] = v35;
  sub_242F26068(v36, v37);
  uint64_t v38 = a3[7];
  unint64_t v39 = (uint64_t *)(a1 + v38);
  uint64_t v40 = a2 + v38;
  uint64_t v41 = *(void *)(a2 + v38);
  unint64_t v42 = *(void *)(v40 + 8);
  sub_242F34D20(v41, v42);
  uint64_t v43 = *v39;
  unint64_t v44 = v39[1];
  uint64_t *v39 = v41;
  v39[1] = v42;
  sub_242F26068(v43, v44);
  uint64_t v53 = type metadata accessor for OpaqueActivityContent();
  uint64_t v45 = *(int *)(v53 + 20);
  uint64_t v46 = (char *)v39 + v45;
  uint64_t v47 = (char *)(v40 + v45);
  uint64_t v48 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v35) = v48((char *)v39 + v45, 1, v23);
  int v49 = v48(v47, 1, v23);
  if (!v35)
  {
    if (!v49)
    {
      v52((uint64_t)v46, (uint64_t)v47, v23);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v46, v23);
    goto LABEL_6;
  }
  if (v49)
  {
LABEL_6:
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7CB0);
    memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v46, v47, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v46, 0, 1, v23);
LABEL_7:
  *(uint64_t *)((char *)v39 + *(int *)(v53 + 24)) = *(void *)(v40 + *(int *)(v53 + 24));
  return a1;
}

uint64_t initializeWithTake for ActivityDescriptorContentState(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  uint64_t v8 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v9 = v8[12];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_242FDBC30();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void (**)(void *, const void *, uint64_t))(v13 + 32);
  v14(v10, v11, v12);
  *(_OWORD *)(a1 + v8[13]) = *(_OWORD *)(a2 + v8[13]);
  *(_OWORD *)(a1 + v8[14]) = *(_OWORD *)(a2 + v8[14]);
  *(unsigned char *)(a1 + v8[15]) = *(unsigned char *)(a2 + v8[15]);
  uint64_t v15 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  uint64_t v19 = type metadata accessor for OpaqueActivityContent();
  uint64_t v20 = *(int *)(v19 + 20);
  uint64_t v21 = (void *)(v17 + v20);
  uint64_t v22 = (const void *)(v18 + v20);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v18 + v20, 1, v12))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7CB0);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    v14(v21, v22, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
  }
  *(void *)(v17 + *(int *)(v19 + 24)) = *(void *)(v18 + *(int *)(v19 + 24));
  return a1;
}

uint64_t assignWithTake for ActivityDescriptorContentState(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_242F26068(v8, v9);
  uint64_t v10 = *(void *)(a2 + 80);
  char v11 = *(unsigned char *)(a2 + 88);
  long long v12 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v12;
  *(void *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 88) = v11;
  sub_242F4952C();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  *(unsigned char *)(a1 + 115) = *(unsigned char *)(a2 + 115);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(a2 + 116);
  uint64_t v13 = *(void **)(a1 + 120);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);

  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  uint64_t v14 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v15 = v14[12];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_242FDBC30();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
  v45(v16, v17, v18);
  uint64_t v20 = v14[13];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = v14[14];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (uint64_t *)(a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  *uint64_t v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v14[15]) = *(unsigned char *)(a2 + v14[15]);
  uint64_t v30 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v31 = *(void *)(a1 + v30);
  unint64_t v32 = *(void *)(a1 + v30 + 8);
  *(_OWORD *)(a1 + v30) = *(_OWORD *)(a2 + v30);
  sub_242F26068(v31, v32);
  uint64_t v33 = a3[7];
  uint64_t v34 = a1 + v33;
  unint64_t v35 = (_OWORD *)(a2 + v33);
  uint64_t v36 = *(void *)(a1 + v33);
  unint64_t v37 = *(void *)(a1 + v33 + 8);
  *(_OWORD *)(a1 + v33) = *v35;
  sub_242F26068(v36, v37);
  uint64_t v46 = type metadata accessor for OpaqueActivityContent();
  uint64_t v47 = v35;
  uint64_t v38 = *(int *)(v46 + 20);
  unint64_t v39 = (void *)(v34 + v38);
  uint64_t v40 = (char *)v35 + v38;
  uint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v16) = v41(v34 + v38, 1, v18);
  int v42 = v41((uint64_t)v40, 1, v18);
  if (!v16)
  {
    if (!v42)
    {
      v45((uint64_t)v39, (uint64_t)v40, v18);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v19 + 8))(v39, v18);
    goto LABEL_6;
  }
  if (v42)
  {
LABEL_6:
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7CB0);
    memcpy(v39, v40, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v19 + 32))(v39, v40, v18);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v39, 0, 1, v18);
LABEL_7:
  *(void *)(v34 + *(int *)(v46 + 24)) = *(void *)((char *)v47 + *(int *)(v46 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityDescriptorContentState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_242FD1CF0);
}

uint64_t sub_242FD1CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActivityDescriptor();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 252)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 4) {
      return v10 - 3;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = type metadata accessor for OpaqueActivityContent();
    long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityDescriptorContentState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_242FD1E28);
}

uint64_t sub_242FD1E28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ActivityDescriptor();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 252)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 3;
  }
  else
  {
    uint64_t v11 = type metadata accessor for OpaqueActivityContent();
    long long v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_242FD1F50()
{
  uint64_t result = type metadata accessor for ActivityDescriptor();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for OpaqueActivityContent();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodableActivityDescriptorContentStates()
{
  return &type metadata for XPCCodableActivityDescriptorContentStates;
}

unsigned char *storeEnumTagSinglePayload for XPCCodableActivityDescriptorContentStates.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x242FD20D8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodableActivityDescriptorContentStates.CodingKeys()
{
  return &type metadata for XPCCodableActivityDescriptorContentStates.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ActivityDescriptorContentState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x242FD21DCLL);
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

ValueMetadata *type metadata accessor for ActivityDescriptorContentState.CodingKeys()
{
  return &type metadata for ActivityDescriptorContentState.CodingKeys;
}

unint64_t sub_242FD2218()
{
  unint64_t result = qword_268D5EB10;
  if (!qword_268D5EB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB10);
  }
  return result;
}

unint64_t sub_242FD2270()
{
  unint64_t result = qword_268D5EB18;
  if (!qword_268D5EB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB18);
  }
  return result;
}

unint64_t sub_242FD22C8()
{
  unint64_t result = qword_26B0B8690;
  if (!qword_26B0B8690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8690);
  }
  return result;
}

unint64_t sub_242FD2320()
{
  unint64_t result = qword_26B0B8688;
  if (!qword_26B0B8688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8688);
  }
  return result;
}

unint64_t sub_242FD2378()
{
  unint64_t result = qword_268D5C850;
  if (!qword_268D5C850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5C850);
  }
  return result;
}

unint64_t sub_242FD23D0()
{
  unint64_t result = qword_268D5C848;
  if (!qword_268D5C848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5C848);
  }
  return result;
}

uint64_t sub_242FD2424(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7470697263736564 && a2 == 0xEA0000000000726FLL;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x53746E65746E6F63 && a2 == 0xEC00000065746174 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_242FD25FC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x8000000242FED030)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_242FDC770();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_242FD2684(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B6B30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_242FD26E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B6B30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL static ActivityAuthorizationOptionsType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

ActivityKit::ActivityAuthorizationOptionsType __swiftcall ActivityAuthorizationOptionsType.init(authorizationCount:)(Swift::Int authorizationCount)
{
  if (authorizationCount == 2) {
    char v2 = 1;
  }
  else {
    char v2 = 3;
  }
  if (authorizationCount == 1) {
    char v2 = 0;
  }
  *unint64_t v1 = v2;
  return (char)authorizationCount;
}

unint64_t ActivityAuthorizationOptionsType.description.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 0x6F6974704F206F4ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ActivityAuthorizationOptionsType.authorizationCount.getter()
{
  if (*v0) {
    return 2 * (*v0 == 1);
  }
  else {
    return 1;
  }
}

uint64_t ActivityAuthorizationOptionsType.hash(into:)()
{
  return sub_242FDC850();
}

unint64_t sub_242FD2854()
{
  unint64_t result = 0x7265507473726966;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0x6E6F6974704F6F6ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_242FD2900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FD3D8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FD2928(uint64_t a1)
{
  unint64_t v2 = sub_242FD2FC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD2964(uint64_t a1)
{
  unint64_t v2 = sub_242FD2FC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FD29A0(uint64_t a1)
{
  unint64_t v2 = sub_242FD3110();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD29DC(uint64_t a1)
{
  unint64_t v2 = sub_242FD3110();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FD2A18(uint64_t a1)
{
  unint64_t v2 = sub_242FD3068();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD2A54(uint64_t a1)
{
  unint64_t v2 = sub_242FD3068();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FD2A90(uint64_t a1)
{
  unint64_t v2 = sub_242FD3014();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD2ACC(uint64_t a1)
{
  unint64_t v2 = sub_242FD3014();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FD2B08(uint64_t a1)
{
  unint64_t v2 = sub_242FD30BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD2B44(uint64_t a1)
{
  unint64_t v2 = sub_242FD30BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityAuthorizationOptionsType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D48);
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D68);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v26 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D60);
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v25 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v23 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D58);
  uint64_t v21 = *(void *)(v9 - 8);
  uint64_t v22 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D50);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD2FC0();
  sub_242FDC8A0();
  switch(v16)
  {
    case 1:
      char v33 = 1;
      sub_242FD30BC();
      uint64_t v17 = v23;
      sub_242FDC6C0();
      uint64_t v19 = v24;
      uint64_t v18 = v25;
      goto LABEL_6;
    case 2:
      char v34 = 2;
      sub_242FD3068();
      uint64_t v17 = v26;
      sub_242FDC6C0();
      uint64_t v19 = v27;
      uint64_t v18 = v28;
      goto LABEL_6;
    case 3:
      char v35 = 3;
      sub_242FD3014();
      uint64_t v17 = v29;
      sub_242FDC6C0();
      uint64_t v19 = v30;
      uint64_t v18 = v31;
LABEL_6:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_242FD3110();
      sub_242FDC6C0();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v22);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_242FD2FC0()
{
  unint64_t result = qword_26B0B8240;
  if (!qword_26B0B8240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8240);
  }
  return result;
}

unint64_t sub_242FD3014()
{
  unint64_t result = qword_26B0B7F78;
  if (!qword_26B0B7F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7F78);
  }
  return result;
}

unint64_t sub_242FD3068()
{
  unint64_t result = qword_268D5EB20;
  if (!qword_268D5EB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB20);
  }
  return result;
}

unint64_t sub_242FD30BC()
{
  unint64_t result = qword_268D5EB28;
  if (!qword_268D5EB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB28);
  }
  return result;
}

unint64_t sub_242FD3110()
{
  unint64_t result = qword_26B0B7C90;
  if (!qword_26B0B7C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7C90);
  }
  return result;
}

uint64_t ActivityAuthorizationOptionsType.hashValue.getter()
{
  return sub_242FDC880();
}

uint64_t ActivityAuthorizationOptionsType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B82D0);
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v48 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B82F0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  uint64_t v45 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B82E8);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B82E0);
  uint64_t v41 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B82D8);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1[3];
  uint64_t v51 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_242FD2FC0();
  uint64_t v19 = v52;
  sub_242FDC890();
  if (v19) {
    goto LABEL_7;
  }
  uint64_t v39 = v11;
  uint64_t v40 = v10;
  uint64_t v52 = 0;
  uint64_t v21 = v48;
  uint64_t v20 = v49;
  uint64_t v22 = v50;
  uint64_t v23 = v17;
  uint64_t v24 = sub_242FDC6A0();
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v27 = sub_242FDC510();
    swift_allocError();
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D6F0);
    *uint64_t v29 = &type metadata for ActivityAuthorizationOptionsType;
    sub_242FDC620();
    sub_242FDC500();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, *MEMORY[0x263F8DCB0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_7:
    uint64_t v30 = (uint64_t)v51;
    return __swift_destroy_boxed_opaque_existential_1(v30);
  }
  char v25 = *(unsigned char *)(v24 + 32);
  switch(v25)
  {
    case 1:
      char v54 = 1;
      sub_242FD30BC();
      char v32 = v40;
      uint64_t v33 = v52;
      sub_242FDC610();
      if (v33) {
        goto LABEL_12;
      }
      uint64_t v35 = v42;
      uint64_t v34 = v43;
      goto LABEL_16;
    case 2:
      char v55 = 2;
      sub_242FD3068();
      char v32 = v46;
      uint64_t v36 = v52;
      sub_242FDC610();
      if (v36) {
        goto LABEL_12;
      }
      uint64_t v34 = v44;
      uint64_t v35 = v45;
LABEL_16:
      (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
      goto LABEL_17;
    case 3:
      char v56 = 3;
      sub_242FD3014();
      uint64_t v37 = v52;
      sub_242FDC610();
      if (v37)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
        uint64_t v30 = (uint64_t)v51;
        return __swift_destroy_boxed_opaque_existential_1(v30);
      }
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
      uint64_t v30 = (uint64_t)v51;
      uint64_t v38 = v47;
      goto LABEL_19;
    default:
      char v53 = 0;
      sub_242FD3110();
      uint64_t v26 = v52;
      sub_242FDC610();
      if (v26)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v39);
LABEL_17:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
      uint64_t v30 = (uint64_t)v51;
      uint64_t v38 = v47;
LABEL_19:
      *uint64_t v38 = v25;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v30);
}

unint64_t sub_242FD37E4()
{
  unint64_t result = qword_268D5EB30;
  if (!qword_268D5EB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB30);
  }
  return result;
}

uint64_t sub_242FD3838@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return ActivityAuthorizationOptionsType.init(from:)(a1, a2);
}

uint64_t sub_242FD3850(void *a1)
{
  return ActivityAuthorizationOptionsType.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType()
{
  return &type metadata for ActivityAuthorizationOptionsType;
}

unsigned char *_s11ActivityKit32ActivityAuthorizationOptionsTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x242FD394CLL);
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

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.CodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.CodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.FirstPermissionCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.FirstPermissionCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.SecondPermissionCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.SecondPermissionCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.MoreFrequentUpdatesCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.MoreFrequentUpdatesCodingKeys;
}

ValueMetadata *type metadata accessor for ActivityAuthorizationOptionsType.NoOptionsCodingKeys()
{
  return &type metadata for ActivityAuthorizationOptionsType.NoOptionsCodingKeys;
}

unint64_t sub_242FD39C8()
{
  unint64_t result = qword_268D5EB38;
  if (!qword_268D5EB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB38);
  }
  return result;
}

unint64_t sub_242FD3A20()
{
  unint64_t result = qword_26B0B8260;
  if (!qword_26B0B8260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8260);
  }
  return result;
}

unint64_t sub_242FD3A78()
{
  unint64_t result = qword_26B0B8258;
  if (!qword_26B0B8258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8258);
  }
  return result;
}

unint64_t sub_242FD3AD0()
{
  unint64_t result = qword_26B0B8270;
  if (!qword_26B0B8270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8270);
  }
  return result;
}

unint64_t sub_242FD3B28()
{
  unint64_t result = qword_26B0B8268;
  if (!qword_26B0B8268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8268);
  }
  return result;
}

unint64_t sub_242FD3B80()
{
  unint64_t result = qword_26B0B8280;
  if (!qword_26B0B8280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8280);
  }
  return result;
}

unint64_t sub_242FD3BD8()
{
  unint64_t result = qword_26B0B8278;
  if (!qword_26B0B8278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8278);
  }
  return result;
}

unint64_t sub_242FD3C30()
{
  unint64_t result = qword_26B0B8238;
  if (!qword_26B0B8238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8238);
  }
  return result;
}

unint64_t sub_242FD3C88()
{
  unint64_t result = qword_26B0B8230;
  if (!qword_26B0B8230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8230);
  }
  return result;
}

unint64_t sub_242FD3CE0()
{
  unint64_t result = qword_26B0B8250;
  if (!qword_26B0B8250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8250);
  }
  return result;
}

unint64_t sub_242FD3D38()
{
  unint64_t result = qword_26B0B8248;
  if (!qword_26B0B8248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8248);
  }
  return result;
}

uint64_t sub_242FD3D8C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7265507473726966 && a2 == 0xEF6E6F697373696DLL;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000242FED050 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000242FED070 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F6974704F6F6ELL && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_242FD3F6C()
{
  uint64_t v0 = sub_242FDBCB0();
  __swift_allocate_value_buffer(v0, qword_26B0B89E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B0B89E0);
  return sub_242FDBCA0();
}

uint64_t static ActivityPushTokenServiceDefinition.domain.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B0B8878 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_242FDBCB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B0B89E0);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t static ActivityPushTokenServiceDefinition.serviceName.getter()
{
  return 0xD000000000000029;
}

uint64_t sub_242FD407C@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B0B8878 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_242FDBCB0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B0B89E0);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_242FD4124()
{
  return 0xD000000000000029;
}

ValueMetadata *type metadata accessor for ActivityPushTokenServiceDefinition()
{
  return &type metadata for ActivityPushTokenServiceDefinition;
}

BOOL sub_242FD4150(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B78E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_26B0B78E8);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for ActivityEndingOptions();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_268D5C1C0, (void (*)(uint64_t))type metadata accessor for ActivityEndingOptions);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_26B0B78E8);
  sub_242F348F4(a2, (uint64_t)v5, &qword_26B0B78E8);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_26B0B78E8);
  return v14;
}

BOOL sub_242FD436C(uint64_t a1, void *a2)
{
  return sub_242FD56D8(a1, a2, (void (*)(void))sub_242F34C64);
}

BOOL sub_242FD438C(uint64_t a1, void *a2)
{
  return sub_242FD56D8(a1, a2, (void (*)(void))sub_242F34BAC);
}

BOOL sub_242FD43AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5DA28);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_268D5DA28);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for OpaqueActivityContent();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_26B0B7CD8, (void (*)(uint64_t))type metadata accessor for OpaqueActivityContent);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_268D5DA28);
  sub_242F348F4(a2, (uint64_t)v5, &qword_268D5DA28);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_268D5DA28);
  return v14;
}

BOOL sub_242FD45C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D10);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_26B0B7D10);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for OpaqueActivityPayload(0);
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_26B0B7C88, (void (*)(uint64_t))type metadata accessor for OpaqueActivityPayload);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_26B0B7D10);
  sub_242F348F4(a2, (uint64_t)v5, &qword_26B0B7D10);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_26B0B7D10);
  return v14;
}

BOOL sub_242FD47E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D78);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_26B0B7D78);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for ActivityDescriptor();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_26B0B8170, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_26B0B7D78);
  sub_242F348F4(a2, (uint64_t)v5, &qword_26B0B7D78);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_26B0B7D78);
  return v14;
}

BOOL sub_242FD4A00(uint64_t a1, void *a2)
{
  return sub_242FD56D8(a1, a2, (void (*)(void))sub_242F51C4C);
}

BOOL sub_242FD4A20(uint64_t a1, void *a2)
{
  return sub_242FD4DB0(a1, a2, (void (*)(void))sub_242FC6C44, (void (*)(void))sub_242F65FA0);
}

BOOL sub_242FD4A54(uint64_t a1, void *a2)
{
  swift_bridgeObjectRelease();
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v3 = sub_242FDBBF0();
  unint64_t v5 = v4;
  sub_242F660F0();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v3, v5);
  *a2 = v7;
  a2[1] = v8;
  return v8 != 0;
}

BOOL sub_242FD4B40(uint64_t a1, void *a2)
{
  return sub_242FD56D8(a1, a2, (void (*)(void))sub_242F40154);
}

BOOL sub_242FD4B60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5DA20);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_268D5DA20);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for ActivityUIDismissalPolicy();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_268D5C458, (void (*)(uint64_t))type metadata accessor for ActivityUIDismissalPolicy);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_268D5DA20);
  sub_242F348F4(a2, (uint64_t)v5, &qword_268D5DA20);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_268D5DA20);
  return v14;
}

BOOL sub_242FD4D7C(uint64_t a1, void *a2)
{
  return sub_242FD4DB0(a1, a2, (void (*)(void))sub_242FC6DA4, (void (*)(void))sub_242F6609C);
}

BOOL sub_242FD4DB0(uint64_t a1, void *a2, void (*a3)(void), void (*a4)(void))
{
  a3(*a2);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v6 = sub_242FDBBF0();
  unint64_t v8 = v7;
  a4();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v6, v8);
  *a2 = v10;
  return v10 != 1;
}

BOOL sub_242FD4EA4(uint64_t a1, unsigned char *a2)
{
  return sub_242FD54F0(a1, a2, (void (*)(void))sub_242F66144);
}

BOOL sub_242FD4EC4(uint64_t a1, _WORD *a2)
{
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v3 = sub_242FDBBF0();
  unint64_t v5 = v4;
  sub_242F418FC();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v3, v5);
  *a2 = v7;
  return v7 != 2;
}

BOOL sub_242FD4FA8(uint64_t a1, uint64_t *a2)
{
  sub_242FC6CCC(*a2);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v3 = sub_242FDBBF0();
  unint64_t v5 = v4;
  sub_242F5D9B4();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v3, v5);
  *(_OWORD *)a2 = v7;
  return (void)v7 != 1;
}

BOOL sub_242FD5098(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B6B30);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_26B0B6B30);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for ActivityDescriptorContentState();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_26B0B8548, (void (*)(uint64_t))type metadata accessor for ActivityDescriptorContentState);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_26B0B6B30);
  sub_242F348F4(a2, (uint64_t)v5, &qword_26B0B6B30);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_26B0B6B30);
  return v14;
}

BOOL sub_242FD52B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5DA00);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_268D5DA00);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for ActivityPlatterDismissalPolicy();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_268D5DA08, (void (*)(uint64_t))type metadata accessor for ActivityPlatterDismissalPolicy);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_268D5DA00);
  sub_242F348F4(a2, (uint64_t)v5, &qword_268D5DA00);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_268D5DA00);
  return v14;
}

BOOL sub_242FD54D0(uint64_t a1, unsigned char *a2)
{
  return sub_242FD54F0(a1, a2, (void (*)(void))sub_242F40C00);
}

BOOL sub_242FD54F0(uint64_t a1, unsigned char *a2, void (*a3)(void))
{
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v5 = sub_242FDBBF0();
  unint64_t v7 = v6;
  a3();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v5, v7);
  *a2 = v9;
  return v9 != 2;
}

BOOL sub_242FD55D8(uint64_t a1, unsigned char *a2)
{
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v3 = sub_242FDBBF0();
  unint64_t v5 = v4;
  sub_242F66048();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v3, v5);
  *a2 = v7;
  return v7 != 4;
}

BOOL sub_242FD56B8(uint64_t a1, void *a2)
{
  return sub_242FD56D8(a1, a2, (void (*)(void))sub_242F4AAAC);
}

BOOL sub_242FD56D8(uint64_t a1, void *a2, void (*a3)(void))
{
  swift_bridgeObjectRelease();
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v5 = sub_242FDBBF0();
  unint64_t v7 = v6;
  a3();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v5, v7);
  *a2 = v9;
  return v9 != 0;
}

BOOL sub_242FD57C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B77C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_26B0B77C0);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for ActivityRequest();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_268D5C1E8, (void (*)(uint64_t))type metadata accessor for ActivityRequest);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_26B0B77C0);
  sub_242F348F4(a2, (uint64_t)v5, &qword_26B0B77C0);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_26B0B77C0);
  return v14;
}

BOOL sub_242FD59E4(uint64_t a1, uint64_t a2)
{
  sub_242FC6C54(*(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void *)(a2 + 24));
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v3 = sub_242FDBBF0();
  unint64_t v5 = v4;
  sub_242F65FF4();
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v3, v5);
  *(void *)a2 = v7;
  *(_OWORD *)(a2 + 8) = v8;
  *(_OWORD *)(a2 + 24) = v9;
  *(_OWORD *)(a2 + 40) = v10;
  return (void)v8 != 1;
}

BOOL sub_242FD5B00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D870);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  long long v8 = &v16[-v7];
  sub_242F34DDC(a2, &qword_268D5D870);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = type metadata accessor for AlertPayload();
  uint64_t v10 = sub_242FDBBF0();
  unint64_t v12 = v11;
  sub_242FDB2D8(&qword_268D5D840, (void (*)(uint64_t))type metadata accessor for AlertPayload);
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v10, v12);
  uint64_t v13 = *(void *)(v9 - 8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v9);
  sub_242F34D78((uint64_t)v8, a2, &qword_268D5D870);
  sub_242F348F4(a2, (uint64_t)v5, &qword_268D5D870);
  BOOL v14 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v9) != 1;
  sub_242F34DDC((uint64_t)v5, &qword_268D5D870);
  return v14;
}

uint64_t ActivityDescriptor.decodeAttributes<A>(for:)()
{
  return swift_release();
}

id ACActivityDescriptor.init(descriptor:)(uint64_t a1)
{
  unsigned int v31 = *(unsigned __int8 *)(a1 + 129);
  unsigned int v32 = *(unsigned __int8 *)(a1 + 128);
  uint64_t v2 = *(void *)(a1 + 104);
  char v3 = *(unsigned char *)(a1 + 112);
  char v4 = *(unsigned char *)(a1 + 113);
  char v5 = *(unsigned char *)(a1 + 114);
  char v6 = *(unsigned char *)(a1 + 115);
  char v7 = *(unsigned char *)(a1 + 116);
  long long v8 = *(void **)(a1 + 120);
  sub_242F34A14(0, &qword_26B0B6B60);
  uint64_t v33 = v2;
  char v34 = v3;
  char v35 = v4;
  char v36 = v5;
  char v37 = v6;
  char v38 = v7;
  uint64_t v39 = v8;
  id v9 = v8;
  swift_bridgeObjectRetain();
  id v30 = sub_242F4C38C(&v33);
  sub_242FDBB60();
  swift_allocObject();
  sub_242FDBB50();
  uint64_t v10 = (int *)type metadata accessor for ActivityDescriptor();
  sub_242FDB2D8(&qword_26B0B76A0, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  uint64_t v11 = sub_242FDBB40();
  unint64_t v13 = v12;
  BOOL v14 = (void *)sub_242FDBBD0();
  sub_242F26068(v11, v13);
  swift_release();
  uint64_t v15 = sub_242FDBBF0();
  unint64_t v17 = v16;

  uint64_t v18 = *(void *)(a1 + v10[14] + 8);
  uint64_t v29 = *(unsigned __int8 *)(a1 + 88);
  swift_bridgeObjectRetain();
  uint64_t v27 = qword_242FEA028[*(char *)(a1 + v10[15])];
  uint64_t v19 = *(void *)(a1 + v10[13] + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v28 = (void *)sub_242FDC0C0();
  uint64_t v20 = (void *)sub_242FDC0C0();
  swift_bridgeObjectRelease();
  uint64_t v21 = (void *)sub_242FDBC00();
  uint64_t v22 = (void *)sub_242FDBBD0();
  if (!v19)
  {
    uint64_t v23 = 0;
    if (v18) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v24 = 0;
    goto LABEL_6;
  }
  uint64_t v23 = (void *)sub_242FDC0C0();
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v24 = (void *)sub_242FDC0C0();
  swift_bridgeObjectRelease();
LABEL_6:
  id v25 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithIdentifier_target_presentationOptions_isEphemeral_isMomentary_createdDate_descriptorData_contentType_remoteDeviceIdentifier_localizedAppName_protectionClass_, v28, v20, v30, v32, v31, v21, v22, v29, v23, v24, v27);
  sub_242F26068(v15, v17);

  sub_242FD8F18(a1);
  return v25;
}

id ActivityDescriptor.acActivityDescriptor.getter()
{
  uint64_t v1 = type metadata accessor for ActivityDescriptor();
  MEMORY[0x270FA5388](v1 - 8);
  char v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242F34A14(0, &qword_26B0B6B58);
  sub_242F4E4DC(v0, (uint64_t)v3);
  return ACActivityDescriptor.init(descriptor:)((uint64_t)v3);
}

uint64_t static DeviceIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return a4 == 0;
  }
  if (!a4) {
    return 0;
  }
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  return sub_242FDC770();
}

uint64_t sub_242FD6194()
{
  if (*v0) {
    return 0x65746F6D6572;
  }
  else {
    return 0x6C61636F6CLL;
  }
}

uint64_t sub_242FD61C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FD9070(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FD61F0(uint64_t a1)
{
  unint64_t v2 = sub_242FD8F74();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD622C(uint64_t a1)
{
  unint64_t v2 = sub_242FD8F74();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FD6268(uint64_t a1)
{
  unint64_t v2 = sub_242FD901C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD62A4(uint64_t a1)
{
  unint64_t v2 = sub_242FD901C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_242FD62E0(uint64_t a1)
{
  unint64_t v2 = sub_242FD8FC8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD631C(uint64_t a1)
{
  unint64_t v2 = sub_242FD8FC8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DeviceIdentifier.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v18 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C908);
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C900);
  uint64_t v16 = *(void *)(v7 - 8);
  uint64_t v17 = v7;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5C8F8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD8F74();
  uint64_t v14 = v20;
  sub_242FDC8A0();
  if (v14)
  {
    char v22 = 1;
    sub_242FD8FC8();
    sub_242FDC6C0();
    sub_242FDC6F0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
  }
  else
  {
    char v21 = 0;
    sub_242FD901C();
    sub_242FDC6C0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t DeviceIdentifier.init(from:)(void *a1)
{
  return sub_242FD9154(a1);
}

uint64_t sub_242FD6658@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_242FD9154(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_242FD6684(void *a1)
{
  return DeviceIdentifier.encode(to:)(a1, *v1, v1[1]);
}

uint64_t ActivityDescriptor.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityDescriptor.attributesType.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t ActivityDescriptor.attributesData.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_242F34D20(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t ActivityDescriptor.platterTarget.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v1 + 72);
  uint64_t v5 = *(void *)(v1 + 80);
  char v6 = *(unsigned char *)(v1 + 88);
  *(void *)a1 = *(void *)(v1 + 48);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return sub_242F47F68();
}

uint64_t ActivityDescriptor.contentSources.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ActivityDescriptor.presentationOptions.getter@<X0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 112);
  char v3 = *(unsigned char *)(v1 + 113);
  char v4 = *(unsigned char *)(v1 + 114);
  char v5 = *(unsigned char *)(v1 + 115);
  char v6 = *(unsigned char *)(v1 + 116);
  uint64_t v7 = *(void **)(v1 + 120);
  *(void *)a1 = *(void *)(v1 + 104);
  *(unsigned char *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 9) = v3;
  *(unsigned char *)(a1 + 10) = v4;
  *(unsigned char *)(a1 + 11) = v5;
  *(unsigned char *)(a1 + 12) = v6;
  *(void *)(a1 + 16) = v7;
  id v8 = v7;

  return swift_bridgeObjectRetain();
}

uint64_t ActivityDescriptor.isEphemeral.getter()
{
  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t ActivityDescriptor.isMomentary.getter()
{
  return *(unsigned __int8 *)(v0 + 129);
}

uint64_t ActivityDescriptor.createdDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ActivityDescriptor() + 48);
  uint64_t v4 = sub_242FDBC30();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t ActivityDescriptor.deviceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityDescriptor() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityDescriptor.localizedAppName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityDescriptor() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityDescriptor.protectionClass.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ActivityDescriptor() + 60));
}

uint64_t ActivityDescriptor.createdBySessionRequest.getter()
{
  if (*(void *)(v0 + 16) == 0x7474417972746E45 && *(void *)(v0 + 24) == 0xEF73657475626972) {
    return 1;
  }
  else {
    return sub_242FDC770();
  }
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:deviceIdentifier:localizedAppName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v17 = *a3;
  uint64_t v18 = a3[1];
  uint64_t v19 = *(void *)(a6 + 32);
  char v20 = *(unsigned char *)(a6 + 40);
  uint64_t v21 = *a7;
  char v22 = *((unsigned char *)a7 + 8);
  char v23 = *((unsigned char *)a7 + 9);
  char v24 = *((unsigned char *)a7 + 10);
  char v25 = *((unsigned char *)a7 + 11);
  char v26 = *((unsigned char *)a7 + 12);
  uint64_t v27 = a7[2];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v17;
  *(void *)(a9 + 24) = v18;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  long long v28 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v28;
  *(void *)(a9 + 80) = v19;
  *(unsigned char *)(a9 + 88) = v20;
  *(unsigned char *)(a9 + 112) = v22;
  *(unsigned char *)(a9 + 113) = v23;
  *(unsigned char *)(a9 + 114) = v24;
  *(unsigned char *)(a9 + 115) = v25;
  *(unsigned char *)(a9 + 116) = v26;
  *(void *)(a9 + 120) = v27;
  *(void *)(a9 + 96) = a8;
  *(void *)(a9 + 104) = v21;
  *(unsigned char *)(a9 + 128) = a10;
  *(unsigned char *)(a9 + 129) = a11;
  uint64_t v29 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v30 = a9 + v29[12];
  uint64_t v31 = sub_242FDBC30();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v30, a12, v31);
  uint64_t v33 = (void *)(a9 + v29[13]);
  *uint64_t v33 = a13;
  v33[1] = a14;
  char v34 = (void *)(a9 + v29[14]);
  void *v34 = a15;
  v34[1] = a16;
  *(unsigned char *)(a9 + v29[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:createdDate:deviceIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14 = *a3;
  uint64_t v15 = a3[1];
  uint64_t v16 = *(void *)(a6 + 32);
  char v17 = *(unsigned char *)(a6 + 40);
  uint64_t v18 = *a7;
  char v19 = *((unsigned char *)a7 + 8);
  char v20 = *((unsigned char *)a7 + 9);
  char v21 = *((unsigned char *)a7 + 10);
  char v22 = *((unsigned char *)a7 + 11);
  char v23 = *((unsigned char *)a7 + 12);
  uint64_t v24 = a7[2];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v14;
  *(void *)(a9 + 24) = v15;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  long long v25 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v25;
  *(void *)(a9 + 80) = v16;
  *(unsigned char *)(a9 + 88) = v17;
  *(unsigned char *)(a9 + 112) = v19;
  *(unsigned char *)(a9 + 113) = v20;
  *(unsigned char *)(a9 + 114) = v21;
  *(unsigned char *)(a9 + 115) = v22;
  *(unsigned char *)(a9 + 116) = v23;
  *(void *)(a9 + 120) = v24;
  *(void *)(a9 + 96) = a8;
  *(void *)(a9 + 104) = v18;
  *(_WORD *)(a9 + 128) = a10;
  char v26 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v27 = a9 + v26[12];
  uint64_t v28 = sub_242FDBC30();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v27, a11, v28);
  uint64_t v30 = (void *)(a9 + v26[13]);
  *uint64_t v30 = a12;
  v30[1] = a13;
  uint64_t v31 = (void *)(a9 + v26[14]);
  void *v31 = 0;
  v31[1] = 0;
  *(unsigned char *)(a9 + v26[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:createdDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, uint64_t a11)
{
  uint64_t v12 = *a3;
  uint64_t v13 = a3[1];
  uint64_t v14 = *(void *)(a6 + 32);
  char v15 = *(unsigned char *)(a6 + 40);
  uint64_t v16 = *a7;
  char v17 = *((unsigned char *)a7 + 8);
  char v18 = *((unsigned char *)a7 + 9);
  char v19 = *((unsigned char *)a7 + 10);
  char v20 = *((unsigned char *)a7 + 11);
  char v21 = *((unsigned char *)a7 + 12);
  uint64_t v22 = a7[2];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v12;
  *(void *)(a9 + 24) = v13;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  long long v23 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v23;
  *(void *)(a9 + 80) = v14;
  *(unsigned char *)(a9 + 88) = v15;
  *(unsigned char *)(a9 + 112) = v17;
  *(unsigned char *)(a9 + 113) = v18;
  *(unsigned char *)(a9 + 114) = v19;
  *(unsigned char *)(a9 + 115) = v20;
  *(unsigned char *)(a9 + 116) = v21;
  *(void *)(a9 + 120) = v22;
  *(void *)(a9 + 96) = a8;
  *(void *)(a9 + 104) = v16;
  *(_WORD *)(a9 + 128) = a10;
  uint64_t v24 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v25 = a9 + v24[12];
  uint64_t v26 = sub_242FDBC30();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 32))(v25, a11, v26);
  uint64_t v28 = (void *)(a9 + v24[13]);
  *uint64_t v28 = 0;
  v28[1] = 0;
  uint64_t v29 = (void *)(a9 + v24[14]);
  *uint64_t v29 = 0;
  v29[1] = 0;
  *(unsigned char *)(a9 + v24[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:deviceIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15 = *a3;
  uint64_t v16 = a3[1];
  uint64_t v17 = *(void *)(a6 + 32);
  char v18 = *(unsigned char *)(a6 + 40);
  uint64_t v19 = *a7;
  char v20 = *((unsigned char *)a7 + 8);
  char v21 = *((unsigned char *)a7 + 9);
  char v22 = *((unsigned char *)a7 + 10);
  char v23 = *((unsigned char *)a7 + 11);
  char v24 = *((unsigned char *)a7 + 12);
  uint64_t v25 = a7[2];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v15;
  *(void *)(a9 + 24) = v16;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  long long v26 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v26;
  *(void *)(a9 + 80) = v17;
  *(unsigned char *)(a9 + 88) = v18;
  *(unsigned char *)(a9 + 112) = v20;
  *(unsigned char *)(a9 + 113) = v21;
  *(unsigned char *)(a9 + 114) = v22;
  *(unsigned char *)(a9 + 115) = v23;
  *(unsigned char *)(a9 + 116) = v24;
  *(void *)(a9 + 120) = v25;
  *(void *)(a9 + 96) = a8;
  *(void *)(a9 + 104) = v19;
  *(unsigned char *)(a9 + 128) = a10;
  *(unsigned char *)(a9 + 129) = a11;
  uint64_t v27 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v28 = a9 + v27[12];
  uint64_t v29 = sub_242FDBC30();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 32))(v28, a12, v29);
  uint64_t v31 = (void *)(a9 + v27[13]);
  void *v31 = a13;
  v31[1] = a14;
  unsigned int v32 = (void *)(a9 + v27[14]);
  *unsigned int v32 = 0;
  v32[1] = 0;
  *(unsigned char *)(a9 + v27[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12)
{
  uint64_t v13 = *a3;
  uint64_t v14 = a3[1];
  uint64_t v15 = *(void *)(a6 + 32);
  char v16 = *(unsigned char *)(a6 + 40);
  uint64_t v17 = *a7;
  char v18 = *((unsigned char *)a7 + 8);
  char v19 = *((unsigned char *)a7 + 9);
  char v20 = *((unsigned char *)a7 + 10);
  char v21 = *((unsigned char *)a7 + 11);
  char v22 = *((unsigned char *)a7 + 12);
  uint64_t v23 = a7[2];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v13;
  *(void *)(a9 + 24) = v14;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  long long v24 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v24;
  *(void *)(a9 + 80) = v15;
  *(unsigned char *)(a9 + 88) = v16;
  *(unsigned char *)(a9 + 112) = v18;
  *(unsigned char *)(a9 + 113) = v19;
  *(unsigned char *)(a9 + 114) = v20;
  *(unsigned char *)(a9 + 115) = v21;
  *(unsigned char *)(a9 + 116) = v22;
  *(void *)(a9 + 120) = v23;
  *(void *)(a9 + 96) = a8;
  *(void *)(a9 + 104) = v17;
  *(unsigned char *)(a9 + 128) = a10;
  *(unsigned char *)(a9 + 129) = a11;
  uint64_t v25 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v26 = a9 + v25[12];
  uint64_t v27 = sub_242FDBC30();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v26, a12, v27);
  uint64_t v29 = (void *)(a9 + v25[13]);
  *uint64_t v29 = 0;
  v29[1] = 0;
  uint64_t v30 = (void *)(a9 + v25[14]);
  *uint64_t v30 = 0;
  v30[1] = 0;
  *(unsigned char *)(a9 + v25[15]) = 4;
  return result;
}

uint64_t ActivityDescriptor.init(id:attributesType:attributesData:platterTarget:presentationOptions:contentSources:isEphemeral:isMomentary:createdDate:deviceIdentifier:protectionClass:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v16 = *a3;
  uint64_t v17 = a3[1];
  uint64_t v18 = *(void *)(a6 + 32);
  char v19 = *(unsigned char *)(a6 + 40);
  uint64_t v20 = *a7;
  char v21 = *((unsigned char *)a7 + 8);
  char v22 = *((unsigned char *)a7 + 9);
  char v23 = *((unsigned char *)a7 + 10);
  char v24 = *((unsigned char *)a7 + 11);
  char v25 = *((unsigned char *)a7 + 12);
  uint64_t v26 = a7[2];
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = v16;
  *(void *)(a9 + 24) = v17;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  long long v27 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a9 + 48) = *(_OWORD *)a6;
  *(_OWORD *)(a9 + 64) = v27;
  *(void *)(a9 + 80) = v18;
  *(unsigned char *)(a9 + 88) = v19;
  *(unsigned char *)(a9 + 112) = v21;
  *(unsigned char *)(a9 + 113) = v22;
  *(unsigned char *)(a9 + 114) = v23;
  *(unsigned char *)(a9 + 115) = v24;
  *(unsigned char *)(a9 + 116) = v25;
  *(void *)(a9 + 120) = v26;
  *(void *)(a9 + 96) = a8;
  *(void *)(a9 + 104) = v20;
  *(unsigned char *)(a9 + 128) = a10;
  *(unsigned char *)(a9 + 129) = a11;
  uint64_t v28 = (int *)type metadata accessor for ActivityDescriptor();
  uint64_t v29 = a9 + v28[12];
  uint64_t v30 = sub_242FDBC30();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v29, a12, v30);
  unsigned int v32 = (void *)(a9 + v28[13]);
  *unsigned int v32 = a13;
  v32[1] = a14;
  uint64_t v33 = (void *)(a9 + v28[14]);
  *uint64_t v33 = 0;
  v33[1] = 0;
  *(unsigned char *)(a9 + v28[15]) = a15;
  return result;
}

uint64_t ActivityDescriptor.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_242FDC110();

  return swift_bridgeObjectRelease();
}

unint64_t sub_242FD7028(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0x7475626972747461;
      break;
    case 3:
      unint64_t result = 0x5472657474616C70;
      break;
    case 4:
      unint64_t result = 0x53746E65746E6F63;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0x656D656870457369;
      break;
    case 7:
      unint64_t result = 0x746E656D6F4D7369;
      break;
    case 8:
      unint64_t result = 0x4464657461657263;
      break;
    case 9:
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 11:
      unint64_t result = 0x69746365746F7270;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_242FD71D0()
{
  return sub_242FD7028(*v0);
}

uint64_t sub_242FD71D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_242FDAD48(a1, a2);
  *a3 = result;
  return result;
}

void sub_242FD7200(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_242FD720C(uint64_t a1)
{
  unint64_t v2 = sub_242FD95E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD7248(uint64_t a1)
{
  unint64_t v2 = sub_242FD95E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ActivityDescriptor.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7770);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD95E8();
  sub_242FDC8A0();
  LOBYTE(v21) = 0;
  sub_242FDC6F0();
  if (!v2)
  {
    uint64_t v9 = *(void *)(v3 + 24);
    *(void *)&long long v21 = *(void *)(v3 + 16);
    *((void *)&v21 + 1) = v9;
    char v25 = 1;
    sub_242F727A4();
    sub_242FDC720();
    long long v21 = *(_OWORD *)(v3 + 32);
    char v25 = 2;
    sub_242F4D898();
    sub_242FDC720();
    uint64_t v10 = *(void *)(v3 + 80);
    char v11 = *(unsigned char *)(v3 + 88);
    long long v12 = *(_OWORD *)(v3 + 64);
    long long v21 = *(_OWORD *)(v3 + 48);
    long long v22 = v12;
    uint64_t v23 = v10;
    char v24 = v11;
    char v25 = 3;
    sub_242F4867C();
    sub_242FDC720();
    *(void *)&long long v21 = *(void *)(v3 + 96);
    char v25 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B84D8);
    sub_242FD9690(&qword_26B0B7768, (void (*)(void))sub_242FD963C);
    sub_242FDC720();
    char v13 = *(unsigned char *)(v3 + 112);
    char v14 = *(unsigned char *)(v3 + 113);
    char v15 = *(unsigned char *)(v3 + 114);
    char v16 = *(unsigned char *)(v3 + 115);
    char v17 = *(unsigned char *)(v3 + 116);
    uint64_t v18 = *(void *)(v3 + 120);
    *(void *)&long long v21 = *(void *)(v3 + 104);
    BYTE8(v21) = v13;
    BYTE9(v21) = v14;
    BYTE10(v21) = v15;
    BYTE11(v21) = v16;
    BYTE12(v21) = v17;
    *(void *)&long long v22 = v18;
    char v25 = 5;
    sub_242FAD680();
    sub_242FDC720();
    LOBYTE(v21) = 6;
    sub_242FDC700();
    LOBYTE(v21) = 7;
    sub_242FDC700();
    uint64_t v19 = type metadata accessor for ActivityDescriptor();
    LOBYTE(v21) = 8;
    sub_242FDBC30();
    sub_242FDB2D8(&qword_26B0B7E68, MEMORY[0x263F07490]);
    sub_242FDC720();
    long long v21 = *(_OWORD *)(v3 + *(int *)(v19 + 52));
    char v25 = 9;
    sub_242F48628();
    sub_242FDC720();
    LOBYTE(v21) = 10;
    sub_242FDC6D0();
    LOBYTE(v21) = *(unsigned char *)(v3 + *(int *)(v19 + 60));
    char v25 = 11;
    sub_242FAD728();
    sub_242FDC6E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ActivityDescriptor.hashValue.getter()
{
  return sub_242FDC880();
}

void ActivityDescriptor.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_242FDBC30();
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8128);
  uint64_t v8 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = (int *)type metadata accessor for ActivityDescriptor();
  MEMORY[0x270FA5388](v33);
  long long v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  unsigned int v32 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_242FD95E8();
  sub_242FDC890();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else
  {
    uint64_t v28 = a2;
    LOBYTE(v34) = 0;
    *(void *)long long v12 = sub_242FDC660();
    *((void *)v12 + 1) = v14;
    char v38 = 1;
    sub_242F660F0();
    sub_242FDC690();
    uint64_t v15 = *((void *)&v34 + 1);
    *((void *)v12 + 2) = v34;
    *((void *)v12 + 3) = v15;
    char v38 = 2;
    sub_242F4D6D4();
    sub_242FDC690();
    *((_OWORD *)v12 + 2) = v34;
    char v38 = 3;
    sub_242F48D94();
    sub_242FDC690();
    uint64_t v16 = v36;
    char v17 = v37;
    long long v18 = v35;
    *((_OWORD *)v12 + 3) = v34;
    *((_OWORD *)v12 + 4) = v18;
    *((void *)v12 + 10) = v16;
    v12[88] = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B84D8);
    char v38 = 4;
    sub_242FD9690(&qword_26B0B8188, (void (*)(void))sub_242FD9700);
    sub_242FDC690();
    *((void *)v12 + 12) = v34;
    char v38 = 5;
    sub_242FAD7D0();
    sub_242FDC690();
    char v19 = BYTE8(v34);
    char v20 = BYTE9(v34);
    char v21 = BYTE10(v34);
    char v22 = BYTE11(v34);
    char v23 = BYTE12(v34);
    uint64_t v24 = v35;
    *((void *)v12 + 13) = v34;
    v12[112] = v19;
    v12[113] = v20;
    v12[114] = v21;
    v12[115] = v22;
    v12[116] = v23;
    *((void *)v12 + 15) = v24;
    LOBYTE(v34) = 6;
    v12[128] = sub_242FDC670() & 1;
    LOBYTE(v34) = 7;
    v12[129] = sub_242FDC670() & 1;
    LOBYTE(v34) = 8;
    sub_242FDB2D8(&qword_26B0B83F0, MEMORY[0x263F07490]);
    sub_242FDC690();
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v12[v33[12]], v7, v31);
    char v38 = 9;
    sub_242F48D40();
    sub_242FDC690();
    *(_OWORD *)&v12[v33[13]] = v34;
    LOBYTE(v34) = 10;
    uint64_t v25 = sub_242FDC630();
    uint64_t v26 = (uint64_t *)&v12[v33[14]];
    *uint64_t v26 = v25;
    v26[1] = v27;
    char v38 = 11;
    sub_242FAD8E8();
    sub_242FDC650();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v29);
    v12[v33[15]] = v34;
    sub_242F4E4DC((uint64_t)v12, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    sub_242FD8F18((uint64_t)v12);
  }
}

void sub_242FD7FD0(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_242FD7FE8(void *a1)
{
  return ActivityDescriptor.encode(to:)(a1);
}

uint64_t sub_242FD8000()
{
  return sub_242FDC880();
}

uint64_t sub_242FD805C()
{
  swift_bridgeObjectRetain();
  sub_242FDC110();

  return swift_bridgeObjectRelease();
}

uint64_t sub_242FD80B4()
{
  return sub_242FDC880();
}

uint64_t sub_242FD8110()
{
  sub_242FDBB60();
  swift_allocObject();
  sub_242FDBB50();
  sub_242FDB2D8(&qword_26B0B76A0, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  uint64_t v0 = sub_242FDBB40();
  unint64_t v2 = v1;
  uint64_t v3 = sub_242FDBBD0();
  sub_242F26068(v0, v2);
  swift_release();
  return v3;
}

uint64_t sub_242FD81F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B7D78);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v8 = sub_242FDBBF0();
  unint64_t v10 = v9;
  sub_242FDB2D8(&qword_26B0B8170, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  sub_242FDBB10();
  sub_242F34DDC(a2, &qword_26B0B7D78);
  sub_242F26068(v8, v10);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v7, 0, 1, a3);
  return sub_242F34D78((uint64_t)v7, a2, &qword_26B0B7D78);
}

ActivityKit::XPCCodableActivityDescriptors __swiftcall XPCCodableActivityDescriptors.init(descriptors:)(ActivityKit::XPCCodableActivityDescriptors descriptors)
{
  v1->descriptors._rawValue = descriptors.descriptors._rawValue;
  return descriptors;
}

uint64_t sub_242FD83C0()
{
  return 0x7470697263736564;
}

uint64_t sub_242FD83E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7470697263736564 && a2 == 0xEB0000000073726FLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_242FDC770();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_242FD8490(uint64_t a1)
{
  unint64_t v2 = sub_242FD9754();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_242FD84CC(uint64_t a1)
{
  unint64_t v2 = sub_242FD9754();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t XPCCodableActivityDescriptors.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5EB48);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD9754();
  sub_242FDC8A0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D498);
  sub_242FD97A8(&qword_268D5EB58, &qword_26B0B76A0);
  sub_242FDC720();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t XPCCodableActivityDescriptors.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D5EB60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD9754();
  sub_242FDC890();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D498);
    sub_242FD97A8(&qword_268D5EB68, &qword_26B0B8170);
    sub_242FDC690();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_242FD8840@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return XPCCodableActivityDescriptors.init(from:)(a1, a2);
}

uint64_t sub_242FD8858(void *a1)
{
  return XPCCodableActivityDescriptors.encode(to:)(a1);
}

uint64_t sub_242FD8870()
{
  sub_242FDBB60();
  swift_allocObject();
  sub_242FDBB50();
  sub_242FD9968();
  uint64_t v0 = sub_242FDBB40();
  unint64_t v2 = v1;
  uint64_t v3 = sub_242FDBBD0();
  sub_242F26068(v0, v2);
  swift_release();
  return v3;
}

BOOL sub_242FD8930(uint64_t a1, void *a2)
{
  return sub_242FD56D8(a1, a2, (void (*)(void))sub_242F34CB8);
}

uint64_t _s11ActivityKit0A10DescriptorV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (v5 = sub_242FDC770(), uint64_t result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (v8 = sub_242FDC770(), uint64_t result = 0, (v8 & 1) != 0))
    {
      if ((sub_242FD0788(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a2 + 32), *(void *)(a2 + 40)) & 1) == 0) {
        return 0;
      }
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a2 + 48);
      uint64_t v11 = *(void *)(a2 + 56);
      if (*(unsigned char *)(a1 + 88))
      {
        if (*(unsigned char *)(a2 + 88))
        {
          if (v10 != v12 || v9 != v11) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }
      }
      else if ((*(unsigned char *)(a2 + 88) & 1) == 0)
      {
        if (v10 != v12 || v9 != v11)
        {
LABEL_22:
          char v41 = sub_242FDC770();
          sub_242F47F68();
          sub_242F47F68();
          sub_242F4952C();
          sub_242F4952C();
          uint64_t result = 0;
          if ((v41 & 1) == 0) {
            return result;
          }
          goto LABEL_23;
        }
LABEL_21:
        sub_242F47F68();
        sub_242F47F68();
        sub_242F4952C();
        sub_242F4952C();
LABEL_23:
        if ((sub_242F730B8(*(void *)(a1 + 96), *(void *)(a2 + 96)) & 1) == 0) {
          return 0;
        }
        char v13 = *(unsigned char *)(a1 + 112);
        char v14 = *(unsigned char *)(a1 + 113);
        char v15 = *(unsigned char *)(a1 + 114);
        char v16 = *(unsigned char *)(a1 + 115);
        char v17 = *(unsigned char *)(a1 + 116);
        uint64_t v18 = *(void *)(a1 + 120);
        uint64_t v49 = *(void *)(a1 + 104);
        char v50 = v13;
        char v51 = v14;
        char v52 = v15;
        char v53 = v16;
        char v54 = v17;
        uint64_t v55 = v18;
        char v19 = *(unsigned char *)(a2 + 112);
        char v20 = *(unsigned char *)(a2 + 113);
        char v21 = *(unsigned char *)(a2 + 114);
        char v22 = *(unsigned char *)(a2 + 115);
        char v23 = *(unsigned char *)(a2 + 116);
        uint64_t v24 = *(void *)(a2 + 120);
        uint64_t v42 = *(void *)(a2 + 104);
        char v43 = v19;
        char v44 = v20;
        char v45 = v21;
        char v46 = v22;
        char v47 = v23;
        uint64_t v48 = v24;
        if ((_s11ActivityKit0A19PresentationOptionsV2eeoiySbAC_ACtFZ_0((uint64_t)&v49, (uint64_t)&v42) & 1) == 0) {
          return 0;
        }
        if (*(unsigned __int8 *)(a1 + 128) != *(unsigned __int8 *)(a2 + 128)) {
          return 0;
        }
        if (*(unsigned __int8 *)(a1 + 129) != *(unsigned __int8 *)(a2 + 129)) {
          return 0;
        }
        uint64_t v25 = (int *)type metadata accessor for ActivityDescriptor();
        if ((_s11ActivityKit0A13EndingOptionsV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
          return 0;
        }
        uint64_t v26 = v25[13];
        uint64_t v27 = (void *)(a1 + v26);
        uint64_t v28 = *(void *)(a1 + v26 + 8);
        uint64_t v29 = (void *)(a2 + v26);
        uint64_t v30 = v29[1];
        if (v28)
        {
          if (!v30) {
            return 0;
          }
          if (*v27 != *v29 || v28 != v30)
          {
            char v31 = sub_242FDC770();
            uint64_t result = 0;
            if ((v31 & 1) == 0) {
              return result;
            }
          }
        }
        else if (v30)
        {
          return 0;
        }
        uint64_t v32 = v25[14];
        uint64_t v33 = (void *)(a1 + v32);
        uint64_t v34 = *(void *)(a1 + v32 + 8);
        long long v35 = (void *)(a2 + v32);
        uint64_t v36 = v35[1];
        if (v34)
        {
          if (v36)
          {
            if (*v33 != *v35 || v34 != v36)
            {
              char v37 = sub_242FDC770();
              uint64_t result = 0;
              if ((v37 & 1) == 0) {
                return result;
              }
            }
LABEL_42:
            uint64_t v38 = v25[15];
            int v39 = *(unsigned __int8 *)(a1 + v38);
            int v40 = *(unsigned __int8 *)(a2 + v38);
            if (v39 == 4)
            {
              if (v40 != 4) {
                return 0;
              }
            }
            else if (v40 == 4 || v39 != v40)
            {
              return 0;
            }
            return 1;
          }
        }
        else if (!v36)
        {
          goto LABEL_42;
        }
        return 0;
      }
      sub_242F47F68();
      sub_242F47F68();
      sub_242F4952C();
      sub_242F4952C();
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ActivityDescriptor()
{
  uint64_t result = qword_26B0B8D18;
  if (!qword_26B0B8D18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_242FD8F18(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivityDescriptor();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_242FD8F74()
{
  unint64_t result = qword_26B0B81F0;
  if (!qword_26B0B81F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B81F0);
  }
  return result;
}

unint64_t sub_242FD8FC8()
{
  unint64_t result = qword_268D5EB40;
  if (!qword_268D5EB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB40);
  }
  return result;
}

unint64_t sub_242FD901C()
{
  unint64_t result = qword_26B0B8208;
  if (!qword_26B0B8208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8208);
  }
  return result;
}

uint64_t sub_242FD9070(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_242FD9154(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8168);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8160);
  uint64_t v27 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0B8158);
  uint64_t v26 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FD8F74();
  uint64_t v13 = (uint64_t)v28;
  sub_242FDC890();
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v14 = v27;
  uint64_t v23 = v6;
  uint64_t v28 = a1;
  uint64_t v15 = sub_242FDC6A0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v19 = sub_242FDC510();
    swift_allocError();
    char v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D5D6F0);
    *char v21 = &type metadata for DeviceIdentifier;
    uint64_t v12 = (uint64_t)v11;
    sub_242FDC620();
    sub_242FDC500();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    a1 = v28;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v12;
  }
  if (*(unsigned char *)(v15 + 32))
  {
    char v30 = 1;
    sub_242FD8FC8();
    sub_242FDC610();
    uint64_t v16 = v24;
    uint64_t v12 = sub_242FDC660();
    char v17 = v5;
    uint64_t v18 = v26;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v9);
  }
  else
  {
    char v29 = 0;
    sub_242FD901C();
    sub_242FDC610();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    uint64_t v12 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v12;
}

unint64_t sub_242FD95E8()
{
  unint64_t result = qword_26B0B83F8;
  if (!qword_26B0B83F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B83F8);
  }
  return result;
}

unint64_t sub_242FD963C()
{
  unint64_t result = qword_26B0B7750;
  if (!qword_26B0B7750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B7750);
  }
  return result;
}

uint64_t sub_242FD9690(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B0B84D8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_242FD9700()
{
  unint64_t result = qword_26B0B8178;
  if (!qword_26B0B8178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8178);
  }
  return result;
}

unint64_t sub_242FD9754()
{
  unint64_t result = qword_268D5EB50;
  if (!qword_268D5EB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB50);
  }
  return result;
}

uint64_t sub_242FD97A8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D5D498);
    sub_242FDB2D8(a2, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_242FD983C()
{
  return sub_242FDB2D8(&qword_268D5D4A0, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
}

uint64_t sub_242FD9884(void *a1)
{
  a1[1] = sub_242FDB2D8(&qword_26B0B8170, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  a1[2] = sub_242FDB2D8(&qword_26B0B76A0, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  uint64_t result = sub_242FDB2D8(&qword_26B0B7538, (void (*)(uint64_t))type metadata accessor for ActivityDescriptor);
  a1[3] = result;
  return result;
}

unint64_t sub_242FD9930(void *a1)
{
  a1[1] = sub_242F34CB8();
  a1[2] = sub_242FD9968();
  unint64_t result = sub_242FD99BC();
  a1[3] = result;
  return result;
}

unint64_t sub_242FD9968()
{
  unint64_t result = qword_268D5EB70;
  if (!qword_268D5EB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB70);
  }
  return result;
}

unint64_t sub_242FD99BC()
{
  unint64_t result = qword_268D5EB78;
  if (!qword_268D5EB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB78);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceIdentifier()
{
  return &type metadata for DeviceIdentifier;
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityDescriptor(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v32 = *a2;
    *(void *)a1 = *a2;
    a1 = v32 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[4];
    unint64_t v10 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_242F34D20(v9, v10);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    uint64_t v11 = a2[6];
    uint64_t v12 = a2[7];
    uint64_t v13 = a2[8];
    uint64_t v14 = a2[9];
    uint64_t v15 = a2[10];
    char v16 = *((unsigned char *)a2 + 88);
    sub_242F47F68();
    *(void *)(a1 + 48) = v11;
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v13;
    *(void *)(a1 + 72) = v14;
    *(void *)(a1 + 80) = v15;
    *(unsigned char *)(a1 + 88) = v16;
    uint64_t v17 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v17;
    *(_DWORD *)(a1 + 112) = *((_DWORD *)a2 + 28);
    *(unsigned char *)(a1 + 116) = *((unsigned char *)a2 + 116);
    uint64_t v18 = (void *)a2[15];
    *(void *)(a1 + 120) = v18;
    *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
    uint64_t v19 = a3[12];
    uint64_t v34 = a1 + v19;
    uint64_t v20 = (uint64_t)a2 + v19;
    *(unsigned char *)(a1 + 129) = *((unsigned char *)a2 + 129);
    uint64_t v21 = sub_242FDBC30();
    char v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v23 = v18;
    v22(v34, v20, v21);
    uint64_t v24 = a3[13];
    uint64_t v25 = a3[14];
    uint64_t v26 = (void *)(a1 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    char v29 = (void *)(a1 + v25);
    char v30 = (uint64_t *)((char *)a2 + v25);
    uint64_t v31 = v30[1];
    *char v29 = *v30;
    v29[1] = v31;
    *(unsigned char *)(a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ActivityDescriptor(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_242F26068(*(void *)(a1 + 32), *(void *)(a1 + 40));
  sub_242F4952C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = sub_242FDBC30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 32);
  unint64_t v9 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_242F34D20(v8, v9);
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v12 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  char v15 = *(unsigned char *)(a2 + 88);
  sub_242F47F68();
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(unsigned char *)(a1 + 88) = v15;
  uint64_t v16 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v16;
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(a2 + 116);
  uint64_t v17 = *(void **)(a2 + 120);
  *(void *)(a1 + 120) = v17;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v18 = a3[12];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  uint64_t v21 = sub_242FDBC30();
  char v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v23 = v17;
  v22(v19, v20, v21);
  uint64_t v24 = a3[13];
  uint64_t v25 = a3[14];
  uint64_t v26 = (void *)(a1 + v24);
  uint64_t v27 = (void *)(a2 + v24);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  char v29 = (void *)(a1 + v25);
  char v30 = (void *)(a2 + v25);
  uint64_t v31 = v30[1];
  *char v29 = *v30;
  v29[1] = v31;
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  unint64_t v7 = *(void *)(a2 + 40);
  sub_242F34D20(v6, v7);
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  sub_242F26068(v8, v9);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v12 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  char v15 = *(unsigned char *)(a2 + 88);
  sub_242F47F68();
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(unsigned char *)(a1 + 88) = v15;
  sub_242F4952C();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  *(unsigned char *)(a1 + 115) = *(unsigned char *)(a2 + 115);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(a2 + 116);
  uint64_t v16 = *(void **)(a1 + 120);
  uint64_t v17 = *(void **)(a2 + 120);
  *(void *)(a1 + 120) = v17;
  id v18 = v17;

  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  uint64_t v19 = a3[12];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_242FDBC30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  uint64_t v23 = a3[13];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[14];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  void *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  return a1;
}

uint64_t initializeWithTake for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  long long v8 = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  uint64_t v9 = a3[12];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(_OWORD *)(a1 + 104) = v8;
  uint64_t v12 = sub_242FDBC30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for ActivityDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_242F26068(v8, v9);
  uint64_t v10 = *(void *)(a2 + 80);
  char v11 = *(unsigned char *)(a2 + 88);
  long long v12 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v12;
  *(void *)(a1 + 80) = v10;
  *(unsigned char *)(a1 + 88) = v11;
  sub_242F4952C();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(unsigned char *)(a1 + 113) = *(unsigned char *)(a2 + 113);
  *(unsigned char *)(a1 + 114) = *(unsigned char *)(a2 + 114);
  *(unsigned char *)(a1 + 115) = *(unsigned char *)(a2 + 115);
  *(unsigned char *)(a1 + 116) = *(unsigned char *)(a2 + 116);
  uint64_t v13 = *(void **)(a1 + 120);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);

  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 129) = *(unsigned char *)(a2 + 129);
  uint64_t v14 = a3[12];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_242FDBC30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  uint64_t v18 = a3[13];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[14];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityDescriptor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_242FDA318);
}

uint64_t sub_242FDA318(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_242FDBC30();
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 48);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_242FDA3DC);
}

uint64_t sub_242FDA3DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_242FDBC30();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 48);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_242FDA484()
{
  uint64_t result = sub_242FDBC30();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodableActivityDescriptors()
{
  return &type metadata for XPCCodableActivityDescriptors;
}

ValueMetadata *type metadata accessor for XPCCodableActivityDescriptors.CodingKeys()
{
  return &type metadata for XPCCodableActivityDescriptors.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ActivityDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0x242FDA658);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityDescriptor.CodingKeys()
{
  return &type metadata for ActivityDescriptor.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DeviceIdentifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x242FDA75CLL);
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

ValueMetadata *type metadata accessor for DeviceIdentifier.CodingKeys()
{
  return &type metadata for DeviceIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for DeviceIdentifier.LocalCodingKeys()
{
  return &type metadata for DeviceIdentifier.LocalCodingKeys;
}

unsigned char *_s11ActivityKit29XPCCodableActivityDescriptorsV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x242FDA840);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceIdentifier.RemoteCodingKeys()
{
  return &type metadata for DeviceIdentifier.RemoteCodingKeys;
}

unint64_t sub_242FDA87C()
{
  unint64_t result = qword_268D5EB80;
  if (!qword_268D5EB80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB80);
  }
  return result;
}

unint64_t sub_242FDA8D4()
{
  unint64_t result = qword_268D5EB88;
  if (!qword_268D5EB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB88);
  }
  return result;
}

unint64_t sub_242FDA92C()
{
  unint64_t result = qword_268D5EB90;
  if (!qword_268D5EB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB90);
  }
  return result;
}

unint64_t sub_242FDA984()
{
  unint64_t result = qword_268D5EB98;
  if (!qword_268D5EB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EB98);
  }
  return result;
}

unint64_t sub_242FDA9DC()
{
  unint64_t result = qword_268D5EBA0;
  if (!qword_268D5EBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EBA0);
  }
  return result;
}

unint64_t sub_242FDAA34()
{
  unint64_t result = qword_268D5EBA8;
  if (!qword_268D5EBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D5EBA8);
  }
  return result;
}

unint64_t sub_242FDAA8C()
{
  unint64_t result = qword_26B0B8408;
  if (!qword_26B0B8408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8408);
  }
  return result;
}

unint64_t sub_242FDAAE4()
{
  unint64_t result = qword_26B0B8400;
  if (!qword_26B0B8400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8400);
  }
  return result;
}

unint64_t sub_242FDAB3C()
{
  unint64_t result = qword_26B0B8218;
  if (!qword_26B0B8218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8218);
  }
  return result;
}

unint64_t sub_242FDAB94()
{
  unint64_t result = qword_26B0B8210;
  if (!qword_26B0B8210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8210);
  }
  return result;
}

unint64_t sub_242FDABEC()
{
  unint64_t result = qword_26B0B8228;
  if (!qword_26B0B8228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8228);
  }
  return result;
}

unint64_t sub_242FDAC44()
{
  unint64_t result = qword_26B0B8220;
  if (!qword_26B0B8220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8220);
  }
  return result;
}

unint64_t sub_242FDAC9C()
{
  unint64_t result = qword_26B0B8200;
  if (!qword_26B0B8200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B8200);
  }
  return result;
}

unint64_t sub_242FDACF4()
{
  unint64_t result = qword_26B0B81F8;
  if (!qword_26B0B81F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0B81F8);
  }
  return result;
}

uint64_t sub_242FDAD48(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEE00657079547365 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEE00617461447365 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x5472657474616C70 && a2 == 0xED00007465677261 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x53746E65746E6F63 && a2 == 0xEE0073656372756FLL || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000242FECA90 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x656D656870457369 && a2 == 0xEB000000006C6172 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x746E656D6F4D7369 && a2 == 0xEB00000000797261 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x4464657461657263 && a2 == 0xEB00000000657461 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000242FEB060 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000242FED090 || (sub_242FDC770() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x69746365746F7270 && a2 == 0xEF7373616C436E6FLL)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_242FDC770();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_242FDB2D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OpaqueObjectiveCBridgable<>._bridgeToObjectiveC()()
{
  sub_242FDBB60();
  swift_allocObject();
  sub_242FDBB50();
  uint64_t v0 = sub_242FDBB40();
  unint64_t v2 = v1;
  uint64_t v3 = sub_242FDBBD0();
  sub_242F26068(v0, v2);
  swift_release();
  return v3;
}

uint64_t static OpaqueObjectiveCBridgable<>._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_242FDC430();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - v7;
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v9 = sub_242FDBBF0();
  unint64_t v11 = v10;
  sub_242FDBB10();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_242F26068(v9, v11);
  swift_release();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(v8, 0, 1, a3);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
}

BOOL static OpaqueObjectiveCBridgable<>._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_242FDC430();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v10 = MEMORY[0x270FA5388](v9);
  long long v12 = (char *)&v20 - v11;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, double))(v6 + 8);
  uint64_t v22 = a2;
  v21(a2, v5, v10);
  sub_242FDBB30();
  swift_allocObject();
  sub_242FDBB20();
  uint64_t v13 = sub_242FDBBF0();
  unint64_t v15 = v14;
  sub_242FDBB10();
  swift_release();
  sub_242F26068(v13, v15);
  uint64_t v16 = *(void *)(a3 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, a3);
  uint64_t v17 = v22;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v22, v12, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v17, v5);
  BOOL v18 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v8, 1, a3) != 1;
  ((void (*)(char *, uint64_t))v21)(v8, v5);
  return v18;
}

uint64_t static OpaqueObjectiveCBridgable<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_242FDC430();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.n128_f64[0] = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v16 - v12;
  uint64_t v14 = *(void *)(a2 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v14 + 56))((char *)&v16 - v12, 1, 1, a2, v11);
  if (a1)
  {
    sub_242FDC5F0();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v13, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, a2) != 1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a3, v9, a2);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return sub_242FDB9D0();
}

uint64_t sub_242FDB9D0()
{
  return MEMORY[0x270EEDD18]();
}

uint64_t sub_242FDB9E0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_242FDB9F0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_242FDBA00()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_242FDBA10()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_242FDBA20()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_242FDBA30()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_242FDBA40()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_242FDBA50()
{
  return MEMORY[0x270EEDFF0]();
}

uint64_t sub_242FDBA60()
{
  return MEMORY[0x270EEE058]();
}

uint64_t sub_242FDBA70()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_242FDBA80()
{
  return MEMORY[0x270EEE440]();
}

uint64_t sub_242FDBA90()
{
  return MEMORY[0x270EEE450]();
}

uint64_t sub_242FDBAA0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_242FDBAB0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_242FDBAC0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_242FDBAD0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_242FDBAE0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_242FDBAF0()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_242FDBB00()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_242FDBB10()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_242FDBB20()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_242FDBB30()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_242FDBB40()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_242FDBB50()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_242FDBB60()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_242FDBB70()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_242FDBB80()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_242FDBB90()
{
  return MEMORY[0x270EEF890]();
}

uint64_t sub_242FDBBA0()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_242FDBBB0()
{
  return MEMORY[0x270EEFA38]();
}

uint64_t sub_242FDBBC0()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_242FDBBD0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_242FDBBE0()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_242FDBBF0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_242FDBC00()
{
  return MEMORY[0x270EF0998]();
}

uint64_t _s11ActivityKit0A13EndingOptionsV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_242FDBC20()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_242FDBC30()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_242FDBC40()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_242FDBC50()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_242FDBC60()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_242FDBC70()
{
  return MEMORY[0x270FA1158]();
}

uint64_t sub_242FDBC80()
{
  return MEMORY[0x270F5D028]();
}

uint64_t sub_242FDBC90()
{
  return MEMORY[0x270F5D030]();
}

uint64_t sub_242FDBCA0()
{
  return MEMORY[0x270F5D038]();
}

uint64_t sub_242FDBCB0()
{
  return MEMORY[0x270F5D040]();
}

uint64_t sub_242FDBCC0()
{
  return MEMORY[0x270F5D048]();
}

uint64_t sub_242FDBCD0()
{
  return MEMORY[0x270F5D050]();
}

uint64_t sub_242FDBCE0()
{
  return MEMORY[0x270F5D058]();
}

uint64_t sub_242FDBCF0()
{
  return MEMORY[0x270F5D060]();
}

uint64_t sub_242FDBD00()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_242FDBD10()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_242FDBD20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_242FDBD30()
{
  return MEMORY[0x270EE3AF8]();
}

uint64_t sub_242FDBD40()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_242FDBD50()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_242FDBD60()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_242FDBD70()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_242FDBD80()
{
  return MEMORY[0x270EE3BC0]();
}

uint64_t sub_242FDBD90()
{
  return MEMORY[0x270EE3BD0]();
}

uint64_t sub_242FDBDB0()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_242FDBDC0()
{
  return MEMORY[0x270EE3C60]();
}

uint64_t sub_242FDBDD0()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_242FDBDE0()
{
  return MEMORY[0x270EE3C78]();
}

uint64_t sub_242FDBDF0()
{
  return MEMORY[0x270EE3C80]();
}

uint64_t sub_242FDBE00()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_242FDBE10()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_242FDBE20()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t sub_242FDBE30()
{
  return MEMORY[0x270EE3CB0]();
}

uint64_t sub_242FDBE40()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_242FDBE50()
{
  return MEMORY[0x270EE3D18]();
}

uint64_t sub_242FDBE60()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_242FDBE70()
{
  return MEMORY[0x270EE3D88]();
}

uint64_t sub_242FDBE80()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_242FDBE90()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_242FDBEA0()
{
  return MEMORY[0x270EE3E20]();
}

uint64_t sub_242FDBEB0()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_242FDBEC0()
{
  return MEMORY[0x270EE3EA0]();
}

uint64_t sub_242FDBED0()
{
  return MEMORY[0x270EE3EC0]();
}

uint64_t sub_242FDBEE0()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_242FDBEF0()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_242FDBF00()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_242FDBF10()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_242FDBF20()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_242FDBF30()
{
  return MEMORY[0x270EE4028]();
}

uint64_t sub_242FDBF40()
{
  return MEMORY[0x270EE4030]();
}

uint64_t sub_242FDBF50()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_242FDBF60()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_242FDBF70()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_242FDBF80()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_242FDBF90()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_242FDBFA0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_242FDBFB0()
{
  return MEMORY[0x270FA0B08]();
}

uint64_t sub_242FDBFC0()
{
  return MEMORY[0x270FA0B20]();
}

uint64_t sub_242FDBFD0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_242FDBFE0()
{
  return MEMORY[0x270FA0BD0]();
}

uint64_t sub_242FDBFF0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_242FDC000()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_242FDC010()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_242FDC020()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_242FDC030()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_242FDC040()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_242FDC050()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_242FDC060()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_242FDC070()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_242FDC080()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_242FDC090()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_242FDC0A0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_242FDC0B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_242FDC0C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_242FDC0D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_242FDC0E0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_242FDC0F0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_242FDC100()
{
  return MEMORY[0x270F9D670]();
}

uint64_t sub_242FDC110()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_242FDC120()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_242FDC130()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_242FDC140()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_242FDC150()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_242FDC160()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_242FDC170()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_242FDC180()
{
  return MEMORY[0x270F9DAC0]();
}

uint64_t sub_242FDC190()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_242FDC1A0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_242FDC1B0()
{
  return MEMORY[0x270F9DB40]();
}

uint64_t sub_242FDC1C0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_242FDC1D0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_242FDC1E0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_242FDC1F0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_242FDC200()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_242FDC210()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_242FDC220()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_242FDC230()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_242FDC240()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_242FDC250()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_242FDC260()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_242FDC270()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_242FDC280()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_242FDC290()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_242FDC2B0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_242FDC2C0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_242FDC2D0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_242FDC2E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_242FDC2F0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_242FDC300()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_242FDC310()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_242FDC320()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_242FDC330()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_242FDC340()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_242FDC350()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_242FDC360()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_242FDC370()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_242FDC380()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_242FDC390()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_242FDC3A0()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_242FDC3B0()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_242FDC3C0()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_242FDC3D0()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_242FDC3E0()
{
  return MEMORY[0x270F5D068]();
}

uint64_t sub_242FDC3F0()
{
  return MEMORY[0x270FA0F50]();
}

uint64_t sub_242FDC400()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_242FDC410()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_242FDC420()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_242FDC430()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_242FDC440()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_242FDC450()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_242FDC460()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_242FDC470()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_242FDC480()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_242FDC490()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_242FDC4A0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_242FDC4B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_242FDC4C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_242FDC4D0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_242FDC4E0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_242FDC4F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_242FDC500()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_242FDC510()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_242FDC520()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_242FDC530()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_242FDC540()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_242FDC550()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_242FDC560()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_242FDC570()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_242FDC580()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_242FDC590()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_242FDC5A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_242FDC5B0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_242FDC5C0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_242FDC5D0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_242FDC5E0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_242FDC5F0()
{
  return MEMORY[0x270F9F208]();
}

uint64_t sub_242FDC600()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_242FDC610()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_242FDC620()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_242FDC630()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_242FDC640()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_242FDC650()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_242FDC660()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_242FDC670()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_242FDC680()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_242FDC690()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_242FDC6A0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_242FDC6B0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_242FDC6C0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_242FDC6D0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_242FDC6E0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_242FDC6F0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_242FDC700()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_242FDC710()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_242FDC720()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_242FDC730()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_242FDC740()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_242FDC750()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_242FDC760()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_242FDC770()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_242FDC780()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_242FDC790()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_242FDC7A0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_242FDC7B0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_242FDC7E0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_242FDC7F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_242FDC800()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_242FDC810()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_242FDC820()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_242FDC830()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_242FDC840()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_242FDC850()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_242FDC860()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_242FDC870()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_242FDC880()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_242FDC890()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_242FDC8A0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_242FDC8D0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}