void sub_232E42534(void *a1)
{
  void *v1;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t vars8;

  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, a1);
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687548F0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_232E5BC30;
  v5 = objc_msgSend(a1, sel_centerXAnchor);
  v6 = objc_msgSend(v1, sel_centerXAnchor);
  v7 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v6);

  *(void *)(v4 + 32) = v7;
  v8 = objc_msgSend(a1, sel_centerYAnchor);
  v9 = objc_msgSend(v1, sel_centerYAnchor);
  v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

  *(void *)(v4 + 40) = v10;
  sub_232E5AF48();
  sub_232E42758();
  v11 = (id)sub_232E5AF18();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_activateConstraints_, v11);
}

BOOL sub_232E426E4(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_232E426F8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_232E42708(void *a1@<X8>)
{
  *a1 = *v1;
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

unint64_t sub_232E42758()
{
  unint64_t result = qword_2687548F8;
  if (!qword_2687548F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687548F8);
  }
  return result;
}

void type metadata accessor for SDBetaManagerErrorType()
{
  if (!qword_268754900)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, &qword_268754900);
    }
  }
}

uint64_t sub_232E427F0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

id sub_232E42804(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 8))();
  swift_getMetatypeMetadata();
  sub_232E5AEE8();
  id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
  v3 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  return v5;
}

unint64_t sub_232E428E0()
{
  return 0xD000000000000020;
}

void sub_232E428FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = sub_232E42804(a4, a5);
  id v7 = (id)sub_232E5AEC8();
  objc_msgSend(v6, sel_ulog_message_, a1, v7);
}

void sub_232E42984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

unint64_t sub_232E4299C()
{
  return 0xD000000000000020;
}

unint64_t sub_232E429BC()
{
  return 0xD000000000000020;
}

uint64_t sub_232E429EC(double a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  objc_msgSend(v2, sel_setMaximumFractionDigits_, 3);
  if (a1 >= 0.001)
  {
    id v4 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
    id v5 = objc_msgSend(v2, sel_stringFromNumber_, v4);

    if (v5)
    {
      uint64_t v6 = sub_232E5AED8();

      uint64_t v7 = v6;
      sub_232E5AF08();
    }
    else
    {
      uint64_t v7 = 0;
      sub_232E5AFC8();
    }

    return v7;
  }
  else
  {

    return 0x736D31203CLL;
  }
}

uint64_t sub_232E42B18(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_232E42B40()
{
  *(void *)(v1 + 88) = v0;
  *(void *)(v1 + 96) = *v0;
  return MEMORY[0x270FA2498](sub_232E42B88, v0, 0);
}

uint64_t sub_232E42B88()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  sub_232E5B058();
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0xE000000000000000;
  sub_232E5AF08();
  char v3 = *(unsigned char *)(v2 + 144);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 128);
  *(unsigned char *)(v0 + 32) = v3;
  sub_232E5B078();
  sub_232E428FC(60, *(void *)(v0 + 40), *(void *)(v0 + 48), v1, (uint64_t)&off_26E699188);
  swift_bridgeObjectRelease();
  unint64_t v4 = *(void *)(v2 + 128);
  unint64_t v5 = *(void *)(v2 + 136);
  switch(*(unsigned char *)(v2 + 144))
  {
    case 1:
      uint64_t v9 = *(void *)(v0 + 88);
      goto LABEL_6;
    case 2:
      uint64_t v9 = *(void *)(v0 + 88);
      unint64_t v13 = *(void *)(v9 + 168);
      if ((v13 & 0x8000000000000000) == 0 && v13 >= v5) {
        goto LABEL_10;
      }
LABEL_6:
      if (*(void *)(v9 + 160))
      {
        sub_232E44DAC();
        v11 = (void *)swift_allocError();
        char v12 = 1;
        goto LABEL_11;
      }
      *(void *)(v9 + 160) = sub_232E43940(*(double *)(v2 + 128));
      swift_release();
      goto LABEL_18;
    case 3:
      if (v4 | v5) {
        goto LABEL_18;
      }
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v7;
      *uint64_t v7 = v0;
      v8 = sub_232E42FB0;
      goto LABEL_14;
    default:
      unint64_t v6 = *(void *)(*(void *)(v0 + 88) + 168);
      if ((v6 & 0x8000000000000000) != 0 || v6 < v4)
      {
        uint64_t v7 = (void *)swift_task_alloc();
        *(void *)(v0 + 120) = v7;
        *uint64_t v7 = v0;
        v8 = sub_232E430E4;
LABEL_14:
        v7[1] = v8;
        uint64_t v19 = *(void *)(v0 + 88);
        v7[3] = v19;
        return MEMORY[0x270FA2498](sub_232E435D0, v19, 0);
      }
      else
      {
LABEL_10:
        sub_232E44DAC();
        v11 = (void *)swift_allocError();
        char v12 = 2;
LABEL_11:
        char *v10 = v12;
        swift_willThrow();
        sub_232E5B058();
        *(void *)(v0 + 56) = 0;
        *(void *)(v0 + 64) = 0xE000000000000000;
        sub_232E5AF08();
        *(void *)(v0 + 72) = v11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
        sub_232E5B078();
        *(void *)(v0 + 80) = type metadata accessor for XPCConnectionManager();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268754958);
        sub_232E5AEE8();
        id v14 = objc_allocWithZone(MEMORY[0x263F38560]);
        v15 = (void *)sub_232E5AEC8();
        v16 = (void *)sub_232E5AEC8();
        swift_bridgeObjectRelease();
        id v17 = objc_msgSend(v14, sel_initWithSubsystem_category_, v15, v16);

        v18 = (void *)sub_232E5AEC8();
        objc_msgSend(v17, sel_ulog_message_, 60, v18);

        swift_bridgeObjectRelease();
LABEL_18:
        v20 = *(uint64_t (**)(void))(v0 + 8);
        return v20();
      }
  }
}

uint64_t sub_232E42FB0()
{
  uint64_t v2 = (void *)*v1;
  v2[14] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[11];
    return MEMORY[0x270FA2498](sub_232E43218, v3, 0);
  }
  else
  {
    unint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_232E430E4()
{
  uint64_t v2 = (void *)*v1;
  v2[16] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[11];
    return MEMORY[0x270FA2498](sub_232E433E4, v3, 0);
  }
  else
  {
    unint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_232E43218()
{
  uint64_t v1 = (void *)v0[14];
  sub_232E5B058();
  v0[7] = 0;
  v0[8] = 0xE000000000000000;
  sub_232E5AF08();
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
  sub_232E5B078();
  v0[10] = type metadata accessor for XPCConnectionManager();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754958);
  sub_232E5AEE8();
  id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v3 = (void *)sub_232E5AEC8();
  unint64_t v4 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  uint64_t v6 = (void *)sub_232E5AEC8();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);

  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_232E433E4()
{
  uint64_t v1 = (void *)v0[16];
  sub_232E5B058();
  v0[7] = 0;
  v0[8] = 0xE000000000000000;
  sub_232E5AF08();
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
  sub_232E5B078();
  v0[10] = type metadata accessor for XPCConnectionManager();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754958);
  sub_232E5AEE8();
  id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v3 = (void *)sub_232E5AEC8();
  unint64_t v4 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  uint64_t v6 = (void *)sub_232E5AEC8();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);

  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_232E435B0()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_232E435D0, v0, 0);
}

uint64_t sub_232E435D0()
{
  uint64_t v1 = v0[3];
  sub_232E5B058();
  uint64_t v2 = swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v1 + 168);
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = v0[3];
    v0[2] = v7;
    sub_232E5B0B8();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E5AF08();
    sub_232E55180(0xD000000000000015, 0x8000000232E5CF30);
    swift_bridgeObjectRelease();
    *(void *)(v8 + 160) = 0;
    swift_release();
    sub_232E5AF78();
    v0[4] = sub_232E5AF68();
    uint64_t v9 = sub_232E5AF58();
    uint64_t v11 = v10;
    uint64_t v2 = (uint64_t)sub_232E4371C;
    uint64_t v3 = v9;
    uint64_t v4 = v11;
  }
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_232E4371C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  uint64_t v2 = *(void **)(v1 + 152);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    uint64_t v3 = *(void **)(v1 + 152);
    *(void *)(v1 + 152) = 0;
  }
  uint64_t v4 = *(void *)(v0 + 24);
  return MEMORY[0x270FA2498](sub_232E437A4, v4, 0);
}

void sub_232E437A4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 + 168);
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v1 + 168) = v4;
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_232E4384C;
    sub_232E44174();
  }
}

uint64_t sub_232E4384C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_232E43940(double a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = 0;
  uint64_t v9 = 0xE000000000000000;
  sub_232E5B058();
  sub_232E5AF08();
  sub_232E5AFC8();
  sub_232E5AF08();
  sub_232E55180(v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_232E5AF98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = 0;
  *(double *)(v6 + 32) = a1;
  *(void *)(v6 + 40) = v5;
  return sub_232E43FF4((uint64_t)v3, (uint64_t)&unk_268754948, v6);
}

uint64_t sub_232E43AE8(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 48) = a5;
  *(double *)(v5 + 40) = a1;
  return MEMORY[0x270FA2498](sub_232E43B0C, 0, 0);
}

uint64_t sub_232E43B0C(unint64_t a1)
{
  double v2 = *(double *)(v1 + 40) * 1000000000.0;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 >= 1.84467441e19)
  {
LABEL_9:
    __break(1u);
    return MEMORY[0x270FA1FF0](a1);
  }
  unint64_t v3 = (unint64_t)v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v4;
  void *v4 = v1;
  v4[1] = sub_232E43BF0;
  a1 = v3;
  return MEMORY[0x270FA1FF0](a1);
}

uint64_t sub_232E43BF0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_232E43D24, 0, 0);
  }
}

uint64_t sub_232E43D24()
{
  uint64_t v1 = v0[8];
  sub_232E5AFA8();
  if (v1)
  {
    uint64_t v2 = (uint64_t (*)(void))v0[1];
LABEL_3:
    return v2();
  }
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[9] = Strong;
  if (!Strong)
  {
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    goto LABEL_3;
  }
  uint64_t v5 = (void *)swift_task_alloc();
  v0[10] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_232E43E54;
  v5[3] = Strong;
  return MEMORY[0x270FA2498](sub_232E435D0, Strong, 0);
}

uint64_t sub_232E43E54()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_232E43F90, 0, 0);
  }
  else
  {
    swift_release();
    unint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_232E43F90()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_232E43FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_232E5AF98();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_232E5AF88();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_232E45114(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_232E5AF58();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_232E44174()
{
  v1[8] = v0;
  v1[9] = *v0;
  sub_232E5AF78();
  v1[10] = sub_232E5AF68();
  uint64_t v3 = sub_232E5AF58();
  v1[11] = v3;
  v1[12] = v2;
  return MEMORY[0x270FA2498](sub_232E44234, v3, v2);
}

uint64_t sub_232E44234()
{
  uint64_t v1 = *(void *)(v0 + 64);
  if (*(void *)(v1 + 152))
  {
    swift_release();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    sub_232E55180(0x676E697472617453, 0xE800000000000000);
    return MEMORY[0x270FA2498](sub_232E442F4, v1, 0);
  }
}

uint64_t sub_232E442F4()
{
  uint64_t v1 = v0[8];
  v0[13] = *(void *)(v1 + 112);
  v0[14] = *(void *)(v1 + 120);
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  swift_unknownObjectRetain();
  return MEMORY[0x270FA2498](sub_232E4437C, v2, v3);
}

uint64_t sub_232E4437C()
{
  uint64_t v1 = v0[13];
  swift_release();
  if (v1)
  {
    uint64_t v2 = v0[14];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2);
    swift_unknownObjectRelease();
    uint64_t v5 = v0[8];
    uint64_t v6 = v0[9];
    v0[6] = sub_232E44D30;
    v0[7] = v5;
    uint64_t v7 = MEMORY[0x263EF8330];
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_232E44AB0;
    v0[5] = &block_descriptor_2;
    uint64_t v8 = _Block_copy(v0 + 2);
    swift_retain();
    swift_release();
    objc_msgSend(v4, sel_setInterruptionHandler_, v8);
    _Block_release(v8);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v6;
    v0[6] = sub_232E44D60;
    v0[7] = v9;
    v0[2] = v7;
    v0[3] = 1107296256;
    v0[4] = sub_232E44AB0;
    v0[5] = &block_descriptor_26;
    uint64_t v10 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v4, sel_setInvalidationHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v4, sel_resume);
    sub_232E55180(0xD000000000000012, 0x8000000232E5CEF0);
    uint64_t v11 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v4;
  }
  else
  {
    sub_232E44DAC();
    swift_allocError();
    *uint64_t v13 = 0;
    swift_willThrow();
  }
  char v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_232E445CC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_232E5AF98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  sub_232E5AF78();
  swift_retain();
  uint64_t v4 = sub_232E5AF68();
  uint64_t v5 = (void *)swift_allocObject();
  uint64_t v6 = MEMORY[0x263F8F500];
  v5[2] = v4;
  v5[3] = v6;
  v5[4] = v3;
  swift_release();
  sub_232E4C264((uint64_t)v1, (uint64_t)&unk_268754938, (uint64_t)v5);
  return swift_release();
}

uint64_t sub_232E44714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a1;
  v4[6] = a4;
  sub_232E5AF78();
  v4[7] = sub_232E5AF68();
  uint64_t v6 = sub_232E5AF58();
  v4[8] = v6;
  v4[9] = v5;
  return MEMORY[0x270FA2498](sub_232E447AC, v6, v5);
}

uint64_t sub_232E447AC()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 80) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v3;
    void *v3 = v0;
    v3[1] = sub_232E448F8;
    v3[11] = v2;
    v3[12] = *v2;
    return MEMORY[0x270FA2498](sub_232E42B88, v2, 0);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 40) = *(void *)(v0 + 80) == 0;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_232E448F8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_232E44A3C, v3, v2);
}

