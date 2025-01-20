uint64_t sub_243229084()
{
  uint64_t vars8;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432324B0();
  swift_release();

  return swift_release();
}

uint64_t sub_2432290FC(uint64_t a1, uint64_t a2, int a3)
{
  int v42 = a3;
  uint64_t v41 = a2;
  uint64_t v38 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E7D8);
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v37 = v4;
  MEMORY[0x270FA5388](v4);
  v35 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  uint64_t v6 = MEMORY[0x270FA5388](v34);
  uint64_t v40 = (uint64_t)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v39 = (char *)&v33 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E7A0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AddDevicesExtensionStatus(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v18 = (char *)&v33 - v17;
  type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(0);
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = v19
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal__extensionStatus;
  uint64_t v21 = sub_243232840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 4, v21);
  sub_24322C0A0((uint64_t)v18, (uint64_t)v16, type metadata accessor for AddDevicesExtensionStatus);
  sub_243232490();
  sub_24322C108((uint64_t)v18, type metadata accessor for AddDevicesExtensionStatus);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v20, v12, v9);
  uint64_t v22 = v19
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity;
  uint64_t v23 = sub_243232420();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *(void *)(v19
            + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection) = 0;
  *(void *)(v3 + 16) = v19;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_2432328E0()) {
    unint64_t v24 = sub_24322C38C(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v24 = MEMORY[0x263F8EE88];
  }
  uint64_t v26 = v37;
  uint64_t v25 = v38;
  v28 = v35;
  uint64_t v27 = v36;
  *(void *)(v3 + 24) = v24;
  uint64_t v29 = v3
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment46AddDevicesToAutomatedDeviceEnrollmentViewModel__viewTypeToPresent;
  uint64_t v30 = (uint64_t)v39;
  swift_storeEnumTagMultiPayload();
  sub_24322C0A0(v30, v40, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  sub_243232490();
  sub_24322C108(v30, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v28, v26);
  uint64_t v31 = v41;
  *(void *)(v3 + 32) = v25;
  *(void *)(v3 + 40) = v31;
  *(unsigned char *)(v3 + 48) = v42 & 1;
  return v3;
}

uint64_t sub_243229524()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E750);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v20 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E788);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E790);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E798);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E7A0);
  sub_2432324A0();
  swift_endAccess();
  sub_24322C168();
  id v21 = (id)sub_243232820();
  uint64_t v15 = sub_243232810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 1, 1, v15);
  sub_24322C250(&qword_268D8E7B0, &qword_268D8E790);
  sub_24322C640(&qword_268D8E7B8, (void (*)(uint64_t))sub_24322C168);
  sub_2432324E0();
  sub_24322C1F0((uint64_t)v6, &qword_268D8E788);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_24322C250(&qword_268D8E7C0, &qword_268D8E798);
  swift_retain();
  sub_2432324F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_beginAccess();
  sub_243232460();
  swift_endAccess();
  swift_release();
  uint64_t v16 = sub_2432327C0();
  uint64_t v17 = (uint64_t)v20;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v20, 1, 1, v16);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v1;
  swift_retain();
  sub_243229F94(v17, (uint64_t)&unk_268D8E7D0, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_243229980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  sub_243232330();
  v4[5] = swift_task_alloc();
  sub_243232730();
  v4[6] = swift_task_alloc();
  v4[7] = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243229A7C, 0, 0);
}

uint64_t sub_243229A7C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_243229B10;
  return sub_24322C7E4();
}

