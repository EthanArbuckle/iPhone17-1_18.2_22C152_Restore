unint64_t static MAGAngelConstants.MachService.launchAngelMachName.getter()
{
  return 0xD00000000000002BLL;
}

unint64_t static MAGAngelConstants.MachService.launchAngelMachServiceID.getter()
{
  return 0xD00000000000002ELL;
}

unint64_t static MAGAngelConstants.MachService.launchAngelMachServiceDomain.getter()
{
  return 0xD000000000000026;
}

unint64_t static MAGAngelConstants.MachService.clientEntitlement.getter()
{
  return 0xD000000000000027;
}

unint64_t static MAGAngelConstants.MachService.dispatchQueueLabel.getter()
{
  return 0xD00000000000003DLL;
}

id MAGMakeServiceInterface()()
{
  v0 = (void *)sub_255831FB0();
  id v1 = objc_msgSend(self, sel_interfaceWithIdentifier_, v0);

  v2 = self;
  id v3 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_27045AA18);
  objc_msgSend(v1, sel_setServer_, v3);

  id v4 = objc_msgSend(v2, sel_protocolForProtocol_, &unk_27045A660);
  objc_msgSend(v1, sel_setClient_, v4);

  objc_msgSend(v1, sel_setClientMessagingExpectation_, 0);
  return v1;
}

uint64_t sub_25582E3EC(uint64_t a1)
{
  return sub_25582E490(a1, qword_269EFBC68);
}

uint64_t static MAGLog.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25582E52C(&qword_269EFBC60, (uint64_t)qword_269EFBC68, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25582E46C(uint64_t a1)
{
  return sub_25582E490(a1, qword_269EFBC88);
}

uint64_t sub_25582E490(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_255831F80();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_255831F70();
}

uint64_t static MAGLog.service.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25582E52C(&qword_269EFBC80, (uint64_t)qword_269EFBC88, a1);
}

uint64_t sub_25582E52C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_255831F80();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for MAGAngelConstants()
{
  return &type metadata for MAGAngelConstants;
}

ValueMetadata *type metadata accessor for MAGAngelConstants.MachService()
{
  return &type metadata for MAGAngelConstants.MachService;
}

ValueMetadata *type metadata accessor for MAGLog()
{
  return &type metadata for MAGLog;
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

BOOL sub_25582E658(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25582E66C()
{
  return sub_255832180();
}

uint64_t sub_25582E6B4()
{
  return sub_255832170();
}

uint64_t sub_25582E6E0()
{
  return sub_255832180();
}

id MAGService.__deallocating_deinit()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC17MagnifierServices10MAGService__connection;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
  if (v3)
  {
    objc_msgSend(v3, sel_invalidate);
    id v4 = *(void **)&v0[v2];
  }
  else
  {
    id v4 = 0;
  }
  *(void *)&v0[v2] = 0;

  v6.receiver = v0;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, sel_dealloc);
}

id sub_25582E824()
{
  uint64_t v1 = OBJC_IVAR____TtC17MagnifierServices10MAGService__connection;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
    id v4 = v2;
    return v3;
  }
  uint64_t v5 = (void *)sub_255831FB0();
  id v3 = (id)sub_255831FB0();
  id v6 = objc_msgSend(self, sel_endpointForMachName_service_instance_, v5, v3, 0);

  if (!v6)
  {
    sub_25582FE28();
    swift_allocError();
    unsigned char *v18 = 0;
    swift_willThrow();
    return v3;
  }
  id v7 = objc_msgSend(self, sel_connectionWithEndpoint_, v6);
  if (!v7)
  {
    sub_25582FE28();
    swift_allocError();
    unsigned char *v19 = 1;
    swift_willThrow();

    return v3;
  }
  id v3 = v7;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v0;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_25582FEB4;
  *(void *)(v9 + 24) = v8;
  v21[4] = sub_25582FECC;
  v21[5] = v9;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 1107296256;
  v21[2] = sub_25582F20C;
  v21[3] = &block_descriptor;
  v10 = _Block_copy(v21);
  v11 = v0;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_configureConnection_, v10);
  _Block_release(v10);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v10)
  {
    __break(1u);
    goto LABEL_14;
  }
  v12 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v3;
  id v3 = v3;

  if (qword_269EFBC60 != -1) {
LABEL_14:
  }
    swift_once();
  uint64_t v13 = sub_255831F80();
  __swift_project_value_buffer(v13, (uint64_t)qword_269EFBC68);
  v14 = sub_255831F60();
  os_log_type_t v15 = sub_255832000();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_25582C000, v14, v15, "WIll activate connection", v16, 2u);
    MEMORY[0x25A28F410](v16, -1, -1);
  }

  objc_msgSend(v3, sel_activate);
  swift_release();

  id v17 = 0;
  return v3;
}