uint64_t sub_232E44A3C()
{
  swift_release();
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 80) == 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_232E44AB0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_232E44AF4()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for XPCConnectionManager()
{
  return self;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCConnectionManager.ReconnectPolicy(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCConnectionManager.ReconnectPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_232E44C04(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_232E44C20(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCConnectionManager.ReconnectPolicy()
{
  return &type metadata for XPCConnectionManager.ReconnectPolicy;
}

uint64_t sub_232E44C48()
{
  return v0;
}

BOOL sub_232E44C54(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_232E44C68()
{
  return sub_232E5B168();
}

uint64_t sub_232E44CB0()
{
  return sub_232E5B158();
}

uint64_t sub_232E44CDC()
{
  return sub_232E5B168();
}

uint64_t sub_232E44D30()
{
  return sub_232E445CC();
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

uint64_t sub_232E44D50()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_232E44D60()
{
  sub_232E42984(0x6164696C61766E49, 0xEB00000000646574, *(void *)(v0 + 16), (uint64_t)&off_26E699188);
}

unint64_t sub_232E44DAC()
{
  unint64_t result = qword_268754920;
  if (!qword_268754920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754920);
  }
  return result;
}

uint64_t sub_232E44E00()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_232E44E38()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E44E78(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E44F2C;
  return sub_232E44714(a1, v4, v5, v6);
}

uint64_t sub_232E44F2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_232E45020()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_232E45060()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_232E44F2C;
  v4[6] = v3;
  v4[5] = v2;
  return MEMORY[0x270FA2498](sub_232E43B0C, 0, 0);
}

uint64_t sub_232E45114(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCConnectionManager.ManagerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for XPCConnectionManager.ManagerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E452DCLL);
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

uint64_t sub_232E45304(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_232E4530C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCConnectionManager.ManagerError()
{
  return &type metadata for XPCConnectionManager.ManagerError;
}

unint64_t sub_232E45328()
{
  unint64_t result = qword_268754960;
  if (!qword_268754960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754960);
  }
  return result;
}

id sub_232E45384()
{
  return sub_232E4539C();
}

id sub_232E4539C()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  v5[0] = 0;
  id v1 = objc_msgSend(v0, sel_makeXPCConnectionWithError_, v5);
  if (v1)
  {
    id v2 = v5[0];
  }
  else
  {
    id v3 = v5[0];
    sub_232E5AC98();

    swift_willThrow();
  }
  return v1;
}

uint64_t sub_232E45454(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_232E45468(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_232E4547C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_232E45490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_232E454A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t initializeBufferWithCopyOfBuffer for AnalyticsString(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnalyticsString()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AnalyticsString(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AnalyticsString(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

void *assignWithTake for AnalyticsString(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsString(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsString(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsString()
{
  return &type metadata for AnalyticsString;
}

uint64_t destroy for AnalyticsFloat()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22HomePlatformSettingsUI14AnalyticsFloatVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AnalyticsFloat(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy21_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(void *)(a1 + 13) = *(void *)(a2 + 13);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AnalyticsFloat(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsFloat(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 21)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnalyticsFloat(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 21) = 1;
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
    *(unsigned char *)(result + 21) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsFloat()
{
  return &type metadata for AnalyticsFloat;
}

uint64_t sub_232E4587C()
{
  return MEMORY[0x263F8D638];
}

uint64_t sub_232E45888()
{
  return MEMORY[0x263F8D378];
}

uint64_t sub_232E45894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v5 = a5;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_232E458E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, void (*a12)(void))
{
  char v12 = (uint64_t (*)(void))a12;
  if (a11 == 1)
  {
    a12();
    char v12 = (uint64_t (*)(void))a12;
  }
  else if (a11)
  {
    return result;
  }
  return v12();
}

void sub_232E4598C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

ValueMetadata *type metadata accessor for StatusInfoView()
{
  return &type metadata for StatusInfoView;
}

uint64_t sub_232E45A2C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_232E5E9C8, 1);
}

uint64_t sub_232E45A48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v132 = a2;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754980);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v131 = (uint64_t)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754988);
  ((void (*)(void))MEMORY[0x270FA5388])();
  long long v5 = (uint64_t *)((char *)&v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754990);
  ((void (*)(void))MEMORY[0x270FA5388])();
  BOOL v7 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754998);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v113 = (char *)&v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_232E5ADC8();
  uint64_t v10 = *(void *)(v9 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  char v12 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687549A0);
  uint64_t v14 = *(void *)(v13 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v16 = (char *)&v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687549A8);
  uint64_t v17 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v96 - v21;
  uint64_t v23 = *(void *)a1;
  uint64_t v24 = *(void *)(a1 + 8);
  uint64_t v26 = *(void *)(a1 + 16);
  uint64_t v25 = *(void *)(a1 + 24);
  v27 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 80))
  {
    if (*(unsigned char *)(a1 + 80) == 1)
    {
      uint64_t v107 = *(void *)a1;
      v108 = v27;
      uint64_t v109 = v25;
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v100 = *(void *)(a1 + 40);
      uint64_t v30 = *(void *)(a1 + 56);
      uint64_t v29 = *(void *)(a1 + 64);
      v31 = *(void **)(a1 + 72);
      uint64_t v110 = v24;
      uint64_t v103 = v26;
      uint64_t v101 = v29;
      if (v24)
      {
        uint64_t v32 = v26;
        sub_232E46F6C(a1, (void (*)(void))sub_232E45894);
        v33 = v108;
        sub_232E45894(v107, v24, v32, v109, v108);
        id v34 = v33;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_232E5AE08();
        uint64_t v119 = v36;
        uint64_t v120 = v35;
        uint64_t v133 = v37;
        v122 = (char *)(v38 & 1);
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v127 = sub_232E5ADF8();
        uint64_t v126 = swift_getKeyPath();
        v121 = (char *)sub_232E5AE58();
        uint64_t v125 = swift_getKeyPath();

        uint64_t v29 = v101;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v124 = 1;
      }
      else
      {
        sub_232E46F6C(a1, (void (*)(void))sub_232E45894);
        uint64_t v119 = 0;
        uint64_t v120 = 0;
        v121 = 0;
        v122 = 0;
        uint64_t v133 = 0;
        uint64_t v127 = 0;
        uint64_t KeyPath = 0;
        uint64_t v124 = 0;
        uint64_t v125 = 0;
        uint64_t v126 = 0;
      }
      v104 = v5;
      v99 = v31;
      uint64_t v98 = v30;
      uint64_t v97 = v28;
      if (v28)
      {
        sub_232E45894(v100, v28, v30, v29, v31);
        id v51 = v31;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v114 = sub_232E5AE08();
        uint64_t v123 = v52;
        v116 = v53;
        uint64_t v105 = v54 & 1;
        uint64_t v115 = swift_getKeyPath();
        uint64_t v118 = sub_232E5ADE8();
        uint64_t v117 = swift_getKeyPath();
        uint64_t v55 = sub_232E5AE58();
        uint64_t v56 = swift_getKeyPath();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v106 = 1;
      }
      else
      {
        uint64_t v114 = 0;
        uint64_t v123 = 0;
        uint64_t v105 = 0;
        uint64_t v115 = 0;
        v116 = 0;
        uint64_t v106 = 0;
        uint64_t v117 = 0;
        uint64_t v118 = 0;
        uint64_t v56 = 0;
        uint64_t v55 = 0;
      }
      uint64_t v102 = v56;
      uint64_t v72 = v119;
      uint64_t v71 = v120;
      char v73 = (char)v122;
      sub_232E46C18(v120, v119, (char)v122, v133);
      uint64_t v74 = v55;
      uint64_t v75 = v114;
      uint64_t v76 = v74;
      sub_232E46C18(v114, v123, v105, (uint64_t)v116);
      sub_232E46C18(v71, v72, v73, v133);
      uint64_t v96 = v76;
      uint64_t v77 = v123;
      LOBYTE(v72) = v105;
      v78 = v116;
      sub_232E46C18(v75, v123, v105, (uint64_t)v116);
      sub_232E46CB4(v75, v77, v72, (uint64_t)v78);
      uint64_t v79 = (uint64_t)v121;
      uint64_t v80 = v125;
      uint64_t v81 = v119;
      uint64_t v82 = v120;
      v83 = v122;
      uint64_t v84 = v127;
      uint64_t v85 = KeyPath;
      uint64_t v86 = v124;
      uint64_t v87 = v126;
      sub_232E46CB4(v120, v119, (char)v122, v133);
      v88 = v104;
      uint64_t *v104 = v82;
      v88[1] = v81;
      uint64_t v89 = v133;
      v88[2] = (uint64_t)v83;
      v88[3] = v89;
      v88[4] = v85;
      v88[5] = v86;
      v88[6] = v87;
      v88[7] = v84;
      v88[8] = v80;
      v88[9] = v79;
      uint64_t v90 = v123;
      v88[10] = v114;
      v88[11] = v90;
      LOBYTE(v85) = v105;
      v91 = v116;
      v88[12] = v105;
      v88[13] = (uint64_t)v91;
      uint64_t v92 = v106;
      v88[14] = v115;
      v88[15] = v92;
      uint64_t v93 = v118;
      v88[16] = v117;
      v88[17] = v93;
      uint64_t v94 = v96;
      v88[18] = v102;
      v88[19] = v94;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687549C8);
      sub_232E47414(&qword_2687549B8, &qword_268754990);
      sub_232E47414(&qword_2687549C0, &qword_2687549C8);
      uint64_t v95 = (uint64_t)v113;
      sub_232E5ADA8();
      sub_232E46EAC(v95, v131, &qword_268754998);
      swift_storeEnumTagMultiPayload();
      sub_232E46B10();
      sub_232E5ADA8();
      sub_232E4598C(v100, v97, v98, v101, v99);
      sub_232E4598C(v107, v110, v103, v109, v108);
      sub_232E46CB4(v114, v123, v85, (uint64_t)v116);
      sub_232E46CB4(v120, v119, (char)v122, v133);
      return sub_232E46F10(v95, &qword_268754998);
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      sub_232E46B10();
      return sub_232E5ADA8();
    }
  }
  else
  {
    v104 = v5;
    v121 = v7;
    uint64_t v127 = v18;
    uint64_t v107 = v23;
    uint64_t v110 = v24;
    v122 = v22;
    uint64_t v39 = v20;
    uint64_t v40 = v24;
    uint64_t v103 = v26;
    uint64_t v109 = v25;
    v108 = v27;
    uint64_t v41 = v19;
    sub_232E45894(v23, v40, v26, v25, v27);
    sub_232E5ACF8();
    sub_232E5ADB8();
    sub_232E47414(&qword_2687549D0, &qword_2687549A0);
    sub_232E46E54();
    sub_232E5AE38();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t KeyPath = v41;
    v42 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 32);
    uint64_t v120 = v39;
    v42(v122, v39, v127);
    uint64_t v117 = a1;
    if (v110)
    {
      sub_232E46F6C(a1, (void (*)(void))sub_232E45894);
      v43 = v108;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v123 = sub_232E5AE08();
      uint64_t v45 = v44;
      uint64_t v125 = v46 & 1;
      uint64_t v126 = v47;
      uint64_t v119 = swift_getKeyPath();
      uint64_t v133 = sub_232E5ADE8();
      uint64_t v118 = swift_getKeyPath();
      uint64_t v124 = sub_232E5AE58();
      uint64_t v48 = swift_getKeyPath();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v49 = 1;
    }
    else
    {
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v45 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v118 = 0;
      uint64_t v119 = 0;
      uint64_t v49 = 0;
      uint64_t v133 = 0;
      uint64_t v48 = 0;
    }
    uint64_t v58 = v120;
    uint64_t v57 = (uint64_t)v121;
    uint64_t v59 = v127;
    v60 = *(void (**)(uint64_t, char *, uint64_t))(KeyPath + 16);
    v60(v120, v122, v127);
    v60(v57, (char *)v58, v59);
    v61 = (void *)(v57 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2687549E0) + 48));
    uint64_t v63 = v123;
    uint64_t v62 = v124;
    void *v61 = v123;
    v61[1] = v45;
    uint64_t v64 = v125;
    uint64_t v65 = v126;
    v61[2] = v125;
    v61[3] = v65;
    uint64_t v66 = v118;
    v61[4] = v119;
    v61[5] = v49;
    v61[6] = v66;
    uint64_t v67 = v133;
    v61[7] = v133;
    v61[8] = v48;
    uint64_t v133 = v67;
    v61[9] = v62;
    uint64_t v124 = v62;
    uint64_t v125 = v64;
    sub_232E46C18(v63, v45, v64, v65);
    uint64_t v114 = v48;
    uint64_t v123 = v63;
    uint64_t v110 = v45;
    uint64_t v115 = v49;
    sub_232E46C18(v63, v45, v64, v65);
    uint64_t v126 = v65;
    sub_232E46CB4(v63, v45, v64, v65);
    v68 = *(void (**)(void, void))(KeyPath + 8);
    KeyPath += 8;
    v116 = (uint64_t (*)(void, void))v68;
    v68(v120, v127);
    uint64_t v69 = (uint64_t)v121;
    sub_232E46EAC((uint64_t)v121, (uint64_t)v104, &qword_268754990);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687549C8);
    sub_232E47414(&qword_2687549B8, &qword_268754990);
    sub_232E47414(&qword_2687549C0, &qword_2687549C8);
    uint64_t v70 = (uint64_t)v113;
    sub_232E5ADA8();
    sub_232E46F10(v69, &qword_268754990);
    sub_232E46EAC(v70, v131, &qword_268754998);
    swift_storeEnumTagMultiPayload();
    sub_232E46B10();
    sub_232E5ADA8();
    sub_232E46F6C(v117, (void (*)(void))sub_232E4598C);
    sub_232E46CB4(v123, v110, v125, v126);
    sub_232E46F10(v70, &qword_268754998);
    return v116(v122, v127);
  }
}

uint64_t sub_232E469B8()
{
  return sub_232E5AE48();
}

uint64_t sub_232E469D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754968);
  MEMORY[0x270FA5388](v3 - 8);
  long long v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)(v1 + 48);
  v20[2] = *(_OWORD *)(v1 + 32);
  v20[3] = v6;
  v20[4] = *(_OWORD *)(v1 + 64);
  char v21 = *(unsigned char *)(v1 + 80);
  long long v7 = *(_OWORD *)(v1 + 16);
  v20[0] = *(_OWORD *)v1;
  v20[1] = v7;
  *(void *)long long v5 = sub_232E5AD78();
  *((void *)v5 + 1) = 0x4020000000000000;
  v5[16] = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754970);
  sub_232E45A48((uint64_t)v20, (uint64_t)&v5[*(int *)(v8 + 44)]);
  char v9 = sub_232E5ADD8();
  sub_232E5ACE8();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  sub_232E46EAC((uint64_t)v5, a1, &qword_268754968);
  uint64_t v18 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268754978) + 36);
  *(unsigned char *)uint64_t v18 = v9;
  *(void *)(v18 + 8) = v11;
  *(void *)(v18 + 16) = v13;
  *(void *)(v18 + 24) = v15;
  *(void *)(v18 + 32) = v17;
  *(unsigned char *)(v18 + 40) = 0;
  return sub_232E46F10((uint64_t)v5, &qword_268754968);
}

unint64_t sub_232E46B10()
{
  unint64_t result = qword_2687549B0;
  if (!qword_2687549B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268754998);
    sub_232E47414(&qword_2687549B8, &qword_268754990);
    sub_232E47414(&qword_2687549C0, &qword_2687549C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687549B0);
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

uint64_t sub_232E46C18(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_232E46CA4(result, a2, a3 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_232E46CA4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_232E46CB4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_232E46D40(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_232E46D40(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_232E46D50@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_232E5AD28();
  *a1 = result;
  return result;
}

uint64_t sub_232E46D7C()
{
  return sub_232E5AD38();
}

uint64_t sub_232E46DA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E5AD48();
  *a1 = result;
  return result;
}

uint64_t sub_232E46DD0()
{
  return sub_232E5AD58();
}

uint64_t sub_232E46DFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E5AD08();
  *a1 = result;
  return result;
}

uint64_t sub_232E46E28()
{
  return sub_232E5AD18();
}

unint64_t sub_232E46E54()
{
  unint64_t result = qword_2687549D8;
  if (!qword_2687549D8)
  {
    sub_232E5ADC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687549D8);
  }
  return result;
}

uint64_t sub_232E46EAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_232E46F10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_232E46F6C(uint64_t a1, void (*a2)(void))
{
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwxx_0(uint64_t a1)
{
  return sub_232E458E4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned char *)(a1 + 80), (void (*)(void))sub_232E4598C);
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  char v14 = *(unsigned char *)(a2 + 80);
  uint64_t v13 = *(void *)(a2 + 72);
  sub_232E458E4(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, (void (*)(void))sub_232E45894);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  char v25 = *(unsigned char *)(a2 + 80);
  uint64_t v24 = *(void *)(a2 + 72);
  sub_232E458E4(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, (void (*)(void))sub_232E45894);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  sub_232E458E4(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, (void (*)(void))sub_232E4598C);
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  char v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  sub_232E458E4(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14, (void (*)(void))sub_232E4598C);
  return a1;
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s22HomePlatformSettingsUI14StatusInfoViewV6StatusOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 80) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_232E47318(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 80) <= 1u) {
    return *(unsigned __int8 *)(a1 + 80);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_232E47330(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)(result + 72) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StatusInfoView.Status()
{
  return &type metadata for StatusInfoView.Status;
}

unint64_t sub_232E47374()
{
  unint64_t result = qword_2687549E8;
  if (!qword_2687549E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268754978);
    sub_232E47414(&qword_2687549F0, &qword_268754968);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687549E8);
  }
  return result;
}

uint64_t sub_232E47414(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_232E4745C()
{
  return sub_232E47BBC(&qword_2687549F8, &qword_268754A00);
}

BOOL sub_232E47484(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_232E4749C(void *a1@<X8>)
{
  *a1 = &unk_26E698E70;
}

char *sub_232E474AC@<X0>(char **a1@<X8>)
{
  uint64_t result = sub_232E476C4();
  *a1 = result;
  return result;
}

char *sub_232E474D4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754A10);
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
  char v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
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

char *sub_232E475D8(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754A08);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_232E476C4()
{
  uint64_t v0 = sub_232E475D8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v2 = *((void *)v0 + 2);
  unint64_t v1 = *((void *)v0 + 3);
  int64_t v3 = v1 >> 1;
  unint64_t v4 = v2 + 1;
  if (v1 >> 1 <= v2)
  {
    uint64_t v0 = sub_232E475D8((char *)(v1 > 1), v2 + 1, 1, v0);
    unint64_t v1 = *((void *)v0 + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)v0 + 2) = v4;
  v0[v2 + 32] = 0;
  unint64_t v5 = v2 + 2;
  if (v3 < (uint64_t)(v2 + 2))
  {
    uint64_t v0 = sub_232E475D8((char *)(v1 > 1), v2 + 2, 1, v0);
    unint64_t v1 = *((void *)v0 + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)v0 + 2) = v5;
  v0[v4 + 32] = 0x80;
  unint64_t v6 = v2 + 3;
  if (v3 < (uint64_t)(v2 + 3))
  {
    uint64_t v0 = sub_232E475D8((char *)(v1 > 1), v2 + 3, 1, v0);
    unint64_t v1 = *((void *)v0 + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)v0 + 2) = v6;
  v0[v5 + 32] = 1;
  if (v3 < (uint64_t)(v2 + 4)) {
    uint64_t v0 = sub_232E475D8((char *)(v1 > 1), v2 + 4, 1, v0);
  }
  *((void *)v0 + 2) = v2 + 4;
  v0[v6 + 32] = -127;
  return v0;
}

ValueMetadata *type metadata accessor for DeviceModel()
{
  return &type metadata for DeviceModel;
}

uint64_t getEnumTagSinglePayload for DeviceModel.Configuration(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7F) {
    goto LABEL_17;
  }
  if (a2 + 129 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 129) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 129;
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
      return (*a1 | (v4 << 8)) - 129;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 129;
    }
  }
LABEL_17:
  unsigned int v6 = (*a1 & 0x7E | (*a1 >> 7)) ^ 0x7F;
  if (v6 >= 0x7E) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for DeviceModel.Configuration(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 129 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 129) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7F) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7E)
  {
    unsigned int v6 = ((a2 - 127) >> 8) + 1;
    *uint64_t result = a2 - 127;
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
        JUMPOUT(0x232E4798CLL);
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
          *uint64_t result = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
        break;
    }
  }
  return result;
}

uint64_t sub_232E479B4(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

unsigned char *sub_232E479C0(unsigned char *result)
{
  *result &= ~0x80u;
  return result;
}

unsigned char *sub_232E479D0(unsigned char *result, char a2)
{
  *uint64_t result = *result & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for DeviceModel.Configuration()
{
  return &type metadata for DeviceModel.Configuration;
}

uint64_t getEnumTagSinglePayload for DeviceModel.Size(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DeviceModel.Size(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E47B50);
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

unsigned char *sub_232E47B78(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceModel.Size()
{
  return &type metadata for DeviceModel.Size;
}

uint64_t sub_232E47B94()
{
  return sub_232E47BBC(&qword_268754A18, &qword_268754A20);
}

uint64_t sub_232E47BBC(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_232E47C10()
{
  unint64_t result = qword_268754A28;
  if (!qword_268754A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268754A28);
  }
  return result;
}

uint64_t sub_232E47C64()
{
  *(void *)(v1 + 88) = v0;
  return MEMORY[0x270FA2498](sub_232E47C84, v0, 0);
}

uint64_t sub_232E47C84()
{
  sub_232E5AF78();
  *(void *)(v0 + 96) = sub_232E5AF68();
  uint64_t v2 = sub_232E5AF58();
  return MEMORY[0x270FA2498](sub_232E47D18, v2, v1);
}

uint64_t sub_232E47D18()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  uint64_t v2 = *(void **)(v1 + 152);
  *(void *)(v0 + 104) = v2;
  id v3 = v2;
  return MEMORY[0x270FA2498](sub_232E47D90, v1, 0);
}

uint64_t sub_232E47D90()
{
  uint64_t v1 = (void *)v0[13];
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_remoteObjectProxy);
    sub_232E5B038();
    swift_unknownObjectRelease();
    sub_232E49050((uint64_t)(v0 + 2), (uint64_t)(v0 + 6));
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754A50);
    int v3 = swift_dynamicCast();
    uint64_t v4 = (void *)v0[13];
    if (v3)
    {

      uint64_t v5 = v0[10];
      __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
      unsigned int v6 = (uint64_t (*)(uint64_t))v0[1];
      return v6(v5);
    }
    sub_232E48FFC();
    swift_allocError();
    *int64_t v9 = 4;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  }
  else
  {
    sub_232E48FFC();
    swift_allocError();
    *int v8 = 3;
    swift_willThrow();
  }
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_232E47F34(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  int v3 = (void *)swift_task_alloc();
  v2[17] = v3;
  void *v3 = v2;
  v3[1] = sub_232E47FE0;
  v3[11] = v1;
  return MEMORY[0x270FA2498](sub_232E47C84, v1, 0);
}

uint64_t sub_232E47FE0(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 144) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 128);
    return MEMORY[0x270FA2498](sub_232E48128, v7, 0);
  }
}

