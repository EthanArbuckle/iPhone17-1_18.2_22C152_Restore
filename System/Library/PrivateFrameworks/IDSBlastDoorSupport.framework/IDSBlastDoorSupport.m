uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
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

void sub_1D468F548(uint64_t a1, void (*a2)(void *, void *), uint64_t a3, uint64_t (*a4)(void), uint64_t *a5)
{
  uint64_t v8 = a4(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  v11 = (char *)&v16 - v10;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x1F4188790]();
  v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1D4692254(a1, (uint64_t)v13, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = (void *)*v13;
    MEMORY[0x1D944C7D0](*v13);
    a2(0, v14);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v9 + 32))(v11, v13, v8);
    v15 = (void *)sub_1D4692398();
    a2(v15, 0);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1D468F718(void *a1, void (*a2)(void, void *), uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1D4692458();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1[2]
    || (unint64_t v10 = sub_1D4690D30(99, 0xE100000000000000), (v11 & 1) == 0)
    || (sub_1D4690DFC(a1[7] + 32 * v10, (uint64_t)&v44), (swift_dynamicCast() & 1) == 0))
  {
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    v25 = (void *)sub_1D46924D8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA701578);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1D46928C0;
    id v44 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA701580);
    uint64_t v27 = sub_1D4692438();
    uint64_t v29 = v28;
    *(void *)(v26 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v26 + 64) = sub_1D4690DA8();
    *(void *)(v26 + 32) = v27;
    *(void *)(v26 + 40) = v29;
    sub_1D4692328();

    swift_bridgeObjectRelease();
LABEL_12:
    sub_1D4692448();
    sub_1D469102C(&qword_1EA701590, MEMORY[0x1E4F50A28]);
    v30 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v31, v9, v6);
    a2(0, v30);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v12 = (void *)v43[2];
  uint64_t v13 = sub_1D46923A8();
  if (v14)
  {
    uint64_t v13 = sub_1D46923A8();
    if (v15)
    {
      sub_1D4692498();
      sub_1D4690FF0(0, &qword_1EA701570);
      v36 = (void *)sub_1D46924D8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA701578);
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = xmmword_1D46928C0;
      id v44 = v12;
      char v45 = 0;
      uint64_t v38 = sub_1D4692438();
      uint64_t v40 = v39;
      *(void *)(v37 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v37 + 64) = sub_1D4690DA8();
      *(void *)(v37 + 32) = v38;
      *(void *)(v37 + 40) = v40;
      sub_1D4692328();

      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  uint64_t v16 = v13;
  v17 = self;
  v18 = (void *)sub_1D4692468();
  id v44 = 0;
  id v19 = objc_msgSend(v17, sel_dataWithPropertyList_format_options_error_, v18, 200, 0, &v44);

  if (!v19)
  {
    id v33 = v44;
    v34 = (void *)sub_1D4692308();

    swift_willThrow();
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    v35 = (void *)sub_1D46924D8();
    sub_1D4692328();

    goto LABEL_12;
  }
  id v20 = v44;
  uint64_t v21 = sub_1D4692318();
  unint64_t v23 = v22;

  if (v16 == 97)
  {
    sub_1D4692428();
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = a2;
    *(void *)(v41 + 24) = a3;
    sub_1D469102C(&qword_1EBD85910, MEMORY[0x1E4F509D8]);
    swift_retain();
  }
  else
  {
    if (v16 == 255)
    {
      sub_1D46923D8();
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = a2;
      *(void *)(v24 + 24) = a3;
      sub_1D469102C(&qword_1EBD85908, MEMORY[0x1E4F50840]);
    }
    else
    {
      sub_1D46923C8();
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = a2;
      *(void *)(v42 + 24) = a3;
      sub_1D469102C(&qword_1EBD858D8, MEMORY[0x1E4F506F8]);
    }
    swift_retain();
  }
  sub_1D4692378();
  swift_release();
  return sub_1D4690ED0(v21, v23);
}