id sub_25582EBA4(void *a1, uint64_t a2)
{
  id v4 = (void *)sub_255831FB0();
  objc_msgSend(a1, sel_setName_, v4);

  id v5 = objc_msgSend(self, sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v5);

  id v6 = MAGMakeServiceInterface()();
  objc_msgSend(a1, sel_setInterface_, v6);

  objc_msgSend(a1, sel_setInterfaceTarget_, a2);
  id v17 = sub_25582EE64;
  uint64_t v18 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  os_log_type_t v15 = sub_25582EF4C;
  v16 = &block_descriptor_8;
  id v7 = _Block_copy(&v13);
  objc_msgSend(a1, sel_setActivationHandler_, v7);
  _Block_release(v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v17 = sub_25582FF44;
  uint64_t v18 = v8;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  os_log_type_t v15 = sub_25582EF4C;
  v16 = &block_descriptor_14;
  uint64_t v9 = _Block_copy(&v13);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v9);
  _Block_release(v9);
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v17 = sub_25582FF4C;
  uint64_t v18 = v10;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 1107296256;
  os_log_type_t v15 = sub_25582EF4C;
  v16 = &block_descriptor_18;
  v11 = _Block_copy(&v13);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v11);
  _Block_release(v11);
  return objc_msgSend(a1, sel_setTargetQueue_, *(void *)(a2 + OBJC_IVAR____TtC17MagnifierServices10MAGService_queue));
}

void sub_25582EE64()
{
  if (qword_269EFBC60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_255831F80();
  __swift_project_value_buffer(v0, (uint64_t)qword_269EFBC68);
  oslog = sub_255831F60();
  os_log_type_t v1 = sub_255832000();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_25582C000, oslog, v1, "Activation handler called", v2, 2u);
    MEMORY[0x25A28F410](v2, -1, -1);
  }
}

void sub_25582EF4C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_25582EFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  if (qword_269EFBC60 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_255831F80();
  __swift_project_value_buffer(v3, (uint64_t)qword_269EFBC68);
  id v4 = sub_255831F60();
  os_log_type_t v5 = sub_255832000();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25582C000, v4, v5, "Interruption handler called", v6, 2u);
    MEMORY[0x25A28F410](v6, -1, -1);
  }

  swift_beginAccess();
  uint64_t v7 = MEMORY[0x25A28F460](v2);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(void **)(v7 + OBJC_IVAR____TtC17MagnifierServices10MAGService__connection);
    if (v9)
    {
      id v10 = v9;

      objc_msgSend(v10, sel_activate);
      uint64_t v8 = v10;
    }
  }
}

void sub_25582F0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  if (qword_269EFBC60 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_255831F80();
  __swift_project_value_buffer(v3, (uint64_t)qword_269EFBC68);
  id v4 = sub_255831F60();
  os_log_type_t v5 = sub_255832000();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25582C000, v4, v5, "Iinvalidation handler called", v6, 2u);
    MEMORY[0x25A28F410](v6, -1, -1);
  }

  swift_beginAccess();
  uint64_t v7 = (char *)MEMORY[0x25A28F460](v2);
  if (v7)
  {
    uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection];
    *(void *)&v7[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection] = 0;
  }
}

uint64_t sub_25582F20C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