uint64_t sub_232E48128()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = sub_232E5ACA8();
  v0[19] = v2;
  v0[2] = v0;
  v0[3] = sub_232E48230;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_232E51DE8;
  v0[13] = &block_descriptor_30;
  v0[14] = v3;
  objc_msgSend(v1, sel_receiveWithCarrySettingsHomeID_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_232E48230()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 160) = v2;
  uint64_t v3 = *(void *)(v1 + 128);
  if (v2) {
    uint64_t v4 = sub_232E483B8;
  }
  else {
    uint64_t v4 = sub_232E48350;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_232E48350()
{
  uint64_t v1 = *(void **)(v0 + 152);
  swift_unknownObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_232E483B8()
{
  uint64_t v1 = *(void **)(v0 + 152);
  swift_willThrow();
  swift_unknownObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_232E485B4(uint64_t a1, const void *a2, uint64_t a3)
{
  v3[2] = a3;
  uint64_t v5 = sub_232E5ACC8();
  v3[3] = v5;
  v3[4] = *(void *)(v5 - 8);
  uint64_t v6 = swift_task_alloc();
  v3[5] = v6;
  v3[6] = _Block_copy(a2);
  sub_232E5ACB8();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[7] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_232E486E0;
  return sub_232E47F34(v6);
}

uint64_t sub_232E486E0()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void *)(*v1 + 24);
  uint64_t v8 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_release();
  uint64_t v9 = *(void *)(v3 + 48);
  if (v2)
  {
    uint64_t v10 = (void *)sub_232E5AC88();

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 16))(*(void *)(v3 + 48), 0);
  }
  _Block_release(*(const void **)(v4 + 48));
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_232E488CC(uint64_t a1, uint64_t a2)
{
  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[18] = v4;
  void *v4 = v3;
  v4[1] = sub_232E4897C;
  v4[11] = v2;
  return MEMORY[0x270FA2498](sub_232E47C84, v2, 0);
}

uint64_t sub_232E4897C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 152) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 136);
    return MEMORY[0x270FA2498](sub_232E48AC4, v7, 0);
  }
}

uint64_t sub_232E48AC4()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = sub_232E5ACA8();
  v0[20] = v2;
  sub_232E5ACC8();
  sub_232E48FA4();
  uint64_t v3 = sub_232E5AFE8();
  v0[21] = v3;
  v0[2] = v0;
  v0[3] = sub_232E48C04;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_232E51DE8;
  v0[13] = &block_descriptor;
  v0[14] = v4;
  objc_msgSend(v1, sel_receiveWithCarrySettingsHomeID_identifiers_completionHandler_, v2, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_232E48C04()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v2;
  uint64_t v3 = *(void *)(v1 + 136);
  if (v2) {
    uint64_t v4 = sub_232E48D94;
  }
  else {
    uint64_t v4 = sub_232E48D24;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_232E48D24()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[21];
  swift_unknownObjectRelease();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_232E48D94()
{
  uint64_t v1 = (void *)v0[21];
  uint64_t v2 = (void *)v0[20];
  swift_willThrow();
  swift_unknownObjectRelease();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

unint64_t sub_232E48FA4()
{
  unint64_t result = qword_268754A40;
  if (!qword_268754A40)
  {
    sub_232E5ACC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754A40);
  }
  return result;
}

unint64_t sub_232E48FFC()
{
  unint64_t result = qword_268754A48;
  if (!qword_268754A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754A48);
  }
  return result;
}

uint64_t sub_232E49050(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_232E490FC(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v6 = sub_232E5ACC8();
  v4[3] = v6;
  v4[4] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v4[5] = v7;
  v4[6] = _Block_copy(a3);
  sub_232E5ACB8();
  sub_232E48FA4();
  uint64_t v8 = sub_232E5AFF8();
  v4[7] = v8;
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v4[8] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_232E4925C;
  return sub_232E488CC(v7, v8);
}

uint64_t sub_232E4925C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void *)(*v1 + 24);
  uint64_t v8 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v3 + 48);
  if (v2)
  {
    uint64_t v10 = (void *)sub_232E5AC88();

    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 16))(*(void *)(v3 + 48), 0);
  }
  _Block_release(*(const void **)(v4 + 48));
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_232E4946C()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_232E494BC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (const void *)v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_232E44F2C;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, const void *, uint64_t))((char *)&dword_268754A58 + dword_268754A58);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_232E49580()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_232E49854;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268754DC8 + dword_268754DC8);
  return v6(v2, v3, v4);
}

uint64_t sub_232E49644(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E49854;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268754DD0 + dword_268754DD0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_232E49710()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E49758()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (const void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_232E49854;
  uint64_t v6 = (uint64_t (*)(uint64_t, const void *, uint64_t))((char *)&dword_268754A78 + dword_268754A78);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_232E49858()
{
  v1[24] = v0;
  sub_232E5AF78();
  v1[25] = sub_232E5AF68();
  uint64_t v3 = sub_232E5AF58();
  v1[26] = v3;
  v1[27] = v2;
  return MEMORY[0x270FA2498](sub_232E498F0, v3, v2);
}

uint64_t sub_232E498F0()
{
  uint64_t v1 = v0[24];
  sub_232E5B058();
  sub_232E5AF08();
  swift_bridgeObjectRetain();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E551A4(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  type metadata accessor for Stopwatch();
  uint64_t inited = swift_initStackObject();
  v0[28] = inited;
  *(unsigned char *)(inited + 16) = 1;
  *(void *)(inited + 24) = 0;
  *(unsigned char *)(inited + 32) = 1;
  *(void *)(inited + 40) = 0;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 24) = mach_absolute_time();
  *(unsigned char *)(inited + 32) = 0;
  *(unsigned char *)(inited + 16) = 0;
  uint64_t v3 = self;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query);
  v0[2] = v0;
  v0[7] = v0 + 22;
  v0[3] = sub_232E49AEC;
  uint64_t v5 = swift_continuation_init();
  v0[17] = MEMORY[0x263EF8330];
  v0[18] = 0x40000000;
  v0[19] = sub_232E49FD8;
  v0[20] = &block_descriptor_0;
  v0[21] = v5;
  objc_msgSend(v3, sel_executeQuery_completionHandler_, v4, v0 + 17);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_232E49AEC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 216);
  uint64_t v2 = *(void *)(*(void *)v0 + 208);
  return MEMORY[0x270FA2498](sub_232E49BF4, v2, v1);
}

uint64_t sub_232E49BF4()
{
  uint64_t result = swift_release();
  unint64_t v2 = v0[22];
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_232E5B088();
    uint64_t result = swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    sub_232E5B058();
    swift_bridgeObjectRelease();
    sub_232E4B2A4();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    v0[23] = type metadata accessor for RemoteViewControllerClient();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754B38);
    sub_232E5AEE8();
    id v12 = objc_allocWithZone(MEMORY[0x263F38560]);
    uint64_t v13 = (void *)sub_232E5AEC8();
    char v14 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v12, sel_initWithSubsystem_category_, v13, v14);

    long long v16 = (void *)sub_232E5AEC8();
    objc_msgSend(v15, sel_ulog_message_, 60, v16);

    swift_bridgeObjectRelease();
    sub_232E4AC68();
    swift_allocError();
    swift_willThrow();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
  if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_12;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v3 = (id)MEMORY[0x237DB4350](0, v2);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v3 = *(id *)(v2 + 32);
  }
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E70]), sel_initWithExtensionIdentity_, v4);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E68]), sel_initWithConfiguration_, v5);
  id v7 = sub_232E4A040();
  if (v7)
  {
    uint64_t v8 = v7;
    objc_msgSend(v6, sel_setPlaceholderView_, v7);
  }
  objc_msgSend(v6, sel_setDelegate_, v0[24]);
  sub_232E5B058();
  swift_bridgeObjectRelease();
  sub_232E4B2A4();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  id v9 = objc_msgSend(v6, sel_description);
  sub_232E5AED8();

  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E551A4(0xD000000000000023, 0x8000000232E5D270);

  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t (*)(id))v0[1];
  return v10(v6);
}

uint64_t sub_232E49FD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_232E4ACBC();
  **(void **)(*(void *)(v1 + 64) + 40) = sub_232E5AF28();
  return MEMORY[0x270FA2400](v1);
}

id sub_232E4A040()
{
  uint64_t v1 = v0;
  memset(v31, 0, sizeof(v31));
  char v32 = 2;
  id v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268754B40));
  id v3 = (void *)sub_232E5AD88();
  id result = objc_msgSend(v3, sel_view);
  if (result)
  {
    id v5 = result;
    id v6 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v6);

    uint64_t v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl;
    uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl);
    *(void *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl) = v3;

    id v9 = *(void **)(v1 + v7);
    if (v9)
    {
      uint64_t v10 = qword_2687548C8;
      id v11 = v9;
      if (v10 != -1) {
        swift_once();
      }
      uint64_t v13 = qword_268756058;
      uint64_t v12 = unk_268756060;
      uint64_t v14 = byte_268756068;
      uint64_t v15 = qword_268756070;
      id v16 = qword_268756078;
      id v17 = qword_268756078;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = (void (*)(_OWORD *, void))sub_232E5AD98();
      uint64_t v20 = *(void *)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      uint64_t v22 = *(void *)(v19 + 16);
      uint64_t v23 = *(void *)(v19 + 24);
      uint64_t v24 = *(void **)(v19 + 32);
      uint64_t v25 = *(void *)(v19 + 40);
      uint64_t v26 = *(void *)(v19 + 48);
      uint64_t v27 = *(void *)(v19 + 56);
      uint64_t v28 = *(void *)(v19 + 64);
      uint64_t v29 = *(void **)(v19 + 72);
      char v30 = *(unsigned char *)(v19 + 80);
      *(void *)uint64_t v19 = v13;
      *(void *)(v19 + 8) = v12;
      *(void *)(v19 + 16) = v14;
      *(void *)(v19 + 24) = v15;
      *(void *)(v19 + 32) = v16;
      *(_OWORD *)(v19 + 40) = 0u;
      *(_OWORD *)(v19 + 56) = 0u;
      *(_OWORD *)(v19 + 65) = 0u;
      sub_232E4ABE0(v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
      v18(v31, 0);

      id result = *(id *)(v1 + v7);
      if (result) {
        return objc_msgSend(result, sel_view);
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_232E4A25C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteViewControllerClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RemoteViewControllerClient()
{
  return self;
}

uint64_t sub_232E4A51C()
{
  uint64_t v1 = OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock;
  if (*(void *)(v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock))
  {
    swift_retain();
    sub_232E4B2A4();
    swift_release();
  }
  *(void *)(v0 + v1) = 0;
  swift_release();
  sub_232E5B058();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E551A4(0xD000000000000035, 0x8000000232E5D1D0);
  swift_bridgeObjectRelease();
  uint64_t v2 = v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate;
  uint64_t result = MEMORY[0x237DB4AF0](v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate);
  if (result)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_232E4A668(uint64_t a1)
{
  if (a1)
  {
    swift_getErrorValue();
    sub_232E5B0F8();
  }
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E551A4(0xD00000000000002FLL, 0x8000000232E5D1A0);
  return swift_bridgeObjectRelease();
}

void sub_232E4A700(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock;
  if (*(void *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock))
  {
    swift_retain();
    sub_232E4B2A4();
    swift_release();
  }
  *(void *)(v1 + v4) = 0;
  swift_release();
  sub_232E5B058();
  swift_bridgeObjectRelease();
  v43[0] = 0xD00000000000002FLL;
  v43[1] = 0x8000000232E5D0E0;
  if (a1)
  {
    swift_getErrorValue();
    sub_232E5B0F8();
  }
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for RemoteViewControllerClient();
  v43[0] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754B38);
  sub_232E5AEE8();
  id v6 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v7 = (void *)sub_232E5AEC8();
  uint64_t v8 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_initWithSubsystem_category_, v7, v8);

  uint64_t v10 = (void *)sub_232E5AEC8();
  objc_msgSend(v9, sel_ulog_message_, 90, v10);
  swift_bridgeObjectRelease();

  id v11 = *(void **)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl);
  if (v11)
  {
    id v12 = v11;
    sub_232E551A4(0xD000000000000020, 0x8000000232E5D170);
    if (qword_2687548D0 != -1) {
      swift_once();
    }
    uint64_t v13 = *(void *)algn_268756088;
    uint64_t v41 = byte_268756090;
    uint64_t v42 = qword_268756080;
    uint64_t v14 = qword_268756098;
    uint64_t v15 = (void *)unk_2687560A0;
    uint64_t v16 = qword_2687548D8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v17 = v15;
    if (v16 != -1) {
      swift_once();
    }
    uint64_t v19 = qword_2687560A8;
    uint64_t v18 = unk_2687560B0;
    uint64_t v20 = byte_2687560B8;
    uint64_t v21 = qword_2687560C0;
    id v22 = qword_2687560C8;
    id v23 = qword_2687560C8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v24 = (void (*)(void *, void))sub_232E5AD98();
    uint64_t v26 = *(void *)v25;
    uint64_t v27 = *(void *)(v25 + 8);
    uint64_t v28 = *(void *)(v25 + 16);
    uint64_t v29 = *(void *)(v25 + 24);
    char v30 = *(void **)(v25 + 32);
    uint64_t v31 = *(void *)(v25 + 40);
    uint64_t v32 = *(void *)(v25 + 48);
    uint64_t v33 = *(void *)(v25 + 56);
    uint64_t v34 = *(void *)(v25 + 64);
    uint64_t v35 = *(void **)(v25 + 72);
    char v36 = *(unsigned char *)(v25 + 80);
    *(void *)uint64_t v25 = v42;
    *(void *)(v25 + 8) = v13;
    *(void *)(v25 + 16) = v41;
    *(void *)(v25 + 24) = v14;
    *(void *)(v25 + 32) = v15;
    *(void *)(v25 + 40) = v19;
    *(void *)(v25 + 48) = v18;
    *(void *)(v25 + 56) = v20;
    *(void *)(v25 + 64) = v21;
    *(void *)(v25 + 72) = v22;
    *(unsigned char *)(v25 + 80) = 1;
    sub_232E4ABE0(v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
    v24(v43, 0);
  }
  else
  {
    v43[0] = v5;
    sub_232E5AEE8();
    id v37 = objc_allocWithZone(MEMORY[0x263F38560]);
    char v38 = (void *)sub_232E5AEC8();
    uint64_t v39 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v37, sel_initWithSubsystem_category_, v38, v39);

    id v12 = (id)sub_232E5AEC8();
    objc_msgSend(v40, sel_ulog_message_, 90, v12);
  }
}

uint64_t sub_232E4AB48()
{
  sub_232E551A4(0xD000000000000027, 0x8000000232E5D0B0);
  type metadata accessor for Stopwatch();
  uint64_t v1 = swift_allocObject();
  *(unsigned char *)(v1 + 16) = 1;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  *(void *)(v1 + 40) = 0;
  *(unsigned char *)(v1 + 48) = 1;
  *(void *)(v1 + 24) = mach_absolute_time();
  *(unsigned char *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 16) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock) = v1;
  return swift_release();
}

void sub_232E4ABE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, char a11)
{
  if (a11 == 1)
  {
    sub_232E4598C(a1, a2, a3, a4, a5);
    a1 = a6;
    a2 = a7;
    a3 = a8;
    a4 = a9;
    a5 = a10;
  }
  else if (a11)
  {
    return;
  }
  sub_232E4598C(a1, a2, a3, a4, a5);
}

unint64_t sub_232E4AC68()
{
  unint64_t result = qword_268754B48;
  if (!qword_268754B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754B48);
  }
  return result;
}

unint64_t sub_232E4ACBC()
{
  unint64_t result = qword_268754B50;
  if (!qword_268754B50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268754B50);
  }
  return result;
}

uint64_t sub_232E4ACFC(uint64_t a1)
{
  return a1;
}

Swift::Void __swiftcall UIViewController.wrap(subViewController:)(UIViewController *subViewController)
{
  id v3 = [(UIViewController *)subViewController view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = v3;
  [(UIView *)v3 removeFromSuperview];

  [(UIViewController *)subViewController removeFromParentViewController];
  [(UIViewController *)subViewController willMoveToParentViewController:v1];
  objc_msgSend(v1, sel_addChildViewController_, subViewController);
  uint64_t v5 = [(UIViewController *)subViewController view];
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(v1, sel_view);
    if (v7)
    {
      uint64_t v8 = v7;
      objc_msgSend(v7, sel_addSubviewToBounds_with_, v6, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

      id v9 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
      [(UIView *)v6 setBackgroundColor:v9];

      goto LABEL_5;
    }
LABEL_9:
    __break(1u);
    return;
  }
LABEL_5:
  [(UIViewController *)subViewController didMoveToParentViewController:v1];
}

void sub_232E4AE74(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = a1;
  UIViewController.wrap(subViewController:)(v4);
}

id sub_232E4AEDC(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v7 = v6;
  id v14 = a2;
  if (!a2) {
    id v14 = v7;
  }
  id v15 = a2;
  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v7, sel_addSubview_, a1);
  id v16 = objc_msgSend(a1, sel_topAnchor);
  id v17 = objc_msgSend(v14, sel_topAnchor);
  id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v17, a3);

  id v19 = objc_msgSend(v14, sel_rightAnchor);
  id v20 = objc_msgSend(a1, sel_rightAnchor);
  id v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, a6);

  id v22 = objc_msgSend(v14, sel_bottomAnchor);
  id v23 = objc_msgSend(a1, sel_bottomAnchor);
  id v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, a5);

  id v25 = objc_msgSend(a1, sel_leftAnchor);
  id v26 = objc_msgSend(v14, sel_leftAnchor);
  id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, a4);

  uint64_t v28 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687548F0);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_232E5C1C0;
  *(void *)(v29 + 32) = v18;
  *(void *)(v29 + 40) = v21;
  *(void *)(v29 + 48) = v24;
  *(void *)(v29 + 56) = v27;
  sub_232E5AF48();
  sub_232E42758();
  id v30 = v18;
  id v31 = v21;
  id v32 = v24;
  id v33 = v27;
  id v34 = v30;
  id v35 = v31;
  id v36 = v32;
  id v37 = v33;
  char v38 = (void *)sub_232E5AF18();
  swift_bridgeObjectRelease();
  objc_msgSend(v28, sel_activateConstraints_, v38);

  return v34;
}