uint64_t sub_243229B10()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243229C74, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243229C74()
{
  v18 = v0;
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[11];
  uint64_t v2 = sub_243232450();
  __swift_project_value_buffer(v2, (uint64_t)qword_268D8EC10);
  MEMORY[0x245676050](v1);
  MEMORY[0x245676050](v1);
  uint64_t v3 = sub_243232430();
  os_log_type_t v4 = sub_2432327F0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[11];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    v0[2] = v6;
    MEMORY[0x245676050](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E778);
    uint64_t v9 = sub_243232770();
    v0[3] = sub_24322F4E0(v9, v10, &v17);
    sub_243232860();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_243227000, v3, v4, "queryExtensionAndSetupConfiguration failed with error '%s'", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2456761A0](v8, -1, -1);
    MEMORY[0x2456761A0](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = (void *)v0[11];
  uint64_t v13 = v0[8];
  uint64_t v12 = (uint64_t *)v0[9];
  sub_243232720();
  sub_243232320();
  uint64_t *v12 = sub_243232760();
  v12[1] = v14;
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24322C0A0((uint64_t)v12, v13, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2432324C0();
  sub_24322C108((uint64_t)v12, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_243229F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2432327C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2432327B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24322C1F0(a1, &qword_268D8E750);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_243232790();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24322A140(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_243232330();
  ((void (*)(void))MEMORY[0x270FA5388])();
  BOOL v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243232730();
  ((void (*)(void))MEMORY[0x270FA5388])();
  v43 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_243232840();
  uint64_t v8 = *(void *)(v7 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  int v42 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v37 - v13);
  uint64_t v44 = type metadata accessor for AddDevicesExtensionStatus(0);
  uint64_t v15 = MEMORY[0x270FA5388](v44);
  uint64_t v46 = (uint64_t)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v37 - v18;
  MEMORY[0x270FA5388](v17);
  id v21 = (char *)&v37 - v20;
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_243232450();
  __swift_project_value_buffer(v22, (uint64_t)qword_268D8EC10);
  uint64_t v47 = a1;
  sub_24322C0A0(a1, (uint64_t)v21, type metadata accessor for AddDevicesExtensionStatus);
  uint64_t v23 = sub_243232430();
  os_log_type_t v24 = sub_2432327E0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v39 = v7;
    uint64_t v26 = v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v41 = v2;
    uint64_t v28 = v27;
    v49[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v40 = v14;
    uint64_t v48 = sub_24322F4E0(0xD000000000000028, 0x80000002432333E0, v49);
    uint64_t v37 = v5;
    sub_243232860();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v38 = v8;
    sub_24322C0A0((uint64_t)v21, (uint64_t)v19, type metadata accessor for AddDevicesExtensionStatus);
    uint64_t v29 = sub_243232770();
    uint64_t v48 = sub_24322F4E0(v29, v30, v49);
    uint64_t v14 = v40;
    sub_243232860();
    swift_bridgeObjectRelease();
    uint64_t v8 = v38;
    sub_24322C108((uint64_t)v21, type metadata accessor for AddDevicesExtensionStatus);
    _os_log_impl(&dword_243227000, v23, v24, "%s extension status updated to %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2456761A0](v28, -1, -1);
    uint64_t v31 = v26;
    uint64_t v7 = v39;
    MEMORY[0x2456761A0](v31, -1, -1);
  }
  else
  {
    sub_24322C108((uint64_t)v21, type metadata accessor for AddDevicesExtensionStatus);
  }

  uint64_t v32 = v46;
  sub_24322C0A0(v47, v46, type metadata accessor for AddDevicesExtensionStatus);
  int v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v32, 4, v7);
  if ((v33 - 1) < 2) {
    goto LABEL_9;
  }
  if ((v33 - 3) < 2)
  {
    sub_243232720();
    sub_243232320();
    *uint64_t v14 = sub_243232760();
    v14[1] = v34;
LABEL_9:
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24322C0A0((uint64_t)v14, (uint64_t)v12, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
    swift_retain();
    sub_2432324C0();
    return sub_24322C108((uint64_t)v14, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  }
  uint64_t v36 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v42, v32, v7);
  (*(void (**)(uint64_t *, char *, uint64_t))(v8 + 16))(v14, v36, v7);
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24322C0A0((uint64_t)v14, (uint64_t)v12, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2432324C0();
  sub_24322C108((uint64_t)v14, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  sub_24322A7E0();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v36, v7);
}

uint64_t sub_24322A7E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E750);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2432327C0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_24322C1F0((uint64_t)v3, &qword_268D8E750);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_2432327B0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_243232790();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_268D8E760;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24322AA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  sub_243232330();
  v4[5] = swift_task_alloc();
  sub_243232730();
  v4[6] = swift_task_alloc();
  v4[7] = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24322AB20, 0, 0);
}

uint64_t sub_24322AB20()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24322ABBC;
  uint64_t v2 = *(void *)(v0 + 32);
  return sub_24322D550(v2);
}

uint64_t sub_24322ABBC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24322AD20, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24322AD20()
{
  uint64_t v18 = v0;
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[11];
  uint64_t v2 = sub_243232450();
  __swift_project_value_buffer(v2, (uint64_t)qword_268D8EC10);
  MEMORY[0x245676050](v1);
  MEMORY[0x245676050](v1);
  uint64_t v3 = sub_243232430();
  os_log_type_t v4 = sub_2432327F0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[11];
  if (v5)
  {
    int v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v17 = v8;
    *(_DWORD *)int v7 = 136315138;
    v0[2] = v6;
    MEMORY[0x245676050](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E778);
    uint64_t v9 = sub_243232770();
    v0[3] = sub_24322F4E0(v9, v10, &v17);
    sub_243232860();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_243227000, v3, v4, "setupXPCConnectionWithExtension failed with error '%s'", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2456761A0](v8, -1, -1);
    MEMORY[0x2456761A0](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = (void *)v0[11];
  uint64_t v13 = v0[8];
  uint64_t v12 = (uint64_t *)v0[9];
  sub_243232720();
  sub_243232320();
  uint64_t *v12 = sub_243232760();
  v12[1] = v14;
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24322C0A0((uint64_t)v12, v13, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2432324C0();
  sub_24322C108((uint64_t)v12, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24322B040()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v1 = v0
     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment46AddDevicesToAutomatedDeviceEnrollmentViewModel__viewTypeToPresent;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E7D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24322B104()
{
  return type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(0);
}

uint64_t type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(uint64_t a1)
{
  return sub_24322B25C(a1, (uint64_t *)&unk_268D8E720);
}

void sub_24322B12C()
{
  sub_24322B1E4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24322B1E4()
{
  if (!qword_268D8E730)
  {
    type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(255);
    unint64_t v0 = sub_2432324D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D8E730);
    }
  }
}

uint64_t type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(uint64_t a1)
{
  return sub_24322B25C(a1, (uint64_t *)&unk_268D8E738);
}

uint64_t sub_24322B25C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24322B294@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(0);
  uint64_t result = sub_243232480();
  *a1 = result;
  return result;
}

uint64_t sub_24322B2D4()
{
  uint64_t v1 = v0;
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_243232450();
  __swift_project_value_buffer(v2, (uint64_t)qword_268D8EC10);
  uint64_t v3 = sub_243232430();
  os_log_type_t v4 = sub_243232800();
  if (os_log_type_enabled(v3, v4))
  {
    BOOL v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v10[0] = v6;
    *(_DWORD *)BOOL v5 = 136315138;
    sub_24322F4E0(0xD000000000000033, 0x8000000243233310, v10);
    sub_243232860();
    _os_log_impl(&dword_243227000, v3, v4, "%s Dismissing extension UI", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2456761A0](v6, -1, -1);
    MEMORY[0x2456761A0](v5, -1, -1);
  }

  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  v10[0] = *(void *)(v1 + 32);
  v10[1] = v7;
  char v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E748);
  return sub_2432326F0();
}

uint64_t *sub_24322B4C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_243232840();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24322B5E0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    uint64_t v3 = sub_243232840();
    os_log_type_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_24322B680(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_243232840();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24322B75C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24322C108((uint64_t)a1, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_243232840();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_24322B864(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_243232840();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24322B918(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24322C108((uint64_t)a1, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_243232840();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24322B9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24322BA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24322BA48()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24322BA58()
{
  uint64_t result = sub_243232840();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24322BAE8()
{
  return MEMORY[0x263EFDDD8];
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

uint64_t sub_24322BB70(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *os_log_type_t v4 = v2;
  v4[1] = sub_24322BC4C;
  return v6(a1);
}

uint64_t sub_24322BC4C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24322BD48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24322BDFC;
  return sub_24322AA24(a1, v4, v5, v6);
}

uint64_t sub_24322BDFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24322BEF0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24322BF28(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24322C688;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D8E768 + dword_268D8E768);
  return v6(a1, v4);
}

uint64_t sub_24322BFE8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24322BDFC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D8E768 + dword_268D8E768);
  return v6(a1, v4);
}

uint64_t sub_24322C0A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24322C108(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24322C168()
{
  unint64_t result = qword_268D8E7A8;
  if (!qword_268D8E7A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D8E7A8);
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

uint64_t sub_24322C1F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24322C250(unint64_t *a1, uint64_t *a2)
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

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24322C2D8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24322C688;
  return sub_243229980(a1, v4, v5, v6);
}

unint64_t sub_24322C38C(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2432328E0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E7E0);
      uint64_t result = sub_243232890();
      unint64_t v3 = result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_2432328E0();
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
    uint64_t result = MEMORY[0x245675E10](v7, v1);
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_26;
    }
LABEL_18:
    sub_243232470();
    sub_24322C640(&qword_268D8E7E8, MEMORY[0x263EFDD18]);
    uint64_t result = sub_243232700();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)(v8 + 8 * (v12 >> 6));
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_24322C640(&qword_268D8E7F0, MEMORY[0x263EFDD18]);
      do
      {
        uint64_t result = sub_243232710();
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

uint64_t sub_24322C640(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24322C690()
{
  uint64_t v0 = sub_243232450();
  __swift_allocate_value_buffer(v0, qword_268D8EC10);
  __swift_project_value_buffer(v0, (uint64_t)qword_268D8EC10);
  return sub_243232440();
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

uint64_t sub_24322C76C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432324B0();
  swift_release();

  return swift_release();
}

uint64_t sub_24322C7E4()
{
  v1[7] = v0;
  sub_243232350();
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E850);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  uint64_t v2 = sub_243232420();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v3 = sub_243232370();
  v1[17] = v3;
  v1[18] = *(void *)(v3 - 8);
  v1[19] = swift_task_alloc();
  uint64_t v4 = sub_243232380();
  v1[20] = v4;
  v1[21] = *(void *)(v4 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  uint64_t v5 = sub_2432323A0();
  v1[24] = v5;
  v1[25] = *(void *)(v5 - 8);
  v1[26] = swift_task_alloc();
  type metadata accessor for AddDevicesExtensionStatus(0);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24322CA98, 0, 0);
}

uint64_t sub_24322CA98()
{
  uint64_t v2 = v0[27];
  uint64_t v1 = v0[28];
  uint64_t v3 = v0[23];
  uint64_t v13 = v0[22];
  uint64_t v5 = v0[20];
  uint64_t v4 = v0[21];
  uint64_t v6 = sub_243232840();
  v0[29] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v0[30] = v8;
  v0[31] = (v7 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v8(v1, 2, 4, v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24322FB80(v1, v2);
  swift_retain();
  sub_2432324C0();
  sub_24322FBE4(v1);
  sub_243232360();
  sub_243232390();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v13, v3, v5);
  sub_24322FCF0(&qword_268D8E868, MEMORY[0x263F04D48]);
  sub_2432327D0();
  uint64_t v9 = sub_24322FCF0(&qword_268D8E870, MEMORY[0x263F04D38]);
  BOOL v10 = (void *)swift_task_alloc();
  v0[32] = v10;
  *BOOL v10 = v0;
  v10[1] = sub_24322CCE4;
  uint64_t v11 = v0[17];
  return MEMORY[0x270FA1E80](v0 + 5, v11, v9);
}

uint64_t sub_24322CCE4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[18] + 8))(v2[19], v2[17]);
    uint64_t v3 = sub_24322D408;
  }
  else
  {
    uint64_t v3 = sub_24322CE10;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24322CE10()
{
  uint64_t v50 = v0;
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 136);
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
LABEL_8:
    uint64_t v15 = *(void *)(v0 + 224);
    uint64_t v16 = *(void *)(v0 + 216);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 240))(v15, 3, 4, *(void *)(v0 + 232));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24322FB80(v15, v16);
    swift_retain();
    sub_2432324C0();
    sub_24322FBE4(v15);
    goto LABEL_15;
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 88);
  if (*(void *)(v1 + 16))
  {
    (*(void (**)(void, unint64_t, void))(v9 + 16))(*(void *)(v0 + 88), v1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), *(void *)(v0 + 96));
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v11(v10, 0, 1, v8);
  }
  else
  {
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v11(*(void *)(v0 + 88), 1, 1, v8);
  }
  uint64_t v12 = *(void *)(v0 + 96);
  uint64_t v13 = *(void *)(v0 + 104);
  uint64_t v14 = *(void *)(v0 + 88);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
  {
    sub_24322F308(*(void *)(v0 + 88));
    goto LABEL_8;
  }
  uint64_t v48 = v11;
  (*(void (**)(void, void, void))(*(void *)(v0 + 104) + 32))(*(void *)(v0 + 128), *(void *)(v0 + 88), *(void *)(v0 + 96));
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void *)(v0 + 120);
  uint64_t v17 = *(void *)(v0 + 128);
  uint64_t v20 = *(void *)(v0 + 96);
  uint64_t v19 = *(void *)(v0 + 104);
  uint64_t v21 = sub_243232450();
  __swift_project_value_buffer(v21, (uint64_t)qword_268D8EC10);
  uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v47(v18, v17, v20);
  unint64_t v22 = sub_243232430();
  os_log_type_t v23 = sub_243232800();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v25 = *(void *)(v0 + 120);
  uint64_t v26 = *(void *)(v0 + 104);
  if (v24)
  {
    uint64_t v45 = *(void *)(v0 + 96);
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v49 = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v29 = sub_243232410();
    *(void *)(v0 + 48) = sub_24322F4E0(v29, v30, &v49);
    sub_243232860();
    swift_bridgeObjectRelease();
    uint64_t v31 = v45;
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v46(v25, v31);
    _os_log_impl(&dword_243227000, v22, v23, "Add devices extension found with bundle identifier: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2456761A0](v28, -1, -1);
    MEMORY[0x2456761A0](v27, -1, -1);
  }
  else
  {
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v46(v25, *(void *)(v0 + 96));
  }

  v43 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 240);
  uint64_t v32 = *(void *)(v0 + 224);
  uint64_t v44 = *(void *)(v0 + 216);
  uint64_t v40 = *(void *)(v0 + 128);
  uint64_t v41 = *(void *)(v0 + 112);
  uint64_t v42 = *(void *)(v0 + 232);
  uint64_t v33 = *(void *)(v0 + 96);
  uint64_t v35 = *(void *)(v0 + 72);
  uint64_t v34 = *(void *)(v0 + 80);
  uint64_t v36 = *(void *)(v0 + 56);
  ((void (*)(uint64_t))v47)(v34);
  v48(v34, 0, 1, v33);
  sub_24322FD38(v34, v35);
  uint64_t v37 = v36
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity;
  swift_beginAccess();
  sub_24322FDA0(v35, v37);
  swift_endAccess();
  v47(v41, v40, v33);
  sub_243232340();
  sub_243232830();
  v43(v32, 0, 4, v42);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24322FB80(v32, v44);
  swift_retain();
  sub_2432324C0();
  sub_24322FBE4(v32);
  v46(v40, v33);