void sub_25582F260()
{
  id v1 = sub_25582E824();
  if (!v0)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)sub_255831FB0();
    id v4 = (void *)sub_255831FB0();
    id v5 = objc_msgSend(self, sel_attributeWithDomain_name_, v3, v4);

    v16 = &unk_27045AAC8;
    id v6 = (void *)swift_dynamicCastObjCProtocolUnconditional();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBE70);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_2558325D0;
    *(void *)(v7 + 32) = v5;
    *(void *)&v13[0] = v7;
    sub_255831FF0();
    sub_25582FD24(0, &qword_269EFBE78);
    id v8 = v2;
    id v9 = v5;
    id v10 = (void *)sub_255831FE0();
    swift_bridgeObjectRelease();
    id v11 = objc_msgSend(v6, sel_remoteTargetWithLaunchingAssertionAttributes_, v10);

    if (v11)
    {
      sub_255832040();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v13, 0, sizeof(v13));
    }
    sub_25582FD60((uint64_t)v13, (uint64_t)v14);
    if (v15)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBE90);
      if (swift_dynamicCast())
      {

        return;
      }
    }
    else
    {
      sub_25582FDC8((uint64_t)v14);
    }
    sub_25582FE28();
    swift_allocError();
    unsigned char *v12 = 2;
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.buildConnection()()
{
  sub_25582F260();
  if (!v0) {
    swift_unknownObjectRelease();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.presentDetectionUI()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.dismissUI()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.hideUI()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleUI()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleTextDetection()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleFurnitureDetection()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.togglePeopleDetection()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleDoorDetection()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.toggleImageDescriptions()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.togglePointAndSpeak()()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.describeScene()()
{
}

void sub_25582F644(SEL *a1)
{
  sub_25582F260();
  if (!v1)
  {
    [v3 *a1];
    swift_unknownObjectRelease();
  }
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.currentState()()
{
  sub_25582F260();
  if (!v0)
  {
    id v3 = objc_msgSend(v1, sel_currentState);
    swift_unknownObjectRelease();
    uint64_t v4 = sub_255831FC0();
    id v6 = v5;

    uint64_t v1 = (void *)v4;
    uint64_t v2 = v6;
  }
  result._object = v2;
  result._countAndFlagsBits = (uint64_t)v1;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MAGService.stopSpeech()()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC17MagnifierServices10MAGService__connection))
  {
    sub_25582F260();
    if (!v1)
    {
      objc_msgSend(v2, sel_stopSpeech);
      swift_unknownObjectRelease();
    }
  }
}

id MAGService.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id MAGService.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_255832020();
  uint64_t v1 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255832010();
  MEMORY[0x270FA5388]();
  sub_255831FA0();
  MEMORY[0x270FA5388]();
  uint64_t v6 = OBJC_IVAR____TtC17MagnifierServices10MAGService_queue;
  sub_25582FD24(0, &qword_269EFBDE0);
  uint64_t v4 = v0;
  sub_255831F90();
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_25582F9F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBDF0);
  sub_25582FA8C();
  sub_255832050();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v7);
  *(void *)&v0[v6] = sub_255832030();
  *(void *)&v4[OBJC_IVAR____TtC17MagnifierServices10MAGService__connection] = 0;

  v9.receiver = v4;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