void sub_232E4B1E8(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v12 = a7;
  id v13 = a1;
  id v14 = sub_232E4AEDC(v12, 0, a2, a3, a4, a5);
  id v16 = v15;
  id v18 = v17;
  id v20 = v19;
}

uint64_t sub_232E4B2A4()
{
  if (*(unsigned char *)(v0 + 16)) {
    return 0;
  }
  uint64_t v2 = mach_absolute_time();
  *(void *)(v0 + 40) = v2;
  *(unsigned char *)(v0 + 48) = 0;
  *(unsigned char *)(v0 + 16) = 1;
  if (*(unsigned char *)(v0 + 32)) {
    return 0x646570706F7473;
  }
  uint64_t v3 = *(void *)(v0 + 24);
  BOOL v4 = v2 >= v3;
  uint64_t result = v2 - v3;
  if (v4)
  {
    UpTicksToSecondsF();
    return sub_232E429EC(v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_232E4B320()
{
  if (*(unsigned char *)(v0 + 32) & 1) != 0 || (*(unsigned char *)(v0 + 48))
  {
    if (*(unsigned char *)(v0 + 16)) {
      return 0x646570706F7473;
    }
    else {
      return 0x676E696E6E7572;
    }
  }
  else
  {
    unint64_t v2 = *(void *)(v0 + 24);
    unint64_t v3 = *(void *)(v0 + 40);
    uint64_t result = v3 - v2;
    if (v3 < v2)
    {
      __break(1u);
    }
    else
    {
      UpTicksToSecondsF();
      return sub_232E429EC(v4);
    }
  }
  return result;
}

uint64_t sub_232E4B398()
{
  return MEMORY[0x270FA0228](v0, 49, 7);
}

uint64_t type metadata accessor for Stopwatch()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for Stopwatch.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E4B498);
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

ValueMetadata *type metadata accessor for Stopwatch.State()
{
  return &type metadata for Stopwatch.State;
}

uint64_t sub_232E4B4D0()
{
  if (*v0) {
    return 0x646570706F7473;
  }
  else {
    return 0x676E696E6E7572;
  }
}

unint64_t sub_232E4B508()
{
  unint64_t result = qword_268754BC0;
  if (!qword_268754BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754BC0);
  }
  return result;
}

uint64_t sub_232E4B55C()
{
  return sub_232E4B320();
}

uint64_t getEnumTagSinglePayload for ClientError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ClientError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E4B6DCLL);
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

ValueMetadata *type metadata accessor for ClientError()
{
  return &type metadata for ClientError;
}

unint64_t sub_232E4B718()
{
  unint64_t result = qword_268754BC8;
  if (!qword_268754BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754BC8);
  }
  return result;
}

uint64_t sub_232E4B76C()
{
  uint64_t v28 = 574451054;
  unint64_t v29 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  uint64_t v1 = sub_232E474D4(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v3 = *((void *)v1 + 2);
  unint64_t v2 = *((void *)v1 + 3);
  if (v3 >= v2 >> 1) {
    uint64_t v1 = sub_232E474D4((char *)(v2 > 1), v3 + 1, 1, v1);
  }
  *((void *)v1 + 2) = v3 + 1;
  unsigned int v4 = &v1[16 * v3];
  *((void *)v4 + 4) = 574451054;
  *((void *)v4 + 5) = 0xE400000000000000;
  sub_232E4BB64(v0, (uint64_t)v25);
  sub_232E4BB64((uint64_t)v25, (uint64_t)v26);
  if (v26[1])
  {
    uint64_t v28 = 0x223D70756F7267;
    unint64_t v29 = 0xE700000000000000;
    sub_232E5AF08();
    sub_232E5AF08();
    sub_232E5AF08();
    sub_232E5AF08();
    uint64_t v5 = v28;
    unint64_t v6 = v29;
    unint64_t v8 = *((void *)v1 + 2);
    unint64_t v7 = *((void *)v1 + 3);
    if (v8 >= v7 >> 1) {
      uint64_t v1 = sub_232E474D4((char *)(v7 > 1), v8 + 1, 1, v1);
    }
    *((void *)v1 + 2) = v8 + 1;
    id v9 = &v1[16 * v8];
    *((void *)v9 + 4) = v5;
    *((void *)v9 + 5) = v6;
  }
  sub_232E4BB64(v0 + 64, (uint64_t)v24);
  sub_232E4BB64((uint64_t)v24, (uint64_t)v27);
  if (v27[1])
  {
    uint64_t v28 = 0x223D72696170;
    unint64_t v29 = 0xE600000000000000;
    sub_232E5AF08();
    sub_232E5AF08();
    sub_232E5AF08();
    sub_232E5AF08();
    uint64_t v10 = v28;
    unint64_t v11 = v29;
    unint64_t v13 = *((void *)v1 + 2);
    unint64_t v12 = *((void *)v1 + 3);
    if (v13 >= v12 >> 1) {
      uint64_t v1 = sub_232E474D4((char *)(v12 > 1), v13 + 1, 1, v1);
    }
    *((void *)v1 + 2) = v13 + 1;
    id v14 = &v1[16 * v13];
    *((void *)v14 + 4) = v10;
    *((void *)v14 + 5) = v11;
  }
  sub_232E4BB64(v0 + 96, (uint64_t)v23);
  sub_232E4BB64((uint64_t)v23, (uint64_t)&v28);
  if (v29)
  {
    sub_232E5AF08();
    sub_232E5AF08();
    sub_232E5AF08();
    sub_232E5AF08();
    unint64_t v16 = *((void *)v1 + 2);
    unint64_t v15 = *((void *)v1 + 3);
    if (v16 >= v15 >> 1) {
      uint64_t v1 = sub_232E474D4((char *)(v15 > 1), v16 + 1, 1, v1);
    }
    *((void *)v1 + 2) = v16 + 1;
    id v17 = &v1[16 * v16];
    *((void *)v17 + 4) = 0x223D6D6F6F72;
    *((void *)v17 + 5) = 0xE600000000000000;
  }
  swift_bridgeObjectRetain();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  unint64_t v19 = *((void *)v1 + 2);
  unint64_t v18 = *((void *)v1 + 3);
  if (v19 >= v18 >> 1) {
    uint64_t v1 = sub_232E474D4((char *)(v18 > 1), v19 + 1, 1, v1);
  }
  *((void *)v1 + 2) = v19 + 1;
  id v20 = &v1[16 * v19];
  *((void *)v20 + 4) = 1030513773;
  *((void *)v20 + 5) = 0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754BD8);
  sub_232E4BBCC();
  uint64_t v21 = sub_232E5AEB8();
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_232E4BB18()
{
  return sub_232E4B76C();
}

uint64_t sub_232E4BB64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754BD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_232E4BBCC()
{
  unint64_t result = qword_268754BE0;
  if (!qword_268754BE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268754BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754BE0);
  }
  return result;
}

uint64_t destroy for DisplayInfo(void *a1)
{
  if (a1[1])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[9])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t result = a1[13];
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for DisplayInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v9)
  {
    long long v14 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v14;
    uint64_t v11 = *(void *)(a2 + 104);
    if (v11) {
      goto LABEL_6;
    }
LABEL_8:
    long long v15 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v15;
    return a1;
  }
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = *(void *)(a2 + 104);
  if (!v11) {
    goto LABEL_8;
  }
LABEL_6:
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  uint64_t v12 = *(void *)(a2 + 112);
  uint64_t v13 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = v12;
  *(void *)(a1 + 120) = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DisplayInfo(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  if (a1[1])
  {
    if (v4)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_232E4C008((uint64_t)a1);
      long long v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v5;
    }
  }
  else if (v4)
  {
    *a1 = *a2;
    a1[1] = a2[1];
    a1[2] = a2[2];
    a1[3] = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v6;
  }
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + 8;
  uint64_t v8 = a2 + 8;
  uint64_t v9 = a2[9];
  if (a1[9])
  {
    if (v9)
    {
      a1[8] = a2[8];
      a1[9] = a2[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[10] = a2[10];
      a1[11] = a2[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_232E4C008((uint64_t)(a1 + 8));
      long long v10 = *((_OWORD *)a2 + 5);
      *uint64_t v7 = *v8;
      *((_OWORD *)a1 + 5) = v10;
    }
  }
  else if (v9)
  {
    a1[8] = a2[8];
    a1[9] = a2[9];
    a1[10] = a2[10];
    a1[11] = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v11 = *((_OWORD *)a2 + 5);
    *uint64_t v7 = *v8;
    *((_OWORD *)a1 + 5) = v11;
  }
  uint64_t v12 = a1 + 12;
  uint64_t v13 = a2 + 12;
  uint64_t v14 = a2[13];
  if (a1[13])
  {
    if (v14)
    {
      a1[12] = a2[12];
      a1[13] = a2[13];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[14] = a2[14];
      a1[15] = a2[15];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_232E4C008((uint64_t)(a1 + 12));
      long long v15 = *((_OWORD *)a2 + 7);
      *uint64_t v12 = *v13;
      *((_OWORD *)a1 + 7) = v15;
    }
  }
  else if (v14)
  {
    a1[12] = a2[12];
    a1[13] = a2[13];
    a1[14] = a2[14];
    a1[15] = a2[15];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v16 = *((_OWORD *)a2 + 7);
    *uint64_t v12 = *v13;
    *((_OWORD *)a1 + 7) = v16;
  }
  return a1;
}

uint64_t sub_232E4C008(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for DisplayInfo(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8))
  {
    uint64_t v4 = *(void *)(a2 + 8);
    if (v4)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      swift_bridgeObjectRelease();
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v5;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_232E4C008(a1);
  }
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_6:
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 72))
  {
    uint64_t v9 = *(void *)(a2 + 72);
    if (v9)
    {
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = v9;
      swift_bridgeObjectRelease();
      uint64_t v10 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v10;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    sub_232E4C008(a1 + 64);
  }
  long long v11 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v11;
LABEL_11:
  if (!*(void *)(a1 + 104))
  {
LABEL_15:
    long long v14 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 112) = v14;
    return a1;
  }
  uint64_t v12 = *(void *)(a2 + 104);
  if (!v12)
  {
    sub_232E4C008(a1 + 96);
    goto LABEL_15;
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisplayInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisplayInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayInfo()
{
  return &type metadata for DisplayInfo;
}

uint64_t sub_232E4C264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E5AF98();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_232E5AF88();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_232E45114(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_232E5AF58();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C40);
  return swift_task_create();
}

uint64_t sub_232E4C410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E5AF98();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_232E5AF88();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_232E45114(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_232E5AF58();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

char *CarrySettingsViewController.__allocating_init(withHomeID:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return CarrySettingsViewController.init(withHomeID:)(a1);
}

char *CarrySettingsViewController.init(withHomeID:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v4 - 8);
  id v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = 0;
  uint64_t v40 = 0xE000000000000000;
  uint64_t v6 = v1;
  sub_232E5B058();
  swift_bridgeObjectRelease();
  uint64_t v39 = 0xD000000000000011;
  uint64_t v40 = 0x8000000232E5D3C0;
  uint64_t v7 = sub_232E5ACC8();
  sub_232E506A0(&qword_268754BF0, MEMORY[0x263F07508]);
  uint64_t v34 = a1;
  sub_232E5B0B8();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E42984(v39, v40, (uint64_t)ObjectType, (uint64_t)&off_26E69A0F0);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  uint64_t v36 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(&v6[OBJC_IVAR____HPSUICarrySettingsViewController_homeID], a1, v7);
  *(void *)&v6[OBJC_IVAR____HPSUICarrySettingsViewController_identifiers] = MEMORY[0x263F8EE88];

  v41.receiver = v6;
  v41.super_class = ObjectType;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v41, sel_init);
  uint64_t v10 = &v9[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *((void *)v10 + 1);
  uint64_t v33 = *((void *)v10 + 5);
  long long v32 = *((_OWORD *)v10 + 4);
  *(_OWORD *)uint64_t v10 = xmmword_232E5C400;
  *((_OWORD *)v10 + 1) = xmmword_232E5C410;
  *((_OWORD *)v10 + 2) = xmmword_232E5C420;
  *((_OWORD *)v10 + 3) = xmmword_232E5C430;
  *((_OWORD *)v10 + 4) = xmmword_232E5C440;
  *((void *)v10 + 10) = 0xED000073676E6974;
  uint64_t v13 = v9;
  sub_232E4CAC0(v11, v12);
  long long v14 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  long long v15 = (char *)objc_allocWithZone(v14);
  *(void *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  uint64_t v16 = swift_unknownObjectWeakInit();
  *(void *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(void *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(void *)(v16 + 8) = &off_26E6999A0;
  swift_unknownObjectWeakAssign();
  id v17 = &v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(void *)id v17 = 0xD00000000000002CLL;
  *((void *)v17 + 1) = 0x8000000232E5D3E0;
  id v18 = objc_allocWithZone(MEMORY[0x263F04DE8]);
  unint64_t v19 = v13;
  id v20 = v15;
  uint64_t v21 = (void *)sub_232E5AEC8();
  id v22 = objc_msgSend(v18, sel_initWithExtensionPointIdentifier_, v21);

  *(void *)&v20[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v22;
  v38.receiver = v20;
  v38.super_class = v14;
  id v23 = objc_msgSendSuper2(&v38, sel_init);

  id v24 = *(void **)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(void *)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v23;

  uint64_t v25 = sub_232E5AF98();
  uint64_t v26 = (uint64_t)v37;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v37, 1, 1, v25);
  uint64_t v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_232E5AF78();
  swift_retain();
  uint64_t v28 = sub_232E5AF68();
  unint64_t v29 = (void *)swift_allocObject();
  uint64_t v30 = MEMORY[0x263F8F500];
  v29[2] = v28;
  v29[3] = v30;
  v29[4] = v27;
  swift_release();
  sub_232E4C410(v26, (uint64_t)&unk_268754C00, (uint64_t)v29);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
  return v19;
}

uint64_t sub_232E4CAC0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_232E4CB10()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

char *CarrySettingsViewController.__allocating_init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return CarrySettingsViewController.init(withHomeID:homeKitIdentifiers:)(a1, a2);
}

char *CarrySettingsViewController.init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v40 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = 0;
  uint64_t v43 = 0xE000000000000000;
  uint64_t v8 = v2;
  sub_232E5B058();
  swift_bridgeObjectRelease();
  uint64_t v42 = 0xD000000000000011;
  uint64_t v43 = 0x8000000232E5D3C0;
  uint64_t v9 = sub_232E5ACC8();
  uint64_t v10 = (void (*)(uint64_t))MEMORY[0x263F07508];
  sub_232E506A0(&qword_268754BF0, MEMORY[0x263F07508]);
  uint64_t v37 = a1;
  sub_232E5B0B8();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  sub_232E506A0((unint64_t *)&qword_268754A40, v10);
  swift_bridgeObjectRetain();
  sub_232E5B008();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E42984(v42, v43, (uint64_t)ObjectType, (uint64_t)&off_26E69A0F0);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  uint64_t v39 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(&v8[OBJC_IVAR____HPSUICarrySettingsViewController_homeID], a1, v9);
  *(void *)&v8[OBJC_IVAR____HPSUICarrySettingsViewController_identifiers] = a2;

  v44.receiver = v8;
  v44.super_class = ObjectType;
  uint64_t v12 = (char *)objc_msgSendSuper2(&v44, sel_init);
  uint64_t v13 = &v12[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *((void *)v13 + 1);
  uint64_t v36 = *((void *)v13 + 5);
  long long v35 = *((_OWORD *)v13 + 4);
  *(_OWORD *)uint64_t v13 = xmmword_232E5C400;
  *((_OWORD *)v13 + 1) = xmmword_232E5C410;
  *((_OWORD *)v13 + 2) = xmmword_232E5C420;
  *((_OWORD *)v13 + 3) = xmmword_232E5C430;
  *((_OWORD *)v13 + 4) = xmmword_232E5C440;
  *((void *)v13 + 10) = 0xED000073676E6974;
  uint64_t v16 = v12;
  sub_232E4CAC0(v14, v15);
  id v17 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  id v18 = (char *)objc_allocWithZone(v17);
  *(void *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  uint64_t v19 = swift_unknownObjectWeakInit();
  *(void *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(void *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(void *)(v19 + 8) = &off_26E6999A0;
  swift_unknownObjectWeakAssign();
  id v20 = &v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(void *)id v20 = 0xD00000000000002CLL;
  *((void *)v20 + 1) = 0x8000000232E5D3E0;
  id v21 = objc_allocWithZone(MEMORY[0x263F04DE8]);
  id v22 = v16;
  id v23 = v18;
  id v24 = (void *)sub_232E5AEC8();
  id v25 = objc_msgSend(v21, sel_initWithExtensionPointIdentifier_, v24);

  *(void *)&v23[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v25;
  v41.receiver = v23;
  v41.super_class = v17;
  id v26 = objc_msgSendSuper2(&v41, sel_init);

  uint64_t v27 = *(void **)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(void *)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v26;

  uint64_t v28 = sub_232E5AF98();
  uint64_t v29 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v40, 1, 1, v28);
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_232E5AF78();
  swift_retain();
  uint64_t v31 = sub_232E5AF68();
  long long v32 = (void *)swift_allocObject();
  uint64_t v33 = MEMORY[0x263F8F500];
  v32[2] = v31;
  v32[3] = v33;
  v32[4] = v30;
  swift_release();
  sub_232E4C410(v29, (uint64_t)&unk_268754C08, (uint64_t)v32);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
  return v22;
}

Swift::Void __swiftcall CarrySettingsViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v7, sel_viewWillAppear_, a1);
  id v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_navigationBar);

    id v6 = objc_msgSend(v5, sel_standardAppearance);
    objc_msgSend(v5, sel_setScrollEdgeAppearance_, v6);
  }
}

Swift::Void __swiftcall CarrySettingsViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_viewWillDisappear_, a1);
  id v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_navigationBar);

    objc_msgSend(v5, sel_setScrollEdgeAppearance_, 0);
  }
}

uint64_t sub_232E4D544()
{
  v1[3] = v0;
  v1[4] = swift_getObjectType();
  uint64_t v2 = sub_232E5ACC8();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  sub_232E5AF78();
  v1[8] = sub_232E5AF68();
  uint64_t v4 = sub_232E5AF58();
  v1[9] = v4;
  v1[10] = v3;
  return MEMORY[0x270FA2498](sub_232E4D644, v4, v3);
}