LABEL_15:
  (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
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
  uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
  return v38();
}

uint64_t sub_24322D408()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  (*(void (**)(void, void))(v0[21] + 8))(v0[23], v0[20]);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
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
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24322D550(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_243232400();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_2432323D0();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E850);
  v2[23] = swift_task_alloc();
  uint64_t v5 = sub_243232420();
  v2[24] = v5;
  v2[25] = *(void *)(v5 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24322D718, 0, 0);
}

uint64_t sub_24322D718()
{
  uint64_t v28 = v0;
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_243232450();
  v0[28] = __swift_project_value_buffer(v1, (uint64_t)qword_268D8EC10);
  uint64_t v2 = sub_243232430();
  os_log_type_t v3 = sub_243232800();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v27 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[13] = sub_24322F4E0(0xD000000000000026, 0x80000002432335A0, &v27);
    sub_243232860();
    _os_log_impl(&dword_243227000, v2, v3, "Begin %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2456761A0](v5, -1, -1);
    MEMORY[0x2456761A0](v4, -1, -1);
  }

  uint64_t v6 = v0[24];
  uint64_t v7 = v0[25];
  uint64_t v8 = v0[23];
  uint64_t v9 = v0[15]
     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity;
  swift_beginAccess();
  sub_24322F2A0(v9, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_24322F308(v0[23]);
    uint64_t v10 = sub_243232430();
    os_log_type_t v11 = sub_2432327F0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v27 = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      v0[9] = sub_24322F4E0(0xD000000000000026, 0x80000002432335A0, &v27);
      sub_243232860();
      _os_log_impl(&dword_243227000, v10, v11, "%s called when there is no extension identity", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2456761A0](v13, -1, -1);
      MEMORY[0x2456761A0](v12, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
  else
  {
    uint64_t v17 = v0[26];
    uint64_t v16 = v0[27];
    uint64_t v18 = v0[24];
    uint64_t v19 = v0[25];
    uint64_t v20 = v0[22];
    uint64_t v22 = v0[20];
    uint64_t v21 = v0[21];
    uint64_t v23 = v0[19];
    (*(void (**)(uint64_t, void, uint64_t))(v19 + 32))(v16, v0[23], v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v16, v18);
    swift_allocObject();
    swift_weakInit();
    sub_2432323B0();
    sub_243232310();
    sub_2432323C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v20, v23);
    BOOL v24 = (void *)swift_task_alloc();
    v0[29] = v24;
    *BOOL v24 = v0;
    v24[1] = sub_24322DBB4;
    uint64_t v25 = v0[21];
    uint64_t v26 = v0[18];
    return MEMORY[0x270EEB850](v26, v25);
  }
}

uint64_t sub_24322DBB4()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24322E2C0;
  }
  else {
    uint64_t v2 = sub_24322DCC8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24322DCC8()
{
  uint64_t v46 = v0;
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = sub_2432323F0();
  if (v1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
    uint64_t v3 = *(void *)(v0 + 216);
    uint64_t v4 = *(void *)(v0 + 192);
    uint64_t v5 = *(void *)(v0 + 200);
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 176), *(void *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    uint64_t v7 = (void *)v2;
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v9 = self;
    id v10 = objc_msgSend(v9, sel_interfaceWithProtocol_, &unk_26F8900D0);
    objc_msgSend(v7, sel_setExportedInterface_, v10);

    objc_msgSend(v7, sel_setExportedObject_, v8);
    objc_msgSend(v7, sel_resume);
    os_log_type_t v11 = sub_243232430();
    os_log_type_t v12 = sub_243232800();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v45[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      *(void *)(v0 + 96) = sub_24322F4E0(0xD000000000000026, 0x80000002432335A0, v45);
      sub_243232860();
      _os_log_impl(&dword_243227000, v11, v12, "%s Successfully setup XPC connection to extension", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2456761A0](v14, -1, -1);
      MEMORY[0x2456761A0](v13, -1, -1);
    }

    uint64_t v15 = *(void *)(v0 + 120);
    uint64_t v16 = *(void **)(v15
                   + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection);
    *(void *)(v15
              + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection) = v7;
    id v17 = v7;

    id v18 = objc_msgSend(v9, sel_interfaceWithProtocol_, &unk_26F89A0E8);
    objc_msgSend(v17, sel_setRemoteObjectInterface_, v18);

    id v19 = objc_msgSend(v17, sel_remoteObjectProxy);
    sub_243232880();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E858);
    if (swift_dynamicCast())
    {
      uint64_t v20 = *(void *)(v0 + 200);
      uint64_t v42 = *(void *)(v0 + 192);
      uint64_t v44 = *(void *)(v0 + 216);
      uint64_t v21 = *(void *)(v0 + 176);
      uint64_t v23 = *(void *)(v0 + 152);
      uint64_t v22 = *(void *)(v0 + 160);
      uint64_t v24 = *(void *)(v0 + 136);
      uint64_t v25 = *(void *)(v0 + 144);
      uint64_t v26 = *(void *)(v0 + 128);
      objc_msgSend(*(id *)(v0 + 80), sel_extensionLoaded);
      swift_unknownObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v44, v42);
    }
    else
    {
      uint64_t v27 = sub_243232430();
      os_log_type_t type = sub_2432327F0();
      BOOL v28 = os_log_type_enabled(v27, type);
      uint64_t v29 = *(void *)(v0 + 216);
      uint64_t v31 = *(void *)(v0 + 192);
      uint64_t v30 = *(void *)(v0 + 200);
      uint64_t v32 = *(void *)(v0 + 176);
      uint64_t v33 = *(void *)(v0 + 160);
      uint64_t v34 = *(void *)(v0 + 136);
      uint64_t v41 = *(void *)(v0 + 144);
      uint64_t v43 = *(void *)(v0 + 152);
      uint64_t v40 = *(void *)(v0 + 128);
      if (v28)
      {
        uint64_t v38 = *(void *)(v0 + 192);
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        v45[0] = v36;
        *(_DWORD *)uint64_t v35 = 136315138;
        *(void *)(v0 + 88) = sub_24322F4E0(0xD000000000000026, 0x80000002432335A0, v45);
        sub_243232860();
        _os_log_impl(&dword_243227000, v27, type, "%s Unable to retrieve extension XPC proxy", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2456761A0](v36, -1, -1);
        MEMORY[0x2456761A0](v35, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v41, v40);
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v43);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v38);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v41, v40);
        (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v43);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      }
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t sub_24322E2C0()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[25];
  (*(void (**)(void, void))(v0[20] + 8))(v0[22], v0[19]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void sub_24322E3AC()
{
  uint64_t v0 = type metadata accessor for AddDevicesExtensionStatus(0);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v14 - v4;
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_243232450();
  __swift_project_value_buffer(v6, (uint64_t)qword_268D8EC10);
  uint64_t v7 = sub_243232430();
  os_log_type_t v8 = sub_2432327F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_243227000, v7, v8, "Extension connection got interrupted", v9, 2u);
    MEMORY[0x2456761A0](v9, -1, -1);
  }

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t v10 = sub_243232840();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 4, 4, v10);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24322FB80((uint64_t)v5, (uint64_t)v3);
    swift_retain();
    sub_2432324C0();
    sub_24322FBE4((uint64_t)v5);
    swift_release();
  }
  else
  {
    os_log_type_t v11 = sub_243232430();
    os_log_type_t v12 = sub_243232800();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_243227000, v11, v12, "Extension terminal got deallocated before we could handle XPC connection interruption", v13, 2u);
      MEMORY[0x2456761A0](v13, -1, -1);
    }
  }
}