unint64_t sub_25582F9F0()
{
  unint64_t result = qword_269EFBDE8;
  if (!qword_269EFBDE8)
  {
    sub_255832010();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBDE8);
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

unint64_t sub_25582FA8C()
{
  unint64_t result = qword_269EFBDF8;
  if (!qword_269EFBDF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269EFBDF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBDF8);
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

uint64_t MAGService.simulateEvent(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (qword_269EFBCA0 != -1) {
    swift_once();
  }
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  sub_25582FC54();
  uint64_t result = sub_255831F40();
  if (!v1)
  {
    uint64_t v6 = result;
    unint64_t v7 = v5;
    sub_25582F260();
    objc_super v9 = v8;
    uint64_t v10 = (void *)sub_255831F50();
    objc_msgSend(v9, sel_simulateEvent_, v10, v11, v12);
    swift_unknownObjectRelease();

    return sub_25582FCA8(v6, v7);
  }
  return result;
}

unint64_t sub_25582FC54()
{
  unint64_t result = qword_269EFBE00;
  if (!qword_269EFBE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBE00);
  }
  return result;
}

uint64_t sub_25582FCA8(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for MAGService()
{
  return self;
}

uint64_t sub_25582FD24(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25582FD60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25582FDC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBE80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25582FE28()
{
  unint64_t result = qword_269EFBE88;
  if (!qword_269EFBE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBE88);
  }
  return result;
}

uint64_t sub_25582FE7C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25582FEB4(void *a1)
{
  return sub_25582EBA4(a1, *(void *)(v1 + 16));
}

uint64_t sub_25582FEBC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25582FECC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_25582FF0C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25582FF44(uint64_t a1)
{
  sub_25582EFB4(a1, v1);
}

void sub_25582FF4C(uint64_t a1)
{
  sub_25582F0F0(a1, v1);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MAGServiceError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MAGServiceError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2558300C0);
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

uint64_t sub_2558300E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2558300F4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MAGServiceError()
{
  return &type metadata for MAGServiceError;
}

unint64_t sub_255830110()
{
  unint64_t result = qword_269EFBEF8;
  if (!qword_269EFBEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBEF8);
  }
  return result;
}

uint64_t static MAGSimulatedEvent.encode(_:)()
{
  if (qword_269EFBCA0 != -1) {
    swift_once();
  }
  sub_25582FC54();
  return sub_255831F40();
}

uint64_t MAGSimulatedEvent.EventType.description.getter()
{
  return 0x65636E756F6E6E41;
}

uint64_t MAGSimulatedEvent.EventType.hash(into:)()
{
  sub_255832170();

  return sub_255831FD0();
}

uint64_t static MAGSimulatedEvent.EventType.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_255832110();
  }
}

uint64_t sub_2558302AC()
{
  return 1;
}

uint64_t sub_2558302C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255831D34(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2558302EC()
{
  return 0;
}

void sub_2558302F8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_255830304(uint64_t a1)
{
  unint64_t v2 = sub_255830C64();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255830340(uint64_t a1)
{
  unint64_t v2 = sub_255830C64();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25583037C()
{
  return sub_255832170();
}

uint64_t sub_2558303A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255831DBC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2558303D4(uint64_t a1)
{
  unint64_t v2 = sub_255830C10();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255830410(uint64_t a1)
{
  unint64_t v2 = sub_255830C10();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MAGSimulatedEvent.EventType.encode(to:)(void *a1)
{
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBF10);
  uint64_t v3 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBF18);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  objc_super v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  v13[1] = v1[1];
  _OWORD v13[2] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255830C10();
  sub_2558321A0();
  sub_255830C64();
  sub_2558320E0();
  uint64_t v11 = v14;
  sub_2558320F0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t MAGSimulatedEvent.EventType.hashValue.getter()
{
  return sub_255832180();
}

uint64_t MAGSimulatedEvent.EventType.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v26 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBF30);
  uint64_t v27 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBF38);
  uint64_t v28 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  objc_super v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255830C10();
  sub_255832190();
  if (v2) {
    goto LABEL_7;
  }
  v25 = a1;
  uint64_t v10 = v9;
  if (*(void *)(sub_2558320D0() + 16) != 1)
  {
    uint64_t v13 = sub_255832080();
    swift_allocError();
    uint64_t v14 = v7;
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBF40);
    void *v16 = &type metadata for MAGSimulatedEvent.EventType;
    sub_2558320A0();
    sub_255832070();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v16, *MEMORY[0x263F8DCB0], v13);
    swift_willThrow();
    uint64_t v17 = v28;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v14);
    a1 = v25;
LABEL_7:
    uint64_t v22 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v22);
  }
  sub_255830C64();
  uint64_t v11 = v6;
  sub_255832090();
  uint64_t v12 = v28;
  uint64_t v19 = sub_2558320B0();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v7);
  uint64_t v22 = (uint64_t)v25;
  v23 = v26;
  uint64_t *v26 = v19;
  v23[1] = v21;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_255830A10()
{
  return sub_255832180();
}

uint64_t sub_255830A70()
{
  sub_255832170();

  return sub_255831FD0();
}

uint64_t sub_255830AC4()
{
  return sub_255832180();
}