uint64_t sub_232E4D644()
{
  v0[2] = v0[4];
  uint64_t v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C28);
  sub_232E5AEE8();
  id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v3 = (void *)sub_232E5AEC8();
  uint64_t v4 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  uint64_t v6 = (void *)sub_232E5AEC8();
  objc_msgSend(v5, sel_ulog_message_, 40, v6);

  uint64_t v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc;
  if (*(void *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc))
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  else
  {
    uint64_t v10 = (void *)v0[3];
    type metadata accessor for XPCConnectionManager();
    uint64_t v11 = swift_allocObject();
    v0[11] = v11;
    id v12 = v10;
    swift_defaultActor_initialize();
    *(void *)(v11 + 152) = 0;
    *(void *)(v11 + 160) = 0;
    *(void *)(v11 + 168) = 0;
    *(void *)(v11 + 112) = v12;
    *(void *)(v11 + 120) = &off_26E6999B0;
    *(_OWORD *)(v11 + 128) = xmmword_232E5C450;
    *(unsigned char *)(v11 + 144) = 2;
    *(void *)(v1 + v7) = v11;
    swift_retain();
    swift_release();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[12] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_232E4D890;
    return sub_232E44174();
  }
}

uint64_t sub_232E4D890()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 72);
  if (v0) {
    id v5 = sub_232E4DCE8;
  }
  else {
    id v5 = sub_232E4D9CC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_232E4D9CC()
{
  uint64_t v1 = v0[3];
  (*(void (**)(void, uint64_t, void))(v0[6] + 16))(v0[7], v1 + OBJC_IVAR____HPSUICarrySettingsViewController_homeID, v0[5]);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____HPSUICarrySettingsViewController_identifiers);
  v0[14] = v2;
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[15] = v3;
  void *v3 = v0;
  v3[1] = sub_232E4DAB4;
  uint64_t v4 = v0[7];
  return sub_232E488CC(v4, v2);
}

uint64_t sub_232E4DAB4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 56);
  uint64_t v4 = *(void *)(*v1 + 48);
  uint64_t v5 = *(void *)(*v1 + 40);
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v2 + 80);
  uint64_t v7 = *(void *)(v2 + 72);
  if (v0) {
    uint64_t v8 = sub_232E4DD68;
  }
  else {
    uint64_t v8 = sub_232E4DC70;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_232E4DC70()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_232E4DCE8()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_232E4DD68()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_232E4DE18()
{
  uint64_t v1 = v0 + OBJC_IVAR____HPSUICarrySettingsViewController_homeID;
  uint64_t v2 = sub_232E5ACC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

id CarrySettingsViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static CarrySettingsViewController.shouldShowCarrySettingsButton(forHomeID:homeKitIdentifiers:withCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(a1, a3, a4);
}

void sub_232E4E1C4()
{
  sub_232E54410(0x6E69676542646964, 0xEF676E6974736F48);
  sub_232E573A4();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC);
  if (v1)
  {
    id v2 = v1;
    sub_232E54410(0xD00000000000001CLL, 0x8000000232E5D4B0);
    sub_232E54A68(v2);
  }
}

char *sub_232E4E26C()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC];
  if (!v1)
  {
    sub_232E48FFC();
    swift_allocError();
    *uint64_t v7 = 2;
LABEL_6:
    swift_willThrow();
    return v0;
  }
  v9[0] = 0;
  id v2 = (char *)objc_msgSend(v1, sel_makeXPCConnectionWithError_, v9);
  id v3 = v9[0];
  if (!v2)
  {
    uint64_t v0 = (char *)v9[0];
    sub_232E5AC98();

    goto LABEL_6;
  }
  uint64_t v0 = v2;
  uint64_t v4 = self;
  id v5 = v3;
  id v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26E6A60E8);
  objc_msgSend(v0, sel_setRemoteObjectInterface_, v6);

  return v0;
}

char *sub_232E4E3BC()
{
  return sub_232E4E26C();
}

uint64_t sub_232E4E3D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  sub_232E5AF78();
  v4[10] = sub_232E5AF68();
  uint64_t v6 = sub_232E5AF58();
  v4[11] = v6;
  v4[12] = v5;
  return MEMORY[0x270FA2498](sub_232E4E46C, v6, v5);
}

uint64_t sub_232E4E46C()
{
  uint64_t v1 = v0[9] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237DB4AF0](v1);
  v0[13] = v2;
  if (v2)
  {
    id v3 = (void *)swift_task_alloc();
    v0[14] = v3;
    void *v3 = v0;
    v3[1] = sub_232E4E70C;
    return sub_232E4F298();
  }
  else
  {
    swift_release();
    sub_232E48FFC();
    uint64_t v5 = (void *)swift_allocError();
    *uint64_t v6 = 0;
    swift_willThrow();
    sub_232E5B058();
    v0[5] = 0;
    v0[6] = 0xE000000000000000;
    sub_232E5AF08();
    v0[7] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
    sub_232E5B078();
    v0[8] = type metadata accessor for CarrySettingsViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754C28);
    sub_232E5AEE8();
    id v7 = objc_allocWithZone(MEMORY[0x263F38560]);
    uint64_t v8 = (void *)sub_232E5AEC8();
    uint64_t v9 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    uint64_t v11 = (void *)sub_232E5AEC8();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);
    swift_bridgeObjectRelease();

    id v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_232E4E70C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_232E4E848;
  }
  else {
    uint64_t v5 = sub_232E50800;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_232E4E848()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 120);
  sub_232E5B058();
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0xE000000000000000;
  sub_232E5AF08();
  *(void *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
  sub_232E5B078();
  *(void *)(v0 + 64) = type metadata accessor for CarrySettingsViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C28);
  sub_232E5AEE8();
  id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v3 = (void *)sub_232E5AEC8();
  uint64_t v4 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  uint64_t v6 = (void *)sub_232E5AEC8();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);
  swift_bridgeObjectRelease();

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_232E4EA30(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E49854;
  return sub_232E4E3D4(a1, v4, v5, v6);
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E4EB28(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E44F2C;
  return sub_232E4E3D4(a1, v4, v5, v6);
}

uint64_t sub_232E4EBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  sub_232E5AF78();
  v4[10] = sub_232E5AF68();
  uint64_t v6 = sub_232E5AF58();
  v4[11] = v6;
  v4[12] = v5;
  return MEMORY[0x270FA2498](sub_232E4EC74, v6, v5);
}

uint64_t sub_232E4EC74()
{
  uint64_t v1 = v0[9] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237DB4AF0](v1);
  v0[13] = v2;
  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[14] = v3;
    void *v3 = v0;
    v3[1] = sub_232E4EF14;
    return sub_232E4F72C();
  }
  else
  {
    swift_release();
    sub_232E48FFC();
    uint64_t v5 = (void *)swift_allocError();
    *uint64_t v6 = 0;
    swift_willThrow();
    sub_232E5B058();
    v0[5] = 0;
    v0[6] = 0xE000000000000000;
    sub_232E5AF08();
    v0[7] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
    sub_232E5B078();
    v0[8] = type metadata accessor for BetaEnrollmentViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754C50);
    sub_232E5AEE8();
    id v7 = objc_allocWithZone(MEMORY[0x263F38560]);
    uint64_t v8 = (void *)sub_232E5AEC8();
    uint64_t v9 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    uint64_t v11 = (void *)sub_232E5AEC8();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);

    swift_bridgeObjectRelease();
    id v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_232E4EF14()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_232E4F0B8;
  }
  else {
    uint64_t v5 = sub_232E4F050;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_232E4F050()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_232E4F0B8()
{
  uint64_t v1 = (void *)v0[13];
  swift_release();

  uint64_t v2 = (void *)v0[15];
  sub_232E5B058();
  v0[5] = 0;
  v0[6] = 0xE000000000000000;
  sub_232E5AF08();
  v0[7] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
  sub_232E5B078();
  v0[8] = type metadata accessor for BetaEnrollmentViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C50);
  sub_232E5AEE8();
  id v3 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v4 = (void *)sub_232E5AEC8();
  uint64_t v5 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithSubsystem_category_, v4, v5);

  uint64_t v7 = (void *)sub_232E5AEC8();
  objc_msgSend(v6, sel_ulog_message_, 60, v7);

  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_232E4F298()
{
  v1[6] = v0;
  sub_232E5AF78();
  v1[7] = sub_232E5AF68();
  uint64_t v3 = sub_232E5AF58();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_232E4F330, v3, v2);
}

uint64_t sub_232E4F330()
{
  uint64_t v1 = v0[6];
  sub_232E54410(0xD00000000000001ELL, 0x8000000232E5D4F0);
  uint64_t v2 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner), sel_setHidden_, 0);
  objc_msgSend(*(id *)(v1 + v2), sel_startAnimating);
  type metadata accessor for BaseExtensionViewController();
  uint64_t v4 = sub_232E54A08();
  if (*(void *)(v3 + 8))
  {
    uint64_t v5 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_232E5440C(0x7472617453, 0xE500000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v5 + 24) = mach_absolute_time();
    *(unsigned char *)(v5 + 32) = 0;
  }
  ((void (*)(void *, void))v4)(v0 + 2, 0);
  id v6 = *(void **)(v0[6] + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient);
  v0[10] = v6;
  if (v6)
  {
    v6;
    uint64_t v7 = (void *)swift_task_alloc();
    v0[11] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_232E4F560;
    return sub_232E49858();
  }
  else
  {
    swift_release();
    sub_232E48FFC();
    swift_allocError();
    *uint64_t v9 = 2;
    swift_willThrow();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_232E4F560(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 72);
    uint64_t v7 = sub_232E50804;
  }
  else
  {

    *(void *)(v4 + 104) = a1;
    uint64_t v5 = *(void *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 72);
    uint64_t v7 = sub_232E4F690;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_232E4F690()
{
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = v0[6];
  swift_release();
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC);
  *(void *)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC) = v1;
  id v4 = v1;

  sub_232E54A68(v4);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_232E4F72C()
{
  v1[6] = v0;
  sub_232E5AF78();
  v1[7] = sub_232E5AF68();
  uint64_t v3 = sub_232E5AF58();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_232E4F7C4, v3, v2);
}

uint64_t sub_232E4F7C4()
{
  uint64_t v1 = v0[6];
  sub_232E552CC(0xD00000000000001ELL, 0x8000000232E5D4F0);
  uint64_t v2 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner), sel_setHidden_, 0);
  objc_msgSend(*(id *)(v1 + v2), sel_startAnimating);
  type metadata accessor for BaseExtensionViewController();
  id v4 = sub_232E54A08();
  if (*(void *)(v3 + 8))
  {
    uint64_t v5 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_232E5440C(0x7472617453, 0xE500000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v5 + 24) = mach_absolute_time();
    *(unsigned char *)(v5 + 32) = 0;
  }
  ((void (*)(void *, void))v4)(v0 + 2, 0);
  uint64_t v6 = *(void **)(v0[6] + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient);
  v0[10] = v6;
  if (v6)
  {
    v6;
    uint64_t v7 = (void *)swift_task_alloc();
    v0[11] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_232E4F9F4;
    return sub_232E49858();
  }
  else
  {
    swift_release();
    sub_232E48FFC();
    swift_allocError();
    *uint64_t v9 = 2;
    swift_willThrow();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_232E4F9F4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 72);
    uint64_t v7 = sub_232E4FBC0;
  }
  else
  {

    *(void *)(v4 + 104) = a1;
    uint64_t v5 = *(void *)(v4 + 64);
    uint64_t v6 = *(void *)(v4 + 72);
    uint64_t v7 = sub_232E4FB24;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_232E4FB24()
{
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = v0[6];
  swift_release();
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC);
  *(void *)(v2 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC) = v1;
  id v4 = v1;

  sub_232E54FF4(v4);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_232E4FBC0()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_232E4FC2C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_232E4FD08;
  return v6(a1);
}

uint64_t sub_232E4FD08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_232E4FE00(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_232E4FEE0;
  return v5(v2 + 32);
}

uint64_t sub_232E4FEE0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t _s22HomePlatformSettingsUI05CarryC14ViewControllerC010shouldShoweC6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = a2;
  uint64_t v6 = sub_232E5AE68();
  uint64_t v20 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_232E5AE88();
  uint64_t v9 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = (void *)sub_232E5AEC8();
  char v13 = MGGetBoolAnswer();

  uint64_t aBlock = 0;
  uint64_t v23 = 0xE000000000000000;
  sub_232E5B058();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0xD00000000000002DLL;
  uint64_t v23 = 0x8000000232E5D510;
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E42984(aBlock, v23, v4, (uint64_t)&off_26E69A0F0);
  swift_bridgeObjectRelease();
  sub_232E505DC();
  uint64_t v14 = (void *)sub_232E5B018();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v18;
  *(void *)(v15 + 24) = a3;
  *(unsigned char *)(v15 + 32) = v13;
  id v26 = sub_232E50654;
  uint64_t v27 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  id v24 = sub_232E44AB0;
  id v25 = &block_descriptor_3;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  sub_232E5AE78();
  uint64_t v21 = MEMORY[0x263F8EE78];
  sub_232E506A0(&qword_268754C68, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C70);
  sub_232E506E8();
  sub_232E5B048();
  MEMORY[0x237DB4310](0, v11, v8, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v19);
  return swift_release();
}

uint64_t sub_232E5037C()
{
  return type metadata accessor for CarrySettingsViewController();
}

uint64_t type metadata accessor for CarrySettingsViewController()
{
  uint64_t result = qword_268754C10;
  if (!qword_268754C10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_232E503D0()
{
  uint64_t result = sub_232E5ACC8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CarrySettingsViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CarrySettingsViewController);
}

uint64_t dispatch thunk of CarrySettingsViewController.__allocating_init(withHomeID:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of CarrySettingsViewController.__allocating_init(withHomeID:homeKitIdentifiers:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t sub_232E504AC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_232E504E4(char a1, uint64_t a2)
{
  return sub_232E57388(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_232E504EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E50524(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_232E44F2C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268754C30 + dword_268754C30);
  return v6(a1, v4);
}

unint64_t sub_232E505DC()
{
  unint64_t result = qword_268754C60;
  if (!qword_268754C60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268754C60);
  }
  return result;
}

uint64_t sub_232E5061C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_232E50654()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32), 0);
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

uint64_t sub_232E506A0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_232E506E8()
{
  unint64_t result = qword_268754C78;
  if (!qword_268754C78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268754C70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754C78);
  }
  return result;
}

uint64_t sub_232E50744(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_232E49854;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268754C80 + dword_268754C80);
  return v6(a1, v4);
}

uint64_t sub_232E50810(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_232E50828()
{
  uint64_t result = type metadata accessor for Loader.CacheEntry();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_232E508D0()
{
  sub_232E518D4(v0[14]);
  unint64_t v1 = (char *)v0 + *(void *)(*v0 + 104);
  uint64_t v2 = type metadata accessor for Loader.CacheEntry();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_232E50968()
{
  sub_232E508D0();
  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for Loader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Loader.CacheEntry()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_232E509C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_232E509CC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_232E50A68(void *__dst, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = __dst;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    void *v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 1)
    {
      (*(void (**)(void *))(v4 + 16))(__dst);
      *((unsigned char *)v3 + v5) = 1;
      return v3;
    }
    if (v9)
    {
      memcpy(__dst, a2, v5 + 1);
      return v3;
    }
    *__dst = *(void *)a2;
    *((unsigned char *)__dst + v5) = 0;
  }
  swift_retain();
  return v3;
}

unsigned __int8 *sub_232E50BF4(unsigned __int8 *result, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  unsigned int v3 = result[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *result;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)result;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)result | (result[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)result;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  if (!v3) {
    return (unsigned __int8 *)swift_release();
  }
  return result;
}

unsigned char *sub_232E50CFC(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(__dst);
    __dst[v4] = 1;
  }
  else if (v5)
  {
    memcpy(__dst, a2, v4 + 1);
  }
  else
  {
    *(void *)__dst = *(void *)a2;
    __dst[v4] = 0;
    swift_retain();
  }
  return __dst;
}

unsigned __int8 *sub_232E50E4C(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = __dst[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *__dst;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(__dst, v5);
    }
    else if (!v8)
    {
      swift_release();
    }
    unsigned int v13 = __src[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__src;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      *(void *)__dst = *(void *)__src;
      __dst[v7] = 0;
      swift_retain();
    }
  }
  return __dst;
}

unsigned char *sub_232E51084(unsigned char *__dst, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(__dst);
    __dst[v4] = 1;
  }
  else if (v5)
  {
    memcpy(__dst, a2, v4 + 1);
  }
  else
  {
    *(void *)__dst = *(void *)a2;
    __dst[v4] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_232E511D0(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  if (__dst != __src)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = __dst[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *__dst;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)__dst;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)__dst | (__dst[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)__dst;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1)
    {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(__dst, v5);
    }
    else if (!v8)
    {
      swift_release();
    }
    unsigned int v13 = __src[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *__src;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)__src;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)__src | (__src[2] << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)__src;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
      __dst[v7] = 1;
    }
    else if (v13)
    {
      memcpy(__dst, __src, v7 + 1);
    }
    else
    {
      *(void *)__dst = *(void *)__src;
      __dst[v7] = 0;
    }
  }
  return __dst;
}

uint64_t sub_232E51404(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 8;
  if (*(void *)(v3 + 64) > 8uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 253) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 3) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 254;
}

void sub_232E51538(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v8 = a2 - 254;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x232E51700);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_232E51728(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_232E517E0(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v4 = 8;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_232E518B8()
{
  return sub_232E44C48();
}

uint64_t sub_232E518D4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_232E51914(uint64_t a1, uint64_t a2)
{
  sub_232E42984(0xD000000000000036, 0x8000000232E5D620, v2, (uint64_t)&off_26E699BE8);
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedManager);
  if (v5)
  {
    unsigned int v6 = v5;
    int v7 = (void *)swift_allocObject();
    v7[2] = a1;
    v7[3] = a2;
    v7[4] = v2;
    v9[4] = sub_232E51D84;
    v9[5] = v7;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    id v9[2] = sub_232E51CCC;
    v9[3] = &block_descriptor_4;
    unsigned int v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_queryProgramsForSystemAccountsWithPlatforms_completion_, 16, v8);
    _Block_release(v8);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_232E51A50(unint64_t a1, uint64_t a2, uint64_t (*a3)(BOOL), uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    sub_232E5B058();
    sub_232E5AF08();
    type metadata accessor for SDBetaManagerErrorType();
    sub_232E5B078();
    sub_232E428FC(60, 0, 0xE000000000000000, a5, (uint64_t)&off_26E699BE8);
    swift_bridgeObjectRelease();
  }
  if (a1)
  {
    swift_bridgeObjectRetain();
    sub_232E5B058();
    swift_bridgeObjectRelease();
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_232E5B088();
      swift_bridgeObjectRelease();
    }
    sub_232E5B0B8();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E5AF08();
    unint64_t v8 = sub_232E51DA8();
    MEMORY[0x237DB4220](a1, v8);
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E42984(0x20646E756F46, 0xE600000000000000, a5, (uint64_t)&off_26E699BE8);
    swift_bridgeObjectRelease();
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_232E5B088();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    BOOL v10 = v9 != 0;
  }
  else
  {
    sub_232E428FC(60, 0xD00000000000001ELL, 0x8000000232E5D6B0, a5, (uint64_t)&off_26E699BE8);
    BOOL v10 = 0;
  }
  return a3(v10);
}