uint64_t sub_24322E634()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal__extensionStatus;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E7A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_24322F308(v0+ OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24322E6F8()
{
  return type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(0);
}

uint64_t type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(uint64_t a1)
{
  return sub_24322B25C(a1, (uint64_t *)&unk_268D8E810);
}

void sub_24322E720()
{
  sub_24322E870(319, &qword_268D8E830, type metadata accessor for AddDevicesExtensionStatus, MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F)
  {
    sub_24322E870(319, &qword_268D8E838, MEMORY[0x263F04D80], MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for AddDevicesExtensionStatus(uint64_t a1)
{
  return sub_24322B25C(a1, (uint64_t *)&unk_268D8E840);
}

void sub_24322E870(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t *sub_24322E8D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_243232840();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 4, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 4, v7);
    }
  }
  return a1;
}

uint64_t sub_24322EA20(uint64_t a1)
{
  uint64_t v2 = sub_243232840();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 4, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_24322EAF0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_243232840();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_24322EC00(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_243232840();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 4, v6);
  int v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

void *sub_24322ED74(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_243232840();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_24322EE84(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_243232840();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 4, v6);
  int v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

uint64_t sub_24322EFF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24322F00C);
}

uint64_t sub_24322F00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 5) {
    return v5 - 4;
  }
  else {
    return 0;
  }
}