void sub_1D468FEC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1D46922F8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_1D468FF38(uint64_t a1, uint64_t a2, void (*a3)(void, void *), uint64_t a4)
{
  v45[4] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v7 = sub_1D4692458();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  unint64_t v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1D4692418();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = self;
  char v15 = (void *)sub_1D4692468();
  v45[0] = 0;
  id v16 = objc_msgSend(v14, sel_dataWithPropertyList_format_options_error_, v15, 200, 0, v45);

  id v17 = v45[0];
  if (!v16)
  {
    id v33 = v17;
    v34 = (void *)sub_1D4692308();

    swift_willThrow();
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    v35 = (void *)sub_1D46924D8();
    sub_1D4692328();

    sub_1D4692448();
    sub_1D469102C(&qword_1EA701590, MEMORY[0x1E4F50A28]);
    uint64_t v31 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v36, v10, v7);
    a3(0, v31);
    goto LABEL_16;
  }
  uint64_t v18 = a4;
  uint64_t v19 = sub_1D4692318();
  unint64_t v43 = v20;

  if (!*(void *)(a2 + 16)
    || (unint64_t v21 = sub_1D4690D30(0x6369706F74, 0xE500000000000000), (v22 & 1) == 0)
    || (sub_1D4690DFC(*(void *)(a2 + 56) + 32 * v21, (uint64_t)v45), (swift_dynamicCast() & 1) == 0))
  {
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    v30 = (void *)sub_1D46924D8();
    sub_1D4692328();

LABEL_14:
    sub_1D4692448();
    sub_1D469102C(&qword_1EA701590, MEMORY[0x1E4F50A28]);
    uint64_t v31 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v32, v10, v7);
    a3(0, v31);
    sub_1D4690ED0(v19, v43);
LABEL_16:

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  if (!*(void *)(a2 + 16)
    || (v40[1] = v44, unint64_t v23 = sub_1D4690D30(0x646E616D6D6F63, 0xE700000000000000), (v24 & 1) == 0)
    || (sub_1D4690DFC(*(void *)(a2 + 56) + 32 * v23, (uint64_t)v45), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    uint64_t v37 = (void *)sub_1D46924D8();
    sub_1D4692328();

    goto LABEL_14;
  }
  if (*(void *)(a2 + 16)
    && (unint64_t v25 = sub_1D4690D30(0xD000000000000015, 0x80000001D4692A60), (v26 & 1) != 0)
    && (sub_1D4690DFC(*(void *)(a2 + 56) + 32 * v25, (uint64_t)v45), swift_dynamicCast())
    && (v44 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_1D46923B8();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = a3;
    *(void *)(v27 + 24) = v18;
    sub_1D469102C(&qword_1EA7015A8, MEMORY[0x1E4F506B0]);
    swift_retain();
    unint64_t v28 = v43;
    sub_1D4692378();
    swift_release();
    return sub_1D4690ED0(v19, v28);
  }
  else
  {
    sub_1D4692408();
    sub_1D46923F8();
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = a3;
    *(void *)(v38 + 24) = v18;
    sub_1D469102C(&qword_1EA7015A0, MEMORY[0x1E4F508D8]);
    swift_retain();
    unint64_t v39 = v43;
    sub_1D4692368();
    sub_1D4690ED0(v19, v39);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v13, v42);
  }
}