uint64_t sub_232E51CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    sub_232E51DA8();
    uint64_t v4 = sub_232E5AF28();
  }
  swift_retain();
  v5(v4, a3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232E51D4C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E51D84(unint64_t a1, uint64_t a2)
{
  return sub_232E51A50(a1, a2, *(uint64_t (**)(BOOL))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
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

unint64_t sub_232E51DA8()
{
  unint64_t result = qword_268754D98;
  if (!qword_268754D98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_268754D98);
  }
  return result;
}

uint64_t sub_232E51DE8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
    uint64_t v4 = swift_allocError();
    *id v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_232E51E80()
{
  *(void *)(v1 + 88) = v0;
  return MEMORY[0x270FA2498](sub_232E51EA0, v0, 0);
}

uint64_t sub_232E51EA0()
{
  sub_232E5AF78();
  *(void *)(v0 + 96) = sub_232E5AF68();
  uint64_t v2 = sub_232E5AF58();
  return MEMORY[0x270FA2498](sub_232E51F34, v2, v1);
}

uint64_t sub_232E51F34()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  uint64_t v2 = *(void **)(v1 + 152);
  *(void *)(v0 + 104) = v2;
  id v3 = v2;
  return MEMORY[0x270FA2498](sub_232E51FAC, v1, 0);
}

uint64_t sub_232E51FAC()
{
  uint64_t v1 = (void *)v0[13];
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_remoteObjectProxy);
    sub_232E5B038();
    swift_unknownObjectRelease();
    sub_232E49050((uint64_t)(v0 + 2), (uint64_t)(v0 + 6));
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754DB0);
    int v3 = swift_dynamicCast();
    uint64_t v4 = (void *)v0[13];
    if (v3)
    {

      uint64_t v5 = v0[10];
      __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
      id v6 = (uint64_t (*)(uint64_t))v0[1];
      return v6(v5);
    }
    sub_232E48FFC();
    swift_allocError();
    *uint64_t v9 = 4;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  }
  else
  {
    sub_232E48FFC();
    swift_allocError();
    *unint64_t v8 = 3;
    swift_willThrow();
  }
  BOOL v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_232E52150(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  int v3 = (void *)swift_task_alloc();
  v2[17] = v3;
  void *v3 = v2;
  v3[1] = sub_232E521FC;
  v3[11] = v1;
  return MEMORY[0x270FA2498](sub_232E51EA0, v1, 0);
}

uint64_t sub_232E521FC(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 144) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 128);
    return MEMORY[0x270FA2498](sub_232E52344, v7, 0);
  }
}

uint64_t sub_232E52344()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = sub_232E5ACA8();
  v0[19] = v2;
  v0[2] = v0;
  v0[3] = sub_232E48230;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_232E51DE8;
  v0[13] = &block_descriptor_37;
  v0[14] = v3;
  objc_msgSend(v1, sel_receiveWithBetaEnrollmentHomeID_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_232E525CC(uint64_t a1, const void *a2, uint64_t a3)
{
  v3[2] = a3;
  uint64_t v5 = sub_232E5ACC8();
  v3[3] = v5;
  v3[4] = *(void *)(v5 - 8);
  uint64_t v6 = swift_task_alloc();
  v3[5] = v6;
  v3[6] = _Block_copy(a2);
  sub_232E5ACB8();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[7] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_232E486E0;
  return sub_232E52150(v6);
}

uint64_t sub_232E526F8(uint64_t a1, uint64_t a2)
{
  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[18] = v4;
  void *v4 = v3;
  v4[1] = sub_232E527A8;
  v4[11] = v2;
  return MEMORY[0x270FA2498](sub_232E51EA0, v2, 0);
}

uint64_t sub_232E527A8(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(*v2 + 152) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 136);
    return MEMORY[0x270FA2498](sub_232E528F0, v7, 0);
  }
}

uint64_t sub_232E528F0()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = sub_232E5ACA8();
  v0[20] = v2;
  sub_232E5ACC8();
  sub_232E48FA4();
  uint64_t v3 = sub_232E5AFE8();
  v0[21] = v3;
  v0[2] = v0;
  v0[3] = sub_232E48C04;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_232E51DE8;
  v0[13] = &block_descriptor_1;
  v0[14] = v4;
  objc_msgSend(v1, sel_receiveWithBetaEnrollmentHomeID_identifiers_completionHandler_, v2, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_232E52BB8(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v6 = sub_232E5ACC8();
  v4[3] = v6;
  v4[4] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v4[5] = v7;
  v4[6] = _Block_copy(a3);
  sub_232E5ACB8();
  sub_232E48FA4();
  uint64_t v8 = sub_232E5AFF8();
  v4[7] = v8;
  swift_retain();
  uint64_t v9 = (void *)swift_task_alloc();
  v4[8] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_232E4925C;
  return sub_232E526F8(v7, v8);
}

uint64_t sub_232E52D18()
{
  _Block_release(*(const void **)(v0 + 32));
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_232E52D68()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (const void *)v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_232E44F2C;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, const void *, uint64_t))((char *)&dword_268754DB8 + dword_268754DB8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_232E52E28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_232E49854;
  return v6();
}

uint64_t sub_232E52EF8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_232E49854;
  return v7();
}

uint64_t sub_232E52FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E5AF98();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_232E5AF88();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_232E45114(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_232E5AF58();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_232E5316C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E531A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_232E44F2C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268754DD8 + dword_268754DD8);
  return v6(a1, v4);
}

uint64_t sub_232E5325C()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E532A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (const void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_232E49854;
  uint64_t v6 = (uint64_t (*)(uint64_t, const void *, uint64_t))((char *)&dword_268754DE8 + dword_268754DE8);
  return v6(v2, v3, v4);
}

uint64_t initializeWithCopy for DeviceGestalt(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(unsigned char *)(a1 + 59) = *(unsigned char *)(a2 + 59);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeviceGestalt(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(unsigned char *)(a1 + 59) = *(unsigned char *)(a2 + 59);
  return a1;
}

__n128 __swift_memcpy60_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 44) = *(_OWORD *)(a2 + 44);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DeviceGestalt(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(unsigned char *)(a1 + 59) = *(unsigned char *)(a2 + 59);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceGestalt(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 60)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceGestalt(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 60) = 1;
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
    *(unsigned char *)(result + 60) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceGestalt()
{
  return &type metadata for DeviceGestalt;
}

uint64_t getEnumTagSinglePayload for DeviceIcon(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEC) {
    goto LABEL_17;
  }
  if (a2 + 20 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 20) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 20;
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
      return (*a1 | (v4 << 8)) - 20;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 20;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x15;
  int v8 = v6 - 21;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DeviceIcon(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 20 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 20) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEB)
  {
    unsigned int v6 = ((a2 - 236) >> 8) + 1;
    *__n128 result = a2 + 20;
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
        JUMPOUT(0x232E53714);
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
          *__n128 result = a2 + 20;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceIcon()
{
  return &type metadata for DeviceIcon;
}

uint64_t getEnumTagSinglePayload for DeviceClass(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DeviceClass(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 10;
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
        JUMPOUT(0x232E538A8);
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
          *__n128 result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceClass()
{
  return &type metadata for DeviceClass;
}

uint64_t initializeWithCopy for DeviceModelIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeviceModelIdentifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v5;
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DeviceModelIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceModelIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceModelIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceModelIdentifier()
{
  return &type metadata for DeviceModelIdentifier;
}

unint64_t sub_232E53B00()
{
  unint64_t result = qword_268754E10;
  if (!qword_268754E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754E10);
  }
  return result;
}

unint64_t sub_232E53B54(char a1)
{
  unint64_t result = 0x6F6C2E656C707061;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7674656C707061;
      break;
    case 2:
      unint64_t result = 0x63756F74646F7069;
      break;
    case 3:
      unint64_t result = 0x656E6F687069;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 1684107369;
      break;
    case 6:
      unint64_t result = 0x6D6F682E64617069;
      break;
    case 7:
      unint64_t result = 0x63706F746B736564;
      break;
    case 8:
      unint64_t result = 0x696E696D63616DLL;
      break;
    case 9:
      unint64_t result = 0x696475747363616DLL;
      break;
    case 10:
      unint64_t result = 0x672E6F727063616DLL;
      break;
    case 11:
      unint64_t result = 0x672E6F727063616DLL;
      break;
    case 12:
      unint64_t result = 0x672E6F727063616DLL;
      break;
    case 13:
      unint64_t result = 0x6F63706F7470616CLL;
      break;
    case 14:
      unint64_t result = 0x746177656C707061;
      break;
    case 15:
      unint64_t result = 0x646F70656D6F68;
      break;
    case 16:
      unint64_t result = 0x2E646F70656D6F68;
      break;
    case 17:
    case 18:
      unint64_t result = 0x6D646F70656D6F68;
      break;
    case 19:
      unint64_t result = 0xD000000000000017;
      break;
    case 20:
      unint64_t result = 0x6165707369666968;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_232E53E38(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_232E53B54(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_232E53B54(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_232E5B0C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_232E53EC4()
{
  char v1 = *v0;
  sub_232E5B148();
  sub_232E53B54(v1);
  sub_232E5AEF8();
  swift_bridgeObjectRelease();
  return sub_232E5B168();
}

uint64_t sub_232E53F28()
{
  sub_232E53B54(*v0);
  sub_232E5AEF8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232E53F7C()
{
  char v1 = *v0;
  sub_232E5B148();
  sub_232E53B54(v1);
  sub_232E5AEF8();
  swift_bridgeObjectRelease();
  return sub_232E5B168();
}

uint64_t sub_232E53FDC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_232E54090();
  *a1 = result;
  return result;
}

unint64_t sub_232E5400C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_232E53B54(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_232E5403C()
{
  unint64_t result = qword_268754E18;
  if (!qword_268754E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754E18);
  }
  return result;
}

uint64_t sub_232E54090()
{
  unint64_t v0 = sub_232E5B0D8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x15) {
    return 21;
  }
  else {
    return v0;
  }
}

ValueMetadata *type metadata accessor for AnalyticsEvent()
{
  return &type metadata for AnalyticsEvent;
}

void sub_232E540FC()
{
  unint64_t v0 = (void *)sub_232E5AEC8();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  qword_268756050 = (uint64_t)v1;
}

uint64_t sub_232E5416C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_232E54180(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_232E54194(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_232E541A8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t getEnumTagSinglePayload for RemoteViewControllerError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for RemoteViewControllerError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x232E542C0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_232E542E8()
{
  return 0;
}

ValueMetadata *type metadata accessor for RemoteViewControllerError()
{
  return &type metadata for RemoteViewControllerError;
}

unint64_t sub_232E54304()
{
  unint64_t result = qword_268754E20;
  if (!qword_268754E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754E20);
  }
  return result;
}

uint64_t sub_232E54358()
{
  return 1;
}

uint64_t sub_232E54360()
{
  return sub_232E5B168();
}

uint64_t sub_232E543A4()
{
  return sub_232E5B158();
}

uint64_t sub_232E543CC()
{
  return sub_232E5B168();
}

void sub_232E54410(uint64_t a1, uint64_t a2)
{
}

id sub_232E54434()
{
  *(void *)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC] = 0;
  id v1 = &v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  *(_OWORD *)id v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((void *)v1 + 10) = 0;
  *(void *)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = 0;
  v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] = 0;
  *(void *)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc] = 0;
  uint64_t v2 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  id v3 = objc_allocWithZone(MEMORY[0x263F823E8]);
  unsigned int v4 = v0;
  *(void *)&v0[v2] = objc_msgSend(v3, sel_init);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

id sub_232E5452C(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC] = 0;
  objc_super v6 = &v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((void *)v6 + 10) = 0;
  *(void *)&v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = 0;
  v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] = 0;
  *(void *)&v3[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc] = 0;
  uint64_t v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  id v8 = objc_allocWithZone(MEMORY[0x263F823E8]);
  uint64_t v9 = v3;
  *(void *)&v3[v7] = objc_msgSend(v8, sel_init);

  if (a2)
  {
    BOOL v10 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v10 = 0;
  }
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  id v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, v10, a3);

  return v11;
}

id sub_232E546B0(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC] = 0;
  id v3 = &v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  *(_OWORD *)id v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((void *)v3 + 10) = 0;
  *(void *)&v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = 0;
  v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc] = 0;
  uint64_t v4 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
  id v5 = objc_allocWithZone(MEMORY[0x263F823E8]);
  objc_super v6 = v1;
  *(void *)&v1[v4] = objc_msgSend(v5, sel_init);

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id sub_232E547C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_232E552F0(0x4C64694477656956, 0xEB0000000064616FLL, a3, (void (*)(uint64_t))type metadata accessor for BaseExtensionViewController, &qword_268754E60);
  id result = objc_msgSend(v3, sel_view);
  if (result)
  {
    objc_super v6 = result;
    id v7 = *(id *)&v4[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner];
    sub_232E42534(v7);

    id v8 = *(void **)&v4[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC];
    if (v8)
    {
      id v9 = v8;
      sub_232E552F0(0xD00000000000001CLL, 0x8000000232E5D4B0, v10, (void (*)(uint64_t))type metadata accessor for BaseExtensionViewController, &qword_268754E60);
      sub_232E54D30(v9);
    }
    v11.receiver = v4;
    v11.super_class = (Class)type metadata accessor for BaseExtensionViewController();
    return objc_msgSendSuper2(&v11, sel_viewDidLoad);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id BaseExtensionViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseExtensionViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_232E54A08())()
{
  return j__swift_endAccess;
}

id sub_232E54A68(id result)
{
  objc_super v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled;
  if ((v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] & 1) == 0)
  {
    id v4 = result;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754C28);
    sub_232E5AEE8();
    id v5 = objc_allocWithZone(MEMORY[0x263F38560]);
    objc_super v6 = (void *)sub_232E5AEC8();
    id v7 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v5, sel_initWithSubsystem_category_, v6, v7);

    id v9 = (void *)sub_232E5AEC8();
    objc_msgSend(v8, sel_ulog_message_, 40, v9);

    type metadata accessor for Stopwatch();
    uint64_t inited = swift_initStackObject();
    *(unsigned char *)(inited + 16) = 1;
    *(void *)(inited + 24) = 0;
    *(unsigned char *)(inited + 32) = 1;
    *(void *)(inited + 40) = 0;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 24) = mach_absolute_time();
    *(unsigned char *)(inited + 32) = 0;
    *(unsigned char *)(inited + 16) = 0;
    objc_msgSend(v2, sel_wrapWithSubViewController_, v4);
    v2[v3] = 1;
    sub_232E5B058();
    swift_bridgeObjectRelease();
    sub_232E4B2A4();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E5AEE8();
    id v11 = objc_allocWithZone(MEMORY[0x263F38560]);
    int v12 = (void *)sub_232E5AEC8();
    objc_super v13 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_initWithSubsystem_category_, v12, v13);

    uint64_t v15 = (void *)sub_232E5AEC8();
    objc_msgSend(v14, sel_ulog_message_, 40, v15);
    swift_bridgeObjectRelease();

    uint64_t v16 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner], sel_setHidden_, 1);
    return objc_msgSend(*(id *)&v2[v16], sel_stopAnimating);
  }
  return result;
}

id sub_232E54D30(id result)
{
  objc_super v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled;
  if ((v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] & 1) == 0)
  {
    id v4 = result;
    type metadata accessor for BaseExtensionViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754E60);
    sub_232E5AEE8();
    id v5 = objc_allocWithZone(MEMORY[0x263F38560]);
    objc_super v6 = (void *)sub_232E5AEC8();
    id v7 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v5, sel_initWithSubsystem_category_, v6, v7);

    id v9 = (void *)sub_232E5AEC8();
    objc_msgSend(v8, sel_ulog_message_, 40, v9);

    type metadata accessor for Stopwatch();
    uint64_t inited = swift_initStackObject();
    *(unsigned char *)(inited + 16) = 1;
    *(void *)(inited + 24) = 0;
    *(unsigned char *)(inited + 32) = 1;
    *(void *)(inited + 40) = 0;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 24) = mach_absolute_time();
    *(unsigned char *)(inited + 32) = 0;
    *(unsigned char *)(inited + 16) = 0;
    objc_msgSend(v2, sel_wrapWithSubViewController_, v4);
    v2[v3] = 1;
    sub_232E5B058();
    swift_bridgeObjectRelease();
    sub_232E4B2A4();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E5AEE8();
    id v11 = objc_allocWithZone(MEMORY[0x263F38560]);
    int v12 = (void *)sub_232E5AEC8();
    objc_super v13 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v11, sel_initWithSubsystem_category_, v12, v13);

    uint64_t v15 = (void *)sub_232E5AEC8();
    objc_msgSend(v14, sel_ulog_message_, 40, v15);
    swift_bridgeObjectRelease();

    uint64_t v16 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner], sel_setHidden_, 1);
    return objc_msgSend(*(id *)&v2[v16], sel_stopAnimating);
  }
  return result;
}

id sub_232E54FF4(id result)
{
  objc_super v2 = v1;
  uint64_t v3 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled;
  if ((v1[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCInstalled] & 1) == 0)
  {
    id v4 = result;
    sub_232E552F0(0xD000000000000014, 0x8000000232E5D800, 0, (void (*)(uint64_t))type metadata accessor for BetaEnrollmentViewController, &qword_268754C50);
    type metadata accessor for Stopwatch();
    uint64_t inited = swift_initStackObject();
    *(unsigned char *)(inited + 16) = 1;
    *(void *)(inited + 24) = 0;
    *(unsigned char *)(inited + 32) = 1;
    *(void *)(inited + 40) = 0;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 24) = mach_absolute_time();
    *(unsigned char *)(inited + 32) = 0;
    *(unsigned char *)(inited + 16) = 0;
    objc_msgSend(v2, sel_wrapWithSubViewController_, v4);
    v2[v3] = 1;
    sub_232E5B058();
    swift_bridgeObjectRelease();
    sub_232E4B2A4();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E552F0(0xD000000000000014, 0x8000000232E5D820, 0, (void (*)(uint64_t))type metadata accessor for BetaEnrollmentViewController, &qword_268754C50);
    swift_bridgeObjectRelease();
    uint64_t v6 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner], sel_setHidden_, 1);
    return objc_msgSend(*(id *)&v2[v6], sel_stopAnimating);
  }
  return result;
}