uint64_t sub_24322F078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24322F08C);
}

uint64_t sub_24322F08C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 4);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_243232840();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_24322F110(uint64_t a1)
{
  uint64_t v2 = sub_243232840();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 4, v2);
}

uint64_t sub_24322F178(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 4, v4);
}

uint64_t sub_24322F1E8()
{
  uint64_t result = sub_243232840();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_24322F260@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(0);
  uint64_t result = sub_243232480();
  *a1 = result;
  return result;
}

uint64_t sub_24322F2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24322F308(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24322F368()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432324B0();
  swift_release();

  return swift_release();
}

uint64_t sub_24322F3E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddDevicesExtensionStatus(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_24322FB80(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24322FB80((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_2432324C0();
  return sub_24322FBE4((uint64_t)v7);
}

uint64_t sub_24322F4E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24322F5B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24322FC90((uint64_t)v12, *a3);
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
      sub_24322FC90((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24322F5B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_243232870();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24322F770(a5, a6);
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
  uint64_t v8 = sub_2432328C0();
  if (!v8)
  {
    sub_2432328D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2432328F0();
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

uint64_t sub_24322F770(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24322F808(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24322F9E8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24322F9E8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24322F808(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24322F980(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2432328A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2432328D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_243232780();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2432328F0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2432328D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24322F980(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E860);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24322F9E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E860);
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
  uint64_t result = sub_2432328F0();
  __break(1u);
  return result;
}

uint64_t sub_24322FB38()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24322FB70()
{
}

uint64_t sub_24322FB80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AddDevicesExtensionStatus(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24322FBE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddDevicesExtensionStatus(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_24322FC90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24322FCF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24322FD38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24322FDA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AddDevicesToAutomatedDeviceEnrollmentView()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentView()
{
  return &type metadata for AddDevicesToAutomatedDeviceEnrollmentView;
}

uint64_t sub_24323006C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243230088@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v60 = type metadata accessor for AddDevicesExtensionView();
  MEMORY[0x270FA5388](v60);
  v53 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_243232840();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v51 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E880);
  MEMORY[0x270FA5388](v61);
  uint64_t v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E888);
  MEMORY[0x270FA5388](v56);
  *(void *)&long long v58 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E890);
  MEMORY[0x270FA5388](v62);
  v59 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_243232590();
  uint64_t v48 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  int64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E898);
  uint64_t v47 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  size_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E8A0);
  uint64_t v50 = *(void *)(v57 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v57);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v49 = (char *)&v46 - v15;
  uint64_t v16 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  MEMORY[0x270FA5388](v16);
  id v18 = (uint64_t *)((char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432324B0();
  swift_release();
  swift_release();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v20 = *v18;
      uint64_t v21 = v18[1];
      uint64_t v60 = sub_243232560();
      sub_243230AC8(v20, v21, (uint64_t)&v64);
      swift_bridgeObjectRelease();
      uint64_t v22 = v65;
      LOBYTE(v21) = v66;
      long long v58 = v67;
      uint64_t v23 = v68;
      uint64_t v24 = v69;
      char v25 = v70;
      uint64_t v26 = v71;
      uint64_t v27 = v72;
      char v28 = v73;
      LODWORD(v59) = v75;
      long long v56 = v64;
      long long v57 = v74;
      char v78 = 1;
      char v77 = v70;
      char v76 = v73;
      char v29 = sub_243232630();
      LOBYTE(v64) = 1;
      *(void *)uint64_t v4 = v60;
      *((void *)v4 + 1) = 0;
      v4[16] = 1;
      *(_OWORD *)(v4 + 24) = v56;
      *((void *)v4 + 5) = v22;
      v4[48] = v21;
      *(_OWORD *)(v4 + 56) = v58;
      *((void *)v4 + 9) = v23;
      *((void *)v4 + 10) = v24;
      v4[88] = v25;
      *((void *)v4 + 12) = v26;
      *((void *)v4 + 13) = v27;
      v4[112] = v28;
      *(_OWORD *)(v4 + 120) = v57;
      v4[136] = (char)v59;
      v4[144] = v29;
      *(_OWORD *)(v4 + 168) = 0u;
      *(_OWORD *)(v4 + 152) = 0u;
      v4[184] = v64;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E8A8);
      sub_243230F40();
      sub_2432310DC();
      return sub_243232570();
    }
    else
    {
      sub_243232500();
      sub_243232580();
      uint64_t v38 = sub_24322C250(&qword_268D8E8B8, &qword_268D8E898);
      uint64_t v39 = sub_243231094(&qword_268D8E8C0, MEMORY[0x263F1A1D8]);
      uint64_t v40 = v55;
      sub_2432326B0();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v40);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v11, v9);
      uint64_t v41 = v50;
      uint64_t v42 = v49;
      uint64_t v43 = v14;
      uint64_t v44 = v57;
      (*(void (**)(char *, char *, void))(v50 + 32))(v49, v43, v57);
      (*(void (**)(void, char *, uint64_t))(v41 + 16))(v58, v42, v44);
      swift_storeEnumTagMultiPayload();
      *(void *)&long long v64 = v9;
      *((void *)&v64 + 1) = v40;
      uint64_t v65 = v38;
      uint64_t v66 = v39;
      swift_getOpaqueTypeConformance2();
      sub_243231094(&qword_268D8E8C8, (void (*)(uint64_t))type metadata accessor for AddDevicesExtensionView);
      uint64_t v45 = (uint64_t)v59;
      sub_243232570();
      sub_24323117C(v45, (uint64_t)v4);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E8A8);
      sub_243230F40();
      sub_2432310DC();
      sub_243232570();
      sub_24322C1F0(v45, &qword_268D8E890);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v42, v44);
    }
  }
  else
  {
    uint64_t v31 = v52;
    uint64_t v32 = v51;
    uint64_t v33 = v54;
    (*(void (**)(char *, uint64_t *, uint64_t))(v52 + 32))(v51, v18, v54);
    uint64_t v34 = (uint64_t)v53;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v53, v32, v33);
    sub_243231304(v34, v58, (uint64_t (*)(void))type metadata accessor for AddDevicesExtensionView);
    swift_storeEnumTagMultiPayload();
    uint64_t v35 = sub_24322C250(&qword_268D8E8B8, &qword_268D8E898);
    uint64_t v36 = sub_243231094(&qword_268D8E8C0, MEMORY[0x263F1A1D8]);
    *(void *)&long long v64 = v9;
    *((void *)&v64 + 1) = v55;
    uint64_t v65 = v35;
    uint64_t v66 = v36;
    swift_getOpaqueTypeConformance2();
    sub_243231094(&qword_268D8E8C8, (void (*)(uint64_t))type metadata accessor for AddDevicesExtensionView);
    uint64_t v37 = (uint64_t)v59;
    sub_243232570();
    sub_24323117C(v37, (uint64_t)v4);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E8A8);
    sub_243230F40();
    sub_2432310DC();
    sub_243232570();
    sub_24322C1F0(v37, &qword_268D8E890);
    sub_24323136C(v34, (uint64_t (*)(void))type metadata accessor for AddDevicesExtensionView);
    return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  }
}