uint64_t sub_255830B20@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MAGSimulatedEvent.EventType.init(from:)(a1, a2);
}

uint64_t sub_255830B38(void *a1)
{
  return MAGSimulatedEvent.EventType.encode(to:)(a1);
}

uint64_t sub_255830B50()
{
  return MAGSimulatedEvent.EventType.description.getter();
}

uint64_t sub_255830B68(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_255832110();
  }
}

uint64_t sub_255830B98(uint64_t a1)
{
  return sub_255830D3C(a1, MEMORY[0x263F061E0], MEMORY[0x263F061D8], &qword_269EFBF00);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_255830C10()
{
  unint64_t result = qword_269EFBF20;
  if (!qword_269EFBF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF20);
  }
  return result;
}

unint64_t sub_255830C64()
{
  unint64_t result = qword_269EFBF28;
  if (!qword_269EFBF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF28);
  }
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

uint64_t sub_255830D08(uint64_t a1)
{
  return sub_255830D3C(a1, MEMORY[0x263F06128], MEMORY[0x263F06120], &qword_269EFBF08);
}

uint64_t sub_255830D3C(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

uint64_t static MAGSimulatedEvent.decode(_:)()
{
  if (qword_269EFBCA8 != -1) {
    swift_once();
  }
  sub_255830E2C();
  return sub_255831F30();
}

unint64_t sub_255830E2C()
{
  unint64_t result = qword_269EFBF48;
  if (!qword_269EFBF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF48);
  }
  return result;
}

uint64_t MAGSimulatedEvent.eventType.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void *MAGSimulatedEvent.init(eventType:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t static MAGSimulatedEvent.announcement(text:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

unint64_t MAGSimulatedEvent.description.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t MAGSimulatedEvent.hash(into:)()
{
  sub_255832170();
  swift_bridgeObjectRetain();
  sub_255831FD0();

  return swift_bridgeObjectRelease();
}

uint64_t static MAGSimulatedEvent.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_255832110();
  }
}

uint64_t sub_255830F90()
{
  return sub_255832180();
}

uint64_t sub_255830FD4()
{
  return sub_255832180();
}

uint64_t sub_255831018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255831E74(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_255831044(uint64_t a1)
{
  unint64_t v2 = sub_255831208();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255831080(uint64_t a1)
{
  unint64_t v2 = sub_255831208();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MAGSimulatedEvent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBF50);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255831208();
  sub_2558321A0();
  v10[0] = v8;
  v10[1] = v7;
  sub_25583125C();
  sub_255832100();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_255831208()
{
  unint64_t result = qword_269EFBF58;
  if (!qword_269EFBF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF58);
  }
  return result;
}

unint64_t sub_25583125C()
{
  unint64_t result = qword_269EFBF60;
  if (!qword_269EFBF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF60);
  }
  return result;
}

uint64_t MAGSimulatedEvent.hashValue.getter()
{
  return sub_255832180();
}

uint64_t MAGSimulatedEvent.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269EFBF68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255831208();
  sub_255832190();
  if (!v2)
  {
    sub_2558315CC();
    sub_2558320C0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v9 = v11[1];
    *a2 = v11[0];
    a2[1] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25583148C()
{
  return sub_255832180();
}

uint64_t sub_2558314FC()
{
  sub_255832170();
  swift_bridgeObjectRetain();
  sub_255831FD0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_255831560()
{
  return sub_255832180();
}

unint64_t sub_2558315CC()
{
  unint64_t result = qword_269EFBF70;
  if (!qword_269EFBF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF70);
  }
  return result;
}

unint64_t sub_255831624()
{
  unint64_t result = qword_269EFBF78;
  if (!qword_269EFBF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF78);
  }
  return result;
}

unint64_t sub_25583167C()
{
  unint64_t result = qword_269EFBF80;
  if (!qword_269EFBF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF80);
  }
  return result;
}

uint64_t sub_2558316D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return MAGSimulatedEvent.init(from:)(a1, a2);
}

uint64_t sub_2558316E8(void *a1)
{
  return MAGSimulatedEvent.encode(to:)(a1);
}