void sub_232E55180(uint64_t a1, uint64_t a2)
{
}

void sub_232E551A4(uint64_t a1, uint64_t a2)
{
}

void sub_232E551C8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754E58);
  sub_232E5AEE8();
  id v0 = objc_allocWithZone(MEMORY[0x263F38560]);
  id v1 = (void *)sub_232E5AEC8();
  objc_super v2 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v0, sel_initWithSubsystem_category_, v1, v2);

  id v4 = (void *)sub_232E5AEC8();
  objc_msgSend(v3, sel_ulog_message_, 40, v4);
}

void sub_232E552CC(uint64_t a1, uint64_t a2)
{
}

void sub_232E552F0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t *a5)
{
  a4(a3);
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_232E5AEE8();
  id v6 = objc_allocWithZone(MEMORY[0x263F38560]);
  id v7 = (void *)sub_232E5AEC8();
  id v8 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v6, sel_initWithSubsystem_category_, v7, v8);

  uint64_t v10 = (void *)sub_232E5AEC8();
  objc_msgSend(v9, sel_ulog_message_, 40, v10);
}

uint64_t type metadata accessor for BaseExtensionViewController()
{
  return self;
}

uint64_t method lookup function for BaseExtensionViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BaseExtensionViewController);
}

unsigned char *storeEnumTagSinglePayload for Feature(unsigned char *result, int a2, int a3)
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
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x232E554D0);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

unint64_t sub_232E5550C()
{
  unint64_t result = qword_268754E68;
  if (!qword_268754E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754E68);
  }
  return result;
}

const char *sub_232E55560()
{
  return "HomePlatformSettingsUI";
}

const char *sub_232E55574()
{
  return "HomePodBetaEnrollment";
}

uint64_t sub_232E55588()
{
  if (qword_2687548C0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268756050;
  id v1 = (id)qword_268756050;
  uint64_t result = sub_232E5AD68();
  qword_268756058 = result;
  unk_268756060 = v3;
  byte_268756068 = v4 & 1;
  qword_268756070 = v5;
  unk_268756078 = v0;
  return result;
}

uint64_t sub_232E55610()
{
  if (qword_2687548C0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268756050;
  id v1 = (id)qword_268756050;
  uint64_t result = sub_232E5AD68();
  qword_268756080 = result;
  *(void *)algn_268756088 = v3;
  byte_268756090 = v4 & 1;
  qword_268756098 = v5;
  unk_2687560A0 = v0;
  return result;
}

uint64_t sub_232E556A4()
{
  if (qword_2687548C0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268756050;
  id v1 = (id)qword_268756050;
  uint64_t result = sub_232E5AD68();
  qword_2687560A8 = result;
  unk_2687560B0 = v3;
  byte_2687560B8 = v4 & 1;
  qword_2687560C0 = v5;
  unk_2687560C8 = v0;
  return result;
}

uint64_t sub_232E55730(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_232E55744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_232E55758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_232E5576C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_232E55780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(_OWORD *))(a3 + 40);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 48);
  v8[2] = *(_OWORD *)(a1 + 32);
  v8[3] = v6;
  v8[4] = *(_OWORD *)(a1 + 64);
  uint64_t v9 = v4;
  return v3(v8);
}

uint64_t sub_232E557D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_232E557E8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_232E557FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_232E55810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_232E55824(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_232E55838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t sub_232E5584C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t sub_232E55860(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t sub_232E55874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t sub_232E55888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t sub_232E5589C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t sub_232E558B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t sub_232E558C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t sub_232E558D8(uint64_t a1, uint64_t a2)
{
  id v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 152) + **(int **)(a2 + 152));
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_232E44F2C;
  return v7(a1, a2);
}

uint64_t _s17ViewServiceLaunchVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s17ViewServiceLaunchVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17ViewServiceLaunchVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s17ViewServiceLaunchVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17ViewServiceLaunchVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s17ViewServiceLaunchVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s17ViewServiceLaunchVMa()
{
  return &_s17ViewServiceLaunchVN;
}

BOOL sub_232E55CAC(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    __n128 result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_232E55D0C()
{
  uint64_t v1 = v0;
  if (sub_232E55CAC(0, (uint64_t)&unk_26E698E98))
  {
    sub_232E5B058();
    swift_bridgeObjectRelease();
    uint64_t v21 = 0x3D746E657645;
    unint64_t v22 = 0xE600000000000000;
    swift_bridgeObjectRetain();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E5AF08();
    sub_232E562A8();
    sub_232E5671C();
    sub_232E5AEA8();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754E58);
    sub_232E5AEE8();
    id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
    int v3 = (void *)sub_232E5AEC8();
    uint64_t v4 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4, &_s17ViewServiceLaunchVN, 0xE800000000000000);

    int v6 = (void *)sub_232E5AEC8();
    objc_msgSend(v5, sel_ulog_message_, 40, v6);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRetain();
    id v7 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    uint64_t v8 = swift_allocObject();
    long long v9 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v8 + 48) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v8 + 64) = v9;
    *(_OWORD *)(v8 + 80) = *(_OWORD *)(v1 + 64);
    *(void *)(v8 + 96) = *(void *)(v1 + 80);
    long long v10 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v8 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v8 + 32) = v10;
    uint64_t v19 = sub_232E57044;
    uint64_t v20 = v8;
    unint64_t v15 = MEMORY[0x263EF8330];
    unint64_t v16 = 1107296256;
    int v17 = sub_232E56120;
    uint64_t v18 = &block_descriptor_5;
    id v11 = _Block_copy(&v15);
    sub_232E57080(v1);
    swift_release();
    char v12 = AnalyticsSendEventLazy();
    _Block_release(v11);

    if (v12) {
      return;
    }
    sub_232E56FA8();
    swift_allocError();
    uint64_t v14 = 2;
  }
  else
  {
    sub_232E5B058();
    swift_bridgeObjectRelease();
    unint64_t v15 = 0xD000000000000010;
    unint64_t v16 = 0x8000000232E5D900;
    swift_bridgeObjectRetain();
    sub_232E5AF08();
    swift_bridgeObjectRelease();
    sub_232E5AF08();
    sub_232E5440C(0xD000000000000010, 0x8000000232E5D900);
    swift_bridgeObjectRelease();
    sub_232E56FA8();
    swift_allocError();
    uint64_t v14 = 3;
  }
  *objc_super v13 = 0;
  v13[1] = v14;
  swift_willThrow();
}

id sub_232E56120(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_232E5671C();
    uint64_t v4 = (void *)sub_232E5AE98();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_232E561AC()
{
  return 0x3D746E657645;
}

uint64_t sub_232E562A8()
{
  uint64_t v1 = v0;
  *(_OWORD *)unint64_t v16 = *(_OWORD *)v0;
  *(uint64_t *)((char *)&v16[1] + 5) = *(void *)(v0 + 13);
  sub_232E5675C((uint64_t)&v16[2], (uint64_t)v17, &qword_268754E98);
  sub_232E5675C((uint64_t)v17, (uint64_t)&v18, &qword_268754E98);
  uint64_t v2 = MEMORY[0x263F8EE80];
  if ((v19 & 1) == 0)
  {
    int v3 = v18;
    id v4 = objc_allocWithZone(NSNumber);
    swift_bridgeObjectRetain();
    LODWORD(v5) = v3;
    id v6 = objc_msgSend(v4, sel_initWithFloat_, v5);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_232E56BA0((uint64_t)v6, v16[0], v16[1], isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_232E567EC((uint64_t)v16);
  }
  long long v13 = *(_OWORD *)(v1 + 56);
  long long v14 = *(_OWORD *)(v1 + 72);
  sub_232E5675C((uint64_t)&v14, (uint64_t)v15, &qword_268754EA0);
  sub_232E5675C((uint64_t)v15, (uint64_t)v20, &qword_268754EA0);
  if (v20[1])
  {
    id v8 = objc_allocWithZone(NSString);
    sub_232E567C0((uint64_t)v15);
    swift_bridgeObjectRetain();
    long long v9 = (void *)sub_232E5AEC8();
    sub_232E567EC((uint64_t)v15);
    id v10 = objc_msgSend(v8, sel_initWithString_, v9);

    char v11 = swift_isUniquelyReferenced_nonNull_native();
    sub_232E56BA0((uint64_t)v10, v13, *((uint64_t *)&v13 + 1), v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_232E5647C()
{
  if (*(unsigned char *)(v0 + 32) & 1) != 0 || (*(unsigned char *)(v0 + 48))
  {
    *(_DWORD *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 20) = 1;
    *(void *)(v0 + 24) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v1 = (unsigned char *)(v0 + 48);
LABEL_6:
    *(void *)(v0 + 40) = 0;
    unsigned char *v1 = 1;
    return result;
  }
  unint64_t v2 = *(void *)(v0 + 24);
  unint64_t v3 = *(void *)(v0 + 40);
  uint64_t result = v3 - v2;
  if (v3 >= v2)
  {
    uint64_t v1 = (unsigned char *)(v0 + 48);
    UpTicksToSecondsF();
    float v6 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_232E5AF08();
    sub_232E5AFD8();
    sub_232E5AF08();
    sub_232E5440C(0, 0xE000000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(float *)(v0 + 16) = v6;
    *(unsigned char *)(v0 + 20) = 0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_232E55D0C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 20) = 1;
    *(void *)(v0 + 24) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_232E56654()
{
  return sub_232E561AC();
}

unint64_t sub_232E566A0(uint64_t a1)
{
  unint64_t result = sub_232E566C8();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_232E566C8()
{
  unint64_t result = qword_268754E88;
  if (!qword_268754E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754E88);
  }
  return result;
}

unint64_t sub_232E5671C()
{
  unint64_t result = qword_268754E90;
  if (!qword_268754E90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268754E90);
  }
  return result;
}

uint64_t sub_232E5675C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_232E567C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_232E567EC(uint64_t a1)
{
  return a1;
}

unint64_t sub_232E56818(uint64_t a1, uint64_t a2)
{
  sub_232E5B148();
  sub_232E5AEF8();
  uint64_t v4 = sub_232E5B168();
  return sub_232E56D10(a1, a2, v4);
}

uint64_t sub_232E56890(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754EA8);
  char v38 = a2;
  uint64_t v6 = sub_232E5B0A8();
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
  long long v35 = v2;
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
    unint64_t v22 = (void *)(v5 + 64);
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
          unint64_t v3 = v35;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    long long v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_232E5B148();
    sub_232E5AEF8();
    uint64_t result = sub_232E5B168();
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
    int v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void sub_232E56BA0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_232E56818(a2, a3);
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
    sub_232E56DF4();
LABEL_7:
    int v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_232E56890(v15, a4 & 1);
  unint64_t v20 = sub_232E56818(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_232E5B0E8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  int v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

unint64_t sub_232E56D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_232E5B0C8() & 1) == 0)
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
      while (!v14 && (sub_232E5B0C8() & 1) == 0);
    }
  }
  return v6;
}

id sub_232E56DF4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754EA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_232E5B098();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
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

unint64_t sub_232E56FA8()
{
  unint64_t result = qword_268754EB0;
  if (!qword_268754EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754EB0);
  }
  return result;
}

uint64_t sub_232E56FFC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_232E57044()
{
  return sub_232E562A8();
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

uint64_t sub_232E57080(uint64_t a1)
{
  return a1;
}

unint64_t destroy for AnalyticsError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *_s22HomePlatformSettingsUI14AnalyticsErrorOwCP_0(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for AnalyticsError(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  int v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AnalyticsError(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for AnalyticsError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  unsigned int v5 = v4 + 1;
  unsigned int v6 = v4 - 2;
  if (v5 >= 4) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AnalyticsError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_232E57328(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_232E5734C(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *__n128 result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsError()
{
  return &type metadata for AnalyticsError;
}

uint64_t sub_232E57388(char a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(a3 + 16))(a3, a1 & 1, a2);
}

uint64_t sub_232E573A4()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = ObjectType;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C28);
  sub_232E5AEE8();
  id v4 = objc_allocWithZone(MEMORY[0x263F38560]);
  unsigned int v5 = (void *)sub_232E5AEC8();
  unsigned int v6 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithSubsystem_category_, v5, v6);

  uint64_t v8 = (void *)sub_232E5AEC8();
  objc_msgSend(v7, sel_ulog_message_, 40, v8);

  type metadata accessor for BaseExtensionViewController();
  uint64_t v10 = sub_232E54A08();
  if (*(void *)(v9 + 8))
  {
    uint64_t v11 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_232E5440C(1886352467, 0xE400000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v11 + 40) = mach_absolute_time();
    *(unsigned char *)(v11 + 48) = 0;
    sub_232E5647C();
  }
  ((void (*)(void *, void))v10)(v18, 0);
  uint64_t v12 = sub_232E5AF98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_232E5AF78();
  swift_retain();
  uint64_t v14 = sub_232E5AF68();
  unint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  swift_release();
  sub_232E4C410((uint64_t)v3, (uint64_t)&unk_268754F00, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_232E57684()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = &v12[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_232E552CC(0x6E69676542646964, 0xEF676E6974736F48);
  type metadata accessor for BaseExtensionViewController();
  id v4 = sub_232E54A08();
  if (*(void *)(v3 + 8))
  {
    uint64_t v5 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_232E5440C(1886352467, 0xE400000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v5 + 40) = mach_absolute_time();
    *(unsigned char *)(v5 + 48) = 0;
    sub_232E5647C();
  }
  ((void (*)(unsigned char *, void))v4)(v12, 0);
  uint64_t v6 = sub_232E5AF98();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_232E5AF78();
  swift_retain();
  uint64_t v8 = sub_232E5AF68();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  id v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  swift_release();
  sub_232E4C410((uint64_t)v2, (uint64_t)&unk_268754EF0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_232E578A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  sub_232E5AF78();
  v4[10] = sub_232E5AF68();
  uint64_t v6 = sub_232E5AF58();
  v4[11] = v6;
  v4[12] = v5;
  return MEMORY[0x270FA2498](sub_232E57938, v6, v5);
}

uint64_t sub_232E57938()
{
  uint64_t v1 = v0[9] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237DB4AF0](v1);
  v0[13] = v2;
  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[14] = v3;
    void *v3 = v0;
    v3[1] = sub_232E57BD8;
    return sub_232E4D544();
  }
  else
  {
    swift_release();
    sub_232E48FFC();
    uint64_t v5 = (void *)swift_allocError();
    *uint64_t v6 = 0;
    swift_willThrow();
    sub_232E5B058();
    v0[5] = 0;
    v0[6] = 0xE000000000000000;
    sub_232E5AF08();
    v0[7] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
    sub_232E5B078();
    v0[8] = type metadata accessor for CarrySettingsViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754C28);
    sub_232E5AEE8();
    id v7 = objc_allocWithZone(MEMORY[0x263F38560]);
    uint64_t v8 = (void *)sub_232E5AEC8();
    uint64_t v9 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    uint64_t v11 = (void *)sub_232E5AEC8();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);

    swift_bridgeObjectRelease();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_232E57BD8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_232E57D14;
  }
  else {
    uint64_t v5 = sub_232E50800;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_232E57D14()
{
  uint64_t v1 = (void *)v0[13];
  swift_release();

  uint64_t v2 = (void *)v0[15];
  sub_232E5B058();
  v0[5] = 0;
  v0[6] = 0xE000000000000000;
  sub_232E5AF08();
  v0[7] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
  sub_232E5B078();
  v0[8] = type metadata accessor for CarrySettingsViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C28);
  sub_232E5AEE8();
  id v3 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v4 = (void *)sub_232E5AEC8();
  uint64_t v5 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v3, sel_initWithSubsystem_category_, v4, v5);

  uint64_t v7 = (void *)sub_232E5AEC8();
  objc_msgSend(v6, sel_ulog_message_, 60, v7);

  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_232E57EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a4;
  sub_232E5AF78();
  v4[10] = sub_232E5AF68();
  uint64_t v6 = sub_232E5AF58();
  v4[11] = v6;
  v4[12] = v5;
  return MEMORY[0x270FA2498](sub_232E57F8C, v6, v5);
}

uint64_t sub_232E57F8C()
{
  uint64_t v1 = v0[9] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237DB4AF0](v1);
  v0[13] = v2;
  if (v2)
  {
    id v3 = (void *)swift_task_alloc();
    v0[14] = v3;
    void *v3 = v0;
    v3[1] = sub_232E5822C;
    return sub_232E598F8();
  }
  else
  {
    swift_release();
    sub_232E48FFC();
    uint64_t v5 = (void *)swift_allocError();
    *uint64_t v6 = 0;
    swift_willThrow();
    sub_232E5B058();
    v0[5] = 0;
    v0[6] = 0xE000000000000000;
    sub_232E5AF08();
    v0[7] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
    sub_232E5B078();
    v0[8] = type metadata accessor for BetaEnrollmentViewController();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268754C50);
    sub_232E5AEE8();
    id v7 = objc_allocWithZone(MEMORY[0x263F38560]);
    uint64_t v8 = (void *)sub_232E5AEC8();
    uint64_t v9 = (void *)sub_232E5AEC8();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v7, sel_initWithSubsystem_category_, v8, v9);

    uint64_t v11 = (void *)sub_232E5AEC8();
    objc_msgSend(v10, sel_ulog_message_, 60, v11);
    swift_bridgeObjectRelease();

    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_232E5822C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_232E58368;
  }
  else {
    uint64_t v5 = sub_232E4F050;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_232E58368()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 120);
  sub_232E5B058();
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0xE000000000000000;
  sub_232E5AF08();
  *(void *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754950);
  sub_232E5B078();
  *(void *)(v0 + 64) = type metadata accessor for BetaEnrollmentViewController();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C50);
  sub_232E5AEE8();
  id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v3 = (void *)sub_232E5AEC8();
  uint64_t v4 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  uint64_t v6 = (void *)sub_232E5AEC8();
  objc_msgSend(v5, sel_ulog_message_, 60, v6);
  swift_bridgeObjectRelease();

  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