uint64_t sub_243230AC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E8E8);
  MEMORY[0x270FA5388](v6 - 8);
  int64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2432326E0();
  uint64_t v10 = sub_243232660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  uint64_t v11 = sub_243232670();
  sub_24322C1F0((uint64_t)v8, &qword_268D8E8E8);
  uint64_t KeyPath = swift_getKeyPath();
  unsigned __int8 v13 = sub_243232640();
  char v14 = sub_243232650();
  sub_243232650();
  if (sub_243232650() != v13) {
    char v14 = sub_243232650();
  }
  v24[0] = a1;
  v24[1] = a2;
  sub_24323123C();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_243232680();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  uint64_t v22 = swift_getKeyPath();
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = KeyPath;
  *(void *)(a3 + 16) = v11;
  *(unsigned char *)(a3 + 24) = v14;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(unsigned char *)(a3 + 64) = 1;
  *(void *)(a3 + 72) = v15;
  *(void *)(a3 + 80) = v17;
  *(unsigned char *)(a3 + 88) = v21;
  *(void *)(a3 + 96) = v19;
  *(void *)(a3 + 104) = v22;
  *(unsigned char *)(a3 + 112) = 1;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2432312E4(v15, v17, v21);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2432312F4(v15, v17, v21);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_243230D20()
{
  return sub_2432326C0();
}