void sub_1D4690718(uint64_t a1, void (*a2)(void *, void *))
{
  uint64_t v4 = sub_1D46923F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA7015B8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (uint64_t *)((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1D4692254(a1, (uint64_t)v9, &qword_1EA7015B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    unint64_t v10 = (void *)*v9;
    MEMORY[0x1D944C7D0](*v9);
    a2(0, v10);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v5 + 32))(v7, v9, v4);
    uint64_t v11 = (void *)sub_1D46923E8();
    a2(v11, 0);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id IDSBlastDoorInterface.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id IDSBlastDoorInterface.init()()
{
  uint64_t v10 = sub_1D46924B8();
  uint64_t v1 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D46924A8();
  MEMORY[0x1F4188790]();
  sub_1D4692348();
  MEMORY[0x1F4188790]();
  uint64_t v9 = OBJC_IVAR___IDSBlastDoorInterfaceInternal_bd;
  v8[2] = sub_1D4692388();
  uint64_t v4 = (void *)*MEMORY[0x1E4F50A38];
  sub_1D4690FF0(0, &qword_1EBD858F8);
  id v5 = v0;
  v8[0] = v4;
  sub_1D4692338();
  uint64_t v12 = MEMORY[0x1E4FBC860];
  sub_1D469102C(&qword_1EBD858F0, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD858E0);
  sub_1D4691074();
  sub_1D46924E8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCC58], v10);
  sub_1D46924C8();
  *(void *)(v8[1] + v9) = sub_1D4692358();

  uint64_t v6 = (objc_class *)type metadata accessor for IDSBlastDoorInterface();
  v11.receiver = v5;
  v11.super_class = v6;
  return objc_msgSendSuper2(&v11, sel_init);
}

id IDSBlastDoorInterface.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IDSBlastDoorInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1D4690D30(uint64_t a1, uint64_t a2)
{
  sub_1D4692508();
  sub_1D4692488();
  uint64_t v4 = sub_1D4692518();

  return sub_1D4691174(a1, a2, v4);
}

unint64_t sub_1D4690DA8()
{
  unint64_t result = qword_1EA701588;
  if (!qword_1EA701588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA701588);
  }
  return result;
}

uint64_t sub_1D4690DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1D4690E58()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1D4690E90(uint64_t a1)
{
  sub_1D468F548(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F506F8], &qword_1EBD85900);
}

uint64_t sub_1D4690ED0(uint64_t a1, unint64_t a2)
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

void sub_1D4690F28(uint64_t a1)
{
  sub_1D468F548(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F509D8], &qword_1EBD85920);
}

void sub_1D4690F68(uint64_t a1)
{
  sub_1D468F548(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50840], &qword_1EBD85918);
}

void sub_1D4690FA8(uint64_t a1)
{
  sub_1D4690718(a1, *(void (**)(void *, void *))(v1 + 16));
}

void sub_1D4690FB0(uint64_t a1)
{
  sub_1D468F548(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F506B0], &qword_1EA7015B0);
}

uint64_t sub_1D4690FF0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1D469102C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1D4691074()
{
  unint64_t result = qword_1EBD858E8;
  if (!qword_1EBD858E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBD858E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBD858E8);
  }
  return result;
}

uint64_t type metadata accessor for IDSBlastDoorInterface()
{
  return self;
}

uint64_t method lookup function for IDSBlastDoorInterface(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for IDSBlastDoorInterface);
}