char *BetaEnrollmentViewController.__allocating_init(withHomeID:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return BetaEnrollmentViewController.init(withHomeID:)(a1);
}

char *BetaEnrollmentViewController.init(withHomeID:)(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v37 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = 0;
  uint64_t v40 = 0xE000000000000000;
  uint64_t v6 = v1;
  sub_232E5B058();
  swift_bridgeObjectRelease();
  uint64_t v39 = 0xD000000000000011;
  uint64_t v40 = 0x8000000232E5D970;
  uint64_t v7 = sub_232E5ACC8();
  sub_232E506A0(&qword_268754BF0, MEMORY[0x263F07508]);
  uint64_t v34 = a1;
  sub_232E5B0B8();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E42984(v39, v40, (uint64_t)ObjectType, (uint64_t)&off_26E69A0F0);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  uint64_t v36 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(&v6[OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID], a1, v7);
  *(void *)&v6[OBJC_IVAR____HPSUIBetaEnrollmentViewController_identifiers] = MEMORY[0x263F8EE88];

  v41.receiver = v6;
  v41.super_class = ObjectType;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v41, sel_init);
  id v10 = &v9[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  uint64_t v11 = *(void *)v10;
  uint64_t v12 = *((void *)v10 + 1);
  uint64_t v33 = *((void *)v10 + 5);
  long long v32 = *((_OWORD *)v10 + 4);
  *(_OWORD *)id v10 = xmmword_232E5C400;
  *((_OWORD *)v10 + 1) = xmmword_232E5C410;
  *((_OWORD *)v10 + 2) = xmmword_232E5C420;
  *((_OWORD *)v10 + 3) = xmmword_232E5C430;
  *((_OWORD *)v10 + 4) = xmmword_232E5CB40;
  *((void *)v10 + 10) = 0xEE00746E656D6C6CLL;
  uint64_t v13 = v9;
  sub_232E4CAC0(v11, v12);
  uint64_t v14 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  unint64_t v15 = (char *)objc_allocWithZone(v14);
  *(void *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  uint64_t v16 = swift_unknownObjectWeakInit();
  *(void *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(void *)&v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(void *)(v16 + 8) = &off_26E69A3C8;
  swift_unknownObjectWeakAssign();
  uint64_t v17 = &v15[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(void *)uint64_t v17 = 0xD00000000000002CLL;
  *((void *)v17 + 1) = 0x8000000232E5D3E0;
  id v18 = objc_allocWithZone(MEMORY[0x263F04DE8]);
  uint64_t v19 = v13;
  unint64_t v20 = v15;
  char v21 = (void *)sub_232E5AEC8();
  id v22 = objc_msgSend(v18, sel_initWithExtensionPointIdentifier_, v21);

  *(void *)&v20[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v22;
  v38.receiver = v20;
  v38.super_class = v14;
  id v23 = objc_msgSendSuper2(&v38, sel_init);

  int64_t v24 = *(void **)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(void *)&v19[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v23;

  uint64_t v25 = sub_232E5AF98();
  uint64_t v26 = (uint64_t)v37;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v37, 1, 1, v25);
  uint64_t v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_232E5AF78();
  swift_retain();
  uint64_t v28 = sub_232E5AF68();
  uint64_t v29 = (void *)swift_allocObject();
  uint64_t v30 = MEMORY[0x263F8F500];
  v29[2] = v28;
  v29[3] = v30;
  v29[4] = v27;
  swift_release();
  sub_232E4C410(v26, (uint64_t)&unk_268754EB8, (uint64_t)v29);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
  return v19;
}

uint64_t sub_232E58A58()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_232E58A94(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E49854;
  return sub_232E4EBDC(a1, v4, v5, v6);
}

char *BetaEnrollmentViewController.__allocating_init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return BetaEnrollmentViewController.init(withHomeID:homeKitIdentifiers:)(a1, a2);
}

char *BetaEnrollmentViewController.init(withHomeID:homeKitIdentifiers:)(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268754928);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v40 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = 0;
  uint64_t v43 = 0xE000000000000000;
  uint64_t v8 = v2;
  sub_232E5B058();
  swift_bridgeObjectRelease();
  uint64_t v42 = 0xD000000000000011;
  uint64_t v43 = 0x8000000232E5D970;
  uint64_t v9 = sub_232E5ACC8();
  id v10 = (void (*)(uint64_t))MEMORY[0x263F07508];
  sub_232E506A0(&qword_268754BF0, MEMORY[0x263F07508]);
  uint64_t v37 = a1;
  sub_232E5B0B8();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  sub_232E506A0((unint64_t *)&qword_268754A40, v10);
  swift_bridgeObjectRetain();
  sub_232E5B008();
  swift_bridgeObjectRelease();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E42984(v42, v43, (uint64_t)ObjectType, (uint64_t)&off_26E69A0F0);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  uint64_t v39 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(&v8[OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID], a1, v9);
  *(void *)&v8[OBJC_IVAR____HPSUIBetaEnrollmentViewController_identifiers] = a2;

  v44.receiver = v8;
  v44.super_class = ObjectType;
  uint64_t v12 = (char *)objc_msgSendSuper2(&v44, sel_init);
  uint64_t v13 = &v12[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics];
  swift_beginAccess();
  uint64_t v14 = *(void *)v13;
  uint64_t v15 = *((void *)v13 + 1);
  uint64_t v36 = *((void *)v13 + 5);
  long long v35 = *((_OWORD *)v13 + 4);
  *(_OWORD *)uint64_t v13 = xmmword_232E5C400;
  *((_OWORD *)v13 + 1) = xmmword_232E5C410;
  *((_OWORD *)v13 + 2) = xmmword_232E5C420;
  *((_OWORD *)v13 + 3) = xmmword_232E5C430;
  *((_OWORD *)v13 + 4) = xmmword_232E5CB40;
  *((void *)v13 + 10) = 0xEE00746E656D6C6CLL;
  uint64_t v16 = v12;
  sub_232E4CAC0(v14, v15);
  uint64_t v17 = (objc_class *)type metadata accessor for RemoteViewControllerClient();
  id v18 = (char *)objc_allocWithZone(v17);
  *(void *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_delegate + 8] = 0;
  uint64_t v19 = swift_unknownObjectWeakInit();
  *(void *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_hostingPreparationClock] = 0;
  *(void *)&v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_statusInfoViewCtrl] = 0;
  *(void *)(v19 + 8) = &off_26E69A3C8;
  swift_unknownObjectWeakAssign();
  unint64_t v20 = &v18[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_extensionID];
  *(void *)unint64_t v20 = 0xD00000000000002CLL;
  *((void *)v20 + 1) = 0x8000000232E5D3E0;
  id v21 = objc_allocWithZone(MEMORY[0x263F04DE8]);
  id v22 = v16;
  id v23 = v18;
  int64_t v24 = (void *)sub_232E5AEC8();
  id v25 = objc_msgSend(v21, sel_initWithExtensionPointIdentifier_, v24);

  *(void *)&v23[OBJC_IVAR____TtC22HomePlatformSettingsUI26RemoteViewControllerClient_query] = v25;
  v41.receiver = v23;
  v41.super_class = v17;
  id v26 = objc_msgSendSuper2(&v41, sel_init);

  uint64_t v27 = *(void **)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient];
  *(void *)&v22[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient] = v26;

  uint64_t v28 = sub_232E5AF98();
  uint64_t v29 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v40, 1, 1, v28);
  uint64_t v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_232E5AF78();
  swift_retain();
  uint64_t v31 = sub_232E5AF68();
  long long v32 = (void *)swift_allocObject();
  uint64_t v33 = MEMORY[0x263F8F500];
  v32[2] = v31;
  v32[3] = v33;
  v32[4] = v30;
  swift_release();
  sub_232E4C410(v29, (uint64_t)&unk_268754EC0, (uint64_t)v32);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
  return v22;
}

uint64_t sub_232E59178(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E44F2C;
  return sub_232E4EBDC(a1, v4, v5, v6);
}

char *sub_232E59314()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC];
  if (!v1)
  {
    sub_232E48FFC();
    swift_allocError();
    *uint64_t v7 = 2;
LABEL_6:
    swift_willThrow();
    return v0;
  }
  v9[0] = 0;
  uint64_t v2 = (char *)objc_msgSend(v1, sel_makeXPCConnectionWithError_, v9);
  id v3 = v9[0];
  if (!v2)
  {
    uint64_t v0 = (char *)v9[0];
    sub_232E5AC98();

    goto LABEL_6;
  }
  uint64_t v0 = v2;
  uint64_t v4 = self;
  id v5 = v3;
  id v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_26E6A6010);
  objc_msgSend(v0, sel_setRemoteObjectInterface_, v6);

  return v0;
}

Swift::Void __swiftcall BetaEnrollmentViewController.willMove(toParent:)(UIViewController_optional *toParent)
{
  uint64_t v2 = v1;
  sub_232E5B058();
  swift_bridgeObjectRelease();
  uint64_t v4 = toParent;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754EC8);
  sub_232E5AEE8();
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E552CC(0xD000000000000014, 0x8000000232E5D990);
  swift_bridgeObjectRelease();
  if (toParent)
  {
    id v5 = [(UIViewController_optional *)v4 view];
    if (v5)
    {
      id v6 = v5;
      id v7 = objc_msgSend(v2, sel_view);
      if (v7)
      {
        uint64_t v8 = v7;
        id v9 = objc_msgSend(v6, sel_backgroundColor);
        objc_msgSend(v8, sel_setBackgroundColor_, v9);
      }
      else
      {
        __break(1u);
      }
    }
  }
}

Swift::Void __swiftcall BetaEnrollmentViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v7, sel_viewWillAppear_, a1);
  id v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_navigationBar);

    id v6 = objc_msgSend(v5, sel_standardAppearance);
    objc_msgSend(v5, sel_setScrollEdgeAppearance_, v6);
  }
}

Swift::Void __swiftcall BetaEnrollmentViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_viewWillDisappear_, a1);
  id v3 = objc_msgSend(v1, sel_navigationController);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_navigationBar);

    objc_msgSend(v5, sel_setScrollEdgeAppearance_, 0);
  }
}

uint64_t sub_232E598F8()
{
  v1[3] = v0;
  v1[4] = swift_getObjectType();
  uint64_t v2 = sub_232E5ACC8();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  sub_232E5AF78();
  v1[8] = sub_232E5AF68();
  uint64_t v4 = sub_232E5AF58();
  v1[9] = v4;
  v1[10] = v3;
  return MEMORY[0x270FA2498](sub_232E599F8, v4, v3);
}

uint64_t sub_232E599F8()
{
  v0[2] = v0[4];
  uint64_t v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C50);
  sub_232E5AEE8();
  id v2 = objc_allocWithZone(MEMORY[0x263F38560]);
  uint64_t v3 = (void *)sub_232E5AEC8();
  uint64_t v4 = (void *)sub_232E5AEC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithSubsystem_category_, v3, v4);

  uint64_t v6 = (void *)sub_232E5AEC8();
  objc_msgSend(v5, sel_ulog_message_, 40, v6);

  uint64_t v7 = OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc;
  if (*(void *)(v1 + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_xpc))
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
  else
  {
    id v10 = (void *)v0[3];
    type metadata accessor for XPCConnectionManager();
    uint64_t v11 = swift_allocObject();
    v0[11] = v11;
    id v12 = v10;
    swift_defaultActor_initialize();
    *(void *)(v11 + 152) = 0;
    *(void *)(v11 + 160) = 0;
    *(void *)(v11 + 168) = 0;
    *(void *)(v11 + 112) = v12;
    *(void *)(v11 + 120) = &off_26E69A3B8;
    *(_OWORD *)(v11 + 128) = xmmword_232E5C450;
    *(unsigned char *)(v11 + 144) = 2;
    *(void *)(v1 + v7) = v11;
    swift_retain();
    swift_release();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[12] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_232E59C44;
    return sub_232E44174();
  }
}

uint64_t sub_232E59C44()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 72);
  if (v0) {
    id v5 = sub_232E4DCE8;
  }
  else {
    id v5 = sub_232E59D80;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_232E59D80()
{
  uint64_t v1 = v0[3];
  (*(void (**)(void, uint64_t, void))(v0[6] + 16))(v0[7], v1 + OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID, v0[5]);
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____HPSUIBetaEnrollmentViewController_identifiers);
  v0[14] = v2;
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[15] = v3;
  void *v3 = v0;
  v3[1] = sub_232E4DAB4;
  uint64_t v4 = v0[7];
  return sub_232E526F8(v4, v2);
}

uint64_t sub_232E59E98()
{
  uint64_t v1 = v0 + OBJC_IVAR____HPSUIBetaEnrollmentViewController_homeID;
  uint64_t v2 = sub_232E5ACC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

id BetaEnrollmentViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_232E59FCC()
{
  return sub_232E59314();
}

uint64_t static BetaEnrollmentViewController.shouldShowBetaEnrollmentButton(forHomeID:homeKitIdentifiers:withCompletion:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void), uint64_t a4)
{
  return _s22HomePlatformSettingsUI28BetaEnrollmentViewControllerC010shouldShoweF6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(a1, a3, a4);
}

uint64_t sub_232E5A128(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a2;
  uint64_t v7 = sub_232E5AE68();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_232E5AE88();
  uint64_t v11 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t aBlock = 0;
  uint64_t v23 = 0xE000000000000000;
  sub_232E5B058();
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0xD00000000000002CLL;
  uint64_t v23 = 0x8000000232E5DA90;
  sub_232E5AF08();
  swift_bridgeObjectRelease();
  sub_232E42984(aBlock, v23, a4, (uint64_t)&off_26E69A0F0);
  swift_bridgeObjectRelease();
  sub_232E5A9C8(0, (unint64_t *)&qword_268754C60);
  uint64_t v14 = (void *)sub_232E5B018();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v19;
  *(void *)(v15 + 24) = a3;
  *(unsigned char *)(v15 + 32) = a1;
  id v26 = sub_232E50654;
  uint64_t v27 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v23 = 1107296256;
  int64_t v24 = sub_232E44AB0;
  id v25 = &block_descriptor_6;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  sub_232E5AE78();
  uint64_t v21 = MEMORY[0x263F8EE78];
  sub_232E506A0(&qword_268754C68, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268754C70);
  sub_232E506E8();
  sub_232E5B048();
  MEMORY[0x237DB4310](0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v20);
  return swift_release();
}

uint64_t _s22HomePlatformSettingsUI28BetaEnrollmentViewControllerC010shouldShoweF6Button03forA2ID14withCompletiony10Foundation4UUIDV_ySb_So7NSErrorCSgtYbctFZ_0(uint64_t a1, uint64_t (*a2)(void, void), uint64_t a3)
{
  id v10 = &type metadata for Feature;
  unint64_t v11 = sub_232E5A930();
  char v6 = sub_232E5ACD8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  if (v6)
  {
    sub_232E5A9C8(0, (unint64_t *)&unk_268754F10);
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = a2;
    v7[3] = a3;
    v7[4] = v3;
    swift_retain();
    sub_232E51914((uint64_t)sub_232E5A9BC, (uint64_t)v7);
    return swift_release();
  }
  else
  {
    sub_232E42984(0xD000000000000039, 0x8000000232E5DA50, v3, (uint64_t)&off_26E69A0F0);
    return a2(0, 0);
  }
}

uint64_t sub_232E5A6D8()
{
  return type metadata accessor for BetaEnrollmentViewController();
}

uint64_t type metadata accessor for BetaEnrollmentViewController()
{
  uint64_t result = qword_268754ED0;
  if (!qword_268754ED0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t method lookup function for BetaEnrollmentViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BetaEnrollmentViewController);
}

uint64_t dispatch thunk of BetaEnrollmentViewController.__allocating_init(withHomeID:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of BetaEnrollmentViewController.__allocating_init(withHomeID:homeKitIdentifiers:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t sub_232E5A76C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_232E5A7A4(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(v2 + 16) + 16))(*(void *)(v2 + 16), a1 & 1, a2);
}

uint64_t sub_232E5A7C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E49854;
  return sub_232E57EF4(a1, v4, v5, v6);
}

uint64_t sub_232E5A87C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_232E49854;
  return sub_232E578A0(a1, v4, v5, v6);
}

unint64_t sub_232E5A930()
{
  unint64_t result = qword_268754F08;
  if (!qword_268754F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268754F08);
  }
  return result;
}

uint64_t sub_232E5A984()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E5A9BC(char a1)
{
  return sub_232E5A128(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_232E5A9C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_232E5AA04()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 33, 7);
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

void destroy for LocalizedString(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for LocalizedString(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for LocalizedString(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  id v6 = v5;

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

uint64_t assignWithTake for LocalizedString(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for LocalizedString(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocalizedString(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LocalizedString()
{
  return &type metadata for LocalizedString;
}

uint64_t sub_232E5AC88()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_232E5AC98()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_232E5ACA8()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_232E5ACB8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_232E5ACC8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_232E5ACD8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_232E5ACE8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_232E5ACF8()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_232E5AD08()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_232E5AD18()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_232E5AD28()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_232E5AD38()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_232E5AD48()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_232E5AD58()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_232E5AD68()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_232E5AD78()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_232E5AD88()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_232E5AD98()
{
  return MEMORY[0x270F016B0]();
}

uint64_t sub_232E5ADA8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_232E5ADB8()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_232E5ADC8()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_232E5ADD8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_232E5ADE8()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_232E5ADF8()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_232E5AE08()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_232E5AE18()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_232E5AE28()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_232E5AE38()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_232E5AE48()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_232E5AE58()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_232E5AE68()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_232E5AE78()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_232E5AE88()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_232E5AE98()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_232E5AEA8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_232E5AEB8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_232E5AEC8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_232E5AED8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_232E5AEE8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_232E5AEF8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_232E5AF08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_232E5AF18()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_232E5AF28()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_232E5AF38()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_232E5AF48()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_232E5AF58()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_232E5AF68()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_232E5AF78()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_232E5AF88()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_232E5AF98()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_232E5AFA8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_232E5AFC8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_232E5AFD8()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_232E5AFE8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_232E5AFF8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_232E5B008()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_232E5B018()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_232E5B028()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_232E5B038()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_232E5B048()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_232E5B058()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_232E5B068()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_232E5B078()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_232E5B088()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_232E5B098()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_232E5B0A8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_232E5B0B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_232E5B0C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_232E5B0D8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_232E5B0E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_232E5B0F8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_232E5B108()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_232E5B118()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_232E5B128()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_232E5B138()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_232E5B148()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_232E5B158()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_232E5B168()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x270F24828]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_storeStrong(id *location, id obj)
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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