uint64_t sub_243230D3C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_243232560();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E878);
  return sub_243230088(a1 + *(int *)(v2 + 44));
}

uint64_t sub_243230DA0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2432324B0();
  swift_release();

  return swift_release();
}

uint64_t sub_243230E20(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_243231304(a1, (uint64_t)&v9 - v6, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243231304((uint64_t)v7, (uint64_t)v5, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2432324C0();
  return sub_24323136C((uint64_t)v7, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
}

unint64_t sub_243230F40()
{
  unint64_t result = qword_268D8E8B0;
  if (!qword_268D8E8B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D8E890);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D8E898);
    sub_243232590();
    sub_24322C250(&qword_268D8E8B8, &qword_268D8E898);
    sub_243231094(&qword_268D8E8C0, MEMORY[0x263F1A1D8]);
    swift_getOpaqueTypeConformance2();
    sub_243231094(&qword_268D8E8C8, (void (*)(uint64_t))type metadata accessor for AddDevicesExtensionView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8E8B0);
  }
  return result;
}

uint64_t sub_243231094(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2432310DC()
{
  unint64_t result = qword_268D8E8D0;
  if (!qword_268D8E8D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D8E8A8);
    sub_24322C250(&qword_268D8E8D8, &qword_268D8E8E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8E8D0);
  }
  return result;
}

uint64_t sub_24323117C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2432311E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_243232540();
  *a1 = result;
  return result;
}

uint64_t sub_243231210()
{
  return sub_243232550();
}

unint64_t sub_24323123C()
{
  unint64_t result = qword_268D8E8F0;
  if (!qword_268D8E8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8E8F0);
  }
  return result;
}

uint64_t sub_243231290@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_243232520();
  *a1 = result;
  return result;
}

uint64_t sub_2432312BC()
{
  return sub_243232530();
}

uint64_t sub_2432312E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2432312F4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_243231304(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24323136C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2432313CC()
{
  return sub_24322C250(&qword_268D8E8F8, &qword_268D8E900);
}

uint64_t View.automatedDeviceEnrollmentAddition(isPresented:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(unsigned char *)(v6 + 32) = a3;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8E908);
  sub_243231610();
  sub_2432326D0();

  return swift_release();
}