uint64_t dispatch thunk of IDSBlastDoorInterface.unpack(payloadDictionary:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of IDSBlastDoorInterface.unpack(clientMessage:context:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

unint64_t sub_1D4691174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1D46924F8() & 1) == 0)
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
      while (!v14 && (sub_1D46924F8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1D4691258(void *a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1D4692458();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  uint64_t v10 = a1[2];
  _Block_copy(a3);
  if (!v10
    || (unint64_t v11 = sub_1D4690D30(99, 0xE100000000000000), (v12 & 1) == 0)
    || (sub_1D4690DFC(a1[7] + 32 * v11, (uint64_t)&v46), !swift_dynamicCast()))
  {
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    char v26 = (void *)sub_1D46924D8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA701578);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_1D46928C0;
    id v46 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA701580);
    uint64_t v28 = sub_1D4692438();
    uint64_t v30 = v29;
    *(void *)(v27 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v27 + 64) = sub_1D4690DA8();
    *(void *)(v27 + 32) = v28;
    *(void *)(v27 + 40) = v30;
    sub_1D4692328();

    swift_bridgeObjectRelease();
LABEL_12:
    sub_1D4692448();
    sub_1D469102C(&qword_1EA701590, MEMORY[0x1E4F50A28]);
    uint64_t v31 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v32, v8, v5);
    id v33 = (void *)sub_1D46922F8();
    ((void (**)(void, void, void *))a3)[2](a3, 0, v33);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_release();
  }
  uint64_t v13 = (void *)v45[2];
  uint64_t v14 = sub_1D46923A8();
  if (v15)
  {
    uint64_t v14 = sub_1D46923A8();
    if (v16)
    {
      sub_1D4692498();
      sub_1D4690FF0(0, &qword_1EA701570);
      uint64_t v38 = (void *)sub_1D46924D8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA701578);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_1D46928C0;
      id v46 = v13;
      char v47 = 0;
      uint64_t v40 = sub_1D4692438();
      uint64_t v42 = v41;
      *(void *)(v39 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v39 + 64) = sub_1D4690DA8();
      *(void *)(v39 + 32) = v40;
      *(void *)(v39 + 40) = v42;
      sub_1D4692328();

      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  uint64_t v17 = v14;
  uint64_t v18 = self;
  uint64_t v19 = (void *)sub_1D4692468();
  id v46 = 0;
  id v20 = objc_msgSend(v18, sel_dataWithPropertyList_format_options_error_, v19, 200, 0, &v46);

  if (!v20)
  {
    id v35 = v46;
    uint64_t v36 = (void *)sub_1D4692308();

    swift_willThrow();
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    uint64_t v37 = (void *)sub_1D46924D8();
    sub_1D4692328();

    goto LABEL_12;
  }
  id v21 = v46;
  uint64_t v22 = sub_1D4692318();
  unint64_t v24 = v23;

  if (v17 == 97)
  {
    sub_1D4692428();
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = sub_1D46922B8;
    *(void *)(v43 + 24) = v9;
    sub_1D469102C(&qword_1EBD85910, MEMORY[0x1E4F509D8]);
    swift_retain();
  }
  else
  {
    if (v17 == 255)
    {
      sub_1D46923D8();
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = sub_1D46922B8;
      *(void *)(v25 + 24) = v9;
      sub_1D469102C(&qword_1EBD85908, MEMORY[0x1E4F50840]);
    }
    else
    {
      sub_1D46923C8();
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = sub_1D46922B8;
      *(void *)(v44 + 24) = v9;
      sub_1D469102C(&qword_1EBD858D8, MEMORY[0x1E4F506F8]);
    }
    swift_retain();
  }
  sub_1D4692378();
  swift_release();
  sub_1D4690ED0(v22, v24);
  return swift_release();
}

uint64_t sub_1D46919CC(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v44 = a3;
  v47[4] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1D4692418();
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v43 = v6;
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1D4692458();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  char v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = a4;
  uint64_t v13 = self;
  _Block_copy(a4);
  uint64_t v14 = (void *)sub_1D4692468();
  v47[0] = 0;
  id v15 = objc_msgSend(v13, sel_dataWithPropertyList_format_options_error_, v14, 200, 0, v47);

  id v16 = v47[0];
  if (!v15)
  {
    id v33 = v16;
    v34 = (void *)sub_1D4692308();

    swift_willThrow();
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    id v35 = (void *)sub_1D46924D8();
    sub_1D4692328();

    sub_1D4692448();
    sub_1D469102C(&qword_1EA701590, MEMORY[0x1E4F50A28]);
    uint64_t v30 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v36, v12, v9);
    uint64_t v37 = (void *)sub_1D46922F8();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v37);

    goto LABEL_16;
  }
  uint64_t v17 = sub_1D4692318();
  unint64_t v19 = v18;

  if (!*(void *)(a2 + 16)
    || (unint64_t v20 = sub_1D4690D30(0x6369706F74, 0xE500000000000000), (v21 & 1) == 0)
    || (sub_1D4690DFC(*(void *)(a2 + 56) + 32 * v20, (uint64_t)v47), !swift_dynamicCast()))
  {
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    uint64_t v29 = (void *)sub_1D46924D8();
    sub_1D4692328();

LABEL_14:
    sub_1D4692448();
    sub_1D469102C(&qword_1EA701590, MEMORY[0x1E4F50A28]);
    uint64_t v30 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v31, v12, v9);
    uint64_t v32 = (void *)sub_1D46922F8();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v32);

    sub_1D4690ED0(v17, v19);