unint64_t sub_255831700()
{
  return 0xD00000000000001FLL;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for MAGSimulatedEvent()
{
  return &type metadata for MAGSimulatedEvent;
}

void *initializeBufferWithCopyOfBuffer for MAGSimulatedEvent.EventType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MAGSimulatedEvent.EventType()
{
  return swift_bridgeObjectRelease();
}

void *_s17MagnifierServices17MAGSimulatedEventV9EventTypeOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for MAGSimulatedEvent.EventType(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17MagnifierServices17MAGSimulatedEventV9EventTypeOwet_0(uint64_t a1, int a2)
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

uint64_t sub_255831878(uint64_t result, int a2, int a3)
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

uint64_t sub_2558318B4()
{
  return 0;
}

ValueMetadata *type metadata accessor for MAGSimulatedEvent.EventType()
{
  return &type metadata for MAGSimulatedEvent.EventType;
}

ValueMetadata *type metadata accessor for MAGSimulatedEvent.CodingKeys()
{
  return &type metadata for MAGSimulatedEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for MAGSimulatedEvent.EventType.CodingKeys()
{
  return &type metadata for MAGSimulatedEvent.EventType.CodingKeys;
}

uint64_t _s17MagnifierServices17MAGSimulatedEventV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s17MagnifierServices17MAGSimulatedEventV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2558319E4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MAGSimulatedEvent.EventType.AnnouncementCodingKeys()
{
  return &type metadata for MAGSimulatedEvent.EventType.AnnouncementCodingKeys;
}

unint64_t sub_255831A20()
{
  unint64_t result = qword_269EFBF88;
  if (!qword_269EFBF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF88);
  }
  return result;
}

unint64_t sub_255831A78()
{
  unint64_t result = qword_269EFBF90;
  if (!qword_269EFBF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF90);
  }
  return result;
}

unint64_t sub_255831AD0()
{
  unint64_t result = qword_269EFBF98;
  if (!qword_269EFBF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBF98);
  }
  return result;
}

unint64_t sub_255831B28()
{
  unint64_t result = qword_269EFBFA0;
  if (!qword_269EFBFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBFA0);
  }
  return result;
}

unint64_t sub_255831B80()
{
  unint64_t result = qword_269EFBFA8;
  if (!qword_269EFBFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBFA8);
  }
  return result;
}

unint64_t sub_255831BD8()
{
  unint64_t result = qword_269EFBFB0;
  if (!qword_269EFBFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBFB0);
  }
  return result;
}

unint64_t sub_255831C30()
{
  unint64_t result = qword_269EFBFB8;
  if (!qword_269EFBFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBFB8);
  }
  return result;
}

unint64_t sub_255831C88()
{
  unint64_t result = qword_269EFBFC0;
  if (!qword_269EFBFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBFC0);
  }
  return result;
}

unint64_t sub_255831CE0()
{
  unint64_t result = qword_269EFBFC8;
  if (!qword_269EFBFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269EFBFC8);
  }
  return result;
}

uint64_t sub_255831D34(uint64_t a1, uint64_t a2)
{
  if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_255832110();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_255831DAC()
{
  return 1954047348;
}

uint64_t sub_255831DBC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65636E756F6E6E61 && a2 == 0xEC000000746E656DLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_255832110();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_255831E54()
{
  return 0x65636E756F6E6E61;
}

uint64_t sub_255831E74(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x707954746E657665 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_255832110();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_255831F04()
{
  return 0x707954746E657665;
}

uint64_t sub_255831F30()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_255831F40()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_255831F50()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_255831F60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_255831F70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_255831F80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_255831F90()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_255831FA0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_255831FB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_255831FC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_255831FD0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_255831FE0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_255831FF0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_255832000()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_255832010()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_255832020()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_255832030()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_255832040()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_255832050()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_255832060()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_255832070()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_255832080()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_255832090()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2558320A0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2558320B0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2558320C0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2558320D0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2558320E0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2558320F0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_255832100()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_255832110()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_255832120()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_255832130()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_255832140()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_255832150()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_255832160()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_255832170()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_255832180()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_255832190()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2558321A0()
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x270FA02A0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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