uint64_t sub_2432314FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(0);
  swift_allocObject();
  swift_retain_n();
  swift_retain_n();
  sub_2432290FC(a1, a2, a3);
  sub_24323174C();
  uint64_t v8 = sub_243232510();
  uint64_t v10 = v9;
  sub_243229524();
  swift_release();
  swift_release();
  uint64_t result = sub_243232630();
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = a3;
  *(void *)(a4 + 24) = v8;
  *(void *)(a4 + 32) = v10;
  *(unsigned char *)(a4 + 40) = result;
  return result;
}

uint64_t sub_2432315C4()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_243231604@<X0>(uint64_t a1@<X8>)
{
  return sub_2432314FC(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), a1);
}

unint64_t sub_243231610()
{
  unint64_t result = qword_268D8E910;
  if (!qword_268D8E910)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D8E908);
    sub_24323168C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8E910);
  }
  return result;
}

unint64_t sub_24323168C()
{
  unint64_t result = qword_268D8E918;
  if (!qword_268D8E918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8E918);
  }
  return result;
}

uint64_t sub_2432316E0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24323174C()
{
  unint64_t result = qword_268D8E920;
  if (!qword_268D8E920)
  {
    type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8E920);
  }
  return result;
}

uint64_t sub_2432317A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_243231810(uint64_t a1)
{
  uint64_t v2 = sub_243232840();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_243231874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2432318D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24323193C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2432319A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_243231A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243231A18);
}

uint64_t sub_243231A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_243231A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243231A98);
}

uint64_t sub_243231A98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243232840();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AddDevicesExtensionView()
{
  uint64_t result = qword_268D8E928;
  if (!qword_268D8E928) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_243231B54()
{
  uint64_t result = sub_243232840();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_243231BE0()
{
  return sub_243231EDC(&qword_268D8E8C8);
}

id sub_243231C14()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268D8E940);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LightContentStatusBarEXHostViewController();
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v5 = sub_243232840();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v3, v0, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v3, 0, 1, v5);
  id v7 = v4;
  sub_243232850();

  return v7;
}

void sub_243231D3C()
{
}

uint64_t sub_243231D50()
{
  return sub_2432325C0();
}

uint64_t sub_243231D8C()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_243231D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243231EDC(&qword_268D8E938);

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_243231E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243231EDC(&qword_268D8E938);

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_243231E98()
{
}

uint64_t sub_243231EDC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AddDevicesExtensionView();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_243231F20()
{
  if (qword_268D8E710 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_243232450();
  __swift_project_value_buffer(v0, (uint64_t)qword_268D8EC10);
  oslog = sub_243232430();
  os_log_type_t v1 = sub_243232800();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = swift_slowAlloc();
    uint64_t v5 = v3;
    *(_DWORD *)uint64_t v2 = 136315138;
    sub_24322F4E0(0xD000000000000022, 0x8000000243233890, &v5);
    sub_243232860();
    _os_log_impl(&dword_243227000, oslog, v1, "%s Nothing to do here yet", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2456761A0](v3, -1, -1);
    MEMORY[0x2456761A0](v2, -1, -1);
  }
  else
  {
  }
}

id sub_2432322B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LightContentStatusBarEXHostViewController()
{
  return self;
}

uint64_t sub_243232310()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_243232320()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_243232330()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_243232340()
{
  return MEMORY[0x270EEB990]();
}

uint64_t sub_243232350()
{
  return MEMORY[0x270EEB9A8]();
}

uint64_t sub_243232360()
{
  return MEMORY[0x270EEB7E8]();
}

uint64_t sub_243232370()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_243232380()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_243232390()
{
  return MEMORY[0x270EEB810]();
}

uint64_t sub_2432323A0()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_2432323B0()
{
  return MEMORY[0x270EEB830]();
}

uint64_t sub_2432323C0()
{
  return MEMORY[0x270EEB838]();
}

uint64_t sub_2432323D0()
{
  return MEMORY[0x270EEB848]();
}

uint64_t sub_2432323F0()
{
  return MEMORY[0x270EEB858]();
}

uint64_t sub_243232400()
{
  return MEMORY[0x270EEB870]();
}

uint64_t sub_243232410()
{
  return MEMORY[0x270EEB890]();
}

uint64_t sub_243232420()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_243232430()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_243232440()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_243232450()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_243232460()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_243232470()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_243232480()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_243232490()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2432324A0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2432324B0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2432324C0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2432324D0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2432324E0()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_2432324F0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_243232500()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_243232510()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_243232520()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_243232530()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_243232540()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_243232550()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_243232560()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_243232570()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_243232580()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_243232590()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_2432325A0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2432325B0()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2432325C0()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2432325E0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2432325F0()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_243232600()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_243232620()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_243232630()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_243232640()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_243232650()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_243232660()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_243232670()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_243232680()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_243232690()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2432326A0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2432326B0()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_2432326C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2432326D0()
{
  return MEMORY[0x270F037C0]();
}

uint64_t sub_2432326E0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2432326F0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_243232700()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_243232710()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_243232720()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_243232730()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_243232740()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_243232750()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_243232760()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_243232770()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_243232780()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_243232790()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2432327B0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2432327C0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2432327D0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_2432327E0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2432327F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_243232800()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_243232810()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_243232820()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_243232830()
{
  return MEMORY[0x270EEB9E0]();
}

uint64_t sub_243232840()
{
  return MEMORY[0x270EEB9F8]();
}

uint64_t sub_243232850()
{
  return MEMORY[0x270EEBA08]();
}

uint64_t sub_243232860()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_243232870()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_243232880()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_243232890()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2432328A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2432328B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2432328C0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2432328D0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2432328E0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2432328F0()
{
  return MEMORY[0x270F9F0C0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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