LABEL_16:

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return swift_release();
  }
  if (!*(void *)(a2 + 16)
    || (v41[1] = v46, unint64_t v22 = sub_1D4690D30(0x646E616D6D6F63, 0xE700000000000000), (v23 & 1) == 0)
    || (sub_1D4690DFC(*(void *)(a2 + 56) + 32 * v22, (uint64_t)v47), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_1D4692498();
    sub_1D4690FF0(0, &qword_1EA701570);
    uint64_t v39 = (void *)sub_1D46924D8();
    sub_1D4692328();

    goto LABEL_14;
  }
  if (!*(void *)(a2 + 16) || (unint64_t v24 = sub_1D4690D30(0xD000000000000015, 0x80000001D4692A60), (v25 & 1) == 0))
  {
    uint64_t v27 = v45;
LABEL_20:
    sub_1D4692408();
    sub_1D46923F8();
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = sub_1D469224C;
    *(void *)(v40 + 24) = v27;
    sub_1D469102C(&qword_1EA7015A0, MEMORY[0x1E4F508D8]);
    swift_retain();
    sub_1D4692368();
    sub_1D4690ED0(v17, v19);
    swift_release();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v43);
    return swift_release();
  }
  sub_1D4690DFC(*(void *)(a2 + 56) + 32 * v24, (uint64_t)v47);
  int v26 = swift_dynamicCast();
  uint64_t v27 = v45;
  if (!v26 || (v46 & 1) == 0) {
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  sub_1D46923B8();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_1D469224C;
  *(void *)(v28 + 24) = v27;
  sub_1D469102C(&qword_1EA7015A8, MEMORY[0x1E4F506B0]);
  swift_retain();
  sub_1D4692378();
  swift_release();
  sub_1D4690ED0(v17, v19);
  return swift_release();
}

uint64_t sub_1D4692214()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1D469224C(uint64_t a1, uint64_t a2)
{
  sub_1D468FEC8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1D4692254(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1D46922F8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D4692308()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D4692318()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1D4692328()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1D4692338()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D4692348()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D4692358()
{
  return MEMORY[0x1F410CA50]();
}

uint64_t sub_1D4692368()
{
  return MEMORY[0x1F410CA68]();
}

uint64_t sub_1D4692378()
{
  return MEMORY[0x1F410CA88]();
}

uint64_t sub_1D4692388()
{
  return MEMORY[0x1F410CAA0]();
}

uint64_t sub_1D4692398()
{
  return MEMORY[0x1F410CAA8]();
}

uint64_t sub_1D46923A8()
{
  return MEMORY[0x1F410CB18]();
}

uint64_t sub_1D46923B8()
{
  return MEMORY[0x1F410CBF8]();
}

uint64_t sub_1D46923C8()
{
  return MEMORY[0x1F410CC38]();
}

uint64_t sub_1D46923D8()
{
  return MEMORY[0x1F410CD40]();
}

uint64_t sub_1D46923E8()
{
  return MEMORY[0x1F410CD88]();
}

uint64_t sub_1D46923F8()
{
  return MEMORY[0x1F410CD90]();
}

uint64_t sub_1D4692408()
{
  return MEMORY[0x1F410CDB0]();
}

uint64_t sub_1D4692418()
{
  return MEMORY[0x1F410CDB8]();
}

uint64_t sub_1D4692428()
{
  return MEMORY[0x1F410CE68]();
}

uint64_t sub_1D4692438()
{
  return MEMORY[0x1F410CE88]();
}

uint64_t sub_1D4692448()
{
  return MEMORY[0x1F410CF60]();
}

uint64_t sub_1D4692458()
{
  return MEMORY[0x1F410CF68]();
}

uint64_t sub_1D4692468()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D4692478()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1D4692488()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D4692498()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D46924A8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1D46924B8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1D46924C8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1D46924D8()
{
  return MEMORY[0x1F410CF88]();
}

uint64_t sub_1D46924E8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D46924F8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D4692508()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D4692518()
{
  return MEMORY[0x1F4185EF8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}