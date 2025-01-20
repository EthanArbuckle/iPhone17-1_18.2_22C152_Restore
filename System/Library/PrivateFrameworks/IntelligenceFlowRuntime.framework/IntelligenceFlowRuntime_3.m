uint64_t sub_253DA271C()
{
  return sub_253DF3DA0();
}

void sub_253DA2748()
{
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCO23IntelligenceFlowRuntime29SessionCoordinatorConversions17ConversionContext_statementIdIsInert) = 1;
}

void sub_253DA275C()
{
  *(unsigned char *)(v0
           + OBJC_IVAR____TtCO23IntelligenceFlowRuntime29SessionCoordinatorConversions17ConversionContext_statementIdIsInert) = 0;
}

uint64_t sub_253DA276C()
{
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtCO23IntelligenceFlowRuntime29SessionCoordinatorConversions17ConversionContext_statementIdIsInert) & 1) != 0)
  {
    return sub_253DEFFC0();
  }
  else
  {
    sub_253DF3DC0();
    sub_253DF3FC0();
    return swift_release();
  }
}

uint64_t sub_253DA27F8()
{
  sub_253DF3DE0();
  sub_253BDF7F0();
  sub_253BEFBCC();
  v1();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_253DA288C()
{
  return type metadata accessor for SessionCoordinatorConversions.ConversionContext();
}

uint64_t type metadata accessor for SessionCoordinatorConversions.ConversionContext()
{
  uint64_t result = qword_26B255D58;
  if (!qword_26B255D58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_253DA28DC()
{
  uint64_t result = sub_253DF3DE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_253DA2974()
{
  return sub_253DA271C();
}

uint64_t sub_253DA2998()
{
  return sub_253DA276C();
}

void sub_253DA29BC()
{
}

void sub_253DA29E0()
{
}

uint64_t sub_253DA2A04(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = a2;
  uint64_t v55 = sub_253DF3DE0();
  uint64_t v3 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  v54 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_253DF38A0();
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_253BDEDD8(&qword_269D7E830);
  uint64_t v8 = MEMORY[0x270FA5388](v52);
  v51 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v50 = (void *)((char *)v37 - v11);
  MEMORY[0x270FA5388](v10);
  v48 = (char *)v37 - v12;
  uint64_t v59 = MEMORY[0x263F8EE78];
  sub_253DC7900(0, 0, 0);
  uint64_t v13 = v59;
  uint64_t v14 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v49 = v14;
  v37[0] = a1;
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v46 = sub_253DF0330();
    uint64_t v16 = *(void *)(v46 - 8);
    v17 = *(void (**)(void))(v16 + 16);
    uint64_t v44 = v16 + 16;
    v45 = v17;
    uint64_t v18 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
    uint64_t v19 = *(void *)(v16 + 72);
    v42 = (void (**)(char *, char *, uint64_t))(v16 + 32);
    uint64_t v43 = v19;
    v40 = (void (**)(char *, uint64_t))(v3 + 8);
    v41 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v38 = v7;
    uint64_t v39 = v5 + 32;
    uint64_t v47 = v5;
    v21 = (void (*)(char *))v17;
    uint64_t v20 = v46;
    v22 = v48;
    do
    {
      v24 = v51;
      uint64_t v23 = v52;
      v25 = &v51[*(int *)(v52 + 48)];
      uint64_t v57 = v18;
      v21(v25);
      uint64_t v26 = (uint64_t)v50;
      v27 = (char *)v50 + *(int *)(v23 + 48);
      uint64_t v58 = v15;
      void *v50 = v15;
      (*v42)(v27, v25, v20);
      sub_253C61B78(v26, (uint64_t)v22, &qword_269D7E830);
      uint64_t v28 = *(int *)(v23 + 48);
      void *v24 = *v22;
      ((void (*)(char *, char *, uint64_t))v21)((char *)v24 + v28, (char *)v22 + v28, v20);
      v29 = v54;
      uint64_t v30 = v55;
      (*v41)(v54, v56, v55);
      sub_253DF3DC0();
      (*v40)(v29, v30);
      sub_253DF3FD0();
      swift_release();
      v31 = v38;
      sub_253DF38B0();
      sub_253BEFAC0((uint64_t)v22, &qword_269D7E830);
      uint64_t v13 = v59;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DC7900(0, *(void *)(v13 + 16) + 1, 1);
        uint64_t v13 = v59;
      }
      unint64_t v33 = *(void *)(v13 + 16);
      unint64_t v32 = *(void *)(v13 + 24);
      uint64_t v34 = v47;
      if (v33 >= v32 >> 1)
      {
        sub_253DC7900(v32 > 1, v33 + 1, 1);
        uint64_t v13 = v59;
      }
      uint64_t v35 = v58 + 1;
      *(void *)(v13 + 16) = v33 + 1;
      uint64_t v15 = v35;
      (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v13+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(void *)(v34 + 72) * v33, v31, v53);
      uint64_t v59 = v13;
      uint64_t v18 = v57 + v43;
    }
    while (v49 != v15);
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_253DA2E84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_253BDEDD8(&qword_26B255F38);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_253DF4230();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(*(void *)v1 + 16))
  {
    sub_253DA32E4((uint64_t)v5);
    if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v5, 1, v6) == 1)
    {
      sub_253BEFAC0((uint64_t)v5, &qword_26B255F38);
      sub_253DA3208(*(void *)(*(void *)v1 + 16) - 1, a1);
    }
    else
    {
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v11(v9, v5, v6);
      v11((char *)a1, v9, v6);
    }
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(a1, 0, 1, v6);
  }
  else
  {
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(a1, 1, 1, v6);
  }
}

uint64_t sub_253DA304C()
{
  uint64_t v0 = sub_253DEFE90();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v10 - v5;
  sub_253DF4180();
  sub_253DF0480();
  char v7 = sub_253DEFE60();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

uint64_t sub_253DA3180(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253BDEDD8(&qword_26B255378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_253DA31E8()
{
  return sub_253DA304C() & 1;
}

void sub_253DA3208(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_253DB43EC(v5);
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = sub_253DF4230();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(void *)(v8 + 72);
    unint64_t v10 = v5 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)) + v9 * a1;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 32))(a2, v10, v7);
    sub_253DC5860(v10 + v9, v6 - 1 - a1);
    *(void *)(v5 + 16) = v6 - 1;
    *uint64_t v2 = v5;
  }
}

uint64_t sub_253DA32E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = sub_253DB43EC(v3);
    uint64_t v3 = result;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    uint64_t v7 = sub_253DF4230();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, v3+ ((*(unsigned __int8 *)(*(void *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80))+ *(void *)(*(void *)(v7 - 8) + 72) * v6, v7);
    *(void *)(v3 + 16) = v6;
    *uint64_t v1 = v3;
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(a1, 0, 1, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_253DA33C0(unint64_t *a1, uint64_t *a2)
{
  return sub_253D733C0(*a1, *a2);
}

unint64_t sub_253DA33F8(unint64_t *a1)
{
  return sub_253DA33C0(a1, *(uint64_t **)(v1 + 16));
}

unint64_t sub_253DA3418()
{
  unint64_t result = qword_269D7E820;
  if (!qword_269D7E820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7E820);
  }
  return result;
}

uint64_t sub_253DA3464(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for ClientMessageError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x253DA3578);
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

ValueMetadata *type metadata accessor for ClientMessageError()
{
  return &type metadata for ClientMessageError;
}

unint64_t sub_253DA35B4()
{
  unint64_t result = qword_269D7E838[0];
  if (!qword_269D7E838[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269D7E838);
  }
  return result;
}

uint64_t sub_253DA3600()
{
  uint64_t v2 = *(void *)(*(void *)v0 + 16);
  return sub_253DB2E50(v2);
}

unint64_t sub_253DA361C()
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 16) = v0 + 1;
  return v3
       + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
       + *(void *)(v2 + 72) * v0;
}

uint64_t sub_253DA3658()
{
  return v0;
}

uint64_t sub_253DA3680()
{
  return *(void *)(v0 - 208);
}

uint64_t sub_253DA3698()
{
  return v0;
}

void sub_253DA36A8(int a1@<W8>)
{
  *(_DWORD *)(v5 - 416) = a1;
  uint64_t v6 = *(void *)(v5 - 280);
  *(void *)(v5 - 424) = v6 + 104;
  *(void *)(v5 - 432) = v6 + 32;
  *(void *)(v5 - 440) = v3 + 8;
  *(void *)(v5 - 448) = v4 + 8;
  *(void *)(v5 - 456) = v1 + 8;
  *(void *)(v5 - 464) = v2 + 8;
}

unint64_t sub_253DA3704@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 16) = a1;
  return v4
       + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
       + *(void *)(v3 + 72) * v1;
}

uint64_t sub_253DA372C()
{
  return sub_253DB2DAC();
}

unint64_t sub_253DA3744()
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 16) = v0 + 1;
  return v3
       + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
       + *(void *)(v2 + 72) * v0;
}

unint64_t sub_253DA3780()
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 16) = v0 + 1;
  return v3
       + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
       + *(void *)(v2 + 72) * v0;
}

uint64_t sub_253DA37BC()
{
  return v0;
}

uint64_t sub_253DA37D4(uint64_t result)
{
  *(void *)(v1 - 256) = result;
  return result;
}

unint64_t sub_253DA3824()
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 16) = v0 + 1;
  return v3
       + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
       + *(void *)(v2 + 72) * v0;
}

uint64_t sub_253DA3860(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  *(void *)(v1 - 128) = *(void *)(v1 - 520);
  return swift_retain();
}

void sub_253DA3880(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(void *)(v2 - 408) = *(void *)(v2 - 440) + 16;
}

uint64_t sub_253DA38A8()
{
  return v0;
}

uint64_t sub_253DA38C4()
{
  return v0;
}

uint64_t sub_253DA38D0(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t sub_253DA38FC()
{
  return *(void *)(v0 - 256);
}

uint64_t sub_253DA390C()
{
  return v0;
}

uint64_t sub_253DA3934()
{
  return *(void *)(v0 - 256);
}

uint64_t sub_253DA3940()
{
  return *(void *)(v0 - 256);
}

uint64_t sub_253DA3968()
{
  return *(void *)(v0 - 256);
}

void sub_253DA39FC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_253DA3A10()
{
  return *(void *)(v0 - 256);
}

uint64_t sub_253DA3A1C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a2 - 256);
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v3, 1, 1, a1);
}

uint64_t sub_253DA3A3C()
{
  return v0;
}

uint64_t sub_253DA3A50()
{
  return v0;
}

void *sub_253DA3A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v16 = OBJC_IVAR____TtC23IntelligenceFlowRuntime34SessionCoordinatorInjectionContext_encoder;
  sub_253DEFC50();
  swift_allocObject();
  *(void *)((char *)v7 + v16) = sub_253DEFC40();
  uint64_t v17 = OBJC_IVAR____TtC23IntelligenceFlowRuntime34SessionCoordinatorInjectionContext_decoder;
  sub_253DEFC20();
  swift_allocObject();
  *(void *)((char *)v7 + v17) = sub_253DEFC10();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = a5;
  uint64_t v18 = (char *)v7 + OBJC_IVAR____TtC23IntelligenceFlowRuntime34SessionCoordinatorInjectionContext_commandContinuation;
  uint64_t v19 = sub_253BDEDD8(&qword_26B2560C8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18, a6, v19);
  *(void *)((char *)v8
            + OBJC_IVAR____TtC23IntelligenceFlowRuntime34SessionCoordinatorInjectionContext_fastCheckInjectionEnabledState) = a7;
  return v8;
}

uint64_t sub_253DA3B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 144) = v22;
  *(void *)(v6 + 152) = v5;
  *(_OWORD *)(v6 + 112) = v20;
  *(_OWORD *)(v6 + 128) = v21;
  *(void *)(v6 + 96) = v18;
  *(void *)(v6 + 104) = v19;
  *(void *)(v6 + 80) = v16;
  *(void *)(v6 + 88) = v17;
  *(void *)(v6 + 64) = a4;
  *(void *)(v6 + 72) = a5;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 56) = a3;
  *(void *)(v6 + 40) = a1;
  uint64_t v7 = sub_253DF24A0();
  *(void *)(v6 + 160) = v7;
  sub_253BDF7B0(v7);
  *(void *)(v6 + 168) = v8;
  *(void *)(v6 + 176) = sub_253BDF868();
  *(void *)(v6 + 184) = *(void *)(v19 - 8);
  *(void *)(v6 + 192) = sub_253BDF868();
  uint64_t v9 = sub_253DEFE90();
  *(void *)(v6 + 200) = v9;
  sub_253BDF7B0(v9);
  *(void *)(v6 + 208) = v10;
  *(void *)(v6 + 216) = sub_253BDF868();
  if (v16)
  {
    swift_getObjectType();
    uint64_t v11 = sub_253DF5480();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  *(void *)(v6 + 224) = v11;
  *(void *)(v6 + 232) = v13;
  return MEMORY[0x270FA2498](sub_253DA3CEC, v11, v13);
}

uint64_t sub_253DA3CEC()
{
  uint64_t v22 = v2;
  sub_253DA61F4(*(void *)(v2 + 152));
  sub_253DA6108(v1, v21);
  os_unfair_lock_unlock(v0);
  if ((v21[0] & 1) == 0)
  {
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(*(void *)(v2 + 40), 1, 1, *(void *)(v2 + 104));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253BDF8DC();
    sub_253C101D8();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v3 = sub_253DEFC30();
  *(void *)(v2 + 240) = 0;
  *(void *)(v2 + 248) = v3;
  *(void *)(v2 + 256) = v4;
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  uint64_t v7 = *(void *)(v2 + 216);
  uint64_t v8 = *(void *)(v2 + 152);
  uint64_t v9 = *(void *)(v2 + 72);
  uint64_t v10 = *(void *)(v2 + 48);
  long long v19 = *(_OWORD *)(v2 + 104);
  long long v20 = *(_OWORD *)(v2 + 56);
  long long v17 = *(_OWORD *)(v2 + 136);
  long long v18 = *(_OWORD *)(v2 + 120);
  sub_253DEFE80();
  uint64_t v11 = swift_task_alloc();
  *(void *)(v2 + 264) = v11;
  *(_OWORD *)(v11 + 16) = v19;
  *(_OWORD *)(v11 + 32) = v18;
  *(_OWORD *)(v11 + 48) = v17;
  *(void *)(v11 + 64) = v8;
  *(void *)(v11 + 72) = v10;
  *(_OWORD *)(v11 + 80) = v20;
  *(void *)(v11 + 96) = v9;
  *(void *)(v11 + 104) = v7;
  *(void *)(v11 + 112) = v5;
  *(void *)(v11 + 120) = v6;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 272) = v12;
  sub_253BDEDD8(&qword_26B2552A8);
  *uint64_t v12 = v2;
  v12[1] = sub_253DA4004;
  sub_253C101D8();
  return MEMORY[0x270FA2318]();
}

uint64_t sub_253DA4004()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 232);
  uint64_t v3 = *(void *)(v1 + 224);
  return MEMORY[0x270FA2498](sub_253DA4148, v3, v2);
}

uint64_t sub_253DA4148()
{
  if (v0[3] >> 60 == 15)
  {
    uint64_t v2 = v0[26];
    uint64_t v1 = v0[27];
    uint64_t v3 = v0[25];
    uint64_t v4 = v0[13];
    uint64_t v5 = v0[5];
    sub_253D75D88(v0[31], v0[32]);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    uint64_t v6 = v5;
    uint64_t v7 = 1;
    uint64_t v8 = 1;
    uint64_t v9 = v4;
  }
  else
  {
    uint64_t v10 = (void *)v0[30];
    sub_253D75DE0(v0[2], v0[3]);
    sub_253DEFC00();
    uint64_t v11 = v0[31];
    unint64_t v12 = v0[32];
    uint64_t v13 = v0[26];
    if (v10)
    {
      sub_253D75D88(v11, v12);
      uint64_t v14 = sub_253DA6124();
      v15(v14);
      sub_253DF17A0();
      id v16 = v10;
      id v17 = v10;
      long long v18 = (void *)sub_253DF2490();
      os_log_type_t v19 = sub_253DF56F0();
      if (sub_253BDF95C(v19))
      {
        sub_253DA61C4();
        long long v20 = (void *)sub_253DA61A8();
        sub_253BDF9DC(5.7779e-34);
        uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
        sub_253DA6180(v21);
        *long long v20 = v13;

        sub_253BDF9BC(&dword_253BD8000, v22, v23, "Failed to inject value: %@");
        sub_253BDEDD8(&qword_26B2519F0);
        sub_253BDF988();
        sub_253BDF910();
        sub_253BDF910();
      }
      else
      {
      }
      uint64_t v30 = sub_253DA6160();
      v31(v30);
      uint64_t v6 = sub_253DA61E0();
    }
    else
    {
      uint64_t v25 = v0[23];
      uint64_t v24 = v0[24];
      uint64_t v26 = v0[13];
      uint64_t v27 = v0[5];
      sub_253D75D88(v11, v12);
      uint64_t v28 = sub_253DA6124();
      v29(v28);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v27, v24, v26);
      uint64_t v6 = v27;
      uint64_t v7 = 0;
      uint64_t v8 = 1;
      uint64_t v9 = v26;
    }
  }
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v6, v7, v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v32();
}

uint64_t sub_253DA43BC(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10)
{
  uint64_t v70 = a8;
  uint64_t v71 = a6;
  uint64_t v68 = a5;
  uint64_t v72 = a4;
  uint64_t v65 = a3;
  uint64_t v61 = a1;
  uint64_t v57 = a10;
  uint64_t v12 = sub_253DEFE90();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for SessionCoordinatorCommand(0);
  MEMORY[0x270FA5388](v64);
  id v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_253BDEDD8(&qword_26B2560C8);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_253BDEDD8(&qword_26B256088);
  uint64_t v60 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v58 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = v19;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  uint64_t v69 = v18;
  v23(v21, &a2[OBJC_IVAR____TtC23IntelligenceFlowRuntime34SessionCoordinatorInjectionContext_commandContinuation], v18);
  uint64_t v24 = *((void *)a2 + 2);
  uint64_t v25 = *((void *)a2 + 4);
  uint64_t v55 = *((void *)a2 + 3);
  uint64_t v56 = v24;
  uint64_t v26 = *((void *)a2 + 6);
  uint64_t v54 = *((void *)a2 + 5);
  uint64_t v63 = v13;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v59 = v15;
  uint64_t v66 = v12;
  v27(v15, a7, v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_253DF5A50();
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v53 = v28;
  }
  else
  {
    uint64_t v53 = sub_253DF5E90();
    uint64_t v30 = v31;
  }
  uint64_t v32 = sub_253DF5A50();
  if (!v33) {
    uint64_t v32 = sub_253DF5E90();
  }
  uint64_t v34 = v32;
  uint64_t v35 = v33;
  v36 = (int *)type metadata accessor for SessionCoordinatorInjectionRequest(0);
  v37 = &v17[v36[13]];
  uint64_t v38 = sub_253BDEDD8(&qword_26B256070);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16))(v37, v61, v38);
  uint64_t v39 = v55;
  *(void *)id v17 = v56;
  *((void *)v17 + 1) = v39;
  uint64_t v40 = v54;
  *((void *)v17 + 2) = v25;
  *((void *)v17 + 3) = v40;
  uint64_t v42 = v65;
  uint64_t v41 = v66;
  *((void *)v17 + 4) = v26;
  *((void *)v17 + 5) = v42;
  uint64_t v43 = v71;
  uint64_t v44 = v68;
  *((void *)v17 + 6) = v72;
  *((void *)v17 + 7) = v44;
  *((void *)v17 + 8) = v43;
  (*(void (**)(char *, char *, uint64_t))(v63 + 32))(&v17[v36[9]], v59, v41);
  v45 = (uint64_t *)&v17[v36[10]];
  uint64_t *v45 = v53;
  v45[1] = v30;
  uint64_t v46 = (uint64_t *)&v17[v36[11]];
  uint64_t v47 = v70;
  *uint64_t v46 = v70;
  v46[1] = a9;
  v48 = (uint64_t *)&v17[v36[12]];
  uint64_t *v48 = v34;
  v48[1] = v35;
  swift_storeEnumTagMultiPayload();
  sub_253D75DE0(v47, a9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v49 = v58;
  uint64_t v50 = v69;
  sub_253DF5540();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v21, v50);
  return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v49, v62);
}

uint64_t sub_253DA4808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 72) = v23;
  *(void *)(v9 + 80) = v8;
  *(_OWORD *)(v9 + 56) = v22;
  *(void *)(v9 + 40) = a3;
  *(void *)(v9 + 48) = a4;
  *(void *)(v9 + 24) = a1;
  *(void *)(v9 + 32) = a2;
  uint64_t v11 = sub_253DF24A0();
  *(void *)(v9 + 88) = v11;
  sub_253BDF7B0(v11);
  *(void *)(v9 + 96) = v12;
  *(void *)(v9 + 104) = sub_253BDF868();
  *(void *)(v9 + 112) = type metadata accessor for SessionCoordinatorCommand(0);
  *(void *)(v9 + 120) = sub_253BDF868();
  uint64_t v13 = sub_253BDEDD8(&qword_26B2560C8);
  *(void *)(v9 + 128) = v13;
  sub_253BDF7B0(v13);
  *(void *)(v9 + 136) = v14;
  *(void *)(v9 + 144) = sub_253BDF868();
  uint64_t v15 = sub_253BDEDD8(&qword_26B256088);
  *(void *)(v9 + 152) = v15;
  sub_253BDF7B0(v15);
  *(void *)(v9 + 160) = v16;
  *(void *)(v9 + 168) = sub_253BDF868();
  if (a8)
  {
    swift_getObjectType();
    uint64_t v17 = sub_253DF5480();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  return MEMORY[0x270FA2498](sub_253DA497C, v17, v19);
}

uint64_t sub_253DA497C()
{
  uint64_t v35 = v2;
  sub_253DA61F4(v2[10]);
  sub_253D95F58(v1, v34);
  os_unfair_lock_unlock(v0);
  if (v34[0])
  {
    uint64_t v3 = sub_253DEFC30();
    uint64_t v5 = v4;
    uint64_t v6 = v3;
    uint64_t v7 = (void *)v2[10];
    (*(void (**)(void, uint64_t, void))(v2[17] + 16))(v2[18], (uint64_t)v7 + OBJC_IVAR____TtC23IntelligenceFlowRuntime34SessionCoordinatorInjectionContext_commandContinuation, v2[16]);
    uint64_t v8 = v7[2];
    uint64_t v9 = v7[3];
    uint64_t v10 = v7[5];
    uint64_t v11 = v7[6];
    uint64_t v12 = v7[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_253DF5A50();
    if (!v14) {
      uint64_t v13 = sub_253DF5E90();
    }
    uint64_t v15 = v6;
    uint64_t v16 = v5;
    uint64_t v17 = v12;
    uint64_t v18 = v8;
    uint64_t v19 = v9;
    uint64_t v20 = v10;
    uint64_t v21 = v2[20];
    uint64_t v22 = v2[21];
    uint64_t v23 = v2[18];
    uint64_t v33 = v2[19];
    uint64_t v25 = v2[16];
    uint64_t v24 = v2[17];
    uint64_t v26 = (void *)v2[15];
    uint64_t v27 = v2[5];
    uint64_t v28 = v2[6];
    uint64_t v29 = v2[3];
    uint64_t v30 = v2[4];
    *uint64_t v26 = v18;
    v26[1] = v19;
    v26[2] = v17;
    v26[3] = v20;
    v26[4] = v11;
    v26[5] = v29;
    v26[6] = v30;
    v26[7] = v27;
    v26[8] = v28;
    v26[9] = v13;
    v26[10] = v14;
    v26[11] = v15;
    v26[12] = v16;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_253DF5540();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v33);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v31();
}

uint64_t sub_253DA4CAC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligenceFlowRuntime34SessionCoordinatorInjectionContext_commandContinuation;
  uint64_t v2 = sub_253BDEDD8(&qword_26B2560C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_253DA4D54()
{
  sub_253DA4CAC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_253DA4DAC()
{
  return type metadata accessor for SessionCoordinatorInjectionContext(0);
}

uint64_t type metadata accessor for SessionCoordinatorInjectionContext(uint64_t a1)
{
  return sub_253C15D30(a1, (uint64_t *)&unk_26B255DE8);
}

void sub_253DA4DD4()
{
  sub_253DA4E90();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_253DA4E90()
{
  if (!qword_26B2560D0)
  {
    type metadata accessor for SessionCoordinatorCommand(255);
    unint64_t v0 = sub_253DF5560();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2560D0);
    }
  }
}

uint64_t *sub_253DA4EE8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    uint64_t v8 = a2[5];
    a1[4] = a2[4];
    a1[5] = v8;
    uint64_t v9 = a2[7];
    a1[6] = a2[6];
    a1[7] = v9;
    uint64_t v10 = a3[9];
    uint64_t v31 = (char *)a2 + v10;
    uint64_t v32 = (char *)a1 + v10;
    a1[8] = a2[8];
    uint64_t v11 = sub_253DEFE90();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v32, v31, v11);
    uint64_t v13 = a3[10];
    uint64_t v14 = a3[11];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (uint64_t *)((char *)v4 + v14);
    uint64_t v19 = *(uint64_t *)((char *)a2 + v14);
    unint64_t v20 = *(uint64_t *)((char *)a2 + v14 + 8);
    swift_bridgeObjectRetain();
    sub_253D75DE0(v19, v20);
    *uint64_t v18 = v19;
    v18[1] = v20;
    uint64_t v21 = a3[12];
    uint64_t v22 = a3[13];
    uint64_t v23 = (uint64_t *)((char *)v4 + v21);
    uint64_t v24 = (uint64_t *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = (char *)v4 + v22;
    uint64_t v27 = (char *)a2 + v22;
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_253BDEDD8(&qword_26B256070);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  return v4;
}

uint64_t sub_253DA50B4(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[9];
  uint64_t v5 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  sub_253D75D88(*(void *)(a1 + a2[11]), *(void *)(a1 + a2[11] + 8));
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[13];
  uint64_t v7 = sub_253BDEDD8(&qword_26B256070);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t sub_253DA51C0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = a3[9];
  uint64_t v29 = a2 + v9;
  uint64_t v30 = a1 + v9;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v10 = sub_253DEFE90();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v30, v29, v10);
  uint64_t v12 = a3[10];
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (uint64_t *)(a1 + v13);
  uint64_t v18 = *(void *)(a2 + v13);
  unint64_t v19 = *(void *)(a2 + v13 + 8);
  swift_bridgeObjectRetain();
  sub_253D75DE0(v18, v19);
  *uint64_t v17 = v18;
  v17[1] = v19;
  uint64_t v20 = a3[12];
  uint64_t v21 = a3[13];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a1 + v21;
  uint64_t v26 = a2 + v21;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_253BDEDD8(&qword_26B256070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  return a1;
}

void *sub_253DA533C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[9];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253DEFE90();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[10];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = *v15;
  unint64_t v17 = v15[1];
  sub_253D75DE0(*v15, v17);
  uint64_t v18 = *v14;
  unint64_t v19 = v14[1];
  *uint64_t v14 = v16;
  v14[1] = v17;
  sub_253D75D88(v18, v19);
  uint64_t v20 = a3[12];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[13];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_253BDEDD8(&qword_26B256070);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  return a1;
}

uint64_t sub_253DA5514(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v6 = a3[9];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  uint64_t v11 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_253BDEDD8(&qword_26B256070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t sub_253DA5628(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[9];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[10];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[11];
  uint64_t v19 = *(void *)(a1 + v18);
  unint64_t v20 = *(void *)(a1 + v18 + 8);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  sub_253D75D88(v19, v20);
  uint64_t v21 = a3[12];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  void *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[13];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  uint64_t v29 = sub_253BDEDD8(&qword_26B256070);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 40))(v27, v28, v29);
  return a1;
}

uint64_t sub_253DA5790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253DA57A4);
}

uint64_t sub_253DA57A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_253DEFE90();
    sub_253C16A18();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 36);
    }
    else
    {
      uint64_t v10 = sub_253BDEDD8(&qword_26B256070);
      uint64_t v11 = *(int *)(a3 + 52);
    }
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(a1 + v11, a2, v10);
  }
}

uint64_t sub_253DA5854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253DA5868);
}

uint64_t sub_253DA5868(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    sub_253DEFE90();
    sub_253C16A18();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 36);
    }
    else
    {
      uint64_t v10 = sub_253BDEDD8(&qword_26B256070);
      uint64_t v11 = *(int *)(a4 + 52);
    }
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for SessionCoordinatorInjectionRequest(uint64_t a1)
{
  return sub_253C15D30(a1, (uint64_t *)&unk_26B255DF8);
}

void sub_253DA5934()
{
  sub_253DEFE90();
  if (v0 <= 0x3F)
  {
    sub_253DA5A30();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_253DA5A30()
{
  if (!qword_26B256078)
  {
    sub_253C0BFF8(&qword_26B2552A8);
    unint64_t v0 = sub_253DF54A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B256078);
    }
  }
}

uint64_t sub_253DA5A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_253DA6120;
  return sub_253DA3B78(a1, a2, a3, a4, a5);
}

uint64_t sub_253DA5BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_253DA5C98;
  return sub_253DA4808(a1, a2, a3, a4, v14, v15, v16, a8);
}

uint64_t sub_253DA5C98()
{
  swift_task_dealloc();
  sub_253BDF8DC();
  return v0();
}

uint64_t sub_253DA5D88(uint64_t a1)
{
  return sub_253DA43BC(a1, *(char **)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120), *(void *)(v1 + 16));
}

uint64_t destroy for SessionCoordinatorCapturedInjectionValue(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 88);
  unint64_t v3 = *(void *)(a1 + 96);

  return sub_253D75D88(v2, v3);
}

uint64_t initializeWithCopy for SessionCoordinatorCapturedInjectionValue(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  unint64_t v8 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253D75DE0(v7, v8);
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  return a1;
}

void *assignWithCopy for SessionCoordinatorCapturedInjectionValue(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[11];
  unint64_t v4 = a2[12];
  sub_253D75DE0(v5, v4);
  uint64_t v6 = a1[11];
  unint64_t v7 = a1[12];
  a1[11] = v5;
  a1[12] = v4;
  sub_253D75D88(v6, v7);
  return a1;
}

void *initializeWithTake for SessionCoordinatorCapturedInjectionValue(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for SessionCoordinatorCapturedInjectionValue(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a1 + 88);
  unint64_t v9 = *(void *)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  sub_253D75D88(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionCoordinatorCapturedInjectionValue(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 104))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionCoordinatorCapturedInjectionValue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionCoordinatorCapturedInjectionValue()
{
  return &type metadata for SessionCoordinatorCapturedInjectionValue;
}

unsigned char *sub_253DA6108@<X0>(unsigned char *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_253D95F58(a1, a2);
}

uint64_t sub_253DA6124()
{
  sub_253D8F168(v2, v0);
  sub_253D8F168(v2, v0);
  return v1;
}

uint64_t sub_253DA6160()
{
  return *(void *)(v0 + 176);
}

uint64_t sub_253DA6180(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DA61A8()
{
  return swift_slowAlloc();
}

uint64_t sub_253DA61C4()
{
  return swift_slowAlloc();
}

uint64_t sub_253DA61E0()
{
  return v0;
}

void sub_253DA61F4(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(a1 + v1);
  os_unfair_lock_lock(v3 + 5);
}

uint64_t sub_253DA6214()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_253DA6224()
{
  return sub_253DA6214();
}

uint64_t dispatch thunk of Session.SessionResourceProviding.identityChain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Session.SessionResourceProviding.actionRequirementsEvaluator.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Session.SessionResourceProviding.instrumentationSender.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of Session.SessionResourceProviding.toolbox.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of Session.SessionResourceProviding.getToolExecutionSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of Session.SessionResourceProviding.getConcurrencySafeToolExecutionSession()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_253DA62C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a1;
  uint64_t v32 = a3;
  uint64_t v28 = a2;
  uint64_t v10 = sub_253DF42A0();
  sub_253C0F830();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_253DF2990();
  sub_253C0F830();
  uint64_t v18 = v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, a2, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a4, v10);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v30;
  *(void *)(v22 + 16) = v29;
  *(void *)(v22 + 24) = v23;
  sub_253BDEDD8(&qword_26B2561A0);
  uint64_t v24 = swift_allocObject();
  *(_DWORD *)(v24 + 36) = 0;
  *(void *)(v24 + 16) = sub_253DA6A9C;
  *(void *)(v24 + 24) = v22;
  *(unsigned char *)(v24 + 32) = 0;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a4, v10);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v28, v16);
  *(void *)a7 = v31;
  uint64_t v25 = (int *)_s24StandardSessionResourcesVMa();
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&a7[v25[5]], v21, v16);
  *(void *)&a7[v25[6]] = v32;
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 32))(&a7[v25[7]], v15, v10);
  *(void *)&a7[v25[8]] = v24;
  return result;
}

uint64_t sub_253DA64FC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  unint64_t v9 = *(os_unfair_lock_s **)(v4 + *(int *)(_s24StandardSessionResourcesVMa() + 32));
  uint64_t v10 = (uint64_t)&v9[4];
  uint64_t v11 = v9 + 9;
  os_unfair_lock_lock(v9 + 9);
  sub_253DA7678(v10, &v16);
  os_unfair_lock_unlock(v11);
  uint64_t v12 = a1(0);
  uint64_t v13 = swift_retain();
  uint64_t v14 = a2(v13);
  a4[3] = v12;
  a4[4] = a3;
  uint64_t result = swift_release();
  *a4 = v14;
  return result;
}

uint64_t sub_253DA65BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_253DF5500();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v8, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  void v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a2;
  LODWORD(a1) = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v8, 1, v9);
  swift_retain();
  if (a1 == 1)
  {
    sub_253C4E8CC((uint64_t)v8);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    sub_253DF54F0();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
    if (v10[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_253DF5480();
      uint64_t v12 = v13;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
  }
  sub_253BDEDD8(&qword_26B2562C8);
  if (v12 | v11)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v11;
    v15[3] = v12;
  }
  uint64_t result = swift_task_create();
  *a3 = result;
  return result;
}

uint64_t sub_253DA67AC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_253DA687C;
  return v7();
}

uint64_t sub_253DA687C(uint64_t a1, uint64_t a2)
{
  sub_253BDF7C8();
  uint64_t v7 = v6;
  uint64_t v8 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v9 = *(uint64_t (**)(void))(v8 + 8);
    return v9();
  }
  else
  {
    *(void *)(v7 + 32) = a2;
    *(void *)(v7 + 40) = a1;
    return MEMORY[0x270FA2498](sub_253DA69B4, 0, 0);
  }
}

uint64_t sub_253DA69B4()
{
  *(int8x16_t *)*(void *)(v0 + 16) = vextq_s8(*(int8x16_t *)(v0 + 32), *(int8x16_t *)(v0 + 32), 8uLL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_253DA69DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DA69E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_253DF2990();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_253DA6A54@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(v2 + *(int *)(a1 + 24));
  return swift_retain();
}

uint64_t sub_253DA6A64()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253DA6A9C@<X0>(uint64_t *a1@<X8>)
{
  return sub_253DA65BC(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t _s24StandardSessionResourcesVMa()
{
  uint64_t result = qword_26B255F18;
  if (!qword_26B255F18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_253DA6AEC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_253DA6B2C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_253C4E7FC;
  return sub_253DA67AC(a1, v4, v5, v6);
}

uint64_t sub_253DA6BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_253DF42A0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t *sub_253DA6C5C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_253DF2990();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    *(uint64_t *)((char *)v7 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_253DF42A0();
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
    swift_retain();
    v17(v14, v15, v16);
    *(uint64_t *)((char *)v7 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  }
  swift_retain();
  return v7;
}

uint64_t sub_253DA6DB8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_253DF2990();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_253DF42A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_release();
}

void *sub_253DA6E90(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253DF2990();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_253DF42A0();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_retain();
  v15(v12, v13, v14);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_retain();
  return a1;
}

void *sub_253DA6FA4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253DF2990();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_253DF42A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

void *sub_253DA70C0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253DF2990();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_253DF42A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void *sub_253DA71A8(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253DF2990();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_release();
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_253DF42A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_release();
  return a1;
}

uint64_t sub_253DA72AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253DA72C0);
}

uint64_t sub_253DA72C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    sub_253DF2990();
    sub_253C16A18();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v10 = sub_253DF42A0();
      uint64_t v11 = *(int *)(a3 + 28);
    }
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)a1 + v11, a2, v10);
  }
}

uint64_t sub_253DA736C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253DA7380);
}

void *sub_253DA7380(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    sub_253DF2990();
    sub_253C16A18();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_253DF42A0();
      uint64_t v11 = *(int *)(a4 + 28);
    }
    return (void *)_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_253DA7428()
{
  uint64_t result = sub_253DF2990();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_253DF42A0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_253DA750C()
{
  return MEMORY[0x263F4D200];
}

unint64_t sub_253DA751C()
{
  unint64_t result = qword_26B255B08;
  if (!qword_26B255B08)
  {
    type metadata accessor for DefaultEventLogSender();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B255B08);
  }
  return result;
}

uint64_t sub_253DA756C@<X0>(uint64_t *a1@<X8>)
{
  return sub_253DA64FC(MEMORY[0x263F4DBB0], MEMORY[0x263F4DBA0], MEMORY[0x263F4DBA8], a1);
}

uint64_t sub_253DA75B4@<X0>(uint64_t *a1@<X8>)
{
  return sub_253DA64FC(MEMORY[0x263F4DD70], MEMORY[0x263F4DD60], MEMORY[0x263F4DD68], a1);
}

uint64_t sub_253DA75FC(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 16) & 1) == 0)
  {
    (*(void (**)(uint64_t *__return_ptr))a1)(&v3);
    sub_253DA76A4();
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 1;
  }
  return swift_retain();
}

uint64_t sub_253DA7678@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_253DA75FC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_253DA76A4()
{
  return swift_release();
}

uint64_t sub_253DA76B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_253BDEDD8(&qword_269D7BC40);
  uint64_t v9 = sub_253BDF9FC(v8);
  MEMORY[0x270FA5388](v9);
  sub_253C2F37C();
  uint64_t v10 = sub_253DF3C00();
  sub_253C0F830();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  sub_253C566F8();
  sub_253C0FD54(a1, 1, v10);
  if (v14)
  {
    sub_253BEFAC0(a1, &qword_269D7BC40);
    sub_253DEEC30(a2, a3, v3);
    swift_bridgeObjectRelease();
    return sub_253BEFAC0(v3, &qword_269D7BC40);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v4, a1, v10);
    sub_253DB2F04(v4, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_253DA77EC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_253BDEDD8(&qword_26B255FC0);
  uint64_t v7 = sub_253BDF9FC(v6);
  MEMORY[0x270FA5388](v7);
  sub_253C567FC();
  uint64_t v8 = sub_253DF4BA0();
  sub_253C0F830();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_253C16A90();
  sub_253C0FD54(a1, 1, v8);
  if (v12)
  {
    sub_253BEFAC0(a1, &qword_26B255FC0);
    sub_253DEED5C();
    sub_253DEFFE0();
    sub_253BDF7F0();
    sub_253BEFBCC();
    v13();
    return sub_253BEFAC0(v2, &qword_26B255FC0);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v3, a1, v8);
    sub_253DB2F94(v3, a2, (void (*)(uint64_t, uint64_t))sub_253DB32F8);
    sub_253DEFFE0();
    sub_253BDF7F0();
    return (*(uint64_t (**)(uint64_t))(v14 + 8))(a2);
  }
}

uint64_t sub_253DA7978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253BDEDD8(qword_26B2559E8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for SessionSwitchboard.SessionInfo();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(a1, 1, v10) == 1)
  {
    sub_253BEFAC0(a1, qword_26B2559E8);
    sub_253DEEE9C();
    sub_253DB4F40();
    return sub_253BEFAC0((uint64_t)v6, qword_26B2559E8);
  }
  else
  {
    sub_253DB4FFC();
    sub_253DB2F94((uint64_t)v9, a2, (void (*)(uint64_t, uint64_t))sub_253DB362C);
    return sub_253DB4F40();
  }
}

uint64_t sub_253DA7B00(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    sub_253DEF120(a3, a4);
  }
  else {
    sub_253DB3010(a1, a3, a4);
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_253DA7B54(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_253BDEDD8(&qword_26B255E08);
  uint64_t v7 = sub_253BDF9FC(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_253C567FC();
  type metadata accessor for SessionCoordinatorInjectionRequest(v8);
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v9);
  sub_253C2F37C();
  sub_253C0FD54(a1, 1, v10);
  if (v11)
  {
    sub_253BEFAC0(a1, &qword_26B255E08);
    sub_253DEEFE0();
    sub_253DEFE90();
    sub_253BDF7F0();
    sub_253BEFBCC();
    v12();
    return sub_253BEFAC0(v2, &qword_26B255E08);
  }
  else
  {
    sub_253DB4FFC();
    sub_253DB2F94(v3, a2, (void (*)(uint64_t, uint64_t))sub_253DB37C4);
    sub_253DEFE90();
    sub_253BDF7F0();
    return (*(uint64_t (**)(uint64_t))(v13 + 8))(a2);
  }
}

uint64_t sub_253DA7CCC@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v23 = a3;
  uint64_t v28 = sub_253BDEDD8(&qword_26B255440);
  uint64_t v5 = MEMORY[0x270FA5388](v28);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - v8;
  sub_253DB2ECC(a2, v27);
  int64_t v10 = v27[3];
  uint64_t v11 = v27[4];
  uint64_t v24 = v27[1];
  int64_t v25 = (unint64_t)(v27[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v11) {
    goto LABEL_3;
  }
LABEL_2:
  v11 &= v11 - 1;
  while (1)
  {
    sub_253DF14C0();
    sub_253DB4FB0();
    type metadata accessor for SessionSwitchboard.SessionInfo();
    sub_253DB4FB0();
    sub_253C61B78((uint64_t)v9, (uint64_t)v7, &qword_26B255440);
    char v16 = v26(v7);
    if (v3)
    {
      sub_253BEFAC0((uint64_t)v7, &qword_26B255440);
      return swift_release();
    }
    if (v16)
    {
      swift_release();
      uint64_t v18 = v23;
      sub_253C61B78((uint64_t)v7, v23, &qword_26B255440);
      uint64_t v19 = v18;
      uint64_t v20 = 0;
      return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v19, v20, 1, v28);
    }
    uint64_t result = sub_253BEFAC0((uint64_t)v7, &qword_26B255440);
    if (v11) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v13 >= v25) {
      goto LABEL_26;
    }
    uint64_t v14 = *(void *)(v24 + 8 * v13);
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v25) {
        goto LABEL_26;
      }
      uint64_t v14 = *(void *)(v24 + 8 * v15);
      if (v14) {
        goto LABEL_12;
      }
      int64_t v15 = v10 + 3;
      if (v10 + 3 >= v25) {
        goto LABEL_26;
      }
      uint64_t v14 = *(void *)(v24 + 8 * v15);
      if (v14) {
        goto LABEL_12;
      }
      int64_t v15 = v10 + 4;
      if (v10 + 4 >= v25) {
        goto LABEL_26;
      }
      uint64_t v14 = *(void *)(v24 + 8 * v15);
      if (v14)
      {
LABEL_12:
        int64_t v13 = v15;
      }
      else
      {
        int64_t v13 = v10 + 5;
        if (v10 + 5 >= v25) {
          goto LABEL_26;
        }
        uint64_t v14 = *(void *)(v24 + 8 * v13);
        if (!v14)
        {
          int64_t v17 = v10 + 6;
          while (v17 < v25)
          {
            uint64_t v14 = *(void *)(v24 + 8 * v17++);
            if (v14)
            {
              int64_t v13 = v17 - 1;
              goto LABEL_13;
            }
          }
LABEL_26:
          uint64_t v21 = v23;
          swift_release();
          uint64_t v19 = v21;
          uint64_t v20 = 1;
          return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v19, v20, 1, v28);
        }
      }
    }
LABEL_13:
    uint64_t v11 = (v14 - 1) & v14;
    int64_t v10 = v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_253DA7FF4(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_253DF5AD0())
  {
    uint64_t v6 = 4;
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v7 = MEMORY[0x25A26FC80](v6 - 4, a3);
      }
      else
      {
        uint64_t v7 = *(void *)(a3 + 8 * v6);
        swift_retain();
      }
      uint64_t v8 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      uint64_t v14 = v7;
      char v9 = a1(&v14);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return v11 & 1;
      }
      char v10 = v9;
      swift_release();
      if (v10)
      {
        swift_bridgeObjectRelease();
        char v11 = 1;
        return v11 & 1;
      }
      ++v6;
      if (v8 == v5) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  char v11 = 0;
  return v11 & 1;
}

uint64_t sub_253DA8138(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a1;
  uint64_t v21 = sub_253BDEDD8(&qword_26B255440);
  uint64_t v5 = MEMORY[0x270FA5388](v21);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  char v9 = (char *)&v19 - v8;
  sub_253DB2ECC(a3, v22);
  int64_t v10 = v22[3];
  uint64_t v11 = v22[4];
  uint64_t v19 = v22[1];
  int64_t v20 = (unint64_t)(v22[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  while (1)
  {
    if (v11)
    {
      v11 &= v11 - 1;
      goto LABEL_15;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v13 >= v20) {
      goto LABEL_25;
    }
    uint64_t v14 = *(void *)(v19 + 8 * v13);
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v20) {
        goto LABEL_25;
      }
      uint64_t v14 = *(void *)(v19 + 8 * v15);
      if (v14) {
        goto LABEL_13;
      }
      int64_t v15 = v10 + 3;
      if (v10 + 3 >= v20) {
        goto LABEL_25;
      }
      uint64_t v14 = *(void *)(v19 + 8 * v15);
      if (v14) {
        goto LABEL_13;
      }
      int64_t v15 = v10 + 4;
      if (v10 + 4 >= v20) {
        goto LABEL_25;
      }
      uint64_t v14 = *(void *)(v19 + 8 * v15);
      if (v14)
      {
LABEL_13:
        int64_t v13 = v15;
      }
      else
      {
        int64_t v13 = v10 + 5;
        if (v10 + 5 >= v20) {
          goto LABEL_25;
        }
        uint64_t v14 = *(void *)(v19 + 8 * v13);
        if (!v14)
        {
          int64_t v17 = v10 + 6;
          while (v17 < v20)
          {
            uint64_t v14 = *(void *)(v19 + 8 * v17++);
            if (v14)
            {
              int64_t v13 = v17 - 1;
              goto LABEL_14;
            }
          }
LABEL_25:
          swift_release();
          char v18 = 0;
          return v18 & 1;
        }
      }
    }
LABEL_14:
    uint64_t v11 = (v14 - 1) & v14;
    int64_t v10 = v13;
LABEL_15:
    sub_253DF14C0();
    sub_253DB4FB0();
    type metadata accessor for SessionSwitchboard.SessionInfo();
    sub_253DB4FB0();
    sub_253C61B78((uint64_t)v9, (uint64_t)v7, &qword_26B255440);
    char v16 = v23(v7);
    uint64_t result = sub_253BEFAC0((uint64_t)v7, &qword_26B255440);
    if (v3)
    {
      swift_release();
      return v18 & 1;
    }
    if (v16)
    {
      swift_release();
      char v18 = 1;
      return v18 & 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_253DA8420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v6 = sub_253BDF9FC(v5);
  MEMORY[0x270FA5388](v6);
  sub_253C10D28();
  uint64_t v9 = v8 - v7;
  sub_253C2E770(a1, v8 - v7, (uint64_t *)&unk_26B2519E0);
  uint64_t v10 = sub_253DF5500();
  uint64_t v11 = sub_253D9E3EC();
  sub_253C0FD54(v11, v12, v10);
  if (v13)
  {
    sub_253BEFAC0(v9, (uint64_t *)&unk_26B2519E0);
  }
  else
  {
    sub_253DF54F0();
    sub_253BEFBCC();
    v14();
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_253DF5480();
    swift_unknownObjectRelease();
  }
  swift_task_create();
  return swift_release();
}

void sub_253DA85C0()
{
  sub_253C1CED0();
  uint64_t v45 = sub_253BDEDD8(&qword_26B255398);
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v1);
  sub_253C34050();
  uint64_t v44 = v2;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v3);
  uint64_t v43 = (char *)&v39 - v4;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v5);
  sub_253C36430();
  uint64_t v42 = v6;
  sub_253C10220();
  uint64_t v7 = *(void *)(v0 + 24);
  sub_253DB2ECC(v7, v49);
  uint64_t v46 = v49[0];
  int64_t v47 = v49[3];
  uint64_t v8 = v49[4];
  uint64_t v40 = v49[1];
  int64_t v41 = (unint64_t)(v49[2] + 64) >> 6;
  uint64_t v39 = v7;
  swift_bridgeObjectRetain_n();
  uint64_t v10 = (uint64_t)v43;
  uint64_t v9 = v44;
  while (1)
  {
    if (v8)
    {
      sub_253DB6014();
      uint64_t v48 = v8;
      unint64_t v12 = v11 | (v47 << 6);
      goto LABEL_26;
    }
    int64_t v13 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      break;
    }
    if (v13 >= v41) {
      goto LABEL_28;
    }
    unint64_t v14 = *(void *)(v40 + 8 * v13);
    int64_t v15 = v47 + 1;
    if (!v14)
    {
      sub_253DB5FF4();
      if (v16 == v17) {
        goto LABEL_28;
      }
      sub_253DB5FE8();
      if (!v14)
      {
        sub_253DB5FF4();
        if (v16 == v17) {
          goto LABEL_28;
        }
        sub_253DB5FE8();
        if (!v14)
        {
          sub_253DB5FF4();
          if (v16 == v17) {
            goto LABEL_28;
          }
          sub_253DB5FE8();
          if (!v14)
          {
            sub_253DB5FF4();
            if (v16 == v17) {
              goto LABEL_28;
            }
            sub_253DB5FE8();
            if (!v14)
            {
              int64_t v15 = v18 + 5;
              if (v18 + 5 >= v41) {
                goto LABEL_28;
              }
              unint64_t v14 = *(void *)(v40 + 8 * v15);
              if (!v14)
              {
                int64_t v19 = v47 + 7;
                while (v19 < v41)
                {
                  unint64_t v14 = *(void *)(v40 + 8 * v19++);
                  if (v14)
                  {
                    int64_t v15 = v19 - 1;
                    goto LABEL_25;
                  }
                }
LABEL_28:
                swift_bridgeObjectRelease();
                swift_release();
                sub_253C1CEE8();
                return;
              }
            }
          }
        }
      }
    }
LABEL_25:
    int64_t v47 = v15;
    uint64_t v48 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_26:
    uint64_t v20 = v46;
    uint64_t v21 = sub_253DF08E0();
    sub_253BDF9FC(v21);
    uint64_t v22 = v42;
    sub_253DB4FB0();
    uint64_t v23 = *(void *)(v20 + 56) + 56 * v12;
    uint64_t v24 = *(void *)v23;
    uint64_t v25 = *(void *)(v23 + 8);
    uint64_t v26 = *(void *)(v23 + 16);
    uint64_t v27 = *(void *)(v23 + 24);
    char v28 = *(unsigned char *)(v23 + 32);
    uint64_t v30 = *(void *)(v23 + 40);
    uint64_t v29 = *(void *)(v23 + 48);
    uint64_t v31 = v45;
    uint64_t v32 = v22 + *(int *)(v45 + 48);
    *(void *)uint64_t v32 = v24;
    *(void *)(v32 + 8) = v25;
    *(void *)(v32 + 16) = v26;
    *(void *)(v32 + 24) = v27;
    *(unsigned char *)(v32 + 32) = v28;
    *(void *)(v32 + 40) = v30;
    *(void *)(v32 + 48) = v29;
    sub_253C61B78(v22, v10, &qword_26B255398);
    uint64_t v33 = *(int *)(v31 + 48);
    uint64_t v34 = v9 + v33;
    uint64_t v35 = v10 + v33;
    sub_253DB4FB0();
    uint64_t v36 = *(void *)(v35 + 8);
    int v37 = *(unsigned __int8 *)(v35 + 32);
    *(void *)uint64_t v34 = *(void *)v35;
    *(void *)(v34 + 8) = v36;
    *(_OWORD *)(v34 + 16) = *(_OWORD *)(v35 + 16);
    *(unsigned char *)(v34 + 32) = v37;
    *(_OWORD *)(v34 + 40) = *(_OWORD *)(v35 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_253DB4F40();
    sub_253BEFAC0(v10, &qword_26B255398);
    BOOL v38 = v37 == 1;
    uint64_t v8 = v48;
    if (v38) {
      goto LABEL_28;
    }
  }
  __break(1u);
}

void sub_253DA8904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  sub_253C59954();
  char v16 = v15;
  uint64_t v17 = sub_253DF14C0();
  uint64_t v18 = sub_253BDF9FC(v17);
  MEMORY[0x270FA5388](v18);
  sub_253C16A90();
  uint64_t v19 = sub_253DF24A0();
  sub_253C0F830();
  uint64_t v21 = v20;
  MEMORY[0x270FA5388](v22);
  sub_253C2F37C();
  sub_253DB5F3C();
  sub_253DAB858();
  if (v13)
  {
    *char v16 = a13;
  }
  else
  {
    sub_253DAC688();
    sub_253DF1770();
    sub_253DB4FB0();
    uint64_t v23 = sub_253DF2490();
    os_log_type_t v24 = sub_253DF5700();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v26 = sub_253DEFE40();
      sub_253D8E5FC(v26, v27, &v28);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      _os_log_impl(&dword_253BD8000, v23, v24, "Session %s deregistered.", v25, 0xCu);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      sub_253DB4F40();
    }

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v14, v19);
  }
  sub_253C5993C();
}

void sub_253DA8B60()
{
  sub_253C1CED0();
  char v24 = v3;
  uint64_t v23 = v4;
  uint64_t v6 = v5;
  sub_253DF24A0();
  sub_253C0F830();
  MEMORY[0x270FA5388](v7);
  sub_253C566F8();
  uint64_t v8 = sub_253BDEDD8(qword_26B2559E8);
  uint64_t v9 = sub_253BDF9FC(v8);
  MEMORY[0x270FA5388](v9);
  sub_253C4BC10();
  uint64_t v10 = sub_253DF14C0();
  uint64_t v11 = sub_253BDF9FC(v10);
  MEMORY[0x270FA5388](v11);
  sub_253C8F238();
  MEMORY[0x270FA5388](v12);
  sub_253CE9D30();
  uint64_t v13 = sub_253BDEDD8(&qword_26B255410);
  uint64_t v14 = sub_253BDF9FC(v13);
  MEMORY[0x270FA5388](v14);
  sub_253C16AA8();
  sub_253C2E770(v6, v1, &qword_26B255410);
  sub_253DAB508();
  sub_253DB4FB0();
  sub_253DB4FB0();
  int64_t v15 = (int *)type metadata accessor for SessionSwitchboard.SessionInfo();
  sub_253C2E770(v1, v2 + v15[5], &qword_26B255410);
  *(void *)(v2 + v15[6]) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v2 + v15[7]) = v24;
  *(void *)(v2 + v15[8]) = v23;
  sub_253DB5C60(v2);
  swift_beginAccess();
  swift_retain();
  sub_253DA7978(v2, v0);
  swift_endAccess();
  sub_253DF1770();
  sub_253DB4FB0();
  char v16 = sub_253DF2490();
  os_log_type_t v17 = sub_253DF5700();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)sub_253CAEF84();
    uint64_t v25 = sub_253C0FF74();
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v19 = sub_253DEFE40();
    uint64_t v21 = sub_253D8E5FC(v19, v20, &v25);
    sub_253DB5EA8(v21);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    sub_253DB4F40();
    _os_log_impl(&dword_253BD8000, v16, v17, "Session %s registered.", v18, 0xCu);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();
  }
  else
  {

    sub_253DB4F40();
  }
  sub_253BEFBCC();
  v22();
  sub_253BEFAC0(v1, &qword_26B255410);
  sub_253C1CEE8();
}

unsigned char *sub_253DA8EB4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v9 = sub_253BDEDD8(qword_26B2559E8);
  uint64_t v10 = sub_253BDF9FC(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_253DB5C38();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v12);
  sub_253C16A90();
  sub_253DB5F3C();
  sub_253DAB858();
  if (v4)
  {
    char v13 = v16;
LABEL_6:
    *a3 = v13;
    return a3;
  }
  sub_253D7B20C();
  sub_253D7F1B4(a1, *(void *)(v3 + 16), v5);
  sub_253C0FD54(v5, 1, v11);
  if (v14)
  {
    sub_253BEFAC0(v5, qword_26B2559E8);
    swift_endAccess();
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    char v13 = 0;
    goto LABEL_6;
  }
  sub_253DB4FFC();
  swift_endAccess();
  a3 = *(unsigned char **)(v6 + *(int *)(v11 + 32));
  swift_retain();
  sub_253DB4F40();
  return a3;
}

uint64_t sub_253DA9050()
{
  sub_253BDF8D0();
  v1[16] = v2;
  v1[17] = v0;
  v1[15] = v3;
  uint64_t v4 = sub_253BDEDD8(qword_26B2559E8);
  sub_253BDF9FC(v4);
  v1[18] = sub_253BDF868();
  uint64_t v5 = type metadata accessor for SessionSwitchboard.SessionInfo();
  v1[19] = v5;
  sub_253BDF9FC(v5);
  v1[20] = sub_253BDF868();
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  v1[21] = qword_26B2575F0;
  type metadata accessor for SessionControlActor();
  v1[22] = sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  swift_retain();
  uint64_t v7 = sub_253DF5480();
  v1[23] = v7;
  v1[24] = v6;
  return MEMORY[0x270FA2498](sub_253DA91A4, v7, v6);
}

uint64_t sub_253DA91A4()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  sub_253D7B20C();
  sub_253D7F1B4(v4, *(void *)(v3 + 16), v2);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v2, 1, v1) == 1)
  {
    sub_253BEFAC0(*(void *)(v0 + 144), qword_26B2559E8);
    swift_endAccess();
    swift_release();
    sub_253D2BEB4();
    swift_allocError();
    *uint64_t v5 = 0;
    swift_willThrow();
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253BDF8DC();
    return v16();
  }
  uint64_t v6 = *(void *)(v0 + 136);
  sub_253DB4FFC();
  swift_endAccess();
  sub_253D7B20C();
  if (!*(void *)(*(void *)(v6 + 24) + 16) || (sub_253D87C3C(), (v7 & 1) == 0))
  {
    swift_endAccess();
    swift_release();
    sub_253D2BEB4();
    swift_allocError();
    *int64_t v15 = 2;
    swift_willThrow();
    sub_253DB4F40();
    goto LABEL_9;
  }
  uint64_t v8 = *(void *)(v0 + 160);
  sub_253DB5964();
  long long v18 = *(_OWORD *)(v0 + 128);
  long long v11 = v9[1];
  long long v10 = v9[2];
  long long v12 = *v9;
  *(void *)(v0 + 64) = *((void *)v9 + 6);
  *(_OWORD *)(v0 + 32) = v11;
  *(_OWORD *)(v0 + 48) = v10;
  *(_OWORD *)(v0 + 16) = v12;
  swift_endAccess();
  *(void *)(v0 + 200) = qword_26B2575F0;
  uint64_t v13 = swift_task_alloc();
  *(void *)(v0 + 208) = v13;
  *(void *)(v13 + 16) = v8;
  *(_OWORD *)(v13 + 24) = v18;
  *(void *)(v13 + 40) = v0 + 16;
  sub_253DB51E4(v0 + 16);
  swift_retain();
  char v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v14;
  *char v14 = v0;
  v14[1] = sub_253DA948C;
  return MEMORY[0x270FA22B8]();
}

uint64_t sub_253DA948C()
{
  sub_253BDF8D0();
  uint64_t v2 = *v1;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 224) = v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v2 + 192);
  uint64_t v6 = *(void *)(v2 + 184);
  if (v0) {
    char v7 = sub_253DA9690;
  }
  else {
    char v7 = sub_253DA95F4;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_253DA95F4()
{
  sub_253BDF8D0();
  sub_253DB5238(v0 + 16);
  swift_release();
  sub_253DB4F40();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  return v1();
}

uint64_t sub_253DA9690()
{
  sub_253BDF928();
  sub_253DB5238(v0 + 16);
  swift_release();
  sub_253DB4F40();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v1();
}

uint64_t sub_253DA9728()
{
  uint64_t v0 = type metadata accessor for SessionCoordinatorCommand(0);
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = sub_253BDEDD8(&qword_26B256088);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  sub_253BDEDD8(&qword_26B2560C8);
  sub_253DF5540();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_253DA987C()
{
  type metadata accessor for SessionSwitchboard();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_253DA98B8();
  qword_26B257560 = v0;
  return result;
}

uint64_t sub_253DA98B8()
{
  sub_253DF14C0();
  sub_253CD9958();
  type metadata accessor for SessionSwitchboard.SessionInfo();
  sub_253DB50E0(&qword_26B255450, MEMORY[0x263F4CE38]);
  *(void *)(v0 + 16) = sub_253DF5180();
  sub_253DF08E0();
  sub_253DB50E0(&qword_26B2553A0, MEMORY[0x263F4C718]);
  *(void *)(v0 + 24) = sub_253DF5180();
  return v0;
}

void sub_253DA99A4()
{
  sub_253C1CED0();
  char v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_253DF08E0();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v12);
  sub_253C8F07C();
  sub_253DF24A0();
  sub_253C0F830();
  MEMORY[0x270FA5388](v13);
  *(void *)&long long v24 = v9;
  *((void *)&v24 + 1) = v7;
  uint64_t v25 = v5;
  uint64_t v26 = v3;
  char v27 = v1;
  uint64_t v28 = MEMORY[0x263F8EE78];
  uint64_t v29 = v11;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_253DB30A0(&v24);
  swift_endAccess();
  sub_253DF1770();
  sub_253DB4FB0();
  char v14 = sub_253DF2490();
  os_log_type_t v15 = sub_253DF5700();
  if (os_log_type_enabled(v14, v15))
  {
    char v16 = (uint8_t *)sub_253CAEF84();
    uint64_t v23 = sub_253C0FF74();
    *(_DWORD *)char v16 = 136315138;
    sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
    uint64_t v17 = sub_253DF5C40();
    sub_253D8E5FC(v17, v18, &v23);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    sub_253DB4F40();
    _os_log_impl(&dword_253BD8000, v14, v15, "SessionClient %s registered.", v16, 0xCu);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();
  }
  else
  {
    sub_253DB4F40();
  }

  sub_253BEFBCC();
  v22(v19, v20, v21);
  sub_253C1CEE8();
}

uint64_t sub_253DA9C54()
{
  sub_253BDF8D0();
  v1[12] = v2;
  v1[13] = v0;
  uint64_t v3 = sub_253DF08E0();
  v1[14] = v3;
  sub_253BDF9FC(v3);
  v1[15] = sub_253BDF868();
  uint64_t v4 = sub_253DF24A0();
  v1[16] = v4;
  sub_253BDF7B0(v4);
  v1[17] = v5;
  v1[18] = sub_253BDF868();
  uint64_t v6 = sub_253DF0780();
  v1[19] = v6;
  sub_253BDF7B0(v6);
  v1[20] = v7;
  v1[21] = sub_253BDF868();
  uint64_t v8 = sub_253DEFE90();
  v1[22] = v8;
  sub_253BDF7B0(v8);
  v1[23] = v9;
  v1[24] = sub_253BDF868();
  uint64_t v10 = sub_253DF0D70();
  v1[25] = v10;
  sub_253BDF7B0(v10);
  v1[26] = v11;
  v1[27] = sub_253BDF868();
  uint64_t v12 = sub_253DF14C0();
  sub_253BDF7B0(v12);
  v1[28] = v13;
  v1[29] = sub_253BDF868();
  uint64_t v14 = sub_253BDEDD8(&qword_26B255448);
  sub_253BDF9FC(v14);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  uint64_t v15 = type metadata accessor for SessionSwitchboard.SessionInfo();
  v1[32] = v15;
  sub_253BDF7B0(v15);
  v1[33] = v16;
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  v1[37] = qword_26B2575F0;
  type metadata accessor for SessionControlActor();
  sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  swift_retain();
  uint64_t v18 = sub_253DF5480();
  v1[38] = v18;
  v1[39] = v17;
  return MEMORY[0x270FA2498](sub_253DA9EF8, v18, v17);
}

uint64_t sub_253DA9EF8()
{
  uint64_t v74 = v0;
  swift_beginAccess();
  sub_253DEF20C((uint64_t)&v69);
  swift_endAccess();
  *(void *)(v0 + 320) = v69;
  uint64_t v2 = v70;
  *(_OWORD *)(v0 + 328) = v70;
  *(void *)(v0 + 344) = v71;
  char v3 = v72;
  *(_OWORD *)(v0 + 352) = v72;
  *(void *)(v0 + 368) = v73;
  if (!v2 || (v3 & 1) == 0)
  {
LABEL_29:
    uint64_t v24 = *(void *)(v0 + 104);
    sub_253C10220();
    uint64_t v25 = *(void *)(v24 + 16);
    *(void *)(v0 + 408) = v25;
    *(unsigned char *)(v0 + 453) = *(unsigned char *)(v25 + 32);
    sub_253DB59D0();
    uint64_t v28 = v26 & v27;
    *(_DWORD *)(v0 + 448) = *MEMORY[0x263F4C518];
    uint64_t v9 = swift_bridgeObjectRetain();
    int64_t v29 = 0;
    if (!v28) {
      goto LABEL_32;
    }
LABEL_30:
    sub_253DB5EFC();
LABEL_31:
    sub_253DB4FB0();
    uint64_t v30 = sub_253BDEDD8(&qword_26B255440);
    sub_253DB4FB0();
    sub_253C6373C();
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v31, v32, v33, v30);
    while (1)
    {
      *(void *)(v0 + 416) = v29;
      *(void *)(v0 + 424) = v28;
      uint64_t v44 = *(void *)(v0 + 248);
      sub_253C61B78(*(void *)(v0 + 240), v44, &qword_26B255448);
      uint64_t v45 = sub_253BDEDD8(&qword_26B255440);
      sub_253C0FD54(v44, 1, v45);
      if (v46)
      {
        swift_release();
        swift_release();
        sub_253DF1770();
        sub_253DB4FB0();
        uint64_t v48 = sub_253DF2490();
        os_log_type_t v49 = sub_253DF5700();
        BOOL v50 = os_log_type_enabled(v48, v49);
        uint64_t v52 = *(void *)(v0 + 136);
        uint64_t v51 = *(void *)(v0 + 144);
        uint64_t v53 = *(void *)(v0 + 128);
        if (v50)
        {
          uint64_t v68 = *(void *)(v0 + 328);
          uint64_t v67 = *(void *)(v0 + 320);
          uint64_t v54 = (uint8_t *)swift_slowAlloc();
          uint64_t v69 = sub_253C0FF74();
          *(_DWORD *)uint64_t v54 = 136315138;
          sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
          uint64_t v55 = sub_253DF5C40();
          *(void *)(v0 + 88) = sub_253D8E5FC(v55, v56, &v69);
          sub_253DF5820();
          swift_bridgeObjectRelease();
          sub_253DB4F40();
          _os_log_impl(&dword_253BD8000, v48, v49, "SessionClient %s deregistered.", v54, 0xCu);
          swift_arrayDestroy();
          sub_253BDF910();
          sub_253BDF910();

          sub_253DB4E78(v67, v68);
        }
        else
        {
          sub_253DB4E78(*(void *)(v0 + 320), *(void *)(v0 + 328));
          sub_253DB4F40();
        }
        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);
        sub_253DB5854();
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
        sub_253BDF8DC();
        sub_253C10488();
        __asm { BRAA            X1, X16 }
      }
      sub_253DB4FFC();
      sub_253DB4FFC();
      if (sub_253DEFE60())
      {
        uint64_t v57 = sub_253DB5814();
        v58(v57);
        swift_retain();
        sub_253DF0770();
        uint64_t v59 = sub_253DB5948();
        v60(v59);
        sub_253DB59AC();
        uint64_t v61 = (void *)sub_253DB5A20();
        *(void *)(v0 + 440) = v61;
        *uint64_t v61 = v0;
        v61[1] = sub_253DAAE40;
        sub_253DB5A0C();
        sub_253C10488();
        __asm { BR              X1 }
      }
      sub_253DB4F40();
      uint64_t v9 = sub_253DB4F40();
      if (v28) {
        goto LABEL_30;
      }
LABEL_32:
      int64_t v34 = v29 + 1;
      if (__OFADD__(v29, 1)) {
        break;
      }
      unint64_t v35 = (1 << *(unsigned char *)(v0 + 453)) + 63;
      if (v34 >= (uint64_t)(v35 >> 6))
      {
        int64_t v39 = v29;
      }
      else
      {
        uint64_t v36 = *(void *)(v0 + 408);
        uint64_t v37 = v36 + 64;
        uint64_t v38 = *(void *)(v36 + 64 + 8 * v34);
        if (v38) {
          goto LABEL_35;
        }
        int64_t v47 = v35 >> 6;
        int64_t v39 = v29 + 1;
        if (v29 + 2 < v47)
        {
          uint64_t v38 = *(void *)(v37 + 8 * (v29 + 2));
          if (v38)
          {
            int64_t v34 = v29 + 2;
LABEL_35:
            uint64_t v28 = (v38 - 1) & v38;
            int64_t v29 = v34;
            goto LABEL_31;
          }
          int64_t v39 = v29 + 2;
          if (v29 + 3 < v47)
          {
            uint64_t v38 = *(void *)(v37 + 8 * (v29 + 3));
            if (v38)
            {
              int64_t v34 = v29 + 3;
              goto LABEL_35;
            }
            int64_t v34 = v29 + 4;
            int64_t v39 = v29 + 3;
            if (v29 + 4 < v47)
            {
              uint64_t v38 = *(void *)(v37 + 8 * v34);
              if (v38) {
                goto LABEL_35;
              }
              while (v29 + 5 < v47)
              {
                uint64_t v38 = *(void *)(v36 + 104 + 8 * v29++);
                if (v38)
                {
                  int64_t v34 = v29 + 4;
                  goto LABEL_35;
                }
              }
              int64_t v39 = v47 - 1;
            }
          }
        }
      }
      sub_253BDEDD8(&qword_26B255440);
      uint64_t v40 = sub_253DB5DC0();
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v40, v41, v42, v43);
      uint64_t v28 = 0;
      int64_t v29 = v39;
    }
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  uint64_t v4 = *(void *)(v0 + 104);
  sub_253C10220();
  uint64_t v5 = *(void *)(v4 + 16);
  *(void *)(v0 + 376) = v5;
  *(unsigned char *)(v0 + 452) = *(unsigned char *)(v5 + 32);
  sub_253DB59D0();
  uint64_t v8 = v6 & v7;
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v12 = 0;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v13 = sub_253DB5BC8();
  while (1)
  {
    *(void *)(v0 + 384) = v8;
    *(void *)(v0 + 392) = v12;
    uint64_t v22 = *(void *)(v0 + 280);
    sub_253DB5F5C(v13, v14);
    sub_253DB4FB0();
    sub_253DB4FFC();
    if (*(unsigned char *)(v22 + *(int *)(v1 + 28)))
    {
      sub_253DB5F48(*(void *)(v0 + 280));
      sub_253C10488();
      return MEMORY[0x270FA2498](v9, v10, v11);
    }
    uint64_t v9 = sub_253DB4F40();
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v12, 1)) {
      goto LABEL_64;
    }
    uint64_t v9 = sub_253DB5DD0();
    if (v17 == v18)
    {
LABEL_28:
      swift_release();
      goto LABEL_29;
    }
    uint64_t v19 = v9 + 64;
    uint64_t v12 = v16;
    if (!*(void *)(v9 + 64 + 8 * v16))
    {
      int64_t v20 = v15 >> 6;
      uint64_t v12 = v16 + 1;
      if (v16 + 1 >= v20) {
        goto LABEL_28;
      }
      if (!*(void *)(v19 + 8 * v12))
      {
        uint64_t v12 = v16 + 2;
        if (v16 + 2 >= v20) {
          goto LABEL_28;
        }
        if (!*(void *)(v19 + 8 * v12))
        {
          uint64_t v12 = v16 + 3;
          if (v16 + 3 >= v20) {
            goto LABEL_28;
          }
          if (!*(void *)(v19 + 8 * v12)) {
            break;
          }
        }
      }
    }
LABEL_21:
    sub_253DB5D98();
  }
  uint64_t v21 = v16 + 4;
  if (v21 >= v20) {
    goto LABEL_28;
  }
  if (*(void *)(v19 + 8 * v21))
  {
    uint64_t v12 = v21;
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v20) {
      goto LABEL_28;
    }
    ++v21;
    if (*(void *)(v19 + 8 * v12)) {
      goto LABEL_21;
    }
  }
LABEL_65:
  __break(1u);
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_253DAA730()
{
  sub_253BDF928();
  sub_253DA9728();
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 312);
  return MEMORY[0x270FA2498](sub_253DAA790, v1, v2);
}

uint64_t sub_253DAA790()
{
  uint64_t v70 = v1;
  uint64_t v3 = sub_253DB4F40();
  uint64_t v7 = *(void *)(v1 + 384);
  uint64_t v6 = *(void *)(v1 + 392);
  if (!v7) {
    goto LABEL_3;
  }
LABEL_2:
  uint64_t v8 = sub_253DB5BC8();
  while (1)
  {
    *(void *)(v1 + 384) = v7;
    *(void *)(v1 + 392) = v6;
    uint64_t v0 = *(void *)(v1 + 280);
    sub_253DB5F5C(v8, v9);
    sub_253DB4FB0();
    sub_253DB4FFC();
    if (*(unsigned char *)(v0 + *(int *)(v2 + 28))) {
      break;
    }
    uint64_t v3 = sub_253DB4F40();
    if (v7) {
      goto LABEL_2;
    }
LABEL_3:
    if (__OFADD__(v6, 1))
    {
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
      return MEMORY[0x270FA2498](v3, v4, v5);
    }
    uint64_t v3 = sub_253DB5DD0();
    if (v12 == v13) {
      goto LABEL_26;
    }
    uint64_t v14 = v3 + 64;
    uint64_t v6 = v11;
    if (!*(void *)(v3 + 64 + 8 * v11))
    {
      int64_t v15 = v10 >> 6;
      uint64_t v6 = v11 + 1;
      if (v11 + 1 >= v15) {
        goto LABEL_26;
      }
      if (!*(void *)(v14 + 8 * v6))
      {
        uint64_t v6 = v11 + 2;
        if (v11 + 2 >= v15) {
          goto LABEL_26;
        }
        if (!*(void *)(v14 + 8 * v6))
        {
          uint64_t v6 = v11 + 3;
          if (v11 + 3 >= v15) {
            goto LABEL_26;
          }
          if (!*(void *)(v14 + 8 * v6))
          {
            uint64_t v16 = v11 + 4;
            if (v16 >= v15)
            {
LABEL_26:
              swift_release();
              uint64_t v18 = *(void *)(v1 + 104);
              sub_253C10220();
              uint64_t v19 = *(void *)(v18 + 16);
              *(void *)(v1 + 408) = v19;
              *(unsigned char *)(v1 + 453) = *(unsigned char *)(v19 + 32);
              sub_253DB59D0();
              uint64_t v22 = v20 & v21;
              *(_DWORD *)(v1 + 448) = *MEMORY[0x263F4C518];
              uint64_t v3 = swift_bridgeObjectRetain();
              uint64_t v23 = 0;
              if (!v22) {
                goto LABEL_29;
              }
LABEL_27:
              sub_253DB5C1C();
LABEL_28:
              sub_253DB5BE4();
              sub_253DB4FB0();
              sub_253DB5F7C();
              sub_253DB4FB0();
              sub_253DB5C60(v18);
              while (1)
              {
                sub_253DB5FB0();
                uint64_t v26 = sub_253BDEDD8(&qword_26B255440);
                sub_253C0FD54(v0, 1, v26);
                if (v27)
                {
                  sub_253DB5CE0();
                  swift_release();
                  sub_253DF1770();
                  sub_253DB4FB0();
                  int64_t v34 = sub_253DF2490();
                  os_log_type_t v35 = sub_253DF5700();
                  os_log_type_enabled(v34, v35);
                  sub_253DB5B3C();
                  if (v38)
                  {
                    uint64_t v68 = v26;
                    int64_t v39 = (uint8_t *)sub_253DB5AA0();
                    uint64_t v69 = sub_253C0FF74();
                    *(_DWORD *)int64_t v39 = 136315138;
                    sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
                    uint64_t v40 = sub_253DF5C40();
                    uint64_t v42 = sub_253D8E5FC(v40, v41, &v69);
                    sub_253DB5E50(v42);
                    swift_bridgeObjectRelease();
                    sub_253DB4F40();
                    _os_log_impl(&dword_253BD8000, v34, v35, "SessionClient %s deregistered.", v39, 0xCu);
                    swift_arrayDestroy();
                    sub_253BDF910();
                    sub_253BDF910();

                    sub_253DB5F1C(v43, v44, v45, v46, v47, v48, v49, v50, v64, v65, v66, v67);
                    MEMORY[9](v68, v0);
                  }
                  else
                  {
                    sub_253DB4E78(v37, v36);
                    sub_253DB4F40();

                    uint64_t v58 = sub_253C10460();
                    v60(v58, v59);
                  }
                  sub_253DB5854();
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
                  sub_253BDF8DC();
                  sub_253C0FFFC();
                  __asm { BRAA            X1, X16 }
                }
                sub_253DB5B90();
                sub_253DB4FFC();
                sub_253DB4FFC();
                if (sub_253DEFE60())
                {
                  uint64_t v51 = sub_253DB5814();
                  v52(v51);
                  swift_retain();
                  sub_253DF0770();
                  uint64_t v53 = sub_253DB5948();
                  v54(v53);
                  sub_253DB59AC();
                  uint64_t v55 = (void *)sub_253DB5A20();
                  *(void *)(v1 + 440) = v55;
                  *uint64_t v55 = v1;
                  v55[1] = sub_253DAAE40;
                  sub_253DB5A0C();
                  sub_253C0FFFC();
                  __asm { BR              X1 }
                }
                uint64_t v18 = *(void *)(v1 + 232);
                sub_253DB4F40();
                uint64_t v3 = sub_253DB4F40();
                if (v22) {
                  goto LABEL_27;
                }
LABEL_29:
                if (__OFADD__(v23, 1)) {
                  goto LABEL_60;
                }
                sub_253DB5ED4();
                if (v12 != v13)
                {
                  uint64_t v0 = *(void *)(v1 + 408);
                  if (*(void *)(v0 + 64 + 8 * v24)) {
                    goto LABEL_33;
                  }
                  sub_253DB5F9C();
                  if (v12 != v13)
                  {
                    if (*(void *)(v30 + 8 * v31)) {
                      goto LABEL_33;
                    }
                    if (v28 + 2 < v29)
                    {
                      if (*(void *)(v30 + 8 * (v28 + 2))) {
                        goto LABEL_33;
                      }
                      uint64_t v32 = v28 + 3;
                      if (v32 < v29)
                      {
                        if (*(void *)(v30 + 8 * v32))
                        {
LABEL_33:
                          sub_253DB5BAC();
                          goto LABEL_28;
                        }
                        while (v23 + 5 < v29)
                        {
                          if (*(void *)(v0 + 104 + 8 * v23++)) {
                            goto LABEL_33;
                          }
                        }
                      }
                    }
                  }
                }
                uint64_t v25 = sub_253BDEDD8(&qword_26B255440);
                sub_253DB5E70(v25);
              }
            }
            if (!*(void *)(v14 + 8 * v16))
            {
              while (1)
              {
                uint64_t v6 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_61;
                }
                if (v6 >= v15) {
                  goto LABEL_26;
                }
                ++v16;
                if (*(void *)(v14 + 8 * v6)) {
                  goto LABEL_19;
                }
              }
            }
            uint64_t v6 = v16;
          }
        }
      }
    }
LABEL_19:
    sub_253DB5D98();
  }
  sub_253DB5F48(*(void *)(v1 + 280));
  sub_253C0FFFC();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DAAE40()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 216);
  uint64_t v3 = *(void *)(*v0 + 208);
  uint64_t v4 = *(void *)(*v0 + 200);
  uint64_t v5 = *v0;
  sub_253BDF858();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v7 = *(void *)(v1 + 312);
  uint64_t v8 = *(void *)(v1 + 304);
  return MEMORY[0x270FA2498](sub_253DAAFEC, v8, v7);
}

uint64_t sub_253DAAFEC()
{
  uint64_t v53 = v2;
  sub_253DB4F40();
  uint64_t result = sub_253DB4F40();
  uint64_t v4 = v2[52];
  uint64_t v5 = v2[53];
  if (!v5) {
    goto LABEL_4;
  }
LABEL_2:
  sub_253DB5C1C();
LABEL_3:
  sub_253DB5BE4();
  sub_253DB4FB0();
  sub_253DB5F7C();
  sub_253DB4FB0();
  sub_253DB5C60(v0);
  while (1)
  {
    sub_253DB5FB0();
    uint64_t v10 = sub_253BDEDD8(&qword_26B255440);
    sub_253C0FD54(v1, 1, v10);
    if (v11)
    {
      sub_253DB5CE0();
      swift_release();
      sub_253DF1770();
      sub_253DB4FB0();
      uint64_t v18 = sub_253DF2490();
      os_log_type_t v19 = sub_253DF5700();
      os_log_type_enabled(v18, v19);
      sub_253DB5B3C();
      if (v22)
      {
        uint64_t v51 = v1;
        uint64_t v23 = (uint8_t *)sub_253DB5AA0();
        uint64_t v52 = sub_253C0FF74();
        *(_DWORD *)uint64_t v23 = 136315138;
        sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
        uint64_t v24 = sub_253DF5C40();
        uint64_t v26 = sub_253D8E5FC(v24, v25, &v52);
        sub_253DB5E50(v26);
        swift_bridgeObjectRelease();
        sub_253DB4F40();
        _os_log_impl(&dword_253BD8000, v18, v19, "SessionClient %s deregistered.", v23, 0xCu);
        swift_arrayDestroy();
        sub_253BDF910();
        sub_253BDF910();

        sub_253DB5F1C(v27, v28, v29, v30, v31, v32, v33, v34, v47, v48, v49, v50);
        MEMORY[9](v10, v51);
      }
      else
      {
        sub_253DB4E78(v21, v20);
        sub_253DB4F40();

        uint64_t v42 = sub_253C10460();
        v44(v42, v43);
      }
      sub_253DB5854();
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
      sub_253BDF8DC();
      sub_253C0FFFC();
      __asm { BRAA            X1, X16 }
    }
    sub_253DB5B90();
    sub_253DB4FFC();
    sub_253DB4FFC();
    if (sub_253DEFE60())
    {
      uint64_t v35 = sub_253DB5814();
      v36(v35);
      swift_retain();
      sub_253DF0770();
      uint64_t v37 = sub_253DB5948();
      v38(v37);
      sub_253DB59AC();
      int64_t v39 = (void *)sub_253DB5A20();
      v2[55] = v39;
      *int64_t v39 = v2;
      v39[1] = sub_253DAAE40;
      sub_253DB5A0C();
      sub_253C0FFFC();
      __asm { BR              X1 }
    }
    uint64_t v0 = v2[29];
    sub_253DB4F40();
    uint64_t result = sub_253DB4F40();
    if (v5) {
      goto LABEL_2;
    }
LABEL_4:
    if (__OFADD__(v4, 1)) {
      break;
    }
    sub_253DB5ED4();
    if (v7 != v8)
    {
      uint64_t v1 = v2[51];
      if (*(void *)(v1 + 64 + 8 * v6)) {
        goto LABEL_8;
      }
      sub_253DB5F9C();
      if (v7 != v8)
      {
        if (*(void *)(v14 + 8 * v15)) {
          goto LABEL_8;
        }
        if (v12 + 2 < v13)
        {
          if (*(void *)(v14 + 8 * (v12 + 2))) {
            goto LABEL_8;
          }
          uint64_t v16 = v12 + 3;
          if (v16 < v13)
          {
            if (*(void *)(v14 + 8 * v16))
            {
LABEL_8:
              sub_253DB5BAC();
              goto LABEL_3;
            }
            while (v4 + 5 < v13)
            {
              if (*(void *)(v1 + 104 + 8 * v4++)) {
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
    uint64_t v9 = sub_253BDEDD8(&qword_26B255440);
    sub_253DB5E70(v9);
  }
  __break(1u);
  return result;
}

void sub_253DAB508()
{
  sub_253C1CED0();
  uint64_t v18 = v0;
  uint64_t v3 = v2;
  sub_253DF24A0();
  sub_253C0F830();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_253C16AA8();
  uint64_t v7 = sub_253BDEDD8(&qword_26B255410);
  uint64_t v8 = sub_253BDF9FC(v7);
  MEMORY[0x270FA5388](v8);
  sub_253C567FC();
  uint64_t v9 = sub_253DF0F90();
  sub_253C0F830();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  sub_253D7CCE8();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v17 - v14;
  sub_253C2E770(v3, v1, &qword_26B255410);
  sub_253C0FD54(v1, 1, v9);
  if (v16)
  {
    sub_253BEFAC0(v1, &qword_26B255410);
  }
  else
  {
    v17[4] = v5;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v15, v1, v9);
    sub_253DB19D0((uint64_t)v15, &v19);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v9);
  }
  sub_253C1CEE8();
}

void sub_253DAB858()
{
  sub_253C59954();
  v114 = v2;
  uint64_t v110 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = sub_253DF14C0();
  uint64_t v8 = sub_253BDF9FC(v7);
  MEMORY[0x270FA5388](v8);
  sub_253CA0118();
  MEMORY[0x270FA5388](v9);
  v109 = (char *)&v97 - v10;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v11);
  sub_253C33FFC();
  uint64_t v106 = v12;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v13);
  sub_253C36430();
  uint64_t v102 = v14;
  uint64_t v111 = sub_253DF08E0();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v15);
  sub_253C8F238();
  MEMORY[0x270FA5388](v16);
  sub_253C33FFC();
  uint64_t v107 = v17;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v18);
  sub_253C33FFC();
  uint64_t v104 = v19;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v20);
  sub_253C36430();
  uint64_t v103 = v21;
  sub_253DF24A0();
  sub_253C0F830();
  uint64_t v112 = v22;
  uint64_t v113 = v23;
  MEMORY[0x270FA5388](v22);
  sub_253D7CCE8();
  MEMORY[0x270FA5388](v24);
  sub_253C33FFC();
  uint64_t v108 = v25;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v26);
  v105 = (char *)&v97 - v27;
  sub_253C33FF0();
  MEMORY[0x270FA5388](v28);
  sub_253C36430();
  uint64_t v101 = v29;
  uint64_t v30 = sub_253BDEDD8(qword_26B2559E8);
  uint64_t v31 = sub_253BDF9FC(v30);
  MEMORY[0x270FA5388](v31);
  sub_253C10D28();
  uint64_t v34 = v33 - v32;
  uint64_t v35 = type metadata accessor for SessionSwitchboard.SessionInfo();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v36);
  sub_253D7B20C();
  sub_253D7F1B4(v4, *(void *)(v0 + 16), v34);
  sub_253C0FD54(v34, 1, v35);
  if (v37)
  {
    sub_253BEFAC0(v34, qword_26B2559E8);
    swift_endAccess();
    sub_253DF1770();
    sub_253D7CB9C();
    sub_253DB4FB0();
    sub_253DB4FB0();
    int v38 = sub_253DF2490();
    os_log_type_t v39 = sub_253DF56E0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (_DWORD *)sub_253D7C924();
      uint64_t v110 = sub_253D779E0();
      uint64_t v115 = v110;
      *uint64_t v40 = 136315394;
      sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
      uint64_t v41 = sub_253DF5C40();
      sub_253DB59E8(v41, v42);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      sub_253DB5CAC();
      uint64_t v43 = sub_253DEFE40();
      sub_253DB59E8(v43, v44);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      sub_253D789B4(&dword_253BD8000, v38, v39, "SessionClient %s is not allowed to observe non-existent session %s.");
      sub_253DB5A54();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      sub_253DB4F40();
      sub_253DB4F40();
    }

    sub_253BEFBCC();
    v46();
    uint64_t v47 = v114;
    LOBYTE(v115) = 0;
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    char v48 = 0;
    goto LABEL_26;
  }
  sub_253DB4FFC();
  swift_endAccess();
  sub_253DB5F3C();
  char v45 = sub_253DEFE60();
  if ((v45 & 1) == 0)
  {
    sub_253D7B20C();
    if (!*(void *)(*(void *)(v0 + 24) + 16) || (sub_253D87C3C(), (v49 & 1) == 0))
    {
      swift_endAccess();
      sub_253DF1770();
      sub_253DB4FB0();
      sub_253DB4FB0();
      uint64_t v66 = sub_253DF2490();
      os_log_type_t v67 = sub_253DF56E0();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = sub_253D7C924();
        uint64_t v110 = sub_253D779E0();
        uint64_t v115 = v110;
        *(_DWORD *)uint64_t v68 = 136315394;
        sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
        uint64_t v69 = sub_253DF5C40();
        uint64_t v71 = sub_253DB59E8(v69, v70);
        sub_253DB5A74(v71);
        swift_bridgeObjectRelease();
        sub_253DB4F40();
        *(_WORD *)(v68 + 12) = 2080;
        uint64_t v72 = sub_253DEFE40();
        sub_253DB59E8(v72, v73);
        sub_253DF5820();
        swift_bridgeObjectRelease();
        sub_253DB4F40();
        _os_log_impl(&dword_253BD8000, v66, v67, "Unknown SessionClient %s is not allowed to observe session %s.", (uint8_t *)v68, 0x16u);
        sub_253DB5A54();
        sub_253BDF910();
        sub_253BDF910();
      }
      else
      {
        sub_253DB4F40();
        sub_253DB4F40();
      }

      sub_253DB5A00();
      sub_253BEFBCC();
      v74();
      uint64_t v47 = v114;
      char v48 = 1;
      LOBYTE(v115) = 1;
      sub_253D2BEB4();
      swift_willThrowTypedImpl();
      goto LABEL_25;
    }
    uint64_t v107 = v6;
    sub_253DB5964();
    uint64_t v52 = *(char **)(v50 + 8);
    uint64_t v51 = *(void *)(v50 + 16);
    uint64_t v53 = *(void *)(v50 + 24);
    int v99 = *(unsigned __int8 *)(v50 + 32);
    uint64_t v54 = *(void *)(v50 + 40);
    uint64_t v55 = *(void *)(v50 + 48);
    swift_endAccess();
    sub_253D7B20C();
    uint64_t v56 = *(void *)(*(void *)(v0 + 24) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v108 = v55;
    swift_retain();
    v109 = v52;
    swift_bridgeObjectRetain();
    if (!v56 || (sub_253D87C3C(), (v57 & 1) == 0))
    {
      swift_endAccess();
      sub_253DF1770();
      sub_253DB4FB0();
      sub_253DB4FB0();
      v75 = sub_253DF2490();
      os_log_type_t v76 = sub_253DF56E0();
      if (os_log_type_enabled(v75, v76))
      {
        v77 = (_DWORD *)sub_253D7C924();
        uint64_t v78 = sub_253D779E0();
        uint64_t v100 = v53;
        uint64_t v115 = v78;
        _DWORD *v77 = 136315394;
        uint64_t v98 = v54;
        sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
        uint64_t v79 = sub_253DF5C40();
        uint64_t v81 = sub_253DB59E8(v79, v80);
        sub_253DB5B04(v81);
        sub_253DF5820();
        swift_bridgeObjectRelease();
        sub_253DB4F40();
        sub_253DB5CAC();
        uint64_t v82 = sub_253DEFE40();
        uint64_t v84 = sub_253DB59E8(v82, v83);
        sub_253DB5E28(v84);
        sub_253DF5820();
        swift_bridgeObjectRelease();
        sub_253DB4F40();
        sub_253D789B4(&dword_253BD8000, v75, v76, "SessionClient %s is not allowed to observe session %s because it has an unknown owning SessionClient.");
        swift_arrayDestroy();
        sub_253BDF910();
        sub_253BDF910();

        sub_253DB5A00();
      }
      else
      {
        sub_253DB4F40();
        sub_253DB4F40();

        sub_253DB5ACC();
      }
      sub_253BEFBCC();
      v85();
      uint64_t v47 = v114;
      char v48 = 1;
      LOBYTE(v115) = 1;
      sub_253D2BEB4();
      swift_willThrowTypedImpl();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
    uint64_t v98 = v54;
    uint64_t v100 = v53;
    sub_253DB5964();
    uint64_t v60 = v58[1];
    uint64_t v59 = v58[2];
    uint64_t v61 = v58[3];
    uint64_t v62 = v58[5];
    swift_endAccess();
    if (v61)
    {
      uint64_t v63 = v100;
      if (!v100)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v86 = v62;
        if (v99) {
          goto LABEL_31;
        }
LABEL_33:
        uint64_t v106 = v86;
        uint64_t v110 = v60;
        sub_253DF1770();
        sub_253DB4FB0();
        sub_253DB4FB0();
        v87 = sub_253DF2490();
        os_log_type_t v88 = sub_253DF56E0();
        if (os_log_type_enabled(v87, v88))
        {
          v89 = (_DWORD *)sub_253D7C924();
          uint64_t v107 = sub_253D779E0();
          uint64_t v115 = v107;
          _DWORD *v89 = 136315394;
          sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
          uint64_t v90 = sub_253DF5C40();
          uint64_t v92 = sub_253DB59E8(v90, v91);
          sub_253DB5A74(v92);
          swift_bridgeObjectRelease();
          sub_253DB4F40();
          sub_253DB5CAC();
          uint64_t v93 = sub_253DEFE40();
          uint64_t v95 = sub_253DB59E8(v93, v94);
          sub_253DB5E3C(v95);
          sub_253DF5820();
          swift_bridgeObjectRelease();
          sub_253DB4F40();
          sub_253D789B4(&dword_253BD8000, v87, v88, "SessionClient %s is not allowed to observe session %s.");
          swift_arrayDestroy();
          sub_253BDF910();
          sub_253BDF910();

          sub_253DB5A00();
        }
        else
        {
          sub_253DB4F40();
          sub_253DB4F40();

          sub_253DB5ACC();
        }
        sub_253BEFBCC();
        v96();
        uint64_t v47 = v114;
        char v48 = 4;
        LOBYTE(v115) = 4;
        sub_253D2BEB4();
        swift_willThrowTypedImpl();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_24:
        swift_bridgeObjectRelease();
LABEL_25:
        sub_253DB4F40();
LABEL_26:
        *uint64_t v47 = v48;
        goto LABEL_27;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      char v64 = MEMORY[0x25A26A560](v59, v61, v51, v63);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v65 = v64 | v99;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      char v65 = v99;
      if (!v100) {
        char v65 = 1;
      }
    }
    uint64_t v86 = v62;
    if (v65)
    {
LABEL_31:
      sub_253DB4F40();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  sub_253DB4F40();
LABEL_27:
  sub_253C5993C();
}

uint64_t sub_253DAC688()
{
  uint64_t v0 = sub_253DF14C0();
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  MEMORY[0x270FA5388](v2);
  uint64_t v37 = sub_253DF24A0();
  uint64_t v3 = *(void *)(v37 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v37);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v36 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v36 - v10;
  uint64_t v12 = sub_253BDEDD8(qword_26B2559E8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_253DEEE9C();
  swift_endAccess();
  uint64_t v15 = type metadata accessor for SessionSwitchboard.SessionInfo();
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v14, 1, v15) == 1)
  {
    sub_253BEFAC0((uint64_t)v14, qword_26B2559E8);
    sub_253DF1770();
    sub_253DB4FB0();
    uint64_t v16 = sub_253DF2490();
    os_log_type_t v17 = sub_253DF56F0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v39[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v20 = sub_253DEFE40();
      uint64_t v38 = sub_253D8E5FC(v20, v21, v39);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      _os_log_impl(&dword_253BD8000, v16, v17, "SessionCoordinator %s could not be popped.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2709B0](v19, -1, -1);
      MEMORY[0x25A2709B0](v18, -1, -1);
    }
    else
    {
      sub_253DB4F40();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v37);
  }
  else
  {
    swift_retain();
    sub_253DB4F40();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    swift_release();
    if (isUniquelyReferenced_nonNull_native)
    {
      sub_253DF1770();
      sub_253DB4FB0();
      uint64_t v23 = sub_253DF2490();
      os_log_type_t v24 = sub_253DF5700();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        v39[0] = v26;
        *(_DWORD *)uint64_t v25 = 136315138;
        uint64_t v27 = sub_253DEFE40();
        uint64_t v38 = sub_253D8E5FC(v27, v28, v39);
        sub_253DF5820();
        swift_bridgeObjectRelease();
        sub_253DB4F40();
        _os_log_impl(&dword_253BD8000, v23, v24, "SessionCoordinator %s removed. It was destroyed.", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2709B0](v26, -1, -1);
        MEMORY[0x25A2709B0](v25, -1, -1);
      }
      else
      {
        sub_253DB4F40();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v37);
    }
    else
    {
      sub_253DF1770();
      sub_253DB4FB0();
      uint64_t v30 = sub_253DF2490();
      os_log_type_t v31 = sub_253DF56E0();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        v39[0] = v33;
        *(_DWORD *)uint64_t v32 = 136315138;
        uint64_t v34 = sub_253DEFE40();
        uint64_t v38 = sub_253D8E5FC(v34, v35, v39);
        sub_253DF5820();
        swift_bridgeObjectRelease();
        sub_253DB4F40();
        _os_log_impl(&dword_253BD8000, v30, v31, "SessionCoordinator %s removed. The SessionCoordinator was held with non-exclusive ownership. Its destruction may be deferred.", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2709B0](v33, -1, -1);
        MEMORY[0x25A2709B0](v32, -1, -1);
      }
      else
      {
        sub_253DB4F40();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v37);
    }
  }
}

void (*sub_253DACD3C(void *a1))(uint64_t a1)
{
  uint64_t v2 = malloc(0x30uLL);
  *a1 = v2;
  uint64_t v3 = sub_253DF08E0();
  v2[4] = malloc(*(void *)(*(void *)(v3 - 8) + 64));
  sub_253DB4FB0();
  v2[5] = sub_253DB4428(v2);
  return sub_253DACDF0;
}

void sub_253DACDF0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void **)(*(void *)a1 + 32);
  uint64_t v3 = sub_253D78FF8();
  v4(v3);
  sub_253DB4F40();
  free(v2);

  free(v1);
}

void sub_253DACE54()
{
  sub_253C59954();
  uint64_t v32 = v3;
  sub_253DF24A0();
  sub_253C0F830();
  uint64_t v30 = v5;
  uint64_t v31 = v4;
  MEMORY[0x270FA5388](v4);
  sub_253C8F07C();
  sub_253DF08E0();
  sub_253C0F830();
  uint64_t v29 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  sub_253DB5DB0();
  MEMORY[0x270FA5388](v11);
  sub_253CE9D30();
  sub_253DAD2A8();
  if (v0)
  {
    sub_253DB5EE8();
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = v2;
    v28[0] = v10;
    v28[1] = v1;
    sub_253DB4FB0();
    sub_253DB5C88();
    uint64_t v13 = sub_253DACD3C(&v34);
    if (*(void *)(v12 + 8))
    {
      uint64_t v14 = v12;
      uint64_t v15 = v13;
      sub_253DB2DDC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_253DC4BA4);
      uint64_t v16 = *(void *)(*(void *)(v14 + 40) + 16);
      sub_253DB2E80(v16, (uint64_t (*)(BOOL))sub_253DC4BA4);
      *(void *)(*(void *)(v14 + 40) + 16) = v16 + 1;
      sub_253DB4FB0();
      uint64_t v17 = sub_253DB5DFC();
      v15(v17);
    }
    else
    {
      uint64_t v18 = sub_253DB5DFC();
      v19(v18);
    }
    swift_endAccess();
    sub_253DB4F40();
    sub_253DF1770();
    sub_253DB4FB0();
    sub_253DB4FB0();
    uint64_t v20 = sub_253DF2490();
    os_log_type_t v21 = sub_253DF5700();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = sub_253D7C924();
      uint64_t v29 = sub_253D779E0();
      uint64_t v34 = v29;
      *(_DWORD *)uint64_t v22 = 136315394;
      sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
      uint64_t v23 = sub_253DF5C40();
      uint64_t v35 = sub_253DB5EBC(v23, v24);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v25 = sub_253DF5C40();
      uint64_t v35 = sub_253DB5EBC(v25, v26);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      _os_log_impl(&dword_253BD8000, v20, v21, "SessionClient %s registered to observe SessionClient %s.", (uint8_t *)v22, 0x16u);
      sub_253D798A8();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      sub_253DB4F40();
      sub_253DB4F40();
    }

    sub_253BEFBCC();
    v27();
  }
  sub_253C5993C();
}

void sub_253DAD2A8()
{
  sub_253C59954();
  uint64_t v92 = v5;
  uint64_t v93 = v4;
  uint64_t v86 = v1;
  uint64_t v7 = v6;
  uint64_t v89 = sub_253DF08E0();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v8);
  sub_253DB5DB0();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  MEMORY[0x270FA5388](v10);
  sub_253C33FFC();
  os_log_type_t v88 = v11;
  sub_253C33FF0();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v13);
  v87 = &v77[-v14];
  sub_253C33FF0();
  MEMORY[0x270FA5388](v15);
  sub_253C36430();
  uint64_t v85 = v16;
  sub_253DF24A0();
  sub_253C0F830();
  uint64_t v90 = v17;
  uint64_t v91 = v18;
  MEMORY[0x270FA5388](v17);
  sub_253C8F238();
  MEMORY[0x270FA5388](v19);
  sub_253DB6000();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = &v77[-v21];
  sub_253D7B20C();
  if (!*(void *)(*(void *)(v0 + 24) + 16) || (sub_253D87C3C(), (v23 & 1) == 0))
  {
    swift_endAccess();
    sub_253DF1770();
    sub_253DB4FB0();
    sub_253DB4FB0();
    uint64_t v40 = sub_253DF2490();
    os_log_type_t v41 = sub_253DF56E0();
    if (sub_253DB5D04(v41))
    {
      unint64_t v42 = (_DWORD *)sub_253D7C924();
      uint64_t v93 = sub_253D779E0();
      uint64_t v94 = v93;
      *unint64_t v42 = 136315394;
      sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
      LODWORD(v88) = v3;
      v87 = v40;
      uint64_t v43 = sub_253DF5C40();
      uint64_t v45 = sub_253DB5994(v43, v44);
      sub_253DB5B04(v45);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      sub_253DB5CAC();
      uint64_t v46 = sub_253DF5C40();
      uint64_t v48 = sub_253DB5994(v46, v47);
      sub_253DB5E28(v48);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      char v49 = v87;
      sub_253D789B4(&dword_253BD8000, v87, (os_log_type_t)v88, "Unknown SessionClient %s is not allowed to observe SessionClient %s.");
      sub_253D798A8();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      sub_253DB4F40();
      sub_253DB4F40();
    }
    sub_253BEFBCC();
    v50();
    char v51 = 1;
    LOBYTE(v94) = 1;
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    goto LABEL_13;
  }
  uint64_t v81 = v22;
  os_log_t v82 = v7;
  sub_253DB5964();
  uint64_t v25 = *(NSObject **)(v24 + 8);
  uint64_t v80 = *(void *)(v24 + 16);
  uint64_t v26 = *(void *)(v24 + 24);
  int v27 = *(unsigned __int8 *)(v24 + 32);
  uint64_t v29 = *(void *)(v24 + 40);
  unint64_t v28 = *(NSObject **)(v24 + 48);
  swift_endAccess();
  sub_253D7B20C();
  uint64_t v30 = *(void *)(*(void *)(v0 + 24) + 16);
  uint64_t v83 = v26;
  uint64_t v31 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v84 = v25;
  swift_bridgeObjectRetain();
  if (!v30 || (sub_253D87C3C(), (v32 & 1) == 0))
  {
    swift_endAccess();
    sub_253DF1770();
    sub_253DB4FB0();
    sub_253DB4FB0();
    uint64_t v53 = sub_253DF2490();
    os_log_type_t v54 = sub_253DF56E0();
    if (sub_253DB5D04(v54))
    {
      uint64_t v55 = sub_253D7C924();
      v87 = v28;
      uint64_t v56 = v55;
      uint64_t v57 = sub_253D779E0();
      uint64_t v86 = v57;
      *(_DWORD *)uint64_t v56 = 136315394;
      uint64_t v93 = v56 + 4;
      uint64_t v94 = v57;
      sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
      LODWORD(v85) = v2;
      os_log_t v82 = v53;
      uint64_t v58 = sub_253DF5C40();
      uint64_t v60 = sub_253DB5994(v58, v59);
      sub_253DB5CB8(v60);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      uint64_t v93 = v29;
      sub_253DB4F40();
      *(_WORD *)(v56 + 12) = 2080;
      uint64_t v61 = sub_253DF5C40();
      uint64_t v63 = sub_253DB5994(v61, v62);
      sub_253DB5CD0(v63);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      os_log_t v64 = v82;
      _os_log_impl(&dword_253BD8000, v82, (os_log_type_t)v85, "SessionClient %s is not allowed to observe unknown SessionClient %s.", (uint8_t *)v56, 0x16u);
      sub_253D798A8();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      sub_253DB4F40();
      sub_253DB4F40();
    }
    sub_253BEFBCC();
    v65();
    uint64_t v52 = v92;
    char v51 = 1;
    LOBYTE(v94) = 1;
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_253DB5964();
  uint64_t v34 = v33[2];
  os_log_type_t v88 = v33[1];
  uint64_t v35 = v33[3];
  uint64_t v36 = v33[5];
  uint64_t v79 = v33[6];
  swift_endAccess();
  if (!v35)
  {
    int v38 = (int)v81;
    if (!v83)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    goto LABEL_22;
  }
  uint64_t v37 = v83;
  int v38 = (int)v81;
  if (v83)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    char v39 = MEMORY[0x25A26A560](v34, v35, v80, v37);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v84 = v88;
LABEL_30:
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
LABEL_22:
    if (v27)
    {
LABEL_23:
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v84 = v35;
      goto LABEL_30;
    }
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v27) {
    goto LABEL_23;
  }
LABEL_25:
  uint64_t v86 = v36;
  v87 = v28;
  sub_253DF1770();
  sub_253DB4FB0();
  sub_253DB4FB0();
  uint64_t v66 = sub_253DF2490();
  os_log_type_t v67 = sub_253DF56E0();
  if (sub_253DB5D04(v67))
  {
    uint64_t v68 = (_DWORD *)sub_253D7C924();
    uint64_t v69 = sub_253D779E0();
    uint64_t v93 = v31;
    uint64_t v94 = v69;
    uint64_t v80 = v69;
    *uint64_t v68 = 136315394;
    os_log_t v82 = v35;
    sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
    int v78 = v38;
    uint64_t v70 = sub_253DF5C40();
    uint64_t v72 = sub_253DB5994(v70, v71);
    sub_253DB5CB8(v72);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    sub_253DB4F40();
    sub_253DB5CAC();
    uint64_t v73 = sub_253DF5C40();
    uint64_t v75 = sub_253DB5994(v73, v74);
    sub_253DB5E3C(v75);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    sub_253DB4F40();
    sub_253D789B4(&dword_253BD8000, v66, (os_log_type_t)v78, "SessionClient %s is not allowed to observe SessionClient %s.");
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();
  }
  else
  {
    sub_253DB4F40();
    sub_253DB4F40();
  }

  sub_253DB5A00();
  sub_253BEFBCC();
  v76();
  char v51 = 4;
  LOBYTE(v94) = 4;
  sub_253D2BEB4();
  swift_willThrowTypedImpl();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  uint64_t v52 = v92;
LABEL_18:
  *uint64_t v52 = v51;
LABEL_19:
  sub_253C5993C();
}

void sub_253DADCFC()
{
  sub_253C59954();
  uint64_t v35 = v4;
  uint64_t v36 = v0;
  uint64_t v6 = v5;
  sub_253CD9958();
  sub_253DF24A0();
  sub_253C0F830();
  v34[3] = v8;
  v34[4] = v7;
  MEMORY[0x270FA5388](v7);
  sub_253C2F364();
  sub_253DF08E0();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v9);
  sub_253CA0118();
  MEMORY[0x270FA5388](v10);
  sub_253DB6000();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v34 - v12;
  uint64_t v14 = v6;
  sub_253DAD2A8();
  if (v0)
  {
    sub_253DB5EE8();
LABEL_11:
    sub_253C5993C();
    return;
  }
  uint64_t v35 = v1;
  uint64_t v36 = 0;
  v34[1] = v2;
  v34[2] = v3;
  sub_253DB4FB0();
  sub_253DB5C88();
  v34[0] = v13;
  uint64_t v15 = sub_253DACD3C(&v37);
  uint64_t v17 = v15;
  if (!*(void *)(v16 + 8))
  {
    uint64_t v23 = sub_253DB5DFC();
    v17(v23);
    swift_endAccess();
    goto LABEL_7;
  }
  uint64_t v18 = v16;
  MEMORY[0x270FA5388](v15);
  v34[-2] = v14;
  uint64_t v19 = v36;
  uint64_t v20 = sub_253DB4978((uint64_t (*)(unint64_t))sub_253DB2D64);
  uint64_t v21 = *(void *)(*(void *)(v18 + 40) + 16);
  if (v21 >= v20)
  {
    uint64_t v36 = v19;
    sub_253DB4D24(v20, v21);
    uint64_t v22 = sub_253DB5DFC();
    v17(v22);
    swift_endAccess();
LABEL_7:
    sub_253DB4F40();
    sub_253DF1770();
    sub_253DB4FB0();
    sub_253DB4FB0();
    uint64_t v24 = sub_253DF2490();
    os_log_type_t v25 = sub_253DF5700();
    int v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v27 = sub_253D7C924();
      LODWORD(v34[0]) = v26;
      uint64_t v28 = v27;
      uint64_t v35 = sub_253D779E0();
      uint64_t v37 = v35;
      *(_DWORD *)uint64_t v28 = 136315394;
      sub_253DB50E0(&qword_26B2553B0, MEMORY[0x263F4C718]);
      sub_253DB5F3C();
      uint64_t v29 = sub_253DF5C40();
      uint64_t v38 = sub_253DB5EBC(v29, v30);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      *(_WORD *)(v28 + 12) = 2080;
      uint64_t v31 = sub_253DF5C40();
      uint64_t v38 = sub_253DB5EBC(v31, v32);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      _os_log_impl(&dword_253BD8000, v24, v34[0], "SessionClient %s deregistered to observe SessionClient %s.", (uint8_t *)v28, 0x16u);
      sub_253DB5A54();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      sub_253DB4F40();
      sub_253DB4F40();
    }

    sub_253BEFBCC();
    v33();
    goto LABEL_11;
  }
  __break(1u);
}

uint64_t sub_253DAE13C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[75] = a6;
  v6[74] = a5;
  v6[73] = a4;
  v6[72] = a3;
  v6[71] = a2;
  uint64_t v7 = sub_253DF08E0();
  v6[76] = v7;
  v6[77] = *(void *)(v7 - 8);
  v6[78] = swift_task_alloc();
  v6[79] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553B8);
  v6[80] = swift_task_alloc();
  v6[81] = swift_task_alloc();
  uint64_t v8 = sub_253DF0EA0();
  v6[82] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[83] = v9;
  v6[84] = *(void *)(v9 + 64);
  v6[85] = swift_task_alloc();
  sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  v6[86] = swift_task_alloc();
  v6[87] = swift_task_alloc();
  v6[88] = swift_task_alloc();
  v6[89] = swift_task_alloc();
  v6[90] = swift_task_alloc();
  v6[91] = swift_task_alloc();
  v6[92] = swift_task_alloc();
  v6[93] = swift_task_alloc();
  v6[94] = swift_task_alloc();
  uint64_t v10 = sub_253DF0780();
  v6[95] = v10;
  v6[96] = *(void *)(v10 - 8);
  v6[97] = swift_task_alloc();
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  v6[98] = qword_26B2575F0;
  type metadata accessor for SessionControlActor();
  v6[99] = sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  swift_retain();
  uint64_t v12 = sub_253DF5480();
  v6[100] = v12;
  v6[101] = v11;
  return MEMORY[0x270FA2498](sub_253DAE45C, v12, v11);
}

void sub_253DAE45C()
{
  uint64_t v1 = *(void *)(v0 + 576);
  uint64_t v2 = type metadata accessor for SessionSwitchboard.SessionInfo();
  uint64_t v239 = v0;
  if (*(unsigned char *)(v1 + *(int *)(v2 + 28)) != 1
    || (sub_253DF0E80(),
        uint64_t v3 = sub_253C10460(),
        int v5 = v4(v3),
        int v6 = *MEMORY[0x263F4C398],
        uint64_t v7 = sub_253C10460(),
        v8(v7),
        v5 != v6))
  {
    uint64_t v196 = v2;
    uint64_t v197 = v0 + 464;
    uint64_t v195 = v0 + 560;
    uint64_t v50 = *(void *)(v0 + 736);
    uint64_t v51 = *(void *)(v0 + 680);
    uint64_t v52 = *(void *)(v0 + 672);
    uint64_t v53 = *(void *)(v239 + 664);
    uint64_t v54 = *(void *)(v239 + 656);
    uint64_t v55 = *(void *)(v239 + 600);
    uint64_t v56 = sub_253DF5500();
    uint64_t v57 = sub_253DB5DC0();
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v57, v58, v59, v56);
    sub_253BEFD38();
    v60();
    uint64_t v61 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v62 = (v61 + 88) & ~v61;
    uint64_t v223 = v61 | 7;
    uint64_t v225 = v62 + v52;
    uint64_t v63 = swift_allocObject();
    *(void *)(v63 + 16) = 0;
    *(void *)(v63 + 24) = 0;
    long long v64 = *(_OWORD *)v55;
    long long v65 = *(_OWORD *)(v55 + 16);
    long long v66 = *(_OWORD *)(v55 + 32);
    *(void *)(v63 + 80) = *(void *)(v55 + 48);
    *(_OWORD *)(v63 + 48) = v65;
    *(_OWORD *)(v63 + 64) = v66;
    *(_OWORD *)(v63 + 32) = v64;
    uint64_t v226 = v62;
    uint64_t v67 = v51;
    uint64_t v68 = v239;
    v221 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32);
    v221(v63 + v62, v67, v54);
    sub_253DB51E4(v55);
    sub_253DA8420(v50, (uint64_t)&unk_269D7E8C0, v63);
    sub_253BEFAC0(v50, (uint64_t *)&unk_26B2519E0);
    uint64_t v69 = *(void *)(v55 + 40);
    *(void *)(v239 + 560) = v69;
    uint64_t v70 = *(void *)(v69 + 16);
    uint64_t v234 = v56;
    if (v70)
    {
      uint64_t v236 = v239 + 16;
      uint64_t v209 = v239 + 488;
      sub_253DB5B58();
      uint64_t v73 = v71 + v72;
      uint64_t v75 = *(void *)(v74 + 72);
      uint64_t v198 = v56 - 8;
      v200 = v76;
      swift_bridgeObjectRetain();
      uint64_t v202 = MEMORY[0x263F8EE60] + 8;
      uint64_t v204 = v75;
      uint64_t v213 = v239 + 440;
      uint64_t v206 = v52;
      while (1)
      {
        uint64_t v77 = *(void *)(v68 + 608);
        sub_253DB4FB0();
        sub_253C6373C();
        _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v78, v79, v80, v77);
        uint64_t v81 = sub_253D9E3EC();
        sub_253C0FD54(v81, v82, v77);
        if (v83) {
          break;
        }
        sub_253DB4FFC();
        sub_253D7B20C();
        uint64_t v84 = *(void *)v52;
        if (*(void *)(*(void *)v52 + 16) && (unint64_t v85 = sub_253D87C3C(), (v86 & 1) != 0))
        {
          uint64_t v217 = *(void *)(v68 + 728);
          uint64_t v230 = *(void *)(v68 + 720);
          uint64_t v215 = *(void *)(v68 + 656);
          __n128 v87 = sub_253DB5B74(v85);
          sub_253DB5E08(v87, v88, v89);
          sub_253DB51E4(v236);
          sub_253DB4F40();
          uint64_t v90 = sub_253DB5DC0();
          _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v90, v91, v92, v56);
          sub_253BEFD38();
          v93();
          uint64_t v94 = swift_allocObject();
          sub_253DB5910(v94, v95, v96, v97, v98, v99, v100, v101, v195, v196, v197, v198, (uint64_t)v200, v202, v204, v206, v209, v213, v215,
            v217,
            (uint64_t)v221,
            v223,
            v225,
            v226);
          sub_253DB5A40();
          v102();
          sub_253C2E770(v218, v230, (uint64_t *)&unk_26B2519E0);
          int v103 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v230, 1, v56);
          sub_253DB51E4(v236);
          uint64_t v104 = *(void *)(v84 + 720);
          if (v103 == 1)
          {
            sub_253BEFAC0(v104, (uint64_t *)&unk_26B2519E0);
          }
          else
          {
            sub_253DF54F0();
            sub_253BEFBCC();
            v105();
          }
          uint64_t v52 = v206;
          if (*(void *)v68)
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            uint64_t v106 = sub_253DF5480();
            uint64_t v108 = v107;
            swift_unknownObjectRelease();
          }
          else
          {
            uint64_t v106 = 0;
            uint64_t v108 = 0;
          }
          uint64_t v68 = v239;
          uint64_t v109 = **(void **)(v239 + 568);
          uint64_t v110 = (void *)(v108 | v106);
          if (v108 | v106)
          {
            uint64_t v110 = v200;
            void *v200 = 0;
            v200[1] = 0;
            *(void *)(v239 + 288) = v106;
            *(void *)(v239 + 296) = v108;
          }
          uint64_t v111 = *(void *)(v239 + 728);
          *(void *)(v239 + 488) = 1;
          *(void *)(v239 + 496) = v110;
          *(void *)(v239 + 504) = v109;
          swift_task_create();
          swift_release();
          sub_253DB5238(v236);
          sub_253BEFAC0(v111, (uint64_t *)&unk_26B2519E0);
          uint64_t v75 = v204;
        }
        else
        {
          swift_endAccess();
          sub_253DB4F40();
        }
        v73 += v75;
        if (!--v70) {
          goto LABEL_55;
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_55:
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(*(void *)(v68 + 648), 1, 1, *(void *)(v68 + 608));
    }
    uint64_t v216 = v68 + 392;
    uint64_t v112 = *(void *)(v68 + 576);
    sub_253D76890(v195);
    uint64_t v113 = *(void *)(*(void *)(v112 + *(int *)(v196 + 24)) + 16);
    uint64_t v199 = *(void *)(v112 + *(int *)(v196 + 24));
    if (v113)
    {
      uint64_t v214 = v68 + 416;
      uint64_t v237 = v68 + 72;
      v203 = (void *)(v68 + 336);
      sub_253DB5B58();
      uint64_t v116 = v114 + v115;
      uint64_t v118 = *(void *)(v117 + 72);
      uint64_t v201 = v234 - 8;
      swift_bridgeObjectRetain();
      uint64_t v205 = MEMORY[0x263F8EE60] + 8;
      uint64_t v207 = v118;
      uint64_t v219 = v68 + 368;
      uint64_t v210 = v52;
      while (1)
      {
        uint64_t v119 = *(void *)(v68 + 608);
        sub_253DB4FB0();
        sub_253C6373C();
        _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v120, v121, v122, v119);
        uint64_t v123 = sub_253D9E3EC();
        sub_253C0FD54(v123, v124, v119);
        if (v83) {
          break;
        }
        sub_253DB4FFC();
        sub_253D7B20C();
        uint64_t v125 = *(void *)v52;
        if (*(void *)(*(void *)v52 + 16) && (unint64_t v126 = sub_253D87C3C(), (v127 & 1) != 0))
        {
          uint64_t v128 = *(void *)(v68 + 712);
          uint64_t v231 = *(void *)(v68 + 704);
          __n128 v129 = sub_253DB5B74(v126);
          sub_253DB5E08(v129, v130, v131);
          sub_253DB51E4(v237);
          sub_253DB4F40();
          _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v128, 1, 1, v234);
          sub_253D7CB9C();
          sub_253BEFD38();
          v132();
          uint64_t v133 = swift_allocObject();
          sub_253DB5910(v133, v134, v135, v136, v137, v138, v139, v140, v195, v196, v197, v199, v201, (uint64_t)v203, v205, v207, v210, v214, v216,
            v219,
            (uint64_t)v221,
            v223,
            v225,
            v226);
          sub_253DB5A40();
          v141();
          sub_253C2E770(v128, v231, (uint64_t *)&unk_26B2519E0);
          int v142 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v231, 1, v234);
          sub_253DB51E4(v237);
          uint64_t v143 = *(void *)(v125 + 704);
          if (v142 == 1)
          {
            sub_253BEFAC0(v143, (uint64_t *)&unk_26B2519E0);
          }
          else
          {
            sub_253DF54F0();
            sub_253BEFBCC();
            v144();
          }
          uint64_t v52 = v210;
          if (*(void *)v68)
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            uint64_t v145 = sub_253DF5480();
            uint64_t v147 = v146;
            swift_unknownObjectRelease();
          }
          else
          {
            uint64_t v145 = 0;
            uint64_t v147 = 0;
          }
          uint64_t v68 = v239;
          uint64_t v148 = **(void **)(v239 + 568);
          v149 = (void *)(v147 | v145);
          if (v147 | v145)
          {
            v149 = v203;
            void *v203 = 0;
            v203[1] = 0;
            *(void *)(v239 + 352) = v145;
            *(void *)(v239 + 360) = v147;
          }
          uint64_t v118 = v207;
          uint64_t v150 = *(void *)(v239 + 712);
          *(void *)(v239 + 416) = 1;
          *(void *)(v239 + 424) = v149;
          *(void *)(v239 + 432) = v148;
          swift_task_create();
          swift_release();
          sub_253DB5238(v237);
          sub_253BEFAC0(v150, (uint64_t *)&unk_26B2519E0);
        }
        else
        {
          swift_endAccess();
          sub_253DB4F40();
        }
        v116 += v118;
        if (!--v113) {
          goto LABEL_74;
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
LABEL_74:
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(*(void *)(v68 + 640), 1, 1, *(void *)(v68 + 608));
    }
    uint64_t v151 = v68 + 128;
    v208 = (void *)(v68 + 304);
    uint64_t v152 = *(void *)(v68 + 592);
    swift_bridgeObjectRelease();
    sub_253C10220();
    uint64_t v153 = *(void *)(v152 + 24);
    uint64_t v220 = v153 + 64;
    sub_253DB5C00();
    uint64_t v156 = v155 & v154;
    int64_t v232 = (unint64_t)(63 - v157) >> 6;
    swift_bridgeObjectRetain();
    int64_t v158 = 0;
    uint64_t v211 = v153;
    while (1)
    {
      if (v156)
      {
        sub_253DB5EFC();
        unint64_t v160 = v159 | (v158 << 6);
      }
      else
      {
        int64_t v161 = v158 + 1;
        if (__OFADD__(v158, 1))
        {
          __break(1u);
LABEL_117:
          __break(1u);
          goto LABEL_118;
        }
        if (v161 >= v232) {
          goto LABEL_108;
        }
        unint64_t v162 = *(void *)(v220 + 8 * v161);
        ++v158;
        if (!v162)
        {
          int64_t v158 = v161 + 1;
          sub_253DB5F70();
          if (v24 == v25) {
            goto LABEL_108;
          }
          sub_253DB5F10();
          if (!v162)
          {
            int64_t v158 = v163 + 2;
            sub_253DB5F70();
            if (v24 == v25) {
              goto LABEL_108;
            }
            sub_253DB5F10();
            if (!v162)
            {
              int64_t v158 = v164 + 3;
              sub_253DB5F70();
              if (v24 == v25) {
                goto LABEL_108;
              }
              sub_253DB5F10();
              if (!v162)
              {
                int64_t v166 = v165 + 4;
                if (v166 >= v232)
                {
LABEL_108:
                  uint64_t v185 = *(void *)(v68 + 792);
                  swift_release();
                  uint64_t v186 = qword_26B2575F0;
                  *(void *)(v68 + 840) = qword_26B2575F0;
                  sub_253DB5D50(dword_269D7E8D8);
                  v187 = (void *)swift_task_alloc();
                  *(void *)(v68 + 848) = v187;
                  void *v187 = v68;
                  v187[1] = sub_253DAF864;
                  uint64_t v188 = v186;
                  uint64_t v189 = v185;
LABEL_109:
                  ((void (*)(uint64_t, uint64_t))v239)(v188, v189);
                  return;
                }
                unint64_t v162 = *(void *)(v220 + 8 * v166);
                if (!v162)
                {
                  while (1)
                  {
                    int64_t v158 = v166 + 1;
                    if (__OFADD__(v166, 1)) {
                      break;
                    }
                    sub_253DB5F70();
                    if (v24 == v25) {
                      goto LABEL_108;
                    }
                    sub_253DB5F10();
                    int64_t v166 = v167 + 1;
                    if (v162) {
                      goto LABEL_97;
                    }
                  }
LABEL_118:
                  __break(1u);
                  goto LABEL_119;
                }
                int64_t v158 = v166;
              }
            }
          }
        }
LABEL_97:
        uint64_t v156 = (v162 - 1) & v162;
        unint64_t v160 = __clz(__rbit64(v162)) + (v158 << 6);
      }
      uint64_t v168 = *(void *)(v153 + 56) + 56 * v160;
      long long v169 = *(_OWORD *)v168;
      long long v170 = *(_OWORD *)(v168 + 16);
      long long v171 = *(_OWORD *)(v168 + 32);
      *(void *)(v151 + 48) = *(void *)(v168 + 48);
      *(_OWORD *)(v151 + 16) = v170;
      *(_OWORD *)(v151 + 32) = v171;
      *(_OWORD *)uint64_t v151 = v169;
      if (*(unsigned char *)(v68 + 160))
      {
        int64_t v238 = v158;
        uint64_t v172 = *(void *)(v68 + 696);
        uint64_t v173 = *(void *)(v68 + 688);
        _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v172, 1, 1, v234);
        sub_253D7CB9C();
        sub_253BEFD38();
        v174();
        uint64_t v175 = swift_allocObject();
        *(void *)(v175 + 16) = 0;
        *(void *)(v175 + 24) = 0;
        long long v176 = *(_OWORD *)(v151 + 16);
        *(_OWORD *)(v175 + 32) = *(_OWORD *)v151;
        *(_OWORD *)(v175 + 48) = v176;
        *(_OWORD *)(v175 + 64) = *(_OWORD *)(v151 + 32);
        *(void *)(v175 + 80) = *(void *)(v151 + 48);
        sub_253DB5A40();
        v177();
        sub_253C2E770(v172, v173, (uint64_t *)&unk_26B2519E0);
        LODWORD(v173) = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v173, 1, v234);
        sub_253DB51E4(v151);
        sub_253DB51E4(v151);
        if (v173 == 1)
        {
          sub_253BEFAC0(*(void *)(v68 + 688), (uint64_t *)&unk_26B2519E0);
        }
        else
        {
          sub_253DF54F0();
          sub_253BEFBCC();
          v178();
        }
        if (*(void *)(v175 + 16))
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v179 = sub_253DF5480();
          uint64_t v181 = v180;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v179 = 0;
          uint64_t v181 = 0;
        }
        uint64_t v68 = v239;
        uint64_t v153 = v211;
        uint64_t v182 = **(void **)(v239 + 568);
        v183 = (void *)(v181 | v179);
        if (v181 | v179)
        {
          v183 = v208;
          void *v208 = 0;
          v208[1] = 0;
          *(void *)(v239 + 320) = v179;
          *(void *)(v239 + 328) = v181;
        }
        int64_t v158 = v238;
        uint64_t v184 = *(void *)(v239 + 696);
        *(void *)(v239 + 392) = 1;
        *(void *)(v239 + 400) = v183;
        *(void *)(v239 + 408) = v182;
        swift_task_create();
        swift_release();
        sub_253DB5238(v151);
        sub_253BEFAC0(v184, (uint64_t *)&unk_26B2519E0);
      }
    }
  }
  sub_253DA85C0();
  if ((v9 & 1) == 0)
  {
    swift_release();
    sub_253D2BEB4();
    swift_allocError();
    unsigned char *v190 = 3;
    swift_willThrow();
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
    sub_253BDF8DC();
    v191();
    return;
  }
  uint64_t v10 = v0 + 184;
  v212 = (void *)(v0 + 240);
  uint64_t v11 = *(void *)(v0 + 664);
  uint64_t v12 = *(void *)(v0 + 592);
  sub_253C10220();
  uint64_t v227 = *(void *)(v12 + 24) + 64;
  sub_253DB5C00();
  uint64_t v15 = v14 & v13;
  int64_t v228 = (unint64_t)(63 - v16) >> 6;
  uint64_t v224 = v11;
  uint64_t v17 = swift_bridgeObjectRetain();
  int64_t v18 = 0;
  uint64_t v19 = 56;
  uint64_t v222 = v17;
  while (v15)
  {
    sub_253DB6014();
    unint64_t v21 = v20 | (v18 << 6);
LABEL_27:
    unint64_t v29 = *(void *)(v17 + 56) + v21 * v19;
    long long v30 = *(_OWORD *)v29;
    long long v31 = *(_OWORD *)(v29 + 16);
    long long v32 = *(_OWORD *)(v29 + 32);
    *(void *)(v10 + 48) = *(void *)(v29 + 48);
    *(_OWORD *)(v10 + 16) = v31;
    *(_OWORD *)(v10 + 32) = v32;
    *(_OWORD *)uint64_t v10 = v30;
    if (*(unsigned char *)(v0 + 216))
    {
      uint64_t v233 = v15;
      int64_t v235 = v18;
      uint64_t v33 = *(void *)(v239 + 752);
      uint64_t v229 = *(void *)(v239 + 744);
      uint64_t v34 = *(void *)(v239 + 680);
      uint64_t v35 = *(void *)(v239 + 656);
      uint64_t v36 = *(void *)(v239 + 584);
      uint64_t v37 = sub_253DF5500();
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v33, 1, 1, v37);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v224 + 16))(v34, v36, v35);
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = 0;
      *(void *)(v38 + 24) = 0;
      long long v39 = *(_OWORD *)(v10 + 16);
      *(_OWORD *)(v38 + 32) = *(_OWORD *)v10;
      *(_OWORD *)(v38 + 48) = v39;
      *(_OWORD *)(v38 + 64) = *(_OWORD *)(v10 + 32);
      *(void *)(v38 + 80) = *(void *)(v10 + 48);
      sub_253C10134();
      v40();
      sub_253C2E770(v33, v229, (uint64_t *)&unk_26B2519E0);
      uint64_t v41 = sub_253D9E3EC();
      LODWORD(v34) = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v41, v42, v37);
      sub_253DB51E4(v10);
      sub_253DB51E4(v10);
      if (v34 == 1)
      {
        sub_253BEFAC0(*(void *)(v239 + 744), (uint64_t *)&unk_26B2519E0);
      }
      else
      {
        sub_253DF54F0();
        sub_253BEFBCC();
        v43();
      }
      if (*(void *)(v38 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v44 = sub_253DF5480();
        uint64_t v46 = v45;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v44 = 0;
        uint64_t v46 = 0;
      }
      uint64_t v0 = v239;
      uint64_t v47 = **(void **)(v239 + 568);
      uint64_t v48 = (void *)(v46 | v44);
      if (v46 | v44)
      {
        uint64_t v48 = v212;
        void *v212 = 0;
        v212[1] = 0;
        *(void *)(v239 + 256) = v44;
        *(void *)(v239 + 264) = v46;
      }
      uint64_t v49 = *(void *)(v239 + 752);
      *(void *)(v239 + 536) = 1;
      *(void *)(v239 + 544) = v48;
      *(void *)(v239 + 552) = v47;
      swift_task_create();
      swift_release();
      sub_253DB5238(v10);
      sub_253BEFAC0(v49, (uint64_t *)&unk_26B2519E0);
      uint64_t v17 = v222;
      uint64_t v19 = 56;
      uint64_t v15 = v233;
      int64_t v18 = v235;
    }
  }
  int64_t v22 = v18 + 1;
  if (__OFADD__(v18, 1)) {
    goto LABEL_117;
  }
  if (v22 >= v228)
  {
LABEL_115:
    uint64_t v192 = *(void *)(v0 + 792);
    swift_release();
    uint64_t v193 = qword_26B2575F0;
    *(void *)(v0 + 816) = qword_26B2575F0;
    sub_253DB5D50(dword_269D7E8D8);
    v194 = (void *)swift_task_alloc();
    *(void *)(v0 + 824) = v194;
    void *v194 = v0;
    v194[1] = sub_253DAF658;
    uint64_t v188 = v193;
    uint64_t v189 = v192;
    goto LABEL_109;
  }
  unint64_t v23 = *(void *)(v227 + 8 * v22);
  ++v18;
  if (v23) {
    goto LABEL_26;
  }
  sub_253DB5FDC();
  if (v24 == v25) {
    goto LABEL_115;
  }
  sub_253DB5FD0();
  if (v23) {
    goto LABEL_26;
  }
  sub_253DB5FDC();
  if (v24 == v25) {
    goto LABEL_115;
  }
  sub_253DB5FD0();
  if (v23) {
    goto LABEL_26;
  }
  sub_253DB5FDC();
  if (v24 == v25) {
    goto LABEL_115;
  }
  sub_253DB5FD0();
  if (v23)
  {
LABEL_26:
    uint64_t v15 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
    goto LABEL_27;
  }
  int64_t v27 = v26 + 4;
  if (v27 >= v228) {
    goto LABEL_115;
  }
  unint64_t v23 = *(void *)(v227 + 8 * v27);
  if (v23)
  {
    int64_t v18 = v27;
    goto LABEL_26;
  }
  while (!__OFADD__(v27, 1))
  {
    sub_253DB5FDC();
    if (v24 == v25) {
      goto LABEL_115;
    }
    sub_253DB5FD0();
    int64_t v27 = v28 + 1;
    if (v23) {
      goto LABEL_26;
    }
  }
LABEL_119:
  __break(1u);
}

uint64_t sub_253DAF658()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v3 = v2;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_253BDF858();
  *int v6 = v5;
  *(void *)(v3 + 832) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_253DB5E9C();
    char v9 = sub_253DAF94C;
  }
  else
  {
    swift_release();
    sub_253DB5E9C();
    char v9 = sub_253DAF740;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_253DAF740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_253C10EE8();
  uint64_t v28 = v18[86];
  uint64_t v29 = v18[85];
  uint64_t v30 = v18[81];
  uint64_t v31 = v18[80];
  uint64_t v32 = v18[79];
  uint64_t v33 = v18[78];
  swift_release();
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
  sub_253C0FDF8();
  sub_253C10C94();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, a9, v28, v29, v30, v31, v32, v33, a16, a17, a18);
}

uint64_t sub_253DAF864()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v3 = v2;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_253BDF858();
  *int v6 = v5;
  *(void *)(v3 + 856) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_253DB5E9C();
    char v9 = sub_253DAFA3C;
  }
  else
  {
    swift_release();
    sub_253DB5E9C();
    char v9 = sub_253DB5810;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_253DAF94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_253C10EE8();
  swift_release();
  swift_release();
  sub_253DB588C();
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
  sub_253C10C94();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_253DAFA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_253C10EE8();
  swift_release();
  swift_release();
  sub_253DB588C();
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
  sub_253C10C94();
  return v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_253DAFB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_253DAFB4C, 0, 0);
}

uint64_t sub_253DAFB4C()
{
  sub_253BDF928();
  sub_253DB5C7C();
  uint64_t v1 = OBJC_IVAR____TtC23IntelligenceFlowRuntime20ClientSessionManager_clientProxy;
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v1;
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DB5D80();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DAFC38()
{
  sub_253BDF928();
  sub_253DB5974();
  swift_retain();
  uint64_t v0 = sub_253DB5984();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

void sub_253DAFC98()
{
  sub_253BDF928();
  if (*(void *)(v0 + 48))
  {
    uint64_t v1 = sub_253D0D534();
    uint64_t v2 = (void *)sub_253DB5D20(v1);
    *uint64_t v2 = v3;
    v2[1] = sub_253DAFD28;
    uint64_t v4 = sub_253DB58FC();
    v5(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_253DAFD28()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v3 = v2;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_253BDF858();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_253DB57EC, 0, 0);
  }
  else
  {
    swift_release();
    sub_253BDF8DC();
    return v7();
  }
}

uint64_t sub_253DAFE2C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  if (a1)
  {
    swift_getObjectType();
    uint64_t v4 = sub_253DF5480();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v3[5] = v4;
  v3[6] = v6;
  return MEMORY[0x270FA2498](sub_253DAFECC, v4, v6);
}

uint64_t sub_253DAFECC()
{
  sub_253BDF8D0();
  v0[7] = sub_253BDEDD8((uint64_t *)&unk_26B2564C0);
  if (sub_253DF5620())
  {
    sub_253C0FDF8();
    return v1();
  }
  else
  {
    v0[8] = 0;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[9] = v3;
    sub_253BDEDD8(&qword_26B256138);
    *uint64_t v3 = v0;
    v3[1] = sub_253DAFFE8;
    uint64_t v4 = sub_253DB5DE8();
    return MEMORY[0x270FA2048](v4);
  }
}

uint64_t sub_253DAFFE8()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v3 = v2;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_253BDF858();
  *uint64_t v6 = v5;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 40);
    uint64_t v8 = *(void *)(v3 + 48);
    uint64_t v9 = sub_253DB01EC;
  }
  else
  {
    *(unsigned char *)(v3 + 89) = *(unsigned char *)(v3 + 88);
    uint64_t v7 = *(void *)(v3 + 40);
    uint64_t v8 = *(void *)(v3 + 48);
    uint64_t v9 = sub_253DB00D0;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_253DB00D0()
{
  sub_253BDF8D0();
  if (*(unsigned char *)(v0 + 89))
  {
    uint64_t v1 = *(void *)(v0 + 64);
    if (sub_253DF5620())
    {
      if (v1) {
        swift_willThrow();
      }
      sub_253BDF8DC();
      return v2();
    }
    *(void *)(v0 + 64) = v1;
  }
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  sub_253BDEDD8(&qword_26B256138);
  *uint64_t v4 = v0;
  v4[1] = sub_253DAFFE8;
  uint64_t v5 = sub_253DB5DE8();
  return MEMORY[0x270FA2048](v5);
}

uint64_t sub_253DB01EC()
{
  sub_253BDF8D0();
  uint64_t v1 = (void *)v0[10];
  if (v0[8])
  {

    uint64_t v1 = (void *)v0[8];
  }
  if (sub_253DF5620())
  {
    if (v1) {
      swift_willThrow();
    }
    sub_253BDF8DC();
    return v2();
  }
  else
  {
    v0[8] = v1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[9] = v4;
    sub_253BDEDD8(&qword_26B256138);
    *uint64_t v4 = v0;
    v4[1] = sub_253DAFFE8;
    return MEMORY[0x270FA2048](v0 + 11);
  }
}

uint64_t sub_253DB0324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_253DB0344, 0, 0);
}

uint64_t sub_253DB0344()
{
  sub_253BDF928();
  sub_253DB5C7C();
  uint64_t v1 = OBJC_IVAR____TtC23IntelligenceFlowRuntime20ClientSessionManager_clientProxy;
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v1;
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DB5D80();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DB0430()
{
  sub_253BDF928();
  sub_253DB5974();
  swift_retain();
  uint64_t v0 = sub_253DB5984();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

void sub_253DB0490()
{
  sub_253BDF928();
  if (*(void *)(v0 + 48))
  {
    uint64_t v1 = sub_253D0D534();
    uint64_t v2 = (void *)sub_253DB5D20(v1);
    *uint64_t v2 = v3;
    v2[1] = sub_253DB0520;
    uint64_t v4 = sub_253DB58FC();
    v5(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_253DB0520()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v3 = v2;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_253BDF858();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_253DB0624, 0, 0);
  }
  else
  {
    swift_release();
    sub_253BDF8DC();
    return v7();
  }
}

uint64_t sub_253DB0624()
{
  sub_253BDF928();
  swift_release();
  sub_253BDF8DC();
  return v0();
}

uint64_t sub_253DB0680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_253DB06A0, 0, 0);
}

uint64_t sub_253DB06A0()
{
  sub_253BDF928();
  sub_253DB5C7C();
  uint64_t v1 = OBJC_IVAR____TtC23IntelligenceFlowRuntime20ClientSessionManager_clientProxy;
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v1;
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DB5D80();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DB078C()
{
  sub_253BDF928();
  sub_253DB5974();
  swift_retain();
  uint64_t v0 = sub_253DB5984();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

void sub_253DB07EC()
{
  sub_253BDF928();
  if (*(void *)(v0 + 48))
  {
    uint64_t v1 = sub_253D0D534();
    uint64_t v2 = (void *)sub_253DB5D20(v1);
    *uint64_t v2 = v3;
    v2[1] = sub_253DB087C;
    uint64_t v4 = sub_253DB58FC();
    v5(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_253DB087C()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v2 = *v1;
  sub_253BDF858();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  swift_release();
  if (v0) {

  }
  sub_253C0FDF8();
  return v4();
}

uint64_t sub_253DB0964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_253DB0984, 0, 0);
}

uint64_t sub_253DB0984()
{
  sub_253BDF928();
  sub_253DB5C7C();
  uint64_t v1 = OBJC_IVAR____TtC23IntelligenceFlowRuntime20ClientSessionManager_clientProxy;
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v1;
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DB5D80();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DB0A70()
{
  sub_253BDF928();
  sub_253DB5974();
  swift_retain();
  uint64_t v0 = sub_253DB5984();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

void sub_253DB0AD0()
{
  sub_253BDF928();
  if (*(void *)(v0 + 48))
  {
    uint64_t v1 = sub_253D0D534();
    uint64_t v2 = (void *)sub_253DB5D20(v1);
    *uint64_t v2 = v3;
    v2[1] = sub_253DB580C;
    uint64_t v4 = sub_253DB58FC();
    v5(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_253DB0B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_253DB0B80, 0, 0);
}

uint64_t sub_253DB0B80()
{
  sub_253BDF928();
  sub_253DB5C7C();
  uint64_t v1 = OBJC_IVAR____TtC23IntelligenceFlowRuntime20ClientSessionManager_clientProxy;
  *(void *)(v0 + 32) = v2;
  *(void *)(v0 + 40) = v1;
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DB50E0(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DB5D80();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_253DB0C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  sub_253C59954();
  a22 = v27;
  a23 = v28;
  uint64_t v30 = v29;
  uint64_t v42 = v31;
  uint64_t v43 = v32;
  uint64_t v33 = sub_253BDEDD8(&qword_26B255448);
  uint64_t v34 = sub_253BDF9FC(v33);
  MEMORY[0x270FA5388](v34);
  sub_253C2F364();
  sub_253BDEDD8(&qword_269D7E890);
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v35);
  sub_253C4BC10();
  uint64_t v36 = sub_253DF14C0();
  uint64_t v37 = sub_253BDF9FC(v36);
  MEMORY[0x270FA5388](v37);
  sub_253C16A90();
  swift_beginAccess();
  uint64_t v38 = *(void *)(v23 + 16);
  swift_bridgeObjectRetain();
  sub_253DA7CCC((uint64_t (*)(char *))sub_253DB57F0, v38, v26);
  swift_bridgeObjectRelease();
  uint64_t v39 = sub_253BDEDD8(&qword_26B255440);
  sub_253C0FD54(v26, 1, v39);
  if (v40)
  {
    sub_253BEFAC0(v26, &qword_26B255448);
    a13 = 0;
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    char v41 = 0;
  }
  else
  {
    sub_253DB4FFC();
    sub_253DB4FFC();
    sub_253DB4FFC();
    sub_253DB4F40();
    sub_253DB0EF8(v25, v42, v43, &a12);
    if (!v24)
    {
      sub_253DB4F40();
      goto LABEL_8;
    }
    char v41 = a12;
    sub_253DB4F40();
  }
  *uint64_t v30 = v41;
LABEL_8:
  sub_253C5993C();
}

unsigned char *sub_253DB0EF8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v10 = sub_253BDEDD8(qword_26B2559E8);
  uint64_t v11 = sub_253BDF9FC(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_253DB5C38();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v13);
  sub_253C16A90();
  sub_253DB10A0();
  if (v5)
  {
    char v14 = v17;
LABEL_6:
    *a4 = v14;
    return a4;
  }
  sub_253D7B20C();
  sub_253D7F1B4(a1, *(void *)(v4 + 16), v6);
  sub_253C0FD54(v6, 1, v12);
  if (v15)
  {
    sub_253BEFAC0(v6, qword_26B2559E8);
    swift_endAccess();
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    char v14 = 0;
    goto LABEL_6;
  }
  sub_253DB4FFC();
  swift_endAccess();
  a4 = *(unsigned char **)(v7 + *(int *)(v12 + 32));
  swift_retain();
  sub_253DB4F40();
  return a4;
}

void sub_253DB10A0()
{
  sub_253C59954();
  uint64_t v58 = v3;
  uint64_t v59 = v2;
  uint64_t v5 = v4;
  uint64_t v57 = v6;
  uint64_t v7 = sub_253DF14C0();
  uint64_t v8 = sub_253BDF9FC(v7);
  MEMORY[0x270FA5388](v8);
  sub_253C34050();
  sub_253C33FF0();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  MEMORY[0x270FA5388](v10);
  sub_253DF24A0();
  sub_253C0F830();
  MEMORY[0x270FA5388](v11);
  sub_253C34050();
  sub_253C33FF0();
  MEMORY[0x270FA5388](v12);
  sub_253DB5DB0();
  MEMORY[0x270FA5388](v13);
  sub_253CE9D30();
  uint64_t v14 = sub_253BDEDD8(qword_26B2559E8);
  uint64_t v15 = sub_253BDF9FC(v14);
  MEMORY[0x270FA5388](v15);
  sub_253C4BC10();
  uint64_t v16 = type metadata accessor for SessionSwitchboard.SessionInfo();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v17);
  sub_253C2F37C();
  sub_253D7B20C();
  sub_253D7F1B4(v5, *(void *)(v0 + 16), v1);
  sub_253C0FD54(v1, 1, v16);
  if (v18)
  {
    sub_253BEFAC0(v1, qword_26B2559E8);
    swift_endAccess();
    sub_253DF1770();
    sub_253DB4FB0();
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_253DF2490();
    os_log_type_t v20 = sub_253DF56E0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = sub_253D7C924();
      v60[0] = sub_253D779E0();
      *(_DWORD *)uint64_t v21 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_253DF0200();
      unint64_t v24 = v23;
      swift_bridgeObjectRelease();
      uint64_t v25 = sub_253D8E5FC(v22, v24, v60);
      sub_253DB5ADC(v25);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v26 = sub_253DEFE40();
      sub_253DB5994(v26, v27);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      _os_log_impl(&dword_253BD8000, v19, v20, "Group %s is not allowed to observe session %s.", (uint8_t *)v21, 0x16u);
      sub_253D798A8();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_253DB4F40();
    }

    sub_253BEFBCC();
    v43();
    uint64_t v44 = v58;
    LOBYTE(v60[0]) = 0;
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    char v45 = 0;
    goto LABEL_21;
  }
  sub_253DB4FFC();
  swift_endAccess();
  sub_253D7B20C();
  if (!*(void *)(*(void *)(v0 + 24) + 16) || (sub_253D87C3C(), (v28 & 1) == 0))
  {
    swift_endAccess();
    sub_253DF1770();
    sub_253DB4FB0();
    swift_bridgeObjectRetain_n();
    uint64_t v33 = sub_253DF2490();
    os_log_type_t v34 = sub_253DF56E0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = sub_253D7C924();
      v60[0] = sub_253D779E0();
      *(_DWORD *)uint64_t v35 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_253DF0200();
      unint64_t v38 = v37;
      swift_bridgeObjectRelease();
      uint64_t v39 = sub_253D8E5FC(v36, v38, v60);
      sub_253DB5ADC(v39);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 2080;
      uint64_t v40 = sub_253DEFE40();
      uint64_t v42 = sub_253DB5994(v40, v41);
      sub_253DB5CD0(v42);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      _os_log_impl(&dword_253BD8000, v33, v34, "Group %s is not allowed to observe session %s because it has an unknown owning SessionClient.", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      sub_253DB5A00();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_253DB4F40();

      sub_253DB5ACC();
    }
    sub_253BEFBCC();
    v46();
    char v45 = 1;
    LOBYTE(v60[0]) = 1;
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    sub_253DB4F40();
    uint64_t v44 = v58;
    goto LABEL_21;
  }
  sub_253DB5964();
  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v31 = *(void *)(v29 + 24);
  swift_endAccess();
  if (!v31)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  char v32 = MEMORY[0x25A26A560](v30, v31, v57, v59);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) == 0)
  {
LABEL_17:
    sub_253DF1770();
    sub_253DB4FB0();
    swift_bridgeObjectRetain_n();
    uint64_t v47 = sub_253DF2490();
    os_log_type_t v48 = sub_253DF56E0();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = sub_253D7C924();
      v60[0] = sub_253D779E0();
      *(_DWORD *)uint64_t v49 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_253DF0200();
      unint64_t v52 = v51;
      swift_bridgeObjectRelease();
      sub_253D8E5FC(v50, v52, v60);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      uint64_t v53 = sub_253DEFE40();
      uint64_t v55 = sub_253DB5994(v53, v54);
      sub_253DB5CD0(v55);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      sub_253DB4F40();
      _os_log_impl(&dword_253BD8000, v47, v48, "Group %s is not allowed to observe session %s.", (uint8_t *)v49, 0x16u);
      sub_253D798A8();
      sub_253BDF910();
      sub_253BDF910();

      sub_253DB5A00();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_253DB4F40();

      sub_253DB5ACC();
    }
    sub_253BEFBCC();
    v56();
    uint64_t v44 = v58;
    char v45 = 4;
    LOBYTE(v60[0]) = 4;
    sub_253D2BEB4();
    swift_willThrowTypedImpl();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_253DB4F40();
LABEL_21:
    *uint64_t v44 = v45;
    goto LABEL_22;
  }
  sub_253DB4F40();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_22:
  sub_253C5993C();
}

uint64_t sub_253DB19D0(uint64_t a1, unsigned char *a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 16);
  v8[2] = a1;
  swift_bridgeObjectRetain();
  char v6 = sub_253DA8138((uint64_t (*)(char *))sub_253DB4F90, (uint64_t)v8, v5);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6)
  {
    char v9 = 6;
    sub_253D2BEB4();
    uint64_t result = swift_willThrowTypedImpl();
    *a2 = 6;
  }
  return result;
}

void sub_253DB1A98()
{
  sub_253C59954();
  uint64_t v36 = v2;
  uint64_t v3 = sub_253DF0F90();
  sub_253C0F830();
  uint64_t v35 = v4;
  MEMORY[0x270FA5388](v5);
  sub_253C10D28();
  uint64_t v34 = v7 - v6;
  uint64_t v8 = sub_253BDEDD8(&qword_269D7E870);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  sub_253C16AA8();
  uint64_t v10 = sub_253BDEDD8(&qword_26B255410);
  uint64_t v11 = sub_253BDF9FC(v10);
  MEMORY[0x270FA5388](v11);
  sub_253C34050();
  uint64_t v37 = v12;
  sub_253C33FF0();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v34 - v15;
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v34 - v17;
  uint64_t v19 = sub_253BDEDD8(&qword_26B255440);
  uint64_t v20 = sub_253BDF9FC(v19);
  MEMORY[0x270FA5388](v20);
  sub_253C2F37C();
  uint64_t v22 = v1 + *(int *)(v21 + 56);
  uint64_t v23 = v35;
  sub_253DB4FB0();
  sub_253DB4FB0();
  uint64_t v24 = type metadata accessor for SessionSwitchboard.SessionInfo();
  sub_253C2E770(v22 + *(int *)(v24 + 20), (uint64_t)v18, &qword_26B255410);
  sub_253DB4F40();
  sub_253BEFD38();
  v25();
  sub_253C6373C();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v26, v27, v28, v3);
  uint64_t v29 = v0 + *(int *)(v9 + 56);
  sub_253C2E770((uint64_t)v18, v0, &qword_26B255410);
  sub_253C2E770((uint64_t)v16, v29, &qword_26B255410);
  sub_253C0FD54(v0, 1, v3);
  if (v31)
  {
    sub_253BEFAC0((uint64_t)v16, &qword_26B255410);
    sub_253BEFAC0((uint64_t)v18, &qword_26B255410);
    sub_253C0FD54(v29, 1, v3);
    if (v31) {
      uint64_t v30 = &qword_26B255410;
    }
    else {
      uint64_t v30 = &qword_269D7E870;
    }
  }
  else
  {
    sub_253C2E770(v0, v37, &qword_26B255410);
    sub_253C0FD54(v29, 1, v3);
    if (v31)
    {
      sub_253BEFAC0((uint64_t)v16, &qword_26B255410);
      sub_253BEFAC0((uint64_t)v18, &qword_26B255410);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v37, v3);
      uint64_t v30 = &qword_269D7E870;
    }
    else
    {
      uint64_t v32 = v34;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v34, v29, v3);
      sub_253DB50E0(&qword_269D7E878, MEMORY[0x263F4CAE0]);
      sub_253DF5250();
      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
      v33(v32, v3);
      uint64_t v30 = &qword_26B255410;
      sub_253BEFAC0((uint64_t)v16, &qword_26B255410);
      sub_253BEFAC0((uint64_t)v18, &qword_26B255410);
      v33(v37, v3);
    }
  }
  sub_253BEFAC0(v0, v30);
  sub_253DB4F40();
  sub_253C5993C();
}

uint64_t sub_253DB1E94()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_253DB1EBC()
{
  sub_253DB1E94();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for SessionSwitchboard()
{
  return self;
}

uint64_t destroy for SessionSwitchboard.ClientInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for SessionSwitchboard.ClientInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SessionSwitchboard.ClientInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SessionSwitchboard.ClientInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SessionSwitchboard.ClientInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionSwitchboard.ClientInfo(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionSwitchboard.ClientInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionSwitchboard.ClientInfo()
{
  return &type metadata for SessionSwitchboard.ClientInfo;
}

void *sub_253DB2190(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_253DEFE90();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_253DF0F90();
    if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = sub_253BDEDD8(&qword_26B255410);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    *(void *)((char *)v4 + a3[6]) = *(void *)((char *)a2 + a3[6]);
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    *(void *)((char *)v4 + a3[8]) = *(void *)((char *)a2 + a3[8]);
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_253DB2324(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_253DF0F90();
  if (!_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_253DB2404(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_253DF0F90();
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_253BDEDD8(&qword_26B255410);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_253DB254C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_253DF0F90();
  int v11 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v8, 1, v10);
  int v12 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v9, 1, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_253BDEDD8(&qword_26B255410);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v8, 0, 1, v10);
LABEL_7:
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_253DB2734(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_253DF0F90();
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_253BDEDD8(&qword_26B255410);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_253DB2870(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_253DF0F90();
  int v11 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v8, 1, v10);
  int v12 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v9, 1, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_253BDEDD8(&qword_26B255410);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v8, 0, 1, v10);
LABEL_7:
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  swift_release();
  return a1;
}

uint64_t sub_253DB2A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253DB2A58);
}

uint64_t sub_253DB2A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_253DF08E0();
  sub_253C16A18();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v9, a2, v8);
  }
  sub_253BDEDD8(&qword_26B255410);
  sub_253C16A18();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_253DB2B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253DB2B24);
}

void sub_253DB2B24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_253DF08E0();
  sub_253C16A18();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_253BDEDD8(&qword_26B255410);
    sub_253C16A18();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v11, a2, a2, v10);
}

uint64_t type metadata accessor for SessionSwitchboard.SessionInfo()
{
  uint64_t result = qword_26B2559D8;
  if (!qword_26B2559D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_253DB2C20()
{
  sub_253DEFE90();
  if (v0 <= 0x3F)
  {
    sub_253DB2D0C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_253DB2D0C()
{
  if (!qword_26B255418)
  {
    sub_253DF0F90();
    unint64_t v0 = sub_253DF5810();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B255418);
    }
  }
}

uint64_t sub_253DB2D64()
{
  return sub_253DEFE60() & 1;
}

uint64_t sub_253DB2D94()
{
  return sub_253DB2DDC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_253DC3F5C);
}

uint64_t sub_253DB2DAC()
{
  return sub_253DB2DDC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_253DC4B5C);
}

uint64_t sub_253DB2DC4()
{
  return sub_253DB2DDC((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_253DC4BEC);
}

uint64_t sub_253DB2DDC(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_253DB2E38(uint64_t a1)
{
  return sub_253DB2E80(a1, (uint64_t (*)(BOOL))sub_253DC3F5C);
}

uint64_t sub_253DB2E50(uint64_t a1)
{
  return sub_253DB2E80(a1, (uint64_t (*)(BOOL))sub_253DC4B5C);
}

uint64_t sub_253DB2E68(uint64_t a1)
{
  return sub_253DB2E80(a1, (uint64_t (*)(BOOL))sub_253DC4BEC);
}

uint64_t sub_253DB2E80(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_253DB2ECC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_253DB2F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_253DB318C(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_253DB2F94(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  swift_isUniquelyReferenced_nonNull_native();
  sub_253DB5B20();
  a3(a1, a2);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_253DB3010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_253DB3984(a1, a2, a3);
  *uint64_t v3 = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_253DB30A0(long long *a1)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v4 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  sub_253DB3AA4(a1);
  *uint64_t v1 = v4;

  return swift_bridgeObjectRelease();
}

uint64_t sub_253DB3120(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  sub_253DB5B20();
  sub_253DB3C38(a1, a2);
  *uint64_t v2 = v6;

  return swift_bridgeObjectRelease();
}

uint64_t sub_253DB318C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_253D87918(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_253BDEDD8(&qword_269D7E910);
  if ((sub_253DF5A70() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v13 = sub_253D87918(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_13:
    uint64_t result = sub_253DF5CF0();
    __break(1u);
    return result;
  }
  unint64_t v11 = v13;
LABEL_5:
  uint64_t v15 = *v4;
  if (v12)
  {
    uint64_t v16 = v15[7];
    uint64_t v17 = sub_253DF3C00();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
    uint64_t v20 = v17;
    uint64_t v21 = v16 + *(void *)(v18 + 72) * v11;
    return v19(v21, a1, v20);
  }
  else
  {
    sub_253DB3DC8(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_253DB32F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = sub_253DEFFE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v10 = (void *)*v2;
  sub_253D87ADC();
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_253BDEDD8(&qword_269D7E918);
  if ((sub_253DF5A70() & 1) == 0) {
    goto LABEL_5;
  }
  sub_253D87ADC();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_11:
    uint64_t result = sub_253DF5CF0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v3;
  if (v14)
  {
    uint64_t v18 = v17[7];
    uint64_t v19 = sub_253DF4BA0();
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 40);
    uint64_t v22 = v19;
    uint64_t v23 = v18 + *(void *)(v20 + 72) * v13;
    return v21(v23, a1, v22);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_253DB3E78(v13, (uint64_t)v9, a1, v17);
  }
}

void sub_253DB34E8()
{
  sub_253C1CED0();
  uint64_t v3 = v1;
  uint64_t v5 = v4;
  sub_253CD9958();
  uint64_t v6 = sub_253DEFFE0();
  sub_253C0F830();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_253C16A90();
  uint64_t v10 = *v1;
  sub_253D87ADC();
  if (__OFADD__(*(void *)(v10 + 16), (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_253BDEDD8(&qword_269D7C8D0);
  if (sub_253DF5A70())
  {
    sub_253D87ADC();
    if ((v14 & 1) == (v16 & 1))
    {
      unint64_t v13 = v15;
      goto LABEL_5;
    }
LABEL_10:
    sub_253DF5CF0();
    __break(1u);
    return;
  }
LABEL_5:
  uint64_t v17 = *v3;
  if (v14)
  {
    uint64_t v18 = *(void *)(v17 + 56);
    swift_bridgeObjectRelease();
    *(void *)(v18 + 8 * v13) = v0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v2, v5, v6);
    sub_253DB3F6C(v13, v2, v0, v17);
  }
  sub_253C1CEE8();
}

uint64_t sub_253DB362C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_253DF14C0();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  uint64_t v10 = sub_253D87CBC(a2);
  if (__OFADD__(*(void *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v12 = v10;
  char v13 = v11;
  sub_253BDEDD8(&qword_26B2561C8);
  if ((sub_253DF5A70() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v14 = sub_253D87CBC(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_10:
    uint64_t result = sub_253DF5CF0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v14;
LABEL_5:
  uint64_t v16 = *v3;
  if (v13)
  {
    type metadata accessor for SessionSwitchboard.SessionInfo();
    return sub_253DB5050();
  }
  else
  {
    sub_253DB4FB0();
    return sub_253DB4018(v12, (uint64_t)v8, a1, v16);
  }
}

uint64_t sub_253DB37C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_253DEFE90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_253D87B8C();
  if (__OFADD__(*(void *)(v10 + 16), (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_253BDEDD8(&qword_269D7E880);
  if ((sub_253DF5A70() & 1) == 0) {
    goto LABEL_5;
  }
  sub_253D87B8C();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    uint64_t result = sub_253DF5CF0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v3;
  if (v14)
  {
    type metadata accessor for SessionCoordinatorInjectionRequest(0);
    return sub_253DB5050();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_253DB4104(v13, (uint64_t)v9, a1, v17);
  }
}

uint64_t sub_253DB3984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_253D87984(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v11 = v9;
  char v12 = v10;
  sub_253BDEDD8(&qword_26B2561D0);
  uint64_t result = sub_253DF5A70();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_253D87984(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_11:
    uint64_t result = sub_253DF5CF0();
    __break(1u);
    return result;
  }
  unint64_t v11 = result;
LABEL_5:
  unint64_t v15 = *v4;
  if (v12)
  {
    *(void *)(v15[7] + 8 * v11) = a1;
  }
  else
  {
    sub_253DB41F4(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_253DB3AA4(long long *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_253DF08E0();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  unint64_t v8 = sub_253D87C3C();
  if (__OFADD__(*(void *)(v7 + 16), (v9 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v10 = v8;
  char v11 = v9;
  sub_253BDEDD8(&qword_26B2561C0);
  if ((sub_253DF5A70() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v12 = sub_253D87C3C();
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_11:
    uint64_t result = sub_253DF5CF0();
    __break(1u);
    return result;
  }
  unint64_t v10 = v12;
LABEL_5:
  uint64_t v14 = *v2;
  if (v11)
  {
    uint64_t v15 = *(void *)(v14 + 56) + 56 * v10;
    return sub_253DB50A8((uint64_t)a1, v15);
  }
  else
  {
    sub_253DB4FB0();
    return sub_253DB423C(v10, (uint64_t)v6, a1, v14);
  }
}

uint64_t sub_253DB3C38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v6 = sub_253DEFE90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = (void *)*v2;
  sub_253D87B8C();
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v13 = v11;
  char v14 = v12;
  sub_253BDEDD8(&qword_269D7E898);
  if ((sub_253DF5A70() & 1) == 0) {
    goto LABEL_5;
  }
  sub_253D87B8C();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    uint64_t result = sub_253DF5CF0();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  uint64_t v17 = *v3;
  if (v14)
  {
    uint64_t v18 = v17[7];
    uint64_t result = swift_release();
    *(void *)(v18 + 8 * v13) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_253DB430C(v13, (uint64_t)v9, a1, v17);
  }
  return result;
}

uint64_t sub_253DB3DC8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_253DF3C00();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

uint64_t sub_253DB3E78(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_253DEFFE0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_253DF4BA0();
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

uint64_t sub_253DB3F6C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 8 * (a1 >> 6) + 64) |= 1 << a1;
  sub_253DEFFE0();
  sub_253BDF7F0();
  sub_253C10134();
  uint64_t result = v7();
  *(void *)(*(void *)(a4 + 56) + 8 * a1) = a3;
  uint64_t v9 = *(void *)(a4 + 16);
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    *(void *)(a4 + 16) = v11;
  }
  return result;
}

uint64_t sub_253DB4018(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 8 * (a1 >> 6) + 64) |= 1 << a1;
  sub_253DF14C0();
  sub_253DB4FFC();
  type metadata accessor for SessionSwitchboard.SessionInfo();
  uint64_t result = sub_253DB4FFC();
  uint64_t v6 = *(void *)(a4 + 16);
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    *(void *)(a4 + 16) = v8;
  }
  return result;
}

uint64_t sub_253DB4104(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a4 + 8 * (a1 >> 6) + 64) |= 1 << a1;
  uint64_t v7 = *(void *)(a4 + 48);
  uint64_t v8 = sub_253DEFE90();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a2, v8);
  type metadata accessor for SessionCoordinatorInjectionRequest(0);
  uint64_t result = sub_253DB4FFC();
  uint64_t v10 = *(void *)(a4 + 16);
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    *(void *)(a4 + 16) = v12;
  }
  return result;
}

unint64_t sub_253DB41F4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_253DB423C(unint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  *(void *)(a4 + 8 * (a1 >> 6) + 64) |= 1 << a1;
  sub_253DF08E0();
  uint64_t result = sub_253DB4FFC();
  uint64_t v8 = *(void *)(a4 + 56) + 56 * a1;
  *(void *)(v8 + 48) = *((void *)a3 + 6);
  long long v9 = a3[2];
  long long v10 = *a3;
  *(_OWORD *)(v8 + 16) = a3[1];
  *(_OWORD *)(v8 + 32) = v9;
  *(_OWORD *)uint64_t v8 = v10;
  uint64_t v11 = *(void *)(a4 + 16);
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    *(void *)(a4 + 16) = v13;
  }
  return result;
}

uint64_t sub_253DB430C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_253DEFE90();
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

uint64_t sub_253DB43C4()
{
  return sub_253DC3D34();
}

void sub_253DB43D8()
{
}

uint64_t sub_253DB43EC(uint64_t a1)
{
  return sub_253DC3F14(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_253DB4400(uint64_t a1)
{
  return sub_253DC4BA4(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_253DB4414(uint64_t a1)
{
  return sub_253DC4D94(0, *(void *)(a1 + 16), 0, a1);
}

void (*sub_253DB4428(void *a1))(uint64_t a1)
{
  uint64_t v2 = malloc(0x58uLL);
  *a1 = v2;
  uint64_t v3 = sub_253DF08E0();
  uint64_t v4 = malloc(*(void *)(*(void *)(v3 - 8) + 64));
  v2[8] = v4;
  swift_isUniquelyReferenced_nonNull_native();
  sub_253DB4FB0();
  v2[9] = sub_253DB4734(v2);
  v2[10] = sub_253DB458C(v2 + 4, (uint64_t)v4);
  return sub_253DB4508;
}

void sub_253DB4508(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 72);
  uint64_t v3 = *(void **)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 80))();
  sub_253DB4F40();
  uint64_t v4 = sub_253D78FF8();
  v2(v4);
  free(v3);

  free(v1);
}

void (*sub_253DB458C(void *a1, uint64_t a2))(uint64_t **a1)
{
  uint64_t v3 = v2;
  uint64_t v6 = (char *)malloc(0x58uLL);
  *a1 = v6;
  *((void *)v6 + 7) = a2;
  *((void *)v6 + 8) = v2;
  uint64_t v7 = *v2;
  unint64_t v8 = sub_253D87C3C();
  v6[80] = v9 & 1;
  if (__OFADD__(*(void *)(v7 + 16), (v9 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v10 = v8;
  char v11 = v9;
  sub_253BDEDD8(&qword_26B2561C0);
  if (sub_253DF5A70())
  {
    unint64_t v12 = sub_253D87C3C();
    if ((v11 & 1) == (v13 & 1))
    {
      unint64_t v10 = v12;
      goto LABEL_5;
    }
LABEL_10:
    sub_253DF08E0();
    uint64_t result = (void (*)(uint64_t **))sub_253DF5CF0();
    __break(1u);
    return result;
  }
LABEL_5:
  *((void *)v6 + 9) = v10;
  if (v11)
  {
    uint64_t v14 = *(void *)(*v3 + 56) + 56 * v10;
    uint64_t v15 = *(void *)v14;
    uint64_t v16 = *(void *)(v14 + 8);
    long long v17 = *(_OWORD *)(v14 + 16);
    uint64_t v18 = *(unsigned __int8 *)(v14 + 32);
    long long v19 = *(_OWORD *)(v14 + 40);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    long long v17 = 0uLL;
    long long v19 = 0uLL;
  }
  *(void *)uint64_t v6 = v15;
  *((void *)v6 + 1) = v16;
  *((_OWORD *)v6 + 1) = v17;
  *((void *)v6 + 4) = v18;
  *(_OWORD *)(v6 + 40) = v19;
  return sub_253DB46D8;
}

void sub_253DB46D8(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_253DB4770(*a1, *((unsigned char *)*a1 + 80), (uint64_t *)(*a1)[8], (*a1)[9], (*a1)[7]);
  sub_253DB4E78(*v1, v1[1]);

  free(v1);
}

uint64_t (*sub_253DB4734(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_253DB4764;
}

uint64_t sub_253DB4764(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_253DB4770(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v24 = a5;
  unint64_t v25 = a4;
  uint64_t v8 = sub_253DF08E0();
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = a1[2];
  uint64_t v14 = a1[3];
  uint64_t v15 = a1[4];
  uint64_t v16 = a1[5];
  uint64_t v17 = a1[6];
  if (v12)
  {
    *(void *)&long long v26 = v11;
    *((void *)&v26 + 1) = v12;
    *(void *)&long long v27 = v13;
    *((void *)&v27 + 1) = v14;
    LOBYTE(v28) = v15 & 1;
    *((void *)&v28 + 1) = v16;
    uint64_t v29 = v17;
    uint64_t v18 = *a3;
    if (a2)
    {
      unint64_t v19 = *(void *)(v18 + 56) + 56 * v25;
      long long v20 = v27;
      *(_OWORD *)unint64_t v19 = v26;
      *(_OWORD *)(v19 + 16) = v20;
      *(_OWORD *)(v19 + 32) = v28;
      *(void *)(v19 + 48) = v29;
    }
    else
    {
      uint64_t v21 = v11;
      sub_253DB4FB0();
      sub_253DB423C(v25, (uint64_t)v10, &v26, v18);
      uint64_t v11 = v21;
    }
  }
  else if (a2)
  {
    uint64_t v24 = v11;
    swift_arrayDestroy();
    sub_253DB50E0(&qword_26B2553A0, MEMORY[0x263F4C718]);
    sub_253DF5A90();
    uint64_t v11 = v24;
  }
  return sub_253DB4EDC(v11, v12);
}

uint64_t sub_253DB4978(uint64_t (*a1)(unint64_t))
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_253DF08E0() - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v33 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v32 = (char *)v30 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v34 = (char *)v30 - v11;
  uint64_t v12 = *v1;
  uint64_t v13 = *(void *)(*v1 + 16);
  if (!v13) {
    return 0;
  }
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v10 + 72);
  swift_bridgeObjectRetain();
  unint64_t v16 = 0;
  v30[1] = v14;
  while (1)
  {
    char v17 = a1(v12 + v14);
    if (v2)
    {
      swift_bridgeObjectRelease();
      return v16;
    }
    if (v17) {
      break;
    }
    ++v16;
    v14 += v15;
    if (v13 == v16)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v12 + 16);
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v16, 1))
  {
    unint64_t v19 = *(void *)(v12 + 16);
    if (v16 + 1 == v19) {
      return v16;
    }
    uint64_t v20 = v15 + v14;
    unint64_t v21 = v16 + 1;
    v30[0] = v1;
    uint64_t v31 = v15;
    while (v21 < v19)
    {
      uint64_t v22 = v3;
      uint64_t v35 = v20;
      uint64_t v23 = v34;
      sub_253DB4FB0();
      char v24 = a1((unint64_t)v23);
      uint64_t result = sub_253DB4F40();
      if (v24)
      {
        uint64_t v3 = v22;
        uint64_t v25 = v31;
      }
      else
      {
        uint64_t v3 = v22;
        uint64_t v25 = v31;
        if (v21 != v16)
        {
          if ((v16 & 0x8000000000000000) != 0) {
            goto LABEL_32;
          }
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(*v3 + 16);
          if (v16 >= v27) {
            goto LABEL_33;
          }
          uint64_t result = sub_253DB4FB0();
          if (v21 >= v27) {
            goto LABEL_34;
          }
          sub_253DB4FB0();
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v3 = (uint64_t *)v30[0];
          *(void *)v30[0] = v26;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_253DB4400(v26);
            uint64_t v26 = result;
            *uint64_t v3 = result;
          }
          if (v16 >= *(void *)(v26 + 16)) {
            goto LABEL_35;
          }
          uint64_t result = sub_253DB5050();
          if (v21 >= *(void *)(*v3 + 16)) {
            goto LABEL_36;
          }
          uint64_t result = sub_253DB5050();
        }
        if (__OFADD__(v16++, 1)) {
          goto LABEL_31;
        }
      }
      unint64_t v29 = v21 + 1;
      if (__OFADD__(v21, 1)) {
        goto LABEL_30;
      }
      unint64_t v19 = *(void *)(*v3 + 16);
      ++v21;
      uint64_t v20 = v35 + v25;
      if (v29 == v19) {
        return v16;
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

void sub_253DB4D24(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v7 = a1 - a2;
  if (__OFSUB__(0, v6))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v8 = v5 - v6;
  if (__OFADD__(v5, v7))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v8 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v8) {
      uint64_t v10 = v5 + v7;
    }
    else {
      uint64_t v10 = v5;
    }
    uint64_t v4 = sub_253DC4BA4(isUniquelyReferenced_nonNull_native, v10, 1, v4);
  }
  uint64_t v11 = *(void *)(sub_253DF08E0() - 8);
  unint64_t v12 = v4 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v13 = *(void *)(v11 + 72);
  swift_arrayDestroy();
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v14 = *(void *)(v4 + 16);
  if (__OFSUB__(v14, a2)) {
    goto LABEL_22;
  }
  sub_253DC5D98(v12 + v13 * a2, v14 - a2);
  uint64_t v15 = *(void *)(v4 + 16);
  BOOL v16 = __OFADD__(v15, v7);
  uint64_t v17 = v15 - v6;
  if (!v16)
  {
    *(void *)(v4 + 16) = v17;
LABEL_16:
    *uint64_t v2 = v4;
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_253DB4E78(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_253DB4EDC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_253DB4F40()
{
  uint64_t v1 = sub_253CD9958();
  v2(v1);
  sub_253BDF7F0();
  sub_253BEFBCC();
  v3();
  return v0;
}

uint64_t sub_253DB4F90()
{
  sub_253DB1A98();
  return v0 & 1;
}

uint64_t sub_253DB4FB0()
{
  uint64_t v1 = sub_253C8F1DC();
  v2(v1);
  sub_253BDF7F0();
  uint64_t v3 = sub_253C2F578();
  v4(v3);
  return v0;
}

uint64_t sub_253DB4FFC()
{
  uint64_t v1 = sub_253C8F1DC();
  v2(v1);
  sub_253BDF7F0();
  sub_253C10134();
  v3();
  return v0;
}

uint64_t sub_253DB5050()
{
  uint64_t v2 = sub_253C8F1DC();
  v3(v2);
  sub_253BDF7F0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v0, v1);
  return v0;
}

uint64_t sub_253DB50A8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_253DB50E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_253DB5128()
{
  sub_253C10364();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  uint64_t v8 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = (void *)sub_253BDF880(v9);
  *uint64_t v10 = v11;
  v10[1] = sub_253BDF090;
  return sub_253DAE13C(v4, v2, v5, v6, v8, v7);
}

uint64_t sub_253DB51E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_253DB5238(uint64_t a1)
{
  return a1;
}

uint64_t sub_253DB5290()
{
  sub_253C10364();
  uint64_t v0 = sub_253DB5D2C();
  sub_253C1CE88(v0);
  sub_253DB58E4();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253C1CE9C();
  return sub_253DB0324(v4, v5, v6, v7, v8);
}

uint64_t sub_253DB5338()
{
  sub_253C10364();
  uint64_t v0 = sub_253DB5D2C();
  sub_253C1CE88(v0);
  sub_253DB58E4();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253C1CE9C();
  return sub_253DB0B60(v4, v5, v6, v7, v8);
}

uint64_t sub_253DB53E0()
{
  sub_253C10364();
  uint64_t v0 = sub_253DB5D2C();
  sub_253C1CE88(v0);
  sub_253DB58E4();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253C1CE9C();
  return sub_253DB0964(v4, v5, v6, v7, v8);
}

uint64_t sub_253DB5488()
{
  sub_253C10364();
  uint64_t v0 = sub_253DB5D2C();
  sub_253C1CE88(v0);
  sub_253DB58E4();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253C1CE9C();
  return sub_253DB0680(v4, v5, v6, v7, v8);
}

uint64_t sub_253DB5530()
{
  uint64_t v1 = sub_253DF0EA0();
  sub_253C0F830();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 88) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_253DB55F4()
{
  sub_253C10364();
  uint64_t v0 = sub_253DB5D2C();
  sub_253C1CE88(v0);
  sub_253DB58E4();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253C1CE9C();
  return sub_253DAFB2C(v4, v5, v6, v7, v8);
}

unsigned char *storeEnumTagSinglePayload for SessionRoutingError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x253DB5764);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionRoutingError()
{
  return &type metadata for SessionRoutingError;
}

unint64_t sub_253DB57A0()
{
  unint64_t result = qword_269D7E920;
  if (!qword_269D7E920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7E920);
  }
  return result;
}

uint64_t sub_253DB57F0()
{
  return sub_253DB4F90() & 1;
}

uint64_t sub_253DB5814()
{
  uint64_t v1 = v0[24];
  v0[54] = *(void *)(v0[34] + *(int *)(v0[32] + 32));
  return v1;
}

uint64_t sub_253DB5854()
{
  return swift_task_dealloc();
}

uint64_t sub_253DB588C()
{
  return swift_task_dealloc();
}

uint64_t sub_253DB58FC()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_253DB5910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  long long v25 = *(_OWORD *)(v24 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v24;
  *(_OWORD *)(a1 + 48) = v25;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(v24 + 32);
  *(void *)(a1 + 80) = *(void *)(v24 + 48);
  return a1 + a24;
}

uint64_t sub_253DB5948()
{
  return v0;
}

uint64_t sub_253DB5974()
{
  uint64_t result = *(void *)(v0[4] + v0[5]);
  v0[6] = result;
  return result;
}

uint64_t sub_253DB5984()
{
  return v0;
}

uint64_t sub_253DB5994(uint64_t a1, unint64_t a2)
{
  return sub_253D8E5FC(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_253DB59AC()
{
  return sub_253DF0D50();
}

uint64_t sub_253DB59E8(uint64_t a1, unint64_t a2)
{
  return sub_253D8E5FC(a1, a2, (uint64_t *)(v2 - 112));
}

uint64_t sub_253DB5A0C()
{
  return *(void *)(v0 + 216);
}

uint64_t sub_253DB5A20()
{
  return swift_task_alloc();
}

uint64_t sub_253DB5A54()
{
  return swift_arrayDestroy();
}

uint64_t sub_253DB5A74(uint64_t a1)
{
  *(void *)(v2 - 72) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_253DF5820();
}

uint64_t sub_253DB5AA0()
{
  return swift_slowAlloc();
}

uint64_t sub_253DB5ACC()
{
  return v0;
}

uint64_t sub_253DB5ADC(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DB5B04(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

void sub_253DB5B20()
{
  *uint64_t v0 = 0x8000000000000000;
}

__n128 sub_253DB5B74(uint64_t a1)
{
  return *(__n128 *)(*(void *)(v1 + 56) + 56 * a1 + 32);
}

uint64_t sub_253DB5B90()
{
  return *(void *)(v0 + 248);
}

uint64_t sub_253DB5BC8()
{
  return *(void *)(v0 + 376);
}

uint64_t sub_253DB5BE4()
{
  return *(void *)(v0 + 48) + *(void *)(*(void *)(v1 + 224) + 72) * v2;
}

uint64_t sub_253DB5C38()
{
  return type metadata accessor for SessionSwitchboard.SessionInfo();
}

uint64_t sub_253DB5C60(uint64_t a1)
{
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(a1, 0, 1, v1);
}

uint64_t sub_253DB5C88()
{
  return swift_beginAccess();
}

void sub_253DB5CAC()
{
  *(_WORD *)(v0 + 12) = 2080;
}

uint64_t sub_253DB5CB8(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_253DB5CD0(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_253DB5CE0()
{
  return swift_release();
}

BOOL sub_253DB5D04(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_253DB5D20(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t sub_253DB5D2C()
{
  return sub_253DF0EA0();
}

uint64_t sub_253DB5D50@<X0>(int *a1@<X8>)
{
  *(void *)(v1 - 96) = (char *)a1 + *a1;
  return swift_retain();
}

uint64_t sub_253DB5D80()
{
  return sub_253DF5480();
}

uint64_t sub_253DB5DC0()
{
  return v0;
}

uint64_t sub_253DB5DD0()
{
  return *(void *)(v0 + 376);
}

uint64_t sub_253DB5DE8()
{
  return v0;
}

uint64_t sub_253DB5DFC()
{
  return v0 - 136;
}

uint64_t sub_253DB5E08(__n128 a1, __n128 a2, __n128 a3)
{
  v4[3].n128_u64[0] = v3;
  v4[1] = a2;
  v4[2] = a1;
  *unsigned int v4 = a3;
  return swift_endAccess();
}

uint64_t sub_253DB5E28(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_253DB5E3C(uint64_t a1)
{
  *(void *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t sub_253DB5E50(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DB5E70(uint64_t a1)
{
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v1, 1, 1, a1);
}

uint64_t sub_253DB5EA8(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_253DB5EBC(uint64_t a1, unint64_t a2)
{
  return sub_253D8E5FC(a1, a2, (uint64_t *)(v2 - 136));
}

void sub_253DB5EE8()
{
  **(unsigned char **)(v0 - 152) = *(unsigned char *)(v0 - 65);
}

uint64_t sub_253DB5F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return sub_253DB4E78(a10, a12);
}

uint64_t sub_253DB5F3C()
{
  return v0;
}

uint64_t sub_253DB5F48(uint64_t result)
{
  *(void *)(v1 + 400) = *(void *)(result + *(int *)(*(void *)(v1 + 256) + 32));
  return result;
}

uint64_t sub_253DB5F5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return *(void *)(a1 + 56) + *(void *)(*(void *)(v2 + 264) + 72) * a2;
}

uint64_t sub_253DB5F7C()
{
  return sub_253BDEDD8(v0);
}

uint64_t sub_253DB5FB0()
{
  v0[52] = v2;
  v0[53] = v3;
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[31];
  return sub_253C61B78(v5, v6, v1);
}

uint64_t static ToolboxManager.toolboxes()()
{
  uint64_t v20 = sub_253DF30A0();
  sub_253C0F830();
  uint64_t v1 = v0;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_253DF24C0();
  sub_253C0F830();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[3] = sub_253DF2520();
  v21[4] = sub_253DB6334(&qword_269D7B6D8, MEMORY[0x263F4D0A8]);
  sub_253BDEE6C(v21);
  _s23IntelligenceFlowRuntime28StandardToolboxConfigurationV011makeMutableE08delegate22planGenerationDelegate0aB14PlannerSupport0hE0Cx_q_tKAG0eL0RzAG0e4PlankL0R_r0_lFfA__0();
  _s23IntelligenceFlowRuntime28StandardToolboxConfigurationV011makeMutableE08delegate22planGenerationDelegate0aB14PlannerSupport0hE0Cx_q_tKAG0eL0RzAG0e4PlankL0R_r0_lFfA0__0();
  sub_253BDEDD8(&qword_269D7E928);
  uint64_t v10 = (int *)(sub_253BDEDD8(&qword_269D7E930) - 8);
  unint64_t v11 = (*(unsigned __int8 *)(*(void *)v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_253DF6EC0;
  uint64_t v13 = (uint64_t *)(v12 + v11 + v10[14]);
  sub_253DF31C0();
  sub_253DF3090();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v20);
  sub_253C1601C((uint64_t)v21, (uint64_t)v13);
  uint64_t v14 = v19;
  v13[8] = v19;
  v13[9] = sub_253DB6334(&qword_269D7B6E0, MEMORY[0x263F4D088]);
  uint64_t v15 = sub_253BDEE6C(v13 + 5);
  (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 16))(v15, v9, v14);
  sub_253DF0DB0();
  sub_253DB6334(&qword_26B251B08, MEMORY[0x263F4CA20]);
  uint64_t v16 = sub_253DF5180();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v14);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0((uint64_t)v21);
  return v16;
}

uint64_t sub_253DB6334(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for ToolboxManager()
{
  return &type metadata for ToolboxManager;
}

uint64_t destroy for ToolBoxDelegates(uint64_t a1)
{
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0(a1);

  return _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0(a1 + 40);
}

uint64_t initializeWithCopy for ToolBoxDelegates(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for ToolBoxDelegates(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

void *initializeWithTake for ToolBoxDelegates(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for ToolBoxDelegates(uint64_t a1, uint64_t a2)
{
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolBoxDelegates(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolBoxDelegates(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ToolBoxDelegates()
{
  return &type metadata for ToolBoxDelegates;
}

uint64_t sub_253DB65B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_253DF0C70();
  uint64_t v10 = sub_253BDF9FC(v9);
  MEMORY[0x270FA5388](v10);
  sub_253C101F4();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v18 - v12;
  uint64_t v14 = (void (*)(void))MEMORY[0x263F4C9C0];
  sub_253DBDD2C(a1, (uint64_t)v18 - v12, MEMORY[0x263F4C9C0]);
  uint64_t v15 = *(void *)(v4 + 16);
  sub_253C1601C(a4, (uint64_t)v19);
  sub_253C1601C(a3, (uint64_t)v18);
  sub_253DBDD2C(a1, v5, v14);
  type metadata accessor for ToolInvocationSummaryRetriever();
  uint64_t v16 = sub_253C520A4();
  swift_retain();
  swift_defaultActor_initialize();
  sub_253BDB0E4(v18, v16 + 112);
  sub_253BDB0FC(v5, v16 + OBJC_IVAR____TtC23IntelligenceFlowRuntime30ToolInvocationSummaryRetriever_sessionId);
  return sub_253DBD9B4((uint64_t)v13, v15, v19, v16);
}

uint64_t sub_253DB66E8()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for XPCClientAvatarConfiguration()
{
  return self;
}

uint64_t sub_253DB6744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t result = sub_253DB65B0(a1, a2, a3, a4);
  *a5 = result;
  return result;
}

uint64_t sub_253DB6770()
{
  sub_253BDF928();
  v1[5] = v2;
  v1[6] = v0;
  uint64_t v3 = sub_253DF0780();
  v1[7] = v3;
  sub_253BDF7B0(v3);
  v1[8] = v4;
  v1[9] = sub_253BDF868();
  uint64_t v5 = sub_253DEFE20();
  sub_253BDF9FC(v5);
  v1[10] = sub_253BDF868();
  uint64_t v6 = sub_253BDEDD8(&qword_26B2519D0);
  sub_253BDF9FC(v6);
  v1[11] = sub_253BDF868();
  uint64_t v7 = sub_253DEFE90();
  v1[12] = v7;
  sub_253BDF7B0(v7);
  v1[13] = v8;
  v1[14] = sub_253C0FBBC();
  v1[15] = swift_task_alloc();
  uint64_t v9 = sub_253DF14C0();
  sub_253BDF9FC(v9);
  v1[16] = sub_253BDF868();
  uint64_t v10 = sub_253DF0EA0();
  v1[17] = v10;
  sub_253BDF7B0(v10);
  v1[18] = v11;
  v1[19] = sub_253BDF868();
  sub_253BDF950();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_253DB68CC()
{
  uint64_t v10 = v0[11];
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[8];
  uint64_t v11 = v0[7];
  sub_253DBDD2C(v2 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_sessionId, v0[16], MEMORY[0x263F4CE38]);
  sub_253DBE31C();
  v4();
  sub_253DEFE80();
  uint64_t v5 = v2 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_latestClientSentQueryEventId;
  swift_beginAccess();
  sub_253C56520(v5, v10, &qword_26B2519D0);
  sub_253DF0C20();
  sub_253DEFE10();
  sub_253DF13F0();
  sub_253BDF7F0();
  sub_253C0FF48();
  v6();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, *MEMORY[0x263F4C398], v11);
  sub_253DF0E90();
  sub_253BDF5F8((void *)(v2 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_clientReverseClientDistributor), *(void *)(v2 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_clientReverseClientDistributor + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  v0[20] = v7;
  void *v7 = v0;
  v7[1] = sub_253DB6AE4;
  uint64_t v8 = sub_253C10348(v0[19]);
  return sub_253D2BCCC(v8);
}

uint64_t sub_253DB6AE4()
{
  sub_253C0F84C();
  sub_253C0FA84();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 168) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v1 + 48);
  if (v0) {
    uint64_t v6 = sub_253DB6CB8;
  }
  else {
    uint64_t v6 = sub_253DB6BE8;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_253DB6BE8()
{
  sub_253C0F824();
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_253DB6CB8()
{
  sub_253C0F824();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v1();
}

uint64_t sub_253DB6D84()
{
  sub_253BDF928();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = sub_253DF3F70();
  sub_253BDF9FC(v3);
  v1[4] = sub_253BDF868();
  uint64_t v4 = sub_253DF0C90();
  sub_253BDF9FC(v4);
  v1[5] = sub_253BDF868();
  uint64_t v5 = sub_253DF0780();
  v1[6] = v5;
  sub_253BDF7B0(v5);
  v1[7] = v6;
  v1[8] = sub_253BDF868();
  uint64_t v7 = sub_253DEFE20();
  sub_253BDF9FC(v7);
  v1[9] = sub_253BDF868();
  uint64_t v8 = sub_253DF4420();
  v1[10] = v8;
  sub_253BDF7B0(v8);
  v1[11] = v9;
  v1[12] = sub_253BDF868();
  uint64_t v10 = sub_253BDEDD8(&qword_26B2519D0);
  sub_253BDF9FC(v10);
  v1[13] = sub_253BDF868();
  uint64_t v11 = sub_253DEFE90();
  sub_253BDF9FC(v11);
  v1[14] = sub_253C0FBBC();
  v1[15] = swift_task_alloc();
  uint64_t v12 = sub_253DF0EA0();
  v1[16] = v12;
  sub_253BDF7B0(v12);
  v1[17] = v13;
  v1[18] = sub_253BDF868();
  sub_253BDF950();
  return MEMORY[0x270FA2498](v14, v15, v16);
}

uint64_t sub_253DB6F20()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[7];
  uint64_t v9 = v0[6];
  uint64_t v8 = v0[10];
  uint64_t v10 = v0[3];
  sub_253DF3F90();
  sub_253DF3F60();
  sub_253DF3EC0();
  sub_253DF3F00();
  sub_253DF3EE0();
  sub_253DF3FA0();
  sub_253DF4410();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v8);
  sub_253DF3F80();
  sub_253DF0C80();
  sub_253DF0CA0();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F4C270], v9);
  sub_253DF0E90();
  sub_253BDF5F8((void *)(v10 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_clientReverseClientDistributor), *(void *)(v10 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_clientReverseClientDistributor + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  v0[19] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_253DB70F8;
  uint64_t v6 = sub_253C10348(v0[18]);
  return sub_253D2BCCC(v6);
}

uint64_t sub_253DB70F8()
{
  sub_253C0F84C();
  sub_253C0FA84();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 160) = v0;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v1 + 24);
  if (v0) {
    uint64_t v6 = sub_253DB72E8;
  }
  else {
    uint64_t v6 = sub_253DB71FC;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_253DB71FC()
{
  sub_253C0F824();
  v1();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_253DB72E8()
{
  sub_253C0F824();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v1();
}

uint64_t sub_253DB73D0()
{
  sub_253BDF928();
  v1[9] = v2;
  v1[10] = v0;
  v1[7] = v3;
  v1[8] = v4;
  uint64_t v5 = sub_253DF30F0();
  v1[11] = v5;
  sub_253BDF7B0(v5);
  v1[12] = v6;
  v1[13] = sub_253BDF868();
  uint64_t v7 = sub_253DEFE20();
  sub_253BDF9FC(v7);
  v1[14] = sub_253BDF868();
  uint64_t v8 = sub_253DF4420();
  v1[15] = v8;
  sub_253BDF7B0(v8);
  v1[16] = v9;
  v1[17] = sub_253BDF868();
  uint64_t v10 = sub_253DF0EA0();
  v1[18] = v10;
  sub_253BDF7B0(v10);
  v1[19] = v11;
  v1[20] = sub_253BDF868();
  uint64_t v12 = sub_253DF0780();
  v1[21] = v12;
  sub_253BDF7B0(v12);
  v1[22] = v13;
  v1[23] = sub_253C0FBBC();
  v1[24] = swift_task_alloc();
  uint64_t v14 = sub_253BDEDD8(&qword_26B2519D0);
  sub_253BDF9FC(v14);
  v1[25] = sub_253C0FBBC();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  uint64_t v15 = sub_253DEFE90();
  v1[28] = v15;
  sub_253BDF7B0(v15);
  v1[29] = v16;
  v1[30] = sub_253C0FBBC();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  uint64_t v17 = sub_253DF24A0();
  v1[34] = v17;
  sub_253BDF7B0(v17);
  v1[35] = v18;
  v1[36] = sub_253C0FBBC();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  uint64_t v19 = sub_253DF4230();
  v1[41] = v19;
  sub_253BDF7B0(v19);
  v1[42] = v20;
  v1[43] = sub_253C0FBBC();
  v1[44] = swift_task_alloc();
  uint64_t v21 = sub_253DF3E70();
  v1[45] = v21;
  sub_253BDF7B0(v21);
  v1[46] = v22;
  v1[47] = sub_253BDF868();
  sub_253BDF950();
  return MEMORY[0x270FA2498](v23, v24, v25);
}

#error "253DB77CC: call analysis failed (funcsize=364)"

uint64_t sub_253DB7C50()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v3 = v2;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_253C0FA84();
  *uint64_t v6 = v5;
  *(void *)(v3 + 488) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = *(void *)(v3 + 80);
    sub_253C0F824();
    v8();
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_253DB8408;
    uint64_t v10 = v7;
  }
  else
  {
    uint64_t v11 = *(void *)(v3 + 80);
    sub_253C0F824();
    v12();
    uint64_t v9 = sub_253DB7D78;
    uint64_t v10 = v11;
  }
  return MEMORY[0x270FA2498](v9, v10, 0);
}

#error "253DB8140: call analysis failed (funcsize=408)"

#error "253DB8780: call analysis failed (funcsize=437)"

uint64_t sub_253DB8B14()
{
  sub_253BDF928();
  v1[6] = v2;
  v1[7] = v0;
  v1[4] = v3;
  v1[5] = v4;
  uint64_t v5 = sub_253DF30F0();
  v1[8] = v5;
  sub_253BDF7B0(v5);
  v1[9] = v6;
  v1[10] = sub_253BDF868();
  uint64_t v7 = sub_253DF24A0();
  v1[11] = v7;
  sub_253BDF7B0(v7);
  v1[12] = v8;
  v1[13] = sub_253C0FBBC();
  v1[14] = swift_task_alloc();
  uint64_t v9 = sub_253DF0780();
  v1[15] = v9;
  sub_253BDF7B0(v9);
  v1[16] = v10;
  v1[17] = sub_253BDF868();
  uint64_t v11 = sub_253DEFE20();
  sub_253BDF9FC(v11);
  v1[18] = sub_253BDF868();
  uint64_t v12 = sub_253DF4420();
  v1[19] = v12;
  sub_253BDF7B0(v12);
  v1[20] = v13;
  v1[21] = sub_253BDF868();
  uint64_t v14 = sub_253BDEDD8(&qword_26B2519D0);
  sub_253BDF9FC(v14);
  v1[22] = sub_253BDF868();
  uint64_t v15 = sub_253DEFE90();
  sub_253BDF9FC(v15);
  v1[23] = sub_253C0FBBC();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  uint64_t v16 = sub_253DF0EA0();
  v1[26] = v16;
  sub_253BDF7B0(v16);
  v1[27] = v17;
  v1[28] = sub_253BDF868();
  uint64_t v18 = sub_253DF04F0();
  v1[29] = v18;
  sub_253BDF7B0(v18);
  v1[30] = v19;
  v1[31] = sub_253C0FBBC();
  v1[32] = swift_task_alloc();
  uint64_t v20 = sub_253DF3770();
  v1[33] = v20;
  sub_253BDF7B0(v20);
  v1[34] = v21;
  v1[35] = sub_253BDF868();
  uint64_t v22 = sub_253DF3C70();
  v1[36] = v22;
  sub_253BDF7B0(v22);
  v1[37] = v23;
  v1[38] = sub_253BDF868();
  uint64_t v24 = sub_253DF41F0();
  v1[39] = v24;
  sub_253BDF7B0(v24);
  v1[40] = v25;
  v1[41] = sub_253BDF868();
  uint64_t v26 = sub_253BDEDD8(&qword_26B255368);
  sub_253BDF9FC(v26);
  v1[42] = sub_253C0FBBC();
  v1[43] = swift_task_alloc();
  uint64_t v27 = sub_253DF4230();
  v1[44] = v27;
  sub_253BDF7B0(v27);
  v1[45] = v28;
  v1[46] = sub_253BDF868();
  uint64_t v29 = sub_253DF3E70();
  v1[47] = v29;
  sub_253BDF7B0(v29);
  v1[48] = v30;
  v1[49] = sub_253BDF868();
  sub_253BDF950();
  return MEMORY[0x270FA2498](v31, v32, v33);
}

#error "253DB9308: call analysis failed (funcsize=337)"

uint64_t sub_253DB93A0()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v1 = *v0;
  sub_253C0FA84();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_253BDF950();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "253DB962C: call analysis failed (funcsize=138)"

uint64_t sub_253DB96B4()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v1 = *v0;
  sub_253C0FA84();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_253BDF950();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

#error "253DB9940: call analysis failed (funcsize=138)"

uint64_t sub_253DB99C8()
{
  sub_253C0F84C();
  sub_253C0FA84();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v2;
  *(void *)(v3 + 464) = v0;
  swift_task_dealloc();
  sub_253BEFD5C();
  v5();
  uint64_t v6 = *(void *)(v1 + 56);
  if (v0) {
    uint64_t v7 = sub_253DBA068;
  }
  else {
    uint64_t v7 = sub_253DB9B24;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

void sub_253DB9B24()
{
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  uint64_t v2 = sub_253DF2490();
  os_log_type_t v3 = sub_253DF56D0();
  if (sub_253C10088(v3))
  {
    uint64_t v4 = (_WORD *)sub_253C0FDE0();
    sub_253C105CC(v4);
    sub_253DBE270(&dword_253BD8000, v2, v0, "XPCClientAvatar sent progress update");
    sub_253DBDF24();
  }

  sub_253BEFD20();
  v5();
  uint64_t v6 = *(void *)(v1 + 360);
  uint64_t v7 = *(void *)(v1 + 344);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 432) + 1;
  sub_253BEFBCC();
  v10();
  sub_253BEFAC0(v7, &qword_26B255368);
  uint64_t v11 = (void *)(v6 + 8);
  sub_253BEFD20();
  v12();
  if (v9 == v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_253DBE69C();
  if (v15 != v16)
  {
    uint64_t v17 = sub_253DBE17C();
    v18(v17);
    sub_253DF4200();
    uint64_t v19 = sub_253D7D580();
    int v21 = v20(v19);
    if (v21 == v11)
    {
      uint64_t v22 = sub_253DBE1F0();
      v23(v22);
      uint64_t v24 = sub_253DBE1C0();
      v25(v24);
      sub_253DBE450(v11);
      uint64_t v26 = swift_task_alloc();
      uint64_t v27 = (void *)sub_253D1196C(v26);
      void *v27 = v28;
      v27[1] = sub_253DB93A0;
      sub_253DBE1DC();
      sub_253C10488();
      __asm { BRAA            X5, X16 }
    }
    if (v21 == *(_DWORD *)(v1 + 480))
    {
      uint64_t v31 = sub_253DBE1F0();
      v32(v31);
      uint64_t v33 = sub_253DBE1C0();
      v34(v33);
      sub_253DBE478(v11);
      uint64_t v35 = swift_task_alloc();
      uint64_t v36 = (void *)sub_253DBE714(v35);
      void *v36 = v37;
      v36[1] = sub_253DB96B4;
      sub_253DBE1DC();
      sub_253C10488();
      __asm { BRAA            X5, X16 }
    }
    uint64_t v40 = *(void *)(v1 + 328);
    uint64_t v41 = *(void *)(v1 + 312);
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(*(void *)(v1 + 344), 1, 1, *(void *)(v1 + 232));
    sub_253DBE20C();
    v42();
    uint64_t v43 = sub_253DBE73C();
    sub_253C56520(v43, v40, &qword_26B255368);
    int v44 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v40, 1, v41);
    uint64_t v45 = *(void *)(v1 + 336);
    if (v44 == 1)
    {
      sub_253BEFAC0(*(void *)(v1 + 344), &qword_26B255368);
      sub_253BEFD5C();
      v46();
      swift_bridgeObjectRelease();
      sub_253BEFAC0(v45, &qword_26B255368);
LABEL_5:
      sub_253DBE0CC();
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
      sub_253BDF8DC();
      sub_253C10488();
      __asm { BRAA            X1, X16 }
    }
    uint64_t v47 = sub_253DBDF40();
    v48(v47);
    sub_253DBE88C();
    sub_253DF4180();
    sub_253DF4050();
    uint64_t v49 = sub_253DF4110();
    uint64_t v76 = v50;
    uint64_t v77 = v49;
    sub_253DF4070();
    uint64_t v75 = v51;
    sub_253DF4220();
    sub_253DF4410();
    uint64_t v52 = sub_253DBE7CC();
    v53(v52);
    uint64_t v54 = sub_253DF4180();
    uint64_t v62 = sub_253DBE638(v54, v55, v56, v57, v58, v59, v60, v61, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81,
            v82,
            v83,
            v84,
            v85);
    v63(v62);
    sub_253DBE84C();
    uint64_t v64 = sub_253DBE61C();
    v65(v64);
    sub_253DBE3CC();
    uint64_t v66 = swift_task_alloc();
    uint64_t v67 = (void *)sub_253DBE6B4(v66);
    *uint64_t v67 = v68;
    v67[1] = sub_253DB99C8;
    sub_253C10348(*(void *)(v1 + 224));
    sub_253C10488();
    sub_253D2BCCC(v69);
  }
  else
  {
    __break(1u);
  }
}

void sub_253DBA068()
{
  uint64_t v1 = *(void **)(v0 + 464);
  sub_253DF1740();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_253DF2490();
  os_log_type_t v5 = sub_253DF5700();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 464);
    uint64_t v7 = (_DWORD *)sub_253C0FFB0();
    uint64_t v8 = (void *)swift_slowAlloc();
    _DWORD *v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v10;
    sub_253DF5820();
    *uint64_t v8 = v10;

    sub_253DBE684(&dword_253BD8000, v4, v5, "XPCClientAvatar had error: %@");
    sub_253BDEDD8(&qword_26B2519F0);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253DBDF24();
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 464);
  }
  uint64_t v12 = v4;
  uint64_t v13 = *(void **)(v0 + 464);
  unsigned int v104 = *(_DWORD *)(v0 + 488);
  uint64_t v14 = *(void *)(v0 + 424);
  uint64_t v15 = *(void *)(v0 + 96);
  uint64_t v16 = *(void *)(v0 + 104);
  uint64_t v17 = *(uint64_t **)(v0 + 80);
  uint64_t v18 = *(void *)(v0 + 88);
  uint64_t v20 = *(void *)(v0 + 64);
  uint64_t v19 = *(void *)(v0 + 72);
  uint64_t v21 = *(void *)(v0 + 56);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v18);
  sub_253BDF5F8((void *)(v21 + v14), *(void *)(v21 + v14 + 24));
  *(void *)(v0 + 16) = v13;
  id v22 = v13;
  sub_253BDEDD8((uint64_t *)&unk_26B2564C0);
  *uint64_t v17 = sub_253DF5290();
  v17[1] = v23;
  (*(void (**)(uint64_t *, void, uint64_t))(v19 + 104))(v17, v104, v20);
  sub_253DF42F0();
  sub_253C520A4();
  sub_253DF4310();
  sub_253DBE8C4();
  swift_release();

  uint64_t v24 = *(void *)(v0 + 360);
  uint64_t v25 = *(void *)(v0 + 344);
  uint64_t v26 = *(void *)(v0 + 48);
  uint64_t v27 = *(void *)(v0 + 432) + 1;
  sub_253BEFBCC();
  v28();
  sub_253BEFAC0(v25, &qword_26B255368);
  uint64_t v29 = (void *)(v24 + 8);
  sub_253BEFD20();
  v30();
  if (v27 == v26)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  sub_253DBE69C();
  if (v33 != v34)
  {
    uint64_t v35 = sub_253DBE17C();
    v36(v35);
    sub_253DF4200();
    uint64_t v37 = sub_253D7D580();
    int v39 = v38(v37);
    if (v39 == v29)
    {
      uint64_t v40 = sub_253DBE1F0();
      v41(v40);
      uint64_t v42 = sub_253DBE1C0();
      v43(v42);
      sub_253DBE450(v29);
      uint64_t v44 = swift_task_alloc();
      uint64_t v45 = (void *)sub_253D1196C(v44);
      void *v45 = v46;
      v45[1] = sub_253DB93A0;
      sub_253DBE1DC();
      sub_253C10488();
      __asm { BRAA            X5, X16 }
    }
    if (v39 == *(_DWORD *)(v0 + 480))
    {
      uint64_t v49 = sub_253DBE1F0();
      v50(v49);
      uint64_t v51 = sub_253DBE1C0();
      v52(v51);
      sub_253DBE478(v29);
      uint64_t v53 = swift_task_alloc();
      uint64_t v54 = (void *)sub_253DBE714(v53);
      void *v54 = v55;
      v54[1] = sub_253DB96B4;
      sub_253DBE1DC();
      sub_253C10488();
      __asm { BRAA            X5, X16 }
    }
    uint64_t v58 = *(void *)(v0 + 328);
    uint64_t v59 = *(void *)(v0 + 312);
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(*(void *)(v0 + 344), 1, 1, *(void *)(v0 + 232));
    sub_253DBE20C();
    v60();
    uint64_t v61 = sub_253DBE73C();
    sub_253C56520(v61, v58, &qword_26B255368);
    int v62 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v58, 1, v59);
    uint64_t v63 = *(void *)(v0 + 336);
    if (v62 == 1)
    {
      sub_253BEFAC0(*(void *)(v0 + 344), &qword_26B255368);
      sub_253BEFD5C();
      v64();
      swift_bridgeObjectRelease();
      sub_253BEFAC0(v63, &qword_26B255368);
LABEL_6:
      sub_253DBE0CC();
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
      sub_253BDF8DC();
      sub_253C10488();
      __asm { BRAA            X1, X16 }
    }
    uint64_t v65 = sub_253DBDF40();
    v66(v65);
    sub_253DBE88C();
    sub_253DF4180();
    sub_253DF4050();
    uint64_t v67 = sub_253DF4110();
    uint64_t v94 = v68;
    uint64_t v95 = v67;
    sub_253DF4070();
    uint64_t v93 = v69;
    sub_253DF4220();
    sub_253DF4410();
    uint64_t v70 = sub_253DBE7CC();
    v71(v70);
    uint64_t v72 = sub_253DF4180();
    uint64_t v80 = sub_253DBE638(v72, v73, v74, v75, v76, v77, v78, v79, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99,
            v100,
            v101,
            v102,
            v103);
    v81(v80);
    sub_253DBE84C();
    uint64_t v82 = sub_253DBE61C();
    v83(v82);
    sub_253DBE3CC();
    uint64_t v84 = swift_task_alloc();
    uint64_t v85 = (void *)sub_253DBE6B4(v84);
    *uint64_t v85 = v86;
    v85[1] = sub_253DB99C8;
    sub_253C10348(*(void *)(v0 + 224));
    sub_253C10488();
    sub_253D2BCCC(v87);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_253DBA724(uint64_t a1)
{
  uint64_t v2 = sub_253BDEDD8(&qword_26B255408);
  uint64_t v3 = sub_253BDF9FC(v2);
  MEMORY[0x270FA5388](v3);
  sub_253BDFA94();
  sub_253C34018(v4);
  uint64_t v422 = sub_253DF0F60();
  sub_253C0F830();
  uint64_t v411 = v5;
  MEMORY[0x270FA5388](v6);
  sub_253BDFA94();
  sub_253C34018(v7);
  uint64_t v421 = sub_253DF3170();
  sub_253C0F830();
  uint64_t v420 = v8;
  MEMORY[0x270FA5388](v9);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v10);
  sub_253C36430();
  sub_253C34018(v11);
  uint64_t v439 = sub_253DF3770();
  sub_253C0F830();
  uint64_t v438 = v12;
  MEMORY[0x270FA5388](v13);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v14);
  sub_253C36430();
  sub_253C34018(v15);
  uint64_t v383 = sub_253DF37D0();
  sub_253C0F830();
  uint64_t v382 = v16;
  MEMORY[0x270FA5388](v17);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v18);
  sub_253C36430();
  sub_253C34018(v19);
  uint64_t v20 = sub_253DF2E40();
  uint64_t v21 = sub_253BDF9FC(v20);
  MEMORY[0x270FA5388](v21);
  sub_253BDFA94();
  sub_253C34018(v22);
  uint64_t v23 = sub_253DF0580();
  uint64_t v24 = sub_253BDF9FC(v23);
  MEMORY[0x270FA5388](v24);
  sub_253BDFA94();
  sub_253C34018(v25);
  uint64_t v395 = sub_253DF37B0();
  sub_253C0F830();
  uint64_t v394 = v26;
  MEMORY[0x270FA5388](v27);
  sub_253BDFA94();
  sub_253C34018(v28);
  uint64_t v29 = sub_253DF0A20();
  uint64_t v30 = sub_253BDF9FC(v29);
  MEMORY[0x270FA5388](v30);
  sub_253BDFA94();
  sub_253C34018(v31);
  uint64_t v400 = sub_253DF35C0();
  sub_253C0F830();
  uint64_t v399 = v32;
  MEMORY[0x270FA5388](v33);
  sub_253BDFA94();
  sub_253C34018(v34);
  sub_253DF0780();
  sub_253C0F830();
  unint64_t v468 = v36;
  uint64_t v469 = v35;
  MEMORY[0x270FA5388](v35);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v37);
  sub_253C36430();
  sub_253C9D444(v38);
  uint64_t v39 = sub_253BDEDD8(&qword_26B255380);
  uint64_t v40 = sub_253BDF9FC(v39);
  MEMORY[0x270FA5388](v40);
  sub_253BDFA94();
  sub_253C9D444(v41);
  uint64_t v42 = sub_253BDEDD8(&qword_26B255370);
  uint64_t v43 = sub_253BDF9FC(v42);
  MEMORY[0x270FA5388](v43);
  sub_253BDFA94();
  sub_253C34018(v44);
  uint64_t v387 = sub_253DF0410();
  sub_253C0F830();
  uint64_t v386 = v45;
  MEMORY[0x270FA5388](v46);
  sub_253BDFA94();
  sub_253C34018(v47);
  uint64_t v390 = sub_253DF3030();
  sub_253C0F830();
  uint64_t v389 = v48;
  MEMORY[0x270FA5388](v49);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v50);
  sub_253C36430();
  sub_253C34018(v51);
  uint64_t v52 = sub_253DEFFE0();
  uint64_t v53 = sub_253BDF9FC(v52);
  MEMORY[0x270FA5388](v53);
  sub_253BDFA94();
  sub_253C34018(v54);
  uint64_t v430 = sub_253DF38A0();
  sub_253C0F830();
  uint64_t v433 = v55;
  MEMORY[0x270FA5388](v56);
  sub_253BDFA94();
  sub_253C34018(v57);
  uint64_t v428 = sub_253DF0660();
  sub_253C0F830();
  uint64_t v432 = v58;
  MEMORY[0x270FA5388](v59);
  sub_253BDFA94();
  sub_253C34018(v60);
  uint64_t v402 = sub_253DF2FC0();
  sub_253C0F830();
  uint64_t v401 = v61;
  MEMORY[0x270FA5388](v62);
  sub_253BDFA94();
  sub_253C34018(v63);
  uint64_t v414 = sub_253DF3B50();
  sub_253C0F830();
  uint64_t v403 = v64;
  MEMORY[0x270FA5388](v65);
  sub_253BDFA94();
  sub_253C9D444(v66);
  uint64_t v67 = sub_253BDEDD8(&qword_26B255EF0);
  uint64_t v68 = sub_253BDF9FC(v67);
  MEMORY[0x270FA5388](v68);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v69);
  sub_253C33FFC();
  sub_253C63378();
  MEMORY[0x270FA5388](v70);
  sub_253C33FFC();
  sub_253C63378();
  MEMORY[0x270FA5388](v71);
  sub_253C36430();
  sub_253C9D444(v72);
  uint64_t v73 = sub_253BDEDD8(&qword_26B255378);
  uint64_t v74 = sub_253BDF9FC(v73);
  MEMORY[0x270FA5388](v74);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v75);
  sub_253C36430();
  sub_253C9D444(v76);
  uint64_t v77 = sub_253BDEDD8(&qword_26B2519D0);
  uint64_t v78 = sub_253BDF9FC(v77);
  MEMORY[0x270FA5388](v78);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v79);
  sub_253C33FFC();
  sub_253C63378();
  MEMORY[0x270FA5388](v80);
  sub_253C36430();
  sub_253C34018(v81);
  uint64_t v407 = sub_253DF2FA0();
  sub_253C0F830();
  uint64_t v406 = v82;
  MEMORY[0x270FA5388](v83);
  sub_253BDFA94();
  sub_253C34018(v84);
  uint64_t v416 = sub_253DF3040();
  sub_253C0F830();
  uint64_t v415 = v85;
  MEMORY[0x270FA5388](v86);
  sub_253BDFA94();
  sub_253C9D444(v87);
  uint64_t v88 = sub_253BDEDD8(&qword_26B255388);
  uint64_t v89 = sub_253BDF9FC(v88);
  MEMORY[0x270FA5388](v89);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v90);
  sub_253C33FFC();
  sub_253C63378();
  MEMORY[0x270FA5388](v91);
  sub_253C36430();
  sub_253C34018(v92);
  uint64_t v424 = sub_253DF3630();
  sub_253C0F830();
  uint64_t v423 = v93;
  MEMORY[0x270FA5388](v94);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v95);
  sub_253C36430();
  sub_253C34018(v96);
  uint64_t v435 = sub_253DF3580();
  sub_253C0F830();
  uint64_t v434 = v97;
  MEMORY[0x270FA5388](v98);
  sub_253BDFA94();
  sub_253C34018(v99);
  sub_253DF4040();
  sub_253C0F830();
  uint64_t v465 = v101;
  v466 = v100;
  MEMORY[0x270FA5388](v100);
  sub_253C34050();
  uint64_t v463 = v102;
  MEMORY[0x270FA5388](v103);
  sub_253C36430();
  uint64_t v464 = v104;
  sub_253C36350();
  uint64_t v437 = sub_253DF2A00();
  sub_253C0F830();
  uint64_t v436 = v105;
  MEMORY[0x270FA5388](v106);
  sub_253BDFA94();
  sub_253C34018(v107);
  uint64_t v454 = sub_253DEFF50();
  sub_253C0F830();
  uint64_t v467 = v108;
  MEMORY[0x270FA5388](v109);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v110);
  sub_253C33FFC();
  sub_253C63378();
  MEMORY[0x270FA5388](v111);
  sub_253C36430();
  sub_253C34018(v112);
  uint64_t v448 = sub_253DF30F0();
  sub_253C0F830();
  uint64_t v447 = v113;
  MEMORY[0x270FA5388](v114);
  sub_253BDFA94();
  sub_253C34018(v115);
  uint64_t v453 = sub_253DF2C40();
  sub_253C0F830();
  uint64_t v455 = v116;
  MEMORY[0x270FA5388](v117);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v118);
  sub_253C36430();
  uint64_t v459 = v119;
  sub_253C36350();
  uint64_t v427 = sub_253DF0880();
  sub_253C0F830();
  uint64_t v426 = v120;
  MEMORY[0x270FA5388](v121);
  sub_253BDFA94();
  sub_253C34018(v122);
  sub_253DF24A0();
  sub_253C0F830();
  uint64_t v451 = v124;
  uint64_t v452 = v123;
  MEMORY[0x270FA5388](v123);
  sub_253C34050();
  sub_253C63378();
  MEMORY[0x270FA5388](v125);
  sub_253C33FFC();
  sub_253C63378();
  MEMORY[0x270FA5388](v126);
  sub_253C33FFC();
  sub_253C63378();
  MEMORY[0x270FA5388](v127);
  sub_253C36430();
  sub_253C34018(v128);
  uint64_t v442 = sub_253DF0240();
  sub_253C0F830();
  uint64_t v441 = v129;
  MEMORY[0x270FA5388](v130);
  sub_253BDFA94();
  sub_253C34018(v131);
  uint64_t v384 = sub_253DEFE90();
  sub_253BDF7F0();
  MEMORY[0x270FA5388](v132);
  sub_253BDFA94();
  uint64_t v458 = v133;
  sub_253C36350();
  uint64_t v462 = sub_253DF2BE0();
  sub_253C0F830();
  uint64_t v457 = v134;
  MEMORY[0x270FA5388](v135);
  sub_253BDFA94();
  uint64_t v456 = v136;
  sub_253C36350();
  sub_253DF3C70();
  sub_253C0F830();
  uint64_t v460 = v138;
  uint64_t v461 = v137;
  MEMORY[0x270FA5388](v137);
  sub_253C101F4();
  MEMORY[0x270FA5388](v139);
  v141 = (void (**)(uint64_t, uint64_t))&v381[-v140];
  uint64_t v142 = sub_253DF3D20();
  sub_253C0F830();
  uint64_t v144 = v143;
  uint64_t v146 = MEMORY[0x270FA5388](v145);
  MEMORY[0x270FA5388](v146);
  unint64_t v148 = (unint64_t)&v381[-v147];
  uint64_t v149 = sub_253DF41F0();
  sub_253C0F830();
  uint64_t v151 = v150;
  MEMORY[0x270FA5388](v152);
  uint64_t v154 = &v381[-((v153 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_253DF4200();
  int v155 = (*(uint64_t (**)(unsigned char *, uint64_t))(v151 + 88))(v154, v149);
  if (v155 != *MEMORY[0x263F4E010])
  {
    if (v155 == *MEMORY[0x263F4DE90])
    {
      uint64_t v165 = sub_253DBE0B4();
      v166(v165);
      uint64_t v168 = v464;
      uint64_t v167 = v465;
      sub_253DBE880();
      long long v169 = v466;
      sub_253BEFD2C();
      v170();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      sub_253DBE338((__n128 *)v160, (__n128)xmmword_253DF6EC0);
      sub_253BEFD38();
      v171();
      sub_253DBE8E4();
      sub_253DF0600();
LABEL_6:
      uint64_t v172 = sub_253DBE09C();
      v173(v172);
      (*(void (**)(uint64_t, void (*)(void, void, void)))(v167 + 8))(v168, v169);
      return v160;
    }
    if (v155 == *MEMORY[0x263F4DEB8])
    {
      uint64_t v174 = sub_253DBE0B4();
      v175(v174);
      uint64_t v177 = v460;
      uint64_t v176 = v461;
      sub_253DBE880();
      sub_253BEFD2C();
      v178();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      sub_253DBE338((__n128 *)v160, (__n128)xmmword_253DF6EC0);
      sub_253BEFD38();
      v179();
      sub_253DF0450();
      uint64_t v180 = sub_253DBE09C();
      v181(v180);
      (*(void (**)(unsigned char *, uint64_t))(v177 + 8))(v141, v176);
      return v160;
    }
    if (v155 == *MEMORY[0x263F4DF50])
    {
      uint64_t v183 = sub_253DBE0B4();
      v184(v183);
      uint64_t v185 = v456;
      uint64_t v186 = v457;
      sub_253BEFD2C();
      v187();
      sub_253BDEDD8(&qword_26B2561F8);
      unint64_t v188 = v468;
      uint64_t v160 = sub_253C11408();
      *(_OWORD *)(v160 + 16) = xmmword_253DF6EC0;
      sub_253DF4180();
      uint64_t v467 = sub_253DF2BD0();
      sub_253DF2B40();
      uint64_t v189 = sub_253DF2B80();
      sub_253DBD1F0(v189);
      swift_bridgeObjectRelease();
      sub_253DF2B60();
      sub_253DF0370();
      (*(void (**)(uint64_t, void, uint64_t))(v188 + 104))(v160 + v151, *MEMORY[0x263F4C260], v469);
      (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v185, v462);
      return v160;
    }
    uint64_t v168 = v149;
    if (v155 == *MEMORY[0x263F4DEC0])
    {
      uint64_t v190 = sub_253DBDF0C();
      v191(v190);
      uint64_t v192 = v455;
      uint64_t v193 = v453;
      sub_253BEFD2C();
      v194();
      os_log_type_t v195 = v445;
      sub_253DF1740();
      uint64_t v196 = sub_253DF2490();
      os_log_type_t v197 = sub_253DF56D0();
      if (sub_253DB5D04(v197))
      {
        uint64_t v198 = (_WORD *)sub_253C0FDE0();
        sub_253C105CC(v198);
        sub_253DBE270(&dword_253BD8000, v196, v195, "XPCClientAvatar criticalError");
        sub_253DBDF24();
      }

      sub_253BEFBCC();
      v199();
      uint64_t v151 = *(void *)(v450 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_instrumentationSender + 24);
      sub_253BDF5F8((void *)(v450 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_instrumentationSender), v151);
      uint64_t v154 = (unsigned char *)(v192 + 16);
      uint64_t v149 = v459;
      v466 = *(void (**)(void, void, void))(v192 + 16);
      v466(v446, v459, v193);
      uint64_t v200 = sub_253DF5290();
      uint64_t v201 = v449;
      uint64_t *v449 = v200;
      v201[1] = v202;
      (*(void (**)(uint64_t *, void, uint64_t))(v447 + 104))(v201, *MEMORY[0x263F4D890], v448);
      sub_253DF42F0();
      sub_253C520A4();
      sub_253DF4310();
      sub_253DF2BF0();
      swift_release();
      sub_253DBDCE4(&qword_269D7E958, MEMORY[0x263F4D5F8]);
      unint64_t v203 = sub_253DF34A0();
      unint64_t v204 = v203;
      if (v203 >> 62)
      {
        uint64_t v205 = sub_253DF5AD0();
        if (v205) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v205 = *(void *)((v203 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v205)
        {
LABEL_17:
          uint64_t v465 = v192 + 16;
          uint64_t v470 = MEMORY[0x263F8EE78];
          sub_253DC76B0(0, v205 & ~(v205 >> 63), 0);
          if ((v205 & 0x8000000000000000) == 0)
          {
            uint64_t v206 = 0;
            uint64_t v207 = v470;
            uint64_t v208 = v454;
            uint64_t v209 = v443;
            do
            {
              if ((v204 & 0xC000000000000001) != 0) {
                MEMORY[0x25A26FC80](v206, v204);
              }
              else {
                id v210 = *(id *)(v204 + 8 * v206 + 32);
              }
              sub_253DEFF60();
              uint64_t v470 = v207;
              unint64_t v212 = *(void *)(v207 + 16);
              unint64_t v211 = *(void *)(v207 + 24);
              if (v212 >= v211 >> 1)
              {
                char v216 = sub_253DBE758(v211);
                sub_253DC76B0(v216, v217, v218);
                uint64_t v208 = v454;
                uint64_t v207 = v470;
              }
              ++v206;
              *(void *)(v207 + 16) = v212 + 1;
              sub_253DBE770();
              (*(void (**)(unint64_t, uint64_t, uint64_t))(v215 + 32))(v213 + v214 * v212, v209, v208);
            }
            while (v205 != v206);
            swift_bridgeObjectRelease();
            uint64_t v193 = v453;
            goto LABEL_74;
          }
          __break(1u);
          goto LABEL_86;
        }
      }
      swift_bridgeObjectRelease();
LABEL_74:
      sub_253DBDCE4(&qword_269D7E960, MEMORY[0x263F4D5F8]);
      swift_allocError();
      v466(v335, v459, v193);
      uint64_t v336 = v444;
      sub_253DEFF60();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBE5B8();
      *(_OWORD *)(v160 + 16) = xmmword_253DF6EC0;
      uint64_t v337 = v467;
      uint64_t v338 = v454;
      sub_253BEFD38();
      v339();
      sub_253DF03C0();
      uint64_t v340 = sub_253DBE7F4();
      v341(v340);
      (*(void (**)(uint64_t, uint64_t))(v337 + 8))(v336, v338);
      sub_253BEFBCC();
      v342();
      return v160;
    }
    if (v155 == *MEMORY[0x263F4DFD0])
    {
      uint64_t v219 = sub_253DBDF0C();
      v220(v219);
      sub_253DBE428();
      sub_253BEFD2C();
      v221();
      os_log_type_t v222 = v440;
      sub_253DF1740();
      uint64_t v223 = sub_253DF2490();
      os_log_type_t v224 = sub_253DF56D0();
      if (sub_253DB5D04(v224))
      {
        uint64_t v225 = (_WORD *)sub_253C0FDE0();
        sub_253C105CC(v225);
        sub_253DBE270(&dword_253BD8000, v223, v222, "XPCClientAvatar actionResponseGenerated");
        sub_253DBDF24();
      }
LABEL_29:

      sub_253BEFBCC();
      v226();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      *(_OWORD *)(v160 + 16) = xmmword_253DF6EC0;
      sub_253BEFD38();
      v227();
      uint64_t v228 = sub_253DBE09C();
      v229(v228);
      goto LABEL_30;
    }
    if (v155 == *MEMORY[0x263F4DFF8])
    {
      uint64_t v231 = sub_253DBDF0C();
      v232(v231);
      uint64_t v167 = v438;
      sub_253DBE880();
      sub_253DBE748();
      long long v169 = (void (*)(void, void, void))v439;
      sub_253BEFD2C();
      v233();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      sub_253DBE338((__n128 *)v160, (__n128)xmmword_253DF6EC0);
      sub_253BEFD38();
      v234();
      sub_253DBE8E4();
      sub_253DF0F70();
      goto LABEL_6;
    }
    if (v155 == *MEMORY[0x263F4DFF0])
    {
      uint64_t v235 = sub_253DBDF0C();
      v236(v235);
      sub_253DBE400();
      sub_253BEFD2C();
      v237();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      sub_253DBE4D0((__n128 *)v160, (__n128)xmmword_253DF6EC0);
      sub_253DF29F0();
      MEMORY[0x25A26CD20]();
      uint64_t v238 = sub_253DBE82C();
      MEMORY[0x25A26A620](v238);
LABEL_35:
      uint64_t v239 = sub_253DBE09C();
      v240(v239);
      uint64_t v241 = sub_253DBE798();
      v242(v241);
      return v160;
    }
    if (v155 == *MEMORY[0x263F4DF40])
    {
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v243 = sub_253DBE5B8();
      *(_OWORD *)(v243 + 16) = xmmword_253DF6EC0;
      sub_253DF0460();
      uint64_t v244 = sub_253DBE7F4();
      v245(v244);
      v246 = v154;
      uint64_t v160 = v243;
      (*(void (**)(unsigned char *, uint64_t))(v151 + 8))(v246, v149);
      return v160;
    }
    if (v155 == *MEMORY[0x263F4DF58])
    {
      uint64_t v247 = sub_253DBDF0C();
      v248(v247);
      sub_253DBE788();
      sub_253DBE400();
      uint64_t v249 = v435;
      sub_253BEFD2C();
      v250();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      sub_253DBE4D0((__n128 *)v160, (__n128)xmmword_253DF6EC0);
      uint64_t v251 = sub_253DF3570();
      MEMORY[0x25A26A860](v251);
LABEL_40:
      uint64_t v252 = sub_253DBE09C();
      v253(v252);
      (*(void (**)(uint64_t, uint64_t))(v149 + 8))(a1, v249);
      return v160;
    }
    if (v155 == *MEMORY[0x263F4DFE0])
    {
      uint64_t v254 = sub_253DBDF0C();
      v255(v254);
      sub_253DBE428();
      sub_253BEFD2C();
      v256();
      os_log_type_t v257 = v425;
      sub_253DF1740();
      uint64_t v223 = sub_253DF2490();
      os_log_type_t v258 = sub_253DF56D0();
      if (sub_253DB5D04(v258))
      {
        v259 = (_WORD *)sub_253C0FDE0();
        sub_253C105CC(v259);
        sub_253DBE270(&dword_253BD8000, v223, v257, "XPCClientAvatar systemResponseGenerated");
        sub_253DBDF24();
      }
      goto LABEL_29;
    }
    if (v155 == *MEMORY[0x263F4DF48])
    {
      uint64_t v260 = sub_253DBDF0C();
      v261(v260);
      sub_253DBE428();
      uint64_t v262 = v419;
      uint64_t v263 = v421;
      sub_253BEFD2C();
      v264();
      sub_253DBE820();
      sub_253BEFD38();
      v265();
      uint64_t v266 = v418;
      sub_253DF0F50();
      uint64_t v267 = v422;
      sub_253C0FD54(v266, 1, v422);
      if (v268)
      {
        sub_253BEFAC0(v266, &qword_26B255408);
        v141[1](v262, v263);
        return MEMORY[0x263F8EE78];
      }
      sub_253DBE788();
      uint64_t v289 = v409;
      sub_253BEFD2C();
      v290();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      sub_253DBE4D0((__n128 *)v160, (__n128)xmmword_253DF6EC0);
      sub_253BEFD38();
      v291();
      uint64_t v292 = sub_253DBE09C();
      v293(v292);
      (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v289, v267);
      goto LABEL_30;
    }
    if (v155 != *MEMORY[0x263F4DF68])
    {
      if (v155 == *MEMORY[0x263F4DF60])
      {
        uint64_t v294 = sub_253DBDF0C();
        v295(v294);
        sub_253DBE788();
        sub_253DBE400();
        uint64_t v249 = v400;
        sub_253BEFD2C();
        v296();
        sub_253BDEDD8(&qword_26B2561F8);
        uint64_t v160 = sub_253DBDD88();
        sub_253DBE4D0((__n128 *)v160, (__n128)xmmword_253DF6EC0);
        sub_253DF3590();
        sub_253DF35B0();
        sub_253DBE8E4();
        sub_253DF0520();
        goto LABEL_40;
      }
      if (v155 == *MEMORY[0x263F4E008])
      {
        uint64_t v318 = sub_253DBE0B4();
        v319(v318);
        sub_253DBE400();
        sub_253BEFD2C();
        v320();
        sub_253BDEDD8(&qword_26B2561F8);
        uint64_t v160 = sub_253DBDD88();
        sub_253DBE4D0((__n128 *)v160, (__n128)xmmword_253DF6EC0);
        sub_253DF29F0();
        MEMORY[0x25A26DE90]();
        uint64_t v321 = sub_253DBE82C();
        MEMORY[0x25A26A9D0](v321);
        goto LABEL_35;
      }
      if (v155 != *MEMORY[0x263F4DFA0])
      {
        if (v155 == *MEMORY[0x263F4DFB0])
        {
          uint64_t v346 = sub_253DBE0B4();
          v347(v346);
          uint64_t v167 = v382;
          sub_253DBE880();
          sub_253DBE748();
          long long v169 = (void (*)(void, void, void))v383;
          sub_253BEFD2C();
          v348();
          sub_253BDEDD8(&qword_26B2561F8);
          uint64_t v160 = sub_253DBDD88();
          sub_253DBE338((__n128 *)v160, (__n128)xmmword_253DF6EC0);
          sub_253BEFD38();
          v349();
          sub_253DBE8E4();
          sub_253DF0A70();
          goto LABEL_6;
        }
LABEL_86:
        if (v155 == *MEMORY[0x263F4E018])
        {
          sub_253BDEDD8(&qword_26B2561F8);
          uint64_t v160 = sub_253DBDD88();
          sub_253DBE654((__n128 *)v160, (__n128)xmmword_253DF6EC0);
          sub_253DF0760();
LABEL_94:
          uint64_t v379 = sub_253DBE09C();
          v380(v379);
          return v160;
        }
        if (v155 == *MEMORY[0x263F4DF30])
        {
          sub_253BDEDD8(&qword_26B2561F8);
          uint64_t v160 = sub_253DBDD88();
          sub_253DBE654((__n128 *)v160, (__n128)xmmword_253DF6EC0);
          sub_253DF0440();
          goto LABEL_94;
        }
        if (v155 == *MEMORY[0x263F4E020])
        {
          os_log_type_t v374 = v381[0];
          sub_253DF1740();
          v375 = sub_253DF2490();
          os_log_type_t v376 = sub_253DF56D0();
          if (sub_253DB5D04(v376))
          {
            v377 = (_WORD *)sub_253C0FDE0();
            sub_253C105CC(v377);
            sub_253DBE270(&dword_253BD8000, v375, v374, "XPCClientAvatar terminate");
            sub_253DBDF24();
          }

          sub_253BEFBCC();
          v378();
          sub_253BDEDD8(&qword_26B2561F8);
          uint64_t v160 = sub_253DBDD88();
          sub_253DBE654((__n128 *)v160, (__n128)xmmword_253DF6EC0);
          sub_253DF0770();
          goto LABEL_94;
        }
        (*(void (**)(unsigned char *, uint64_t))(v151 + 8))(v154, v149);
        return MEMORY[0x263F8EE78];
      }
      uint64_t v330 = sub_253DBE0B4();
      v331(v330);
      sub_253DBE428();
      sub_253DBE400();
      sub_253BEFD2C();
      v332();
      sub_253BDEDD8(&qword_26B2561F8);
      uint64_t v160 = sub_253DBDD88();
      sub_253DBE4D0((__n128 *)v160, (__n128)xmmword_253DF6EC0);
      sub_253DF3790();
      sub_253DBE840();
      sub_253DF37A0();
      sub_253DBCE98(v393);
      sub_253DBE840();
      sub_253DF3780();
      sub_253DF0590();
      uint64_t v333 = sub_253DBE09C();
      v334(v333);
LABEL_30:
      sub_253BEFD20();
      v230();
      return v160;
    }
    uint64_t v269 = sub_253DBDF0C();
    v270(v269);
    sub_253DBE748();
    sub_253BEFD2C();
    v271();
    uint64_t v272 = v417;
    sub_253DF3620();
    int v273 = (*(uint64_t (**)(uint64_t, uint64_t))(v415 + 88))(v272, v416);
    if (v273 == *MEMORY[0x263F4D7B8])
    {
      uint64_t v274 = sub_253DBE150();
      v275(v274);
      sub_253BEFD2C();
      v276();
      sub_253DF2F50();
      sub_253DF35E0();
      uint64_t v277 = v408;
      sub_253DF35F0();
      uint64_t v278 = v404;
      sub_253C56520(v277, v404, &qword_26B255EF0);
      uint64_t v279 = 1;
      sub_253C0FD54(v278, 1, v414);
      if (!v268)
      {
        uint64_t v280 = v403;
        sub_253DBE51C();
        uint64_t v281 = v414;
        sub_253BEFD2C();
        v282();
        uint64_t v283 = sub_253DF29F0();
        uint64_t v285 = v284;
        uint64_t v286 = MEMORY[0x25A26DE90]();
        MEMORY[0x25A26A9D0](v283, v285, v286);
        (*(void (**)(uint64_t, uint64_t))(v280 + 8))(1, v281);
        uint64_t v279 = 0;
      }
      uint64_t v287 = sub_253DF06B0();
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v405, v279, 1, v287);
      sub_253BEFAC0(v408, &qword_26B255EF0);
      sub_253DBE80C();
      sub_253DF05D0();
      sub_253BEFBCC();
      v288();
    }
    else if (v273 == *MEMORY[0x263F4D7C0])
    {
      uint64_t v297 = sub_253DBE150();
      v298(v297);
      sub_253BEFD2C();
      uint64_t v300 = v299();
      uint64_t v301 = MEMORY[0x25A26D300](v300);
      uint64_t v302 = *(void *)(v301 + 16);
      if (v302)
      {
        uint64_t v470 = MEMORY[0x263F8EE78];
        sub_253DC764C(0, v302, 0);
        uint64_t v303 = *(void *)(v433 + 16);
        unint64_t v304 = v301 + ((*(unsigned __int8 *)(v433 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v433 + 80));
        v466 = *(void (**)(void, void, void))(v433 + 72);
        uint64_t v467 = v303;
        v433 += 16;
        v305 = (void (**)(uint64_t, uint64_t))(v433 - 8);
        uint64_t v465 = v432 + 32;
        uint64_t v306 = v430;
        do
        {
          uint64_t v307 = v429;
          sub_253BEFD38();
          v308();
          sub_253DF2F50();
          sub_253DBE840();
          sub_253DF3890();
          sub_253DF0650();
          (*v305)(v307, v306);
          uint64_t v309 = v470;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_253DC764C(0, *(void *)(v309 + 16) + 1, 1);
            uint64_t v309 = v470;
          }
          unint64_t v148 = *(void *)(v309 + 16);
          unint64_t v310 = *(void *)(v309 + 24);
          uint64_t v311 = v431;
          if (v148 >= v310 >> 1)
          {
            char v315 = sub_253DBE758(v310);
            sub_253DC764C(v315, v316, v317);
            uint64_t v309 = v470;
          }
          *(void *)(v309 + 16) = v148 + 1;
          sub_253DBE770();
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v314 + 32))(v312 + v313 * v148, v311, v428);
          uint64_t v470 = v309;
          v304 += (unint64_t)v466;
          --v302;
        }
        while (v302);
      }
      swift_bridgeObjectRelease();
      sub_253DF35E0();
      sub_253DBE840();
      sub_253DF35F0();
      uint64_t v350 = v148;
      uint64_t v351 = v396;
      sub_253C56520(v350, v396, &qword_26B255EF0);
      uint64_t v279 = 1;
      sub_253C0FD54(v351, 1, v414);
      if (!v268)
      {
        sub_253DBE51C();
        sub_253BEFD2C();
        v352();
        uint64_t v353 = sub_253DF29F0();
        uint64_t v355 = v354;
        uint64_t v356 = MEMORY[0x25A26DE90]();
        MEMORY[0x25A26A9D0](v353, v355, v356);
        uint64_t v357 = sub_253DBE798();
        v358(v357);
        uint64_t v279 = 0;
      }
      uint64_t v359 = sub_253DF06B0();
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v397, v279, 1, v359);
      sub_253BEFAC0(v398, &qword_26B255EF0);
      sub_253DBE80C();
      sub_253DF0610();
      sub_253BEFBCC();
      v360();
    }
    else
    {
      if (v273 != *MEMORY[0x263F4D750])
      {
        uint64_t v279 = v410;
        uint64_t v343 = v469;
        _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v410, 1, 1, v469);
        sub_253BEFBCC();
        v344();
        unint64_t v345 = v468;
LABEL_82:
        uint64_t v363 = v413;
        sub_253DBDC7C(v279, v413);
        sub_253BDEDD8(&qword_26B2561F8);
        unint64_t v468 = ((*(unsigned __int8 *)(v345 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v345 + 80))
             + *(void *)(v345 + 72);
        uint64_t v364 = swift_allocObject();
        *(_OWORD *)(v364 + 16) = xmmword_253DF6EC0;
        uint64_t v469 = v364;
        sub_253BEFD38();
        v365();
        sub_253DF0560();
        uint64_t v366 = sub_253DBE5E4();
        v367(v366);
        uint64_t v368 = v412;
        sub_253C56520(v363, v412, &qword_26B255388);
        sub_253C0FD54(v368, 1, v343);
        if (v268)
        {
          sub_253BEFAC0(v363, &qword_26B255388);
          uint64_t v369 = sub_253DBE8F0();
          v370(v369);
          sub_253BEFAC0(v368, &qword_26B255388);
          return v469;
        }
        v371 = *(void (**)(void))(v345 + 32);
        sub_253DBE86C();
        v371();
        sub_253DBE820();
        sub_253BEFD38();
        v372();
        uint64_t v160 = sub_253DC48CC(1, 2, 1, v469);
        *(void *)(v160 + 16) = 2;
        sub_253DBE86C();
        v371();
        sub_253BEFD20();
        v373();
        sub_253BEFAC0(v363, &qword_26B255388);
        uint64_t v163 = sub_253DBE8F0();
        goto LABEL_3;
      }
      uint64_t v322 = sub_253DBE150();
      v323(v322);
      sub_253DBE428();
      sub_253BEFD2C();
      v324();
      sub_253DBE820();
      sub_253BEFD38();
      v325();
      uint64_t v326 = v388;
      sub_253DF0FA0();
      (*(void (**)(uint64_t, void, uint64_t))(v386 + 104))(v326, *MEMORY[0x263F4C2B0], v387);
      uint64_t v327 = sub_253DF05A0();
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v391, 1, 1, v327);
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v385, 1, 1, v384);
      uint64_t v328 = sub_253DF06C0();
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v392, 1, 1, v328);
      uint64_t v279 = v410;
      sub_253DF0730();
      sub_253BEFD20();
      v329();
    }
    unint64_t v345 = v468;
    uint64_t v343 = v469;
    uint64_t v361 = sub_253DBE5E4();
    v362(v361);
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v279, 0, 1, v343);
    goto LABEL_82;
  }
  uint64_t v156 = sub_253DBE0B4();
  v157(v156);
  sub_253BEFD2C();
  v158();
  sub_253BDEDD8(&qword_26B2561F8);
  unint64_t v159 = v468;
  uint64_t v160 = sub_253C11408();
  sub_253DBE4D0((__n128 *)v160, (__n128)xmmword_253DF6EC0);
  sub_253BEFD38();
  v161();
  sub_253DF0720();
  (*(void (**)(uint64_t, void, uint64_t))(v159 + 104))(v151, *MEMORY[0x263F4C508], v469);
  unint64_t v162 = *(void (**)(uint64_t, uint64_t))(v144 + 8);
  uint64_t v163 = v148;
  uint64_t v164 = v142;
LABEL_3:
  v162(v163, v164);
  return v160;
}

uint64_t sub_253DBCE98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_253DF2E40();
  sub_253C0F830();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253DBE820();
  sub_253BEFD38();
  v8();
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v2);
  if (v9 == *MEMORY[0x263F4D710])
  {
    sub_253BEFD20();
    v10();
    uint64_t v11 = (unsigned int *)MEMORY[0x263F4C3E0];
LABEL_5:
    uint64_t v13 = *v11;
    sub_253DF0580();
    sub_253BDF7F0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 104))(a1, v13);
  }
  if (v9 == *MEMORY[0x263F4D708])
  {
    sub_253BEFD20();
    v12();
    uint64_t v11 = (unsigned int *)MEMORY[0x263F4C3D8];
    goto LABEL_5;
  }
  uint64_t result = sub_253DF5C80();
  __break(1u);
  return result;
}

uint64_t sub_253DBD000()
{
  sub_253C4C314(v0 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_sessionId);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0(v0 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_clientReverseClientDistributor);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0(v0 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_instrumentationSender);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0(v0 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_actionSummaryRetriever);
  sub_253BEFAC0(v0 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_latestClientSentQueryEventId, &qword_26B2519D0);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_253DBD078()
{
  sub_253DBD000();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_253DBD0A4()
{
  return type metadata accessor for XPCClientAvatar();
}

uint64_t type metadata accessor for XPCClientAvatar()
{
  uint64_t result = qword_26B2555B8;
  if (!qword_26B2555B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_253DBD0F4()
{
  sub_253DF0C70();
  if (v0 <= 0x3F)
  {
    sub_253C178CC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

_UNKNOWN **sub_253DBD1D8()
{
  return &off_270366B38;
}

_UNKNOWN **sub_253DBD1E4()
{
  return &off_270366B60;
}

uint64_t sub_253DBD1F0(uint64_t a1)
{
  uint64_t v69 = sub_253DF4BA0();
  uint64_t v2 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v68 = &v56[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v67 = sub_253DF2BB0();
  uint64_t v4 = *(void *)(v67 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v67);
  uint64_t v66 = &v56[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v65 = &v56[-v7];
  uint64_t v81 = sub_253DF0350();
  uint64_t v8 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v89 = &v56[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_253DF2B70();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v56[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v85 = &v56[-v16];
  MEMORY[0x270FA5388](v15);
  uint64_t v90 = &v56[-v17];
  sub_253BDEDD8(&qword_269D7E968);
  uint64_t v18 = sub_253DF5AE0();
  uint64_t v19 = v18;
  int64_t v20 = 0;
  uint64_t v80 = a1;
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v22 = a1 + 64;
  uint64_t v21 = v23;
  uint64_t v24 = 1 << *(unsigned char *)(v22 - 32);
  uint64_t v25 = -1;
  if (v24 < 64) {
    uint64_t v25 = ~(-1 << v24);
  }
  unint64_t v26 = v25 & v21;
  uint64_t v70 = v22;
  int64_t v71 = (unint64_t)(v24 + 63) >> 6;
  uint64_t v77 = v11 + 88;
  uint64_t v78 = v11 + 16;
  int v76 = *MEMORY[0x263F4D578];
  int v63 = *MEMORY[0x263F4D570];
  uint64_t v75 = (void (**)(unsigned char *, uint64_t))(v11 + 96);
  uint64_t v62 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 32);
  uint64_t v61 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16);
  uint64_t v60 = (void (**)(unsigned char *, uint64_t))(v4 + 8);
  uint64_t v27 = v11;
  uint64_t v84 = (void (**)(unsigned char *, uint64_t))(v11 + 8);
  unsigned int v59 = *MEMORY[0x263F4C248];
  uint64_t v74 = v8 + 104;
  uint64_t v58 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v2 + 32);
  unsigned int v57 = *MEMORY[0x263F4C250];
  uint64_t v82 = v8;
  uint64_t v83 = v14;
  uint64_t v72 = v8 + 32;
  uint64_t v73 = v18 + 64;
  uint64_t v79 = v18;
  uint64_t v64 = v11;
  if (!v26) {
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v86 = (v26 - 1) & v26;
  int64_t v87 = v20;
  unint64_t v28 = __clz(__rbit64(v26)) | (v20 << 6);
  uint64_t v29 = v85;
  while (1)
  {
    uint64_t v34 = *(void *)(v80 + 56);
    uint64_t v35 = (uint64_t *)(*(void *)(v80 + 48) + 16 * v28);
    uint64_t v36 = v35[1];
    uint64_t v88 = *v35;
    uint64_t v37 = *(void (**)(unsigned char *, unint64_t, uint64_t))(v27 + 16);
    uint64_t v38 = v90;
    v37(v90, v34 + *(void *)(v27 + 72) * v28, v10);
    v37(v29, (unint64_t)v38, v10);
    v37(v14, (unint64_t)v29, v10);
    int v39 = (*(uint64_t (**)(unsigned char *, uint64_t))(v27 + 88))(v14, v10);
    if (v39 == v76)
    {
      uint64_t v40 = *v84;
      swift_bridgeObjectRetain();
      v40(v29, v10);
      (*v75)(v14, v10);
      (*v58)(v89, v14, v69);
      uint64_t v41 = v57;
      uint64_t v42 = v36;
    }
    else
    {
      uint64_t v42 = v36;
      if (v39 != v63) {
        goto LABEL_30;
      }
      uint64_t v43 = v83;
      (*v75)(v83, v10);
      uint64_t v44 = v65;
      uint64_t v45 = v67;
      (*v62)(v65, v43, v67);
      uint64_t v46 = v66;
      (*v61)(v66, v44, v45);
      swift_bridgeObjectRetain();
      sub_253DF2BA0();
      sub_253DF2B90();
      sub_253DF0360();
      uint64_t v47 = *v60;
      (*v60)(v46, v45);
      uint64_t v40 = *v84;
      (*v84)(v85, v10);
      v47(v44, v45);
      uint64_t v41 = v59;
      uint64_t v27 = v64;
    }
    uint64_t v48 = v81;
    uint64_t v49 = v82;
    uint64_t v50 = v89;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v82 + 104))(v89, v41, v81);
    v40(v90, v10);
    *(void *)(v73 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t v19 = v79;
    uint64_t v51 = (void *)(*(void *)(v79 + 48) + 16 * v28);
    void *v51 = v88;
    v51[1] = v42;
    (*(void (**)(unint64_t, unsigned char *, uint64_t))(v49 + 32))(*(void *)(v19 + 56) + *(void *)(v49 + 72) * v28, v50, v48);
    uint64_t v52 = *(void *)(v19 + 16);
    BOOL v53 = __OFADD__(v52, 1);
    uint64_t v54 = v52 + 1;
    if (v53)
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    *(void *)(v19 + 16) = v54;
    uint64_t v14 = v83;
    unint64_t v26 = v86;
    int64_t v20 = v87;
    if (v86) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v30 = v20 + 1;
    uint64_t v29 = v85;
    if (__OFADD__(v20, 1)) {
      goto LABEL_28;
    }
    if (v30 >= v71) {
      return v19;
    }
    unint64_t v31 = *(void *)(v70 + 8 * v30);
    int64_t v32 = v20 + 1;
    if (!v31)
    {
      int64_t v32 = v20 + 2;
      if (v20 + 2 >= v71) {
        return v19;
      }
      unint64_t v31 = *(void *)(v70 + 8 * v32);
      if (!v31)
      {
        int64_t v32 = v20 + 3;
        if (v20 + 3 >= v71) {
          return v19;
        }
        unint64_t v31 = *(void *)(v70 + 8 * v32);
        if (!v31) {
          break;
        }
      }
    }
LABEL_18:
    uint64_t v86 = (v31 - 1) & v31;
    int64_t v87 = v32;
    unint64_t v28 = __clz(__rbit64(v31)) + (v32 << 6);
  }
  uint64_t v33 = v20 + 4;
  if (v20 + 4 >= v71) {
    return v19;
  }
  unint64_t v31 = *(void *)(v70 + 8 * v33);
  if (v31)
  {
    int64_t v32 = v20 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v32 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v32 >= v71) {
      return v19;
    }
    unint64_t v31 = *(void *)(v70 + 8 * v32);
    ++v33;
    if (v31) {
      goto LABEL_18;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  swift_bridgeObjectRetain();
  uint64_t result = sub_253DF5C80();
  __break(1u);
  return result;
}

uint64_t sub_253DBD9B4(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  uint64_t v17 = type metadata accessor for SessionReverseClientDistributor(0);
  uint64_t v18 = &off_270361D18;
  v16[0] = a2;
  type metadata accessor for XPCClientAvatar();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = sub_253C31DA4((uint64_t)v16, v17);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (void *)((char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = sub_253DBDAE8(a1, *v11, a3, a4, v8);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0((uint64_t)v16);
  return v13;
}

uint64_t sub_253DBDAE8(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_253BDEDD8(&qword_26B2519D0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for ToolInvocationSummaryRetriever();
  uint64_t v23 = &protocol witness table for ToolInvocationSummaryRetriever;
  *(void *)&long long v21 = a4;
  uint64_t v19 = type metadata accessor for SessionReverseClientDistributor(0);
  int64_t v20 = &off_270361D18;
  *(void *)&long long v18 = a2;
  swift_defaultActor_initialize();
  uint64_t v13 = a5 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_latestClientSentQueryEventId;
  uint64_t v14 = sub_253DEFE90();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v13, 1, 1, v14);
  sub_253BDB0FC(a1, a5 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_sessionId);
  sub_253BDB0E4(&v18, a5 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_clientReverseClientDistributor);
  sub_253BDB0E4(a3, a5 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_instrumentationSender);
  sub_253BDB0E4(&v21, a5 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_actionSummaryRetriever);
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v12, 1, 1, v14);
  uint64_t v15 = a5 + OBJC_IVAR____TtC23IntelligenceFlowRuntime15XPCClientAvatar_latestClientSentQueryEventId;
  swift_beginAccess();
  sub_253D9B7BC((uint64_t)v12, v15);
  swift_endAccess();
  return a5;
}

uint64_t sub_253DBDC7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253BDEDD8(&qword_26B255388);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_253DBDCE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_253DBDD2C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_253BDF7F0();
  sub_253C0FF48();
  v4();
  return a2;
}

uint64_t sub_253DBDD88()
{
  return swift_allocObject();
}

uint64_t sub_253DBDDB4()
{
  *(_DWORD *)(v1 - 80) = *(_DWORD *)(v0 + 484);
  uint64_t result = *(void *)(v0 + 256);
  *(void *)(v1 - 88) = *(void *)(v0 + 224);
  *(void *)(v1 - 96) = *(void *)(v0 + 120);
  return result;
}

uint64_t sub_253DBDE2C()
{
  *(void *)(v1 - 88) = *(void *)(v0 + 104);
  return swift_task_dealloc();
}

uint64_t sub_253DBDE9C()
{
  uint64_t v3 = v0[13];
  *(void *)(v1 - 96) = v0[14];
  *(void *)(v1 - 88) = v3;
  *(void *)(v1 - 80) = v0[10];
  return swift_task_dealloc();
}

uint64_t sub_253DBDF0C()
{
  return v0;
}

void sub_253DBDF24()
{
  JUMPOUT(0x25A2709B0);
}

uint64_t sub_253DBDF40()
{
  *(_DWORD *)(v1 - 80) = *(_DWORD *)(v0 + 484);
  uint64_t result = *(void *)(v0 + 256);
  *(void *)(v1 - 88) = *(void *)(v0 + 224);
  *(void *)(v1 - 96) = *(void *)(v0 + 120);
  return result;
}

uint64_t sub_253DBDFBC()
{
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v2 + 16);
  v2 += 16;
  *(_DWORD *)(v0 + 504) = *(_DWORD *)(v2 + 64);
  *(void *)(v0 + 456) = *(void *)(v2 + 56);
  *(void *)(v0 + 464) = v3;
  *(void *)(v0 + 472) = 0;
  uint64_t v5 = *(void *)(v0 + 192);
  *(void *)(v1 - 88) = *(void *)(v0 + 160);
  return v5;
}

uint64_t sub_253DBE038()
{
  return *(void *)(v0 + 352);
}

uint64_t sub_253DBE078()
{
  return *(void *)(v0 + 352);
}

uint64_t sub_253DBE09C()
{
  return v0;
}

uint64_t sub_253DBE0B4()
{
  return v0;
}

uint64_t sub_253DBE0CC()
{
  uint64_t v3 = v0[14];
  *(void *)(v1 - 104) = v0[17];
  *(void *)(v1 - 96) = v3;
  uint64_t v4 = v0[10];
  *(void *)(v1 - 88) = v0[13];
  *(void *)(v1 - 80) = v4;
  return swift_task_dealloc();
}

uint64_t sub_253DBE138()
{
  return v0;
}

uint64_t sub_253DBE150()
{
  return *(void *)(v0 - 608);
}

uint64_t sub_253DBE17C()
{
  return *(void *)(v0 + 368);
}

uint64_t sub_253DBE1C0()
{
  return v0;
}

uint64_t sub_253DBE1F0()
{
  return v0;
}

uint64_t sub_253DBE21C()
{
  return sub_253DF0E90();
}

uint64_t sub_253DBE24C()
{
  return *(void *)(v0 + 264);
}

void sub_253DBE270(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t sub_253DBE288()
{
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v1, 1, v0);
}

uint64_t sub_253DBE2B8()
{
  v0[53] = v1;
  v0[54] = v2;
  return v0[10] + v0[49];
}

uint64_t sub_253DBE2D4()
{
  return v0;
}

uint64_t sub_253DBE300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  return a21;
}

__n128 *sub_253DBE338(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

__n128 sub_253DBE34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __n128 a19)
{
  *(void *)(v20 - 80) = a1;
  __n128 result = a19;
  *uint64_t v19 = a19.n128_u32[0];
  return result;
}

uint64_t sub_253DBE37C()
{
  return v0;
}

uint64_t sub_253DBE394()
{
  sub_253BDF5F8(v0, v0[3]);
  return sub_253DF4210();
}

uint64_t sub_253DBE3CC()
{
  return sub_253DF0E90();
}

uint64_t sub_253DBE400()
{
  return *(void *)(v0 - 256);
}

uint64_t sub_253DBE410()
{
  return v0;
}

void sub_253DBE438()
{
  ++*(void *)(v0 + 416);
}

uint64_t sub_253DBE450(void *a1)
{
  sub_253BDF5F8(a1, v1);
  uint64_t result = v2 + 16;
  *(void *)(v3 - 80) = v2 + 16;
  return result;
}

uint64_t sub_253DBE478(void *a1)
{
  sub_253BDF5F8(a1, v1);
  uint64_t result = v2 + 8;
  *(void *)(v3 - 80) = v2 + 8;
  return result;
}

uint64_t sub_253DBE4A0()
{
  return sub_253DF0E90();
}

__n128 *sub_253DBE4D0(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t sub_253DBE4DC()
{
  *(void *)(v1 - 88) = v0;
  return swift_slowAlloc();
}

uint64_t sub_253DBE4FC()
{
  return MEMORY[0x270F3DD38](v1, v0);
}

uint64_t sub_253DBE51C()
{
  return *(void *)(v0 - 752);
}

uint64_t sub_253DBE530()
{
  return *(void *)(v0 + 344);
}

uint64_t sub_253DBE544()
{
  return v0;
}

void sub_253DBE564()
{
}

uint64_t sub_253DBE584()
{
  return sub_253DF5250();
}

uint64_t sub_253DBE5A4()
{
  return v0;
}

uint64_t sub_253DBE5B8()
{
  return swift_allocObject();
}

uint64_t sub_253DBE5E4()
{
  return v0;
}

uint64_t sub_253DBE600()
{
  return v0;
}

uint64_t sub_253DBE61C()
{
  return v0;
}

uint64_t sub_253DBE638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  return a23;
}

__n128 *sub_253DBE654(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t sub_253DBE664()
{
  return v0;
}

uint64_t sub_253DBE674()
{
  return *(void *)(v0 - 88);
}

void sub_253DBE684(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void sub_253DBE69C()
{
  ++*(void *)(v0 + 432);
}

uint64_t sub_253DBE6B4(uint64_t result)
{
  *(void *)(v1 + 456) = result;
  return result;
}

BOOL sub_253DBE6C0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_253DBE6DC()
{
  return sub_253DF4180();
}

uint64_t sub_253DBE6F8()
{
  return sub_253DF4410();
}

uint64_t sub_253DBE714(uint64_t result)
{
  *(void *)(v1 + 448) = result;
  return result;
}

uint64_t sub_253DBE724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  return a21;
}

uint64_t sub_253DBE73C()
{
  return *(void *)(v0 + 344);
}

uint64_t sub_253DBE748()
{
  return *(void *)(v0 - 256);
}

BOOL sub_253DBE758@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_253DBE798()
{
  return v0;
}

uint64_t sub_253DBE7B0()
{
  return swift_arrayDestroy();
}

uint64_t sub_253DBE7CC()
{
  return v0;
}

uint64_t sub_253DBE7E4(uint64_t result)
{
  *(void *)(v1 + 440) = result;
  *(void *)(v1 + 448) = *(void *)(result + 16);
  return result;
}

uint64_t sub_253DBE7F4()
{
  return v0;
}

uint64_t sub_253DBE80C()
{
  return v0;
}

uint64_t sub_253DBE82C()
{
  return v0;
}

uint64_t sub_253DBE84C()
{
  return MEMORY[0x270F3DD38](v1, v0);
}

uint64_t sub_253DBE88C()
{
  *(void *)(v1 - 104) = sub_253BDF5F8(v0, v0[3]);
  return sub_253DF4210();
}

uint64_t sub_253DBE8C4()
{
  return sub_253DF2BF0();
}

uint64_t sub_253DBE8E4()
{
  return v0;
}

uint64_t sub_253DBE8F0()
{
  return v0;
}

uint64_t sub_253DBE904(uint64_t a1)
{
  uint64_t v3 = sub_253DF4BE0();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v23 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_253DF4E50();
  uint64_t v5 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  long long v18 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (v7)
  {
    uint64_t v17 = v1;
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_253DC7778(0, v7, 0);
    uint64_t v8 = v27;
    uint64_t v9 = *(void *)(sub_253DF0050() - 8);
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v20 = *(void *)(v9 + 72);
    uint64_t v21 = v5;
    uint64_t v19 = v5 + 32;
    uint64_t v11 = v18;
    do
    {
      uint64_t v26 = v7;
      uint64_t v12 = sub_253DF0030();
      uint64_t v24 = v13;
      uint64_t v25 = v12;
      sub_253DF0030();
      sub_253DF0020();
      sub_253DF0040();
      sub_253DF4E20();
      uint64_t v27 = v8;
      unint64_t v15 = *(void *)(v8 + 16);
      unint64_t v14 = *(void *)(v8 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_253DC7778(v14 > 1, v15 + 1, 1);
        uint64_t v11 = v18;
        uint64_t v8 = v27;
      }
      *(void *)(v8 + 16) = v15 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v8+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v15, v11, v22);
      v10 += v20;
      uint64_t v7 = v26 - 1;
    }
    while (v26 != 1);
  }
  return v8;
}

uint64_t sub_253DBEBAC(uint64_t a1)
{
  uint64_t v17 = sub_253DF5040();
  uint64_t v3 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (!v6) {
    return MEMORY[0x263F8EE78];
  }
  v15[0] = v1;
  uint64_t v18 = MEMORY[0x263F8EE78];
  sub_253DC7714(0, v6, 0);
  uint64_t v8 = v18;
  uint64_t v9 = *(void *)(sub_253DF0010() - 8);
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v16 = *(void *)(v9 + 72);
  v15[1] = v3 + 32;
  do
  {
    sub_253DF0000();
    sub_253DEFFF0();
    uint64_t v11 = v7;
    sub_253DF5030();
    uint64_t v18 = v8;
    unint64_t v13 = *(void *)(v8 + 16);
    unint64_t v12 = *(void *)(v8 + 24);
    if (v13 >= v12 >> 1)
    {
      sub_253DC7714(v12 > 1, v13 + 1, 1);
      uint64_t v8 = v18;
    }
    *(void *)(v8 + 16) = v13 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v13, v5, v17);
    v10 += v16;
    --v6;
    uint64_t v7 = v11;
  }
  while (v6);
  return v8;
}

uint64_t sub_253DBEDD0(uint64_t a1)
{
  uint64_t v17 = sub_253DF5040();
  uint64_t v3 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (!v6) {
    return MEMORY[0x263F8EE78];
  }
  v15[0] = v1;
  uint64_t v18 = MEMORY[0x263F8EE78];
  sub_253DC7714(0, v6, 0);
  uint64_t v8 = v18;
  uint64_t v9 = *(void *)(sub_253DF0010() - 8);
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v16 = *(void *)(v9 + 72);
  v15[1] = v3 + 32;
  do
  {
    sub_253DF0000();
    sub_253DEFFF0();
    uint64_t v11 = v7;
    sub_253DF5020();
    uint64_t v18 = v8;
    unint64_t v13 = *(void *)(v8 + 16);
    unint64_t v12 = *(void *)(v8 + 24);
    if (v13 >= v12 >> 1)
    {
      sub_253DC7714(v12 > 1, v13 + 1, 1);
      uint64_t v8 = v18;
    }
    *(void *)(v8 + 16) = v13 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v13, v5, v17);
    v10 += v16;
    --v6;
    uint64_t v7 = v11;
  }
  while (v6);
  return v8;
}

void sub_253DBEFEC()
{
}

void sub_253DBF02C()
{
}

void sub_253DBF06C()
{
}

void sub_253DBF0A0()
{
  sub_253DBFE2C();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = v4;
  if (!swift_isUniquelyReferenced_nonNull_native() || v3 > *(void *)(v1 + 24) >> 1)
  {
    sub_253DBFE20();
    sub_253DC39C0();
    uint64_t v1 = v7;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  sub_253DBFE0C();
  if (v9 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_253DC5F8C(v6 + 32, v2, v1 + 16 * v8 + 32);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  sub_253DBFE54();
  if (!v5)
  {
    *(void *)(v1 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_253DBF15C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_253DF5AD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_253DF5AD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x25A26FC90](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    uint64_t result = sub_253DBFC38(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_253DF5AD0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_253DF53D0();
}

void sub_253DBF324()
{
}

void sub_253DBF364()
{
}

void sub_253DBF3A4()
{
}

void sub_253DBF3D8()
{
  sub_253DBFE40();
  if (v8)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!sub_253DBFDE8() || v7 > *(void *)(v2 + 24) >> 1)
  {
    sub_253DBFE20();
    uint64_t v2 = v6();
  }
  if (!*(void *)(v0 + 16))
  {
    if (!v3) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(v2 + 16);
  uint64_t v10 = (*(void *)(v2 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_253BDEDD8(v5) - 8);
  if (v10 < v3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v4(v0 + v12, v3, v2 + v12 + *(void *)(v11 + 72) * v9);
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v2;
    return;
  }
  sub_253DBFE54();
  if (!v8)
  {
    *(void *)(v2 + 16) = v13;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_253DBF4EC()
{
  sub_253DBFE2C();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = v4;
  if (!swift_isUniquelyReferenced_nonNull_native() || v3 > *(void *)(v1 + 24) >> 1)
  {
    sub_253DBFE20();
    sub_253DC4A78();
    uint64_t v1 = v7;
  }
  if (!*(void *)(v6 + 16))
  {
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  sub_253DBFE0C();
  if (v8 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_253DC6420(v6 + 32, v2);
  if (!v2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v0 = v1;
    return;
  }
  sub_253DBFE54();
  if (!v5)
  {
    *(void *)(v1 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_253DBF5AC()
{
}

void sub_253DBF5EC()
{
  sub_253DBFE40();
  if (v8)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!sub_253DBFDE8() || v7 > *(void *)(v2 + 24) >> 1)
  {
    sub_253DBFE20();
    uint64_t v2 = v6();
  }
  if (!*(void *)(v0 + 16))
  {
    if (!v3) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  uint64_t v9 = *(void *)(v2 + 16);
  uint64_t v10 = (*(void *)(v2 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(v5(0) - 8);
  if (v10 < v3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v4(v0 + v12, v3, v2 + v12 + *(void *)(v11 + 72) * v9);
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *uint64_t v1 = v2;
    return;
  }
  sub_253DBFE54();
  if (!v8)
  {
    *(void *)(v2 + 16) = v13;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t ClientAction.Definition.toolDefinition.getter()
{
  uint64_t v42 = sub_253DF4990();
  sub_253C0F830();
  uint64_t v41 = v0;
  MEMORY[0x270FA5388](v1);
  sub_253C10D28();
  uint64_t v40 = v3 - v2;
  uint64_t v43 = sub_253DF49B0();
  MEMORY[0x270FA5388](v43);
  sub_253C10D28();
  uint64_t v4 = sub_253BDEDD8(&qword_26B255FA0);
  uint64_t v5 = sub_253BDF9FC(v4);
  MEMORY[0x270FA5388](v5);
  sub_253C10D28();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_253BDEDD8(&qword_26B255FB0);
  uint64_t v10 = sub_253BDF9FC(v9);
  MEMORY[0x270FA5388](v10);
  sub_253C10D28();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_253BDEDD8(&qword_26B255FC8);
  uint64_t v15 = sub_253BDF9FC(v14);
  MEMORY[0x270FA5388](v15);
  sub_253C10D28();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_253DF4BE0();
  uint64_t v20 = sub_253BDF9FC(v19);
  MEMORY[0x270FA5388](v20);
  sub_253C10D28();
  uint64_t v21 = sub_253DF4810();
  sub_253C0F830();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  sub_253C10D28();
  uint64_t v27 = v26 - v25;
  sub_253DF0030();
  sub_253DF0030();
  (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v27, *MEMORY[0x263F80088], v21);
  uint64_t v28 = sub_253DF0080();
  sub_253DBE904(v28);
  swift_bridgeObjectRelease();
  sub_253DF0070();
  uint64_t v29 = sub_253DF4BF0();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v18, 1, 1, v29);
  uint64_t v30 = sub_253DF49C0();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v13, 1, 1, v30);
  uint64_t v31 = sub_253DF49A0();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v8, 1, 1, v31);
  if (sub_253DF0060())
  {
    sub_253BDEDD8(&qword_269D7E970);
    uint64_t v32 = sub_253DF4630();
    sub_253C0F830();
    uint64_t v34 = v33;
    unint64_t v35 = (*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_253DF6EC0;
    (*(void (**)(unint64_t, void, uint64_t))(v34 + 104))(v36 + v35, *MEMORY[0x263F7FE78], v32);
  }
  uint64_t v37 = sub_253DF00A0();
  sub_253DBEBAC(v37);
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_253DF0090();
  sub_253DBEDD0(v38);
  swift_bridgeObjectRelease();
  sub_253DBF5EC();
  sub_253DBFBE8();
  sub_253BDEDD8(&qword_26B256038);
  sub_253C2DC88(&qword_26B256040, &qword_26B256038);
  sub_253DF5890();
  (*(void (**)(uint64_t, void, uint64_t))(v41 + 104))(v40, *MEMORY[0x263F80230], v42);
  return sub_253DF46B0();
}

unint64_t sub_253DBFBE8()
{
  unint64_t result = qword_26B255FA8;
  if (!qword_26B255FA8)
  {
    sub_253DF49B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B255FA8);
  }
  return result;
}

uint64_t sub_253DBFC38(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_253DF5AD0();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_253DF5AD0();
      unint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_253C2DC88(&qword_269D7E980, &qword_269D7E978);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_253BDEDD8(&qword_269D7E978);
            uint64_t v10 = sub_253C59214(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_253DC616C((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10));
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_253DBFDE8()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_253DBFE60(uint64_t a1)
{
  uint64_t v14 = sub_253DF46F0();
  sub_253BE1888();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_253C16A90();
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_253DC7554(0, v6, 0);
    uint64_t v7 = v15;
    uint64_t v8 = *(void *)(sub_253DF00D0() - 8);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v13 = *(void *)(v8 + 72);
    do
    {
      ClientAction.Definition.toolDefinition.getter();
      unint64_t v11 = *(void *)(v15 + 16);
      unint64_t v10 = *(void *)(v15 + 24);
      if (v11 >= v10 >> 1) {
        sub_253DC7554(v10 > 1, v11 + 1, 1);
      }
      *(void *)(v15 + 16) = v11 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v15+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v11, v1, v14);
      v9 += v13;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t static StandardToolboxConfiguration.makeMutableToolboxWithNoClientActions<A, B>(delegate:planGenerationDelegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return StandardToolboxConfiguration.makeMutableToolbox<A, B>(delegate:planGenerationDelegate:)(a1, a2, a3, a4, a5);
}

uint64_t StandardToolboxConfiguration.init(clientActions:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t StandardToolboxConfiguration.makeMutableToolbox<A, B>(delegate:planGenerationDelegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_253DF42A0();
  uint64_t v12 = sub_253BDF9FC(v11);
  MEMORY[0x270FA5388](v12);
  sub_253C10D28();
  uint64_t v13 = sub_253BDEDD8(&qword_26B2519C8);
  uint64_t v14 = sub_253BDF9FC(v13);
  MEMORY[0x270FA5388](v14);
  sub_253C16A90();
  sub_253BE1888();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  sub_253C10D28();
  uint64_t v20 = v19 - v18;
  v26[3] = a3;
  v26[4] = a5;
  uint64_t v21 = sub_253BDEE6C(v26);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(v21, a1, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v20, a2, a4);
  uint64_t v22 = sub_253DEFD20();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v5, 1, 1, v22);
  sub_253DF4A40();
  sub_253DF4A30();
  if (v25)
  {
    sub_253DC02D8(v5);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, a4);
    return _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0((uint64_t)v26);
  }
  else
  {
    sub_253DF2EA0();
    sub_253DF3A90();
    sub_253DF3A80();
    uint64_t v24 = swift_bridgeObjectRetain();
    sub_253DBFE60(v24);
    swift_bridgeObjectRelease();
    sub_253DF4240();
    return sub_253DF2E80();
  }
}

uint64_t sub_253DC02D8(uint64_t a1)
{
  uint64_t v2 = sub_253BDEDD8(&qword_26B2519C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t StandardToolboxConfiguration.clientActions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DC0340()
{
  sub_253DF4A40();
  uint64_t result = sub_253DF4A30();
  if (!v0)
  {
    sub_253DF3A90();
    sub_253DF3A80();
    sub_253DBFE60(MEMORY[0x263F8EE78]);
    return sub_253DF4240();
  }
  return result;
}

uint64_t StandardToolboxConfiguration.makeQueryableToolbox(delegate:planGenerationDelegate:)(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_253DF42A0();
  uint64_t v6 = sub_253BDF9FC(v5);
  MEMORY[0x270FA5388](v6);
  sub_253C10D28();
  uint64_t v7 = sub_253BDEDD8(&qword_26B2519C8);
  uint64_t v8 = sub_253BDF9FC(v7);
  MEMORY[0x270FA5388](v8);
  sub_253C10D28();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = a2[3];
  uint64_t v13 = sub_253BDF5F8(a2, v12);
  sub_253C1601C(a1, (uint64_t)v23);
  sub_253BE1888();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  sub_253C10D28();
  uint64_t v19 = v18 - v17;
  (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v18 - v17, v13, v12);
  uint64_t v20 = sub_253DEFD20();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v11, 1, 1, v20);
  sub_253DF4A40();
  sub_253DF4A30();
  if (v2)
  {
    sub_253DC02D8(v11);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v12);
    return _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0((uint64_t)v23);
  }
  else
  {
    sub_253DF33C0();
    sub_253DF3A90();
    sub_253DF3A80();
    uint64_t v22 = swift_bridgeObjectRetain();
    sub_253DBFE60(v22);
    swift_bridgeObjectRelease();
    sub_253DF4240();
    return sub_253DF3390();
  }
}

uint64_t static StandardToolboxConfiguration.makeQueryableToolboxWithNoClientActions<A, B>(delegate:planGenerationDelegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v16[5] = MEMORY[0x263F8EE78];
  void v16[3] = a3;
  v16[4] = a5;
  uint64_t v11 = sub_253BDEE6C(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(v11, a1, a3);
  v15[3] = a4;
  void v15[4] = a6;
  uint64_t v12 = sub_253BDEE6C(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v12, a2, a4);
  uint64_t v13 = StandardToolboxConfiguration.makeQueryableToolbox(delegate:planGenerationDelegate:)((uint64_t)v16, v15);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0((uint64_t)v15);
  _s23IntelligenceFlowRuntime28FeedbackLearningBiomeDonatorVwxx_0((uint64_t)v16);
  return v13;
}

ValueMetadata *type metadata accessor for StandardToolboxConfiguration()
{
  return &type metadata for StandardToolboxConfiguration;
}

uint64_t sub_253DC0764(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_bookmark;
  *(void *)(v5 + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_bookmark) = 0;
  uint64_t v24 = OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_transaction;
  *(void *)(v5
            + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_transaction) = 0;
  uint64_t v11 = v5 + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_id;
  uint64_t v12 = sub_253DEFE90();
  sub_253C16A18();
  uint64_t v14 = v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a1, v12);
  uint64_t v15 = v5 + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_query;
  uint64_t v16 = sub_253DF1440();
  sub_253C16A18();
  uint64_t v18 = v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, a2, v16);
  *(void *)(v5
            + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_publisher) = a3;
  *(void *)(v5 + v10) = a4;
  id v19 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  sub_253DF58F0();
  sub_253DF52E0();
  sub_253DC2A70((unint64_t *)&qword_26B2552E8, MEMORY[0x263F07508]);
  sub_253DF5C40();
  sub_253DF52E0();
  swift_bridgeObjectRelease();
  sub_253DF52A0();
  swift_bridgeObjectRelease();
  uint64_t v20 = os_transaction_create();

  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, v16);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v12);
  swift_release();
  *(void *)(v5 + v24) = v20;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_253DC099C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_id;
  sub_253DEFE90();
  sub_253DC2AFC();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  uint64_t v3 = v0 + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_query;
  sub_253DF1440();
  sub_253DC2AFC();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_publisher));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_253DC0A5C()
{
  sub_253DC099C();
  sub_253C0FEC4();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

void *sub_253DC0A94(uint64_t a1, uint64_t a2)
{
  swift_defaultActor_initialize();
  v2[14] = a1;
  v2[15] = a2;
  sub_253DEFE90();
  type metadata accessor for TranscriptEntityQueryingService.ActiveQueryState();
  sub_253DC2A70(&qword_26B2552E0, MEMORY[0x263F07508]);
  v2[16] = sub_253DF5180();
  return v2;
}

void sub_253DC0B38(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v29 = a1;
  uint64_t v31 = sub_253DF1440();
  sub_253C0F830();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_253C10D28();
  uint64_t v8 = v7 - v6;
  uint64_t v30 = sub_253DEFE90();
  sub_253C0F830();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_253C2F394();
  uint64_t v12 = sub_253BDEDD8(&qword_26B2552B0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v28 - v16;
  sub_253DEFE80();
  id v18 = objc_msgSend((id)BiomeLibrary(), sel_Sage);
  swift_unknownObjectRelease();
  id v19 = objc_msgSend(v18, sel_Transcript);
  swift_unknownObjectRelease();
  uint64_t v20 = v29;
  sub_253DF1430();
  uint64_t v21 = sub_253DEFE20();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v15, 1, 1, v21);
  id v22 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  id v23 = sub_253DC2870((uint64_t)v17, (uint64_t)v15, 0, 0, 0);
  id v24 = objc_msgSend(v19, sel_publisherWithOptions_, v23);

  uint64_t v25 = v28;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v2, v28, v30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v8, v20, v31);
  type metadata accessor for TranscriptEntityQueryingService.ActiveQueryState();
  uint64_t v26 = swift_allocObject();
  id v27 = v24;
  sub_253DC0764(v2, v8, v27, 0);
  swift_beginAccess();
  sub_253DB3120(v26, v25);
  swift_endAccess();
}

uint64_t sub_253DC0E04(uint64_t a1)
{
  sub_253C0FEC4();
  uint64_t v4 = v3;
  uint64_t v5 = sub_253DF24A0();
  sub_253C0F830();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_253C10D28();
  uint64_t v11 = v10 - v9;
  swift_beginAccess();
  uint64_t v12 = v1[16];
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_253D7F358(a1, v12);
  swift_bridgeObjectRelease();
  if (v13)
  {
    uint64_t v37 = v7;
    uint64_t v38 = v5;
    uint64_t v39 = v11;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = 0;
    uint64_t v16 = v1[15];
    uint64_t v40 = v1[14];
    uint64_t v41 = v4;
    uint64_t v17 = *(void **)(v13
                   + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_publisher);
    uint64_t v18 = *(void *)(v13
                    + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_bookmark);
    uint64_t v48 = sub_253DC27E4;
    uint64_t v49 = (void *)v13;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v45 = 1107296256;
    uint64_t v46 = sub_253DC1454;
    uint64_t v47 = &unk_270366C70;
    uint64_t v42 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    id v19 = v17;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = v13;
    v20[3] = v40;
    v20[4] = v16;
    v20[5] = v1;
    v20[6] = v14;
    v20[7] = v15;
    v20[8] = v41;
    uint64_t v48 = sub_253DC285C;
    uint64_t v49 = v20;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v45 = 1107296256;
    uint64_t v46 = sub_253DC20B4;
    uint64_t v47 = &unk_270366CC0;
    uint64_t v21 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    id v22 = objc_msgSend(v19, sel_drivableSinkWithBookmark_completion_shouldContinue_, v18, v42, v21);
    _Block_release(v21);
    _Block_release(v42);

    swift_unknownObjectRelease();
    swift_beginAccess();
    id v23 = *(void **)(v15 + 16);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = v39;
      _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
      id v26 = v23;
      id v27 = v23;
      uint64_t v28 = sub_253DF2490();
      os_log_type_t v29 = sub_253DF56E0();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        uint64_t v31 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v30 = 138412290;
        id v32 = v23;
        uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
        sub_253DF5820();
        void *v31 = v43;
        uint64_t v25 = v39;

        _os_log_impl(&dword_253BD8000, v28, v29, "Failed to read transcript: %@", v30, 0xCu);
        sub_253BDEDD8(&qword_26B2519F0);
        swift_arrayDestroy();
        MEMORY[0x25A2709B0](v31, -1, -1);
        MEMORY[0x25A2709B0](v30, -1, -1);
      }
      else
      {
      }
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v25, v38);
      uint64_t v33 = sub_253DF1410();
      sub_253DC2A70(&qword_269D7E998, MEMORY[0x263F4CD80]);
      sub_253DC2ADC();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v33 - 8) + 104))(v35, *MEMORY[0x263F4CD70], v33);
      swift_willThrow();

      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_beginAccess();
      uint64_t v33 = *(void *)(v14 + 16);
      swift_bridgeObjectRetain();
      swift_release();
      swift_release();
    }
  }
  else
  {
    uint64_t v33 = sub_253DF1410();
    sub_253DC2A70(&qword_269D7E998, MEMORY[0x263F4CD80]);
    sub_253DC2ADC();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v33 - 8) + 104))(v34, *MEMORY[0x263F4CD78], v33);
    swift_willThrow();
  }
  return v33;
}

uint64_t sub_253DC140C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31TranscriptEntityQueryingService16ActiveQueryState_bookmark) = a2;
  swift_unknownObjectRelease();

  return swift_unknownObjectRetain();
}

void sub_253DC1454(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  v5(v6, a3);
  swift_release();
  swift_unknownObjectRelease();
}

BOOL sub_253DC14DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v85 = a7;
  uint64_t v80 = a6;
  uint64_t v82 = a4;
  uint64_t v78 = a3;
  uint64_t v87 = a2;
  uint64_t v8 = sub_253DF24A0();
  uint64_t v88 = *(void *)(v8 - 8);
  uint64_t v89 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v86 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_253DEFE20();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v77 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_253DF4420();
  uint64_t v72 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v70 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_253DEFE90();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v69 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_253DF0EE0();
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v74 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_253BDEDD8(&qword_26B255FC0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v79 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_253DF4BA0();
  uint64_t v71 = *(void *)(v81 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v81);
  uint64_t v67 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v68 = (char *)&v64 - v20;
  uint64_t v21 = sub_253DF1550();
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v22 = sub_253DF36F0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  id v26 = (char *)&v64 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v64 - v27;
  uint64_t v29 = sub_253DF4230();
  uint64_t v83 = *(void *)(v29 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  id v32 = (char *)&v64 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v64 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v84 = (char *)&v64 - v36;
  id v37 = objc_msgSend(a1, sel_eventBody);
  if (!v37) {
    return 1;
  }
  uint64_t v38 = v37;
  uint64_t v39 = sub_253DC29AC(v37);
  if (v40 >> 60 == 15)
  {

    return 1;
  }
  unint64_t v41 = v40;
  id v66 = v38;
  uint64_t v92 = 0;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v42 = v39;
  sub_253D75DE0(v39, v40);
  sub_253DF1540();
  sub_253DC2A70(&qword_26B255EE0, MEMORY[0x263F4DA00]);
  uint64_t v64 = v42;
  unint64_t v65 = v41;
  sub_253DF1570();
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v26, v28, v22);
  sub_253DF4090();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v28, v22);
  uint64_t v44 = v83;
  uint64_t v45 = v84;
  (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v84, v35, v29);
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v32, v45, v29);
  uint64_t v46 = v82;
  if (v82)
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_253DF40E0();
    id v49 = v66;
    if (!v48)
    {
      uint64_t v52 = *(void (**)(char *, uint64_t))(v44 + 8);
      v52(v32, v29);
      swift_bridgeObjectRelease();
LABEL_16:
      v52(v45, v29);

      sub_253D8F168(v64, v65);
      return 1;
    }
    if (v47 == v78 && v48 == v46)
    {
      swift_bridgeObjectRelease();
      uint64_t v52 = *(void (**)(char *, uint64_t))(v44 + 8);
      v52(v32, v29);
      swift_bridgeObjectRelease();
    }
    else
    {
      char v51 = sub_253DF5C90();
      swift_bridgeObjectRelease();
      uint64_t v52 = *(void (**)(char *, uint64_t))(v44 + 8);
      v52(v32, v29);
      swift_bridgeObjectRelease();
      if ((v51 & 1) == 0) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    uint64_t v52 = *(void (**)(char *, uint64_t))(v44 + 8);
    v52(v32, v29);
    id v49 = v66;
  }
  uint64_t v53 = v81;
  uint64_t v54 = v79;
  uint64_t v55 = (uint64_t *)(v80 + 16);
  sub_253DC210C(v79);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v54, 1, v53) == 1)
  {

    sub_253D8F168(v64, v65);
    sub_253DC2A10(v54);
  }
  else
  {
    uint64_t v56 = v71;
    unsigned int v57 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v68, v54, v53);
    sub_253DF4180();
    uint64_t v58 = v70;
    sub_253DF4220();
    sub_253DF4410();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v58, v73);
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v67, v57, v53);
    unsigned int v59 = v74;
    sub_253DF0ED0();
    swift_beginAccess();
    sub_253DB2DC4();
    uint64_t v60 = *(void *)(*v55 + 16);
    sub_253DB2E68(v60);
    uint64_t v61 = *v55;
    *(void *)(v61 + 16) = v60 + 1;
    uint64_t v62 = v59;
    uint64_t v45 = v84;
    (*(void (**)(unint64_t, char *, uint64_t))(v75 + 32))(v61+ ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80))+ *(void *)(v75 + 72) * v60, v62, v76);
    swift_endAccess();

    sub_253D8F168(v64, v65);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v53);
  }
  swift_beginAccess();
  unint64_t v63 = *(void *)(*v55 + 16);
  v52(v45, v29);
  return v63 < 0xF;
}

uint64_t sub_253DC20B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_253DC210C@<X0>(uint64_t a1@<X8>)
{
  sub_253DF0A20();
  sub_253C0F830();
  uint64_t v40 = v3;
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  sub_253C10D28();
  uint64_t v39 = v5 - v4;
  sub_253DF38F0();
  sub_253C0F830();
  uint64_t v37 = v7;
  uint64_t v38 = v6;
  MEMORY[0x270FA5388](v6);
  sub_253C2F394();
  uint64_t v8 = sub_253DF01F0();
  sub_253C0F830();
  uint64_t v36 = v9;
  MEMORY[0x270FA5388](v10);
  sub_253C10D28();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_253DF41F0();
  sub_253C0F830();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  sub_253C10D28();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_253DF3170();
  sub_253C0F830();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  sub_253C10D28();
  uint64_t v27 = v26 - v25;
  sub_253DF4200();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v20, v14) == *MEMORY[0x263F4DF48])
  {
    (*(void (**)(uint64_t, uint64_t))(v16 + 96))(v20, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v27, v20, v21);
    sub_253DF3160();
    sub_253DF38D0();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v1, v38);
    uint64_t v28 = a1;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v40 + 88))(v39, v41) == *MEMORY[0x263F4C7D8])
    {
      (*(void (**)(uint64_t, uint64_t))(v40 + 96))(v39, v41);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v13, v39, v8);
      sub_253DF01D0();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v13, v8);
      uint64_t v29 = sub_253DC2AC4();
      v30(v29);
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v32 = sub_253DC2AC4();
      v33(v32);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
      uint64_t v31 = 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v14);
    uint64_t v31 = 1;
    uint64_t v28 = a1;
  }
  uint64_t v34 = sub_253DF4BA0();
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v28, v31, 1, v34);
}

uint64_t sub_253DC2464()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_253DC2494()
{
  sub_253DC2464();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for TranscriptEntityQueryingService()
{
  return self;
}

uint64_t sub_253DC24E4()
{
  return type metadata accessor for TranscriptEntityQueryingService.ActiveQueryState();
}

uint64_t type metadata accessor for TranscriptEntityQueryingService.ActiveQueryState()
{
  uint64_t result = qword_269D7E988;
  if (!qword_269D7E988) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_253DC2534()
{
  uint64_t result = sub_253DEFE90();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_253DF1440();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for TranscriptEntityQueryingService.Policy(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TranscriptEntityQueryingService.Policy(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for TranscriptEntityQueryingService.Policy(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptEntityQueryingService.Policy(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TranscriptEntityQueryingService.Policy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
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

ValueMetadata *type metadata accessor for TranscriptEntityQueryingService.Policy()
{
  return &type metadata for TranscriptEntityQueryingService.Policy;
}

uint64_t sub_253DC2774()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_253DC27AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_253DC27E4(uint64_t a1, uint64_t a2)
{
  return sub_253DC140C(a1, a2, v2);
}

uint64_t sub_253DC27EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_253DC27FC()
{
  return swift_release();
}

uint64_t sub_253DC2804()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

BOOL sub_253DC285C(void *a1)
{
  return sub_253DC14DC(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

id sub_253DC2870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = sub_253DEFE20();
  uint64_t v13 = 0;
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(a1, 1, v12) != 1)
  {
    uint64_t v13 = (void *)sub_253DEFDE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(a2, 1, v12) == 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = (void *)sub_253DEFDE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
  }
  id v15 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

uint64_t sub_253DC29AC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_eventPayload);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_253DEFDD0();

  return v3;
}

uint64_t sub_253DC2A10(uint64_t a1)
{
  uint64_t v2 = sub_253BDEDD8(&qword_26B255FC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_253DC2A70(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_253DC2AC4()
{
  return v0;
}

uint64_t sub_253DC2ADC()
{
  return swift_allocError();
}

uint64_t sub_253DC2B10()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_253DF24A0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v14 - v5;
  uint64_t v15 = 0;
  int domain_answer = os_eligibility_get_domain_answer();
  if (!domain_answer)
  {
    if (v15 == 4) {
      return 1;
    }
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    uint64_t v9 = sub_253DF2490();
    os_log_type_t v13 = sub_253DF56C0();
    if (!os_log_type_enabled(v9, v13))
    {
      uint64_t v4 = v6;
      goto LABEL_9;
    }
    uint64_t v11 = swift_slowAlloc();
    sub_253DC2E18((float *)v11, 3.8521e-34);
    sub_253DF5820();
    *(_WORD *)(v11 + 12) = 2048;
    swift_beginAccess();
    uint64_t v14 = v15;
    sub_253DF5820();
    _os_log_impl(&dword_253BD8000, v9, v13, "DeviceEligibility: Device is not eligible for domain %llu, eligiblity: %llu", (uint8_t *)v11, 0x16u);
    uint64_t v4 = v6;
    goto LABEL_8;
  }
  int v8 = domain_answer;
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  uint64_t v9 = sub_253DF2490();
  os_log_type_t v10 = sub_253DF56E0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    sub_253DC2E18((float *)v11, 3.8521e-34);
    sub_253DF5820();
    *(_WORD *)(v11 + 12) = 1024;
    int v16 = v8;
    sub_253DF5820();
    _os_log_impl(&dword_253BD8000, v9, v10, "DeviceEligibility: Unable to determine eligibility for domain %llu, status: %d", (uint8_t *)v11, 0x12u);
LABEL_8:
    MEMORY[0x25A2709B0](v11, -1, -1);
  }
LABEL_9:

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return 0;
}

uint64_t sub_253DC2DE0()
{
  uint64_t result = sub_253DF5260();
  qword_26B257578 = result;
  return result;
}

float *sub_253DC2E18(float *result, float a2)
{
  *uint64_t result = a2;
  *(void *)(v2 - 96) = 122;
  return result;
}

uint64_t static RuntimeNumericError.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  if (a1[2])
  {
    if (a2[2])
    {
      if (v2 != v4 || v3 != v5)
      {
LABEL_15:
        char v7 = sub_253DF5C90();
        goto LABEL_17;
      }
LABEL_16:
      char v7 = 1;
      goto LABEL_17;
    }
  }
  else if ((a2[2] & 1) == 0)
  {
    if (v2 != v4 || v3 != v5) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  char v7 = 0;
LABEL_17:
  sub_253DC2F20();
  sub_253DC2F20();
  sub_253DC2F28();
  sub_253DC2F28();
  return v7 & 1;
}

uint64_t sub_253DC2F20()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DC2F28()
{
  return swift_bridgeObjectRelease();
}

Swift::Float __swiftcall Float.sigmoid()()
{
  return 1.0 / (float)(expf(-v0) + 1.0);
}

Swift::String __swiftcall Float.toString(decimalPlaces:)(Swift::Int decimalPlaces)
{
  int v2 = v1;
  sub_253DC87A4();
  sub_253DF5C40();
  sub_253DF52E0();
  swift_bridgeObjectRelease();
  sub_253DF52E0();
  sub_253BDEDD8(&qword_26B256298);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8D5C8];
  *(_OWORD *)(v3 + 16) = xmmword_253DF6EC0;
  uint64_t v5 = MEMORY[0x263F8D648];
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = v5;
  *(_DWORD *)(v3 + 32) = v2;
  uint64_t v6 = sub_253DF5280();
  int v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = v6;
  os_log_type_t v10 = v8;
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

Swift::String __swiftcall Double.toString(decimalPlaces:)(Swift::Int decimalPlaces)
{
  uint64_t v2 = v1;
  sub_253DC87A4();
  sub_253DF5C40();
  sub_253DF52E0();
  swift_bridgeObjectRelease();
  sub_253DF52E0();
  sub_253BDEDD8(&qword_26B256298);
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8D538];
  *(_OWORD *)(v3 + 16) = xmmword_253DF6EC0;
  uint64_t v5 = MEMORY[0x263F8D5B8];
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = v5;
  *(void *)(v3 + 32) = v2;
  uint64_t v6 = sub_253DF5280();
  int v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = v6;
  os_log_type_t v10 = v8;
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

void Array<A>.dotProduct(with:)()
{
  sub_253DC86C0();
  if (v2)
  {
    sub_253DC354C(v1, v0, MEMORY[0x263EFAA68]);
  }
  else
  {
    sub_253DF58F0();
    sub_253DF52E0();
    sub_253DC85E0();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DC8748();
    sub_253DC85E0();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DC3230();
    uint64_t v3 = sub_253C0FFC8();
    sub_253DC85AC(v3, v4);
  }
}

unint64_t sub_253DC3230()
{
  unint64_t result = qword_269D7E9A0;
  if (!qword_269D7E9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7E9A0);
  }
  return result;
}

void Array<A>.cosineSimilarity(with:)()
{
  __C[2] = *MEMORY[0x263EF8340];
  sub_253DC86C0();
  if (v3)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v1;
    LODWORD(__C[0]) = 2143289344;
    vDSP_svesq((const float *)(v2 + 32), 1, (float *)__C, v0);
    LODWORD(__C[0]) = 2143289344;
    vDSP_svesq((const float *)(v5 + 32), 1, (float *)__C, v0);
    sub_253DC354C(v4, v5, MEMORY[0x263EFAA68]);
  }
  else
  {
    __C[0] = 0;
    __C[1] = 0xE000000000000000;
    sub_253DF58F0();
    sub_253DF52E0();
    sub_253DF5C40();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DC8748();
    sub_253DF5C40();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DC3230();
    uint64_t v6 = sub_253C0FFC8();
    sub_253DC85AC(v6, v7);
  }
}

void Array<A>.euclideanDistance(with:)()
{
  sub_253DC86C0();
  if (v2)
  {
    sqrtf(sub_253DC354C(v1, v0, MEMORY[0x263EFAA60]));
  }
  else
  {
    sub_253DF58F0();
    sub_253DF52E0();
    sub_253DC85E0();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DC8748();
    sub_253DC85E0();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DC3230();
    uint64_t v3 = sub_253C0FFC8();
    sub_253DC85AC(v3, v4);
  }
}

float sub_253DC354C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, float *))
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    __break(1u);
  }
  float v4 = NAN;
  a3(a1 + 32, 1, a2 + 32, 1, &v4);
  return v4;
}

uint64_t Array<A>.padding(totalSize:padValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = a1 - v5;
  if (a1 <= v5)
  {
    swift_bridgeObjectRetain();
    return v4;
  }
  if (a1 - v5 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a2;
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_4;
    }
  }
  sub_253DC4C34();
  uint64_t v4 = v10;
LABEL_4:
  unint64_t v7 = *(void *)(v4 + 16);
  do
  {
    if (v7 >= *(void *)(v4 + 24) >> 1)
    {
      sub_253DC4C34();
      uint64_t v4 = v8;
    }
    *(void *)(v4 + 16) = v7 + 1;
    *(void *)(v4 + 8 * v7++ + 32) = v3;
    --v6;
  }
  while (v6);
  return v4;
}

void Array<A>.to2D(numRows:numColumns:)(uint64_t a1, int64_t a2, uint64_t a3)
{
  if ((unsigned __int128)(a1 * (__int128)a2) >> 64 != (a1 * a2) >> 63)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int64_t v4 = a2;
  unint64_t v5 = *(void *)(a3 + 16);
  if (v5 != a1 * a2)
  {
    sub_253DF58F0();
    swift_bridgeObjectRelease();
    sub_253DC86D0();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DF52E0();
    sub_253DC86D0();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DF52E0();
    sub_253DC86D0();
    sub_253DF52E0();
    swift_bridgeObjectRelease();
    sub_253DC3230();
    sub_253C0FFC8();
    *(void *)uint64_t v19 = 0xD000000000000025;
    *(void *)(v19 + 8) = 0x8000000253E1ABB0;
    *(unsigned char *)(v19 + 16) = 0;
    swift_willThrow();
    return;
  }
  if (a1 < 0) {
    goto LABEL_27;
  }
  if (a1)
  {
    uint64_t v25 = MEMORY[0x263F8EE78];
    sub_253DC79C8();
    if (v4 < 0)
    {
LABEL_28:
      __break(1u);
      return;
    }
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = v25;
    uint64_t v9 = a1;
    uint64_t v10 = MEMORY[0x263F8EE78];
    int64_t v20 = v4;
    while (v7 != v9)
    {
      if (v4)
      {
        unint64_t v22 = v6;
        uint64_t v23 = v8;
        uint64_t v24 = v10;
        sub_253DC79F8(0, v4, 0);
        if ((unsigned __int128)(v7 * (__int128)v4) >> 64 != (v7 * v4) >> 63) {
          goto LABEL_25;
        }
        uint64_t v8 = v23;
        uint64_t v11 = v24;
        int64_t v12 = v4;
        uint64_t v9 = a1;
        unint64_t v6 = v22;
        unint64_t v13 = v22;
        uint64_t v10 = MEMORY[0x263F8EE78];
        while (v13 < v5)
        {
          int v14 = *(_DWORD *)(a3 + 32 + 4 * v13);
          unint64_t v16 = *(void *)(v24 + 16);
          unint64_t v15 = *(void *)(v24 + 24);
          if (v16 >= v15 >> 1)
          {
            sub_253DC79F8((char *)(v15 > 1), v16 + 1, 1);
            unint64_t v6 = v22;
            uint64_t v8 = v23;
            uint64_t v10 = MEMORY[0x263F8EE78];
            uint64_t v9 = a1;
          }
          *(void *)(v24 + 16) = v16 + 1;
          *(_DWORD *)(v24 + 4 * v16 + 32) = v14;
          ++v13;
          if (!--v12)
          {
            int64_t v4 = v20;
            goto LABEL_17;
          }
        }
        __break(1u);
        break;
      }
      uint64_t v11 = v10;
LABEL_17:
      uint64_t v26 = v8;
      unint64_t v17 = *(void *)(v8 + 16);
      if (v17 >= *(void *)(v8 + 24) >> 1)
      {
        unint64_t v18 = v6;
        sub_253DC79C8();
        unint64_t v6 = v18;
        uint64_t v10 = MEMORY[0x263F8EE78];
        uint64_t v9 = a1;
        uint64_t v8 = v26;
      }
      ++v7;
      *(void *)(v8 + 16) = v17 + 1;
      *(void *)(v8 + 8 * v17 + 32) = v11;
      v6 += v4;
      if (v7 == v9) {
        return;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
}

void sub_253DC39C0()
{
  sub_253DC85FC();
  if (v2)
  {
    sub_253DC84AC();
    if (v3 != v4)
    {
      sub_253DC8528();
      if (v3)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC8544();
  if (v1)
  {
    sub_253BDEDD8(&qword_26B256270);
    unint64_t v5 = (const void *)sub_253DC8680();
    size_t v6 = j__malloc_size_0(v5);
    sub_253DC8724((uint64_t)(v6 - 32) / 16);
  }
  if (v0)
  {
    uint64_t v7 = (char *)sub_253DC8674();
    sub_253DC5804(v7, v8, v9);
    sub_253DC8584();
  }
  else
  {
    uint64_t v10 = sub_253DC8534();
    sub_253DC4E6C(v10, v11, v12, v13);
  }
}

uint64_t sub_253DC3A70(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7C338, MEMORY[0x263F80508], MEMORY[0x263F80508]);
}

uint64_t sub_253DC3AB8()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC3ACC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA70, type metadata accessor for RetrievedValue, (void (*)(void))type metadata accessor for RetrievedValue);
}

uint64_t sub_253DC3B14(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), void (*a7)(void))
{
  if (a3)
  {
    sub_253DC84AC();
    if (v12 != v13)
    {
      sub_253DC8528();
      if (v12)
      {
        __break(1u);
        goto LABEL_23;
      }
      sub_253DC84BC();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (!v15)
  {
    uint64_t v19 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  sub_253BDEDD8(a5);
  uint64_t v16 = a6(0);
  sub_253BDF7B0(v16);
  uint64_t v18 = *(void *)(v17 + 72);
  uint64_t v19 = (void *)sub_253DC8608();
  j__malloc_size_0(v19);
  if (!v18 || ((sub_253DC8764(), v21) ? (BOOL v21 = v18 == -1) : (BOOL v21 = 0), v21))
  {
LABEL_23:
    sub_253DC8498();
    uint64_t result = sub_253DF5AA0();
    __break(1u);
    return result;
  }
  long long v19[2] = v14;
  v19[3] = 2 * (v20 / v18);
LABEL_18:
  uint64_t v22 = *(void *)(a6(0) - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  if (a1)
  {
    sub_253DC5EA0(a4 + v23, v14);
    sub_253DC8584();
  }
  else
  {
    sub_253DC5708(0, v14, (unint64_t)v19 + v23, a4, a7);
  }
  return (uint64_t)v19;
}

uint64_t sub_253DC3CEC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA68, MEMORY[0x263F80828], MEMORY[0x263F80828]);
}

uint64_t sub_253DC3D34()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC3D48()
{
  sub_253DC859C();
  if (v5)
  {
    sub_253DC84AC();
    if (v7 != v8)
    {
      sub_253DC8528();
      if (v7)
      {
        __break(1u);
        goto LABEL_23;
      }
      sub_253DC84BC();
    }
  }
  else
  {
    uint64_t v6 = v3;
  }
  uint64_t v9 = *(void *)(v0 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (!v10)
  {
    uint64_t v14 = (const void *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  sub_253BDEDD8(v4);
  uint64_t v11 = sub_253BDEDD8(v1);
  sub_253BDF7B0(v11);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = (const void *)sub_253DC8630();
  j__malloc_size_0(v14);
  if (!v13 || ((sub_253DC8764(), v16) ? (BOOL v16 = v13 == -1) : (BOOL v16 = 0), v16))
  {
LABEL_23:
    sub_253DC8498();
    uint64_t result = sub_253DF5AA0();
    __break(1u);
    return result;
  }
  sub_253DC86B0(v15);
LABEL_18:
  uint64_t v17 = sub_253BDEDD8(v1);
  sub_253C1CE88(v17);
  if (v2)
  {
    sub_253DC5CB4(v0 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), v9);
    sub_253DC8584();
  }
  else
  {
    uint64_t v19 = sub_253DC85CC();
    sub_253DC542C(v19, v20, v21, v22, v23);
  }
  return (uint64_t)v14;
}

uint64_t sub_253DC3ECC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7E9A8, MEMORY[0x263F4D5A0], MEMORY[0x263F4D5A0]);
}

uint64_t sub_253DC3F14(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_26B256258, MEMORY[0x263F4E050], MEMORY[0x263F4E050]);
}

uint64_t sub_253DC3F5C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB90, MEMORY[0x263F4ED70], MEMORY[0x263F4ED70]);
}

void sub_253DC3FA4()
{
  sub_253DC85FC();
  if (v2)
  {
    sub_253DC84AC();
    if (v3 != v4)
    {
      sub_253DC8528();
      if (v3)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC8544();
  if (v1)
  {
    sub_253BDEDD8(&qword_269D7EA50);
    char v5 = (const void *)swift_allocObject();
    size_t v6 = j__malloc_size_0(v5);
    sub_253DC8724((uint64_t)(v6 - 32) / 48);
  }
  if (v0)
  {
    char v7 = (char *)sub_253DC8674();
    sub_253DC590C(v7, v8, v9);
    sub_253DC8584();
  }
  else
  {
    uint64_t v10 = sub_253DC8534();
    sub_253DC4F64(v10, v11, v12, v13);
  }
}

void sub_253DC4064()
{
  sub_253DC85FC();
  if (v2)
  {
    sub_253DC84AC();
    if (v3 != v4)
    {
      sub_253DC8528();
      if (v3)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC8544();
  if (v1)
  {
    sub_253BDEDD8(&qword_269D7C758);
    char v5 = (const void *)sub_253DC8680();
    size_t v6 = j__malloc_size_0(v5);
    sub_253DC8724((uint64_t)(v6 - 32) / 32);
  }
  if (v0)
  {
    char v7 = (char *)sub_253DC8674();
    sub_253DC59A8(v7, v8, v9);
    sub_253DC8584();
  }
  else
  {
    uint64_t v10 = sub_253DC8534();
    sub_253DC5064(v10, v11, v12, v13);
  }
}

uint64_t sub_253DC4114(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB80, MEMORY[0x263F4EBA0], MEMORY[0x263F4EBA0]);
}

uint64_t sub_253DC415C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB88, MEMORY[0x263F4EBA8], MEMORY[0x263F4EBA8]);
}

uint64_t sub_253DC41A4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7BDB0, MEMORY[0x263F4D120], MEMORY[0x263F4D120]);
}

void sub_253DC41EC()
{
}

uint64_t sub_253DC4200(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7BD98, _s16CandidateSummaryVMa, (void (*)(void))_s16CandidateSummaryVMa);
}

void sub_253DC4248()
{
}

void sub_253DC425C()
{
  sub_253DC859C();
  if (v4)
  {
    sub_253DC84AC();
    if (v5 != v6)
    {
      sub_253DC8528();
      if (v5)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC86EC();
  if (v3)
  {
    sub_253BDEDD8(v7);
    uint64_t v8 = (char *)sub_253DC8680();
    size_t v9 = j__malloc_size_0(v8);
    sub_253DC8730(v9);
  }
  else
  {
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  }
  if (v1)
  {
    sub_253DC5DB0((char *)(v0 + 32), v2, v8 + 32);
    sub_253DC8584();
  }
  else
  {
    uint64_t v10 = sub_253DC85CC();
    sub_253DC515C(v10, v11, v12, v13, v14);
  }
}

uint64_t sub_253DC4308(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7BDA8, (uint64_t (*)(void))_s15CandidateResultVMa, (void (*)(void))_s15CandidateResultVMa);
}

uint64_t sub_253DC4350()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC4364()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC4378(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA30, MEMORY[0x263F4BF98], MEMORY[0x263F4BF98]);
}

uint64_t sub_253DC43C0()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC43D4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB08, _s23StatementStepEvaluationOMa, (void (*)(void))_s23StatementStepEvaluationOMa);
}

uint64_t sub_253DC441C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB38, MEMORY[0x263F4D7A8], MEMORY[0x263F4D7A8]);
}

uint64_t sub_253DC4464(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA38, _s19SystemResponseEventVMa, (void (*)(void))_s19SystemResponseEventVMa);
}

uint64_t sub_253DC44AC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB30, _s9PlanEventVMa, (void (*)(void))_s9PlanEventVMa);
}

uint64_t sub_253DC44F4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB18, MEMORY[0x263F4DE80], MEMORY[0x263F4DE80]);
}

uint64_t sub_253DC453C()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC4550()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC4564()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC4578(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA20, MEMORY[0x263F4C6B8], MEMORY[0x263F4C6B8]);
}

uint64_t sub_253DC45C0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EAD0, _s18ToolStepEvaluationVMa, (void (*)(void))_s18ToolStepEvaluationVMa);
}

uint64_t sub_253DC4608(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EAC8, _s23ParameterStepEvaluationVMa, (void (*)(void))_s23ParameterStepEvaluationVMa);
}

uint64_t sub_253DC4650(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EAC0, _s19ValueStepEvaluationVMa, (void (*)(void))_s19ValueStepEvaluationVMa);
}

uint64_t sub_253DC4698(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EB50, _s13ValueExecutedVMa, (void (*)(void))_s13ValueExecutedVMa);
}

uint64_t sub_253DC46E0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EAB8, type metadata accessor for FeedbackLearning.FlowExpressionValue, (void (*)(void))type metadata accessor for FeedbackLearning.FlowExpressionValue);
}

uint64_t sub_253DC4728()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC473C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EAA8, type metadata accessor for FeedbackLearning.FlowTask, (void (*)(void))type metadata accessor for FeedbackLearning.FlowTask);
}

void sub_253DC4784()
{
}

uint64_t sub_253DC4798(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7E410, type metadata accessor for FeedbackLearning.FlowExpression, (void (*)(void))type metadata accessor for FeedbackLearning.FlowExpression);
}

uint64_t sub_253DC47E0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7CC28, type metadata accessor for FeedbackLearning.TaskEvaluation, (void (*)(void))type metadata accessor for FeedbackLearning.TaskEvaluation);
}

uint64_t sub_253DC4828(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA98, type metadata accessor for FeedbackLearning.CandidateEvaluation, (void (*)(void))type metadata accessor for FeedbackLearning.CandidateEvaluation);
}

uint64_t sub_253DC4870()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC4884(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EAB0, type metadata accessor for FeedbackLearning.FlowActionEvent, (void (*)(void))type metadata accessor for FeedbackLearning.FlowActionEvent);
}

uint64_t sub_253DC48CC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_26B2561F8, MEMORY[0x263F4C520], MEMORY[0x263F4C520]);
}

uint64_t sub_253DC4914(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA90, MEMORY[0x263F80C80], MEMORY[0x263F80C80]);
}

void sub_253DC495C()
{
}

void sub_253DC4970()
{
  sub_253DC85FC();
  if (v2)
  {
    sub_253DC84AC();
    if (v3 != v4)
    {
      sub_253DC8528();
      if (v3)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC8544();
  if (v1)
  {
    sub_253BDEDD8(&qword_269D7EA00);
    char v5 = (const void *)swift_allocObject();
    size_t v6 = j__malloc_size_0(v5);
    sub_253DC8724((uint64_t)(v6 - 32) / 40);
  }
  if (v0)
  {
    char v7 = (char *)sub_253DC8674();
    sub_253DC5A6C(v7, v8, v9);
    sub_253DC8584();
  }
  else
  {
    uint64_t v10 = sub_253DC8534();
    sub_253DC5230(v10, v11, v12, v13);
  }
}

uint64_t sub_253DC4A30(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_26B256248, MEMORY[0x263F4DDE8], MEMORY[0x263F4DDE8]);
}

void sub_253DC4A78()
{
}

void sub_253DC4A8C()
{
  sub_253DC859C();
  if (v4)
  {
    sub_253DC84AC();
    if (v5 != v6)
    {
      sub_253DC8528();
      if (v5)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC86EC();
  if (v3)
  {
    sub_253BDEDD8(v7);
    uint64_t v8 = (char *)swift_allocObject();
    size_t v9 = j__malloc_size_0(v8);
    sub_253DC86B0(v9 - 32);
  }
  else
  {
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  }
  if (v1)
  {
    sub_253DC5B9C((char *)(v0 + 32), v2, v8 + 32);
    sub_253DC8584();
  }
  else
  {
    uint64_t v10 = sub_253DC85CC();
    sub_253DC5350(v10, v11, v12, v13, v14);
  }
}

uint64_t sub_253DC4B48()
{
  return sub_253DC3D48();
}

uint64_t sub_253DC4B5C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_26B256250, MEMORY[0x263F4E030], MEMORY[0x263F4E030]);
}

uint64_t sub_253DC4BA4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7E9D0, MEMORY[0x263F4C718], MEMORY[0x263F4C718]);
}

uint64_t sub_253DC4BEC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7EA08, MEMORY[0x263F4CA88], MEMORY[0x263F4CA88]);
}

void sub_253DC4C34()
{
  sub_253DC85FC();
  if (v2)
  {
    sub_253DC84AC();
    if (v3 != v4)
    {
      sub_253DC8528();
      if (v3)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC8544();
  if (v1)
  {
    sub_253BDEDD8(&qword_269D7E9B8);
    char v5 = (const void *)sub_253DC8680();
    size_t v6 = j__malloc_size_0(v5);
    sub_253DC8724((uint64_t)(v6 - 32) / 8);
  }
  if (v0)
  {
    char v7 = (char *)sub_253DC8674();
    sub_253DC5878(v7, v8, v9);
    sub_253DC8584();
  }
  else
  {
    uint64_t v10 = sub_253DC8534();
    sub_253DC5524(v10, v11, v12, v13);
  }
}

void sub_253DC4CE4()
{
  sub_253DC85FC();
  if (v3)
  {
    sub_253DC84AC();
    if (v4 != v5)
    {
      sub_253DC8528();
      if (v4)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC8544();
  if (v2)
  {
    sub_253BDEDD8(&qword_26B256208);
    size_t v6 = (void *)swift_allocObject();
    size_t v7 = j__malloc_size_0(v6);
    v6[2] = v1;
    v6[3] = 2 * v7 - 64;
  }
  if (v0)
  {
    uint64_t v8 = (char *)sub_253DC8674();
    sub_253D8F82C(v8, v9, v10);
    sub_253DC8584();
  }
  else
  {
    uint64_t v11 = sub_253DC8534();
    sub_253DC5618(v11, v12, v13, v14);
  }
}

uint64_t sub_253DC4D94(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_26B2561F0, MEMORY[0x263F4C220], MEMORY[0x263F4C220]);
}

uint64_t sub_253DC4DDC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_269D7E9C0, MEMORY[0x263F80C28], MEMORY[0x263F80C28]);
}

uint64_t sub_253DC4E24(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_253DC3B14(a1, a2, a3, a4, &qword_26B256260, MEMORY[0x263F7FED0], MEMORY[0x263F7FED0]);
}

uint64_t sub_253DC4E6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_253DF5B10();
  __break(1u);
  return result;
}

uint64_t sub_253DC4F64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_253DF5B10();
  __break(1u);
  return result;
}

uint64_t sub_253DC5064(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_253DF5B10();
  __break(1u);
  return result;
}

uint64_t sub_253DC515C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    sub_253DC8498();
    sub_253DC84DC();
    goto LABEL_11;
  }
  unint64_t v6 = a4 + 8 * a1 + 32;
  unint64_t v7 = a3 + 8 * v5;
  if (v6 >= v7 || v6 + 8 * v5 <= a3)
  {
    sub_253BDEDD8(a5);
    sub_253DC8784();
    swift_bridgeObjectRelease();
    return v7;
  }
  sub_253DC8498();
  sub_253DC84CC();
LABEL_11:
  uint64_t result = sub_253DC8510();
  __break(1u);
  return result;
}

uint64_t sub_253DC5230(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_253BDEDD8(&qword_26B255D40);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_253DF5B10();
  __break(1u);
  return result;
}

uint64_t sub_253DC5350(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    sub_253DC8498();
    sub_253DC84DC();
    goto LABEL_11;
  }
  unint64_t v6 = a4 + 40 * a1 + 32;
  unint64_t v7 = a3 + 40 * v5;
  if (v6 >= v7 || v6 + 40 * v5 <= a3)
  {
    sub_253BDEDD8(a5);
    sub_253DC8784();
    swift_bridgeObjectRelease();
    return v7;
  }
  sub_253DC8498();
  sub_253DC84CC();
LABEL_11:
  uint64_t result = sub_253DC8510();
  __break(1u);
  return result;
}

uint64_t sub_253DC542C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a2 - a1 < 0)
  {
LABEL_9:
    sub_253DC8498();
    sub_253DC84DC();
    goto LABEL_11;
  }
  sub_253BDEDD8(a5);
  sub_253C633B8();
  sub_253DC8698();
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7 > a3;
  }
  if (!v9)
  {
    swift_arrayInitWithCopy();
    swift_bridgeObjectRelease();
    return a1;
  }
  sub_253DC8498();
  sub_253DC84CC();
LABEL_11:
  uint64_t result = sub_253DC8510();
  __break(1u);
  return result;
}

char *sub_253DC5524(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    unint64_t v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_253DF5B10();
  __break(1u);
  return result;
}

char *sub_253DC5618(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_253DF5B10();
  __break(1u);
  return result;
}

uint64_t sub_253DC5708(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(void))
{
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a2 - a1 < 0)
  {
LABEL_9:
    sub_253DC8498();
    sub_253DC84DC();
    goto LABEL_11;
  }
  a5(0);
  sub_253C633B8();
  sub_253DC8698();
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7 > a3;
  }
  if (!v9)
  {
    swift_arrayInitWithCopy();
    swift_bridgeObjectRelease();
    return a1;
  }
  sub_253DC8498();
  sub_253DC84CC();
LABEL_11:
  uint64_t result = sub_253DC8510();
  __break(1u);
  return result;
}

char *sub_253DC5804(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    uint64_t result = (char *)sub_253DC84EC();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_253DC8554(a3, result);
  }
  return result;
}

void sub_253DC5860(uint64_t a1, uint64_t a2)
{
}

char *sub_253DC5878(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_253DF5B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_253DC590C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_253DF5B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

char *sub_253DC59A8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_253DF5B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

void sub_253DC5A3C(uint64_t a1, uint64_t a2)
{
}

void sub_253DC5A54(uint64_t a1, uint64_t a2)
{
}

void sub_253DC5A60(uint64_t a1, uint64_t a2)
{
}

char *sub_253DC5A6C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_253DF5B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_253DC5B08(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_253DF5B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_253DC5B9C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    uint64_t result = (char *)sub_253DC84EC();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)sub_253DC8554(a3, result);
  }
  return result;
}

char *sub_253DC5C00(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_253DF5B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

void sub_253DC5C9C(uint64_t a1, uint64_t a2)
{
}

void sub_253DC5CB4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84EC();
    __break(1u);
  }
  else
  {
    sub_253DC870C();
    if (v6 && (sub_253BDEDD8(v5), sub_253BDF7F0(), v3 + *(void *)(v7 + 72) * v2 > v4))
    {
      if (v4 != v3)
      {
        sub_253DC8570();
        swift_arrayInitWithTakeBackToFront();
      }
    }
    else
    {
      sub_253BDEDD8(v5);
      sub_253DC8570();
      swift_arrayInitWithTakeFrontToBack();
    }
  }
}

void sub_253DC5D98(uint64_t a1, uint64_t a2)
{
}

char *sub_253DC5DB0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    uint64_t result = (char *)sub_253DC84EC();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_253DC8554(a3, result);
  }
  return result;
}

char *sub_253DC5E0C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_253DF5B10();
    __break(1u);
  }
  else if (__dst != __src || &__src[4 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 4 * a2);
  }
  return __src;
}

void sub_253DC5EA0(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84EC();
    __break(1u);
  }
  else
  {
    sub_253DC870C();
    if (v6 && (v5(0), sub_253BDF7F0(), v3 + *(void *)(v7 + 72) * v2 > v4))
    {
      if (v4 != v3)
      {
        sub_253DC8570();
        swift_arrayInitWithTakeBackToFront();
      }
    }
    else
    {
      v5(0);
      sub_253DC8570();
      swift_arrayInitWithTakeFrontToBack();
    }
  }
}

uint64_t sub_253DC5F8C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84DC();
LABEL_11:
    uint64_t result = sub_253DC8510();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    sub_253DC8498();
    sub_253DC84CC();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

uint64_t sub_253DC603C(uint64_t a1, uint64_t a2)
{
  return sub_253DC6854(a1, a2);
}

void *sub_253DC6054(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_253DF5B10();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

uint64_t sub_253DC6130(uint64_t a1, uint64_t a2)
{
  return sub_253DC6854(a1, a2);
}

uint64_t sub_253DC6148(uint64_t a1, uint64_t a2)
{
  return sub_253DC6854(a1, a2);
}

uint64_t sub_253DC6160(uint64_t a1, uint64_t a2)
{
  return sub_253DC626C(a1, a2);
}

uint64_t sub_253DC616C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84DC();
LABEL_11:
    uint64_t result = sub_253DC8510();
    __break(1u);
    return result;
  }
  sub_253DC8658();
  if (!v5 & v4) {
    BOOL v6 = v3 > v2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    sub_253DC8498();
    sub_253DC84CC();
    goto LABEL_11;
  }
  _s13ActionCreatedCMa(0);
  sub_253CD8E14();

  return swift_arrayInitWithCopy();
}

uint64_t sub_253DC6218(uint64_t a1, uint64_t a2)
{
  return sub_253DC626C(a1, a2);
}

uint64_t sub_253DC6224(uint64_t a1, uint64_t a2)
{
  return sub_253DC6854(a1, a2);
}

uint64_t sub_253DC623C(uint64_t a1, uint64_t a2)
{
  return sub_253DC6854(a1, a2);
}

uint64_t sub_253DC6254(uint64_t a1, uint64_t a2)
{
  return sub_253DC6854(a1, a2);
}

uint64_t sub_253DC626C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84DC();
LABEL_11:
    uint64_t result = sub_253DC8510();
    __break(1u);
    return result;
  }
  sub_253DC86FC();
  sub_253BDEDD8(v3);
  sub_253BDF7F0();
  sub_253DC8770();
  if (!v6 & v5) {
    BOOL v7 = v4 > v2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    sub_253DC8498();
    sub_253DC84CC();
    goto LABEL_11;
  }
  sub_253CD8E14();

  return swift_arrayInitWithCopy();
}

uint64_t sub_253DC632C(uint64_t a1, uint64_t a2)
{
  return sub_253DC6854(a1, a2);
}

void *sub_253DC6344(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[16 * a2] > __src ? (BOOL v3 = &__src[16 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_253DF5B10();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 16 * a2);
  }
  return result;
}

uint64_t sub_253DC6420(uint64_t a1, uint64_t a2)
{
  return sub_253DC642C(a1, a2);
}

uint64_t sub_253DC642C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84DC();
LABEL_11:
    uint64_t result = sub_253DC8510();
    __break(1u);
    return result;
  }
  sub_253DC86FC();
  if (v4 + 40 * v3 > v2 && v2 + 40 * v3 > v4)
  {
    sub_253DC8498();
    sub_253DC84CC();
    goto LABEL_11;
  }
  sub_253BDEDD8(v5);
  sub_253CD8E14();

  return swift_arrayInitWithCopy();
}

uint64_t sub_253DC64E8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (BOOL v3 = a1 + 24 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_253DF5B10();
    __break(1u);
  }
  else
  {
    sub_253BDEDD8(&qword_269D7E9F8);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_253DC65EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (BOOL v3 = a1 + 16 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_253DF5B10();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_253DC66CC(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84DC();
LABEL_11:
    uint64_t result = sub_253DC8510();
    __break(1u);
    return result;
  }
  sub_253DC8658();
  if (!v6 & v5) {
    BOOL v7 = v4 > v2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    sub_253DC8498();
    sub_253DC84CC();
    goto LABEL_11;
  }
  sub_253BDEDD8(v3);
  sub_253CD8E14();

  return swift_arrayInitWithCopy();
}

void *sub_253DC6778(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[4 * a2] > __src ? (BOOL v3 = &__src[4 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_253DF5B10();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 4 * a2);
  }
  return result;
}

uint64_t sub_253DC6854(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    sub_253DC8498();
    sub_253DC84DC();
LABEL_11:
    uint64_t result = sub_253DC8510();
    __break(1u);
    return result;
  }
  sub_253DC86FC();
  v3(0);
  sub_253BDF7F0();
  sub_253DC8770();
  if (!v6 & v5) {
    BOOL v7 = v4 > v2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    sub_253DC8498();
    sub_253DC84CC();
    goto LABEL_11;
  }
  sub_253CD8E14();

  return swift_arrayInitWithCopy();
}

void sub_253DC6918(char a1, uint64_t a2, char a3)
{
  sub_253DC82D8(a1, a2, a3, *v3, &qword_26B256270, (void (*)(uint64_t, uint64_t, void *))sub_253DC5804, (void (*)(uint64_t, uint64_t, void *))sub_253DC5F8C);
  *BOOL v3 = v4;
}

void sub_253DC6968(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7C338, MEMORY[0x263F80508]);
  *BOOL v3 = v4;
}

void sub_253DC69CC(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA70, type metadata accessor for RetrievedValue);
  *BOOL v3 = v4;
}

void sub_253DC6A30(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7E9B0, MEMORY[0x263F4E108]);
  *BOOL v3 = v4;
}

char *sub_253DC6A94(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_253DC7DD0(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

void sub_253DC6AB4(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA48, MEMORY[0x263F80A78]);
  *BOOL v3 = v4;
}

uint64_t sub_253DC6B18(uint64_t a1, int64_t a2, char a3)
{
  uint64_t result = sub_253DC7EB4(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

void sub_253DC6B38(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EB98, type metadata accessor for DisambiguationListItem);
  *BOOL v3 = v4;
}

void sub_253DC6B9C(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EBC0, MEMORY[0x263F4EB90]);
  *BOOL v3 = v4;
}

void sub_253DC6C00(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EBB0, MEMORY[0x263F4EB98]);
  *BOOL v3 = v4;
}

void sub_253DC6C64(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EBB8, MEMORY[0x263F4EB78]);
  *BOOL v3 = v4;
}

void sub_253DC6CC8(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EB68, MEMORY[0x263F4D160]);
  *BOOL v3 = v4;
}

void sub_253DC6D2C(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EB60, MEMORY[0x263F4D150]);
  *BOOL v3 = v4;
}

void sub_253DC6D90(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EAC8, _s23ParameterStepEvaluationVMa);
  *BOOL v3 = v4;
}

void sub_253DC6DF4(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7BD98, _s16CandidateSummaryVMa);
  *BOOL v3 = v4;
}

void sub_253DC6E58(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EAE8, (uint64_t (*)(void))_s22CandidateIdExtractableOMa);
  *BOOL v3 = v4;
}

void sub_253DC6EBC()
{
  sub_253DC7FAC();
  *char v0 = v1;
}

void sub_253DC6EEC()
{
  sub_253DC7FAC();
  *char v0 = v1;
}

void sub_253DC6F1C()
{
  sub_253DC7FAC();
  *char v0 = v1;
}

void sub_253DC6F4C(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA30, MEMORY[0x263F4BF98]);
  *BOOL v3 = v4;
}

void sub_253DC6FB0(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EAC0, _s19ValueStepEvaluationVMa);
  *BOOL v3 = v4;
}

void sub_253DC7014(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA38, _s19SystemResponseEventVMa);
  *BOOL v3 = v4;
}

void sub_253DC7078(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA28, MEMORY[0x263F4DA08]);
  *BOOL v3 = v4;
}

void sub_253DC70DC(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EB28, MEMORY[0x263F4D7C8]);
  *BOOL v3 = v4;
}

void sub_253DC7140(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EB10, MEMORY[0x263F4C7E0]);
  *BOOL v3 = v4;
}

void sub_253DC71A4()
{
  sub_253DC8124();
  *char v0 = v1;
}

void sub_253DC71D4(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EAD0, _s18ToolStepEvaluationVMa);
  *BOOL v3 = v4;
}

void sub_253DC7238(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EB40, MEMORY[0x263F4D588]);
  *BOOL v3 = v4;
}

void sub_253DC729C(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EB48, MEMORY[0x263F4DDB0]);
  *BOOL v3 = v4;
}

void sub_253DC7300()
{
  sub_253DC7FAC();
  *char v0 = v1;
}

void sub_253DC7330()
{
  sub_253DC7FAC();
  *char v0 = v1;
}

void sub_253DC7360(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7E410, type metadata accessor for FeedbackLearning.FlowExpression);
  *BOOL v3 = v4;
}

void sub_253DC73C4(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA98, type metadata accessor for FeedbackLearning.CandidateEvaluation);
  *BOOL v3 = v4;
}

void sub_253DC7428(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EBA0, _s18TaskDefinitionThinO23CandidateEvaluationThinVMa);
  *BOOL v3 = v4;
}

void sub_253DC748C(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EBA8, _s18TaskDefinitionThinO18TaskEvaluationThinVMa);
  *BOOL v3 = v4;
}

void sub_253DC74F0(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_26B256258, MEMORY[0x263F4E050]);
  *BOOL v3 = v4;
}

void sub_253DC7554(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_26B256260, MEMORY[0x263F7FED0]);
  *BOOL v3 = v4;
}

void sub_253DC75B8(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_26B2561E8, MEMORY[0x263F07508]);
  *BOOL v3 = v4;
}

void sub_253DC761C()
{
  sub_253DC7FAC();
  *char v0 = v1;
}

void sub_253DC764C(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA18, MEMORY[0x263F4C4D0]);
  *BOOL v3 = v4;
}

void sub_253DC76B0(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA10, MEMORY[0x263F4BF78]);
  *BOOL v3 = v4;
}

void sub_253DC7714(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7EA90, MEMORY[0x263F80C80]);
  *BOOL v3 = v4;
}

void sub_253DC7778(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_26B256268, MEMORY[0x263F80B00]);
  *BOOL v3 = v4;
}

void sub_253DC77DC(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_26B256248, MEMORY[0x263F4DDE8]);
  *BOOL v3 = v4;
}

void sub_253DC7840(char a1, uint64_t a2, char a3)
{
  sub_253DC82D8(a1, a2, a3, *v3, &qword_26B256290, (void (*)(uint64_t, uint64_t, void *))sub_253DC5B08, (void (*)(uint64_t, uint64_t, void *))sub_253DC6344);
  *BOOL v3 = v4;
}

char *sub_253DC7890(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_253DC81EC(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

void sub_253DC78B0(char a1, uint64_t a2, char a3)
{
  sub_253DC82D8(a1, a2, a3, *v3, &qword_269D7E9C8, (void (*)(uint64_t, uint64_t, void *))sub_253DC5B08, (void (*)(uint64_t, uint64_t, void *))sub_253DC65EC);
  *BOOL v3 = v4;
}

void sub_253DC7900(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7E9D8, MEMORY[0x263F4DAF0]);
  *BOOL v3 = v4;
}

void sub_253DC7964(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_26B256220, type metadata accessor for EventPayloadWithPreassignedID);
  *BOOL v3 = v4;
}

void sub_253DC79C8()
{
  sub_253DC8124();
  *char v0 = v1;
}

char *sub_253DC79F8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_253DC83B4(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

uint64_t destroy for RuntimeNumericError()
{
  return sub_253DC2F28();
}

uint64_t _s23IntelligenceFlowRuntime19RuntimeNumericErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_253DC2F20();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for RuntimeNumericError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_253DC2F20();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_253DC2F28();
  return a1;
}

uint64_t assignWithTake for RuntimeNumericError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_253DC2F28();
  return a1;
}

uint64_t getEnumTagSinglePayload for RuntimeNumericError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RuntimeNumericError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_253DC7B9C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_253DC7BA4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RuntimeNumericError()
{
  return &type metadata for RuntimeNumericError;
}

ValueMetadata *type metadata accessor for VectorSimilarity()
{
  return &type metadata for VectorSimilarity;
}

void sub_253DC7BD0(char a1, uint64_t a2, char a3)
{
  sub_253DC7C68(a1, a2, a3, *v3, &qword_269D7E9E0, MEMORY[0x263F4DA00]);
  *unsigned int v3 = v4;
}

void sub_253DC7C34(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_253DC7C68(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    sub_253DC84AC();
    if (v10 != v11)
    {
      sub_253DC8528();
      if (v10)
      {
LABEL_23:
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  else
  {
    uint64_t v9 = a2;
  }
  uint64_t v12 = *(void *)(a4 + 16);
  if (v9 <= v12) {
    uint64_t v13 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v13 = v9;
  }
  if (!v13) {
    goto LABEL_17;
  }
  sub_253BDEDD8(a5);
  uint64_t v14 = a6(0);
  sub_253BDF7B0(v14);
  uint64_t v16 = *(void *)(v15 + 72);
  uint64_t v17 = (void *)sub_253DC8608();
  j__malloc_size_0(v17);
  if (!v16)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_253DC8764();
  BOOL v19 = v19 && v16 == -1;
  if (v19) {
    goto LABEL_22;
  }
  v17[2] = v12;
  v17[3] = 2 * (v18 / v16);
LABEL_17:
  uint64_t v20 = *(void *)(a6(0) - 8);
  uint64_t v21 = a4 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
  if (a1)
  {
    sub_253DC5EA0(v21, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_253DC6854(v21, v12);
  }
  swift_release();
}

char *sub_253DC7DD0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_253BDEDD8(&qword_269D7E9B8);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size_0(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_253DC5878(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_253DC6054(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_253DC7EB4(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_253BDEDD8(&qword_269D7EA58);
    uint64_t v10 = swift_allocObject();
    size_t v11 = j__malloc_size_0((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  uint64_t v12 = (char *)(a4 + 32);
  if (v5)
  {
    sub_253DC5B9C(v12, v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_253DC642C((uint64_t)v12, v8);
  }
  swift_release();
  return v10;
}

void sub_253DC7FAC()
{
  sub_253DC859C();
  if (v5)
  {
    sub_253DC84AC();
    if (v7 != v8)
    {
      sub_253DC8528();
      if (v7)
      {
LABEL_23:
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  else
  {
    uint64_t v6 = v3;
  }
  uint64_t v9 = *(void *)(v0 + 16);
  if (v6 <= v9) {
    uint64_t v10 = *(void *)(v0 + 16);
  }
  else {
    uint64_t v10 = v6;
  }
  if (!v10) {
    goto LABEL_17;
  }
  sub_253BDEDD8(v4);
  uint64_t v11 = sub_253BDEDD8(v1);
  sub_253BDF7B0(v11);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = (const void *)sub_253DC8630();
  j__malloc_size_0(v14);
  if (!v13)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_253DC8764();
  BOOL v16 = v16 && v13 == -1;
  if (v16) {
    goto LABEL_22;
  }
  sub_253DC86B0(v15);
LABEL_17:
  uint64_t v17 = sub_253BDEDD8(v1);
  sub_253C1CE88(v17);
  uint64_t v19 = v0 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
  if (v2)
  {
    sub_253DC5CB4(v19, v9);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_253DC626C(v19, v9);
  }
  swift_release();
}

void sub_253DC80C8(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_253DC8110()
{
}

void sub_253DC8124()
{
  sub_253DC859C();
  if (v4)
  {
    sub_253DC84AC();
    if (v5 != v6)
    {
      sub_253DC8528();
      if (v5)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  sub_253DC86EC();
  if (v3)
  {
    sub_253BDEDD8(v7);
    char v8 = (char *)sub_253DC8680();
    size_t v9 = j__malloc_size_0(v8);
    sub_253DC8730(v9);
  }
  else
  {
    char v8 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v10 = (char *)(v0 + 32);
  if (v1)
  {
    sub_253DC5DB0(v10, v2, v8 + 32);
    *(void *)(v0 + 16) = 0;
  }
  else
  {
    sub_253DC66CC((uint64_t)v10, v2);
  }
  swift_release();
}

void sub_253DC81D8()
{
}

char *sub_253DC81EC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_253BDEDD8(&qword_269D7E9F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size_0(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_253DC5C00(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_253DC64E8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_253DC82D8(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, void *), void (*a7)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    sub_253DC84AC();
    if (v12 != v13)
    {
      sub_253DC8528();
      if (v12)
      {
        __break(1u);
        return;
      }
      sub_253DC84BC();
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    sub_253BDEDD8(a5);
    BOOL v16 = (void *)sub_253DC8680();
    size_t v17 = j__malloc_size_0(v16);
    v16[2] = v14;
    void v16[3] = 2 * ((uint64_t)(v17 - 32) / 16);
  }
  else
  {
    BOOL v16 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v18 = v16 + 4;
  uint64_t v19 = a4 + 32;
  if (a1)
  {
    a6(v19, v14, v18);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    a7(v19, v14, v18);
  }
  swift_release();
}

char *sub_253DC83B4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_253BDEDD8(&qword_269D7EA78);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size_0(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  char v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_253DC5E0C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_253DC6778(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_253DC84EC()
{
  return sub_253DF5B10();
}

uint64_t sub_253DC8510()
{
  return sub_253DF5B10();
}

uint64_t sub_253DC8534()
{
  return 0;
}

void *sub_253DC8554@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

uint64_t sub_253DC8570()
{
  return v0;
}

uint64_t sub_253DC8584()
{
  *(void *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_253DC85AC(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 0;
  return swift_willThrow();
}

uint64_t sub_253DC85CC()
{
  return 0;
}

uint64_t sub_253DC85E0()
{
  return sub_253DF5C40();
}

uint64_t sub_253DC8608()
{
  return swift_allocObject();
}

uint64_t sub_253DC8630()
{
  return swift_allocObject();
}

uint64_t sub_253DC8674()
{
  return v0 + 32;
}

uint64_t sub_253DC8680()
{
  return swift_allocObject();
}

void sub_253DC86B0(uint64_t a1@<X8>)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * (a1 / v3);
}

uint64_t sub_253DC86D0()
{
  return sub_253DF5C40();
}

void sub_253DC8724(uint64_t a1@<X8>)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * a1;
}

uint64_t sub_253DC8730(uint64_t result)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * ((result - 32) / 8);
  return result;
}

uint64_t sub_253DC8748()
{
  return sub_253DF52E0();
}

uint64_t sub_253DC8784()
{
  return swift_arrayInitWithCopy();
}

uint64_t sub_253DC87B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  uint64_t v7 = sub_253DC88A0((uint64_t)v6, a2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v7;
}

uint64_t sub_253DC88A0(uint64_t a1, uint64_t a2)
{
  type metadata accessor for os_unfair_lock_s(255);
  sub_253DF5980();
  uint64_t v4 = sub_253DF5970();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t PerURLSingletonLockBox.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  PerURLSingletonLockBox.init()();
  return v0;
}

uint64_t PerURLSingletonLockBox.init()()
{
  sub_253DEFD20();
  swift_getTupleTypeMetadata2();
  sub_253DF5400();
  sub_253DC93C0();
  uint64_t v3 = sub_253DF5180();
  uint64_t v1 = sub_253DF51C0();
  *(void *)(v0 + 16) = sub_253DC87B8((uint64_t)&v3, v1);
  return v0;
}

uint64_t sub_253DC8A50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 80);
  uint64_t v7 = sub_253DF5810();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  size_t v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  char v13 = &v19[-v12];
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)&v19[-v12], 1, 1, v6);
  uint64_t v14 = v5;
  uint64_t v15 = v2[2];
  uint64_t v20 = v6;
  uint64_t v21 = *(void *)(v14 + 88);
  uint64_t v22 = a1;
  unint64_t v23 = v13;
  sub_253DEFD20();
  sub_253DC93C0();
  uint64_t v16 = sub_253DF51C0();
  sub_253DC95C8((void (*)(uint64_t))sub_253DC96DC, (uint64_t)v19, v15, v16, MEMORY[0x263F8EE60] + 8);
  if (v3) {
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
  }
  uint64_t v17 = v24;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v11, v13, v7);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v11, 1, v6) != 1)
  {
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(*(void *)(v6 - 8) + 32))(v17, v11, v6);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
  }
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
  uint64_t result = sub_253DF5AB0();
  __break(1u);
  return result;
}

uint64_t sub_253DC8CE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v42 = a3;
  uint64_t v39 = a5;
  uint64_t v8 = sub_253DEFD20();
  uint64_t v40 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v38 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v45 = sub_253DF5810();
  uint64_t v44 = *(void *)(v45 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v45);
  uint64_t v36 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v41 = (uint64_t)&v35 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v35 - v18;
  uint64_t v20 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1;
  uint64_t v23 = *a1;
  unint64_t v35 = sub_253DC93C0();
  MEMORY[0x25A26F520](a2, v23, v8, a4);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v19, 1, a4) == 1)
  {
    uint64_t v24 = v42;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
    uint64_t v26 = v8;
    v25(v12, a2, v8);
    uint64_t v27 = v43;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v39 + 16))(v12, a4);
    if (!v27)
    {
      uint64_t v29 = v41;
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v41, 0, 1, a4);
      uint64_t v30 = v44;
      uint64_t v31 = v29;
      uint64_t v32 = v45;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 40))(v24, v31, v45);
      v25(v38, a2, v26);
      (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v36, v24, v32);
      sub_253DF51C0();
      return sub_253DF51E0();
    }
  }
  else
  {
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v33(v22, v19, a4);
    uint64_t v34 = v42;
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v45);
    v33((char *)v34, v22, a4);
    return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v34, 0, 1, a4);
  }
  return result;
}

void sub_253DC90DC(uint64_t a1)
{
  uint64_t v2 = v1[2];
  long long v5 = *(_OWORD *)(*v1 + 80);
  uint64_t v6 = a1;
  sub_253DEFD20();
  sub_253DC93C0();
  uint64_t v3 = sub_253DF51C0();
  sub_253DC95C8((void (*)(uint64_t))sub_253DC9514, (uint64_t)v4, v2, v3, MEMORY[0x263F8EE60] + 8);
}

uint64_t sub_253DC919C()
{
  uint64_t v0 = sub_253DF5810();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - v2;
  sub_253DEFD20();
  sub_253DC93C0();
  sub_253DF51C0();
  sub_253DF5170();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t PerURLSingletonLockBox.deinit()
{
  swift_release();
  return v0;
}

uint64_t PerURLSingletonLockBox.__deallocating_deinit()
{
  PerURLSingletonLockBox.deinit();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_253DC9304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return static PerURLSingletonDatabase.sharedDatabase(url:)(a1, a2, a3);
}

uint64_t static PerURLSingletonDatabase.sharedDatabase(url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = sub_253DC9718(a1, a2);
  v6(v5);
  sub_253DC8A50(a1, a3);
  return swift_release();
}

uint64_t static PerURLSingletonDatabase.deinitDatabase(url:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_253DC9718(a1, a2);
  v4(v3);
  sub_253DC90DC(a1);

  return swift_release();
}

unint64_t sub_253DC93C0()
{
  unint64_t result = qword_269D7EBC8[0];
  if (!qword_269D7EBC8[0])
  {
    sub_253DEFD20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269D7EBC8);
  }
  return result;
}

uint64_t dispatch thunk of PerURLSingletonable.url.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PerURLSingletonable.init(url:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_253DC944C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PerURLSingletonLockBox()
{
  return sub_253BEFB10();
}

uint64_t method lookup function for PerURLSingletonLockBox(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PerURLSingletonLockBox);
}

uint64_t dispatch thunk of PerURLSingletonLockBox.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static PerURLSingletonDatabase.singletonLockbox.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static PerURLSingletonDatabase.sharedDatabase(url:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_253DC9514()
{
  return sub_253DC919C();
}

uint64_t sub_253DC9534@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(v2 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(v2 + *MEMORY[0x263F8DD00]) - 8) + 16))(a2);
}

void sub_253DC95C8(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_253DC9654(a3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a3 + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0x1FFFFFFFCLL)), a1, a2, a4, a5, &v5);
}

void sub_253DC9654(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v7) {
    *a7 = v7;
  }
}

uint64_t sub_253DC96DC(void *a1)
{
  return sub_253DC8CE4(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_253DC96FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_253DC9534(a1, a2);
}

uint64_t sub_253DC9718(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_253DC9734@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v61 = a1;
  uint64_t v3 = sub_253DF4C80();
  sub_253C0F830();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v59 - v10;
  uint64_t v12 = sub_253DF07B0();
  MEMORY[0x270FA5388](v12 - 8);
  sub_253C10D28();
  v59[1] = v14 - v13;
  uint64_t v60 = sub_253DF0810();
  sub_253C0F830();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388](v17);
  sub_253C10D28();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_253DF4C90();
  sub_253C0F830();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  sub_253C10D28();
  uint64_t v27 = (id *)(v26 - v25);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v26 - v25, v2, v21);
  int v28 = (*(uint64_t (**)(id *, uint64_t))(v23 + 88))(v27, v21);
  if (v28 == *MEMORY[0x263F807D0])
  {
    uint64_t v29 = sub_253DC9E58();
    v30(v29);
    id v31 = *v27;
    id v32 = objc_msgSend(*v27, sel_viewSnippetOptions);
    if (v32)
    {
      uint64_t v33 = v32;
      objc_msgSend(v32, sel_canReplacePrintableText);
    }
    uint64_t v40 = sub_253DC9D88(v31);
    if (v41 >> 60 == 15)
    {
      id v42 = objc_msgSend(v31, sel_viewData);
      sub_253DEFDD0();

      sub_253C55A9C(v31, (SEL *)&selRef_containerBundleIdentifier);
      sub_253C55A9C(v31, (SEL *)&selRef_targetBundleIdentifier);
      sub_253DF07F0();
      uint64_t v43 = sub_253DC9E10();
      v44(v43);
      sub_253BDEDD8(&qword_269D7EC50);
      uint64_t v45 = (__n128 *)sub_253DC9E30();
      uint64_t v46 = sub_253DC9DEC(v45, (__n128)xmmword_253DF6EC0);
      v47(v46);
      sub_253DF07A0();
      sub_253DF07C0();
    }
    else
    {
      uint64_t v48 = v40;
      unint64_t v49 = v41;
      uint64_t v50 = sub_253C55A9C(v31, (SEL *)&selRef_snippetModelBundleIdentifier);
      if (v51) {
        unint64_t v52 = v50;
      }
      else {
        unint64_t v52 = 0xD00000000000001ALL;
      }
      if (v51) {
        unint64_t v53 = v51;
      }
      else {
        unint64_t v53 = 0x8000000253E1ACD0;
      }
      sub_253D75DE0(v48, v49);
      MEMORY[0x25A26AB50](v48, v49, v52, v53);
      uint64_t v54 = sub_253DC9E10();
      v55(v54);
      sub_253BDEDD8(&qword_269D7EC50);
      uint64_t v56 = (__n128 *)sub_253DC9E30();
      unsigned int v57 = sub_253DC9DEC(v56, (__n128)xmmword_253DF6EC0);
      v58(v57);
      sub_253DF07A0();
      sub_253DF07C0();

      sub_253D8F168(v48, v49);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v20, v23);
  }
  else if (v28 == *MEMORY[0x263F807C8])
  {
    uint64_t v34 = sub_253DC9E58();
    v35(v34);
    (*(void (**)(char *, id *, uint64_t))(v5 + 32))(v11, v27, v3);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v11, v3);
    sub_253DF07E0();
    uint64_t v36 = v60;
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v20, *MEMORY[0x263F4C678], v60);
    sub_253BDEDD8(&qword_269D7EC50);
    unint64_t v37 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_253DF6EC0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 16))(v38 + v37, v20, v36);
    sub_253DF07D0();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v20, v36);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v3);
  }
  else
  {
    sub_253DF0850();
    return (*(uint64_t (**)(id *, uint64_t))(v23 + 8))(v27, v21);
  }
}

uint64_t sub_253DC9C80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_253DC9D88(v1);
  if (v5 >> 60 != 15)
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    uint64_t v8 = sub_253C55A9C(v2, (SEL *)&selRef_snippetModelBundleIdentifier);
    if (v9)
    {
      MEMORY[0x25A26AB50](v6, v7, v8, v9);
      uint64_t v10 = *MEMORY[0x263F4C628];
      uint64_t v11 = sub_253DF0810();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(a1, v10, v11);
      uint64_t v12 = a1;
      uint64_t v13 = 0;
      uint64_t v14 = v11;
      goto LABEL_6;
    }
    sub_253D8F168(v6, v7);
  }
  uint64_t v14 = sub_253DF0810();
  uint64_t v12 = a1;
  uint64_t v13 = 1;
LABEL_6:

  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v12, v13, 1, v14);
}

uint64_t sub_253DC9D88(void *a1)
{
  id v1 = objc_msgSend(a1, sel_snippetModelData);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_253DEFDD0();

  return v3;
}

char *sub_253DC9DEC(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return (char *)a1 + v2;
}

uint64_t sub_253DC9E10()
{
  return v0;
}

uint64_t sub_253DC9E30()
{
  return swift_allocObject();
}

uint64_t sub_253DC9E58()
{
  return v0;
}

uint64_t sub_253DC9E70(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t result = sub_253DCB774(0, result, v3);
  if (v4) {
    unint64_t v5 = v3;
  }
  else {
    unint64_t v5 = result;
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_9;
  }
  if (v3 >= v5) {
    return a2;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_253DC9EE0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_253DC9EF8(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))sub_253DCB174);
}

uint64_t sub_253DC9EF8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, unint64_t))
{
  if ((a4 & 1) == 0) {
    goto LABEL_2;
  }
  sub_253DF5CA0();
  swift_unknownObjectRetain_n();
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
  uint64_t v12 = *(void *)(v11 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v12 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    uint64_t v10 = a5(a1, a2, a3, a4);
    goto LABEL_9;
  }
  uint64_t v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v10;
}

void static TextChunker.getTextChunks(text:chunkTokenSize:maxChunkSizeChars:maxNumChunks:minChunkTokensToEmbed:nonOverlappingChunks:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v166 = a6;
  uint64_t v161 = a5;
  uint64_t v179 = a4;
  uint64_t v171 = a3;
  uint64_t v10 = sub_253DEFC70();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v158 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v181 = a1;
  uint64_t v182 = a2;
  sub_253DEFC60();
  unint64_t v173 = sub_253DCAD8C();
  uint64_t v14 = sub_253DF5840();
  unint64_t v16 = v15;
  uint64_t v17 = *(void (**)(void, void))(v11 + 8);
  uint64_t v174 = v13;
  uint64_t v175 = v11 + 8;
  uint64_t v176 = v10;
  uint64_t v172 = v17;
  v17(v13, v10);
  swift_bridgeObjectRelease();
  uint64_t v18 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0) {
    uint64_t v18 = v14 & 0xFFFFFFFFFFFFLL;
  }
  if (!v18) {
    return;
  }
  int v160 = a7;
  unint64_t v19 = 0x263F14000uLL;
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14040]), sel_initWithUnit_, 1);
  sub_253DCB708(a1, a2, v20);
  id v159 = v20;
  uint64_t v21 = sub_253DF56B0();
  uint64_t v22 = v21;
  unint64_t v168 = *(void *)(v21 + 16);
  if (!v168)
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = MEMORY[0x263F8EE78];
    uint64_t v25 = MEMORY[0x263F8EE78];
    goto LABEL_53;
  }
  uint64_t v23 = a1;
  unint64_t v24 = 0;
  uint64_t v167 = (void *)(v21 + 32);
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v162 = v23;
  uint64_t v163 = a2;
  uint64_t v165 = v21;
  do
  {
    if (v24 >= *(void *)(v22 + 16)) {
      goto LABEL_135;
    }
    uint64_t v180 = v25;
    unint64_t v169 = v24;
    uint64_t v27 = sub_253DF5350();
    uint64_t v28 = MEMORY[0x25A26F600](v27);
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    id v31 = (char *)objc_msgSend(objc_allocWithZone(*(Class *)(v19 + 64)), sel_initWithUnit_, 0);
    sub_253DCB708(v28, v30, v31);
    uint64_t v32 = sub_253DF56B0();
    uint64_t v178 = v28;
    uint64_t v33 = sub_253DF52D0();
    long long v170 = v31;
    if (v33 <= v179)
    {
      unint64_t v68 = v19;
      uint64_t v69 = v32;
      swift_bridgeObjectRelease();
      uint64_t v70 = v23;
      uint64_t v71 = sub_253DF5350();
      MEMORY[0x25A26F600](v71);
      swift_bridgeObjectRelease();
      uint64_t v72 = v180;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DCB7C0();
        uint64_t v72 = v81;
      }
      unint64_t v73 = v169;
      sub_253DCBA24();
      if (v74)
      {
        sub_253DCB838();
        uint64_t v180 = v82;
      }
      sub_253DCB9C8();
      uint64_t v75 = *(void *)(v69 + 16);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DCB85C();
        uint64_t v26 = v83;
      }
      uint64_t v22 = v165;
      unint64_t v19 = v68;
    }
    else
    {
      uint64_t v177 = v30;
      uint64_t v34 = *(void *)(v32 + 16);
      uint64_t v164 = v32;
      if (v34)
      {
        uint64_t v35 = 0;
        uint64_t v36 = v32 + 40;
        uint64_t v37 = MEMORY[0x263F8EE78];
        while (1)
        {
          uint64_t v38 = sub_253DF5350();
          uint64_t v39 = MEMORY[0x25A26F600](v38);
          uint64_t v41 = v40;
          swift_bridgeObjectRelease();
          uint64_t v42 = sub_253DF52D0();
          if (__OFADD__(v42, v35))
          {
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
            goto LABEL_136;
          }
          if (v42 + v35 <= v179)
          {
            swift_bridgeObjectRetain();
            if (swift_isUniquelyReferenced_nonNull_native()) {
              goto LABEL_23;
            }
          }
          else
          {
            uint64_t v43 = v26;
            uint64_t v181 = v37;
            swift_bridgeObjectRetain();
            sub_253BDEDD8(&qword_26B256060);
            sub_253D9C5EC();
            sub_253DCB9A4();
            swift_bridgeObjectRelease();
            sub_253DCB880();
            sub_253DCB9DC();
            uint64_t v44 = sub_253DF5840();
            uint64_t v46 = v45;
            uint64_t v47 = sub_253DCB7E4();
            v48(v47);
            swift_bridgeObjectRelease();
            uint64_t v49 = v180;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_253DCB7C0();
              uint64_t v49 = v64;
            }
            unint64_t v51 = *(void *)(v49 + 16);
            unint64_t v50 = *(void *)(v49 + 24);
            uint64_t v180 = v49;
            if (v51 >= v50 >> 1)
            {
              sub_253DCB838();
              uint64_t v180 = v65;
            }
            uint64_t v52 = v180;
            *(void *)(v180 + 16) = v51 + 1;
            uint64_t v53 = v52 + 16 * v51;
            *(void *)(v53 + 32) = v44;
            *(void *)(v53 + 40) = v46;
            uint64_t v54 = *(void *)(v37 + 16);
            swift_bridgeObjectRelease();
            uint64_t v26 = v43;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_253DCB85C();
              uint64_t v26 = v66;
            }
            unint64_t v55 = *(void *)(v26 + 16);
            if (v55 >= *(void *)(v26 + 24) >> 1)
            {
              sub_253DCB938();
              uint64_t v26 = v67;
            }
            *(void *)(v26 + 16) = v55 + 1;
            *(void *)(v26 + 8 * v55 + 32) = v54;
            swift_bridgeObjectRetain();
            uint64_t v35 = 0;
          }
          sub_253DC39C0();
          uint64_t v37 = v56;
LABEL_23:
          unint64_t v58 = *(void *)(v37 + 16);
          unint64_t v57 = *(void *)(v37 + 24);
          if (v58 >= v57 >> 1)
          {
            sub_253DCB9FC(v57);
            sub_253DC39C0();
            uint64_t v37 = v63;
          }
          *(void *)(v37 + 16) = v58 + 1;
          unint64_t v59 = v37 + 16 * v58;
          *(void *)(v59 + 32) = v39;
          *(void *)(v59 + 40) = v41;
          uint64_t v60 = sub_253DF52D0();
          swift_bridgeObjectRelease();
          uint64_t v61 = v60 + 1;
          if (__OFADD__(v60, 1)) {
            goto LABEL_128;
          }
          BOOL v62 = __OFADD__(v35, v61);
          v35 += v61;
          if (v62) {
            goto LABEL_129;
          }
          v36 += 16;
          if (!--v34) {
            goto LABEL_37;
          }
        }
      }
      uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_37:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*(void *)(v37 + 16))
      {

        swift_bridgeObjectRelease();
        uint64_t v23 = v162;
        unint64_t v19 = 0x263F14000;
        uint64_t v22 = v165;
        unint64_t v73 = v169;
        goto LABEL_48;
      }
      uint64_t v181 = v37;
      swift_bridgeObjectRetain();
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DCB9A4();
      swift_bridgeObjectRelease();
      sub_253DCB880();
      sub_253DCB9DC();
      sub_253DF5840();
      uint64_t v76 = sub_253DCB7E4();
      v77(v76);
      swift_bridgeObjectRelease();
      uint64_t v72 = v180;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v19 = 0x263F14000;
      unint64_t v73 = v169;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_253DCB7C0();
        uint64_t v72 = v84;
      }
      sub_253DCBA24();
      if (v74)
      {
        sub_253DCB838();
        uint64_t v180 = v85;
      }
      sub_253DCB9C8();
      uint64_t v75 = *(void *)(v37 + 16);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DCB85C();
        uint64_t v26 = v86;
      }
      uint64_t v70 = v162;
      uint64_t v22 = v165;
    }
    uint64_t v79 = *(void *)(v26 + 16);
    sub_253DCB89C();
    if (v74)
    {
      sub_253DCB938();
      uint64_t v26 = v80;
    }
    *(void *)(v26 + 16) = v72;
    *(void *)(v26 + 8 * v79 + 32) = v75;

    uint64_t v23 = v70;
LABEL_48:
    unint64_t v24 = v73 + 1;
    uint64_t v25 = v180;
  }
  while (v24 != v168);
  swift_bridgeObjectRelease();
LABEL_53:
  uint64_t v87 = *(void *)(v25 + 16);
  if (!v87) {
    goto LABEL_140;
  }
  unint64_t v88 = 0;
  uint64_t v165 = v87 - 1;
  uint64_t v177 = v26 + 32;
  uint64_t v89 = (void *)(v25 + 40);
  uint64_t v90 = MEMORY[0x263F8EE78];
  unint64_t v169 = MEMORY[0x263F8EE78];
  long long v170 = (char *)MEMORY[0x263F8EE78];
  uint64_t v178 = v26;
  uint64_t v180 = v25;
  do
  {
    unint64_t v91 = *(void *)(v25 + 16);
    uint64_t v167 = v89;
    unint64_t v168 = v88;
    if (v88 < v91)
    {
      uint64_t v164 = v90;
      uint64_t v92 = 0;
      uint64_t v93 = 0;
      uint64_t v94 = MEMORY[0x263F8EE78];
      while (v88 < v91)
      {
        if (v88 >= *(void *)(v26 + 16)) {
          goto LABEL_131;
        }
        uint64_t v96 = *(v89 - 1);
        uint64_t v95 = *v89;
        uint64_t v97 = *(void *)(v177 + 8 * v88);
        swift_bridgeObjectRetain();
        uint64_t v98 = sub_253DF52D0();
        if (*(void *)(v94 + 16))
        {
          if (__OFADD__(v93, v97)) {
            goto LABEL_134;
          }
          if (v93 + v97 > v171) {
            goto LABEL_72;
          }
        }
        BOOL v62 = __OFADD__(v92, v98);
        v92 += v98;
        if (v62) {
          goto LABEL_132;
        }
        if (v92 > v179)
        {
LABEL_72:
          swift_bridgeObjectRelease();
          uint64_t v181 = v94;
          sub_253BDEDD8(&qword_26B256060);
          sub_253D9C5EC();
          sub_253DCB980();
          swift_bridgeObjectRelease();
          sub_253DCB880();
          sub_253DCB9DC();
          uint64_t v104 = sub_253DF5840();
          uint64_t v106 = v105;
          uint64_t v107 = sub_253DCB7E4();
          v108(v107);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          uint64_t v109 = v170;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_253DCB7C0();
            uint64_t v109 = v135;
          }
          uint64_t v26 = v178;
          uint64_t v90 = v164;
          long long v170 = v109;
          sub_253DCB89C();
          if (v74)
          {
            sub_253DCB914();
            long long v170 = v136;
          }
          sub_253DCB9E8();
          uint64_t v110 = v169;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_253DCB8A8();
            uint64_t v110 = v137;
          }
          uint64_t v111 = *(void *)(v110 + 16);
          unint64_t v169 = v110;
          sub_253DCB89C();
          if (v74)
          {
            sub_253DCB8CC();
            unint64_t v169 = v138;
          }
          unint64_t v112 = v169;
          *(void *)(v169 + 16) = v110;
          *(void *)(v112 + 8 * v111 + 32) = v88;
          if (v93 <= v166)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_253DCB95C();
              uint64_t v90 = v139;
            }
            uint64_t v113 = *(void *)(v90 + 16);
            sub_253DCB89C();
            if (v74)
            {
              sub_253DCB8F0();
              uint64_t v90 = v140;
            }
            *(void *)(v90 + 16) = v110;
            uint64_t v114 = v90 + 16 * v113;
            *(void *)(v114 + 32) = v104;
            *(void *)(v114 + 40) = v106;
          }
          uint64_t v94 = MEMORY[0x263F8EE78];
          uint64_t v25 = v180;
          goto LABEL_88;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_253DC39C0();
          uint64_t v94 = v102;
        }
        unint64_t v100 = *(void *)(v94 + 16);
        unint64_t v99 = *(void *)(v94 + 24);
        if (v100 >= v99 >> 1)
        {
          sub_253DCB9FC(v99);
          sub_253DC39C0();
          uint64_t v94 = v103;
        }
        *(void *)(v94 + 16) = v100 + 1;
        unint64_t v101 = v94 + 16 * v100;
        *(void *)(v101 + 32) = v96;
        *(void *)(v101 + 40) = v95;
        BOOL v62 = __OFADD__(v93, v97);
        v93 += v97;
        if (v62) {
          goto LABEL_133;
        }
        ++v88;
        uint64_t v25 = v180;
        unint64_t v91 = *(void *)(v180 + 16);
        v89 += 2;
        uint64_t v26 = v178;
        if (v88 >= v91)
        {
          uint64_t v90 = v164;
          goto LABEL_88;
        }
      }
      goto LABEL_130;
    }
    uint64_t v93 = 0;
    uint64_t v94 = MEMORY[0x263F8EE78];
LABEL_88:
    if (*(void *)(v94 + 16))
    {
      uint64_t v181 = v94;
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DCB980();
      swift_bridgeObjectRelease();
      sub_253DCB880();
      sub_253DCB9DC();
      uint64_t v115 = sub_253DF5840();
      uint64_t v117 = v116;
      uint64_t v118 = sub_253DCB7E4();
      v119(v118);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v120 = v170;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DCB7C0();
        uint64_t v120 = v129;
      }
      long long v170 = v120;
      sub_253DCB89C();
      if (v74)
      {
        sub_253DCB914();
        long long v170 = v130;
      }
      sub_253DCB9E8();
      uint64_t v121 = *(void *)(v180 + 16);
      uint64_t v122 = v169;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DCB8A8();
        uint64_t v122 = v131;
      }
      unint64_t v124 = *(void *)(v122 + 16);
      unint64_t v123 = *(void *)(v122 + 24);
      unint64_t v169 = v122;
      unint64_t v125 = v124 + 1;
      if (v124 >= v123 >> 1)
      {
        sub_253DCB8CC();
        unint64_t v169 = v132;
      }
      unint64_t v126 = v169;
      *(void *)(v169 + 16) = v125;
      *(void *)(v126 + 8 * v124 + 32) = v121;
      if (v93 <= v166)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_253DCB95C();
          uint64_t v90 = v133;
        }
        uint64_t v127 = *(void *)(v90 + 16);
        sub_253DCB89C();
        if (v74)
        {
          sub_253DCB8F0();
          uint64_t v90 = v134;
        }
        *(void *)(v90 + 16) = v125;
        uint64_t v128 = v90 + 16 * v127;
        *(void *)(v128 + 32) = v115;
        *(void *)(v128 + 40) = v117;
      }
      uint64_t v25 = v180;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    unint64_t v88 = v168 + 1;
    uint64_t v89 = v167 + 2;
  }
  while (v168 != v165);
  if ((v160 & 1) == 0 && *(void *)(v90 + 16) <= v161)
  {
    swift_bridgeObjectRelease();
LABEL_126:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  uint64_t v141 = *(void *)(v25 + 16);
  if (!v141)
  {
    uint64_t v145 = MEMORY[0x263F8EE78];
LABEL_124:
    uint64_t v154 = sub_253DC9E70(v161, v145);
    sub_253DC9EF8(v154, v155, v156, v157, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))sub_253DCB300);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_126;
  }
  unint64_t v142 = 0;
  uint64_t v143 = v170 + 32;
  unint64_t v144 = v169 + 32;
  uint64_t v145 = MEMORY[0x263F8EE78];
  while ((v142 & 0x8000000000000000) == 0)
  {
    if (v142 >= *((void *)v170 + 2)) {
      goto LABEL_137;
    }
    uint64_t v146 = &v143[16 * v142];
    swift_bridgeObjectRetain();
    uint64_t v147 = sub_253DF52D0();
    swift_bridgeObjectRelease();
    if (v147 > v166)
    {
      if (v142 >= *((void *)v170 + 2)) {
        goto LABEL_139;
      }
      uint64_t v149 = *(void *)v146;
      uint64_t v148 = *((void *)v146 + 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DCB7C0();
        uint64_t v145 = v152;
      }
      unint64_t v150 = *(void *)(v145 + 16);
      if (v150 >= *(void *)(v145 + 24) >> 1)
      {
        sub_253DC39C0();
        uint64_t v145 = v153;
      }
      *(void *)(v145 + 16) = v150 + 1;
      uint64_t v151 = v145 + 16 * v150;
      *(void *)(v151 + 32) = v149;
      *(void *)(v151 + 40) = v148;
    }
    if (v142 >= *(void *)(v169 + 16)) {
      goto LABEL_138;
    }
    unint64_t v142 = *(void *)(v144 + 8 * v142);
    if ((uint64_t)v142 >= v141) {
      goto LABEL_124;
    }
  }
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
}

uint64_t sub_253DCAD14(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_253DCB820();
    uint64_t result = sub_253DCB7FC();
    __break(1u);
  }
  else if (a1)
  {
    uint64_t result = sub_253DF5410();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

unint64_t sub_253DCAD8C()
{
  unint64_t result = qword_269D7EC58;
  if (!qword_269D7EC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7EC58);
  }
  return result;
}

uint64_t sub_253DCADD8(uint64_t a1)
{
  return sub_253DCAF5C(a1, MEMORY[0x263F4DA08]);
}

uint64_t sub_253DCADF0(uint64_t a1)
{
  return sub_253DCAE08(a1, &qword_269D7C8F0);
}

uint64_t sub_253DCADFC(uint64_t a1)
{
  return sub_253DCAE08(a1, &qword_26B256160);
}

uint64_t sub_253DCAE08(uint64_t a1, uint64_t *a2)
{
  if (a1 < 0)
  {
    sub_253DCB820();
    uint64_t result = sub_253DCB7FC();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_253BDEDD8(a2);
      *(void *)(sub_253DF5410() + 16) = a1;
    }
    sub_253BDEDD8(a2);
    return sub_253DCBA10();
  }
  return result;
}

uint64_t sub_253DCAEC4(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_253DCB820();
    uint64_t result = sub_253DCB7FC();
    __break(1u);
  }
  else if (a1)
  {
    sub_253BDEDD8(&qword_269D7E9F8);
    uint64_t result = sub_253DF5410();
    *(void *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_253DCAF44(uint64_t a1)
{
  return sub_253DCAF5C(a1, (void (*)(void))type metadata accessor for SessionCoordinatorCommand);
}

uint64_t sub_253DCAF5C(uint64_t a1, void (*a2)(void))
{
  if (a1 < 0)
  {
    sub_253DCB820();
    uint64_t result = sub_253DCB7FC();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      a2(0);
      *(void *)(sub_253DF5410() + 16) = a1;
    }
    a2(0);
    return sub_253DCBA10();
  }
  return result;
}

size_t sub_253DCB020(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  sub_253BDEDD8(&qword_269D7EA28);
  uint64_t v3 = *(void *)(sub_253DF3770() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = j__malloc_size_0(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      uint64_t v9 = sub_253DCB3C0(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_253BDF450();
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

void sub_253DCB174(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v5)
  {
    if (v5 <= 0) {
      goto LABEL_11;
    }
    sub_253BDEDD8(&qword_26B256258);
    uint64_t v8 = *(void *)(sub_253DF4230() - 8);
    uint64_t v9 = *(void *)(v8 + 72);
    unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v11 = (void *)swift_allocObject();
    size_t v12 = j__malloc_size_0(v11);
    if (v9)
    {
      if (v12 - v10 != 0x8000000000000000 || v9 != -1)
      {
        v11[2] = v5;
        v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
LABEL_11:
        if (v4 != a3)
        {
          uint64_t v14 = *(void *)(sub_253DF4230() - 8);
          sub_253DC603C(a2 + *(void *)(v14 + 72) * a3, v5);
          return;
        }
        goto LABEL_16;
      }
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      return;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
}

void sub_253DCB300(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      sub_253BDEDD8(&qword_26B256270);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size_0(v8);
      v8[2] = v5;
      void v8[3] = 2 * ((uint64_t)(v9 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_253DC5F8C(a2 + 16 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_253DCB3C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_253DF3770();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 64);
  uint64_t v15 = a4 + 64;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 32);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 32);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  uint64_t v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 56) + v29 * v24, v8);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_253DCB708(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_253DF5260();
  objc_msgSend(a3, sel_setString_, v4);
}

ValueMetadata *type metadata accessor for TextChunker()
{
  return &type metadata for TextChunker;
}

uint64_t sub_253DCB774(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2) {
      return 0;
    }
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  BOOL v5 = __OFADD__(result, a2);
  result += a2;
  if (v5) {
    goto LABEL_14;
  }
  return result;
}

void sub_253DCB7C0()
{
  sub_253DC39C0();
}

uint64_t sub_253DCB7E4()
{
  return v0;
}

uint64_t sub_253DCB7FC()
{
  return sub_253DF5AA0();
}

void sub_253DCB838()
{
  sub_253DC39C0();
}

void sub_253DCB85C()
{
  sub_253DC4C34();
}

uint64_t sub_253DCB880()
{
  *(void *)(v2 - 104) = v0;
  *(void *)(v2 - 96) = v1;
  return sub_253DEFC60();
}

void sub_253DCB8A8()
{
  sub_253DC4C34();
}

void sub_253DCB8CC()
{
  sub_253DC4C34();
}

void sub_253DCB8F0()
{
  sub_253DC39C0();
}

void sub_253DCB914()
{
  sub_253DC39C0();
}

void sub_253DCB938()
{
  sub_253DC4C34();
}

void sub_253DCB95C()
{
  sub_253DC39C0();
}

uint64_t sub_253DCB980()
{
  return sub_253DF5240();
}

uint64_t sub_253DCB9A4()
{
  return sub_253DF5240();
}

void sub_253DCB9C8()
{
  uint64_t v5 = *(void *)(v4 - 112);
  *(void *)(v5 + 16) = v0;
  uint64_t v6 = v5 + 16 * v3;
  *(void *)(v6 + 32) = v1;
  *(void *)(v6 + 40) = v2;
}

uint64_t sub_253DCB9DC()
{
  return v0;
}

void sub_253DCB9E8()
{
  uint64_t v5 = *(void *)(v4 - 192);
  *(void *)(v5 + 16) = v0;
  uint64_t v6 = v5 + 16 * v2;
  *(void *)(v6 + 32) = v3;
  *(void *)(v6 + 40) = v1;
}

BOOL sub_253DCB9FC@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_253DCBA10()
{
  return v0;
}

void sub_253DCBA24()
{
  *(void *)(v1 - 112) = v0;
}

id sub_253DCBA38(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_253DCBA7C(a1, a2);
}

id sub_253DCBA7C(uint64_t a1, void *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = v2;
  uint64_t v7 = sub_253DF18E0();
  uint64_t v8 = (uint64_t *)&v6[OBJC_IVAR____TtCC23IntelligenceFlowRuntime24InternalXPCServiceServer6Server_clientApplicationIdentifier];
  *uint64_t v8 = v7;
  v8[1] = v9;

  v13.receiver = v6;
  v13.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v13, sel_init);

  uint64_t v11 = sub_253DF18F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  return v10;
}

void sub_253DCBB40()
{
}

id sub_253DCBB80()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_253DCBBCC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id result = sub_253DCBA38(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253DCBBF4()
{
  return MEMORY[0x270F576E0](v0);
}

uint64_t sub_253DCBBFC()
{
  return MEMORY[0x270F576E0](v0);
}

uint64_t sub_253DCBC04()
{
  return MEMORY[0x270F576D8](v0);
}

uint64_t type metadata accessor for InternalXPCServiceServer()
{
  return self;
}

uint64_t type metadata accessor for InternalXPCServiceServer.Server()
{
  return self;
}

uint64_t sub_253DCBC5C(uint64_t a1, uint64_t a2)
{
  return sub_253DCBCF0(&qword_26B251C88, a2, (void (*)(uint64_t))type metadata accessor for InternalXPCServiceServer.Server);
}

uint64_t sub_253DCBCA4()
{
  return sub_253DCBCF0(&qword_26B2562D8, 255, MEMORY[0x263F4C978]);
}

uint64_t sub_253DCBCF0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_253DCBD38()
{
  swift_beginAccess();
  uint64_t v0 = qword_26B257558;
  id v1 = (id)qword_26B257558;
  return v0;
}

void sub_253DCBD84(uint64_t a1)
{
  swift_beginAccess();
  objc_super v2 = (void *)qword_26B257558;
  qword_26B257558 = a1;
}

uint64_t (*sub_253DCBDD4())()
{
  return j_j__swift_endAccess_0;
}

uint64_t sub_253DCBE2C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_253DCBE74(uint64_t a1)
{
  qword_26B257550 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_253DCBEC4())()
{
  return j__swift_endAccess_0;
}

uint64_t sub_253DCBF24()
{
  uint64_t v1 = sub_253DF3DE0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + *(void *)(*(void *)v0 + 128);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  sub_253DF3DA0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

id sub_253DCC044(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_253DCC088(a1, a2);
}

id sub_253DCC088(uint64_t a1, void *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v42 = sub_253DF18F0();
  sub_253C0F830();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_253BDFA94();
  uint64_t v10 = v9;
  uint64_t v40 = sub_253DF24A0();
  sub_253C0F830();
  uint64_t v39 = v11;
  MEMORY[0x270FA5388](v12);
  sub_253BDFA94();
  uint64_t v14 = v13;
  uint64_t v15 = OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_encoder;
  sub_253DEFC50();
  sub_253C520A4();
  uint64_t v16 = v2;
  *(void *)&v2[v15] = sub_253DEFC40();
  uint64_t v17 = OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_decoder;
  sub_253DEFC20();
  sub_253C520A4();
  *(void *)&v16[v17] = sub_253DEFC10();
  sub_253DF1840();
  sub_253C520A4();
  sub_253CD989C();
  *(void *)&v16[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_transaction] = sub_253DF1850();
  uint64_t v41 = a1;
  uint64_t v18 = sub_253DF18E0();
  unint64_t v19 = (uint64_t *)&v16[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientApplicationIdentifier];
  *unint64_t v19 = v18;
  v19[1] = v20;
  sub_253DF25C0();
  swift_bridgeObjectRetain();
  sub_253DF2590();
  uint64_t v21 = sub_253DF25A0();
  MEMORY[0x25A26C900](&v44, v21);
  *(void *)&v16[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_queryDecorationCollector] = sub_253DF2580();
  sub_253CD989C();
  uint64_t v22 = (void *)sub_253DF5260();
  unint64_t v23 = a2;
  id v24 = objc_msgSend(a2, sel_valueForEntitlement_, v22);

  if (v24)
  {
    sub_253DF5860();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v45, 0, 32);
  }
  sub_253DD0C5C((uint64_t)v45, (uint64_t)v46);
  if (v46[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v25 = sub_253DF0220();
      unint64_t v26 = (uint64_t *)&v16[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientGroupIdentifier];
      *unint64_t v26 = v25;
      v26[1] = v27;
      goto LABEL_16;
    }
    uint64_t v38 = ObjectType;
  }
  else
  {
    uint64_t v38 = ObjectType;
    sub_253C1CDD4((uint64_t)v46, &qword_26B2519F8);
  }
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  sub_253BEFD38();
  v28();
  uint64_t v29 = sub_253DF2490();
  os_log_type_t v30 = sub_253DF5700();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)sub_253C0FFB0();
    v46[0] = sub_253C0FF74();
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v32 = sub_253DF18E0();
    if (v33)
    {
      unint64_t v34 = v33;
    }
    else
    {
      uint64_t v32 = 0x6E776F6E6B6E75;
      unint64_t v34 = 0xE700000000000000;
    }
    *(void *)&v45[0] = sub_253D8E5FC(v32, v34, v46);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v42);
    _os_log_impl(&dword_253BD8000, v29, v30, "QueryDecorationXPCServiceServer: client %s is missing group-identifier entitlement, setting clientGroupIdentifier to nil.", v31, 0xCu);
    swift_arrayDestroy();
    unint64_t v23 = a2;
    sub_253BDF910();
    sub_253BDF910();

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v14, v40);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v42);

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v14, v40);
  }
  ObjectType = v38;
  uint64_t v35 = &v16[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientGroupIdentifier];
  *(void *)uint64_t v35 = 0;
  *((void *)v35 + 1) = 0;
LABEL_16:

  v43.receiver = v16;
  v43.super_class = ObjectType;
  id v36 = objc_msgSendSuper2(&v43, sel_init);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v41, v42);
  return v36;
}

uint64_t sub_253DCC57C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_253DF24A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  uint64_t v6 = sub_253DF2490();
  os_log_type_t v7 = sub_253DF5700();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_253BD8000, v6, v7, "QueryDecorationXPCServiceServer received SIGTERM.", v8, 2u);
    MEMORY[0x25A2709B0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = *MEMORY[0x263F61850];
  uint64_t v10 = sub_253DF1830();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(a1, v9, v10);
}

uint64_t sub_253DCC708(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_253DF5500();
  sub_253C0FF8C((uint64_t)v11, v13, v14, v12);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v4;
  void v16[3] = a1;
  v16[4] = a2;
  swift_retain();
  id v17 = v4;
  sub_253D75DE0(a1, a2);
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  return sub_253C1CDD4((uint64_t)v11, (uint64_t *)&unk_26B2519E0);
}

uint64_t sub_253DCC864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a3;
  v4[12] = a4;
  v4[9] = a1;
  v4[10] = a2;
  sub_253BDEDD8(&qword_26B255458);
  v4[13] = swift_task_alloc();
  sub_253BDEDD8(&qword_269D7ECA8);
  v4[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DCC92C, 0, 0);
}

uint64_t sub_253DCC92C()
{
  sub_253DD123C();
  sub_253C10364();
  sub_253DF16C0();
  sub_253DD0F80(&qword_269D7ECB0, 255, MEMORY[0x263F4E690]);
  sub_253DEFC00();
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v1 = *(void *)(v0 + 112);
  *(void *)(v0 + 120) = *(void *)(v0 + 56);
  uint64_t v3 = sub_253DF16E0();
  sub_253C0FF8C(v1, v4, v5, v3);
  uint64_t v6 = sub_253DF14C0();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  sub_253C0FF8C(v2, v7, v8, v6);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_253DCCAE8;
  sub_253DD115C();
  return MEMORY[0x270F3F4F8](v10, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_253DCCAE8()
{
  sub_253DD123C();
  sub_253C10364();
  sub_253C0F84C();
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v2;
  sub_253C0FA84();
  *uint64_t v6 = v5;
  uint64_t v8 = v7 + 16;
  *(void *)(v7 + 136) = v9;
  *(void *)(v7 + 144) = v0;
  swift_task_dealloc();
  uint64_t v10 = *(void *)(v1 + 112);
  sub_253C1CDD4(*(void *)(v1 + 104), &qword_26B255458);
  sub_253C1CDD4(v8, &qword_269D7ECD0);
  sub_253C1CDD4(v10, &qword_269D7ECA8);
  sub_253BEFBAC();
  sub_253DD115C();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_253DCCC30()
{
  v0[8] = v0[17];
  uint64_t v1 = v0[18];
  sub_253DF16D0();
  sub_253DD0F80(&qword_269D7ECD8, 255, MEMORY[0x263F4E6E8]);
  uint64_t v2 = sub_253DEFC30();
  uint64_t v4 = (void *)v0[17];
  uint64_t v5 = (void *)v0[15];
  if (v1)
  {

    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DD1170();
  }
  else
  {
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v9 = (uint64_t *)v0[9];

    *uint64_t v9 = v7;
    v9[1] = v8;
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253C0FDF8();
  }
  return v6();
}

uint64_t sub_253DCCD68()
{
  sub_253BDF928();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v1();
}

uint64_t sub_253DCCEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a3;
  v6[12] = a4;
  v6[9] = a1;
  v6[10] = a2;
  sub_253BDEDD8(&qword_26B255458);
  v6[15] = swift_task_alloc();
  sub_253BDEDD8(&qword_269D7ECA8);
  v6[16] = swift_task_alloc();
  v6[17] = sub_253DF14C0();
  v6[18] = swift_task_alloc();
  uint64_t v7 = sub_253DEFE90();
  v6[19] = v7;
  v6[20] = *(void *)(v7 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DCD014, 0, 0);
}

uint64_t sub_253DCD014()
{
  sub_253DF16C0();
  sub_253DD0F80(&qword_269D7ECB0, 255, MEMORY[0x263F4E690]);
  sub_253DEFC00();
  v0[23] = v0[7];
  sub_253DD0F80(&qword_269D7D708, 255, MEMORY[0x263F07508]);
  sub_253DD1214();
  uint64_t v1 = v0[21];
  sub_253BEFD38();
  v2();
  MEMORY[0x25A26B7F0](v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[24] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_253DCD230;
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[16];
  return sub_253DCD788(v5, v4);
}

uint64_t sub_253DCD230()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v1 = *v0;
  sub_253C0FA84();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DCD2FC()
{
  sub_253BDF928();
  sub_253DD1124();
  sub_253C0FF8C(v2, v3, v4, v5);
  uint64_t v6 = (void *)swift_task_alloc();
  v1[25] = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_253DCD3BC;
  uint64_t v10 = v1[23];
  uint64_t v12 = v1[15];
  uint64_t v11 = v1[16];
  return MEMORY[0x270F3F4F8](v10, 0, v11, v0, v12, v7, v8, v9);
}

uint64_t sub_253DCD3BC()
{
  sub_253BDF8D0();
  sub_253C0F84C();
  sub_253C0FA84();
  *uint64_t v4 = v3;
  uint64_t v5 = *v2;
  sub_253C0FA84();
  *uint64_t v6 = v5;
  uint64_t v8 = v7 + 16;
  *(void *)(v7 + 208) = v9;
  *(void *)(v7 + 216) = v0;
  swift_task_dealloc();
  sub_253C1CDD4(*(void *)(v1 + 120), &qword_26B255458);
  sub_253C1CDD4(v8, &qword_269D7ECD0);
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v10, v11, v12);
}

uint64_t sub_253DCD4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_253C0FFE0();
  v14[8] = v14[26];
  uint64_t v15 = v14[27];
  sub_253DF16D0();
  sub_253DD0F80(&qword_269D7ECD8, 255, MEMORY[0x263F4E6E8]);
  uint64_t v16 = sub_253DEFC30();
  uint64_t v18 = (void *)v14[26];
  uint64_t v20 = v14[22];
  uint64_t v19 = (void *)v14[23];
  if (v15)
  {
    uint64_t v21 = v14[19];
    uint64_t v22 = v14[20];
    uint64_t v23 = v14[18];
    uint64_t v24 = v14[16];

    sub_253C1CDD4(v24, &qword_269D7ECA8);
    sub_253DD0FC8(v23);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DD1170();
  }
  else
  {
    uint64_t v25 = v16;
    uint64_t v26 = v17;
    uint64_t v27 = v14[20];
    uint64_t v29 = v14[18];
    uint64_t v28 = v14[19];
    uint64_t v30 = v14[16];
    a9 = v14[21];
    a10 = v14[15];
    uint64_t v31 = (uint64_t *)v14[9];

    sub_253C1CDD4(v30, &qword_269D7ECA8);
    sub_253DD0FC8(v29);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v20, v28);

    uint64_t *v31 = v25;
    v31[1] = v26;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253C0FDF8();
  }
  sub_253C0FEA8();
  return v33(v32, v33, v34, v35, v36, v37, v38, v39, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_253DCD6B8()
{
  sub_253DD123C();
  sub_253C10364();
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v0 + 128);

  sub_253C1CDD4(v5, &qword_269D7ECA8);
  sub_253DD0FC8(v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  sub_253DD115C();
  return v7(v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_253DCD788(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  sub_253DF14C0();
  v3[8] = swift_task_alloc();
  uint64_t v4 = sub_253DF24A0();
  v3[9] = v4;
  v3[10] = *(void *)(v4 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  uint64_t v5 = sub_253DF3E70();
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DCD8F4, 0, 0);
}

uint64_t sub_253DCD8F4()
{
  uint64_t v30 = v0;
  uint64_t v4 = (char *)v0[7];
  uint64_t v5 = &v4[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientGroupIdentifier];
  v0[17] = *(void *)&v4[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientGroupIdentifier];
  uint64_t v6 = *((void *)v5 + 1);
  v0[18] = v6;
  if (!v6)
  {
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    uint64_t v11 = v4;
    uint64_t v12 = sub_253DF2490();
    os_log_type_t v13 = sub_253DF56E0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = v0[7];
      uint64_t v15 = (uint8_t *)sub_253C0FFB0();
      uint64_t v29 = sub_253C0FF74();
      *(_DWORD *)uint64_t v15 = 136315138;
      if (*(void *)(v14
                     + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientApplicationIdentifier
                     + 8))
      {
        uint64_t v3 = *(void *)(v14
                       + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientApplicationIdentifier);
        unint64_t v2 = *(void *)(v14
                       + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientApplicationIdentifier
                       + 8);
      }
      else
      {
        sub_253DD1284();
      }
      uint64_t v19 = v0[10];
      uint64_t v27 = v0[9];
      uint64_t v28 = v0[11];
      uint64_t v20 = (void *)v0[7];
      swift_bridgeObjectRetain();
      v0[2] = sub_253D8E5FC(v3, v2, &v29);
      sub_253DF5820();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_253BD8000, v12, v13, "QueryDecorationXPCServiceServer: client %s is missing group-identifier entitlement, no QueryDecorationLookback can be found as seurity policy check can't be completed without a group identifier.", v15, 0xCu);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      uint64_t v1 = v19 + 8;
      v21(v28, v27);
    }
    else
    {
      uint64_t v16 = (void *)v0[7];

      uint64_t v17 = sub_253DD129C();
      v18(v17);
    }
    uint64_t v22 = sub_253DD1198();
    sub_253DD12CC(v1, 1, v23, v22);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253BDF8DC();
    sub_253BEFC34();
    __asm { BRAA            X1, X16 }
  }
  if (qword_26B251C80 != -1) {
    swift_once();
  }
  v0[19] = qword_26B257560;
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DD0F80(&qword_26B255AC0, 255, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DF5480();
  sub_253BEFC34();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_253DCDC18()
{
  sub_253BDF8D0();
  uint64_t v1 = sub_253DB0EF8(*(void *)(v0 + 48), *(void *)(v0 + 136), *(void *)(v0 + 144), (unsigned char *)(v0 + 168));
  *(void *)(v0 + 160) = v1;
  return MEMORY[0x270FA2498](sub_253DCDE84, v1, 0);
}

uint64_t sub_253DCDCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  sub_253C0FFE0();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  uint64_t v25 = v22[8];
  uint64_t v26 = v22[6];
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  sub_253BDF458(v26, v25);
  uint64_t v27 = sub_253DF2490();
  os_log_type_t v28 = sub_253DF56C0();
  uint64_t v29 = v28;
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v30 = v22[10];
    a9 = v22[9];
    a10 = v22[12];
    uint64_t v31 = v22[8];
    uint64_t v32 = (uint8_t *)sub_253C0FFB0();
    a11 = sub_253C0FF74();
    *(_DWORD *)uint64_t v32 = 136315138;
    uint64_t v33 = sub_253DEFE40();
    v22[3] = sub_253D8E5FC(v33, v34, &a11);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    sub_253DD0FC8(v31);
    _os_log_impl(&dword_253BD8000, v27, (os_log_type_t)v29, "QueryDecorationXPCServiceServer: could not find observable session transcript with SessionID: %s.", v32, 0xCu);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(a10, a9);
  }
  else
  {
    uint64_t v35 = v22[12];
    uint64_t v36 = v22[9];
    uint64_t v37 = v22[10];
    sub_253DD0FC8(v22[8]);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v36);
  }
  uint64_t v38 = sub_253DD1198();
  sub_253DD12CC(v29, 1, v39, v38);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  sub_253C0FEA8();
  return v41(v40, v41, v42, v43, v44, v45, v46, v47, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_253DCDE84()
{
  sub_253BDF928();
  sub_253DCBF24();
  swift_release();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_253DCDEF0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v4 = sub_253DD1180();
  v5(v4);
  v0[4] = sub_253DF3E40();
  uint64_t v6 = sub_253BDEDD8(&qword_269D7BBF8);
  sub_253DD0E10();
  sub_253DF3930();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v7 = sub_253DD1198();
  sub_253DD12CC(v6, 0, v8, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v9();
}

uint64_t sub_253DCE14C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v27[0] = a9;
  v27[1] = a10;
  uint64_t v17 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_253DF5500();
  sub_253C0FF8C((uint64_t)v19, v21, v22, v20);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = a5;
  *(void *)(v23 + 24) = a6;
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v10;
  v24[3] = a1;
  v24[4] = a2;
  v24[5] = a3;
  v24[6] = a4;
  swift_retain();
  id v25 = v10;
  sub_253D75DE0(a1, a2);
  sub_253D75DE0(a3, a4);
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  return sub_253C1CDD4((uint64_t)v19, (uint64_t *)&unk_26B2519E0);
}

uint64_t sub_253DCE2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[16] = a5;
  v6[17] = a6;
  v6[14] = a3;
  v6[15] = a4;
  v6[12] = a1;
  v6[13] = a2;
  uint64_t v7 = sub_253DF3E70();
  v6[18] = v7;
  v6[19] = *(void *)(v7 - 8);
  v6[20] = swift_task_alloc();
  sub_253BDEDD8(&qword_269D7ECA8);
  v6[21] = swift_task_alloc();
  uint64_t v8 = sub_253DF42A0();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  sub_253BDEDD8((uint64_t *)&unk_26B256520);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B255458);
  v6[28] = swift_task_alloc();
  uint64_t v9 = sub_253DF24A0();
  v6[29] = v9;
  v6[30] = *(void *)(v9 - 8);
  v6[31] = swift_task_alloc();
  uint64_t v10 = sub_253DF0F90();
  v6[32] = v10;
  v6[33] = *(void *)(v10 - 8);
  v6[34] = swift_task_alloc();
  uint64_t v11 = sub_253DF2400();
  v6[35] = v11;
  v6[36] = *(void *)(v11 - 8);
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  uint64_t v12 = sub_253DF2420();
  v6[39] = v12;
  v6[40] = *(void *)(v12 - 8);
  v6[41] = swift_task_alloc();
  v6[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DCE618, 0, 0);
}

uint64_t sub_253DCE618()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[39];
  uint64_t v3 = v0[40];
  sub_253DF15E0();
  sub_253DF2910();
  sub_253DF28F0();
  unint64_t v4 = sub_253DF2900();
  char v6 = v5;
  swift_release();
  sub_253DF15E0();
  sub_253DF2410();
  sub_253DF23D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v1, v2);
  uint64_t v8 = sub_253DF2410();
  os_signpost_type_t v9 = sub_253DF5790();
  uint64_t result = sub_253DF5800();
  if (result)
  {
    if ((v6 & 1) == 0)
    {
      if (v4)
      {
LABEL_9:
        uint64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v11 = 0;
        os_signpost_id_t v12 = sub_253DF23E0();
        _os_signpost_emit_with_name_impl(&dword_253BD8000, v8, v9, v12, (const char *)v4, "", v11, 2u);
        sub_253BDF910();
        goto LABEL_10;
      }
      __break(1u);
    }
    if (HIDWORD(v4))
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 11 == 27)
      {
LABEL_15:
        __break(1u);
        return result;
      }
      if (WORD1(v4) <= 0x10u)
      {
        unint64_t v4 = (unint64_t)(v0 + 11);
        goto LABEL_9;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_10:

  uint64_t v13 = v0[42];
  uint64_t v14 = v7;
  uint64_t v16 = v0[38];
  uint64_t v15 = v0[39];
  uint64_t v17 = v0[36];
  uint64_t v18 = v0[35];
  sub_253BEFD38();
  v19();
  sub_253DF2470();
  sub_253C520A4();
  v0[43] = sub_253DF2460();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  v14(v13, v15);
  sub_253DF16C0();
  sub_253DD0F80(&qword_269D7ECB0, 255, MEMORY[0x263F4E690]);
  sub_253DEFC00();
  v0[44] = v0[7];
  sub_253DD0F80(&qword_269D7ECB8, 255, MEMORY[0x263F4CAE0]);
  sub_253DD1214();
  uint64_t v20 = (void *)swift_task_alloc();
  v0[45] = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_253DCEA10;
  sub_253C10C94();
  return sub_253DCFE40(v21);
}

uint64_t sub_253DCEA10()
{
  sub_253BDF8D0();
  uint64_t v3 = v2;
  sub_253BDF7C8();
  uint64_t v5 = v4;
  sub_253C0FA84();
  *char v6 = v5;
  uint64_t v7 = *v1;
  sub_253C0FA84();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (v0) {

  }
  else {
    *(void *)(v5 + 368) = v3;
  }
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_253DCEB08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22)
{
  sub_253C0FFE0();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  uint64_t v25 = v22[46];
  if (!v25)
  {
    sub_253DF1720();
    uint64_t v26 = sub_253DF2490();
    os_log_type_t v27 = sub_253DF56E0();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v29 = v22[30];
    uint64_t v30 = v22[31];
    uint64_t v31 = v22[29];
    if (v28)
    {
      uint64_t v39 = v22[31];
      uint64_t v32 = (uint8_t *)sub_253C0FFB0();
      a11 = sub_253C0FF74();
      *(_DWORD *)uint64_t v32 = 136315138;
      sub_253CD989C();
      v22[10] = sub_253D8E5FC(0xD000000000000047, v33, &a11);
      sub_253DF5820();
      _os_log_impl(&dword_253BD8000, v26, v27, "%s unable to get session from crossAPIAssociationKey", v32, 0xCu);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v39, v31);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
    }
  }
  v22[47] = v25;
  unint64_t v34 = (void *)swift_task_alloc();
  v22[48] = v34;
  *unint64_t v34 = v22;
  v34[1] = sub_253DCECD0;
  sub_253C0FEA8();
  return sub_253DD0360(v35, v36);
}

uint64_t sub_253DCECD0()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v1 = *v0;
  sub_253C0FA84();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DCED9C()
{
  sub_253DD123C();
  sub_253C10364();
  if (v0[47]) {
    goto LABEL_6;
  }
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[22];
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v3, 1, 1, v4);
  sub_253DD0DA8(v3, v2);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v2, 1, v4) == 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = sub_253DD1180();
    v7(v6);
    sub_253DF2780();
    uint64_t v8 = sub_253DD11BC();
    v9(v8);
    uint64_t v5 = v1;
    sub_253DF2770();
    uint64_t v10 = sub_253DD12B4();
    v11(v10);
  }
  v0[49] = v5;
  if (v0[47])
  {
LABEL_6:
    swift_retain();
    sub_253DD115C();
    return MEMORY[0x270FA2498](v12, v13, v14);
  }
  else
  {
    uint64_t v16 = sub_253DD1268();
    sub_253C0FF8C(0, v17, v18, v16);
    sub_253DD1124();
    uint64_t v19 = (void *)swift_task_alloc();
    v0[50] = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_253DCF2FC;
    sub_253DD113C();
    sub_253DD115C();
    return MEMORY[0x270F3F4F8](v20, v21, v22, v23, v24, v25, v26, v27);
  }
}

uint64_t sub_253DCEF44()
{
  sub_253DD123C();
  sub_253C10364();
  uint64_t v1 = v0[47];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[23];
  uint64_t v5 = *(void *)(*(void *)v1 + 192);
  uint64_t v6 = _s24StandardSessionResourcesVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1 + *(int *)(v6 + 28) + v5, v3);
  swift_release();
  sub_253BEFBAC();
  sub_253DD115C();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_253DCEFF8()
{
  sub_253DD123C();
  sub_253C10364();
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[22];
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v3, 0, 1, v4);
  sub_253DD0DA8(v3, v2);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v2, 1, v4) == 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = sub_253DD1180();
    v7(v6);
    sub_253DF2780();
    uint64_t v8 = sub_253DD11BC();
    v9(v8);
    uint64_t v5 = v1;
    sub_253DF2770();
    uint64_t v10 = sub_253DD12B4();
    v11(v10);
  }
  v0[49] = v5;
  if (v0[47])
  {
    swift_retain();
    sub_253DD115C();
    return MEMORY[0x270FA2498](v12, v13, v14);
  }
  else
  {
    uint64_t v16 = sub_253DD1268();
    sub_253C0FF8C(0, v17, v18, v16);
    sub_253DD1124();
    uint64_t v19 = (void *)swift_task_alloc();
    v0[50] = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_253DCF2FC;
    sub_253DD113C();
    sub_253DD115C();
    return MEMORY[0x270F3F4F8](v20, v21, v22, v23, v24, v25, v26, v27);
  }
}

uint64_t sub_253DCF188()
{
  sub_253BDF928();
  sub_253DCBF24();
  swift_release();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_253DCF1F4()
{
  sub_253DD123C();
  sub_253C10364();
  uint64_t v1 = sub_253DF3E40();
  uint64_t v2 = sub_253DD1250();
  v3(v2);
  *(void *)(v0 + 72) = v1;
  sub_253BDEDD8(&qword_269D7BBF8);
  sub_253DD0E10();
  sub_253DF3930();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_253DD1268();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v0 + 72, 0, 1, v4);
  sub_253DD1124();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 400) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_253DCF2FC;
  sub_253DD113C();
  sub_253DD115C();
  return MEMORY[0x270F3F4F8](v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_253DCF2FC()
{
  sub_253BDF928();
  sub_253BDF7C8();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  uint64_t v4 = v2 + 16;
  *(void *)(v2 + 408) = v5;
  *(void *)(v2 + 416) = v0;
  swift_task_dealloc();
  sub_253C1CDD4(v4, &qword_269D7ECD0);
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_253DCF3F4()
{
  v0[8] = v0[51];
  uint64_t v1 = v0[52];
  sub_253DF16D0();
  sub_253DD0F80(&qword_269D7ECD8, 255, MEMORY[0x263F4E6E8]);
  uint64_t v2 = sub_253DEFC30();
  uint64_t v4 = (void *)v0[51];
  uint64_t v5 = (void *)v0[44];
  if (v1)
  {
    uint64_t v7 = v0[33];
    uint64_t v6 = v0[34];
    uint64_t v8 = v0[32];
    uint64_t v10 = v0[27];
    uint64_t v9 = v0[28];
    uint64_t v11 = v0[21];

    swift_release();
    swift_release();
    sub_253C1CDD4(v11, &qword_269D7ECA8);
    sub_253C1CDD4(v10, (uint64_t *)&unk_26B256520);
    sub_253C1CDD4(v9, &qword_26B255458);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);

    uint64_t v12 = v0[43];
    sub_253DD11E0();
    sub_253DCFAD4(v12);
    swift_release();
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
    sub_253BDF8DC();
  }
  else
  {
    uint64_t v14 = v2;
    uint64_t v15 = v3;
    uint64_t v24 = v0[43];
    uint64_t v16 = v0[33];
    uint64_t v22 = v0[32];
    uint64_t v23 = v0[34];
    uint64_t v17 = v0[27];
    uint64_t v21 = v0[28];
    uint64_t v18 = v0[21];
    uint64_t v19 = (uint64_t *)v0[12];

    swift_release();
    swift_release();
    sub_253C1CDD4(v18, &qword_269D7ECA8);
    sub_253C1CDD4(v17, (uint64_t *)&unk_26B256520);
    sub_253C1CDD4(v21, &qword_26B255458);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v23, v22);

    *uint64_t v19 = v14;
    v19[1] = v15;
    sub_253DCFAD4(v24);
    swift_release();
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
    sub_253C0FDF8();
  }
  return v13();
}

uint64_t sub_253DCF760()
{
  uint64_t v15 = v0;
  sub_253DF1720();
  uint64_t v1 = sub_253DF2490();
  os_log_type_t v2 = sub_253DF56E0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v4 = v0[30];
    uint64_t v3 = v0[31];
    uint64_t v5 = v0[29];
    uint64_t v6 = (uint8_t *)sub_253C0FFB0();
    uint64_t v14 = sub_253C0FF74();
    *(_DWORD *)uint64_t v6 = 136315138;
    sub_253CD989C();
    v0[10] = sub_253D8E5FC(0xD000000000000047, v7, &v14);
    sub_253DF5820();
    _os_log_impl(&dword_253BD8000, v1, v2, "%s unable to get session from crossAPIAssociationKey", v6, 0xCu);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    uint64_t v9 = v0[30];
    uint64_t v8 = v0[31];
    uint64_t v10 = v0[29];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  v0[47] = 0;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[48] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_253DCECD0;
  uint64_t v12 = v0[28];
  return sub_253DD0360(v12, 0);
}

void sub_253DCF948()
{
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v6 = *(void *)(v0 + 168);

  swift_release();
  swift_release();
  sub_253C1CDD4(v6, &qword_269D7ECA8);
  sub_253C1CDD4(v5, (uint64_t *)&unk_26B256520);
  sub_253C1CDD4(v4, &qword_26B255458);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = *(void *)(v0 + 344);
  sub_253DD11E0();
  sub_253DCFAD4(v7);
  swift_release();
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
  sub_253BDF8DC();
  sub_253C10C94();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_253DCFAD4(uint64_t a1)
{
  uint64_t v2 = sub_253DF2430();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v32 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_253DF2400();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_253DF2420();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253DF15E0();
  sub_253DF2910();
  sub_253DF28F0();
  unint64_t v12 = sub_253DF2900();
  char v14 = v13;
  swift_release();
  uint64_t v15 = sub_253DF2410();
  uint64_t v29 = a1;
  uint64_t v16 = v15;
  sub_253DF2440();
  int v28 = sub_253DF5780();
  uint64_t result = sub_253DF5800();
  if ((result & 1) == 0)
  {
LABEL_13:

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v25 = v9;
  uint64_t v26 = v5;
  uint64_t v27 = v4;
  if ((v14 & 1) == 0)
  {
    uint64_t v18 = v32;
    if (v12)
    {
LABEL_9:
      swift_retain();
      sub_253DF2480();
      swift_release();
      uint64_t v20 = v30;
      uint64_t v19 = v31;
      if ((*(unsigned int (**)(char *, uint64_t))(v30 + 88))(v18, v31) == *MEMORY[0x263F90238])
      {
        uint64_t v21 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v19);
        uint64_t v21 = "";
      }
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      os_signpost_id_t v23 = sub_253DF23E0();
      _os_signpost_emit_with_name_impl(&dword_253BD8000, v16, (os_signpost_type_t)v28, v23, (const char *)v12, v21, v22, 2u);
      MEMORY[0x25A2709B0](v22, -1, -1);
      uint64_t v5 = v26;
      uint64_t v4 = v27;
      uint64_t v9 = v25;
      goto LABEL_13;
    }
    __break(1u);
  }
  uint64_t v18 = v32;
  if (HIDWORD(v12))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v12 >> 11 != 27)
  {
    if (WORD1(v12) <= 0x10u)
    {
      unint64_t v12 = (unint64_t)&v33;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_253DCFE40(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_253DF24A0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DCFF00, 0, 0);
}

uint64_t sub_253DCFF00()
{
  uint64_t v26 = v0;
  uint64_t v3 = (char *)v0[4];
  uint64_t v4 = &v3[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientGroupIdentifier];
  v0[8] = *(void *)&v3[OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientGroupIdentifier];
  uint64_t v5 = *((void *)v4 + 1);
  v0[9] = v5;
  if (!v5)
  {
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    uint64_t v10 = v3;
    uint64_t v11 = sub_253DF2490();
    os_log_type_t v12 = sub_253DF56E0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = v0[4];
      char v14 = (uint8_t *)sub_253C0FFB0();
      uint64_t v25 = sub_253C0FF74();
      *(_DWORD *)char v14 = 136315138;
      if (*(void *)(v13
                     + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientApplicationIdentifier
                     + 8))
      {
        uint64_t v2 = *(void *)(v13
                       + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientApplicationIdentifier);
        unint64_t v1 = *(void *)(v13
                       + OBJC_IVAR____TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server_clientApplicationIdentifier
                       + 8);
      }
      else
      {
        sub_253DD1284();
      }
      uint64_t v18 = v0[6];
      uint64_t v24 = v0[7];
      uint64_t v19 = (void *)v0[4];
      uint64_t v23 = v0[5];
      swift_bridgeObjectRetain();
      v0[2] = sub_253D8E5FC(v2, v1, &v25);
      sub_253DF5820();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_253BD8000, v11, v12, "QueryDecorationXPCServiceServer: client %s is missing group-identifier entitlement, no QueryDecorationLookback can be found as seurity policy check can't be completed without a group identifier.", v14, 0xCu);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v24, v23);
    }
    else
    {
      uint64_t v15 = (void *)v0[4];

      uint64_t v16 = sub_253DD129C();
      v17(v16);
    }
    swift_task_dealloc();
    sub_253BEFC34();
    __asm { BRAA            X2, X16 }
  }
  if (qword_26B251C80 != -1) {
    swift_once();
  }
  v0[10] = qword_26B257560;
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DD0F80(&qword_26B255AC0, 255, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DF5480();
  sub_253BEFC34();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

#error "253DD0240: call analysis failed (funcsize=54)"

uint64_t sub_253DD02D0()
{
  sub_253BDF8D0();
  char v1 = *(unsigned char *)(v0 + 89);
  sub_253D2BEB4();
  swift_allocError();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_253BDF8DC();
  return v3();
}

uint64_t sub_253DD0360(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_253DF3E70();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2519D0);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_253DEFE90();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD04BC, 0, 0);
}

uint64_t sub_253DD04BC()
{
  sub_253DD123C();
  sub_253C10364();
  if (v0[3])
  {
    sub_253DD115C();
    return MEMORY[0x270FA2498](v2, v3, v4);
  }
  else
  {
    sub_253C0FF8C(v0[7], 0, v1, v0[8]);
    sub_253C1CDD4(v0[7], &qword_26B2519D0);
    uint64_t v6 = v0[2];
    uint64_t v7 = sub_253DF14C0();
    sub_253DD12CC(v6, 1, v8, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253BDF8DC();
    sub_253DD115C();
    return v10(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

uint64_t sub_253DD05A8()
{
  sub_253BDF928();
  sub_253DCBF24();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_253DD060C()
{
  sub_253C10364();
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[4];
  sub_253DF3E60();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v2, 0, 1, v1);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v2, 1, v1) == 1)
  {
    sub_253C1CDD4(v0[7], &qword_26B2519D0);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = v0[10];
    (*(void (**)(void, void, void))(v0[9] + 32))(v0[11], v0[7], v0[8]);
    sub_253BEFD38();
    v8();
    MEMORY[0x25A26B7F0](v7);
    uint64_t v9 = sub_253DD1250();
    v10(v9);
    uint64_t v6 = 0;
  }
  uint64_t v11 = v0[2];
  uint64_t v12 = sub_253DF14C0();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v11, v6, 1, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v13();
}

id sub_253DD0974@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id result = sub_253DCC044(a1, a2);
  *a3 = result;
  return result;
}

uint64_t type metadata accessor for QueryDecorationXPCServiceServer()
{
  return self;
}

uint64_t type metadata accessor for QueryDecorationXPCServiceServer.Server()
{
  return self;
}

uint64_t sub_253DD09E4(uint64_t a1, uint64_t a2)
{
  return sub_253DD0F80(&qword_26B255D90, a2, (void (*)(uint64_t))type metadata accessor for QueryDecorationXPCServiceServer.Server);
}

uint64_t sub_253DD0A2C()
{
  return sub_253DD0F80(&qword_26B2562E8, 255, MEMORY[0x263F4CBB0]);
}

uint64_t sub_253DD0A78()
{
  swift_beginAccess();
  uint64_t v0 = qword_26B2576C0;
  id v1 = (id)qword_26B2576C0;
  return v0;
}

void sub_253DD0AC4(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26B2576C0;
  qword_26B2576C0 = a1;
}

uint64_t (*sub_253DD0B14())()
{
  return j_j__swift_endAccess_0;
}

uint64_t sub_253DD0B6C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_253DD0BB4(uint64_t a1)
{
  qword_26B2576B8 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_253DD0C04())()
{
  return j__swift_endAccess_0;
}

uint64_t sub_253DD0C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253BDEDD8(&qword_26B2519F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_253DD0CC4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_253DD0CFC(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

uint64_t sub_253DD0D04(void *a1, uint64_t a2)
{
  return sub_253DED178(a1, a2, *(uint64_t (**)(void, void, uint64_t))(v2 + 16));
}

uint64_t sub_253DD0D10()
{
  sub_253C10364();
  sub_253DD12F8();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)sub_253BDF880(v0);
  *id v1 = v2;
  v1[1] = sub_253C12DD8;
  uint64_t v3 = sub_253DD11F4();
  return sub_253DCE2B4(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_253DD0DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253BDEDD8((uint64_t *)&unk_26B256520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_253DD0E10()
{
  unint64_t result = qword_269D7BC00;
  if (!qword_269D7BC00)
  {
    sub_253C0BFF8(&qword_269D7BBF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7BC00);
  }
  return result;
}

uint64_t sub_253DD0E64()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253DD0EA0()
{
  sub_253D75D88(*(void *)(v0 + 24), *(void *)(v0 + 32));
  sub_253D75D88(*(void *)(v0 + 40), *(void *)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_253DD0EE8()
{
  sub_253C10364();
  sub_253DD12F8();
  uint64_t v0 = swift_task_alloc();
  id v1 = (void *)sub_253BDF880(v0);
  *id v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253DD11F4();
  return sub_253DCCEAC(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_253DD0F80(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_253DD0FC8(uint64_t a1)
{
  uint64_t v2 = sub_253DF14C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_253DD1024()
{
  sub_253D75D88(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_253DD1064()
{
  sub_253BDF8D0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_253BDF880(v6);
  void *v7 = v8;
  v7[1] = sub_253C169DC;
  return sub_253DCC864(v2, v3, v4, v5);
}

double sub_253DD1124()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t sub_253DD113C()
{
  return *(void *)(v0 + 352);
}

uint64_t sub_253DD1170()
{
  return v0 + 8;
}

uint64_t sub_253DD1180()
{
  return v0;
}

uint64_t sub_253DD1198()
{
  return sub_253DF16E0();
}

uint64_t sub_253DD11BC()
{
  return v0;
}

uint64_t sub_253DD11F4()
{
  return v0;
}

uint64_t sub_253DD1214()
{
  return sub_253DEFC00();
}

uint64_t sub_253DD1250()
{
  return v0;
}

uint64_t sub_253DD1268()
{
  return sub_253DF16E0();
}

uint64_t sub_253DD129C()
{
  return v0;
}

uint64_t sub_253DD12B4()
{
  return v0;
}

uint64_t sub_253DD12CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(a1, a2, 1, a4);
  return swift_task_dealloc();
}

uint64_t sub_253DD130C(unsigned int a1, int a2)
{
  return a2 & a1;
}

uint64_t sub_253DD1314()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientProxy);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (v2)
  {
    type metadata accessor for TransactionHookContainer();
    uint64_t v3 = swift_allocObject();
    swift_retain();
    swift_defaultActor_initialize();
    *(unsigned char *)(v3 + 112) = 0;
    *(void *)(v3 + 120) = v2;
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_transactionHookContainer) = v3;
  return swift_release();
}

uint64_t sub_253DD13B0()
{
  return swift_retain();
}

uint64_t sub_253DD13F4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientProxy);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_retain();
  swift_release();
  sub_253DD1314();
  return swift_release();
}

void sub_253DD1468()
{
  id v1 = objc_allocWithZone(v0);
  sub_253DD14AC();
}

void sub_253DD14AC()
{
  sub_253C1CED0();
  id v2 = v1;
  uint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_253DF08E0();
  uint64_t v7 = sub_253BDF9FC(v6);
  MEMORY[0x270FA5388](v7);
  sub_253C34050();
  uint64_t v103 = v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v104 = (char *)&v100 - v10;
  sub_253DF24A0();
  sub_253C0F830();
  uint64_t v118 = v12;
  uint64_t v119 = v11;
  MEMORY[0x270FA5388](v11);
  sub_253C34050();
  uint64_t v106 = v13;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v100 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v116 = (char *)&v100 - v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v110 = OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientProxy;
  *(void *)&v0[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientProxy] = 0;
  uint64_t v111 = (char *)OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_transactionHookContainer;
  *(void *)&v0[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_transactionHookContainer] = 0;
  uint64_t v20 = OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_jsonDecoder;
  sub_253DEFC20();
  swift_allocObject();
  uint64_t v21 = v0;
  *(void *)&v0[v20] = sub_253DEFC10();
  uint64_t v22 = OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_jsonEncoder;
  sub_253DEFC50();
  swift_allocObject();
  uint64_t v23 = sub_253DEFC40();
  uint64_t v109 = (const char *)v22;
  *(void *)&v21[v22] = v23;
  uint64_t v115 = v4;
  uint64_t v24 = sub_253DF1950();
  uint64_t v117 = v25;
  if (v25)
  {
    uint64_t v26 = v24;
    uint64_t v27 = (void *)sub_253DF5260();
    id v28 = objc_msgSend(v2, sel_valueForEntitlement_, v27);

    uint64_t v113 = v26;
    if (v28)
    {
      sub_253DF5860();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v122 = 0u;
      long long v123 = 0u;
    }
    sub_253C61B78((uint64_t)&v122, (uint64_t)v124, &qword_26B2519F8);
    uint64_t v114 = (objc_class *)ObjectType;
    if (v125)
    {
      if (sub_253DDC2B8())
      {
        uint64_t v102 = sub_253DF0220();
        uint64_t v112 = v29;
        goto LABEL_14;
      }
      unint64_t v105 = (unint64_t)v17;
    }
    else
    {
      unint64_t v105 = (unint64_t)v17;
      sub_253BEFAC0((uint64_t)v124, &qword_26B2519F8);
    }
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    unint64_t v30 = (unint64_t)v117;
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_253DF2490();
    os_log_type_t v32 = sub_253DF56E0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v108 = v21;
      char v33 = (uint8_t *)sub_253C0FFB0();
      uint64_t v34 = sub_253C0FF74();
      unint64_t v101 = (const char *)v20;
      v124[0] = v34;
      *(_DWORD *)char v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_253D8E5FC(v113, v30, v124);
      sub_253DDC4A4(v35);
      uint64_t v21 = v108;
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_253BD8000, v31, v32, "SessionXPCServiceServer: client %s is missing group-identifier entitlement. This will become a hard error in the future.", v33, 0xCu);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_253C0F824();
    v36();
    uint64_t v102 = 0;
    uint64_t v112 = 0;
LABEL_14:
    sub_253DDC36C();
    uint64_t v37 = (void *)sub_253DF5260();
    id v38 = objc_msgSend(v2, sel_valueForEntitlement_, v37);

    if (v38)
    {
      sub_253DF5860();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v122 = 0u;
      long long v123 = 0u;
    }
    unint64_t v39 = (unint64_t)v117;
    sub_253C61B78((uint64_t)&v122, (uint64_t)v124, &qword_26B2519F8);
    if (v125)
    {
      sub_253BDEDD8(&qword_26B256060);
      if (sub_253DDC2B8())
      {
        uint64_t v116 = v120;
        uint64_t v40 = *((void *)v120 + 2);
        id v107 = v2;
        uint64_t v108 = v21;
        if (v40)
        {
          uint64_t v41 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
          uint64_t v42 = MEMORY[0x263F8EE78];
          uint64_t v111 = "strator.features";
          uint64_t v109 = "executable-session";
          unint64_t v110 = 0x8000000253E1B1A0;
          unint64_t v101 = "side-channel-debugging";
          unint64_t v105 = 0x8000000253E1B1C0;
          while (1)
          {
            uint64_t v43 = *(v41 - 1);
            uint64_t v44 = *v41;
            BOOL v45 = v43 == 0x2D72656E6E616C70 && v44 == 0xEC000000796C6E6FLL;
            if (v45 || (sub_253DDC278() & 1) != 0) {
              break;
            }
            sub_253DDC36C();
            if (v43 == v49 && v44 == 0x8000000253E1B180 || (sub_253DDC278() & 1) != 0)
            {
              char v46 = 3;
              goto LABEL_27;
            }
            BOOL v50 = v43 == 0x6E69676775626564 && v44 == 0xE900000000000067;
            if (v50 || (sub_253DDC278() & 1) != 0)
            {
              char v46 = 4;
              goto LABEL_27;
            }
            sub_253DDC36C();
            if (v43 == v51 + 4 && v44 == v110 || (sub_253DDC278() & 1) != 0)
            {
              char v46 = 8;
              goto LABEL_27;
            }
            sub_253DDC36C();
            if (v43 == v52 + 5 && v44 == v105 || (sub_253DDC278() & 1) != 0)
            {
              char v46 = 16;
              goto LABEL_27;
            }
LABEL_32:
            v41 += 2;
            if (!--v40)
            {
              swift_bridgeObjectRelease();
              id v2 = v107;
              uint64_t v21 = v108;
              unint64_t v39 = (unint64_t)v117;
              goto LABEL_59;
            }
          }
          char v46 = 1;
LABEL_27:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_253DC4CE4();
            uint64_t v42 = v53;
          }
          unint64_t v48 = *(void *)(v42 + 16);
          unint64_t v47 = *(void *)(v42 + 24);
          if (v48 >= v47 >> 1)
          {
            sub_253C10D1C(v47);
            sub_253DC4CE4();
            uint64_t v42 = v54;
          }
          *(void *)(v42 + 16) = v48 + 1;
          *(unsigned char *)(v42 + v48 + 32) = v46;
          goto LABEL_32;
        }
        uint64_t v42 = MEMORY[0x263F8EE78];
LABEL_59:
        swift_bridgeObjectRelease();
        uint64_t v62 = *(void *)(v42 + 16);
        if (v62)
        {
          char v63 = 0;
          uint64_t v64 = (char *)(v42 + 32);
          do
          {
            char v65 = *v64++;
            v63 |= v65;
            --v62;
          }
          while (v62);
        }
        else
        {
          char v63 = 0;
        }
        swift_bridgeObjectRelease();
        sub_253DDC36C();
        uint64_t v66 = (void *)sub_253DF5260();
        id v67 = objc_msgSend(v2, sel_valueForEntitlement_, v66);

        if (v67)
        {
          sub_253DF5860();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v122 = 0u;
          long long v123 = 0u;
        }
        sub_253C61B78((uint64_t)&v122, (uint64_t)v124, &qword_26B2519F8);
        if (v125)
        {
          if (sub_253DDC2B8() && (_BYTE)v120) {
            v63 |= 0x10u;
          }
        }
        else
        {
          sub_253BEFAC0((uint64_t)v124, &qword_26B2519F8);
        }
        uint64_t v68 = v113;
        sub_253DF1050();
        char v69 = sub_253DF1980();
        swift_bridgeObjectRelease();
        if (v69 & 1 | ((v63 & 0x10) == 0)) {
          char v70 = v63;
        }
        else {
          char v70 = v63 & 0xEF;
        }
        v21[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientCapabilities] = v70;
        _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
        swift_bridgeObjectRetain_n();
        uint64_t v71 = sub_253DF2490();
        os_log_type_t v72 = sub_253DF56C0();
        if (os_log_type_enabled(v71, v72))
        {
          uint64_t v73 = swift_slowAlloc();
          v124[0] = sub_253C0FF74();
          *(_DWORD *)uint64_t v73 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)&long long v122 = sub_253D8E5FC(v68, v39, v124);
          sub_253DF5820();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v73 + 12) = 256;
          LOBYTE(v122) = v70;
          sub_253DF5820();
          _os_log_impl(&dword_253BD8000, v71, v72, "SessionXPCServiceServer: client %s has entitled capabilities %hhu.", (uint8_t *)v73, 0xFu);
          swift_arrayDestroy();
          sub_253BDF910();
          sub_253BDF910();
        }
        else
        {

          sub_253DDC444();
        }
        char v74 = *(void (**)(void))(v118 + 8);
        sub_253C0F824();
        v74();
        uint64_t v75 = v106;
        sub_253DF0220();
        uint64_t v76 = sub_253DF0B10();
        uint64_t v78 = v77;
        uint64_t v80 = v79;
        uint64_t v82 = v81;
        uint64_t v83 = v108;
        uint64_t v84 = (uint64_t *)&v108[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack];
        *uint64_t v84 = v76;
        v84[1] = v77;
        v84[2] = v79;
        v84[3] = v81;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v85 = sub_253DF2490();
        os_log_type_t v86 = sub_253DF5700();
        if (os_log_type_enabled(v85, v86))
        {
          uint64_t v87 = (uint8_t *)sub_253C0FFB0();
          uint64_t v88 = sub_253C0FF74();
          uint64_t v117 = v74;
          *(_DWORD *)uint64_t v87 = 136315138;
          *(void *)&long long v122 = v88;
          uint64_t v116 = (char *)(v87 + 4);
          v124[0] = v76;
          v124[1] = v78;
          v124[2] = v80;
          uint64_t v125 = v82;
          sub_253DDB138();
          uint64_t v89 = sub_253DF5C40();
          v124[0] = sub_253D8E5FC(v89, v90, (uint64_t *)&v122);
          sub_253DF5820();
          sub_253DDC444();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_253BD8000, v85, v86, "SessionXPCServiceServer Client ID: %s", v87, 0xCu);
          swift_arrayDestroy();
          sub_253BDF910();
          uint64_t v83 = v108;
          sub_253BDF910();

          sub_253C0F824();
          v91();
        }
        else
        {

          sub_253DDC444();
          swift_bridgeObjectRelease_n();
          ((void (*)(uint64_t, uint64_t))v74)(v75, v119);
        }
        uint64_t v92 = v115;
        id v93 = v107;
        uint64_t v94 = v103;
        uint64_t v95 = (uint64_t)v104;
        sub_253DEFE80();
        uint64_t v96 = (uint64_t)&v83[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId];
        sub_253DDBBDC(v95, (uint64_t)&v83[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId], MEMORY[0x263F4C718]);
        uint64_t v97 = v114;
        if (qword_26B251C80 != -1) {
          swift_once();
        }
        uint64_t v98 = qword_26B257560;
        swift_retain();
        sub_253DDBB88(v95, MEMORY[0x263F4C718]);
        sub_253DDBBDC(v96, v94, MEMORY[0x263F4C718]);
        type metadata accessor for ClientSessionManager(0);
        swift_allocObject();
        *(void *)&v83[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionManager] = sub_253D23BB8(v94, v98);

        v121.receiver = v83;
        v121.super_class = v97;
        objc_msgSendSuper2(&v121, sel_init);

        sub_253DF1960();
        sub_253BDF7F0();
        (*(void (**)(uint64_t))(v99 + 8))(v92);
        goto LABEL_85;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_253BEFAC0((uint64_t)v124, &qword_26B2519F8);
    }
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain();
    unint64_t v55 = sub_253DF2490();
    os_log_type_t v56 = sub_253DF56E0();
    if (os_log_type_enabled(v55, v56))
    {
      unint64_t v57 = (uint8_t *)sub_253C0FFB0();
      uint64_t v58 = sub_253C0FF74();
      id v107 = v2;
      v124[0] = v58;
      *(_DWORD *)unint64_t v57 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v59 = sub_253D8E5FC(v113, v39, v124);
      sub_253DDC4A4(v59);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_253BD8000, v55, v56, "SessionXPCServiceServer: client %s is missing the com.apple.intelligenceflow.orchestrator.features entitlement. Rejecting the connection.", v57, 0xCu);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      sub_253DDC444();
    }
    sub_253DF1960();
    sub_253BDF7F0();
    sub_253BEFBCC();
    v60();
    sub_253BEFBCC();
    v61();
    swift_release();
    swift_release();
    swift_release();

    swift_release();
    swift_deallocPartialClassInstance();
LABEL_85:
    sub_253C1CEE8();
    return;
  }
  __break(1u);
}

uint64_t sub_253DD23F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    LODWORD(v2) = 0;
    uint64_t v3 = (unsigned __int8 *)(a1 + 32);
    do
    {
      int v5 = *v3++;
      int v4 = v5;
      if ((v5 & ~v2) == 0) {
        int v4 = 0;
      }
      uint64_t v2 = v4 | v2;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_253DD2444(unsigned int a1, int a2)
{
  return a2 | a1;
}

uint64_t sub_253DD244C(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_253DD245C(unsigned __int8 a1)
{
  char v2 = *v1;
  if ((*v1 & a1) != 0) {
    *uint64_t v1 = v2 & ~a1;
  }
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_253DD248C()
{
  sub_253DDC57C();
  uint64_t v5 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v6 = sub_253BDF9FC(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_253DDC1EC();
  sub_253DDC214(v7);
  uint64_t v8 = sub_253C52058();
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v3;
  uint64_t v9 = (void *)swift_allocObject();
  sub_253DDC548(v9);
  id v10 = v0;
  sub_253D75DE0(v2, v1);
  sub_253DDB360();
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  return sub_253DDC3FC();
}

uint64_t sub_253DD259C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  sub_253DF08E0();
  v4[10] = swift_task_alloc();
  uint64_t v5 = sub_253DF24A0();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v6 = sub_253DF1100();
  v4[14] = v6;
  v4[15] = *(void *)(v6 - 8);
  unsigned char v4[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD26E8, 0, 0);
}

uint64_t sub_253DD26E8()
{
  sub_253C10364();
  uint64_t v1 = *(void *)(v0 + 72);
  sub_253DDBE44(&qword_26B255428, MEMORY[0x263F4CBC0]);
  sub_253DDC234();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DD1170();
    sub_253DD115C();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v4 = *(void *)(v0 + 56);
  *(void *)(v0 + 136) = *(void *)(v4
                                    + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionManager);
  uint64_t v5 = (uint64_t *)(v4 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientProxy);
  sub_253C10220();
  uint64_t v8 = *v5;
  *(void *)(v0 + 144) = *v5;
  if (v8)
  {
    uint64_t v9 = *(void *)(v0 + 56);
    id v10 = (void *)(v9 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack);
    *(void *)(v0 + 152) = *(void *)(v9
                                      + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack);
    *(void *)(v0 + 160) = v10[1];
    *(void *)(v0 + 168) = v10[2];
    *(void *)(v0 + 176) = v10[3];
    *(unsigned char *)(v0 + 208) = *(unsigned char *)(v9
                                    + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientCapabilities);
    uint64_t v11 = qword_26B255AB8;
    swift_retain();
    if (v11 != -1) {
      swift_once();
    }
    *(void *)(v0 + 184) = type metadata accessor for SessionControlActor();
    *(void *)(v0 + 192) = sub_253DDBE44(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
    sub_253DF5480();
    sub_253DB5D44();
    sub_253DB5D74();
    sub_253DD115C();
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v8, v6, v7);
}

uint64_t sub_253DD2904()
{
  sub_253BDF928();
  sub_253D23C54();
  swift_release();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v0, v1, v2);
}

uint64_t sub_253DD2980()
{
  uint64_t v24 = v0;
  if (sub_253DF10F0())
  {
    if ((*(unsigned char *)(v0 + 208) & 8) != 0)
    {
      sub_253DF1050();
      char v1 = sub_253DF1980();
      swift_bridgeObjectRelease();
      if (v1)
      {
        char v2 = 1;
        goto LABEL_9;
      }
    }
    uint64_t v3 = *(void **)(v0 + 56);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    id v4 = v3;
    uint64_t v5 = sub_253DF2490();
    os_log_type_t v6 = sub_253DF56E0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v22 = *(void **)(v0 + 56);
      uint64_t v7 = (uint8_t *)sub_253C0FFB0();
      uint64_t v23 = sub_253C0FF74();
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_253DF0200();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 40) = sub_253D8E5FC(v8, v10, &v23);
      sub_253DF5820();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_253BD8000, v5, v6, "SessionCoordinator (client: %s) requested to be a debugger but does not have the required entitlement or the system security policy does not allow it.", v7, 0xCu);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      sub_253BEFBCC();
      v11();
    }
    else
    {
      uint64_t v13 = *(void *)(v0 + 96);
      uint64_t v12 = *(void *)(v0 + 104);
      uint64_t v14 = *(void *)(v0 + 88);
      uint64_t v15 = *(void **)(v0 + 56);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
  }
  char v2 = 0;
LABEL_9:
  *(unsigned char *)(v0 + 209) = v2;
  if (qword_26B251C80 != -1) {
    swift_once();
  }
  uint64_t v16 = *(void *)(v0 + 80);
  uint64_t v17 = *(void *)(v0 + 56);
  *(void *)(v0 + 200) = qword_26B257560;
  sub_253DDBBDC(v17 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId, v16, MEMORY[0x263F4C718]);
  sub_253DF5480();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v18, v19, v20);
}

uint64_t sub_253DD2C40()
{
  sub_253BDF928();
  uint64_t v1 = *(void *)(v0 + 80);
  sub_253DA99A4();
  sub_253DDBB88(v1, MEMORY[0x263F4C718]);
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_253DD2CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_253DDC3E4();
  sub_253BDFA3C();
  uint64_t v11 = *(uint64_t **)(v10 + 48);
  sub_253DDB360();
  uint64_t v12 = sub_253DDC3CC();
  uint64_t v13 = sub_253DBE410();
  v14(v13);
  *uint64_t v11 = v12;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  sub_253D7BFF4();
  return v16(v15, v16, v17, v18, v19, v20, v21, v22, a9, a10);
}

void sub_253DD2DA4()
{
  sub_253C1CED0();
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v13 = sub_253BDF9FC(v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = sub_253DDC1EC();
  sub_253DDC214(v14);
  uint64_t v15 = (void *)swift_allocObject();
  void v15[2] = v0;
  v15[3] = v7;
  void v15[4] = v5;
  uint64_t v15[5] = v3;
  v15[6] = v11;
  v15[7] = v9;
  id v16 = v0;
  sub_253D75DE0(v7, v5);
  sub_253DEFE90();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  sub_253DF55B0();
  swift_release();
  swift_release();
  sub_253BEFAC0(v1, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DD2EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[37] = a6;
  v7[38] = a7;
  v7[35] = a4;
  v7[36] = a5;
  v7[33] = a2;
  v7[34] = a3;
  v7[32] = a1;
  sub_253DF14C0();
  v7[39] = swift_task_alloc();
  sub_253DF0C70();
  v7[40] = swift_task_alloc();
  v7[41] = swift_task_alloc();
  uint64_t v8 = sub_253DF24A0();
  v7[42] = v8;
  v7[43] = *(void *)(v8 - 8);
  v7[44] = swift_task_alloc();
  v7[45] = swift_task_alloc();
  v7[46] = swift_task_alloc();
  uint64_t v9 = sub_253DF0E70();
  v7[47] = v9;
  v7[48] = *(void *)(v9 - 8);
  v7[49] = swift_task_alloc();
  v7[50] = swift_task_alloc();
  v7[51] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD3088, 0, 0);
}

uint64_t sub_253DD3088()
{
  char v70 = v0;
  uint64_t v1 = (void *)v0[47];
  uint64_t v2 = (void *)v0[35];
  sub_253DDBE44(&qword_26B255400, MEMORY[0x263F4CA48]);
  sub_253DDC234();
  if (v2)
  {
    uint64_t v3 = v2;
    sub_253DDC42C();
    id v4 = v1;
    id v5 = v3;
    id v6 = v4;
    id v7 = v3;
    uint64_t v8 = sub_253DF2490();
    os_log_type_t v9 = sub_253DF56E0();
    int v10 = v9;
    BOOL v11 = os_log_type_enabled(v8, v9);
    uint64_t v12 = v0[43];
    uint64_t v13 = v0[44];
    uint64_t v14 = v0[42];
    uint64_t v15 = (void *)v0[33];
    if (v11)
    {
      uint64_t v68 = v0[42];
      uint64_t v16 = sub_253D7C924();
      uint64_t v65 = sub_253D11A74();
      v69[0] = sub_253C0FF74();
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v67 = v13;
      LODWORD(type) = v10;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_253DF0200();
      unint64_t v19 = v18;
      swift_bridgeObjectRelease();
      v0[30] = sub_253D8E5FC(v17, v19, v69);
      sub_253DF5820();
      swift_bridgeObjectRelease();

      *(_WORD *)(v16 + 12) = 2112;
      id v20 = v3;
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      sub_253DDC568(v21, v22, v23, v24, v25, v26, v27, v28, v54, v55, v56, v57, v58, v59, v60, (uint64_t)(v0 + 30), (uint64_t)v8, type, v65,
        (uint64_t)(v0 + 26));
      sub_253DF5820();
      *uint64_t v66 = v21;

      _os_log_impl(&dword_253BD8000, log, typea, "SessionCoordinator (client: %s) had error: %@", (uint8_t *)v16, 0x16u);
      sub_253BDEDD8(&qword_26B2519F0);
      swift_arrayDestroy();
      sub_253BDF910();
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v67, v68);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
    }
    sub_253DDC508();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v46 = (uint64_t (*)(void))v0[1];
    return v46();
  }
  else
  {
    uint64_t v29 = (void *)v0[36];
    unint64_t v30 = (char *)v0[33];
    uint64_t v31 = &v30[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack];
    uint64_t v32 = *(void *)&v30[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack];
    v0[52] = v32;
    uint64_t v33 = *((void *)v31 + 1);
    v0[53] = v33;
    sub_253DD3FA4(v29, v32, v33, *((void *)v31 + 2), *((void *)v31 + 3));
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    uint64_t v34 = v30;
    uint64_t v35 = sub_253DF2490();
    os_log_type_t v36 = sub_253DF5700();
    uint64_t v37 = v36;
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v61 = v0[43];
      id v38 = (void *)v0[33];
      uint64_t v39 = sub_253D7C924();
      v69[0] = sub_253D779E0();
      *(_DWORD *)uint64_t v39 = 136315394;
      swift_bridgeObjectRetain();
      sub_253C49F34();
      sub_253DF0200();
      swift_bridgeObjectRelease();
      uint64_t v40 = sub_253C49F34();
      v0[29] = sub_253D8E5FC(v40, v41, v42);
      sub_253DF5820();
      swift_bridgeObjectRelease();

      *(_WORD *)(v39 + 12) = 2080;
      sub_253C10220();
      sub_253C102E4();
      v43();
      uint64_t v44 = sub_253DF5290();
      v0[31] = sub_253D8E5FC(v44, v45, v69);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v35, (os_log_type_t)v37, "SessionCoordinator (client: %s) created with config %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v35 = *(NSObject **)(v61 + 8);
      sub_253C0F824();
      ((void (*)(void))v35)();
    }
    else
    {
      unint64_t v48 = (void *)v0[33];

      uint64_t v49 = sub_253DDC4E0();
      ((void (*)(uint64_t))v35)(v49);
    }
    v0[54] = v35;
    uint64_t v50 = v0[33];
    swift_bridgeObjectRetain();
    sub_253DF0220();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_253C49F34();
    MEMORY[0x25A26B3D0](v51);
    v0[55] = *(void *)(v50
                       + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_transactionHookContainer);
    sub_253C10220();
    sub_253C102E4();
    v52();
    swift_retain();
    uint64_t v53 = (void *)swift_task_alloc();
    v0[56] = v53;
    *uint64_t v53 = v0;
    v53[1] = sub_253DD3770;
    return sub_253D25874();
  }
}

uint64_t sub_253DD3770()
{
  sub_253BDFA3C();
  sub_253C0F9D8();
  uint64_t v4 = v3;
  sub_253BDF858();
  *id v5 = v4;
  id v6 = (_OWORD *)(v4 + 16);
  sub_253C102FC();
  void *v7 = *v2;
  *(void *)(v4 + 456) = v1;
  swift_task_dealloc();
  sub_253C102FC();
  uint64_t v8 = *(void *)(v0 + 384);
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  BOOL v11 = (_OWORD *)(v4 + 32);
  if (v1)
  {
    *(void *)(v4 + 480) = v9;
    *(void *)(v4 + 488) = v10;
    sub_253C0F824();
    v12();
    swift_release();
    *(_OWORD *)(v4 + 128) = *v6;
    sub_253DDBB5C(v4 + 128);
    *(_OWORD *)(v4 + 176) = *v11;
    uint64_t v13 = sub_253DDBB5C(v4 + 176);
    sub_253DDC590(v13, v14, &qword_26B255360);
    sub_253DDBB5C(v4 + 160);
  }
  else
  {
    *(void *)(v4 + 464) = v9;
    *(void *)(v4 + 472) = v10;
    sub_253C0F824();
    v15();
    swift_release();
    *(_OWORD *)(v4 + 112) = *v6;
    sub_253DDBB5C(v4 + 112);
    *(_OWORD *)(v4 + 192) = *v11;
    uint64_t v16 = sub_253DDBB5C(v4 + 192);
    sub_253DDC590(v16, v17, &qword_26B255360);
    sub_253DDBB5C(v4 + 144);
  }
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v18, v19, v20);
}

void sub_253DD3970()
{
  uint64_t v2 = v0[40];
  uint64_t v1 = v0[41];
  uint64_t v3 = (void *)v0[33];
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  sub_253DDBBDC(v1, v2, MEMORY[0x263F4C9C0]);
  id v4 = v3;
  id v5 = sub_253DF2490();
  os_log_type_t v6 = sub_253DF5700();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[40];
    uint64_t v8 = (void *)v0[33];
    uint64_t v9 = sub_253D7C924();
    uint64_t v29 = sub_253D779E0();
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_253DF0200();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    v0[27] = sub_253D8E5FC(v10, v12, &v29);
    sub_253DF5820();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v13 = sub_253DF0C30();
    v0[28] = sub_253D8E5FC(v13, v14, &v29);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    sub_253DDBB88(v7, MEMORY[0x263F4C9C0]);
    _os_log_impl(&dword_253BD8000, v5, v6, "SessionCoordinator (client: %s) created with ID %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();

    sub_253C0F824();
    v16(v15);
  }
  else
  {
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[54];
    uint64_t v18 = v0[45];
    uint64_t v19 = v0[42];
    uint64_t v20 = v0[40];
    uint64_t v21 = (void *)v0[33];

    sub_253DDBB88(v20, MEMORY[0x263F4C9C0]);
    v17(v18, v19);
  }
  uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[58];
  uint64_t v23 = v0[51];
  uint64_t v24 = v0[47];
  uint64_t v25 = v0[41];
  sub_253DDBBDC(v25, v0[39], MEMORY[0x263F4CE38]);
  sub_253DDBB88(v25, MEMORY[0x263F4C9C0]);
  sub_253DEFE90();
  sub_253BDF7F0();
  sub_253C10134();
  v26();
  v22(v23, v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  sub_253BEFC34();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_253DD3CDC()
{
  uint64_t v29 = v1;
  (*(void (**)(void, void))(v1 + 480))(*(void *)(v1 + 408), *(void *)(v1 + 376));
  uint64_t v2 = *(void **)(v1 + 456);
  sub_253DDC42C();
  id v3 = v0;
  id v4 = v2;
  id v5 = v3;
  id v27 = v2;
  id v6 = v2;
  uint64_t v7 = sub_253DF2490();
  os_log_type_t v8 = sub_253DF56E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(char **)(v1 + 264);
    uint64_t v10 = sub_253D7C924();
    unint64_t v11 = (void *)sub_253D11A74();
    uint64_t v28 = sub_253C0FF74();
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = *(void *)&v9[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack
                       + 8];
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_253DF0200();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_253D8E5FC(v13, v15, &v28);
    sub_253DDC328(v16);
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 12) = 2112;
    id v17 = v27;
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    sub_253DDC2D8(v18);
    *unint64_t v11 = v12;

    sub_253DDC470(&dword_253BD8000, v19, v20, "SessionCoordinator (client: %s) had error: %@");
    sub_253BDEDD8(&qword_26B2519F0);
    swift_arrayDestroy();
    sub_253BDF910();
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();

    sub_253BEFBCC();
    v21();
  }
  else
  {
    uint64_t v22 = *(void **)(v1 + 264);

    uint64_t v23 = sub_253DDC534();
    v24(v23);
  }
  sub_253DDC508();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v1 + 8);
  return v25();
}

uint64_t sub_253DD3FA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v113 = a2;
  uint64_t v9 = sub_253DF24A0();
  uint64_t v114 = *(void *)(v9 - 8);
  uint64_t v115 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (char *)v95 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  id v107 = (char *)v95 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v108 = (char *)v95 - v18;
  uint64_t v19 = sub_253BDEDD8(&qword_26B2553C8);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  unint64_t v110 = (char *)v95 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v111 = (char *)v95 - v22;
  uint64_t v112 = sub_253DF0A60();
  uint64_t v104 = *(char **)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  uint64_t v109 = (char *)v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_253BDEDD8(&qword_26B2553E0);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  unint64_t v105 = (char *)v95 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)v95 - v27;
  uint64_t v29 = sub_253DF0B80();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)v95 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = v5;
  sub_253DF0DE0();
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v28, 1, v29) == 1)
  {
    sub_253BEFAC0((uint64_t)v28, &qword_26B2553E0);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v33 = sub_253DF2490();
    os_log_type_t v34 = sub_253DF56E0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v112 = a5;
      uint64_t v37 = v36;
      v116[0] = v36;
      *(_DWORD *)uint64_t v35 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_253DF0200();
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      uint64_t v117 = sub_253D8E5FC(v38, v40, v116);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v33, v34, "SessionCoordinator (client: %s) Client provided no identities", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2709B0](v37, -1, -1);
      MEMORY[0x25A2709B0](v35, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v114 + 8))(v12, v115);
  }
  uint64_t v103 = v30;
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v32, v28, v29);
  sub_253DF1060();
  uint64_t v41 = sub_253DF52A0();
  swift_bridgeObjectRelease();
  xpc_object_t v42 = xpc_dictionary_get_value(a1, (const char *)(v41 + 32));
  swift_release();
  uint64_t v43 = a5;
  uint64_t v44 = v32;
  if (!v42) {
    goto LABEL_7;
  }
  uint64_t v45 = MEMORY[0x25A270B30](v42);
  if (v45 != sub_253DF4440())
  {
    swift_unknownObjectRelease();
LABEL_7:
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    char v46 = sub_253DF2490();
    os_log_type_t v47 = sub_253DF56E0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v102 = v29;
      unint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v104 = v44;
      uint64_t v50 = v49;
      v116[0] = v49;
      uint64_t v112 = a5;
      *(_DWORD *)unint64_t v48 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_253DF0200();
      unint64_t v53 = v52;
      swift_bridgeObjectRelease();
      uint64_t v117 = sub_253D8E5FC(v51, v53, v116);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v46, v47, "SessionCoordinator (client: %s) Client provided incorrect XPC object types", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2709B0](v50, -1, -1);
      MEMORY[0x25A2709B0](v48, -1, -1);

      (*(void (**)(char *, uint64_t))(v114 + 8))(v15, v115);
      return (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v104, v102);
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v114 + 8))(v15, v115);
    return (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v44, v29);
  }
  size_t count = xpc_array_get_count(v42);
  uint64_t v56 = *(void *)(sub_253DF0B70() + 16);
  swift_bridgeObjectRelease();
  xpc_object_t v101 = v42;
  if (count != v56)
  {
    uint64_t v83 = v107;
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v84 = sub_253DF2490();
    os_log_type_t v85 = sub_253DF56E0();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v102 = v29;
      os_log_type_t v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      uint64_t v104 = v44;
      uint64_t v88 = v87;
      v116[0] = v87;
      uint64_t v112 = a5;
      *(_DWORD *)os_log_type_t v86 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v89 = sub_253DF0200();
      unint64_t v91 = v90;
      swift_bridgeObjectRelease();
      uint64_t v117 = sub_253D8E5FC(v89, v91, v116);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v84, v85, "SessionCoordinator (client: %s) Client provided incorrect length XPC object", v86, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2709B0](v88, -1, -1);
      MEMORY[0x25A2709B0](v86, -1, -1);

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v114 + 8))(v83, v115);
      return (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v104, v102);
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v114 + 8))(v83, v115);
    return (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v44, v29);
  }
  uint64_t v102 = v29;
  uint64_t v57 = *(void *)(sub_253DF0B70() + 16);
  swift_bridgeObjectRelease();
  uint64_t result = xpc_array_get_count(v42);
  if ((result & 0x8000000000000000) == 0)
  {
    LOBYTE(v117) = 0;
    uint64_t v59 = v108;
    if (!v57 || (uint64_t v60 = (char *)result) == 0)
    {
LABEL_37:
      uint64_t v92 = v102;
      uint64_t v93 = v103;
      uint64_t v94 = (uint64_t)v105;
      (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v105, v44, v102);
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v94, 0, 1, v92);
      sub_253DF0DF0();
      swift_unknownObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v93 + 8))(v44, v92);
    }
    size_t v61 = 0;
    uint64_t v100 = (void (**)(char *, uint64_t, uint64_t))(v104 + 32);
    uint64_t v99 = (void (**)(char *, char *, uint64_t))(v104 + 16);
    uint64_t v97 = (uint64_t (**)(char *, uint64_t))(v104 + 8);
    uint64_t v98 = (uint64_t (**)(char *, uint64_t))(v114 + 8);
    uint64_t v114 = v57 - 1;
    *(void *)&long long v58 = 136315394;
    long long v96 = v58;
    v95[1] = MEMORY[0x263F8EE58] + 8;
    uint64_t v104 = v44;
    id v107 = (char *)result;
    while (v60 != (char *)v61)
    {
      id v62 = xpc_array_get_value(v42, v61);
      uint64_t v63 = MEMORY[0x25A270B30]();
      if (v63 == sub_253DF4430())
      {
        uint64_t result = swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRetain();
        uint64_t v64 = (uint64_t)v111;
        sub_253DF0A50();
        uint64_t v65 = v112;
        if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v64, 1, v112) == 1)
        {
          sub_253BEFAC0(v64, &qword_26B2553C8);
          _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          uint64_t v66 = sub_253DF2490();
          uint64_t v67 = a3;
          os_log_type_t v68 = sub_253DF56E0();
          if (os_log_type_enabled(v66, v68))
          {
            uint64_t v69 = swift_slowAlloc();
            uint64_t v70 = swift_slowAlloc();
            v116[0] = v70;
            *(_DWORD *)uint64_t v69 = v96;
            swift_bridgeObjectRetain();
            uint64_t v71 = v43;
            uint64_t v72 = sub_253DF0200();
            unint64_t v74 = v73;
            swift_bridgeObjectRelease();
            uint64_t v75 = v72;
            uint64_t v43 = v71;
            *(void *)(v69 + 4) = sub_253D8E5FC(v75, v74, v116);
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            uint64_t v59 = v108;
            swift_bridgeObjectRelease();
            *(_WORD *)(v69 + 12) = 2048;
            *(void *)(v69 + 14) = v61;
            _os_log_impl(&dword_253BD8000, v66, v68, "SessionCoordinator (client: %s) Client identity token at %ld is invalid", (uint8_t *)v69, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x25A2709B0](v70, -1, -1);
            uint64_t v76 = v69;
            uint64_t v44 = v104;
            MEMORY[0x25A2709B0](v76, -1, -1);
            swift_unknownObjectRelease();
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            swift_unknownObjectRelease();
          }
          uint64_t result = (*v98)(v59, v115);
          a3 = v67;
          xpc_object_t v42 = v101;
          uint64_t v60 = v107;
        }
        else
        {
          uint64_t v77 = v109;
          (*v100)(v109, v64, v65);
          uint64_t v78 = (uint64_t)v110;
          (*v99)(v110, v77, v65);
          _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v78, 0, 1, v65);
          uint64_t v79 = (void (*)(uint64_t *, void))sub_253DF0B60();
          uint64_t v81 = v80;
          uint64_t v82 = *v80;
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          *uint64_t v81 = v82;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_253DB4414(v82);
            uint64_t v82 = result;
            *uint64_t v81 = result;
          }
          uint64_t v60 = v107;
          uint64_t v59 = v108;
          if (v61 >= *(void *)(v82 + 16)) {
            goto LABEL_40;
          }
          sub_253DF0290();
          sub_253DF0270();
          v79(v116, 0);
          swift_unknownObjectRelease();
          uint64_t result = (*v97)(v109, v112);
          uint64_t v44 = v104;
        }
      }
      if ((v117 & 1) == 0 && v114 != v61 && v60 != (char *)++v61) {
        continue;
      }
      goto LABEL_37;
    }
    __break(1u);
    __break(1u);
LABEL_40:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_253DD4E70()
{
  sub_253C1CED0();
  uint64_t v2 = v1;
  unint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v10 = sub_253BDF9FC(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_253DDC1EC();
  sub_253DDC214(v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v0;
  v12[3] = v6;
  v12[4] = v4;
  v12[5] = v2;
  v12[6] = v8;
  id v13 = v0;
  sub_253D75DE0(v6, v4);
  sub_253DEFE90();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  sub_253DF55B0();
  swift_release();
  swift_release();
  sub_253DDC3FC();
  sub_253C1CEE8();
}

uint64_t sub_253DD4F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[36] = a5;
  v6[37] = a6;
  v6[34] = a3;
  v6[35] = a4;
  v6[32] = a1;
  v6[33] = a2;
  sub_253DF14C0();
  v6[38] = swift_task_alloc();
  sub_253DF0C70();
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  uint64_t v7 = sub_253DF24A0();
  v6[41] = v7;
  v6[42] = *(void *)(v7 - 8);
  v6[43] = swift_task_alloc();
  v6[44] = swift_task_alloc();
  v6[45] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B255F38);
  v6[46] = swift_task_alloc();
  uint64_t v8 = sub_253DF4230();
  v6[47] = v8;
  v6[48] = *(void *)(v8 - 8);
  v6[49] = swift_task_alloc();
  v6[50] = swift_task_alloc();
  sub_253DF1550();
  v6[51] = swift_task_alloc();
  uint64_t v9 = sub_253DF36F0();
  v6[52] = v9;
  v6[53] = *(void *)(v9 - 8);
  v6[54] = swift_task_alloc();
  v6[55] = swift_task_alloc();
  v6[56] = swift_task_alloc();
  uint64_t v10 = sub_253DF0E70();
  v6[57] = v10;
  v6[58] = *(void *)(v10 - 8);
  v6[59] = swift_task_alloc();
  v6[60] = swift_task_alloc();
  v6[61] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD5284, 0, 0);
}

uint64_t sub_253DD5284()
{
  uint64_t v111 = v0;
  sub_253DD6798();
  sub_253DDBE44(&qword_26B255400, MEMORY[0x263F4CA48]);
  sub_253DEFC00();
  uint64_t v1 = (void *)v0[36];
  uint64_t v2 = v0[37];
  unint64_t v3 = (uint64_t *)(v0[33] + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack);
  uint64_t v4 = *v3;
  v0[62] = *v3;
  uint64_t v5 = v3[1];
  v0[63] = v5;
  uint64_t v94 = v4;
  uint64_t v95 = v5;
  sub_253DD3FA4(v1, v4, v5, v3[2], v3[3]);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v8 = v0[37];
    uint64_t v108 = MEMORY[0x263F8EE78];
    sub_253DC7BD0(0, v6, 0);
    uint64_t v9 = v108;
    uint64_t v10 = (unint64_t *)(v8 + 40);
    do
    {
      uint64_t v11 = *(v10 - 1);
      unint64_t v12 = *v10;
      uint64_t v110 = 0;
      memset(v109, 0, sizeof(v109));
      sub_253D75DE0(v11, v12);
      sub_253D75DE0(v11, v12);
      sub_253DF1540();
      sub_253DDBE44(&qword_26B255EE0, MEMORY[0x263F4DA00]);
      sub_253DF1570();
      sub_253D75D88(v11, v12);
      unint64_t v14 = *(void *)(v108 + 16);
      unint64_t v13 = *(void *)(v108 + 24);
      if (v14 >= v13 >> 1)
      {
        char v16 = sub_253C10D1C(v13);
        sub_253DC7BD0(v16, v14 + 1, 1);
      }
      v10 += 2;
      *(void *)(v108 + 16) = v14 + 1;
      sub_253C11244();
      sub_253C10134();
      v15();
      --v6;
    }
    while (v6);
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v17 = *(void *)(v9 + 16);
  if (v17)
  {
    uint64_t v18 = v0[53];
    *(void *)&v109[0] = v7;
    sub_253DC74F0(0, v17, 0);
    unint64_t v105 = *(void (**)(void))(v18 + 16);
    sub_253C11244();
    uint64_t v20 = v9 + v19;
    *(void *)uint64_t type = *(void *)(v18 + 72);
    do
    {
      sub_253C108C4();
      sub_253C102E4();
      v105();
      sub_253C102E4();
      v105();
      sub_253DF4090();
      sub_253BEFBCC();
      v21();
      uint64_t v22 = *(void *)&v109[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DC74F0(0, *(void *)(*(void *)&v109[0] + 16) + 1, 1);
        uint64_t v22 = *(void *)&v109[0];
      }
      unint64_t v24 = *(void *)(v22 + 16);
      unint64_t v23 = *(void *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        char v26 = sub_253C10D1C(v23);
        sub_253DC74F0(v26, v24 + 1, 1);
        uint64_t v22 = *(void *)&v109[0];
      }
      *(void *)(v22 + 16) = v24 + 1;
      sub_253C11244();
      sub_253C10134();
      v25();
      *(void *)&v109[0] = v22;
      v20 += *(void *)type;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  v0[64] = v22;
  if (!*(void *)(v22 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v27 = v0[46];
  uint64_t v28 = v0[47];
  sub_253D22834(v22);
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v27, 1, v28) == 1)
  {
    uint64_t v29 = v0[46];
    swift_bridgeObjectRelease();
    sub_253BEFAC0(v29, &qword_26B255F38);
LABEL_21:
    uint64_t v30 = (void *)v0[57];
    sub_253D754D8();
    uint64_t v31 = (void *)swift_allocError();
    *uint64_t v32 = 1;
    swift_willThrow();
    uint64_t v33 = sub_253C108C4();
    v34(v33);
    sub_253DDC42C();
    id v35 = v30;
    id v36 = v31;
    id v37 = v35;
    id v38 = v31;
    unint64_t v39 = sub_253DF2490();
    os_log_type_t v40 = sub_253DF56E0();
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v43 = v0[42];
    uint64_t v42 = v0[43];
    uint64_t v44 = v0[41];
    uint64_t v45 = (void *)v0[33];
    if (v41)
    {
      uint64_t v46 = sub_253D7C924();
      uint64_t typea = sub_253D11A74();
      *(void *)&v109[0] = sub_253C0FF74();
      *(_DWORD *)uint64_t v46 = 136315394;
      uint64_t v106 = v42;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_253DF0200();
      os_log_t log = v39;
      unint64_t v49 = v48;
      swift_bridgeObjectRelease();
      v0[30] = sub_253D8E5FC(v47, v49, (uint64_t *)v109);
      sub_253DF5820();
      swift_bridgeObjectRelease();

      *(_WORD *)(v46 + 12) = 2112;
      id v50 = v31;
      uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
      sub_253DDC568(v51, v52, v53, v54, v55, v56, v57, v58, v89, v90, v91, v92, v93, v94, v95, (uint64_t)(v0 + 30), (uint64_t)(v0 + 31), (uint64_t)log, typea,
        (uint64_t)(v0 + 26));
      sub_253DF5820();
      uint64_t *typeb = v51;

      _os_log_impl(&dword_253BD8000, loga, v40, "SessionCoordinator (client: %s) had error: %@", (uint8_t *)v46, 0x16u);
      sub_253BDEDD8(&qword_26B2519F0);
      swift_arrayDestroy();
      sub_253BDF910();
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v106, v44);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v44);
    }
    swift_willThrow();
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
    sub_253BDF8DC();
    return v59();
  }
  size_t v61 = (void *)v0[33];
  (*(void (**)(void, void, void))(v0[48] + 32))(v0[49], v0[46], v0[47]);
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  id v62 = v61;
  uint64_t v63 = sub_253DF2490();
  os_log_type_t v64 = sub_253DF56C0();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v102 = v0[42];
    os_log_type_t typec = v64;
    uint64_t v65 = (void *)v0[33];
    uint64_t v66 = sub_253D7C924();
    *(void *)&v109[0] = sub_253D779E0();
    *(_DWORD *)uint64_t v66 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_253DF0200();
    unint64_t v69 = v68;
    swift_bridgeObjectRelease();
    v0[29] = sub_253D8E5FC(v67, v69, (uint64_t *)v109);
    sub_253DF5820();
    swift_bridgeObjectRelease();

    *(_WORD *)(v66 + 12) = 2080;
    sub_253C10220();
    sub_253C102E4();
    v70();
    uint64_t v71 = sub_253DF5290();
    v0[31] = sub_253D8E5FC(v71, v72, (uint64_t *)v109);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_253BD8000, v63, typec, "SessionCoordinator (client: %s) created with config %s", (uint8_t *)v66, 0x16u);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v63 = *(NSObject **)(v102 + 8);
    sub_253C0F824();
    ((void (*)(void))v63)();
  }
  else
  {
    unint64_t v73 = (void *)v0[33];

    uint64_t v74 = sub_253DDC4E0();
    ((void (*)(uint64_t))v63)(v74);
  }
  v0[65] = v63;
  sub_253DF4070();
  uint64_t v75 = sub_253DF0220();
  uint64_t v104 = v76;
  uint64_t v107 = v75;
  sub_253DF4160();
  uint64_t v77 = sub_253DF0220();
  uint64_t v103 = v78;
  sub_253DF40E0();
  if (v79)
  {
    uint64_t v80 = sub_253DF0220();
    uint64_t v82 = v81;
  }
  else
  {
    uint64_t v80 = 0;
    uint64_t v82 = 0;
  }
  uint64_t v83 = v0[61];
  uint64_t v84 = v0[58];
  uint64_t v85 = v0[59];
  uint64_t v86 = v0[57];
  uint64_t v87 = v0[33];
  MEMORY[0x25A26B3C0](v107, v104, v77, v103, v80, v82);
  v0[66] = *(void *)(v87
                     + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_transactionHookContainer);
  sub_253C10220();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v85, v83, v86);
  swift_retain();
  uint64_t v88 = (void *)swift_task_alloc();
  v0[67] = v88;
  *uint64_t v88 = v0;
  v88[1] = sub_253DD5DFC;
  return sub_253D25874();
}

uint64_t sub_253DD5DFC()
{
  sub_253C0F9D8();
  uint64_t v4 = v3;
  sub_253BDF858();
  *uint64_t v5 = v4;
  uint64_t v6 = (_OWORD *)(v4 + 16);
  sub_253C102FC();
  void *v7 = *v2;
  *(void *)(v4 + 544) = v1;
  swift_task_dealloc();
  sub_253C102FC();
  uint64_t v8 = *(void *)(v0 + 464);
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v11 = (_OWORD *)(v4 + 32);
  if (v1)
  {
    *(void *)(v4 + 568) = v9;
    *(void *)(v4 + 576) = v10;
    sub_253C0F824();
    v12();
    swift_bridgeObjectRelease();
    swift_release();
    *(_OWORD *)(v4 + 128) = *v6;
    sub_253DDBB5C(v4 + 128);
    *(_OWORD *)(v4 + 176) = *v11;
    uint64_t v13 = sub_253DDBB5C(v4 + 176);
    sub_253DDC590(v13, v14, &qword_26B255360);
    sub_253DDBB5C(v4 + 160);
  }
  else
  {
    *(void *)(v4 + 552) = v9;
    *(void *)(v4 + 560) = v10;
    sub_253C0F824();
    v15();
    swift_bridgeObjectRelease();
    swift_release();
    *(_OWORD *)(v4 + 112) = *v6;
    sub_253DDBB5C(v4 + 112);
    *(_OWORD *)(v4 + 192) = *v11;
    uint64_t v16 = sub_253DDBB5C(v4 + 192);
    sub_253DDC590(v16, v17, &qword_26B255360);
    sub_253DDBB5C(v4 + 144);
  }
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v18, v19, v20);
}

uint64_t sub_253DD6034()
{
  uint64_t v31 = v0;
  uint64_t v2 = v0[39];
  uint64_t v1 = v0[40];
  uint64_t v3 = (void *)v0[33];
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  sub_253DDBBDC(v1, v2, MEMORY[0x263F4C9C0]);
  id v4 = v3;
  uint64_t v5 = sub_253DF2490();
  os_log_type_t v6 = sub_253DF56C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[39];
    uint64_t v8 = (void *)v0[33];
    uint64_t v9 = sub_253D7C924();
    uint64_t v30 = sub_253D779E0();
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_253DF0200();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    v0[27] = sub_253D8E5FC(v10, v12, &v30);
    sub_253DF5820();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v13 = sub_253DF0C30();
    v0[28] = sub_253D8E5FC(v13, v14, &v30);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    sub_253DDBB88(v7, MEMORY[0x263F4C9C0]);
    _os_log_impl(&dword_253BD8000, v5, v6, "SessionCoordinator (client: %s) created with ID %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();

    sub_253C0F824();
    v15();
    sub_253BEFBCC();
    v16();
  }
  else
  {
    uint64_t v17 = (void (*)(void))v0[65];
    uint64_t v18 = v0[48];
    uint64_t v29 = v0[49];
    uint64_t v19 = v0[47];
    uint64_t v20 = v0[39];
    uint64_t v21 = (void *)v0[33];

    sub_253DDBB88(v20, MEMORY[0x263F4C9C0]);
    sub_253C0F824();
    v17();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v29, v19);
  }
  uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[69];
  uint64_t v23 = v0[61];
  uint64_t v24 = v0[57];
  uint64_t v25 = v0[40];
  sub_253DDBBDC(v25, v0[38], MEMORY[0x263F4CE38]);
  sub_253DDBB88(v25, MEMORY[0x263F4C9C0]);
  sub_253DEFE90();
  sub_253BDF7F0();
  sub_253C10134();
  v26();
  v22(v23, v24);
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
  sub_253C0FDF8();
  return v27();
}

uint64_t sub_253DD6460()
{
  uint64_t v31 = v0;
  uint64_t v1 = (void (*)(uint64_t))v0[71];
  uint64_t v2 = (void *)v0[57];
  sub_253C0F824();
  v3();
  uint64_t v4 = sub_253C108C4();
  v1(v4);
  uint64_t v5 = (void *)v0[68];
  sub_253DDC42C();
  id v6 = v2;
  id v7 = v5;
  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = sub_253DF2490();
  os_log_type_t v11 = sub_253DF56E0();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (char *)v0[33];
    uint64_t v13 = sub_253D7C924();
    uint64_t v29 = (void *)sub_253D11A74();
    uint64_t v30 = sub_253C0FF74();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v14 = *(void *)&v12[OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientIdentityPack
                        + 8];
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_253DF0200();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_253D8E5FC(v15, v17, &v30);
    sub_253DDC328(v18);
    swift_bridgeObjectRelease();

    *(_WORD *)(v13 + 12) = 2112;
    id v19 = v5;
    uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
    sub_253DDC2D8(v20);
    void *v29 = v14;

    sub_253DDC470(&dword_253BD8000, v21, v22, "SessionCoordinator (client: %s) had error: %@");
    sub_253BDEDD8(&qword_26B2519F0);
    swift_arrayDestroy();
    sub_253BDF910();
    swift_arrayDestroy();
    sub_253BDF910();
    sub_253BDF910();

    sub_253BEFBCC();
    v23();
  }
  else
  {
    uint64_t v24 = (void *)v0[33];

    uint64_t v25 = sub_253DDC534();
    v26(v25);
  }
  swift_willThrow();
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
  sub_253BDF8DC();
  return v27();
}

uint64_t sub_253DD6798()
{
  sub_253DF1050();
  char v1 = sub_253DF1980();
  uint64_t result = swift_bridgeObjectRelease();
  if (v1)
  {
    if ((*(unsigned char *)(v0 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_clientCapabilities) & 0x10) != 0) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  sub_253DDB5CC();
  swift_allocError();
  *uint64_t v4 = v3;
  return swift_willThrow();
}

void sub_253DD6938()
{
  sub_253C1CED0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  v25[1] = v7;
  uint64_t v8 = sub_253DEFE90();
  sub_253C0F830();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v16 = sub_253BDF9FC(v15);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_253DF5500();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v18, 1, 1, v19);
  uint64_t v20 = sub_253C52058();
  *(void *)(v20 + 16) = v4;
  *(void *)(v20 + 24) = v2;
  sub_253BEFD38();
  v21();
  unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v0;
  *(void *)(v23 + 24) = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v23 + v22, v14, v8);
  sub_253DDB360();
  swift_retain();
  id v24 = v0;
  swift_bridgeObjectRetain();
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0((uint64_t)v18, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DD6B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_253DEFE90();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  sub_253DF14C0();
  v4[9] = swift_task_alloc();
  uint64_t v6 = sub_253DF4230();
  v4[10] = v6;
  v4[11] = *(void *)(v6 - 8);
  v4[12] = swift_task_alloc();
  sub_253DF1550();
  v4[13] = swift_task_alloc();
  uint64_t v7 = sub_253DF36F0();
  v4[14] = v7;
  v4[15] = *(void *)(v7 - 8);
  unsigned char v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD6D10, 0, 0);
}

uint64_t sub_253DD6D10()
{
  sub_253DD6798();
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v36 = MEMORY[0x263F8EE78];
    sub_253DC7BD0(0, v4, 0);
    uint64_t v6 = v36;
    uint64_t v7 = (unint64_t *)(v3 + 40);
    do
    {
      uint64_t v8 = *(v7 - 1);
      unint64_t v9 = *v7;
      sub_253D75DE0(v8, *v7);
      sub_253D75DE0(v8, v9);
      sub_253DF1540();
      sub_253DDBE44(&qword_26B255EE0, MEMORY[0x263F4DA00]);
      sub_253C49F34();
      sub_253DF1570();
      uint64_t v10 = sub_253C49F34();
      sub_253D75D88(v10, v11);
      unint64_t v13 = *(void *)(v36 + 16);
      unint64_t v12 = *(void *)(v36 + 24);
      if (v13 >= v12 >> 1)
      {
        char v15 = sub_253C10D1C(v12);
        sub_253DC7BD0(v15, v13 + 1, 1);
      }
      v7 += 2;
      sub_253DDC294();
      sub_253C10134();
      v14();
      --v4;
    }
    while (v4);
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  uint64_t v16 = *(void *)(v6 + 16);
  if (v16)
  {
    uint64_t v17 = v0[15];
    uint64_t v37 = v5;
    sub_253DC74F0(0, v16, 0);
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
    sub_253C11244();
    uint64_t v20 = v6 + v19;
    uint64_t v35 = *(void *)(v17 + 72);
    uint64_t v21 = v18;
    do
    {
      uint64_t v23 = v0[16];
      uint64_t v22 = v0[17];
      uint64_t v24 = v0[14];
      v21(v22, v20, v24);
      v21(v23, v22, v24);
      sub_253DF4090();
      sub_253BEFBCC();
      v25();
      uint64_t v26 = v37;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_253DC74F0(0, *(void *)(v37 + 16) + 1, 1);
        uint64_t v26 = v37;
      }
      unint64_t v28 = *(void *)(v26 + 16);
      unint64_t v27 = *(void *)(v26 + 24);
      if (v28 >= v27 >> 1)
      {
        char v30 = sub_253C10D1C(v27);
        sub_253DC74F0(v30, v28 + 1, 1);
        uint64_t v26 = v37;
      }
      *(void *)(v26 + 16) = v28 + 1;
      sub_253C11244();
      sub_253C10134();
      v29();
      uint64_t v37 = v26;
      v20 += v35;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = MEMORY[0x263F8EE78];
  }
  v0[19] = v26;
  if (*(void *)(v26 + 16))
  {
    uint64_t v31 = v0[8];
    sub_253BEFD38();
    v32();
    MEMORY[0x25A26B7F0](v31);
    uint64_t v33 = (void *)swift_task_alloc();
    v0[20] = v33;
    *uint64_t v33 = v0;
    v33[1] = sub_253DD71D0;
    sub_253C10348(v0[9]);
    return sub_253D2B388();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_253D754D8();
    swift_allocError();
    *os_log_type_t v34 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253BDF8DC();
    return v1();
  }
}

uint64_t sub_253DD71D0()
{
  sub_253BDF8D0();
  sub_253BDF7C8();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 72);
  uint64_t v6 = *v1;
  sub_253BDF858();
  void *v7 = v6;
  *(void *)(v8 + 168) = v0;
  swift_task_dealloc();
  sub_253DDBB88(v5, MEMORY[0x263F4CE38]);
  swift_bridgeObjectRelease();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_253DD7300()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_253DDB360();
  *uint64_t v1 = sub_253DDC3CC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  return v2();
}

uint64_t sub_253DD73D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_253DDC3E4();
  sub_253BDFA3C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  sub_253D7BFF4();
  return v11(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

uint64_t sub_253DD75D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_253DF0780();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  uint64_t v5 = sub_253DEFE90();
  v3[8] = v5;
  v3[9] = *(void *)(v5 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v6 = sub_253DF0D70();
  v3[11] = v6;
  v3[12] = *(void *)(v6 - 8);
  v3[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD774C, 0, 0);
}

uint64_t sub_253DD774C()
{
  sub_253C10364();
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  sub_253BEFD38();
  v4();
  sub_253DF0770();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, *MEMORY[0x263F4C518], v2);
  sub_253BEFBAC();
  sub_253DF0D50();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[14] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_253DD7858;
  sub_253C10348(v0[13]);
  return sub_253D2AE6C();
}

uint64_t sub_253DD7858()
{
  sub_253C10364();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = sub_253DBE410();
  v5(v4);
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

void sub_253DD79C8()
{
  sub_253C10364();
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_253DDB360();
  *uint64_t v1 = sub_253DDC3CC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  sub_253DD115C();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_253DD7A5C()
{
  sub_253BDF928();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v0();
}

uint64_t sub_253DD7C3C()
{
  sub_253DDC57C();
  uint64_t v5 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v6 = sub_253BDF9FC(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_253DDC1EC();
  sub_253DDC214(v7);
  uint64_t v8 = sub_253C52058();
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v3;
  uint64_t v9 = (void *)swift_allocObject();
  sub_253DDC548(v9);
  id v10 = v0;
  sub_253D75DE0(v2, v1);
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  return sub_253DDC3FC();
}

uint64_t sub_253DD7D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  uint64_t v5 = sub_253DF0D70();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD7E0C, 0, 0);
}

uint64_t sub_253DD7E0C()
{
  sub_253C10364();
  uint64_t v1 = v0[6];
  sub_253DDBE44(&qword_269D7EDB8, MEMORY[0x263F4CA08]);
  sub_253DDC234();
  if (v1)
  {
    swift_task_dealloc();
    sub_253DD1170();
    sub_253DD115C();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_253DD7F40;
  sub_253C10348(v0[9]);
  sub_253DD115C();
  return sub_253D2AE6C();
}

uint64_t sub_253DD7F40()
{
  sub_253BDF928();
  sub_253BDF7C8();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 88) = v4;
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_253DD8024()
{
  sub_253BDFA3C();
  v0[2] = v0[11];
  uint64_t v1 = v0[12];
  sub_253BDEDD8(&qword_269D7EDC0);
  sub_253DDB754();
  uint64_t v2 = sub_253DEFC30();
  uint64_t v4 = v3;
  if (v1)
  {
    sub_253C0F824();
    v5();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_253DD1170();
  }
  else
  {
    uint64_t v7 = v2;
    uint64_t v8 = (uint64_t *)v0[3];
    sub_253C0F824();
    v9();
    swift_bridgeObjectRelease();
    *uint64_t v8 = v7;
    v8[1] = v4;
    swift_task_dealloc();
    sub_253C0FDF8();
  }
  return v6();
}

uint64_t sub_253DD8138()
{
  sub_253BDF928();
  sub_253C0F824();
  v0();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v1();
}

void sub_253DD81DC(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = a3;
  id v17 = a1;
  uint64_t v13 = sub_253DEFDD0();
  unint64_t v15 = v14;

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v11;
  a7(v13, v15, a6, v16);
  swift_release();
  sub_253D75D88(v13, v15);
}

void sub_253DD82B8()
{
  sub_253C1CED0();
  sub_253DDC4CC(v3, v4, v5, v6, v7, v8, v9);
  uint64_t v11 = v10;
  sub_253DEFE90();
  sub_253C0F830();
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v14 = sub_253BDF9FC(v13);
  MEMORY[0x270FA5388](v14);
  uint64_t v15 = sub_253DDC300();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v2, 1, 1, v15);
  uint64_t v16 = sub_253C52058();
  *(void *)(v16 + 16) = v11;
  *(void *)(v16 + 24) = v1;
  sub_253BEFD38();
  v17();
  *(void *)(swift_allocObject() + 16) = v0;
  sub_253DDC378();
  v18();
  sub_253DDB360();
  swift_retain();
  id v19 = v0;
  sub_253DDC3A8();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v2, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DD842C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_253DEFE90();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  sub_253DF14C0();
  v3[8] = swift_task_alloc();
  uint64_t v5 = sub_253DEFFE0();
  v3[9] = v5;
  v3[10] = *(void *)(v5 - 8);
  v3[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD8578, 0, 0);
}

uint64_t sub_253DD8578()
{
  sub_253BDF8D0();
  uint64_t v1 = *(void *)(v0 + 56);
  sub_253BEFD38();
  v2();
  MEMORY[0x25A26B7F0](v1);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_253DD8648;
  return sub_253D2B7B4();
}

uint64_t sub_253DD8648()
{
  sub_253BDF928();
  sub_253BDF7C8();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *v1;
  sub_253BDF858();
  void *v7 = v6;
  *(void *)(v8 + 104) = v0;
  swift_task_dealloc();
  sub_253DDBB88(v5, MEMORY[0x263F4CE38]);
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_253DD8754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_253DDC3E4();
  sub_253BDFA3C();
  uint64_t v11 = *(void **)(v10 + 16);
  uint64_t v12 = sub_253DEFFD0();
  uint64_t v13 = sub_253C108C4();
  v14(v13);
  *uint64_t v11 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  sub_253D7BFF4();
  return v16(v15, v16, v17, v18, v19, v20, v21, v22, a9, a10);
}

uint64_t sub_253DD8810()
{
  sub_253BDF928();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v0();
}

uint64_t sub_253DD89EC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v8 = sub_253BDF9FC(v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_253DDC1EC();
  sub_253DDC214(v9);
  uint64_t v10 = sub_253C52058();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  uint64_t v11 = sub_253C52058();
  *(void *)(v11 + 16) = v3;
  *(void *)(v11 + 24) = a1;
  sub_253DDB360();
  swift_retain();
  id v12 = v3;
  id v13 = a1;
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  return sub_253DDC3FC();
}

uint64_t sub_253DD8B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_253DD8B28, 0, 0);
}

uint64_t sub_253DD8B28()
{
  sub_253BDF8D0();
  uint64_t v1 = sub_253DD6798();
  uint64_t v4 = *(void *)(*(void *)(v0 + 24)
                 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_transactionHookContainer);
  *(void *)(v0 + 40) = v4;
  if (v4)
  {
    uint64_t v5 = *(void **)(v0 + 32);
    swift_retain();
    *(unsigned char *)(v0 + 48) = objc_msgSend(v5, sel_BOOLValue);
    uint64_t v1 = (uint64_t)sub_253DD8C08;
    uint64_t v2 = v4;
    uint64_t v3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_253DD8C08()
{
  sub_253BDF928();
  *(unsigned char *)(*(void *)(v0 + 40) + 112) = *(unsigned char *)(v0 + 48);
  swift_release();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_253DD8C70()
{
  sub_253BDF928();
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  sub_253DDB360();
  *uint64_t v1 = sub_253DDC3CC();
  sub_253C0FDF8();
  return v2();
}

uint64_t sub_253DD8D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_253DEFE90();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  sub_253DF08E0();
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD8E74, 0, 0);
}

uint64_t sub_253DD8E74()
{
  sub_253BDF8D0();
  if (qword_26B251C80 != -1) {
    swift_once();
  }
  sub_253DDC490();
  *(void *)(v2 + 80) = qword_26B257560;
  sub_253BEFD38();
  v4();
  MEMORY[0x25A26AC10](v1);
  sub_253DDBBDC(v3 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId, v0, MEMORY[0x263F4C718]);
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DDBE44(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DF5480();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_253DD8FE0()
{
  sub_253BDF8D0();
  sub_253DDC45C();
  sub_253DACE54();
  uint64_t v2 = *(void *)(v1 + 64);
  if (v0) {
    *(unsigned char *)(v1 + 89) = *(unsigned char *)(v1 + 88);
  }
  sub_253DDBB88(v2, MEMORY[0x263F4C718]);
  sub_253DDC51C();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

void sub_253DD90A8()
{
  sub_253C10364();
  char v1 = *(unsigned char *)(v0 + 89);
  sub_253D2BEB4();
  swift_allocError();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  sub_253DD115C();
  __asm { BRAA            X1, X16 }
}

void sub_253DD9150()
{
  sub_253C10364();
  char v1 = *(uint64_t **)(v0 + 16);
  sub_253DDB360();
  *char v1 = sub_253DDC3CC();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  sub_253DD115C();
  __asm { BRAA            X1, X16 }
}

void sub_253DD934C()
{
  sub_253C1CED0();
  sub_253DDC4CC(v3, v4, v5, v6, v7, v8, v9);
  uint64_t v11 = v10;
  sub_253DEFE90();
  sub_253C0F830();
  uint64_t v13 = v12;
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v16);
  uint64_t v17 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v18 = sub_253BDF9FC(v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v19 = sub_253DDC300();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v2, 1, 1, v19);
  uint64_t v20 = sub_253C52058();
  *(void *)(v20 + 16) = v11;
  *(void *)(v20 + 24) = v1;
  sub_253BEFD38();
  v21();
  unint64_t v22 = (v15 + ((*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  sub_253DDC378();
  v24();
  *(void *)(v23 + v22) = v0;
  sub_253DDB360();
  swift_retain();
  id v25 = v0;
  sub_253DDC3A8();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v2, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DD94CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_253DEFE90();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  sub_253DF08E0();
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD95CC, 0, 0);
}

uint64_t sub_253DD95CC()
{
  sub_253BDF8D0();
  if (qword_26B251C80 != -1) {
    swift_once();
  }
  sub_253DDC490();
  *(void *)(v2 + 80) = qword_26B257560;
  sub_253BEFD38();
  v4();
  MEMORY[0x25A26AC10](v1);
  sub_253DDBBDC(v3 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId, v0, MEMORY[0x263F4C718]);
  if (qword_26B255AB8 != -1) {
    swift_once();
  }
  type metadata accessor for SessionControlActor();
  sub_253DDBE44(&qword_26B255AC0, (void (*)(uint64_t))type metadata accessor for SessionControlActor);
  sub_253DF5480();
  sub_253DB5D44();
  sub_253DB5D74();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_253DD9738()
{
  sub_253BDF8D0();
  sub_253DDC45C();
  sub_253DADCFC();
  uint64_t v2 = *(void *)(v1 + 64);
  if (v0) {
    *(unsigned char *)(v1 + 89) = *(unsigned char *)(v1 + 88);
  }
  sub_253DDBB88(v2, MEMORY[0x263F4C718]);
  sub_253DDC51C();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_253DD996C()
{
  uint64_t v1 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v2 = sub_253BDF9FC(v1);
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = sub_253DDC1EC();
  sub_253DDC214(v3);
  *(void *)(swift_allocObject() + 16) = v0;
  sub_253DEFE90();
  id v4 = v0;
  sub_253DF55B0();
  swift_release();
  swift_release();
  return sub_253DDC3FC();
}

uint64_t sub_253DD9A50(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_253DF08E0();
  v2[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DD9AE0, 0, 0);
}

uint64_t sub_253DD9AE0()
{
  sub_253BDF928();
  sub_253DDBBDC(*(void *)(v0 + 24) + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId, *(void *)(v0 + 32), MEMORY[0x263F4C718]);
  sub_253DEFE90();
  sub_253BDF7F0();
  sub_253C10134();
  v1();
  swift_task_dealloc();
  sub_253C0FDF8();
  return v2();
}

id sub_253DD9C24()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_253DF08E0();
  uint64_t v3 = sub_253BDF7B0(v2);
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v10 = sub_253BDF9FC(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t)v0 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime23SessionXPCServiceServer6Server_sessionClientId;
  uint64_t v14 = sub_253DF5500();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v12, 1, 1, v14);
  sub_253DDBBDC(v13, (uint64_t)v8, MEMORY[0x263F4C718]);
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = 0;
  sub_253DDBF38((uint64_t)v8, v16 + v15);
  sub_253C4F880((uint64_t)v12, (uint64_t)&unk_269D7EEA8, v16);
  swift_release();
  v18.receiver = v0;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_dealloc);
}

uint64_t sub_253DD9DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_253DD9DD0, 0, 0);
}

uint64_t sub_253DD9DD0()
{
  sub_253BDF928();
  if (qword_26B251C80 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_253DD9E94;
  sub_253C10348(*(void *)(v0 + 16));
  return sub_253DA9C54();
}

uint64_t sub_253DD9E94()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v1 = *v0;
  sub_253BDF858();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_253BDF8DC();
  return v3();
}

uint64_t sub_253DDA03C()
{
  return type metadata accessor for SessionXPCServiceServer.Server();
}

uint64_t type metadata accessor for SessionXPCServiceServer.Server()
{
  uint64_t result = qword_26B2563A8;
  if (!qword_26B2563A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_253DDA09C()
{
  uint64_t result = sub_253DEFE90();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_253DDA160(void *a1@<X8>)
{
  sub_253DD1468();
  *a1 = v2;
}

uint64_t sub_253DDA188()
{
  return MEMORY[0x270F577B8](v0);
}

uint64_t sub_253DDA190()
{
  return MEMORY[0x270F577B8](v0);
}

uint64_t sub_253DDA198()
{
  return MEMORY[0x270F577B0](v0);
}

uint64_t sub_253DDA1A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_253DD13B0();
  *a1 = result;
  return result;
}

uint64_t sub_253DDA1CC(uint64_t *a1)
{
  return sub_253DD13F4(*a1);
}

uint64_t (*sub_253DDA1F4(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = *v1;
  swift_beginAccess();
  return sub_253DDA258;
}

uint64_t sub_253DDA258(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_253DD1314();
  }
  return result;
}

uint64_t sub_253DDA294()
{
  swift_beginAccess();
  uint64_t v0 = qword_26B257530;
  id v1 = (id)qword_26B257530;
  return v0;
}

void sub_253DDA2E0(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26B257530;
  qword_26B257530 = a1;
}

uint64_t (*sub_253DDA330())()
{
  return j_j__swift_endAccess_0;
}

uint64_t sub_253DDA388()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_253DDA3D0(uint64_t a1)
{
  qword_26B257538 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_253DDA420())()
{
  return j__swift_endAccess_0;
}

uint64_t sub_253DDA478@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253BE181C();
  *a1 = result;
  return result;
}

uint64_t sub_253DDA4A0@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_253DD2444(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_253DDA4D0@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_253DD130C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_253DDA500@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_253DDA530(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_253DDA530(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

BOOL sub_253DDA538(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_253DDA540(a1, *a2);
}

BOOL sub_253DDA540(unsigned __int8 *a1, unsigned __int8 a2)
{
  int v3 = (*v2 & a2);
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_253DDA570@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_253DD245C(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_253DDA5A4@<X0>(char *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_253DDA5D8(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_253DDA5D8(char a1)
{
  char v2 = *v1;
  *v1 |= a1;
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_253DDA600(unsigned __int8 *a1)
{
  return sub_253DD244C(*a1);
}

uint64_t sub_253DDA608(unsigned __int8 *a1)
{
  return sub_253DDA610(*a1);
}

uint64_t sub_253DDA610(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_253DDA620(unsigned __int8 *a1)
{
  return sub_253DDA628(*a1);
}

uint64_t sub_253DDA628(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_253DDA638@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_253DDA668(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_253DDA668(int a1, int a2)
{
  return a2 & ~a1;
}

BOOL sub_253DDA670(char *a1)
{
  return sub_253DDA67C(*a1, *v1);
}

BOOL sub_253DDA67C(char a1, unsigned __int8 a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_253DDA68C(unsigned __int8 *a1)
{
  return sub_253DDA698(*a1, *v1);
}

BOOL sub_253DDA698(unsigned __int8 a1, unsigned __int8 a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_253DDA6A8(unsigned __int8 *a1)
{
  return sub_253DDA6B4(*a1, *v1);
}

BOOL sub_253DDA6B4(unsigned __int8 a1, char a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_253DDA6C4()
{
  return sub_253DDA6CC(*v0);
}

BOOL sub_253DDA6CC(char a1)
{
  return a1 == 0;
}

uint64_t sub_253DDA6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_253DDA6F0(unsigned __int8 *a1)
{
  return sub_253DDA6F8(*a1);
}

uint64_t sub_253DDA6F8(uint64_t result)
{
  *v1 &= ~(_BYTE)result;
  return result;
}

unsigned __int8 *sub_253DDA708@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_253DDA718(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_253DDA724@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_253DD23F0(a1);
  *a2 = result;
  return result;
}

uint64_t sub_253DDA74C()
{
  sub_253BDF928();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = sub_253DF4230();
  v1[5] = v4;
  sub_253BDF7B0(v4);
  v1[6] = v5;
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DDA7F8, v0, 0);
}

void sub_253DDA7F8()
{
  uint64_t v1 = v0[3];
  if (*(unsigned char *)(v0[4] + 112))
  {
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      uint64_t v3 = v0[6];
      uint64_t v23 = MEMORY[0x263F8EE78];
      sub_253DC78B0(0, v2, 0);
      uint64_t v4 = v3 + 16;
      sub_253C11244();
      uint64_t v6 = v1 + v5;
      uint64_t v21 = *(void *)(v4 + 56);
      unint64_t v22 = v7;
      do
      {
        v22(v0[8], v6, v0[5]);
        sub_253DDBE44(&qword_269D7E618, MEMORY[0x263F4E050]);
        uint64_t v8 = sub_253DF3B80();
        uint64_t v10 = v9;
        (*(void (**)(uint64_t, uint64_t))(v4 - 8))(v0[8], v0[5]);
        uint64_t v11 = v23;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_253DC78B0(0, *(void *)(v23 + 16) + 1, 1);
          uint64_t v11 = v23;
        }
        unint64_t v13 = *(void *)(v11 + 16);
        unint64_t v12 = *(void *)(v11 + 24);
        if (v13 >= v12 >> 1)
        {
          char v15 = sub_253C10D1C(v12);
          sub_253DC78B0(v15, v13 + 1, 1);
          uint64_t v11 = v23;
        }
        *(void *)(v11 + 16) = v13 + 1;
        unint64_t v14 = v11 + 16 * v13;
        *(void *)(v14 + 32) = v8;
        *(void *)(v14 + 40) = v10;
        v6 += v21;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v11 = MEMORY[0x263F8EE78];
    }
    v0[9] = v11;
    v0[10] = *(void *)(v0[4] + 120);
    swift_retain();
    objc_super v18 = (void *)swift_task_alloc();
    v0[11] = (uint64_t)v18;
    *objc_super v18 = v0;
    v18[1] = sub_253DDAAF8;
    sub_253C10348(v0[2]);
    sub_253BEFC34();
    __asm { BR              X2 }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BEFC34();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_253DDAAF8()
{
  sub_253BDF928();
  sub_253BDF7C8();
  uint64_t v3 = v2;
  sub_253C0FA84();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  v3[12] = v5;
  v3[13] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = v3[4];
    uint64_t v7 = sub_253DDAE38;
  }
  else
  {
    uint64_t v8 = v3[4];
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v7 = sub_253DDABFC;
    uint64_t v6 = v8;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_253DDABFC()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_253DC74F0(0, v2, 0);
    uint64_t v3 = v15;
    uint64_t v4 = v0[13];
    uint64_t v5 = (unint64_t *)(v1 + 40);
    while (1)
    {
      uint64_t v6 = *(v5 - 1);
      unint64_t v7 = *v5;
      sub_253D75DE0(v6, *v5);
      sub_253D75DE0(v6, v7);
      sub_253DDBE44(&qword_269D7ED40, MEMORY[0x263F4E050]);
      sub_253DF3B70();
      if (v4) {
        break;
      }
      sub_253D75D88(v6, v7);
      unint64_t v9 = *(void *)(v15 + 16);
      unint64_t v8 = *(void *)(v15 + 24);
      if (v9 >= v8 >> 1)
      {
        char v11 = sub_253C10D1C(v8);
        sub_253DC74F0(v11, v9 + 1, 1);
      }
      v5 += 2;
      sub_253DDC294();
      sub_253C10134();
      v10();
      uint64_t v4 = 0;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
    }
    sub_253D75D88(v6, v7);
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DD1170();
    return v12();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = MEMORY[0x263F8EE78];
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
    return v14(v3);
  }
}

uint64_t sub_253DDAE38()
{
  sub_253BDF928();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253BDF8DC();
  return v0();
}

uint64_t sub_253DDAEAC()
{
  swift_release();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for TransactionHookContainer()
{
  return self;
}

void type metadata accessor for SessionClientCapabilities()
{
}

void type metadata accessor for SessionXPCServiceServer()
{
}

unint64_t sub_253DDAF24()
{
  unint64_t result = qword_269D7ED20;
  if (!qword_269D7ED20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7ED20);
  }
  return result;
}

unint64_t sub_253DDAF74()
{
  unint64_t result = qword_269D7ED28;
  if (!qword_269D7ED28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7ED28);
  }
  return result;
}

unint64_t sub_253DDAFC4()
{
  unint64_t result = qword_269D7ED30;
  if (!qword_269D7ED30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7ED30);
  }
  return result;
}

unint64_t sub_253DDB014()
{
  unint64_t result = qword_269D7ED38;
  if (!qword_269D7ED38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7ED38);
  }
  return result;
}

uint64_t sub_253DDB060()
{
  return sub_253DDBE44(&qword_26B2562E0, MEMORY[0x263F4CA70]);
}

uint64_t sub_253DDB0A8()
{
  return sub_253DDBE44(&qword_26B251C48, MEMORY[0x263F4CBA0]);
}

uint64_t sub_253DDB0F0()
{
  return sub_253DDBE44(&qword_26B2563A0, (void (*)(uint64_t))type metadata accessor for SessionXPCServiceServer.Server);
}

unint64_t sub_253DDB138()
{
  unint64_t result = qword_26B2553D8;
  if (!qword_26B2553D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2553D8);
  }
  return result;
}

uint64_t sub_253DDB184()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_253DDB1BC(uint64_t a1, void *a2)
{
  sub_253DED2C4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_253DDB1C4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_253DDB1FC()
{
  sub_253BDF928();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_253BDF880(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_253BDF7AC;
  return sub_253DD9A50(v2, v3);
}

void sub_253DDB290(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_253DDB298(void *a1, uint64_t a2)
{
  return sub_253DED238(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_253DDB2A4()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DDC414();
  sub_253BDF7B0(v0);
  sub_253DDC390();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253D11A40();
  return sub_253DD94CC(v4, v5, v6);
}

unint64_t sub_253DDB360()
{
  unint64_t result = qword_26B256198;
  if (!qword_26B256198)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B256198);
  }
  return result;
}

uint64_t sub_253DDB3A4()
{
  sub_253DEFE90();
  sub_253BDF7F0();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_253BEFBCC();
  v5();

  return MEMORY[0x270FA0238](v0, v4 + 8, v3);
}

uint64_t sub_253DDB43C()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DDC414();
  sub_253BDF7B0(v0);
  sub_253DDC390();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253D11A40();
  return sub_253DD8D74(v4, v5, v6);
}

uint64_t sub_253DDB4F8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253DDB538()
{
  sub_253BDF8D0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253BDF7AC;
  uint64_t v3 = sub_253D11A40();
  return sub_253DD8B04(v3, v4, v5);
}

unint64_t sub_253DDB5CC()
{
  unint64_t result = qword_269D7ED90;
  if (!qword_269D7ED90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269D7ED90);
  }
  return result;
}

uint64_t sub_253DDB61C()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DDC414();
  sub_253C1CE88(v0);
  sub_253DDC4B8();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253D11A40();
  return sub_253DD842C(v4, v5, v6);
}

uint64_t sub_253DDB6BC()
{
  sub_253BDF8D0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253BDF7AC;
  uint64_t v3 = sub_253DDC260();
  return sub_253DD7D48(v3, v4, v5, v6);
}

unint64_t sub_253DDB754()
{
  unint64_t result = qword_269D7EDC8;
  if (!qword_269D7EDC8)
  {
    sub_253C0BFF8(&qword_269D7EDC0);
    sub_253DDBE44(&qword_269D7EDD0, MEMORY[0x263F07508]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7EDC8);
  }
  return result;
}

uint64_t sub_253DDB7FC()
{
  sub_253DEFE90();
  sub_253C0F830();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 24) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_253C16B14();
  v9(v8);

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_253DDB890()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DDC414();
  sub_253C1CE88(v0);
  sub_253DDC4B8();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF090;
  uint64_t v4 = sub_253D11A40();
  return sub_253DD75D0(v4, v5, v6);
}

uint64_t sub_253DDB92C()
{
  sub_253DEFE90();
  sub_253C0F830();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  swift_bridgeObjectRelease();
  uint64_t v8 = sub_253C16B14();
  v9(v8);

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_253DDB9C8()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DDC414();
  sub_253C1CE88(v0);
  sub_253DDC4F4();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF7AC;
  uint64_t v4 = sub_253DDC260();
  return sub_253DD6B20(v4, v5, v6, v7);
}

uint64_t sub_253DDBA64()
{
  sub_253D75D88(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_253DDBAB4()
{
  sub_253C10364();
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_253BDF880(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_253BDF7AC;
  uint64_t v5 = sub_253DDC350();
  return sub_253DD4F80(v5, v6, v7, v8, v9, v1);
}

uint64_t sub_253DDBB5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_253DDBB88(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_253BDF7F0();
  sub_253BEFBCC();
  v3();
  return a1;
}

uint64_t sub_253DDBBDC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_253BDF7F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_253DDBC3C()
{
  sub_253D75D88(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_253DDBC8C()
{
  sub_253DDC3E4();
  sub_253BDFA3C();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253BDF7AC;
  sub_253DDC350();
  sub_253D7BFF4();
  return sub_253DD2EC0(v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_253DDBD30()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253DDBD6C()
{
  sub_253D75D88(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_253DDBDAC()
{
  sub_253BDF8D0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253BDF7AC;
  uint64_t v3 = sub_253DDC260();
  return sub_253DD259C(v3, v4, v5, v6);
}

uint64_t sub_253DDBE44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_253DDBE8C()
{
  uint64_t v0 = sub_253DF08E0();
  sub_253BDF7B0(v0);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80) | 7;
  swift_unknownObjectRelease();
  sub_253DEFE90();
  sub_253BDF7F0();
  sub_253BEFBCC();
  v3();
  uint64_t v4 = sub_253C108C4();

  return MEMORY[0x270FA0238](v4, v5, v2);
}

uint64_t sub_253DDBF38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253DF08E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_253DDBF9C()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DF08E0();
  sub_253C1CE88(v0);
  sub_253DDC4F4();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253BDF090;
  uint64_t v4 = sub_253DDC260();
  return sub_253DD9DB0(v4, v5, v6, v7);
}

unsigned char *sub_253DDC040(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x253DDC10CLL);
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

void type metadata accessor for TestingAPISecurityError()
{
}

unint64_t sub_253DDC144()
{
  unint64_t result = qword_269D7EEB0;
  if (!qword_269D7EEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7EEB0);
  }
  return result;
}

uint64_t sub_253DDC1EC()
{
  return sub_253DF5500();
}

uint64_t sub_253DDC214(uint64_t a1)
{
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v1, 1, 1, a1);
}

uint64_t sub_253DDC234()
{
  return sub_253DEFC00();
}

uint64_t sub_253DDC260()
{
  return v0;
}

uint64_t sub_253DDC278()
{
  return sub_253DF5C90();
}

unint64_t sub_253DDC294()
{
  *(void *)(v0 + 16) = v1;
  return v0
       + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
       + *(void *)(v3 + 72) * v2;
}

uint64_t sub_253DDC2B8()
{
  return swift_dynamicCast();
}

uint64_t sub_253DDC2D8(uint64_t a1)
{
  *(void *)(v1 + 208) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DDC300()
{
  return sub_253DF5500();
}

uint64_t sub_253DDC328(uint64_t a1)
{
  *(void *)(v1 + 240) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DDC350()
{
  return v0;
}

uint64_t sub_253DDC3A8()
{
  return sub_253DF55B0();
}

uint64_t sub_253DDC3CC()
{
  return sub_253DF57D0();
}

uint64_t sub_253DDC3FC()
{
  return sub_253BEFAC0(v1, v0);
}

uint64_t sub_253DDC414()
{
  return sub_253DEFE90();
}

uint64_t sub_253DDC42C()
{
  return _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
}

uint64_t sub_253DDC444()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DDC45C()
{
  return *(void *)(v0 + 72);
}

void sub_253DDC470(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t sub_253DDC4A4(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

void sub_253DDC4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 - 96) = a6;
  *(void *)(v7 - 88) = a7;
  *(void *)(v7 - 104) = a5;
}

uint64_t sub_253DDC4E0()
{
  return v0;
}

uint64_t sub_253DDC51C()
{
  return sub_253DDBB88(v1, v0);
}

uint64_t sub_253DDC534()
{
  return v0;
}

uint64_t sub_253DDC548(void *a1)
{
  a1[2] = v1;
  a1[3] = v3;
  a1[4] = v2;
  return swift_retain();
}

uint64_t sub_253DDC568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(void *)(v20 + 208) = a1;
  return a20;
}

uint64_t sub_253DDC590(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_253C61B78(v3, v4, a3);
}

uint64_t sub_253DDC5A8(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  return sub_253DDC87C(a1, a2, a3, _s23ParameterStepEvaluationVMa, (void (*)(void))_s23ParameterStepEvaluationVMa, (void (*)(uint64_t))sub_253DC6D90);
}

uint64_t sub_253DDC5FC(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_253BDEDD8(&qword_269D7C830);
  uint64_t v8 = sub_253BDF7B0(v7);
  uint64_t v25 = v9;
  MEMORY[0x270FA5388](v8);
  sub_253C34050();
  uint64_t v24 = v10;
  uint64_t result = MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v21 - v13;
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v23 = *(void *)(a3 + 16);
  if (v23)
  {
    unint64_t v16 = 0;
    v21[1] = a2;
    uint64_t v22 = a3;
    v21[0] = a1;
    while (v16 < *(void *)(a3 + 16))
    {
      unint64_t v17 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
      uint64_t v15 = *(void *)(v25 + 72);
      sub_253C2E770(a3 + v17 + v15 * v16, (uint64_t)v14, &qword_269D7C830);
      char v18 = a1(v14);
      if (v3)
      {
        sub_253BEFAC0((uint64_t)v14, &qword_269D7C830);
        swift_release();
        swift_bridgeObjectRelease();
        return v15;
      }
      if (v18)
      {
        sub_253C61B78((uint64_t)v14, v24, &qword_269D7C830);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_253DED064();
          sub_253DC6EBC();
        }
        uint64_t v19 = v26;
        unint64_t v20 = *(void *)(v26 + 16);
        if (v20 >= *(void *)(v26 + 24) >> 1)
        {
          sub_253DC6EBC();
          uint64_t v19 = v26;
        }
        *(void *)(v19 + 16) = v20 + 1;
        uint64_t result = sub_253C61B78(v24, v19 + v17 + v20 * v15, &qword_269D7C830);
        a3 = v22;
        a1 = (uint64_t (*)(char *))v21[0];
      }
      else
      {
        uint64_t result = sub_253BEFAC0((uint64_t)v14, &qword_269D7C830);
      }
      if (v23 == ++v16)
      {
        uint64_t v15 = v26;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t sub_253DDC828(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  return sub_253DDC87C(a1, a2, a3, _s19ValueStepEvaluationVMa, (void (*)(void))_s19ValueStepEvaluationVMa, (void (*)(uint64_t))sub_253DC6FB0);
}

uint64_t sub_253DDC87C(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(void), void (*a6)(uint64_t))
{
  uint64_t v24 = a6;
  char v30 = a1;
  uint64_t v31 = a2;
  uint64_t v9 = a4(0);
  uint64_t v10 = sub_253BDF7B0(v9);
  uint64_t v29 = v11;
  MEMORY[0x270FA5388](v10);
  sub_253C34050();
  uint64_t v28 = v12;
  uint64_t result = MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v24 - v15;
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v32 = MEMORY[0x263F8EE78];
  uint64_t v27 = *(void *)(a3 + 16);
  if (v27)
  {
    unint64_t v18 = 0;
    uint64_t v25 = a5;
    uint64_t v26 = a3;
    while (v18 < *(void *)(a3 + 16))
    {
      sub_253DEB9E8();
      uint64_t v17 = v31;
      char v19 = v30(v16);
      if (v6)
      {
        sub_253DEBA30((uint64_t)v16, a5);
        swift_release();
        swift_bridgeObjectRelease();
        return v17;
      }
      if (v19)
      {
        sub_253DEBA84();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v20 = sub_253DED064();
          v24(v20);
        }
        uint64_t v21 = v32;
        unint64_t v23 = *(void *)(v32 + 16);
        unint64_t v22 = *(void *)(v32 + 24);
        if (v23 >= v22 >> 1)
        {
          ((void (*)(BOOL, unint64_t, uint64_t))v24)(v22 > 1, v23 + 1, 1);
          uint64_t v21 = v32;
        }
        *(void *)(v21 + 16) = v23 + 1;
        a5 = v25;
        uint64_t result = sub_253DEBA84();
        a3 = v26;
      }
      else
      {
        uint64_t result = sub_253DEBA30((uint64_t)v16, a5);
      }
      if (v27 == ++v18)
      {
        uint64_t v17 = v32;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v17;
  }
  return result;
}

uint64_t sub_253DDCAA8(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  return sub_253DDC87C(a1, a2, a3, _s19SystemResponseEventVMa, (void (*)(void))_s19SystemResponseEventVMa, (void (*)(uint64_t))sub_253DC7014);
}

uint64_t sub_253DDCAFC(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  return sub_253DDC87C(a1, a2, a3, _s18ToolStepEvaluationVMa, (void (*)(void))_s18ToolStepEvaluationVMa, (void (*)(uint64_t))sub_253DC71D4);
}

uint64_t sub_253DDCB50(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  return sub_253DDC87C(a1, a2, a3, _s16CandidateSummaryVMa, (void (*)(void))_s16CandidateSummaryVMa, (void (*)(uint64_t))sub_253DC6DF4);
}

uint64_t sub_253DDCBA4(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v28 = sub_253DF46F0();
  uint64_t v7 = *(void *)(v28 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v28);
  uint64_t v27 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v29 = MEMORY[0x263F8EE78];
  uint64_t v26 = *(void *)(a3 + 16);
  if (v26)
  {
    unint64_t v14 = 0;
    uint64_t v21 = a3;
    unint64_t v22 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v24 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v25 = v7 + 16;
    v20[0] = a1;
    v20[1] = a2;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v13 = *(void *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a3 + v15 + v13 * v14, v28);
      char v16 = a1(v12);
      if (v3)
      {
        (*v22)(v12, v28);
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if (v16)
      {
        unint64_t v23 = *v24;
        v23(v27, v12, v28);
        uint64_t v17 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_253DC7554(0, *(void *)(v17 + 16) + 1, 1);
          uint64_t v17 = v29;
        }
        unint64_t v19 = *(void *)(v17 + 16);
        unint64_t v18 = *(void *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_253DC7554(v18 > 1, v19 + 1, 1);
          uint64_t v17 = v29;
        }
        *(void *)(v17 + 16) = v19 + 1;
        uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v17 + v15 + v19 * v13, v27, v28);
        uint64_t v29 = v17;
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v22)(v12, v28);
      }
      if (v26 == ++v14)
      {
        uint64_t v13 = v29;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

void *sub_253DDCE48(void *result, uint64_t a2, int a3, char a4, uint64_t a5)
{
  if (a4) {
    goto LABEL_10;
  }
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
  }
  else if ((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2))
  {
    if (*(_DWORD *)(a5 + 36) == a3)
    {
      *uint64_t result = *(void *)(*(void *)(a5 + 56) + 8 * a2);
      swift_bridgeObjectRetain();
      return (void *)sub_253BEFD44();
    }
    goto LABEL_9;
  }
  __break(1u);
LABEL_9:
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_253DDCED0(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  if (a3 < 0 || 1 << *(unsigned char *)(a6 + 32) <= a3)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a6 + 8 * ((unint64_t)a3 >> 6) + 64) >> a3) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a6 + 36) != a4)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v9 = result;
  uint64_t v10 = *(void *)(a6 + 48);
  uint64_t v11 = sub_253DF5010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a3, v11);
  uint64_t v12 = *(void *)(a6 + 56);
  uint64_t v13 = sub_253DF4650();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  uint64_t v16 = v12 + *(void *)(v14 + 72) * a3;

  return v15(a2, v16, v13);
}

id sub_253DDCFE4(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_253DDD028(a1, a2);
}

id sub_253DDD028(uint64_t a1, void *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v5 = v2;
  uint64_t v6 = sub_253DF18E0();
  uint64_t v7 = (uint64_t *)&v5[OBJC_IVAR____TtCC23IntelligenceFlowRuntime23ToolboxXPCServiceServer6Server_clientApplicationIdentifier];
  uint64_t *v7 = v6;
  v7[1] = v8;

  v12.receiver = v5;
  v12.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v12, sel_init);

  sub_253DF18F0();
  sub_253BDF7F0();
  sub_253BEFBCC();
  v10();
  return v9;
}

void sub_253DDD0E0()
{
  sub_253C8F550();
  sub_253DECDF8();
  uint64_t v4 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v5 = sub_253BDF9FC(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_253DEBD90();
  sub_253C0FF54(v6);
  uint64_t v7 = sub_253C52058();
  *(void *)(v7 + 16) = v2;
  *(void *)(v7 + 24) = v1;
  uint64_t v8 = sub_253C52058();
  *(void *)(v8 + 16) = v3;
  *(void *)(v8 + 24) = v0;
  sub_253DF1470();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_253DECF68();
  swift_release();
  swift_release();
  swift_release();
  sub_253DECBAC();
  sub_253C8F44C();
}

uint64_t sub_253DDD1D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[30] = a2;
  v3[31] = a3;
  v3[29] = a1;
  uint64_t v4 = sub_253DF4ED0();
  v3[32] = v4;
  v3[33] = *(void *)(v4 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = sub_253BDEDD8(&qword_269D7EFD8);
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  sub_253BDEDD8(&qword_269D7EFE0);
  v3[41] = swift_task_alloc();
  uint64_t v5 = sub_253DF5010();
  v3[42] = v5;
  v3[43] = *(void *)(v5 - 8);
  v3[44] = swift_task_alloc();
  v3[45] = swift_task_alloc();
  uint64_t v6 = sub_253DF4630();
  v3[46] = v6;
  v3[47] = *(void *)(v6 - 8);
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  uint64_t v7 = sub_253DF46F0();
  v3[50] = v7;
  v3[51] = *(void *)(v7 - 8);
  v3[52] = swift_task_alloc();
  uint64_t v8 = sub_253DF15B0();
  v3[53] = v8;
  v3[54] = *(void *)(v8 - 8);
  v3[55] = swift_task_alloc();
  sub_253BDEDD8(&qword_269D7EFE8);
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v3[58] = swift_task_alloc();
  uint64_t v9 = sub_253DF0DB0();
  v3[59] = v9;
  v3[60] = *(void *)(v9 - 8);
  v3[61] = swift_task_alloc();
  v3[62] = swift_task_alloc();
  uint64_t v10 = sub_253DF24A0();
  v3[63] = v10;
  v3[64] = *(void *)(v10 - 8);
  v3[65] = swift_task_alloc();
  v3[66] = swift_task_alloc();
  v3[67] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DDD618, 0, 0);
}

uint64_t sub_253DDD618()
{
  uint64_t v127 = v0;
  uint64_t v2 = v0;
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  sub_253DEBE18();
  uint64_t v3 = (void *)sub_253DF2490();
  os_log_type_t v4 = sub_253DF56C0();
  unint64_t v124 = v0;
  if (sub_253BDF95C(v4))
  {
    uint64_t v5 = v0[64];
    sub_253C0FFB0();
    uint64_t v6 = sub_253C0FF74();
    sub_253DEC868(v6);
    uint64_t v7 = sub_253DED0BC(4.8149e-34);
    v0[28] = sub_253DEC538(v7, v8, &v126);
    sub_253DEC024((uint64_t)(v0 + 28));
    uint64_t v2 = v0;
    sub_253DF5820();
    swift_bridgeObjectRelease_n();
    sub_253DEBDD8(&dword_253BD8000, v9, v10, "Determining readiness for %s's toolbox.");
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v11 = *(void (**)(void))(v5 + 8);
    sub_253C1026C();
    v11();
  }
  else
  {
    uint64_t v12 = v0[64];
    swift_bridgeObjectRelease_n();

    uint64_t v11 = *(void (**)(void))(v12 + 8);
    uint64_t v13 = sub_253DECADC();
    ((void (*)(uint64_t))v11)(v13);
  }
  v2[68] = v11;
  swift_bridgeObjectRetain();
  sub_253DEBEBC();
  uint64_t v14 = objc_release_x19;
  if (sub_253DEBFC8() == 1)
  {
    sub_253BEFAC0(v2[58], &qword_26B2553E8);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    sub_253DEBE18();
    unint64_t v15 = sub_253DF2490();
    os_log_type_t v16 = sub_253DF56E0();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v119 = v16;
      uint64_t v17 = sub_253D7C924();
      uint64_t v125 = sub_253D779E0();
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v18 = swift_bridgeObjectRetain();
      v2[22] = sub_253DECAAC(v18, v19, &v125);
      sub_253DF5820();
      sub_253DEC34C();
      uint64_t v120 = (uint8_t *)v17;
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v20 = sub_253DF0D80();
      uint64_t v21 = *(void *)(v20 + 16);
      if (v21)
      {
        uint64_t v22 = v2[60];
        sub_253DEC29C(MEMORY[0x263F8EE78]);
        sub_253C11244();
        uint64_t v24 = v20 + v23;
        uint64_t v121 = *(void *)(v22 + 72);
        long long v123 = v25;
        do
        {
          uint64_t v26 = v124[59];
          v123(v124[61], v24, v26);
          uint64_t v27 = sub_253DF0DA0();
          uint64_t v29 = v28;
          sub_253C634D8();
          v30();
          if ((sub_253DECB58() & 1) == 0)
          {
            sub_253DEBDF8(*(void *)(v1 + 16));
            uint64_t v1 = v126;
          }
          sub_253DEC0B8();
          if (v32)
          {
            sub_253DEBE30(v31);
            uint64_t v1 = v126;
          }
          *(void *)(v1 + 16) = v26;
          uint64_t v33 = v1 + 16 * (void)(v2 + 23);
          *(void *)(v33 + 32) = v27;
          *(void *)(v33 + 40) = v29;
          v24 += v121;
          --v21;
        }
        while (v21);
        swift_bridgeObjectRelease();
        uint64_t v2 = v124;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = MEMORY[0x263F8EE78];
      }
      v2[23] = v1;
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DEBEF8();
      uint64_t v48 = sub_253DEBF50();
      v2[24] = sub_253DEC364(v48, v49, &v125);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v15, v119, "Invalid planner type (%s while determining readiness. Possible values: [%s]", v120, 0x16u);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C8F5F0();
      sub_253C0F824();
      v50();
      uint64_t v14 = objc_release_x19;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      sub_253C0F824();
      v11();
    }
    sub_253DEA2A4();
    uint64_t v42 = (void *)sub_253C0FFC8();
    sub_253DECD90((uint64_t)v42, v51);
    swift_willThrow();
    goto LABEL_21;
  }
  sub_253BEFD2C();
  v34();
  uint64_t v35 = static ToolboxManager.toolboxes()();
  sub_253DEBE9C(v35);
  swift_bridgeObjectRelease();
  if (!v2[5])
  {
    sub_253BEFAC0((uint64_t)(v2 + 2), &qword_269D7EEE0);
    sub_253DEA2A4();
    uint64_t v42 = (void *)sub_253C0FFC8();
    sub_253DEBDB8((uint64_t)v42, v43);
    sub_253C634D8();
    v44();
LABEL_21:
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain();
    id v52 = v42;
    swift_bridgeObjectRetain();
    id v53 = v42;
    uint64_t v54 = sub_253DF2490();
    os_log_type_t v55 = sub_253DF56E0();
    BOOL v56 = os_log_type_enabled(v54, v55);
    uint64_t v57 = (void (*)(void))v2[68];
    if (v56)
    {
      uint64_t v58 = sub_253D7C924();
      uint64_t v59 = (void *)sub_253D11A74();
      uint64_t v126 = sub_253C0FF74();
      *(_DWORD *)uint64_t v58 = *((void *)v14 + 470);
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_253C105C0();
      v124[26] = sub_253D8E5FC(v60, v61, v62);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v58 + 12) = 2112;
      id v63 = v42;
      uint64_t v64 = _swift_stdlib_bridgeErrorToNSError();
      v124[25] = v64;
      sub_253DF5820();
      *uint64_t v59 = v64;

      _os_log_impl(&dword_253BD8000, v54, v55, "Could not determine readiness of %s's toolbox. Error: %@", (uint8_t *)v58, 0x16u);
      sub_253BDEDD8(&qword_26B2519F0);
      sub_253DEBE54();
      sub_253BDF910();
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C0F824();
      v65();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      sub_253C0F824();
      v57();
    }
    swift_willThrow();
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
    swift_task_dealloc();
    sub_253BDF8DC();
    return v66();
  }
  sub_253DEC310(v2 + 12);
  uint64_t v37 = v2[15];
  uint64_t v36 = v2[16];
  uint64_t v38 = sub_253BDF5F8(v2 + 12, v37);
  uint64_t v39 = v2[20];
  uint64_t v40 = v2[21];
  BOOL v41 = sub_253BDF5F8(v2 + 17, v39);
  v2[69] = static StandardToolboxConfiguration.makeQueryableToolboxWithNoClientActions<A, B>(delegate:planGenerationDelegate:)((uint64_t)v38, (uint64_t)v41, v37, v39, v36, v40);
  uint64_t v45 = sub_253DF3320();
  unint64_t v47 = v46;
  v2[70] = v45;
  v2[71] = v46;
  sub_253DF4A40();
  sub_253DF4A30();
  uint64_t v122 = v45;
  sub_253DF49D0();
  sub_253DEB7B0(&qword_269D7EFF0, 255, MEMORY[0x263F80268]);
  sub_253DF4A20();
  uint64_t v69 = v2[56];
  uint64_t v68 = v2[57];
  swift_release();
  sub_253C2E770(v68, v69, &qword_269D7EFE8);
  uint64_t v70 = sub_253DF49F0();
  int v71 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v69, 1, v70);
  if (v71 != 1)
  {
    uint64_t v75 = sub_253DF49E0();
    unint64_t v73 = v76;
    uint64_t v77 = v75;
    sub_253C0FA90();
    sub_253BEFBCC();
    v78();
    if (v47 >> 60 == 15)
    {
      uint64_t v72 = v77;
      if (v73 >> 60 == 15) {
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v72 = v77;
      if (v73 >> 60 != 15)
      {
        uint64_t v89 = sub_253DECBF8();
        char v74 = MEMORY[0x25A26A110](v89);
        sub_253D8F168(v72, v73);
        sub_253D8F168(v122, v47);
        goto LABEL_33;
      }
    }
LABEL_32:
    uint64_t v79 = sub_253DECBF8();
    sub_253D8F168(v79, v80);
    sub_253D8F168(v72, v73);
    char v74 = 0;
    goto LABEL_33;
  }
  sub_253BEFAC0(v2[56], &qword_269D7EFE8);
  uint64_t v72 = 0;
  unint64_t v73 = 0xF000000000000000;
  if (v47 >> 60 != 15) {
    goto LABEL_32;
  }
LABEL_29:
  char v74 = 1;
LABEL_33:
  *((unsigned char *)v124 + 624) = v74 & 1;
  v124[73] = v72;
  v124[72] = v73;
  (*(void (**)(void, void, void))(v124[54] + 104))(v124[55], *MEMORY[0x263F4E3E8], v124[53]);
  char v81 = sub_253DF15A0();
  sub_253C634D8();
  v82();
  sub_253DF4A30();
  if (v81)
  {
    sub_253BDEDD8(&qword_269D7EFF8);
    uint64_t v83 = sub_253DF4610();
    sub_253BE1888();
    uint64_t v85 = v84;
    unint64_t v86 = (*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
    uint64_t v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = xmmword_253DF6EC0;
    uint64_t v88 = *(void (**)(unint64_t, void, uint64_t))(v85 + 104);
    v88(v87 + v86, *MEMORY[0x263F7FDF0], v83);
    sub_253BEFBAC();
    uint64_t v115 = sub_253DF4A00();
    swift_bridgeObjectRelease();
    swift_release();
    sub_253DF4A30();
    uint64_t v91 = swift_allocObject();
    sub_253DEC9B4(v91, v92, v93, v94, v95, v96, v97, v98, v111, (uint64_t)v88, v86, v115, xmmword_253DF6EC0);
    sub_253DECE74();
    v99();
    sub_253BEFBAC();
    sub_253DF4A00();
    swift_bridgeObjectRelease();
    swift_release();
    sub_253DF4A30();
    uint64_t v100 = swift_allocObject();
    sub_253DEC9B4(v100, v101, v102, v103, v104, v105, v106, v107, v112, v113, v114, v116, v118);
    sub_253DECE74();
    v108();
    sub_253BEFBAC();
    sub_253DF4A00();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v126 = v117;
    sub_253DBF5AC();
    sub_253DBF5AC();
    uint64_t v109 = v126;
    uint64_t v110 = v124;
  }
  else
  {
    uint64_t v110 = v124;
    uint64_t v109 = sub_253DF4A10();
    swift_release();
  }
  v110[74] = v109;
  uint64_t v90 = (void *)swift_task_alloc();
  v110[75] = v90;
  *uint64_t v90 = v110;
  v90[1] = sub_253DDE714;
  return MEMORY[0x270F400E0](v109);
}

uint64_t sub_253DDE714()
{
  sub_253C10364();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_253C0FA84();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v1;
  *(void *)(v4 + 608) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v0) {
    *(void *)(v4 + 616) = v3;
  }
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

void sub_253DDE84C()
{
  uint64_t v134 = v0;
  uint64_t v1 = v0[77];
  uint64_t v2 = v0[76];
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v0 + 12;
  uint64_t v4 = sub_253DDCBA4((uint64_t (*)(char *))sub_253DEB80C, v3, v1);
  uint64_t v105 = v2;
  swift_task_dealloc();
  uint64_t v5 = (objc_class *)sub_253DF0EC0();
  id v6 = objc_allocWithZone(v5);
  sub_253DF0EB0();
  uint64_t v103 = sub_253DF3330();
  unint64_t v104 = v7;
  uint64_t v112 = *(void *)(v4 + 16);
  uint64_t v101 = v5;
  if (v112)
  {
    sub_253C11244();
    uint64_t v121 = (uint64_t (**)(uint64_t, uint64_t))(v8 + 88);
    int v119 = *MEMORY[0x263F7FE38];
    uint64_t v9 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    uint64_t v116 = (void (**)(void, void))(v8 + 96);
    uint64_t v118 = v10;
    uint64_t v130 = (void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
    swift_bridgeObjectRetain();
    uint64_t v11 = 0;
    uint64_t v12 = MEMORY[0x263F8EE78];
    unint64_t v124 = v9;
    while (1)
    {
      sub_253BEFD38();
      v13();
      uint64_t v14 = *(void *)(sub_253DF4680() + 16);
      if (v14)
      {
        uint64_t v114 = v11;
        uint64_t v115 = v12;
        sub_253C11244();
        uint64_t v17 = v15 + v16;
        uint64_t v126 = *(void (**)(void))(v18 + 16);
        uint64_t v128 = *(void *)(v18 + 72);
        uint64_t v19 = MEMORY[0x263F8EE78];
        do
        {
          uint64_t v20 = v0[48];
          uint64_t v21 = v0[46];
          sub_253C105C0();
          sub_253D7ABA0();
          v126();
          sub_253D7ABA0();
          v126();
          int v22 = (*v121)(v20, v21);
          uint64_t v23 = v0[48];
          uint64_t v24 = v0[46];
          uint64_t v26 = v0[41];
          uint64_t v25 = v0[42];
          if (v22 == v119)
          {
            (*v116)(v0[48], v0[46]);
            sub_253C10134();
            v27();
            _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v26, 0, 1, v25);
            uint64_t v28 = *v9;
          }
          else
          {
            _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v0[41], 1, 1, v0[42]);
            uint64_t v28 = *v9;
            (*v9)(v23, v24);
          }
          uint64_t v30 = v0[41];
          uint64_t v29 = v0[42];
          v28(v0[49], v0[46]);
          if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v30, 1, v29) == 1)
          {
            sub_253BEFAC0(v0[41], &qword_269D7EFE0);
            uint64_t v9 = v124;
          }
          else
          {
            uint64_t v32 = v0[44];
            uint64_t v31 = v0[45];
            uint64_t v33 = v0[42];
            os_log_type_t v34 = *v130;
            (*v130)(v31, v0[41], v33);
            v34(v32, v31, v33);
            uint64_t v9 = v124;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              char v39 = sub_253DED064();
              uint64_t v19 = sub_253DC4DDC(v39, v40, v41, v19);
            }
            unint64_t v36 = *(void *)(v19 + 16);
            unint64_t v35 = *(void *)(v19 + 24);
            if (v36 >= v35 >> 1) {
              uint64_t v19 = sub_253DC4DDC(v35 > 1, v36 + 1, 1, v19);
            }
            *(void *)(v19 + 16) = v36 + 1;
            sub_253C11244();
            ((void (*)(unint64_t))v34)(v19 + v37 + *(void *)(v38 + 72) * v36);
          }
          v17 += v128;
          --v14;
        }
        while (v14);
        swift_bridgeObjectRelease();
        uint64_t v11 = v114;
        uint64_t v12 = v115;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = MEMORY[0x263F8EE78];
      }
      sub_253BEFBCC();
      v42();
      uint64_t v43 = *(void *)(v19 + 16);
      uint64_t v44 = *(void *)(v12 + 16);
      uint64_t v45 = v44 + v43;
      if (__OFADD__(v44, v43)) {
        break;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v45 > *(void *)(v12 + 24) >> 1)
      {
        if (v44 <= v45) {
          uint64_t v47 = v44 + v43;
        }
        else {
          uint64_t v47 = v44;
        }
        uint64_t v12 = sub_253DC4DDC(isUniquelyReferenced_nonNull_native, v47, 1, v12);
      }
      if (*(void *)(v19 + 16))
      {
        uint64_t v48 = *(void *)(v12 + 16);
        if ((*(void *)(v12 + 24) >> 1) - v48 < v43) {
          goto LABEL_60;
        }
        unint64_t v49 = (*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80);
        uint64_t v50 = *(void *)(v118 + 72);
        unint64_t v51 = v12 + v49 + v50 * v48;
        if (v19 + v49 < v51 + v50 * v43 && v51 < v19 + v49 + v50 * v43) {
          goto LABEL_62;
        }
        swift_arrayInitWithCopy();
        if (v43)
        {
          uint64_t v53 = *(void *)(v12 + 16);
          BOOL v54 = __OFADD__(v53, v43);
          uint64_t v55 = v53 + v43;
          if (v54) {
            goto LABEL_61;
          }
          *(void *)(v12 + 16) = v55;
        }
      }
      else if (v43)
      {
        goto LABEL_59;
      }
      ++v11;
      swift_bridgeObjectRelease();
      if (v11 == v112)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_39;
      }
    }
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    sub_253DF5B10();
    sub_253DECD38();
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_39:
    sub_253CFA6F8();
    sub_253DF3A90();
    sub_253DF3A80();
    uint64_t v56 = sub_253DF3A70();
    swift_release();
    uint64_t v57 = *(void *)(v56 + 16);
    if (v57)
    {
      uint64_t v58 = v0[43];
      uint64_t v127 = v0[35];
      uint64_t v132 = MEMORY[0x263F8EE78];
      sub_253DECC88();
      uint64_t v59 = sub_253DEB924(v56);
      uint64_t v61 = v60;
      char v63 = v62 & 1;
      uint64_t v131 = (void (**)(void))(v58 + 16);
      uint64_t v108 = (void (**)(void))(v58 + 8);
      uint64_t v109 = v56;
      do
      {
        uint64_t v122 = v57;
        uint64_t v65 = v0[39];
        uint64_t v64 = v0[40];
        uint64_t v129 = v0[38];
        uint64_t v123 = v61;
        uint64_t v125 = v59;
        unsigned int v120 = v63 & 1;
        sub_253DDCED0(v64, v64 + *(int *)(v127 + 48), v59, v61, v63 & 1, v56);
        uint64_t v110 = *v131;
        sub_253BEFD38();
        v66();
        uint64_t v117 = *(void *)(sub_253DF4650() - 8);
        uint64_t v67 = *(void (**)(void))(v117 + 16);
        sub_253D7ABA0();
        v67();
        sub_253C61B78(v65, v129, &qword_269D7EFD8);
        sub_253BEFAC0(v64, &qword_269D7EFD8);
        sub_253BEFD38();
        v110();
        sub_253D7ABA0();
        v67();
        uint64_t v68 = sub_253DF4FF0();
        uint64_t v111 = v69;
        uint64_t v113 = v68;
        uint64_t v70 = *v108;
        sub_253C0FDBC();
        v70();
        sub_253C10FA0();
        sub_253BEFD38();
        v110();
        sub_253D7ABA0();
        v71();
        sub_253DF5000();
        sub_253C10FA0();
        sub_253C0FDBC();
        v70();
        sub_253DF4EC0();
        sub_253BEFBCC();
        v72();
        v133[0] = v113;
        v133[1] = v111;
        swift_bridgeObjectRetain();
        sub_253DF52E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v73 = *(void (**)(void))(v117 + 8);
        sub_253C1026C();
        v73();
        sub_253C1026C();
        v73();
        sub_253BEFAC0(v129, &qword_269D7EFD8);
        uint64_t v74 = v132;
        uint64_t v75 = swift_isUniquelyReferenced_nonNull_native();
        if ((v75 & 1) == 0)
        {
          sub_253DEBF98(v75, *(void *)(v132 + 16) + 1);
          uint64_t v74 = v132;
        }
        unint64_t v77 = *(void *)(v74 + 16);
        unint64_t v76 = *(void *)(v74 + 24);
        uint64_t v56 = v109;
        uint64_t v78 = v123;
        uint64_t v79 = v125;
        if (v77 >= v76 >> 1)
        {
          sub_253DC6918(v76 > 1, v77 + 1, 1);
          uint64_t v78 = v123;
          uint64_t v79 = v125;
          uint64_t v74 = v132;
        }
        *(void *)(v74 + 16) = v77 + 1;
        uint64_t v80 = v74 + 16 * v77;
        *(void *)(v80 + 32) = v113;
        *(void *)(v80 + 40) = v111;
        uint64_t v81 = v79;
        uint64_t v82 = v78;
        uint64_t v83 = sub_253DEB8A0(v79, v78, v120, v109);
        uint64_t v85 = v84;
        char v63 = v86 & 1;
        sub_253D76398(v81, v82, v120);
        uint64_t v59 = v83;
        uint64_t v61 = v85;
        --v57;
      }
      while (v122 != 1);
      sub_253D76398(v83, v85, v63);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v74 = MEMORY[0x263F8EE78];
    }
    v133[0] = v74;
    swift_bridgeObjectRetain();
    sub_253DEA96C(v133);
    if (!v105)
    {
      swift_bridgeObjectRelease();
      v0[27] = v133[0];
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DF5240();
      swift_release();
      uint64_t v88 = (void *)sub_253DF3050();
      swift_bridgeObjectRelease();
      uint64_t v89 = sub_253DEFDD0();
      unint64_t v91 = v90;

      sub_253D75DE0(v89, v91);
      if (v104 >> 60 == 15)
      {
        sub_253D8F168(v103, v104);
        sub_253D8F168(v89, v91);
      }
      else
      {
        sub_253DEB7F8(v103, v104);
        MEMORY[0x25A26A110](v103, v104, v89, v91);
        sub_253D75D88(v89, v91);
        sub_253D8F168(v103, v104);
      }
      swift_bridgeObjectRelease();
      id v92 = objc_allocWithZone(v101);
      sub_253DF0EB0();
      sub_253DF3350();
      uint64_t v106 = v0[57];
      uint64_t v107 = (uint64_t *)v0[29];
      uint64_t v93 = v0[70];
      uint64_t v94 = v0[73];
      Class v102 = (Class)v0[71];
      unint64_t v95 = v0[72];
      id v96 = objc_allocWithZone((Class)sub_253DF1470());
      uint64_t v97 = sub_253DF1460();
      swift_release();
      sub_253D8F168(v103, v104);
      sub_253D75D88(v89, v91);
      sub_253D8F168(v94, v95);
      sub_253D8F168(v93, (unint64_t)v102);
      sub_253BEFAC0(v106, &qword_269D7EFE8);
      sub_253C1026C();
      v98();
      sub_253D110B8((uint64_t)(v0 + 12));
      *uint64_t v107 = v97;
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
      swift_task_dealloc();
      sub_253C0FDF8();
      sub_253DECD38();
      __asm { BRAA            X1, X16 }
    }
    sub_253DECD38();
    swift_release();
  }
}

uint64_t sub_253DDF8BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36)
{
  sub_253C10EB0();
  a35 = v37;
  a36 = v38;
  sub_253C2F5A0();
  a34 = v36;
  uint64_t v39 = v36[73];
  unint64_t v40 = v36[72];
  unint64_t v41 = v36[71];
  uint64_t v42 = v36[70];
  uint64_t v43 = v36[57];
  swift_release();
  sub_253D8F168(v39, v40);
  sub_253D8F168(v42, v41);
  sub_253BEFAC0(v43, &qword_269D7EFE8);
  sub_253C0FDD4();
  v44();
  sub_253D110B8((uint64_t)(v36 + 12));
  uint64_t v45 = (void *)v36[76];
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  swift_bridgeObjectRetain();
  id v46 = v45;
  swift_bridgeObjectRetain();
  uint64_t v85 = v45;
  id v47 = v45;
  uint64_t v48 = (void *)sub_253DF2490();
  os_log_type_t v49 = sub_253DF56E0();
  if (sub_253C4A060(v49))
  {
    uint64_t v50 = v36[30];
    unint64_t v51 = v36[31];
    uint64_t v52 = sub_253D7C924();
    sub_253D11A74();
    a24 = sub_253C0FF74();
    sub_253DEC404(4.8151e-34);
    uint64_t v53 = sub_253D8E5FC(v50, v51, &a24);
    sub_253DEC618(v53);
    sub_253DED128();
    *(_WORD *)(v52 + 12) = 2112;
    id v54 = v45;
    uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
    sub_253DEC5BC(v55);
    sub_253DECDE0();

    sub_253DDC470(&dword_253BD8000, v56, v57, "Could not determine readiness of %s's toolbox. Error: %@");
    sub_253BDEDD8(&qword_26B2519F0);
    sub_253DEBE54();
    sub_253BDF910();
    sub_253C10BF4();
    sub_253BDF910();
    sub_253BDF910();

    sub_253C0F824();
    v58();
  }
  else
  {
    uint64_t v59 = (void (*)(uint64_t))v36[68];
    swift_bridgeObjectRelease_n();

    uint64_t v60 = sub_253DEC3C4();
    v59(v60);
  }
  uint64_t v72 = v36[55];
  uint64_t v73 = v36[52];
  uint64_t v74 = v36[49];
  uint64_t v75 = v36[48];
  uint64_t v76 = v36[45];
  uint64_t v77 = v36[44];
  uint64_t v78 = v36[41];
  uint64_t v79 = v36[40];
  uint64_t v80 = v36[39];
  uint64_t v81 = v36[38];
  sub_253DECED0();
  uint64_t v82 = v62;
  uint64_t v83 = v61;
  uint64_t v84 = v36[34];
  swift_willThrow();
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
  swift_task_dealloc();
  sub_253BDF8DC();
  sub_253C110C0();
  return v64(v63, v64, v65, v66, v67, v68, v69, v70, a9, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81,
           v82,
           v83,
           v84,
           v85,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_253DDFC10(uint64_t a1, void *a2)
{
  return sub_253DF31A0() & 1;
}

void sub_253DDFCA0()
{
  sub_253C8F550();
  sub_253DECDF8();
  uint64_t v4 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v5 = sub_253BDF9FC(v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_253DEBD90();
  sub_253C0FF54(v6);
  uint64_t v7 = sub_253C52058();
  *(void *)(v7 + 16) = v2;
  *(void *)(v7 + 24) = v1;
  uint64_t v8 = sub_253C52058();
  *(void *)(v8 + 16) = v3;
  *(void *)(v8 + 24) = v0;
  sub_253DDB360();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_253DECF68();
  swift_release();
  swift_release();
  swift_release();
  sub_253DECBAC();
  sub_253C8F44C();
}

uint64_t sub_253DDFD98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[29] = a2;
  v3[30] = a3;
  v3[28] = a1;
  sub_253BDEDD8(&qword_26B2553E8);
  v3[31] = swift_task_alloc();
  uint64_t v4 = sub_253DF0DB0();
  v3[32] = v4;
  v3[33] = *(void *)(v4 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  uint64_t v5 = sub_253DF24A0();
  v3[36] = v5;
  v3[37] = *(void *)(v5 - 8);
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DDFF14, 0, 0);
}

uint64_t sub_253DDFF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v100 = v28;
  sub_253DEC3AC();
  sub_253DEBE18();
  uint64_t v29 = (void *)sub_253DF2490();
  os_log_type_t v30 = sub_253DF56C0();
  if (sub_253BDF95C(v30))
  {
    uint64_t v31 = v28[37];
    sub_253DEC038();
    uint64_t v32 = sub_253C0FF74();
    sub_253DEC868(v32);
    uint64_t v33 = sub_253DEBED8(4.8149e-34);
    uint64_t v35 = sub_253DEC538(v33, v34, &v99);
    sub_253DEBF34(v35);
    sub_253DF5820();
    sub_253DEC4A4();
    sub_253DEBDD8(&dword_253BD8000, v36, v37, "Populating %s's toolbox.");
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v38 = *(void (**)(void))(v31 + 8);
    sub_253C1026C();
    v38();
  }
  else
  {
    uint64_t v39 = v28[37];
    sub_253DEC2DC();

    uint64_t v38 = *(void (**)(void))(v39 + 8);
    uint64_t v40 = sub_253C10BD8();
    ((void (*)(uint64_t))v38)(v40);
  }
  v28[41] = v38;
  sub_253DED140();
  sub_253DEBEBC();
  if (sub_253DEBFC8() == 1)
  {
    sub_253BEFAC0(v28[31], &qword_26B2553E8);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    sub_253DEBE18();
    unint64_t v41 = sub_253DF2490();
    os_log_type_t v42 = sub_253DF56E0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint64_t)(v28 + 23);
      uint64_t v44 = sub_253D7C924();
      uint64_t v98 = sub_253D779E0();
      uint64_t v45 = sub_253DEC51C(4.8151e-34);
      uint64_t v47 = sub_253DECAAC(v45, v46, &v98);
      sub_253DEC818(v47);
      sub_253DEC34C();
      *(_WORD *)(v44 + 12) = 2080;
      sub_253DF0D80();
      sub_253DEC5E4();
      if (v44)
      {
        sub_253DEBFE4(MEMORY[0x263F8EE78]);
        sub_253DEC274();
        do
        {
          sub_253BEFD38();
          v48();
          sub_253DF0DA0();
          sub_253BEFD20();
          v49();
          if ((sub_253DECB58() & 1) == 0)
          {
            sub_253DEBDF8(*(void *)(v43 + 16));
            uint64_t v43 = v99;
          }
          unint64_t v51 = *(void *)(v43 + 16);
          unint64_t v50 = *(void *)(v43 + 24);
          if (v51 >= v50 >> 1)
          {
            sub_253DEBE30(v50);
            uint64_t v43 = v99;
          }
          *(void *)(v43 + 16) = v51 + 1;
          sub_253DECF34(v43 + 16 * v51);
        }
        while (!v52);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v43 = MEMORY[0x263F8EE78];
      }
      v28[23] = v43;
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DEC924();
      uint64_t v77 = sub_253DEBF50();
      v28[24] = sub_253DEC364(v77, v78, &v98);
      sub_253DECBDC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v41, v42, "Invalid planner type (%s while populating toolbox. Possible values: [%s]", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v64 = sub_253C8F5F0();
    }
    else
    {
      sub_253DEC2DC();

      uint64_t v64 = sub_253C108C4();
    }
    ((void (*)(uint64_t))v38)(v64);
    sub_253DEA2A4();
    uint64_t v65 = (void *)sub_253C0FFC8();
    sub_253DEBF6C((uint64_t)v65, v79);
    swift_willThrow();
LABEL_25:
    sub_253DEC3AC();
    swift_bridgeObjectRetain();
    id v80 = v65;
    swift_bridgeObjectRetain();
    id v81 = v65;
    uint64_t v82 = (void *)sub_253DF2490();
    os_log_type_t v83 = sub_253DF56E0();
    BOOL v84 = sub_253DEC0C8(v83);
    uint64_t v85 = (void (*)(uint64_t, uint64_t))v28[41];
    uint64_t v86 = v28[38];
    uint64_t v87 = v28[36];
    if (v84)
    {
      uint64_t v88 = (_DWORD *)sub_253D7C924();
      sub_253D11A74();
      uint64_t v89 = sub_253C0FF74();
      sub_253DEC868(v89);
      *uint64_t v88 = 136315394;
      sub_253DECFA8();
      uint64_t v90 = sub_253DEC550();
      sub_253DEC874(v90);
      sub_253DEC0A0();
      sub_253DEC238();
      uint64_t v91 = _swift_stdlib_bridgeErrorToNSError();
      sub_253DEC6AC(v91);
      sub_253DED02C();

      sub_253DEC11C(&dword_253BD8000, v92, v93, "Could not populate %s's toolbox. Error: %@");
      sub_253BDEDD8(&qword_26B2519F0);
      sub_253DEC2F4();
      sub_253BDF910();
      sub_253DEBE54();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C0F824();
      v94();
    }
    else
    {
      sub_253DEC088();

      v85(v86, v87);
    }
    sub_253DECB70();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DEBF88();
    sub_253C10D50();
    __asm { BRAA            X1, X16 }
  }
  sub_253BEFD2C();
  v53();
  uint64_t v54 = static ToolboxManager.toolboxes()();
  sub_253DEC440(v54);
  swift_bridgeObjectRelease();
  if (!v28[5])
  {
    sub_253BEFAC0((uint64_t)(v28 + 2), &qword_269D7EEE0);
    sub_253DEA2A4();
    uint64_t v65 = (void *)sub_253C0FFC8();
    sub_253DEBDB8((uint64_t)v65, v66);
    sub_253BEFD5C();
    v67();
    goto LABEL_25;
  }
  uint64_t v55 = (void *)sub_253C108C4();
  memcpy(v55, v56, 0x50uLL);
  uint64_t v57 = v28[15];
  uint64_t v58 = v28[16];
  uint64_t v59 = (void *)sub_253C108C4();
  uint64_t v61 = sub_253BDF5F8(v59, v60);
  uint64_t v62 = v28[20];
  uint64_t v63 = sub_253BDF5F8(v28 + 17, v62);
  v28[42] = static StandardToolboxConfiguration.makeMutableToolboxWithNoClientActions<A, B>(delegate:planGenerationDelegate:)((uint64_t)v61, (uint64_t)v63, v57, v62, v58);
  uint64_t v68 = (void *)swift_task_alloc();
  v28[43] = v68;
  *uint64_t v68 = v28;
  v68[1] = sub_253DE05D0;
  sub_253C10D50();
  return MEMORY[0x270F3FC40](v69, v70, v71, v72, v73, v74, v75, v76, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_253DE05D0()
{
  sub_253BDF928();
  sub_253BDF7C8();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_253C0FA84();
  *uint64_t v5 = v4;
  *(void *)(v6 + 352) = v0;
  swift_task_dealloc();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_253DE06B0()
{
  uint64_t v1 = *(uint64_t **)(v0 + 224);
  sub_253DDB360();
  uint64_t v2 = sub_253DF57D0();
  swift_release();
  sub_253C0FDC8();
  v3();
  sub_253D110B8(v0 + 96);
  *uint64_t v1 = v2;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  return v4();
}

uint64_t sub_253DE07BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_253C10EE8();
  swift_release();
  sub_253BEFD20();
  v19();
  sub_253D110B8((uint64_t)(v18 + 12));
  uint64_t v20 = (void *)v18[44];
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  swift_bridgeObjectRetain();
  id v21 = v20;
  swift_bridgeObjectRetain();
  id v22 = v20;
  uint64_t v23 = (void *)sub_253DF2490();
  os_log_type_t v24 = sub_253DF56E0();
  if (sub_253C4A060(v24))
  {
    a12 = v18[38];
    a13 = v18[41];
    sub_253DECED0();
    a10 = v26;
    a11 = v25;
    uint64_t v27 = sub_253D7C924();
    sub_253D11A74();
    a14 = sub_253C0FF74();
    uint64_t v28 = sub_253DEC404(4.8151e-34);
    uint64_t v33 = sub_253DECA20(v28, v29, v30, v31, v32);
    sub_253DEC618(v33);
    sub_253DED128();
    *(_WORD *)(v27 + 12) = 2112;
    id v34 = v20;
    uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
    sub_253DEC5BC(v35);
    sub_253DECDE0();

    sub_253DDC470(&dword_253BD8000, v36, v37, "Could not populate %s's toolbox. Error: %@");
    sub_253BDEDD8(&qword_26B2519F0);
    sub_253DEBE54();
    sub_253BDF910();
    sub_253C10BF4();
    sub_253BDF910();
    sub_253BDF910();

    sub_253C0F824();
    v38();
  }
  else
  {
    uint64_t v39 = (void (*)(uint64_t, uint64_t))v18[41];
    uint64_t v40 = v18[38];
    uint64_t v41 = v18[36];
    sub_253DEC2DC();

    v39(v40, v41);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253DEC4BC();
  sub_253C10C94();
  return v43(v42, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

void sub_253DE0A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  sub_253C8F550();
  a17 = v18;
  a18 = v19;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v24 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v25 = sub_253BDF9FC(v24);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&a9 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_253DF5500();
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v27, 1, 1, v28);
  uint64_t v29 = sub_253C52058();
  *(void *)(v29 + 16) = v23;
  *(void *)(v29 + 24) = v21;
  sub_253DEFD20();
  swift_bridgeObjectRetain();
  sub_253DF55B0();
  swift_release();
  swift_release();
  uint64_t v30 = sub_253D7A0A8();
  sub_253BEFAC0(v30, v31);
  sub_253C8F44C();
}

uint64_t sub_253DE0B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[29] = a2;
  v3[30] = a3;
  v3[28] = a1;
  sub_253BDEDD8(&qword_26B2553E8);
  v3[31] = swift_task_alloc();
  uint64_t v4 = sub_253DF0DB0();
  v3[32] = v4;
  v3[33] = *(void *)(v4 - 8);
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  uint64_t v5 = sub_253DF24A0();
  v3[36] = v5;
  v3[37] = *(void *)(v5 - 8);
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE0CB0, 0, 0);
}

void sub_253DE0CB0()
{
  sub_253DEC3AC();
  sub_253DEBE18();
  uint64_t v1 = (void *)sub_253DF2490();
  os_log_type_t v2 = sub_253DF56C0();
  if (sub_253BDF95C(v2))
  {
    uint64_t v3 = v0[37];
    sub_253DEC038();
    uint64_t v4 = sub_253C0FF74();
    sub_253DEC868(v4);
    uint64_t v5 = sub_253DEBED8(4.8149e-34);
    uint64_t v7 = sub_253DEC538(v5, v6, &v62);
    sub_253DEBF34(v7);
    sub_253DF5820();
    sub_253DEC4A4();
    sub_253DEBDD8(&dword_253BD8000, v8, v9, "Deleting%s's toolbox.");
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v10 = *(void (**)(void))(v3 + 8);
    sub_253C1026C();
    v10();
  }
  else
  {
    uint64_t v11 = v0[37];
    sub_253DEC2DC();

    uint64_t v10 = *(void (**)(void))(v11 + 8);
    uint64_t v12 = sub_253C10BD8();
    ((void (*)(uint64_t))v10)(v12);
  }
  sub_253DED140();
  sub_253DEBEBC();
  if (sub_253DEBFC8() == 1)
  {
    uint64_t v13 = v0[39];
    sub_253BEFAC0(v0[31], &qword_26B2553E8);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    sub_253DEBE18();
    uint64_t v14 = (void *)sub_253DF2490();
    os_log_type_t v15 = sub_253DF56E0();
    if (sub_253DEC258(v15))
    {
      uint64_t v59 = v10;
      uint64_t v16 = (uint64_t)(v0 + 23);
      uint64_t v17 = sub_253D7C924();
      uint64_t v61 = sub_253D779E0();
      uint64_t v18 = sub_253DEC51C(4.8151e-34);
      uint64_t v20 = sub_253DECAAC(v18, v19, &v61);
      sub_253DEC818(v20);
      sub_253DEC34C();
      *(_WORD *)(v17 + 12) = 2080;
      sub_253DF0D80();
      sub_253DEC5E4();
      if (v17)
      {
        sub_253DEBFE4(MEMORY[0x263F8EE78]);
        sub_253DEC274();
        do
        {
          uint64_t v21 = v0[32];
          sub_253BEFD38();
          v22();
          sub_253DF0DA0();
          uint64_t v23 = sub_253DEBF1C();
          v24(v23);
          if ((sub_253DECB58() & 1) == 0)
          {
            sub_253DEBDF8(*(void *)(v16 + 16));
            uint64_t v16 = v62;
          }
          sub_253DEC0B8();
          if (v26)
          {
            sub_253DEBE30(v25);
            uint64_t v16 = v62;
          }
          *(void *)(v16 + 16) = v21;
          sub_253DECF34(v16 + 16 * (void)objc_release_x19);
        }
        while (!v27);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v16 = MEMORY[0x263F8EE78];
      }
      uint64_t v60 = v0[39];
      uint64_t v38 = v0[36];
      v0[23] = v16;
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DEC924();
      uint64_t v39 = sub_253DEBF50();
      v0[24] = sub_253DEC364(v39, v40, &v61);
      sub_253DECBDC();
      swift_bridgeObjectRelease();
      sub_253DEC2C0(&dword_253BD8000, v41, (os_log_type_t)v13, "Invalid planner type (%s while deleting toolbox. Possible values: [%s]");
      sub_253DEC460();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v33 = v60;
      uint64_t v34 = v38;
      uint64_t v10 = v59;
    }
    else
    {
      sub_253DEC2DC();

      uint64_t v33 = sub_253C108C4();
    }
    ((void (*)(uint64_t, uint64_t))v10)(v33, v34);
    sub_253DEA2A4();
    uint64_t v35 = (void *)sub_253C0FFC8();
    sub_253DEBF6C((uint64_t)v35, v42);
    swift_willThrow();
  }
  else
  {
    sub_253BEFD2C();
    v28();
    uint64_t v29 = static ToolboxManager.toolboxes()();
    sub_253DEBE9C(v29);
    swift_bridgeObjectRelease();
    if (v0[5])
    {
      sub_253DEC310(v0 + 12);
      uint64_t v30 = (void *)sub_253BEFD44();
      sub_253BDF5F8(v30, v31);
      sub_253DF31D0();
      sub_253C0FDBC();
      v32();
      sub_253D110B8((uint64_t)(v0 + 12));
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_253C0FDF8();
      goto LABEL_26;
    }
    sub_253BEFAC0((uint64_t)(v0 + 2), &qword_269D7EEE0);
    sub_253DEA2A4();
    uint64_t v35 = (void *)sub_253C0FFC8();
    sub_253DEBDB8((uint64_t)v35, v36);
    sub_253BEFD5C();
    v37();
  }
  sub_253DEC3AC();
  swift_bridgeObjectRetain();
  id v43 = v35;
  swift_bridgeObjectRetain();
  id v44 = v35;
  uint64_t v45 = (void *)sub_253DF2490();
  os_log_type_t v46 = sub_253DF56E0();
  BOOL v47 = sub_253DEC0C8(v46);
  uint64_t v48 = v0[38];
  uint64_t v49 = v0[36];
  if (v47)
  {
    unint64_t v50 = (_DWORD *)sub_253D7C924();
    sub_253D11A74();
    uint64_t v51 = sub_253C0FF74();
    sub_253DEC868(v51);
    _DWORD *v50 = 136315394;
    sub_253DECFA8();
    uint64_t v52 = sub_253DEC550();
    sub_253DEC874(v52);
    sub_253DEC0A0();
    sub_253DEC238();
    uint64_t v53 = _swift_stdlib_bridgeErrorToNSError();
    sub_253DEC6AC(v53);
    sub_253DED02C();

    sub_253DEC11C(&dword_253BD8000, v54, v55, "Could not delete %s's toolbox. Error: %@");
    sub_253BDEDD8(&qword_26B2519F0);
    sub_253DEC2F4();
    sub_253BDF910();
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    sub_253C0F824();
    v56();
  }
  else
  {
    sub_253DEC088();

    ((void (*)(uint64_t, uint64_t))v10)(v48, v49);
  }
  sub_253DECB70();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253DEBF88();
LABEL_26:
  sub_253C10D50();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_253DE1324()
{
  sub_253C8F550();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = _Block_copy(v6);
  uint64_t v8 = sub_253DF5270();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = v5;
  v1(v8, v10, v3, v11);

  swift_bridgeObjectRelease();
  sub_253C8F44C();
  return swift_release();
}

void sub_253DE13D8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_253BDEDD8(&qword_26B2519C8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253C2E770(a1, (uint64_t)v8, &qword_26B2519C8);
  uint64_t v9 = sub_253DEFD20();
  uint64_t v10 = 0;
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v8, 1, v9) != 1)
  {
    uint64_t v10 = (void *)sub_253DEFD10();
    (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  if (a2) {
    a2 = (void *)sub_253DEFD00();
  }
  (*(void (**)(uint64_t, void *, void *))(a3 + 16))(a3, v10, a2);
}

void sub_253DE1504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_253C1CED0();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v42 = v27;
  uint64_t v43 = v28;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v37 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v38 = sub_253BDF9FC(v37);
  MEMORY[0x270FA5388](v38);
  uint64_t v39 = sub_253DEBD90();
  sub_253C0FF54(v39);
  uint64_t v40 = sub_253C52058();
  *(void *)(v40 + 16) = a21;
  *(void *)(v40 + 24) = a22;
  uint64_t v41 = (void *)swift_allocObject();
  v41[2] = v36;
  v41[3] = v34;
  v41[4] = v24;
  v41[5] = v32;
  v41[6] = v30;
  v41[7] = v42;
  v41[8] = v43;
  v41[9] = v26;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253BDEDD8(&qword_269D7EF60);
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v22, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DE1668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[40] = a8;
  v8[41] = v16;
  v8[38] = a6;
  v8[39] = a7;
  v8[36] = a4;
  v8[37] = a5;
  v8[34] = a2;
  v8[35] = a3;
  v8[33] = a1;
  uint64_t v9 = sub_253DF4BE0();
  v8[42] = v9;
  v8[43] = *(void *)(v9 - 8);
  v8[44] = swift_task_alloc();
  uint64_t v10 = sub_253DF00D0();
  v8[45] = v10;
  v8[46] = *(void *)(v10 - 8);
  v8[47] = swift_task_alloc();
  uint64_t v11 = sub_253DF46F0();
  v8[48] = v11;
  v8[49] = *(void *)(v11 - 8);
  v8[50] = swift_task_alloc();
  sub_253DF42A0();
  v8[51] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2519C8);
  v8[52] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v8[53] = swift_task_alloc();
  uint64_t v12 = sub_253DF0DB0();
  v8[54] = v12;
  v8[55] = *(void *)(v12 - 8);
  v8[56] = swift_task_alloc();
  v8[57] = swift_task_alloc();
  uint64_t v13 = sub_253DF24A0();
  v8[58] = v13;
  v8[59] = *(void *)(v13 - 8);
  v8[60] = swift_task_alloc();
  v8[61] = swift_task_alloc();
  v8[62] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE1968, 0, 0);
}

uint64_t sub_253DE1968()
{
  uint64_t v127 = v0;
  uint64_t v1 = v0;
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = (void *)sub_253DF2490();
  os_log_type_t v3 = sub_253DF56C0();
  unint64_t v124 = v0;
  if (sub_253BDF95C(v3))
  {
    uint64_t v4 = v0[59];
    uint64_t v119 = v0[58];
    uint64_t v121 = v0[62];
    sub_253DEC038();
    v126[0] = sub_253C0FF74();
    uint64_t v5 = sub_253DEBED8(4.8149e-34);
    v0[32] = sub_253DEC538(v5, v6, v126);
    uint64_t v1 = v0;
    sub_253DF5820();
    sub_253DEC4A4();
    sub_253DEBDD8(&dword_253BD8000, v7, v8, "Querying%s's toolbox.");
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v9 = *(void (**)(void))(v4 + 8);
    ((void (*)(uint64_t, uint64_t))v9)(v121, v119);
  }
  else
  {
    uint64_t v10 = v0[59];
    swift_bridgeObjectRelease_n();

    uint64_t v9 = *(void (**)(void))(v10 + 8);
    uint64_t v11 = sub_253D7A0A8();
    ((void (*)(uint64_t, uint64_t))v9)(v11, v12);
  }
  uint64_t v14 = v1[53];
  uint64_t v13 = v1[54];
  swift_bridgeObjectRetain();
  sub_253DF0D90();
  uint64_t v108 = v9;
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v14, 1, v13) == 1)
  {
    uint64_t v15 = v1[61];
    sub_253BEFAC0(v1[53], &qword_26B2553E8);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_253DF2490();
    os_log_type_t v17 = sub_253DF56E0();
    if (sub_253DECA90(v17))
    {
      uint64_t v18 = v1[34];
      unint64_t v19 = v1[35];
      uint64_t v20 = sub_253D7C924();
      v125[0] = sub_253D779E0();
      *(_DWORD *)uint64_t v20 = 136315394;
      swift_bridgeObjectRetain();
      v1[29] = sub_253D8E5FC(v18, v19, v125);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v21 = sub_253DF0D80();
      uint64_t v22 = *(void *)(v21 + 16);
      if (v22)
      {
        uint64_t v114 = v20;
        uint64_t v23 = v1[55];
        v126[0] = MEMORY[0x263F8EE78];
        sub_253DEC008();
        sub_253C11244();
        uint64_t v25 = v21 + v24;
        uint64_t v120 = *(void *)(v23 + 72);
        uint64_t v122 = v26;
        do
        {
          uint64_t v27 = sub_253C108C4();
          v122(v27);
          uint64_t v28 = sub_253DF0DA0();
          uint64_t v30 = v29;
          sub_253C0FDD4();
          v31();
          uint64_t v32 = v126[0];
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_253DEBF98(isUniquelyReferenced_nonNull_native, *(void *)(v32 + 16) + 1);
            uint64_t v32 = v126[0];
          }
          unint64_t v35 = *(void *)(v32 + 16);
          unint64_t v34 = *(void *)(v32 + 24);
          if (v35 >= v34 >> 1)
          {
            sub_253DC6918(v34 > 1, v35 + 1, 1);
            uint64_t v32 = v126[0];
          }
          *(void *)(v32 + 16) = v35 + 1;
          uint64_t v36 = v32 + 16 * v35;
          *(void *)(v36 + 32) = v28;
          *(void *)(v36 + 40) = v30;
          v25 += v120;
          --v22;
        }
        while (v22);
        swift_bridgeObjectRelease();
        uint64_t v1 = v124;
        uint64_t v20 = v114;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v32 = MEMORY[0x263F8EE78];
      }
      v1[27] = v32;
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DF5240();
      uint64_t v84 = sub_253DEBF50();
      v1[28] = sub_253DEC364(v84, v85, v125);
      sub_253DF5820();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v16, (os_log_type_t)v15, "Invalid planner type (%s while querying toolbox. Possible values: [%s]", (uint8_t *)v20, 0x16u);
      sub_253DEC460();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v72 = sub_253C8F5F0();
      uint64_t v9 = v108;
    }
    else
    {
      uint64_t v70 = v1[61];
      uint64_t v71 = v1[58];
      swift_bridgeObjectRelease_n();

      uint64_t v72 = v70;
      uint64_t v73 = v71;
    }
    ((void (*)(uint64_t, uint64_t))v9)(v72, v73);
    sub_253DEA2A4();
    uint64_t v74 = (void *)sub_253C0FFC8();
    sub_253DECD90((uint64_t)v74, v86);
    swift_willThrow();
    goto LABEL_33;
  }
  sub_253BEFD2C();
  v37();
  static ToolboxManager.toolboxes()();
  sub_253D7A0A8();
  sub_253D7F39C(v38, v39);
  swift_bridgeObjectRelease();
  if (!v1[5])
  {
    sub_253BEFAC0((uint64_t)(v1 + 2), &qword_269D7EEE0);
    sub_253DEA2A4();
    uint64_t v74 = (void *)sub_253C0FFC8();
    sub_253DEBDB8((uint64_t)v74, v75);
    sub_253C0FFA4();
    v76();
LABEL_33:
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain();
    id v87 = v74;
    swift_bridgeObjectRetain();
    id v88 = v74;
    uint64_t v89 = (void *)sub_253DF2490();
    os_log_type_t v90 = sub_253DF56E0();
    BOOL v91 = sub_253C4A060(v90);
    unint64_t v92 = v1[35];
    if (v91)
    {
      uint64_t v93 = v124[34];
      uint64_t v94 = sub_253D7C924();
      unint64_t v95 = (void *)sub_253D11A74();
      v126[0] = sub_253C0FF74();
      *(_DWORD *)uint64_t v94 = 136315394;
      swift_bridgeObjectRetain();
      v124[31] = sub_253D8E5FC(v93, v92, v126);
      sub_253DF5820();
      sub_253DEC0A0();
      *(_WORD *)(v94 + 12) = 2112;
      id v96 = v74;
      uint64_t v97 = _swift_stdlib_bridgeErrorToNSError();
      v124[30] = v97;
      sub_253DF5820();
      *unint64_t v95 = v97;

      sub_253DDC470(&dword_253BD8000, v98, v99, "Could not query %s's toolbox. Error: %@");
      sub_253BDEDD8(&qword_26B2519F0);
      sub_253DEBE54();
      sub_253BDF910();
      sub_253D7CC68();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C0F824();
      v100();
    }
    else
    {
      sub_253DEC088();

      sub_253D7A0A8();
      sub_253C0F824();
      v9();
    }
    swift_willThrow();
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
    sub_253BDF8DC();
    goto LABEL_37;
  }
  uint64_t v40 = (uint64_t)(v1 + 12);
  uint64_t v41 = v1[36];
  sub_253DEC310(v1 + 12);
  uint64_t v42 = *(void *)(v41 + 16);
  uint64_t v107 = (uint64_t)(v1 + 12);
  if (!v42)
  {
LABEL_29:
    sub_253BDF5F8(v1 + 17, v1[20]);
    sub_253C0E430(v40, (uint64_t)(v1 + 22));
    sub_253BE1888();
    swift_task_alloc();
    sub_253BEFD38();
    v78(v77);
    uint64_t v79 = sub_253DEFD20();
    sub_253C0FF54(v79);
    uint64_t v80 = sub_253DF4A40();
    uint64_t v81 = sub_253DF4A30();
    sub_253DF33C0();
    v125[3] = v80;
    v125[4] = MEMORY[0x263F4E180];
    v125[0] = v81;
    uint64_t v82 = sub_253DF3A90();
    uint64_t v83 = sub_253DF3A80();
    v126[3] = v82;
    v126[4] = MEMORY[0x263F4DC98];
    v126[0] = v83;
    sub_253DF4240();
    sub_253DF3390();
    swift_task_dealloc();
    uint64_t v101 = sub_253DF3360();
    uint64_t v113 = (uint64_t *)v1[33];
    uint64_t v102 = swift_task_alloc();
    *(void *)(v102 + 16) = v107;
    uint64_t v103 = sub_253C57B38((uint64_t (*)(void))sub_253DEB56C, v102, v101);
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    sub_253BEFD20();
    v105(v104);
    sub_253D110B8(v107);
    *uint64_t v113 = v103;
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
    sub_253C0FDF8();
LABEL_37:
    return v106();
  }
  uint64_t v43 = v1[43];
  v126[0] = MEMORY[0x263F8EE78];
  sub_253DC7554(0, v42, 0);
  uint64_t result = sub_253DEB82C(v41);
  int64_t v46 = result;
  uint64_t v115 = v41 + 56;
  char v48 = v47 & 1;
  unsigned int v111 = *MEMORY[0x263F80548];
  unsigned int v112 = *MEMORY[0x263F80760];
  uint64_t v110 = (void (**)(uint64_t *, void, uint64_t))(v43 + 104);
  uint64_t v109 = v41;
  while ((v46 & 0x8000000000000000) == 0 && v46 < 1 << *(unsigned char *)(v41 + 32))
  {
    if (((*(void *)(v115 + (((unint64_t)v46 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v46) & 1) == 0) {
      goto LABEL_41;
    }
    if (*(_DWORD *)(v41 + 36) != v45) {
      goto LABEL_42;
    }
    char v123 = v48;
    int v116 = v45;
    uint64_t v117 = v42;
    uint64_t v49 = (uint64_t *)v1[44];
    uint64_t v118 = v1[42];
    uint64_t v50 = sub_253DF4C30();
    uint64_t v51 = swift_allocBox();
    uint64_t v53 = v52;
    sub_253DF4C20();
    uint64_t v54 = swift_allocBox();
    sub_253C0FA90();
    (*(void (**)(uint64_t))(v55 + 104))(v56);
    *uint64_t v53 = v54;
    sub_253C0FA90();
    (*(void (**)(uint64_t *, void, uint64_t))(v57 + 104))(v53, v112, v50);
    *uint64_t v49 = v51;
    (*v110)(v49, v111, v118);
    swift_bridgeObjectRetain_n();
    sub_253DF00B0();
    ClientAction.Definition.toolDefinition.getter();
    sub_253BEFBCC();
    v59(v58);
    swift_bridgeObjectRelease();
    uint64_t v60 = v126[0];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      char v61 = sub_253DED064();
      sub_253DC7554(v61, v62, v63);
      uint64_t v60 = v126[0];
    }
    uint64_t v1 = v124;
    uint64_t v41 = v109;
    unint64_t v65 = *(void *)(v60 + 16);
    unint64_t v64 = *(void *)(v60 + 24);
    if (v65 >= v64 >> 1)
    {
      sub_253DC7554(v64 > 1, v65 + 1, 1);
      uint64_t v60 = v126[0];
    }
    uint64_t v66 = v124[36];
    *(void *)(v60 + 16) = v65 + 1;
    sub_253C11244();
    sub_253C10134();
    v68(v67);
    v126[0] = v60;
    uint64_t result = sub_253DEB3BC(v46, v116, v123 & 1, v66);
    int64_t v46 = result;
    char v48 = v69 & 1;
    uint64_t v42 = v117 - 1;
    if (v117 == 1)
    {
      sub_253D76398(result, v45, v48);
      uint64_t v40 = v107;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_253DE27A0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v60 = a3;
  uint64_t v56 = a2;
  uint64_t v4 = sub_253DF24A0();
  uint64_t v48 = *(void *)(v4 - 8);
  uint64_t v49 = v4;
  MEMORY[0x270FA5388](v4);
  char v47 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_253DF5010();
  uint64_t v54 = *(void *)(v6 - 8);
  uint64_t v55 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v53 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_253BDEDD8(&qword_269D7EF88);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v52 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_253DF3AC0();
  uint64_t v46 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v45 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_253DF46F0();
  uint64_t v11 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_253BDEDD8(&qword_269D7EF90);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_253DF3B10();
  uint64_t v51 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v50 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_253BDEDD8(&qword_269D7EF98);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_253DF2A30();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253C0E430(a1, (uint64_t)v61);
  sub_253BDEDD8(&qword_269D7EFA0);
  if (swift_dynamicCast())
  {
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v20, 0, 1, v21);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
    sub_253DF2A20();
    sub_253DF2A10();
    sub_253DF46C0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v59);
    id v25 = objc_allocWithZone((Class)sub_253DF0CE0());
    uint64_t v26 = sub_253DF0CD0();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  else
  {
    uint64_t v28 = v13;
    uint64_t v29 = v59;
    _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v20, 1, 1, v21);
    sub_253BEFAC0((uint64_t)v20, &qword_269D7EF98);
    sub_253C0E430(a1, (uint64_t)v61);
    uint64_t v30 = v58;
    if (swift_dynamicCast())
    {
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v16, 0, 1, v30);
      uint64_t v32 = v50;
      uint64_t v31 = v51;
      (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v50, v16, v30);
      sub_253DF3B00();
      sub_253BDF5F8(v56, v56[3]);
      uint64_t v33 = v53;
      sub_253DF3AF0();
      sub_253DF31B0();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v33, v55);
      id v34 = objc_allocWithZone((Class)sub_253DF0CE0());
      uint64_t v26 = sub_253DF0CD0();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v32, v30);
    }
    else
    {
      _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0((uint64_t)v16, 1, 1, v30);
      sub_253BEFAC0((uint64_t)v16, &qword_269D7EF90);
      sub_253C0E430(a1, (uint64_t)v61);
      uint64_t v35 = (uint64_t)v52;
      uint64_t v36 = v57;
      if (swift_dynamicCast())
      {
        _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v35, 0, 1, v36);
        uint64_t v37 = v46;
        uint64_t v38 = v45;
        (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v45, v35, v36);
        sub_253DF3AB0();
        sub_253DF3AA0();
        sub_253DF46C0();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v28, v29);
        id v39 = objc_allocWithZone((Class)sub_253DF0CE0());
        uint64_t v26 = sub_253DF0CD0();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v38, v36);
      }
      else
      {
        _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v35, 1, 1, v36);
        sub_253BEFAC0(v35, &qword_269D7EF88);
        uint64_t v40 = v47;
        sub_253DF1700();
        uint64_t v41 = sub_253DF2490();
        os_log_type_t v42 = sub_253DF56E0();
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v43 = 0;
          _os_log_impl(&dword_253BD8000, v41, v42, "Incorrect ToolBoxResult", v43, 2u);
          MEMORY[0x25A2709B0](v43, -1, -1);
        }

        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v40, v49);
        uint64_t v26 = 0;
      }
    }
  }
  *uint64_t v60 = v26;
  return result;
}

void sub_253DE3100(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (a1)
  {
    sub_253DF0CE0();
    uint64_t v5 = (void *)sub_253DF5390();
  }
  if (a2) {
    uint64_t v6 = sub_253DEFD00();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

uint64_t sub_253DE319C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[32] = a5;
  v6[33] = a6;
  v6[30] = a3;
  v6[31] = a4;
  v6[28] = a1;
  v6[29] = a2;
  uint64_t v7 = sub_253DF46F0();
  v6[34] = v7;
  v6[35] = *(void *)(v7 - 8);
  v6[36] = swift_task_alloc();
  uint64_t v8 = sub_253DF2A30();
  v6[37] = v8;
  v6[38] = *(void *)(v8 - 8);
  v6[39] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v6[40] = swift_task_alloc();
  uint64_t v9 = sub_253DF0DB0();
  v6[41] = v9;
  v6[42] = *(void *)(v9 - 8);
  v6[43] = swift_task_alloc();
  v6[44] = swift_task_alloc();
  uint64_t v10 = sub_253DF24A0();
  v6[45] = v10;
  v6[46] = *(void *)(v10 - 8);
  v6[47] = swift_task_alloc();
  v6[48] = swift_task_alloc();
  v6[49] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE33D4, 0, 0);
}

uint64_t sub_253DE33D4()
{
  sub_253C2F5A0();
  uint64_t v89 = v0;
  sub_253DEC3AC();
  sub_253DEBE18();
  uint64_t v2 = (void *)sub_253DF2490();
  os_log_type_t v3 = sub_253DF56C0();
  if (sub_253BDF95C(v3))
  {
    uint64_t v4 = v0[46];
    uint64_t v85 = v0[45];
    uint64_t v86 = v0[49];
    uint64_t v1 = sub_253DEC038();
    uint64_t v5 = sub_253C0FF74();
    sub_253DED11C(v5);
    uint64_t v6 = sub_253DEBED8(4.8149e-34);
    uint64_t v8 = sub_253DEC538(v6, v7, v88);
    sub_253DEBF34(v8);
    sub_253DF5820();
    sub_253DEC4A4();
    sub_253DEBDD8(&dword_253BD8000, v9, v10, "Querying%s's toolbox.");
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v13 = *(void (**)(void))(v4 + 8);
    uint64_t v11 = (char *)(v4 + 8);
    uint64_t v12 = (uint64_t)v13;
    sub_253C1026C();
    v13();
  }
  else
  {
    uint64_t v11 = (char *)v0[45];
    uint64_t v14 = v0[46];
    sub_253DEC2DC();

    uint64_t v12 = *(void *)(v14 + 8);
    uint64_t v15 = sub_253C10BD8();
    ((void (*)(uint64_t))v12)(v15);
  }
  sub_253DED140();
  sub_253DEBEBC();
  if (sub_253DEBFC8() == 1)
  {
    uint64_t v16 = v0[48];
    sub_253BEFAC0(v0[40], &qword_26B2553E8);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    sub_253DEBE18();
    uint64_t v17 = (void *)sub_253DF2490();
    os_log_type_t v18 = sub_253DF56E0();
    if (sub_253DEC258(v18))
    {
      LODWORD(v81) = v16;
      uint64_t v82 = v12;
      uint64_t v19 = sub_253D7C924();
      uint64_t v80 = sub_253D779E0();
      uint64_t v87 = v80;
      uint64_t v20 = sub_253DEC51C(4.8151e-34);
      uint64_t v22 = sub_253DECAAC(v20, v21, &v87);
      sub_253DEC7F0(v22);
      sub_253DEC34C();
      *(_WORD *)(v19 + 12) = 2080;
      sub_253DF0D80();
      sub_253DEC5E4();
      if (v19)
      {
        uint64_t v78 = (uint64_t)v17;
        v88[0] = MEMORY[0x263F8EE78];
        sub_253DEC008();
        sub_253DEC1C0();
        do
        {
          sub_253BEFD38();
          v23();
          sub_253DF0DA0();
          uint64_t v24 = sub_253DEBF1C();
          v25(v24);
          uint64_t v12 = v88[0];
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_253DEBF98(isUniquelyReferenced_nonNull_native, *(void *)(v12 + 16) + 1);
            uint64_t v12 = v88[0];
          }
          sub_253DEC0B8();
          if (v28)
          {
            sub_253DECB10(v27);
            uint64_t v12 = v88[0];
          }
          sub_253DEC6F0();
        }
        while (!v29);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = MEMORY[0x263F8EE78];
      }
      sub_253DEC7D4();
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DEBEF8();
      uint64_t v38 = sub_253DEBF50();
      uint64_t v40 = sub_253DEC364(v38, v39, &v87);
      sub_253DEC8C4(v40);
      swift_bridgeObjectRelease();
      sub_253DEC2C0(&dword_253BD8000, v41, (os_log_type_t)v16, "Invalid planner type (%s while querying toolbox. Possible values: [%s]");
      sub_253DEC460();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v34 = sub_253DECFF8(v42, v43, v44, v45, v46, v47, v48, v49, v76, v77, v78, v79, (uint64_t)(v0 + 24), v80, v81, v19, v82, (uint64_t)(v0 + 25), v84,
              v85,
              v86);
    }
    else
    {
      sub_253DEC2DC();

      uint64_t v34 = sub_253C108C4();
    }
    ((void (*)(uint64_t))v12)(v34);
    sub_253DEA2A4();
    uint64_t v32 = (void *)sub_253C0FFC8();
    sub_253DEBF6C((uint64_t)v32, v50);
    swift_willThrow();
    goto LABEL_24;
  }
  sub_253BEFD2C();
  v30();
  uint64_t v31 = static ToolboxManager.toolboxes()();
  sub_253DEBE9C(v31);
  swift_bridgeObjectRelease();
  if (!v0[5])
  {
    sub_253BEFAC0((uint64_t)(v0 + 2), &qword_269D7EEE0);
    sub_253DEA2A4();
    uint64_t v32 = (void *)sub_253C0FFC8();
    sub_253DEBDB8((uint64_t)v32, v35);
    uint64_t v36 = sub_253DEBFB0();
    v37(v36);
    goto LABEL_24;
  }
  sub_253DEC1EC();
  sub_253DEBD30();
  uint64_t v32 = v11;
  if (v11)
  {
    sub_253C0F824();
    v33();
    sub_253D110B8(v1);
LABEL_24:
    sub_253DEC3AC();
    swift_bridgeObjectRetain();
    id v51 = v32;
    swift_bridgeObjectRetain();
    id v52 = v32;
    uint64_t v53 = (void *)sub_253DF2490();
    os_log_type_t v54 = sub_253DF56E0();
    BOOL v55 = sub_253DEC0C8(v54);
    unint64_t v56 = v0[30];
    if (v55)
    {
      uint64_t v57 = v0[29];
      uint64_t v58 = v32;
      uint64_t v59 = (_DWORD *)sub_253D7C924();
      sub_253D11A74();
      uint64_t v60 = sub_253C0FF74();
      sub_253DED11C(v60);
      *uint64_t v59 = 136315394;
      sub_253DECFA8();
      uint64_t v61 = sub_253D8E5FC(v57, v56, v88);
      sub_253DEC89C(v61);
      sub_253DEC0A0();
      sub_253DEC238();
      uint64_t v62 = _swift_stdlib_bridgeErrorToNSError();
      sub_253DEC684(v62);
      sub_253DED02C();

      sub_253DEC11C(&dword_253BD8000, v63, v64, "Could not query %s's toolbox. Error: %@");
      sub_253BDEDD8(&qword_26B2519F0);
      sub_253DEC2F4();
      sub_253BDF910();
      sub_253DEBE54();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C0F824();
      v65();
    }
    else
    {
      sub_253DEC088();

      sub_253C0F824();
      ((void (*)(void))v12)();
    }
    sub_253DEC478();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DEBF88();
    goto LABEL_28;
  }
  sub_253DECEA8();
  uint64_t v68 = *(void *)(sub_253DF3380() + 16);
  uint64_t v83 = v1;
  if (v68)
  {
    v88[0] = MEMORY[0x263F8EE78];
    sub_253DF59D0();
    sub_253DEC054();
    do
    {
      sub_253BEFD38();
      v69();
      sub_253DF2A20();
      sub_253DF2A10();
      sub_253DF46C0();
      sub_253BEFBCC();
      v70();
      id v71 = objc_allocWithZone((Class)sub_253DF0CE0());
      sub_253DECD54();
      sub_253C0FDBC();
      v72();
      sub_253DF59B0();
      sub_253DF59E0();
      sub_253DF59F0();
      sub_253DF59C0();
      v11 += v84;
      --v68;
    }
    while (v68);
    uint64_t v73 = v88[0];
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v73 = MEMORY[0x263F8EE78];
  }
  uint64_t v74 = (uint64_t *)v0[28];
  sub_253C0F824();
  v75();
  sub_253D110B8(v83);
  *uint64_t v74 = v73;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
LABEL_28:
  return v66();
}

void sub_253DE3CD0()
{
  sub_253C1CED0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v15 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v16 = sub_253BDF9FC(v15);
  MEMORY[0x270FA5388](v16);
  uint64_t v17 = sub_253DEBD90();
  sub_253C0FF54(v17);
  uint64_t v18 = sub_253C52058();
  *(void *)(v18 + 16) = v4;
  *(void *)(v18 + 24) = v2;
  uint64_t v19 = (void *)swift_allocObject();
  long long v19[2] = v14;
  v19[3] = v12;
  v19[4] = v10;
  v19[5] = v8;
  v19[6] = v6;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253BDEDD8(&qword_269D7EF60);
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v0, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DE3E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[32] = a5;
  v6[33] = a6;
  v6[30] = a3;
  v6[31] = a4;
  v6[28] = a1;
  v6[29] = a2;
  uint64_t v7 = sub_253DF46F0();
  v6[34] = v7;
  v6[35] = *(void *)(v7 - 8);
  v6[36] = swift_task_alloc();
  uint64_t v8 = sub_253DF2A30();
  v6[37] = v8;
  v6[38] = *(void *)(v8 - 8);
  v6[39] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v6[40] = swift_task_alloc();
  uint64_t v9 = sub_253DF0DB0();
  v6[41] = v9;
  v6[42] = *(void *)(v9 - 8);
  v6[43] = swift_task_alloc();
  v6[44] = swift_task_alloc();
  uint64_t v10 = sub_253DF24A0();
  v6[45] = v10;
  v6[46] = *(void *)(v10 - 8);
  v6[47] = swift_task_alloc();
  v6[48] = swift_task_alloc();
  v6[49] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE4038, 0, 0);
}

uint64_t sub_253DE4038()
{
  sub_253C2F5A0();
  uint64_t v89 = v0;
  sub_253DEC3AC();
  sub_253DEBE18();
  uint64_t v2 = (void *)sub_253DF2490();
  os_log_type_t v3 = sub_253DF56C0();
  if (sub_253BDF95C(v3))
  {
    uint64_t v4 = v0[46];
    uint64_t v85 = v0[45];
    uint64_t v86 = v0[49];
    uint64_t v1 = sub_253DEC038();
    uint64_t v5 = sub_253C0FF74();
    sub_253DED11C(v5);
    uint64_t v6 = sub_253DEBED8(4.8149e-34);
    uint64_t v8 = sub_253DEC538(v6, v7, v88);
    sub_253DEBF34(v8);
    sub_253DF5820();
    sub_253DEC4A4();
    sub_253DEBDD8(&dword_253BD8000, v9, v10, "Querying%s's toolbox.");
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v13 = *(void (**)(void))(v4 + 8);
    uint64_t v11 = (char *)(v4 + 8);
    uint64_t v12 = (uint64_t)v13;
    sub_253C1026C();
    v13();
  }
  else
  {
    uint64_t v11 = (char *)v0[45];
    uint64_t v14 = v0[46];
    sub_253DEC2DC();

    uint64_t v12 = *(void *)(v14 + 8);
    uint64_t v15 = sub_253C10BD8();
    ((void (*)(uint64_t))v12)(v15);
  }
  sub_253DED140();
  sub_253DEBEBC();
  if (sub_253DEBFC8() == 1)
  {
    uint64_t v16 = v0[48];
    sub_253BEFAC0(v0[40], &qword_26B2553E8);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    sub_253DEBE18();
    uint64_t v17 = (void *)sub_253DF2490();
    os_log_type_t v18 = sub_253DF56E0();
    if (sub_253DEC258(v18))
    {
      LODWORD(v81) = v16;
      uint64_t v82 = v12;
      uint64_t v19 = sub_253D7C924();
      uint64_t v80 = sub_253D779E0();
      uint64_t v87 = v80;
      uint64_t v20 = sub_253DEC51C(4.8151e-34);
      uint64_t v22 = sub_253DECAAC(v20, v21, &v87);
      sub_253DEC7F0(v22);
      sub_253DEC34C();
      *(_WORD *)(v19 + 12) = 2080;
      sub_253DF0D80();
      sub_253DEC5E4();
      if (v19)
      {
        uint64_t v78 = (uint64_t)v17;
        v88[0] = MEMORY[0x263F8EE78];
        sub_253DEC008();
        sub_253DEC1C0();
        do
        {
          sub_253BEFD38();
          v23();
          sub_253DF0DA0();
          uint64_t v24 = sub_253DEBF1C();
          v25(v24);
          uint64_t v12 = v88[0];
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_253DEBF98(isUniquelyReferenced_nonNull_native, *(void *)(v12 + 16) + 1);
            uint64_t v12 = v88[0];
          }
          sub_253DEC0B8();
          if (v28)
          {
            sub_253DECB10(v27);
            uint64_t v12 = v88[0];
          }
          sub_253DEC6F0();
        }
        while (!v29);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = MEMORY[0x263F8EE78];
      }
      sub_253DEC7D4();
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      sub_253DEBEF8();
      uint64_t v38 = sub_253DEBF50();
      uint64_t v40 = sub_253DEC364(v38, v39, &v87);
      sub_253DEC8C4(v40);
      swift_bridgeObjectRelease();
      sub_253DEC2C0(&dword_253BD8000, v41, (os_log_type_t)v16, "Invalid planner type (%s while querying toolbox. Possible values: [%s]");
      sub_253DEC460();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v34 = sub_253DECFF8(v42, v43, v44, v45, v46, v47, v48, v49, v76, v77, v78, v79, (uint64_t)(v0 + 24), v80, v81, v19, v82, (uint64_t)(v0 + 25), v84,
              v85,
              v86);
    }
    else
    {
      sub_253DEC2DC();

      uint64_t v34 = sub_253C108C4();
    }
    ((void (*)(uint64_t))v12)(v34);
    sub_253DEA2A4();
    uint64_t v32 = (void *)sub_253C0FFC8();
    sub_253DEBF6C((uint64_t)v32, v50);
    swift_willThrow();
    goto LABEL_24;
  }
  sub_253BEFD2C();
  v30();
  uint64_t v31 = static ToolboxManager.toolboxes()();
  sub_253DEBE9C(v31);
  swift_bridgeObjectRelease();
  if (!v0[5])
  {
    sub_253BEFAC0((uint64_t)(v0 + 2), &qword_269D7EEE0);
    sub_253DEA2A4();
    uint64_t v32 = (void *)sub_253C0FFC8();
    sub_253DEBDB8((uint64_t)v32, v35);
    uint64_t v36 = sub_253DEBFB0();
    v37(v36);
    goto LABEL_24;
  }
  sub_253DEC1EC();
  sub_253DEBD30();
  uint64_t v32 = v11;
  if (v11)
  {
    sub_253C0F824();
    v33();
    sub_253D110B8(v1);
LABEL_24:
    sub_253DEC3AC();
    swift_bridgeObjectRetain();
    id v51 = v32;
    swift_bridgeObjectRetain();
    id v52 = v32;
    uint64_t v53 = (void *)sub_253DF2490();
    os_log_type_t v54 = sub_253DF56E0();
    BOOL v55 = sub_253DEC0C8(v54);
    unint64_t v56 = v0[30];
    if (v55)
    {
      uint64_t v57 = v0[29];
      uint64_t v58 = v32;
      uint64_t v59 = (_DWORD *)sub_253D7C924();
      sub_253D11A74();
      uint64_t v60 = sub_253C0FF74();
      sub_253DED11C(v60);
      *uint64_t v59 = 136315394;
      sub_253DECFA8();
      uint64_t v61 = sub_253D8E5FC(v57, v56, v88);
      sub_253DEC89C(v61);
      sub_253DEC0A0();
      sub_253DEC238();
      uint64_t v62 = _swift_stdlib_bridgeErrorToNSError();
      sub_253DEC684(v62);
      sub_253DED02C();

      sub_253DEC11C(&dword_253BD8000, v63, v64, "Could not query %s's toolbox. Error: %@");
      sub_253BDEDD8(&qword_26B2519F0);
      sub_253DEC2F4();
      sub_253BDF910();
      sub_253DEBE54();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C0F824();
      v65();
    }
    else
    {
      sub_253DEC088();

      sub_253C0F824();
      ((void (*)(void))v12)();
    }
    sub_253DEC478();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DEBF88();
    goto LABEL_28;
  }
  sub_253DECEA8();
  uint64_t v68 = *(void *)(sub_253DF3370() + 16);
  uint64_t v83 = v1;
  if (v68)
  {
    v88[0] = MEMORY[0x263F8EE78];
    sub_253DF59D0();
    sub_253DEC054();
    do
    {
      sub_253BEFD38();
      v69();
      sub_253DF2A20();
      sub_253DF2A10();
      sub_253DF46C0();
      sub_253BEFBCC();
      v70();
      id v71 = objc_allocWithZone((Class)sub_253DF0CE0());
      sub_253DECD54();
      sub_253C0FDBC();
      v72();
      sub_253DF59B0();
      sub_253DF59E0();
      sub_253DF59F0();
      sub_253DF59C0();
      v11 += v84;
      --v68;
    }
    while (v68);
    uint64_t v73 = v88[0];
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v73 = MEMORY[0x263F8EE78];
  }
  uint64_t v74 = (uint64_t *)v0[28];
  sub_253C0F824();
  v75();
  sub_253D110B8(v83);
  *uint64_t v74 = v73;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
LABEL_28:
  return v66();
}

void sub_253DE4934()
{
  sub_253C8F550();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v9 = sub_253BDF9FC(v8);
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_253DEBD90();
  sub_253C0FF54(v10);
  uint64_t v11 = sub_253C52058();
  *(void *)(v11 + 16) = v3;
  *(void *)(v11 + 24) = v1;
  uint64_t v12 = sub_253C52058();
  *(void *)(v12 + 16) = v7;
  *(void *)(v12 + 24) = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_253BDEDD8(&qword_269D7EF48);
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253DECBAC();
  sub_253C8F44C();
}

uint64_t sub_253DE4A48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[34] = a2;
  v3[35] = a3;
  v3[33] = a1;
  sub_253DF42A0();
  v3[36] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2519C8);
  v3[37] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v3[38] = swift_task_alloc();
  uint64_t v4 = sub_253DF0DB0();
  v3[39] = v4;
  v3[40] = *(void *)(v4 - 8);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  uint64_t v5 = sub_253DF24A0();
  v3[43] = v5;
  v3[44] = *(void *)(v5 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  v3[47] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE4C20, 0, 0);
}

#error "253DE50F8: call analysis failed (funcsize=467)"

uint64_t sub_253DE5394()
{
  sub_253BDF928();
  sub_253BDF7C8();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_253C0FA84();
  *uint64_t v5 = v4;
  *(void *)(v6 + 408) = v0;
  swift_task_dealloc();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v7, v8, v9);
}

uint64_t sub_253DE5474()
{
  uint64_t v31 = v0;
  uint64_t v1 = (void *)v0[51];
  uint64_t v2 = sub_253DF2E70();
  if (v1)
  {
    uint64_t v3 = v1;
    sub_253C0F824();
    v4();
    swift_release();
    sub_253D110B8((uint64_t)(v0 + 12));
    sub_253DECA3C();
    swift_bridgeObjectRetain();
    id v5 = v1;
    swift_bridgeObjectRetain();
    id v6 = v1;
    uint64_t v7 = (void *)sub_253DF2490();
    os_log_type_t v8 = sub_253DF56E0();
    BOOL v9 = sub_253C4A060(v8);
    uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[48];
    uint64_t v11 = v0[45];
    uint64_t v12 = v0[43];
    unint64_t v13 = v0[35];
    if (v9)
    {
      uint64_t v14 = v0[34];
      uint64_t v15 = v3;
      uint64_t v16 = sub_253D7C924();
      uint64_t v17 = (void *)sub_253D11A74();
      uint64_t v30 = sub_253C0FF74();
      *(_DWORD *)uint64_t v16 = 136315394;
      swift_bridgeObjectRetain();
      v0[31] = sub_253D8E5FC(v14, v13, &v30);
      sub_253DF5820();
      sub_253DEC0A0();
      *(_WORD *)(v16 + 12) = 2112;
      id v18 = v15;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      v0[30] = v19;
      sub_253DF5820();
      *uint64_t v17 = v19;

      sub_253DDC470(&dword_253BD8000, v20, v21, "Toolbox could not populate %s' in sandboxMode. Error: %@");
      sub_253BDEDD8(&qword_26B2519F0);
      sub_253DEBE54();
      sub_253BDF910();
      sub_253D7CC68();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C0F824();
      v22();
    }
    else
    {
      sub_253DEC088();

      v10(v11, v12);
    }
    sub_253DEC4E8();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253DEC4BC();
  }
  else
  {
    uint64_t v23 = v2;
    sub_253DECED0();
    uint64_t v24 = (uint64_t *)v0[33];
    sub_253BDEDD8(&qword_269D7E9B8);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_253DF6EC0;
    *(void *)(v25 + 32) = v23;
    swift_release();
    uint64_t v26 = sub_253C10460();
    v27(v26);
    sub_253D110B8((uint64_t)(v0 + 12));
    uint64_t *v24 = v25;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_253C0FDF8();
  }
  return v28();
}

#error "253DE5908: call analysis failed (funcsize=139)"

void sub_253DE5B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v5 = (void *)sub_253DF5390();
    if (a2)
    {
LABEL_3:
      uint64_t v6 = sub_253DEFD00();
      goto LABEL_6;
    }
  }
  else
  {
    id v5 = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

void sub_253DE5BB0()
{
  sub_253C1CED0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v18 = sub_253BDF9FC(v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v19 = sub_253DEBD90();
  sub_253C0FF54(v19);
  uint64_t v20 = sub_253C52058();
  *(void *)(v20 + 16) = v4;
  *(void *)(v20 + 24) = v2;
  uint64_t v21 = (void *)sub_253DECFC0();
  void v21[2] = v16;
  v21[3] = v14;
  v21[4] = v12;
  uint64_t v21[5] = v10;
  v21[6] = v8;
  v21[7] = v6;
  sub_253DDB360();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v0, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DE5CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[35] = a6;
  v7[36] = a7;
  v7[33] = a4;
  v7[34] = a5;
  v7[31] = a2;
  v7[32] = a3;
  v7[30] = a1;
  sub_253BDEDD8(&qword_269D7EF00);
  v7[37] = swift_task_alloc();
  uint64_t v8 = sub_253DF2A60();
  v7[38] = v8;
  v7[39] = *(void *)(v8 - 8);
  v7[40] = swift_task_alloc();
  v7[41] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v7[42] = swift_task_alloc();
  uint64_t v9 = sub_253DF0DB0();
  v7[43] = v9;
  v7[44] = *(void *)(v9 - 8);
  v7[45] = swift_task_alloc();
  v7[46] = swift_task_alloc();
  uint64_t v10 = sub_253DF24A0();
  v7[47] = v10;
  v7[48] = *(void *)(v10 - 8);
  v7[49] = swift_task_alloc();
  v7[50] = swift_task_alloc();
  v7[51] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE5F14, 0, 0);
}

#error "253DE63BC: call analysis failed (funcsize=590)"

void sub_253DE68E4()
{
  sub_253C1CED0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v13 = sub_253BDF9FC(v12);
  MEMORY[0x270FA5388](v13);
  uint64_t v14 = sub_253DEBD90();
  sub_253C0FF54(v14);
  uint64_t v15 = sub_253C52058();
  *(void *)(v15 + 16) = v3;
  *(void *)(v15 + 24) = v1;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v11;
  void v16[3] = v9;
  v16[4] = v7;
  v16[5] = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253DECBAC();
  sub_253C1CEE8();
}

uint64_t sub_253DE6A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[33] = a4;
  v5[34] = a5;
  v5[31] = a2;
  v5[32] = a3;
  v5[30] = a1;
  uint64_t v6 = sub_253DF46F0();
  v5[35] = v6;
  v5[36] = *(void *)(v6 - 8);
  v5[37] = swift_task_alloc();
  uint64_t v7 = sub_253DF5010();
  v5[38] = v7;
  v5[39] = *(void *)(v7 - 8);
  v5[40] = swift_task_alloc();
  uint64_t v8 = sub_253DF39C0();
  v5[41] = v8;
  v5[42] = *(void *)(v8 - 8);
  v5[43] = swift_task_alloc();
  v5[44] = swift_task_alloc();
  uint64_t v9 = sub_253DEFF10();
  v5[45] = v9;
  v5[46] = *(void *)(v9 - 8);
  v5[47] = swift_task_alloc();
  sub_253BDEDD8(&qword_269D7EF20);
  v5[48] = swift_task_alloc();
  v5[49] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v5[50] = swift_task_alloc();
  uint64_t v10 = sub_253DF0DB0();
  v5[51] = v10;
  v5[52] = *(void *)(v10 - 8);
  v5[53] = swift_task_alloc();
  v5[54] = swift_task_alloc();
  uint64_t v11 = sub_253DF24A0();
  v5[55] = v11;
  v5[56] = *(void *)(v11 - 8);
  v5[57] = swift_task_alloc();
  v5[58] = swift_task_alloc();
  v5[59] = swift_task_alloc();
  v5[60] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE6D58, 0, 0);
}

uint64_t sub_253DE6D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, NSObject *a11, uint64_t a12, void *a13, void *a14, uint8_t *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36)
{
  sub_253C10EB0();
  a35 = v37;
  a36 = v38;
  sub_253C2F5A0();
  a34 = v36;
  uint64_t v39 = v36;
  uint64_t v159 = (uint64_t)(v36 + 26);
  int v160 = v36 + 23;
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  sub_253DEBE18();
  uint64_t v40 = (void *)sub_253DF2490();
  os_log_type_t v41 = sub_253DF56C0();
  uint64_t v165 = v36;
  uint64_t v158 = v36 + 28;
  if (sub_253BDF95C(v41))
  {
    uint64_t v42 = v36[56];
    a20 = v36[55];
    a21 = v36[60];
    sub_253C0FFB0();
    uint64_t v43 = sub_253C0FF74();
    sub_253DEC868(v43);
    uint64_t v44 = sub_253DED0BC(4.8149e-34);
    v36[29] = sub_253DEC538(v44, v45, &a24);
    sub_253DEC024((uint64_t)(v36 + 29));
    uint64_t v39 = v36;
    sub_253DF5820();
    swift_bridgeObjectRelease_n();
    sub_253DEBDD8(&dword_253BD8000, v46, v47, "Finding ToolDatabase mapping to custom key in %s's toolbox.");
    sub_253DEBE54();
    sub_253BDF910();
    sub_253BDF910();

    uint64_t v48 = *(void (**)(void))(v42 + 8);
    sub_253C1026C();
    v48();
  }
  else
  {
    uint64_t v49 = v36[56];
    swift_bridgeObjectRelease_n();

    uint64_t v48 = *(void (**)(void))(v49 + 8);
    uint64_t v50 = sub_253DECADC();
    ((void (*)(uint64_t))v48)(v50);
  }
  swift_bridgeObjectRetain();
  sub_253DEBEBC();
  sub_253CE9BA8();
  uint64_t v161 = v48;
  if (v51)
  {
    sub_253BEFAC0(v39[50], &qword_26B2553E8);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    sub_253DEBE18();
    id v52 = sub_253DF2490();
    int v53 = sub_253DF56E0();
    if (os_log_type_enabled(v52, (os_log_type_t)v53))
    {
      LODWORD(a14) = v53;
      a12 = (uint64_t)(v39 + 25);
      uint64_t v54 = sub_253D7C924();
      a13 = (void *)sub_253D779E0();
      a23 = a13;
      *(_DWORD *)uint64_t v54 = 136315394;
      uint64_t v55 = swift_bridgeObjectRetain();
      v39[23] = sub_253DECAC4(v55, v56, (uint64_t *)&a23);
      sub_253DF5820();
      sub_253DECB94();
      a15 = (uint8_t *)v54;
      *(_WORD *)(v54 + 12) = 2080;
      uint64_t v57 = sub_253DF0D80();
      uint64_t v58 = *(void *)(v57 + 16);
      if (v58)
      {
        a10 = v39 + 24;
        a11 = v52;
        uint64_t v59 = v39[52];
        a24 = MEMORY[0x263F8EE78];
        sub_253DC6918(0, v58, 0);
        sub_253C11244();
        a9 = v57;
        uint64_t v61 = v57 + v60;
        a20 = *(void *)(v59 + 72);
        uint64_t v162 = v62;
        do
        {
          v162(v165[53], v61, v165[51]);
          uint64_t v63 = sub_253DF0DA0();
          uint64_t v65 = v64;
          sub_253C634D8();
          v66();
          uint64_t v67 = a24;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_253DEBDF8(*(void *)(v67 + 16));
            uint64_t v67 = a24;
          }
          unint64_t v69 = *(void *)(v67 + 16);
          unint64_t v68 = *(void *)(v67 + 24);
          if (v69 >= v68 >> 1)
          {
            sub_253DEBE30(v68);
            uint64_t v67 = a24;
          }
          *(void *)(v67 + 16) = v69 + 1;
          uint64_t v70 = v67 + 16 * v69;
          *(void *)(v70 + 32) = v63;
          *(void *)(v70 + 40) = v65;
          v61 += a20;
          --v58;
        }
        while (v58);
        swift_bridgeObjectRelease();
        uint64_t v39 = v165;
        id v52 = a11;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v67 = MEMORY[0x263F8EE78];
      }
      uint64_t v163 = v39[59];
      uint64_t v90 = v39[55];
      v39[24] = v67;
      sub_253BDEDD8(&qword_26B256060);
      sub_253D9C5EC();
      uint64_t v91 = sub_253DF5240();
      unint64_t v93 = v92;
      swift_bridgeObjectRelease();
      v39[25] = sub_253D8E5FC(v91, v93, (uint64_t *)&a23);
      sub_253DECBDC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_253BD8000, v52, (os_log_type_t)a14, "Invalid planner type (%s while populating toolbox. Possible values: [%s]", a15, 0x16u);
      sub_253DEC460();
      sub_253BDF910();
      sub_253BDF910();

      uint64_t v80 = v163;
      uint64_t v81 = v90;
      uint64_t v48 = v161;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v80 = sub_253C108C4();
    }
    ((void (*)(uint64_t, uint64_t))v48)(v80, v81);
    sub_253DEA2A4();
    uint64_t v84 = (void *)sub_253C0FFC8();
    sub_253DECD90((uint64_t)v84, v94);
    swift_willThrow();
    goto LABEL_22;
  }
  sub_253BEFD2C();
  v71();
  uint64_t v72 = static ToolboxManager.toolboxes()();
  sub_253DEBE9C(v72);
  swift_bridgeObjectRelease();
  if (!v39[5])
  {
    sub_253BEFAC0((uint64_t)(v39 + 2), &qword_269D7EEE0);
    sub_253DEA2A4();
    uint64_t v82 = sub_253C0FFC8();
    sub_253DEBDB8(v82, v83);
    uint64_t v84 = (void *)v82;
    sub_253C634D8();
    v85();
    goto LABEL_22;
  }
  uint64_t v73 = (uint64_t)(v39 + 12);
  sub_253DEC310(v39 + 12);
  uint64_t v75 = v39[15];
  uint64_t v74 = v39[16];
  uint64_t v76 = sub_253BDF5F8(v39 + 12, v75);
  uint64_t v77 = v39[20];
  uint64_t v78 = v39[21];
  uint64_t v79 = sub_253BDF5F8(v39 + 17, v77);
  static StandardToolboxConfiguration.makeQueryableToolboxWithNoClientActions<A, B>(delegate:planGenerationDelegate:)((uint64_t)v76, (uint64_t)v79, v75, v77, v74, v78);
  uint64_t v86 = v39[46];
  uint64_t v87 = (void *)v39[47];
  uint64_t v88 = v39[45];
  uint64_t v89 = v39[34];
  void *v87 = v39[33];
  v87[1] = v89;
  (*(void (**)(void *, void, uint64_t))(v86 + 104))(v87, *MEMORY[0x263F84740], v88);
  swift_bridgeObjectRetain();
  sub_253DF3310();
  uint64_t v118 = v39[48];
  uint64_t v119 = v39[41];
  sub_253C634D8();
  v120();
  uint64_t v121 = sub_253C105C0();
  sub_253C2E770(v121, v122, v123);
  int v124 = _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v118, 1, v119);
  if (v124 == 1)
  {
    sub_253BEFAC0(v39[48], &qword_269D7EF20);
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    sub_253DEBE18();
    uint64_t v125 = sub_253DF2490();
    os_log_type_t v126 = sub_253DF5700();
    BOOL v127 = sub_253BDF95C(v126);
    uint64_t v128 = v39[58];
    uint64_t v129 = (void *)v39[56];
    unint64_t v130 = v39[34];
    if (v127)
    {
      uint64_t v159 = v39[33];
      a21 = v39[55];
      uint64_t v131 = (uint8_t *)sub_253C0FFB0();
      a20 = v128;
      a24 = sub_253C0FF74();
      int v160 = v129;
      *(_DWORD *)uint64_t v131 = 136315138;
      swift_bridgeObjectRetain();
      v165[28] = sub_253D8E5FC(v159, v130, &a24);
      uint64_t v39 = v165;
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_253BD8000, v125, (os_log_type_t)v118, "No tool found with %s", v131, 0xCu);
      sub_253D7CC68();
      sub_253BDF910();
      sub_253BDF910();
    }
    else
    {
      swift_bridgeObjectRelease_n();

      sub_253C10460();
    }
    sub_253C0F824();
    v142();
    swift_release();
    a12 = 0xE000000000000000;
    a13 = 0;
    goto LABEL_39;
  }
  sub_253BEFD2C();
  v132();
  sub_253BEFD44();
  sub_253BEFD38();
  v133();
  uint64_t v134 = sub_253DECADC();
  int v136 = v135(v134);
  if (v136 != *MEMORY[0x263F4DB48])
  {
    if (v136 == *MEMORY[0x263F4DB50])
    {
      uint64_t v143 = sub_253DEC750();
      v144(v143);
      sub_253BEFD2C();
      v145();
      uint64_t v140 = sub_253DF4FF0();
      goto LABEL_38;
    }
    uint64_t v153 = v39[52];
    a20 = v39[51];
    uint64_t v164 = v39[54];
    uint64_t v154 = v39[49];
    uint64_t v155 = v39[42];
    sub_253DEA2A4();
    uint64_t v84 = (void *)sub_253C0FFC8();
    *(_OWORD *)uint64_t v156 = xmmword_253E03D50;
    *(unsigned char *)(v156 + 16) = 2;
    swift_willThrow();
    swift_release();
    unint64_t v157 = *(void (**)(void))(v155 + 8);
    sub_253C634D8();
    v157();
    sub_253BEFAC0(v154, &qword_269D7EF20);
    (*(void (**)(uint64_t, uint64_t))(v153 + 8))(v164, a20);
    sub_253D110B8(v73);
    uint64_t v39 = v165;
    sub_253C634D8();
    v157();
    uint64_t v48 = v161;
LABEL_22:
    _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v95 = v84;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v96 = v84;
    uint64_t v97 = sub_253DF2490();
    os_log_type_t v98 = sub_253DF56E0();
    BOOL v99 = os_log_type_enabled(v97, v98);
    uint64_t v101 = (uint8_t *)v39[56];
    uint64_t v100 = v39[57];
    a21 = v39[55];
    unint64_t v102 = v39[34];
    if (v99)
    {
      a14 = v39 + 22;
      uint64_t v103 = v165[33];
      unint64_t v104 = v165[32];
      a12 = v165[31];
      a15 = v101;
      uint64_t v105 = sub_253C0FF74();
      a13 = (void *)sub_253D11A74();
      a24 = sub_253D779E0();
      *(_DWORD *)uint64_t v105 = 136315650;
      a20 = v100;
      swift_bridgeObjectRetain();
      v165[27] = sub_253D8E5FC(v103, v102, &a24);
      sub_253DF5820();
      sub_253DEC0A0();
      *(_WORD *)(v105 + 12) = 2080;
      swift_bridgeObjectRetain();
      v165[26] = sub_253D8E5FC(a12, v104, &a24);
      sub_253DF5820();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v105 + 22) = 2112;
      id v106 = v84;
      uint64_t v107 = _swift_stdlib_bridgeErrorToNSError();
      v165[22] = v107;
      sub_253DF5820();
      *a13 = v107;

      _os_log_impl(&dword_253BD8000, v97, v98, "Could not find tool mapping for %s for %s's toolbox. Error: %@", (uint8_t *)v105, 0x20u);
      sub_253BDEDD8(&qword_26B2519F0);
      sub_253D7CC68();
      sub_253BDF910();
      swift_arrayDestroy();
      sub_253BDF910();
      sub_253BDF910();

      sub_253C0F824();
      v108();
    }
    else
    {
      sub_253DEC088();
      sub_253DECF1C();

      sub_253C0F824();
      v48();
    }
    sub_253DEC20C();
    swift_willThrow();
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
    sub_253BDF8DC();
    goto LABEL_26;
  }
  uint64_t v137 = sub_253DEC750();
  v138(v137);
  sub_253BEFD2C();
  v139();
  uint64_t v140 = sub_253DF46C0();
LABEL_38:
  a12 = v141;
  a13 = (void *)v140;
  swift_release();
  sub_253C0FFA4();
  v146();
  uint64_t v147 = sub_253C105C0();
  v148(v147);
LABEL_39:
  a14 = (void *)v39[57];
  a15 = (uint8_t *)v39[53];
  uint64_t v149 = v39;
  uint64_t v150 = v39[49];
  sub_253DEC20C();
  uint64_t v151 = (void *)v149[30];
  sub_253BEFAC0(v150, &qword_269D7EF20);
  sub_253BEFD20();
  v152();
  sub_253D110B8(v73);
  *uint64_t v151 = a13;
  v151[1] = a12;
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
  sub_253C0FDF8();
LABEL_26:
  sub_253C110C0();
  return v110(v109, v110, v111, v112, v113, v114, v115, v116, a9, a10, a11, a12, a13, a14, a15, v158, v159, v160, v161,
           a20,
           a21,
           v165,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

void sub_253DE7BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v6 = (void *)sub_253DF5260();
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_253DEFD00();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

void sub_253DE7C50()
{
  sub_253C1CED0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v17 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v18 = sub_253BDF9FC(v17);
  MEMORY[0x270FA5388](v18);
  uint64_t v19 = sub_253DEBD90();
  sub_253C0FF54(v19);
  uint64_t v20 = sub_253C52058();
  *(void *)(v20 + 16) = v4;
  *(void *)(v20 + 24) = v2;
  uint64_t v21 = (void *)sub_253DECFC0();
  void v21[2] = v16;
  v21[3] = v14;
  v21[4] = v12;
  uint64_t v21[5] = v10;
  v21[6] = v8;
  v21[7] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253BDEDD8(&qword_269D7EEF8);
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v0, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DE7D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[35] = a6;
  v7[36] = a7;
  v7[33] = a4;
  v7[34] = a5;
  v7[31] = a2;
  v7[32] = a3;
  v7[30] = a1;
  sub_253BDEDD8(&qword_269D7EF00);
  v7[37] = swift_task_alloc();
  uint64_t v8 = sub_253DF2A60();
  v7[38] = v8;
  v7[39] = *(void *)(v8 - 8);
  v7[40] = swift_task_alloc();
  v7[41] = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  v7[42] = swift_task_alloc();
  uint64_t v9 = sub_253DF0DB0();
  v7[43] = v9;
  v7[44] = *(void *)(v9 - 8);
  v7[45] = swift_task_alloc();
  v7[46] = swift_task_alloc();
  uint64_t v10 = sub_253DF24A0();
  v7[47] = v10;
  v7[48] = *(void *)(v10 - 8);
  v7[49] = swift_task_alloc();
  v7[50] = swift_task_alloc();
  v7[51] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE7FB4, 0, 0);
}

#error "253DE845C: call analysis failed (funcsize=585)"

uint64_t sub_253DE8970(void *a1, int a2, int a3, int a4, uint64_t a5, void *aBlock, int a7, uint64_t a8, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = sub_253DF5270();
  uint64_t v14 = v13;
  uint64_t v15 = sub_253DF5270();
  uint64_t v17 = v16;
  if (a5)
  {
    uint64_t v18 = sub_253DF5270();
    a5 = v19;
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v11;
  id v21 = a1;
  a9(v12, v14, v15, v17, v18, a5, a8, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_253DE8A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v5 = (void *)sub_253DF5670();
    if (a2)
    {
LABEL_3:
      uint64_t v6 = sub_253DEFD00();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

void sub_253DE8B30()
{
  sub_253C8F550();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  char v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v11 = sub_253BDF9FC(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_253DEBD90();
  sub_253C0FF54(v12);
  uint64_t v13 = sub_253C52058();
  *(void *)(v13 + 16) = v3;
  *(void *)(v13 + 24) = v1;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v9;
  *(void *)(v14 + 24) = v7;
  *(unsigned char *)(v14 + 32) = v5;
  sub_253DF0CC0();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253DECBAC();
  sub_253C8F44C();
}

uint64_t sub_253DE8C54(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 456) = a4;
  *(void *)(v4 + 272) = a2;
  *(void *)(v4 + 280) = a3;
  *(void *)(v4 + 264) = a1;
  uint64_t v5 = sub_253DF3230();
  *(void *)(v4 + 288) = v5;
  *(void *)(v4 + 296) = *(void *)(v5 - 8);
  *(void *)(v4 + 304) = swift_task_alloc();
  sub_253DF42A0();
  *(void *)(v4 + 312) = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2519C8);
  *(void *)(v4 + 320) = swift_task_alloc();
  sub_253BDEDD8(&qword_26B2553E8);
  *(void *)(v4 + 328) = swift_task_alloc();
  uint64_t v6 = sub_253DF0DB0();
  *(void *)(v4 + 336) = v6;
  *(void *)(v4 + 344) = *(void *)(v6 - 8);
  *(void *)(v4 + 352) = swift_task_alloc();
  *(void *)(v4 + 360) = swift_task_alloc();
  uint64_t v7 = sub_253DF24A0();
  *(void *)(v4 + 368) = v7;
  *(void *)(v4 + 376) = *(void *)(v7 - 8);
  *(void *)(v4 + 384) = swift_task_alloc();
  *(void *)(v4 + 392) = swift_task_alloc();
  *(void *)(v4 + 400) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DE8E8C, 0, 0);
}

#error "253DE9364: call analysis failed (funcsize=470)"

uint64_t sub_253DE960C()
{
  sub_253BDF928();
  sub_253BDF7C8();
  sub_253C0FA84();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  v2[54] = v4;
  v2[55] = v5;
  v2[56] = v0;
  swift_task_dealloc();
  sub_253BEFBAC();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_253DE96F4()
{
  uint64_t v1 = v0[54];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (void *)v0[37];
    sub_253DF59D0();
    uint64_t v4 = (void (*)(void, void))v3[2];
    sub_253C11244();
    uint64_t v6 = v1 + v5;
    uint64_t v19 = v2;
    uint64_t v23 = v0;
    uint64_t v24 = v1 + v5;
    uint64_t v22 = v4;
    uint64_t v21 = v3[9];
    do
    {
      ((void (*)(void, uint64_t, void))v4)(v0[38], v6, v0[36]);
      sub_253DF3210();
      sub_253DF3220();
      sub_253DF31E0();
      sub_253DF3200();
      sub_253DF31F0();
      uint64_t v20 = (objc_class *)sub_253DF0FD0();
      id v7 = objc_allocWithZone(v20);
      uint64_t v4 = v22;
      sub_253DF0FC0();
      uint64_t v8 = (void (*)(void))v3[1];
      sub_253BEFD5C();
      v9();
      sub_253DF59B0();
      sub_253DF59E0();
      uint64_t v0 = v23;
      sub_253DF59F0();
      sub_253DF59C0();
      v6 += v21;
      --v2;
    }
    while (v2);
    uint64_t v10 = v19;
    sub_253DF59D0();
    uint64_t v11 = v24;
    do
    {
      uint64_t v25 = v11;
      v4(v0[38], v11);
      sub_253DF3210();
      sub_253DF3220();
      sub_253DF31E0();
      sub_253DF3200();
      sub_253DF31F0();
      id v12 = objc_allocWithZone(v20);
      uint64_t v4 = v22;
      sub_253DF0FC0();
      uint64_t v0 = v23;
      sub_253C0F824();
      v8();
      sub_253DF59B0();
      sub_253DF59E0();
      sub_253C10460();
      sub_253DF59F0();
      sub_253DF59C0();
      uint64_t v11 = v25 + v21;
      --v10;
    }
    while (v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = (uint64_t *)v0[33];
  id v14 = objc_allocWithZone((Class)sub_253DF0CC0());
  uint64_t v15 = sub_253DF0CB0();
  swift_release();
  sub_253C105C0();
  sub_253BEFD5C();
  v16();
  sub_253D110B8((uint64_t)(v0 + 12));
  *uint64_t v13 = v15;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_253C0FDF8();
  return v17();
}

#error "253DE9BC4: call analysis failed (funcsize=141)"

void sub_253DE9DCC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    sub_253DEFD00();
  }
  uint64_t v2 = sub_253BEFD44();
  id v5 = v3;
  v4(v2);
}

id sub_253DE9E5C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id result = sub_253DDCFE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t type metadata accessor for ToolboxXPCServiceServer()
{
  return self;
}

uint64_t type metadata accessor for ToolboxXPCServiceServer.Server()
{
  return self;
}

uint64_t sub_253DE9ECC(uint64_t a1, uint64_t a2)
{
  return sub_253DEB7B0(qword_26B255B68, a2, (void (*)(uint64_t))type metadata accessor for ToolboxXPCServiceServer.Server);
}

uint64_t sub_253DE9F14()
{
  return sub_253DEB7B0(&qword_26B2562D0, 255, MEMORY[0x263F4C908]);
}

uint64_t sub_253DE9F60()
{
  swift_beginAccess();
  uint64_t v0 = qword_26B257548;
  id v1 = (id)qword_26B257548;
  return v0;
}

void sub_253DE9FAC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26B257548;
  qword_26B257548 = a1;
}

uint64_t (*sub_253DE9FFC())()
{
  return j_j__swift_endAccess_0;
}

uint64_t sub_253DEA054()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_253DEA09C(uint64_t a1)
{
  qword_26B257540 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_253DEA0EC())()
{
  return j__swift_endAccess_0;
}

uint64_t sub_253DEA144()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_253DEA17C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_253DEA198(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_253DEA1C4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_253DEA1FC()
{
  sub_253BDF8D0();
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  char v5 = *(unsigned char *)(v0 + 32);
  uint64_t v6 = swift_task_alloc();
  id v7 = (void *)sub_253BDF880(v6);
  void *v7 = v8;
  v7[1] = sub_253C169DC;
  return sub_253DE8C54(v2, v3, v4, v5);
}

unint64_t sub_253DEA2A4()
{
  unint64_t result = qword_269D7EED8;
  if (!qword_269D7EED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7EED8);
  }
  return result;
}

void sub_253DEA2F0(uint64_t a1, uint64_t a2)
{
  sub_253DE8A90(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_253DEA2F8(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_253DEA328()
{
  sub_253DECE0C();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253DEC328();
  return sub_253DE7D94(v3, v4, v5, v6, v7, v8, v9);
}

void sub_253DEA3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_253DE7BC0(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_253DEA3D4(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(v2 + 16))(*a1, a1[1], a2);
}

uint64_t sub_253DEA408()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_253DEA448()
{
  sub_253C10364();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = (void *)sub_253BDF880(v7);
  *uint64_t v8 = v9;
  v8[1] = sub_253C12DD8;
  return sub_253DE6A0C(v2, v3, v4, v6, v5);
}

uint64_t sub_253DEA500()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_253DEA548()
{
  sub_253DECE0C();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253DEC328();
  return sub_253DE5CF4(v3, v4, v5, v6, v7, v8, v9);
}

void sub_253DEA5EC(uint64_t a1, uint64_t a2)
{
  sub_253DE5B18(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_253DEA5F4()
{
  sub_253BDF8D0();
  sub_253DECE20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253D11A40();
  return sub_253DE4A48(v3, v4, v5);
}

void sub_253DEA684(void *a1, uint64_t a2)
{
  sub_253DE3100(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_253DEA68C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_253DEA6BC()
{
  sub_253C10364();
  sub_253DD12F8();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253DD11F4();
  return sub_253DE3E00(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_253DEA758()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_253DEA7A0()
{
  sub_253C10364();
  sub_253DD12F8();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253DD11F4();
  return sub_253DE319C(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_253DEA838()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_253DEA888(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_253BDF880(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_253C169DC;
  return sub_253DE1668(a1, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_253DEA96C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_253DEB9D4(v2);
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_253DEA9D8(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_253DEA9D8(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_253DF5C30();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_253DEB040(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_144;
  }
  uint64_t v5 = result;
  uint64_t result = sub_253DCAD14(v3 / 2);
  uint64_t v95 = result;
  uint64_t v96 = v3;
  uint64_t v97 = v6;
  unint64_t v93 = a1;
  if (v3 <= 0)
  {
    uint64_t v98 = MEMORY[0x263F8EE78];
    unint64_t v31 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
    if (v31 < 2)
    {
LABEL_121:
      uint64_t result = swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(void *)(v95 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_149;
    }
    uint64_t v85 = *v93;
    while (1)
    {
      unint64_t v86 = v31 - 2;
      if (v31 < 2) {
        break;
      }
      if (!v85) {
        goto LABEL_153;
      }
      uint64_t v87 = v98;
      uint64_t v88 = *(void *)(v98 + 32 + 16 * v86);
      uint64_t v89 = *(void *)(v98 + 32 + 16 * (v31 - 1) + 8);
      uint64_t result = sub_253DEB108((char *)(v85 + 16 * v88), (char *)(v85 + 16 * *(void *)(v98 + 32 + 16 * (v31 - 1))), v85 + 16 * v89, v97);
      if (v1) {
        goto LABEL_106;
      }
      if (v89 < v88) {
        goto LABEL_139;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_253DEB3A8(v98);
        uint64_t v87 = result;
      }
      if (v86 >= *(void *)(v87 + 16)) {
        goto LABEL_140;
      }
      uint64_t v90 = (void *)(v87 + 32 + 16 * v86);
      *uint64_t v90 = v88;
      v90[1] = v89;
      unint64_t v91 = *(void *)(v87 + 16);
      if (v31 > v91) {
        goto LABEL_141;
      }
      uint64_t result = (uint64_t)memmove((void *)(v87 + 32 + 16 * (v31 - 1)), (const void *)(v87 + 32 + 16 * v31), 16 * (v91 - v31));
      uint64_t v98 = v87;
      *(void *)(v87 + 16) = v91 - 1;
      unint64_t v31 = v91 - 1;
      uint64_t v3 = v96;
      if (v91 <= 2) {
        goto LABEL_121;
      }
    }
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
    return result;
  }
  uint64_t v94 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *a1;
  uint64_t v92 = *a1 + 8;
  uint64_t v98 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v9 = v7++;
    if (v7 >= v3) {
      goto LABEL_32;
    }
    uint64_t v10 = (uint64_t *)(v8 + 16 * v7);
    uint64_t result = *v10;
    uint64_t v11 = v10[1];
    uint64_t v12 = (void *)(v8 + 16 * v9);
    if (result == *v12 && v11 == v12[1])
    {
      uint64_t v15 = v9 + 2;
      if (v9 + 2 >= v3) {
        goto LABEL_31;
      }
      int v14 = 0;
LABEL_13:
      uint64_t v16 = (void *)(v92 + 16 * v15);
      do
      {
        uint64_t result = *(v16 - 1);
        uint64_t v17 = (void *)(v8 + 16 * v7);
        if (result == *v17 && *v16 == v17[1])
        {
          if (v14) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t result = sub_253DF5C90();
          if ((v14 ^ result)) {
            goto LABEL_23;
          }
        }
        v16 += 2;
        uint64_t v19 = v15 + 1;
        uint64_t v7 = v15;
        uint64_t v15 = v19;
      }
      while (v19 < v3);
      uint64_t v15 = v19;
      goto LABEL_23;
    }
    uint64_t result = sub_253DF5C90();
    int v14 = result;
    uint64_t v15 = v9 + 2;
    if (v9 + 2 < v3) {
      goto LABEL_13;
    }
LABEL_23:
    uint64_t v7 = v15;
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_24:
    if (v15 < v9) {
      goto LABEL_148;
    }
    if (v9 < v15)
    {
      uint64_t v20 = 16 * v15;
      uint64_t v21 = 16 * v9;
      uint64_t v22 = v15;
      uint64_t v23 = v9;
      do
      {
        if (v23 != --v22)
        {
          if (!v8) {
            goto LABEL_152;
          }
          uint64_t v24 = v8 + v20;
          uint64_t v25 = *(void *)(v8 + v21);
          uint64_t v26 = *(void *)(v8 + v21 + 8);
          *(_OWORD *)(v8 + v21) = *(_OWORD *)(v8 + v20 - 16);
          *(void *)(v24 - 16) = v25;
          *(void *)(v24 - 8) = v26;
        }
        ++v23;
        v20 -= 16;
        v21 += 16;
      }
      while (v23 < v22);
    }
LABEL_31:
    uint64_t v7 = v15;
LABEL_32:
    if (v7 >= v3) {
      goto LABEL_41;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_143;
    }
    if (v7 - v9 >= v94) {
      goto LABEL_41;
    }
    if (__OFADD__(v9, v94)) {
      goto LABEL_146;
    }
    if (v9 + v94 >= v3) {
      uint64_t v27 = v3;
    }
    else {
      uint64_t v27 = v9 + v94;
    }
    if (v27 < v9) {
      goto LABEL_147;
    }
    if (v7 == v27)
    {
LABEL_41:
      uint64_t v28 = v98;
    }
    else
    {
      uint64_t v79 = (uint64_t *)(v8 + 16 * v7);
      uint64_t v28 = v98;
      do
      {
        uint64_t v80 = (uint64_t *)(v8 + 16 * v7);
        uint64_t result = *v80;
        uint64_t v81 = v80[1];
        uint64_t v82 = v9;
        uint64_t v83 = v79;
        do
        {
          if (result == *(v83 - 2) && v81 == *(v83 - 1)) {
            break;
          }
          uint64_t result = sub_253DF5C90();
          if ((result & 1) == 0) {
            break;
          }
          if (!v8) {
            goto LABEL_150;
          }
          uint64_t result = *v83;
          uint64_t v81 = v83[1];
          *(_OWORD *)uint64_t v83 = *((_OWORD *)v83 - 1);
          *(v83 - 1) = v81;
          *(v83 - 2) = result;
          v83 -= 2;
          ++v82;
        }
        while (v7 != v82);
        ++v7;
        v79 += 2;
      }
      while (v7 != v27);
      uint64_t v7 = v27;
    }
    if (v7 < v9) {
      goto LABEL_142;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_253DEB2B0(0, *(void *)(v28 + 16) + 1, 1, (char *)v28);
      uint64_t v28 = result;
    }
    unint64_t v30 = *(void *)(v28 + 16);
    unint64_t v29 = *(void *)(v28 + 24);
    unint64_t v31 = v30 + 1;
    if (v30 >= v29 >> 1)
    {
      uint64_t result = (uint64_t)sub_253DEB2B0((char *)(v29 > 1), v30 + 1, 1, (char *)v28);
      uint64_t v28 = result;
    }
    *(void *)(v28 + 16) = v31;
    uint64_t v32 = v28 + 32;
    uint64_t v33 = (uint64_t *)(v28 + 32 + 16 * v30);
    *uint64_t v33 = v9;
    v33[1] = v7;
    uint64_t v98 = v28;
    if (v30) {
      break;
    }
    unint64_t v31 = 1;
LABEL_90:
    uint64_t v3 = v96;
    if (v7 >= v96) {
      goto LABEL_110;
    }
  }
  while (1)
  {
    unint64_t v34 = v31 - 1;
    if (v31 >= 4)
    {
      unint64_t v39 = v32 + 16 * v31;
      uint64_t v40 = *(void *)(v39 - 64);
      uint64_t v41 = *(void *)(v39 - 56);
      BOOL v45 = __OFSUB__(v41, v40);
      uint64_t v42 = v41 - v40;
      if (v45) {
        goto LABEL_127;
      }
      uint64_t v44 = *(void *)(v39 - 48);
      uint64_t v43 = *(void *)(v39 - 40);
      BOOL v45 = __OFSUB__(v43, v44);
      uint64_t v37 = v43 - v44;
      char v38 = v45;
      if (v45) {
        goto LABEL_128;
      }
      unint64_t v46 = v31 - 2;
      uint64_t v47 = (uint64_t *)(v32 + 16 * (v31 - 2));
      uint64_t v49 = *v47;
      uint64_t v48 = v47[1];
      BOOL v45 = __OFSUB__(v48, v49);
      uint64_t v50 = v48 - v49;
      if (v45) {
        goto LABEL_129;
      }
      BOOL v45 = __OFADD__(v37, v50);
      uint64_t v51 = v37 + v50;
      if (v45) {
        goto LABEL_131;
      }
      if (v51 >= v42)
      {
        unint64_t v69 = (uint64_t *)(v32 + 16 * v34);
        uint64_t v71 = *v69;
        uint64_t v70 = v69[1];
        BOOL v45 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v45) {
          goto LABEL_137;
        }
        BOOL v62 = v37 < v72;
        goto LABEL_79;
      }
    }
    else
    {
      if (v31 != 3)
      {
        uint64_t v63 = *(void *)(v28 + 32);
        uint64_t v64 = *(void *)(v28 + 40);
        BOOL v45 = __OFSUB__(v64, v63);
        uint64_t v56 = v64 - v63;
        char v57 = v45;
        goto LABEL_73;
      }
      uint64_t v36 = *(void *)(v28 + 32);
      uint64_t v35 = *(void *)(v28 + 40);
      BOOL v45 = __OFSUB__(v35, v36);
      uint64_t v37 = v35 - v36;
      char v38 = v45;
    }
    if (v38) {
      goto LABEL_130;
    }
    unint64_t v46 = v31 - 2;
    id v52 = (uint64_t *)(v32 + 16 * (v31 - 2));
    uint64_t v54 = *v52;
    uint64_t v53 = v52[1];
    BOOL v55 = __OFSUB__(v53, v54);
    uint64_t v56 = v53 - v54;
    char v57 = v55;
    if (v55) {
      goto LABEL_132;
    }
    uint64_t v58 = (uint64_t *)(v32 + 16 * v34);
    uint64_t v60 = *v58;
    uint64_t v59 = v58[1];
    BOOL v45 = __OFSUB__(v59, v60);
    uint64_t v61 = v59 - v60;
    if (v45) {
      goto LABEL_134;
    }
    if (__OFADD__(v56, v61)) {
      goto LABEL_136;
    }
    if (v56 + v61 >= v37)
    {
      BOOL v62 = v37 < v61;
LABEL_79:
      if (v62) {
        unint64_t v34 = v46;
      }
      goto LABEL_81;
    }
LABEL_73:
    if (v57) {
      goto LABEL_133;
    }
    uint64_t v65 = (uint64_t *)(v32 + 16 * v34);
    uint64_t v67 = *v65;
    uint64_t v66 = v65[1];
    BOOL v45 = __OFSUB__(v66, v67);
    uint64_t v68 = v66 - v67;
    if (v45) {
      goto LABEL_135;
    }
    if (v68 < v56) {
      goto LABEL_90;
    }
LABEL_81:
    unint64_t v73 = v34 - 1;
    if (v34 - 1 >= v31)
    {
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v8) {
      goto LABEL_151;
    }
    uint64_t v74 = (uint64_t *)(v32 + 16 * v73);
    uint64_t v75 = *v74;
    uint64_t v76 = (void *)(v32 + 16 * v34);
    uint64_t v77 = v76[1];
    uint64_t result = sub_253DEB108((char *)(v8 + 16 * *v74), (char *)(v8 + 16 * *v76), v8 + 16 * v77, v97);
    if (v1) {
      break;
    }
    if (v77 < v75) {
      goto LABEL_124;
    }
    if (v34 > *(void *)(v98 + 16)) {
      goto LABEL_125;
    }
    *uint64_t v74 = v75;
    *(void *)(v32 + 16 * v73 + 8) = v77;
    unint64_t v78 = *(void *)(v98 + 16);
    if (v34 >= v78) {
      goto LABEL_126;
    }
    uint64_t v28 = v98;
    unint64_t v31 = v78 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v32 + 16 * v34), v76 + 2, 16 * (v78 - 1 - v34));
    *(void *)(v98 + 16) = v78 - 1;
    if (v78 <= 2) {
      goto LABEL_90;
    }
  }
LABEL_106:
  uint64_t result = swift_bridgeObjectRelease();
  if (v96 < -1) {
    goto LABEL_145;
  }
  *(void *)(v95 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_253DEB040(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1)) {
          break;
        }
        uint64_t result = sub_253DF5C90();
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }
        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_253DEB108(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_253DC5804(a2, (uint64_t)(a3 - (void)a2) / 16, a4);
    unint64_t v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    uint64_t v18 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v19 = v18 + 16;
      uint64_t v20 = (char *)(v12 - 16);
      BOOL v21 = *(void *)(v12 - 16) == *((void *)v6 - 2) && *(void *)(v12 - 8) == *((void *)v6 - 1);
      if (v21 || (sub_253DF5C90() & 1) == 0)
      {
        BOOL v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23) {
          goto LABEL_43;
        }
      }
      else
      {
        BOOL v22 = v19 != v6 || v18 >= v6;
        uint64_t v20 = v6 - 16;
        v6 -= 16;
        if (!v22) {
          goto LABEL_43;
        }
      }
      *(_OWORD *)uint64_t v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4) {
        goto LABEL_47;
      }
    }
  }
  sub_253DC5804(a1, (a2 - a1) / 16, a4);
  unint64_t v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v14 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (!v14 && (sub_253DF5C90() & 1) != 0) {
        break;
      }
      uint64_t v15 = v4;
      BOOL v14 = v7 == v4;
      v4 += 16;
      if (!v14) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3) {
        goto LABEL_21;
      }
    }
    uint64_t v15 = v6;
    BOOL v14 = v7 == v6;
    v6 += 16;
    if (v14) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v6 = v7;
LABEL_47:
  sub_253DC5804(v4, (uint64_t)(v12 - (void)v4) / 16, v6);
  return 1;
}

char *sub_253DEB2B0(char *result, int64_t a2, char a3, char *a4)
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
    sub_253BDEDD8(&qword_269D7F000);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size_0(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_253DEB3A8(uint64_t a1)
{
  return sub_253DEB2B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

int64_t sub_253DEB3BC(int64_t result, int a2, char a3, uint64_t a4)
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
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_253DEB4A0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
    swift_bridgeObjectRetain();
    return sub_253BEFD44();
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_253DEB518(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return swift_bridgeObjectRetain();
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_253DEB56C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_253DE27A0(a1, *(void **)(v2 + 16), a2);
}

void sub_253DEB588(uint64_t a1, void *a2)
{
  sub_253DE13D8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_253DEB590()
{
  sub_253BDF8D0();
  sub_253DECE20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253D11A40();
  return sub_253DE0B34(v3, v4, v5);
}

uint64_t sub_253DEB620()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253DEB658()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253DEB690()
{
  sub_253BDF8D0();
  sub_253DECE20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253D11A40();
  return sub_253DDFD98(v3, v4, v5);
}

uint64_t sub_253DEB720()
{
  sub_253BDF8D0();
  sub_253DECE20();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_253BDF880(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_253C169DC;
  uint64_t v3 = sub_253D11A40();
  return sub_253DDD1D8(v3, v4, v5);
}

uint64_t sub_253DEB7B0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_253DEB7F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_253D75DE0(a1, a2);
  }
  return a1;
}

uint64_t sub_253DEB80C(uint64_t a1)
{
  return sub_253DDFC10(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_253DEB82C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
LABEL_3:
    uint64_t v3 = __clz(__rbit64(v1)) + v2;
    return sub_253DECCA4(v3);
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return sub_253DECCA4(v3);
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    goto LABEL_3;
  }
  uint64_t v2 = 64;
  uint64_t v7 = 9;
  while (v7 - 7 < (unint64_t)(v3 + 63) >> 6)
  {
    unint64_t v1 = *(void *)(a1 + 8 * v7);
    v2 += 64;
    ++v7;
    if (v1) {
      goto LABEL_3;
    }
  }
  return sub_253DECCA4(v3);
}

uint64_t sub_253DEB8A0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || -(-1 << *(unsigned char *)(a4 + 32)) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 64 + (((unint64_t)result >> 3) & 0x1FFFFFFFFFFFFFF8)) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return sub_253DF58B0();
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_253DEB924(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
LABEL_3:
    uint64_t v3 = __clz(__rbit64(v1)) + v2;
    return sub_253DECCA4(v3);
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return sub_253DECCA4(v3);
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    goto LABEL_3;
  }
  uint64_t v2 = 64;
  uint64_t v7 = 10;
  while (v7 - 8 < (unint64_t)(v3 + 63) >> 6)
  {
    unint64_t v1 = *(void *)(a1 + 8 * v7);
    v2 += 64;
    ++v7;
    if (v1) {
      goto LABEL_3;
    }
  }
  return sub_253DECCA4(v3);
}

void sub_253DEB998()
{
}

void sub_253DEB9AC(uint64_t a1)
{
}

void sub_253DEB9C0()
{
}

void sub_253DEB9D4(uint64_t a1)
{
}

uint64_t sub_253DEB9E8()
{
  uint64_t v1 = sub_253DECEBC();
  v2(v1);
  sub_253BDF7F0();
  uint64_t v3 = sub_253C2F578();
  v4(v3);
  return v0;
}

uint64_t sub_253DEBA30(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_253BDF7F0();
  sub_253BEFBCC();
  v3();
  return a1;
}

uint64_t sub_253DEBA84()
{
  uint64_t v1 = sub_253DECEBC();
  v2(v1);
  sub_253BDF7F0();
  sub_253C10134();
  v3();
  return v0;
}

uint64_t sub_253DEBAD8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ToolboxXPCServiceServer.ToolboxServerError(uint64_t a1)
{
  return sub_253DEBB00(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_253DEBB00(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s23IntelligenceFlowRuntime23ToolboxXPCServiceServerC18ToolboxServerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_253DEBAD8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ToolboxXPCServiceServer.ToolboxServerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_253DEBAD8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_253DEBB00(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ToolboxXPCServiceServer.ToolboxServerError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_253DEBB00(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolboxXPCServiceServer.ToolboxServerError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolboxXPCServiceServer.ToolboxServerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_253DEBC88(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_253DEBCA0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ToolboxXPCServiceServer.ToolboxServerError()
{
  return &type metadata for ToolboxXPCServiceServer.ToolboxServerError;
}

uint64_t sub_253DEBD30()
{
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v4 = sub_253BDF5F8(v1, v3);
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[21];
  uint64_t v7 = sub_253BDF5F8(v0 + 17, v5);
  return static StandardToolboxConfiguration.makeQueryableToolboxWithNoClientActions<A, B>(delegate:planGenerationDelegate:)((uint64_t)v4, (uint64_t)v7, v3, v5, v2, v6);
}

uint64_t sub_253DEBD90()
{
  return sub_253DF5500();
}

uint64_t sub_253DEBDB8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 2;
  return swift_willThrow();
}

void sub_253DEBDD8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

void sub_253DEBDF8(uint64_t a1@<X8>)
{
  sub_253DC6918(0, a1 + 1, 1);
}

uint64_t sub_253DEBE18()
{
  return swift_bridgeObjectRetain_n();
}

void sub_253DEBE30(unint64_t a1@<X8>)
{
  sub_253DC6918(a1 > 1, v1, 1);
}

uint64_t sub_253DEBE54()
{
  return swift_arrayDestroy();
}

uint64_t sub_253DEBE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_253D8F168(a19, a20);
  return sub_253D8F168(a22, v22);
}

double sub_253DEBE9C(uint64_t a1)
{
  return sub_253D7F39C(a1, v1);
}

uint64_t sub_253DEBEBC()
{
  return sub_253DF0D90();
}

uint64_t sub_253DEBED8(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DEBEF8()
{
  return sub_253DF5240();
}

uint64_t sub_253DEBF1C()
{
  return v0;
}

uint64_t sub_253DEBF34(uint64_t a1)
{
  *(void *)(v1 + 216) = a1;
  return v1 + 216;
}

uint64_t sub_253DEBF50()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253DEBF6C(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DEBF88()
{
  return v0 + 8;
}

void sub_253DEBF98(uint64_t a1, uint64_t a2)
{
  sub_253DC6918(0, a2, 1);
}

uint64_t sub_253DEBFB0()
{
  return v0;
}

uint64_t sub_253DEBFC8()
{
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0(v0, 1, v1);
}

void sub_253DEBFE4(uint64_t a1@<X8>)
{
  *(void *)(v2 - 88) = a1;
  sub_253DC6918(0, v1, 0);
}

void sub_253DEC008()
{
  sub_253DC6918(0, v0, 0);
}

uint64_t sub_253DEC024@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_253DEC038()
{
  return swift_slowAlloc();
}

uint64_t sub_253DEC088()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DEC0A0()
{
  return swift_bridgeObjectRelease_n();
}

BOOL sub_253DEC0C8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_253DEC0E4()
{
  return sub_253DF2E80();
}

void sub_253DEC11C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

void *sub_253DEC1EC()
{
  return memcpy((void *)(v1 + 96), v0, 0x50uLL);
}

id sub_253DEC238()
{
  *(_WORD *)(v1 + 12) = 2112;
  return v0;
}

BOOL sub_253DEC258(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_253DEC29C(uint64_t a1@<X8>)
{
  *(void *)(v2 - 88) = a1;
  sub_253DC6918(0, v1, 0);
}

void sub_253DEC2C0(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, v5, a3, a4, v4, 0x16u);
}

uint64_t sub_253DEC2DC()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DEC2F4()
{
  return swift_arrayDestroy();
}

void *sub_253DEC310(void *a1)
{
  return memcpy(a1, v1, 0x50uLL);
}

uint64_t sub_253DEC328()
{
  return v0;
}

uint64_t sub_253DEC34C()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DEC364(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_253D8E5FC(v3, v4, a3);
}

uint64_t sub_253DEC37C()
{
  return swift_willThrow();
}

uint64_t sub_253DEC3AC()
{
  return _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
}

uint64_t sub_253DEC3C4()
{
  return v0;
}

uint64_t sub_253DEC3D8(uint64_t a1)
{
  *(void *)(v1 + 240) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC404(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DEC420()
{
  return v0;
}

double sub_253DEC440(uint64_t a1)
{
  return sub_253D7F39C(a1, v1);
}

uint64_t sub_253DEC460()
{
  return swift_arrayDestroy();
}

uint64_t sub_253DEC478()
{
  return swift_willThrow();
}

uint64_t sub_253DEC4A4()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DEC4BC()
{
  return v0 + 8;
}

uint64_t sub_253DEC4CC(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DEC4FC()
{
  return sub_253DF5820();
}

uint64_t sub_253DEC51C(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DEC538(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_253D8E5FC(v4, v3, a3);
}

uint64_t sub_253DEC550()
{
  return sub_253D8E5FC(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t sub_253DEC56C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  a1[7] = a2;
  a1[4] = v2;
  a1[5] = v3;
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_253DEC594(uint64_t a1)
{
  *(void *)(v1 + 240) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC5BC(uint64_t a1)
{
  *(void *)(v1 + 200) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC5F0(uint64_t a1)
{
  *(void *)(v1 + 248) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC618(uint64_t a1)
{
  *(void *)(v1 + 208) = a1;
  return sub_253DF5820();
}

void sub_253DEC640()
{
  *(void *)(v0 + 16) = v4;
  uint64_t v5 = v0 + 16 * v1;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v3;
}

uint64_t sub_253DEC65C(uint64_t a1)
{
  *(void *)(v1 + 176) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC684(uint64_t a1)
{
  *(void *)(v1 + 200) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC6AC(uint64_t a1)
{
  *(void *)(v1 + 200) = a1;
  return sub_253DF5820();
}

void sub_253DEC6D4()
{
  *(void *)(v4 + 16) = v0;
  uint64_t v5 = v4 + 16 * v1;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
}

void sub_253DEC6F0()
{
  *(void *)(v4 + 16) = v0;
  uint64_t v5 = v4 + 16 * v1;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
}

void sub_253DEC70C()
{
  *(void *)(v4 + 16) = v0;
  uint64_t v5 = v4 + 16 * v1;
  *(void *)(v5 + 32) = v3;
  *(void *)(v5 + 40) = v2;
}

uint64_t sub_253DEC728(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v2;
  *(unsigned char *)(a2 + 16) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DEC750()
{
  return v0;
}

uint64_t sub_253DEC76C()
{
  return _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
}

uint64_t sub_253DEC794()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DEC7AC(uint64_t a1)
{
  *(void *)(v1 + 232) = a1;
  return sub_253DF5820();
}

void sub_253DEC7D4()
{
  *(void *)(v0 + 184) = v1;
}

uint64_t sub_253DEC7F0(uint64_t a1)
{
  *(void *)(v1 + 176) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC818(uint64_t a1)
{
  *(void *)(v1 + 176) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC840(uint64_t a1)
{
  *(void *)(v1 + 248) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC868(uint64_t result)
{
  *(void *)(v1 - 88) = result;
  return result;
}

uint64_t sub_253DEC874(uint64_t a1)
{
  *(void *)(v1 + 208) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC89C(uint64_t a1)
{
  *(void *)(v1 + 208) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC8C4(uint64_t a1)
{
  *(void *)(v1 + 192) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC8E8(uint64_t a1)
{
  _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v1, 1, 1, a1);
  return sub_253DC0340();
}

uint64_t sub_253DEC924()
{
  return sub_253DF5240();
}

uint64_t sub_253DEC948()
{
  return sub_253DF5240();
}

uint64_t sub_253DEC96C()
{
  return sub_253DF5240();
}

uint64_t sub_253DEC990(uint64_t a1)
{
  *(void *)(v1 + 200) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DEC9B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13)
{
  *(_OWORD *)(a1 + 16) = a13;
  return a1 + a11;
}

void sub_253DEC9CC()
{
  *(void *)(v0 + 192) = v1;
}

uint64_t sub_253DEC9FC(uint64_t a1)
{
  *(void *)(v1 + 256) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DECA20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  return sub_253D8E5FC(v5, v6, (uint64_t *)va);
}

uint64_t sub_253DECA3C()
{
  return _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
}

uint64_t sub_253DECA54()
{
  return sub_253DF52E0();
}

unint64_t sub_253DECA78()
{
  return 0xD00000000000001BLL;
}

BOOL sub_253DECA90(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_253DECAAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_253D8E5FC(v4, v3, a3);
}

uint64_t sub_253DECAC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_253D8E5FC(v3, v4, a3);
}

uint64_t sub_253DECADC()
{
  return v0;
}

void sub_253DECAEC(unint64_t a1@<X8>)
{
  sub_253DC6918(a1 > 1, v1, 1);
}

void sub_253DECB10(unint64_t a1@<X8>)
{
  sub_253DC6918(a1 > 1, v1, 1);
}

void sub_253DECB34(unint64_t a1@<X8>)
{
  sub_253DC6918(a1 > 1, v1, 1);
}

uint64_t sub_253DECB58()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_253DECB70()
{
  return swift_willThrow();
}

uint64_t sub_253DECB94()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DECBAC()
{
  return sub_253BEFAC0(v1, v0);
}

uint64_t sub_253DECBC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  return a22;
}

uint64_t sub_253DECBDC()
{
  return sub_253DF5820();
}

uint64_t sub_253DECBF8()
{
  sub_253DEB7F8(v1, v3);
  sub_253DEB7F8(v0, v2);
  return v1;
}

uint64_t sub_253DECC28()
{
  sub_253BDF5F8((void *)(v1 + 136), *(void *)(v1 + 160));
  return sub_253C0E430(v2, v0);
}

uint64_t sub_253DECC64(uint64_t a1)
{
  *(void *)(v1 + 184) = a1;
  return sub_253DF5820();
}

void sub_253DECC88()
{
  sub_253DC6918(0, v0, 0);
}

uint64_t sub_253DECCA4@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_253DECCB4(uint64_t a1)
{
  *(void *)(v1 + 216) = a1;
  return sub_253DF5820();
}

id sub_253DECCD8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13)
{
  *(_WORD *)(v13 + 12) = 2112;
  return a13;
}

uint64_t sub_253DECCFC(uint64_t a1)
{
  *(void *)(v1 + 224) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DECD54()
{
  return sub_253DF0CD0();
}

uint64_t sub_253DECD78()
{
  return v0;
}

uint64_t sub_253DECD90(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v2;
  *(unsigned char *)(a2 + 16) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DECDAC(uint64_t a1)
{
  *(void *)(v1 + 224) = a1;
  return sub_253DF5820();
}

uint64_t sub_253DECDCC()
{
  return v0;
}

void sub_253DECDE0()
{
  *uint64_t v1 = v2;
}

void sub_253DECE2C()
{
  *(void *)(v1 + 208) = v0;
}

uint64_t sub_253DECE54(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DECE88()
{
  return sub_253DF58F0();
}

uint64_t sub_253DECEA8()
{
  return *(void *)(v0 + 248);
}

uint64_t sub_253DECEBC()
{
  return 0;
}

void sub_253DECEDC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0x16u);
}

void sub_253DECEFC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x20u);
}

uint64_t sub_253DECF1C()
{
  return swift_bridgeObjectRelease_n();
}

void sub_253DECF34(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = v1;
}

uint64_t sub_253DECF48()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DECF68()
{
  return sub_253DF55B0();
}

uint64_t sub_253DECF88()
{
  return swift_arrayDestroy();
}

uint64_t sub_253DECFA8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DECFC0()
{
  return swift_allocObject();
}

uint64_t sub_253DECFD8()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DECFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  return a21;
}

uint64_t sub_253DED00C()
{
  return swift_bridgeObjectRelease_n();
}

void sub_253DED02C()
{
  *uint64_t v2 = v0;
}

uint64_t sub_253DED044()
{
  return _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
}

uint64_t sub_253DED064()
{
  return 0;
}

uint64_t sub_253DED084()
{
  return swift_arrayDestroy();
}

uint64_t sub_253DED09C()
{
  return swift_arrayDestroy();
}

uint64_t sub_253DED0BC(float a1)
{
  *uint64_t v1 = a1;
  return swift_bridgeObjectRetain();
}

id sub_253DED0DC()
{
  *(_WORD *)(v1 + 22) = 2112;
  return v0;
}

id sub_253DED0FC()
{
  *(_WORD *)(v0 + 12) = 2112;
  return v1;
}

uint64_t sub_253DED11C(uint64_t result)
{
  *(void *)(v1 - 96) = result;
  return result;
}

uint64_t sub_253DED128()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_253DED140()
{
  return swift_bridgeObjectRetain();
}

void sub_253DED158(void *a1, int a2, os_log_type_t a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_log_t log)
{
  _os_log_impl(a1, log, a3, a4, v15, 0x16u);
}

uint64_t sub_253DED178(void *a1, uint64_t a2, uint64_t (*a3)(void, void, uint64_t))
{
  return a3(*a1, a1[1], a2);
}

void sub_253DED1B0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 >> 60 == 15)
  {
    uint64_t v4 = 0;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v4 = (void *)sub_253DEFDB0();
  if (a3) {
LABEL_3:
  }
    sub_253DEFD00();
LABEL_5:
  uint64_t v5 = sub_253DEFB74();
  v6(v5);
}

uint64_t sub_253DED238(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(*a1);
}

void sub_253DED264(uint64_t a1, uint64_t a2)
{
  if (a2) {
    sub_253DEFD00();
  }
  uint64_t v2 = sub_253DEFB74();
  v3(v2);
}

void sub_253DED2C4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_253BDEDD8(&qword_26B2519D0);
  uint64_t v7 = sub_253BDF9FC(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253C17A04(a1, (uint64_t)v9);
  uint64_t v10 = sub_253DEFE90();
  unint64_t v11 = 0;
  if (_s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwet_0((uint64_t)v9, 1, v10) != 1)
  {
    unint64_t v11 = (void *)sub_253DEFE50();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  if (a2) {
    a2 = (void *)sub_253DEFD00();
  }
  (*(void (**)(uint64_t, void *, void *))(a3 + 16))(a3, v11, a2);
}

uint64_t sub_253DED3E4()
{
  return swift_retain();
}

uint64_t sub_253DED430(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_clientProxy);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

void sub_253DED484()
{
  id v1 = objc_allocWithZone(v0);
  sub_253DED4C8();
}

void sub_253DED4C8()
{
  sub_253DEFB60();
  uint64_t v43 = v1;
  uint64_t v44 = v2;
  id v4 = v3;
  uint64_t v6 = v5;
  v35.super_class = (Class)swift_getObjectType();
  uint64_t v7 = sub_253DF1960();
  sub_253C0F830();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  sub_253BDFA94();
  uint64_t v12 = v11;
  sub_253DF24A0();
  sub_253C0F830();
  MEMORY[0x270FA5388](v13);
  sub_253BDFA94();
  *(void *)&v0[OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_clientProxy] = 0;
  uint64_t v14 = OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_jsonEncoder;
  sub_253DEFC50();
  swift_allocObject();
  uint64_t v15 = v0;
  *(void *)&v0[v14] = sub_253DEFC40();
  uint64_t v16 = OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_jsonDecoder;
  sub_253DEFC20();
  swift_allocObject();
  v35.receiver = v15;
  *(void *)&v15[v16] = sub_253DEFC10();
  uint64_t v17 = (void *)sub_253DF5260();
  id v18 = objc_msgSend(v4, sel_valueForEntitlement_, v17);

  if (v18)
  {
    sub_253DF5860();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_253DD0C5C((uint64_t)&v39, (uint64_t)v41);
  if (v42)
  {
    if (swift_dynamicCast())
    {
      uint64_t v20 = v37;
      uint64_t v19 = v38;
      BOOL v21 = (void *)sub_253DF5260();
      id v22 = objc_msgSend(v4, sel_valueForEntitlement_, v21);

      if (v22)
      {
        sub_253DF5860();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v39 = 0u;
        long long v40 = 0u;
      }
      sub_253DD0C5C((uint64_t)&v39, (uint64_t)v41);
      if (v42)
      {
        if (swift_dynamicCast())
        {
          char v33 = v37;
          *((unsigned char *)v35.receiver
          + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_allGroupQueryingAllowed) = v37;
          if (v33)
          {
            swift_bridgeObjectRelease();
            uint64_t v20 = 0;
            uint64_t v19 = 0;
          }
          goto LABEL_24;
        }
      }
      else
      {
        sub_253BEFAC0((uint64_t)v41, &qword_26B2519F8);
      }
      *((unsigned char *)v35.receiver
      + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_allGroupQueryingAllowed) = 0;
LABEL_24:
      type metadata accessor for TranscriptEntityQueryingService();
      swift_allocObject();
      *(void *)((char *)v35.receiver
                + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_transcriptQueryingService) = sub_253DC0A94(v20, v19);

      objc_super v36 = v35;
      objc_msgSendSuper2(&v36, sel_init);

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v7);
      goto LABEL_25;
    }
    unint64_t v34 = v4;
  }
  else
  {
    unint64_t v34 = v4;
    sub_253BEFAC0((uint64_t)v41, &qword_26B2519F8);
  }
  _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v12, v6, v7);
  BOOL v23 = sub_253DF2490();
  os_log_type_t v24 = sub_253DF56E0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    v41[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    uint64_t v27 = sub_253DF1950();
    if (v28)
    {
      unint64_t v29 = v28;
    }
    else
    {
      uint64_t v27 = 0x6E776F6E6B6E75;
      unint64_t v29 = 0xE700000000000000;
    }
    *(void *)&long long v39 = sub_253D8E5FC(v27, v29, v41);
    sub_253DF5820();
    swift_bridgeObjectRelease();
    unint64_t v30 = *(void (**)(void))(v9 + 8);
    sub_253BEFD20();
    v30();
    _os_log_impl(&dword_253BD8000, v23, v24, "SessionXPCServiceServer: client %s is missing group-identifier entitlement.", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2709B0](v26, -1, -1);
    MEMORY[0x25A2709B0](v25, -1, -1);

    sub_253BEFD20();
    v30();
  }
  else
  {

    unint64_t v31 = *(void (**)(void))(v9 + 8);
    sub_253BEFD20();
    v31();
    sub_253BEFD20();
    v31();
  }
  sub_253BEFBCC();
  v32();
  swift_release();
  swift_release();

  swift_release();
  swift_deallocPartialClassInstance();
LABEL_25:
  sub_253C1CEE8();
}

uint64_t sub_253DEDA78(uint64_t a1, unint64_t a2)
{
  uint64_t v6 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v7 = sub_253BDF9FC(v6);
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_253DDC1EC();
  sub_253DDC214(v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v2;
  v9[3] = a1;
  v9[4] = a2;
  id v10 = v2;
  sub_253D75DE0(a1, a2);
  sub_253DEFE90();
  sub_253DF55B0();
  swift_release();
  swift_release();
  return sub_253BEFAC0(v3, (uint64_t *)&unk_26B2519E0);
}

uint64_t sub_253DEDB78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_253DF1440();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_253DEDC3C, 0, 0);
}

uint64_t sub_253DEDC3C()
{
  sub_253DEF9DC((unint64_t *)&unk_269D7F080, 255, MEMORY[0x263F4CD90]);
  sub_253DEFC00();
  v0[9] = 0;
  uint64_t v1 = *(void *)(v0[3]
                 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_transcriptQueryingService);
  v0[10] = v1;
  return MEMORY[0x270FA2498](sub_253DEDD70, v1, 0);
}

uint64_t sub_253DEDD70()
{
  sub_253BDF8D0();
  uint64_t v1 = v0[9];
  sub_253DC0B38(v0[8], v0[2]);
  v0[11] = v1;
  if (v1) {
    uint64_t v2 = sub_253DEDE70;
  }
  else {
    uint64_t v2 = sub_253DEDDFC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_253DEDDFC()
{
  sub_253BDF928();
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  sub_253C0FDF8();
  return v1();
}

uint64_t sub_253DEDE70()
{
  sub_253BDF928();
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

void sub_253DEDFC0()
{
  sub_253DEFB60();
  sub_253DEFBD4();
  sub_253C0F830();
  MEMORY[0x270FA5388](v2);
  sub_253DEFBA4();
  uint64_t v3 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v4 = sub_253BDF9FC(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_253DDC1EC();
  sub_253DDC214(v5);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_253DEFA94(v6);
  v8(v7);
  sub_253DEFB8C();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = sub_253DEFAE0(v9);
  v11(v10);
  swift_retain();
  id v12 = v0;
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v1, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DEE10C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_253DEE130, 0, 0);
}

uint64_t sub_253DEE130()
{
  uint64_t v1 = v0[4];
  v0[6] = *(void *)(v1
                    + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_jsonEncoder);
  uint64_t v2 = *(void *)(v1
                 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_transcriptQueryingService);
  v0[7] = v2;
  return sub_253C10A10((uint64_t)sub_253DEE168, v2);
}

uint64_t sub_253DEE168()
{
  sub_253BDF8D0();
  v0[8] = sub_253DC0E04(v0[5]);
  v0[9] = 0;
  return MEMORY[0x270FA2498](sub_253DEE214, 0, 0);
}

uint64_t sub_253DEE214()
{
  v0[2] = v0[8];
  uint64_t v1 = v0[9];
  sub_253BDEDD8(&qword_269D7F058);
  sub_253DEF798();
  uint64_t v3 = sub_253DEFC30();
  if (v1)
  {
    swift_bridgeObjectRelease();
    sub_253DD1170();
  }
  else
  {
    uint64_t v5 = v2;
    uint64_t v6 = (uint64_t *)v0[3];
    swift_bridgeObjectRelease();
    *uint64_t v6 = v3;
    v6[1] = v5;
    sub_253C0FDF8();
  }
  return v4();
}

void sub_253DEE30C()
{
  sub_253DEFB60();
  sub_253DEFBD4();
  sub_253C0F830();
  MEMORY[0x270FA5388](v2);
  sub_253DEFBA4();
  uint64_t v3 = sub_253BDEDD8((uint64_t *)&unk_26B2519E0);
  uint64_t v4 = sub_253BDF9FC(v3);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_253DDC1EC();
  sub_253DDC214(v5);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_253DEFA94(v6);
  v8(v7);
  sub_253DEFB8C();
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = sub_253DEFAE0(v9);
  v11(v10);
  sub_253DDB360();
  swift_retain();
  id v12 = v0;
  sub_253DF55B0();
  swift_release();
  swift_release();
  swift_release();
  sub_253BEFAC0(v1, (uint64_t *)&unk_26B2519E0);
  sub_253C1CEE8();
}

uint64_t sub_253DEE460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  return MEMORY[0x270FA2498](sub_253DEE484, 0, 0);
}

uint64_t sub_253DEE484()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 48)
                 + OBJC_IVAR____TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server_transcriptQueryingService);
  *(void *)(v0 + 64) = v1;
  return sub_253C10A10((uint64_t)sub_253DEE4AC, v1);
}

uint64_t sub_253DEE4AC()
{
  sub_253BDF8D0();
  swift_beginAccess();
  sub_253DEF388();
  swift_endAccess();
  swift_release();
  return MEMORY[0x270FA2498](sub_253DEE550, 0, 0);
}

uint64_t sub_253DEE550()
{
  sub_253BDF928();
  uint64_t v1 = *(uint64_t **)(v0 + 40);
  sub_253DDB360();
  *uint64_t v1 = sub_253DF57D0();
  sub_253C0FDF8();
  return v2();
}

void sub_253DEE5F0()
{
  sub_253DEFB60();
  uint64_t v20 = v0;
  uint64_t v21 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_253DEFE90();
  sub_253C0F830();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(v7);
  sub_253DEFE70();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  id v18 = v9;
  v3(v15, v5, v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  sub_253C1CEE8();
}

uint64_t type metadata accessor for TranscriptEntityQueryingXPCServiceServer.Server()
{
  return self;
}

ValueMetadata *type metadata accessor for TranscriptEntityQueryingXPCServiceServer()
{
  return &type metadata for TranscriptEntityQueryingXPCServiceServer;
}

uint64_t sub_253DEE7B0()
{
  return sub_253DEF9DC(&qword_26B2562F0, 255, MEMORY[0x263F4CDA8]);
}

void sub_253DEE7FC(void *a1@<X8>)
{
  sub_253DED484();
  *a1 = v2;
}

uint64_t sub_253DEE824@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_253DED3E4();
  *a1 = result;
  return result;
}

uint64_t sub_253DEE850(uint64_t *a1)
{
  return sub_253DED430(*a1);
}

uint64_t (*sub_253DEE878())()
{
  return j__swift_endAccess_0;
}

uint64_t sub_253DEE8D8()
{
  return sub_253DEF9DC(&qword_269D7F030, 255, MEMORY[0x263F4CDD8]);
}

uint64_t sub_253DEE924(uint64_t a1, uint64_t a2)
{
  return sub_253DEF9DC(&qword_26B256470, a2, (void (*)(uint64_t))type metadata accessor for TranscriptEntityQueryingXPCServiceServer.Server);
}

uint64_t sub_253DEE96C()
{
  swift_beginAccess();
  uint64_t v0 = qword_26B2576D0;
  id v1 = (id)qword_26B2576D0;
  return v0;
}

void sub_253DEE9B8(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = (void *)qword_26B2576D0;
  qword_26B2576D0 = a1;
}

uint64_t (*sub_253DEEA08())()
{
  return j_j__swift_endAccess_0;
}

uint64_t sub_253DEEA60()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_253DEEAA8(uint64_t a1)
{
  qword_26B2576C8 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_253DEEAF8())()
{
  return j_j__swift_endAccess_0;
}

uint64_t sub_253DEEB50()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_253DEEB8C()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DEFE90();
  sub_253C1CE88(v0);
  sub_253DDC4B8();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253DEFA24;
  uint64_t v4 = sub_253D11A40();
  return sub_253DEE460(v4, v5, v6);
}

uint64_t sub_253DEEC30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain();
  sub_253D87918(a1, a2);
  sub_253DEFB28();
  if (v8)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_253DEFA34();
    sub_253BDEDD8(&qword_269D7E910);
    sub_253DEFA50();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v17 + 56);
    uint64_t v10 = sub_253DF3C00();
    sub_253BDF7F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(a3, v9 + *(void *)(v11 + 72) * a1, v10);
    sub_253DF5A90();
    sub_253DEFBBC();
    uint64_t v12 = a3;
    uint64_t v13 = 0;
    uint64_t v14 = 1;
    uint64_t v15 = v10;
  }
  else
  {
    sub_253DF3C00();
    uint64_t v12 = sub_253D8BD80();
  }

  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v12, v13, v14, v15);
}

uint64_t sub_253DEED5C()
{
  sub_253DEFB60();
  uint64_t v13 = v3;
  sub_253DEFABC();
  sub_253DEFBF4();
  sub_253D87ADC();
  sub_253DEFB28();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_253DEFA34();
    sub_253BDEDD8(&qword_269D7E918);
    sub_253DEFA50();
    sub_253DEFB04();
    sub_253DEFFE0();
    sub_253BDF7F0();
    sub_253BEFBCC();
    v4();
    uint64_t v5 = *(void *)(v1 + 56);
    uint64_t v6 = sub_253DF4BA0();
    sub_253BDF7F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v0, v5 + *(void *)(v7 + 72) * v2, v6);
    sub_253DEF9DC(&qword_26B255340, 255, MEMORY[0x263F4BF98]);
    sub_253DEFA70();
    sub_253DEFBBC();
    uint64_t v8 = sub_253DEFB14();
  }
  else
  {
    sub_253DF4BA0();
    uint64_t v8 = sub_253D8BD80();
  }
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v8, v9, v10, v11);
}

uint64_t sub_253DEEE9C()
{
  sub_253DEFB60();
  uint64_t v14 = v4;
  sub_253DEFABC();
  uint64_t v5 = sub_253DEFBF4();
  sub_253D87CBC(v5);
  sub_253DEFB28();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_253DEFA34();
    sub_253BDEDD8(&qword_26B2561C8);
    sub_253DEFA50();
    sub_253DEFB04();
    sub_253DF14C0();
    sub_253BDF7F0();
    sub_253DEF988(v3 + *(void *)(v6 + 72) * v2, MEMORY[0x263F4CE38]);
    uint64_t v7 = *(void *)(v1 + 56);
    type metadata accessor for SessionSwitchboard.SessionInfo();
    sub_253BDF7F0();
    sub_253DEF928(v7 + *(void *)(v8 + 72) * v2, v0, (void (*)(void))type metadata accessor for SessionSwitchboard.SessionInfo);
    sub_253DEF9DC(&qword_26B255450, 255, MEMORY[0x263F4CE38]);
    sub_253DEFA70();
    sub_253DEFBBC();
    uint64_t v9 = sub_253DEFB14();
  }
  else
  {
    type metadata accessor for SessionSwitchboard.SessionInfo();
    uint64_t v9 = sub_253D8BD80();
  }
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v9, v10, v11, v12);
}

uint64_t sub_253DEEFE0()
{
  sub_253DEFB60();
  uint64_t v12 = v3;
  sub_253DEFABC();
  sub_253DEFBF4();
  sub_253D87B8C();
  sub_253DEFB28();
  if (v1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_253DEFA34();
    sub_253BDEDD8(&qword_269D7E880);
    sub_253DEFA50();
    sub_253DEFB04();
    sub_253DEFE90();
    sub_253BDF7F0();
    sub_253BEFBCC();
    v4();
    uint64_t v5 = *(void *)(v1 + 56);
    type metadata accessor for SessionCoordinatorInjectionRequest(0);
    sub_253BDF7F0();
    sub_253DEF928(v5 + *(void *)(v6 + 72) * v2, v0, (void (*)(void))type metadata accessor for SessionCoordinatorInjectionRequest);
    sub_253DEF9DC(&qword_26B2552E0, 255, MEMORY[0x263F07508]);
    sub_253DEFA70();
    sub_253DEFBBC();
    uint64_t v7 = sub_253DEFB14();
  }
  else
  {
    type metadata accessor for SessionCoordinatorInjectionRequest(0);
    uint64_t v7 = sub_253D8BD80();
  }
  return _s23IntelligenceFlowRuntime16FeedbackLearningO11ActionValueOwst_0(v7, v8, v9, v10);
}

uint64_t sub_253DEF120(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_253D87984(a1, a2);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  sub_253DEFB44();
  sub_253BDEDD8(&qword_26B2561D0);
  sub_253DEFA50();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v6);
  sub_253D764D0();
  sub_253DF5A90();
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

double sub_253DEF20C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  swift_bridgeObjectRetain();
  sub_253DEFBF4();
  unint64_t v5 = sub_253D87C3C();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_253DEFB44();
    sub_253BDEDD8(&qword_26B2561C0);
    sub_253DEFA50();
    sub_253DEFB04();
    sub_253DF08E0();
    sub_253BDF7F0();
    sub_253DEF988(v2 + *(void *)(v8 + 72) * v5, MEMORY[0x263F4C718]);
    uint64_t v9 = *(void *)(v7 + 56) + 56 * v5;
    uint64_t v10 = *(void *)(v9 + 8);
    char v11 = *(unsigned char *)(v9 + 32);
    *(void *)a1 = *(void *)v9;
    *(void *)(a1 + 8) = v10;
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(v9 + 16);
    *(unsigned char *)(a1 + 32) = v11;
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(v9 + 40);
    sub_253DEF9DC(&qword_26B2553A0, 255, MEMORY[0x263F4C718]);
    sub_253DF5A90();
    *uint64_t v3 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a1 + 48) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t sub_253DEF388()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  sub_253D87B8C();
  uint64_t v3 = v2;
  char v5 = v4;
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0) {
    return 0;
  }
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  sub_253BDEDD8(&qword_269D7E898);
  sub_253DF5A70();
  uint64_t v6 = *(void *)(v10 + 48);
  uint64_t v7 = sub_253DEFE90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6 + *(void *)(*(void *)(v7 - 8) + 72) * v3, v7);
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v3);
  type metadata accessor for TranscriptEntityQueryingService.ActiveQueryState();
  sub_253DEF9DC(&qword_26B2552E0, 255, MEMORY[0x263F07508]);
  sub_253DF5A90();
  *uint64_t v1 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_253DEF4F4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_253DEF52C(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(v2 + 16))(*a1, a1[1], a2);
}

uint64_t sub_253DEF564()
{
  sub_253DEFE90();
  sub_253C0F830();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 24) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  sub_253BEFD20();
  v8();

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_253DEF604()
{
  sub_253BDF8D0();
  uint64_t v0 = sub_253DEFE90();
  sub_253C1CE88(v0);
  sub_253DDC4B8();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_253BDF880(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_253DEF6A8;
  uint64_t v4 = sub_253D11A40();
  return sub_253DEE10C(v4, v5, v6);
}

uint64_t sub_253DEF6A8()
{
  sub_253BDF928();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_253DEF798()
{
  unint64_t result = qword_269D7F060;
  if (!qword_269D7F060)
  {
    sub_253C0BFF8(&qword_269D7F058);
    sub_253DEF9DC(&qword_269D7F068, 255, MEMORY[0x263F4CA88]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D7F060);
  }
  return result;
}

uint64_t sub_253DEF840()
{
  sub_253D75D88(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_253DEF880()
{
  sub_253BDF8D0();
  uint64_t v2 = v1;
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)sub_253BDF880(v6);
  void *v7 = v8;
  v7[1] = sub_253DEFA24;
  return sub_253DEDB78(v2, v3, v4, v5);
}

uint64_t sub_253DEF928(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_253BDF7F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_253DEF988(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_253BDF7F0();
  sub_253BEFBCC();
  v3();
  return a1;
}

uint64_t sub_253DEF9DC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_253DEFA34()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t sub_253DEFA50()
{
  return sub_253DF5A70();
}

uint64_t sub_253DEFA70()
{
  return sub_253DF5A90();
}

uint64_t sub_253DEFA94(uint64_t a1)
{
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v1;
  return v2;
}

uint64_t sub_253DEFABC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_253DEFAE0(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  return a1 + v2;
}

uint64_t sub_253DEFB04()
{
  return 0;
}

uint64_t sub_253DEFB14()
{
  return v0;
}

uint64_t sub_253DEFB28()
{
  return swift_bridgeObjectRelease();
}

void sub_253DEFB44()
{
  *uint64_t v0 = 0x8000000000000000;
}

uint64_t sub_253DEFB74()
{
  return v0;
}

uint64_t sub_253DEFBBC()
{
  *uint64_t v1 = v0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_253DEFBD4()
{
  return sub_253DEFE90();
}

uint64_t sub_253DEFBF4()
{
  return v0;
}

uint64_t sub_253DEFC00()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_253DEFC10()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_253DEFC20()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_253DEFC30()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_253DEFC40()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_253DEFC50()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_253DEFC60()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_253DEFC70()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_253DEFC80()
{
  return MEMORY[0x270EEE390]();
}

uint64_t sub_253DEFC90()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_253DEFCA0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_253DEFCB0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_253DEFCC0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_253DEFCD0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_253DEFCE0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_253DEFCF0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_253DEFD00()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_253DEFD10()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_253DEFD20()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_253DEFD30()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_253DEFD40()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_253DEFD50()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_253DEFD60()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_253DEFD70()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_253DEFD80()
{
  return MEMORY[0x270EF0098]();
}

uint64_t sub_253DEFD90()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_253DEFDA0()
{
  return MEMORY[0x270EF00D8]();
}

uint64_t sub_253DEFDB0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_253DEFDC0()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_253DEFDD0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_253DEFDE0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_253DEFDF0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_253DEFE00()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_253DEFE10()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_253DEFE20()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_253DEFE30()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_253DEFE40()
{
  return MEMORY[0x270EF0C70]();
}

uint64_t sub_253DEFE50()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_253DEFE60()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_253DEFE70()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_253DEFE80()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_253DEFE90()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_253DEFEA0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_253DEFEB0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_253DEFEE0()
{
  return MEMORY[0x270F286C0]();
}

uint64_t sub_253DEFEF0()
{
  return MEMORY[0x270F286C8]();
}

uint64_t sub_253DEFF10()
{
  return MEMORY[0x270F83BB8]();
}

uint64_t sub_253DEFF20()
{
  return MEMORY[0x270F3D6D8]();
}

uint64_t sub_253DEFF30()
{
  return MEMORY[0x270F3D728]();
}

uint64_t sub_253DEFF40()
{
  return MEMORY[0x270F3D748]();
}

uint64_t sub_253DEFF50()
{
  return MEMORY[0x270F3D778]();
}

uint64_t sub_253DEFF60()
{
  return MEMORY[0x270F3D780]();
}

uint64_t sub_253DEFF70()
{
  return MEMORY[0x270F3D788]();
}

uint64_t sub_253DEFF80()
{
  return MEMORY[0x270F3D790]();
}

uint64_t sub_253DEFF90()
{
  return MEMORY[0x270F3D7D0]();
}

uint64_t sub_253DEFFA0()
{
  return MEMORY[0x270F3D7E8]();
}

uint64_t sub_253DEFFB0()
{
  return MEMORY[0x270F3D7F0]();
}

uint64_t sub_253DEFFC0()
{
  return MEMORY[0x270F3D800]();
}

uint64_t sub_253DEFFD0()
{
  return MEMORY[0x270F3D808]();
}

uint64_t sub_253DEFFE0()
{
  return MEMORY[0x270F3D810]();
}

uint64_t sub_253DEFFF0()
{
  return MEMORY[0x270F3D818]();
}

uint64_t sub_253DF0000()
{
  return MEMORY[0x270F3D820]();
}

uint64_t sub_253DF0010()
{
  return MEMORY[0x270F3D828]();
}

uint64_t sub_253DF0020()
{
  return MEMORY[0x270F3D830]();
}

uint64_t sub_253DF0030()
{
  return MEMORY[0x270F3D838]();
}

uint64_t sub_253DF0040()
{
  return MEMORY[0x270F3D840]();
}

uint64_t sub_253DF0050()
{
  return MEMORY[0x270F3D848]();
}

uint64_t sub_253DF0060()
{
  return MEMORY[0x270F3D850]();
}

uint64_t sub_253DF0070()
{
  return MEMORY[0x270F3D858]();
}

uint64_t sub_253DF0080()
{
  return MEMORY[0x270F3D860]();
}

uint64_t sub_253DF0090()
{
  return MEMORY[0x270F3D868]();
}

uint64_t sub_253DF00A0()
{
  return MEMORY[0x270F3D870]();
}

uint64_t sub_253DF00B0()
{
  return MEMORY[0x270F3D878]();
}

uint64_t sub_253DF00C0()
{
  return MEMORY[0x270F3D880]();
}

uint64_t sub_253DF00D0()
{
  return MEMORY[0x270F3D888]();
}

uint64_t sub_253DF00E0()
{
  return MEMORY[0x270F3D8C0]();
}

uint64_t sub_253DF00F0()
{
  return MEMORY[0x270F3D8C8]();
}

uint64_t sub_253DF0100()
{
  return MEMORY[0x270F3D8D0]();
}

uint64_t sub_253DF0110()
{
  return MEMORY[0x270F3D8F8]();
}

uint64_t sub_253DF0120()
{
  return MEMORY[0x270F3D900]();
}

uint64_t sub_253DF0130()
{
  return MEMORY[0x270F3D908]();
}

uint64_t sub_253DF0140()
{
  return MEMORY[0x270F3D910]();
}

uint64_t sub_253DF0150()
{
  return MEMORY[0x270F3D940]();
}

uint64_t sub_253DF0160()
{
  return MEMORY[0x270F3D958]();
}

uint64_t sub_253DF0170()
{
  return MEMORY[0x270F3D960]();
}

uint64_t sub_253DF0180()
{
  return MEMORY[0x270F3D970]();
}

uint64_t sub_253DF01A0()
{
  return MEMORY[0x270F3D9A8]();
}

uint64_t sub_253DF01B0()
{
  return MEMORY[0x270F3D9C0]();
}

uint64_t sub_253DF01C0()
{
  return MEMORY[0x270F3D9C8]();
}

uint64_t sub_253DF01D0()
{
  return MEMORY[0x270F3D9D8]();
}

uint64_t sub_253DF01E0()
{
  return MEMORY[0x270F3DA00]();
}

uint64_t sub_253DF01F0()
{
  return MEMORY[0x270F3DA08]();
}

uint64_t sub_253DF0200()
{
  return MEMORY[0x270F3DA10]();
}

uint64_t sub_253DF0210()
{
  return MEMORY[0x270F3DA18]();
}

uint64_t sub_253DF0220()
{
  return MEMORY[0x270F3DA20]();
}

uint64_t sub_253DF0230()
{
  return MEMORY[0x270F3DAB0]();
}

uint64_t sub_253DF0240()
{
  return MEMORY[0x270F3DAE8]();
}

uint64_t sub_253DF0250()
{
  return MEMORY[0x270F3DAF0]();
}

uint64_t sub_253DF0260()
{
  return MEMORY[0x270F3DAF8]();
}

uint64_t sub_253DF0270()
{
  return MEMORY[0x270F3DB00]();
}

uint64_t sub_253DF0280()
{
  return MEMORY[0x270F3DB08]();
}

uint64_t sub_253DF0290()
{
  return MEMORY[0x270F3DB10]();
}

uint64_t sub_253DF02A0()
{
  return MEMORY[0x270F3DB30]();
}

uint64_t sub_253DF02B0()
{
  return MEMORY[0x270F3DB48]();
}

uint64_t sub_253DF02C0()
{
  return MEMORY[0x270F3DB50]();
}

uint64_t sub_253DF02D0()
{
  return MEMORY[0x270F3DB58]();
}

uint64_t sub_253DF02E0()
{
  return MEMORY[0x270F3DB60]();
}

uint64_t sub_253DF02F0()
{
  return MEMORY[0x270F3DB68]();
}

uint64_t sub_253DF0300()
{
  return MEMORY[0x270F3DB70]();
}

uint64_t sub_253DF0310()
{
  return MEMORY[0x270F3DB78]();
}

uint64_t sub_253DF0320()
{
  return MEMORY[0x270F3DB80]();
}

uint64_t sub_253DF0330()
{
  return MEMORY[0x270F3DB90]();
}

uint64_t sub_253DF0340()
{
  return MEMORY[0x270F3DB98]();
}

uint64_t sub_253DF0350()
{
  return MEMORY[0x270F3DBA0]();
}

uint64_t sub_253DF0360()
{
  return MEMORY[0x270F3DBA8]();
}

uint64_t sub_253DF0370()
{
  return MEMORY[0x270F3DBB0]();
}

uint64_t sub_253DF0380()
{
  return MEMORY[0x270F3DBC0]();
}

uint64_t sub_253DF0390()
{
  return MEMORY[0x270F3DBC8]();
}

uint64_t sub_253DF03A0()
{
  return MEMORY[0x270F3DBD0]();
}

uint64_t sub_253DF03B0()
{
  return MEMORY[0x270F3DBD8]();
}

uint64_t sub_253DF03C0()
{
  return MEMORY[0x270F3DBE0]();
}

uint64_t sub_253DF03D0()
{
  return MEMORY[0x270F3DBF8]();
}

uint64_t sub_253DF03E0()
{
  return MEMORY[0x270F3DC00]();
}

uint64_t sub_253DF03F0()
{
  return MEMORY[0x270F3DC08]();
}

uint64_t sub_253DF0400()
{
  return MEMORY[0x270F3DC10]();
}

uint64_t sub_253DF0410()
{
  return MEMORY[0x270F3DC68]();
}

uint64_t sub_253DF0420()
{
  return MEMORY[0x270F3DC70]();
}

uint64_t sub_253DF0430()
{
  return MEMORY[0x270F3DC78]();
}

uint64_t sub_253DF0440()
{
  return MEMORY[0x270F3DC80]();
}

uint64_t sub_253DF0450()
{
  return MEMORY[0x270F3F768]();
}

uint64_t sub_253DF0460()
{
  return MEMORY[0x270F3DCD8]();
}

uint64_t sub_253DF0470()
{
  return MEMORY[0x270F3DCE0]();
}

uint64_t sub_253DF0480()
{
  return MEMORY[0x270F3DCE8]();
}

uint64_t sub_253DF0490()
{
  return MEMORY[0x270F3DCF0]();
}

uint64_t sub_253DF04A0()
{
  return MEMORY[0x270F3DCF8]();
}

uint64_t sub_253DF04B0()
{
  return MEMORY[0x270F3DD00]();
}

uint64_t sub_253DF04C0()
{
  return MEMORY[0x270F3DD08]();
}

uint64_t sub_253DF04D0()
{
  return MEMORY[0x270F3DD10]();
}

uint64_t sub_253DF04E0()
{
  return MEMORY[0x270F3DD18]();
}

uint64_t sub_253DF04F0()
{
  return MEMORY[0x270F3DD30]();
}

uint64_t sub_253DF0510()
{
  return MEMORY[0x270F3DD40]();
}

uint64_t sub_253DF0520()
{
  return MEMORY[0x270F3DD50]();
}

uint64_t sub_253DF0530()
{
  return MEMORY[0x270F3DD58]();
}

uint64_t sub_253DF0540()
{
  return MEMORY[0x270F3DD60]();
}

uint64_t sub_253DF0550()
{
  return MEMORY[0x270F3DD68]();
}

uint64_t sub_253DF0560()
{
  return MEMORY[0x270F3F770]();
}

uint64_t sub_253DF0570()
{
  return MEMORY[0x270F3DD90]();
}

uint64_t sub_253DF0580()
{
  return MEMORY[0x270F3DD98]();
}

uint64_t sub_253DF0590()
{
  return MEMORY[0x270F3DDA0]();
}

uint64_t sub_253DF05A0()
{
  return MEMORY[0x270F3DE98]();
}

uint64_t sub_253DF05B0()
{
  return MEMORY[0x270F3DEA8]();
}

uint64_t sub_253DF05C0()
{
  return MEMORY[0x270F3DEB0]();
}

uint64_t sub_253DF05D0()
{
  return MEMORY[0x270F3DEB8]();
}

uint64_t sub_253DF05E0()
{
  return MEMORY[0x270F3DEC0]();
}

uint64_t sub_253DF05F0()
{
  return MEMORY[0x270F3DEC8]();
}

uint64_t sub_253DF0600()
{
  return MEMORY[0x270F3F778]();
}

uint64_t sub_253DF0610()
{
  return MEMORY[0x270F3DEE0]();
}

uint64_t sub_253DF0620()
{
  return MEMORY[0x270F3DEE8]();
}

uint64_t sub_253DF0630()
{
  return MEMORY[0x270F3DEF0]();
}

uint64_t sub_253DF0640()
{
  return MEMORY[0x270F3DEF8]();
}

uint64_t sub_253DF0650()
{
  return MEMORY[0x270F3DF00]();
}

uint64_t sub_253DF0660()
{
  return MEMORY[0x270F3DF18]();
}

uint64_t sub_253DF0670()
{
  return MEMORY[0x270F3DF20]();
}

uint64_t sub_253DF0680()
{
  return MEMORY[0x270F3DF28]();
}

uint64_t sub_253DF0690()
{
  return MEMORY[0x270F3DF30]();
}

uint64_t sub_253DF06A0()
{
  return MEMORY[0x270F3DF38]();
}

uint64_t sub_253DF06B0()
{
  return MEMORY[0x270F3DF40]();
}

uint64_t sub_253DF06C0()
{
  return MEMORY[0x270F3DF60]();
}

uint64_t sub_253DF06D0()
{
  return MEMORY[0x270F3DF68]();
}

uint64_t sub_253DF06E0()
{
  return MEMORY[0x270F3DF70]();
}

uint64_t sub_253DF06F0()
{
  return MEMORY[0x270F3DF78]();
}

uint64_t sub_253DF0700()
{
  return MEMORY[0x270F3DF80]();
}

uint64_t sub_253DF0710()
{
  return MEMORY[0x270F3DF88]();
}

uint64_t sub_253DF0720()
{
  return MEMORY[0x270F3F780]();
}

uint64_t sub_253DF0730()
{
  return MEMORY[0x270F3DFB0]();
}

uint64_t sub_253DF0740()
{
  return MEMORY[0x270F3DFC0]();
}

uint64_t sub_253DF0750()
{
  return MEMORY[0x270F3DFC8]();
}

uint64_t sub_253DF0760()
{
  return MEMORY[0x270F3DFD0]();
}

uint64_t sub_253DF0770()
{
  return MEMORY[0x270F3DFD8]();
}

uint64_t sub_253DF0780()
{
  return MEMORY[0x270F3DFE0]();
}

uint64_t sub_253DF0790()
{
  return MEMORY[0x270F3E000]();
}

uint64_t sub_253DF07A0()
{
  return MEMORY[0x270F3E188]();
}

uint64_t sub_253DF07B0()
{
  return MEMORY[0x270F3E198]();
}

uint64_t sub_253DF07C0()
{
  return MEMORY[0x270F3E1A0]();
}

uint64_t sub_253DF07D0()
{
  return MEMORY[0x270F3E1A8]();
}

uint64_t sub_253DF07E0()
{
  return MEMORY[0x270F3E1C0]();
}

uint64_t sub_253DF07F0()
{
  return MEMORY[0x270F3E1E8]();
}

uint64_t sub_253DF0800()
{
  return MEMORY[0x270F3E218]();
}

uint64_t sub_253DF0810()
{
  return MEMORY[0x270F3E230]();
}

uint64_t sub_253DF0820()
{
  return MEMORY[0x270F3E240]();
}

uint64_t sub_253DF0830()
{
  return MEMORY[0x270F3E248]();
}

uint64_t sub_253DF0840()
{
  return MEMORY[0x270F3E268]();
}

uint64_t sub_253DF0850()
{
  return MEMORY[0x270F3E278]();
}

uint64_t sub_253DF0860()
{
  return MEMORY[0x270F3E280]();
}

uint64_t sub_253DF0870()
{
  return MEMORY[0x270F3E2B8]();
}

uint64_t sub_253DF0880()
{
  return MEMORY[0x270F3E2D8]();
}

uint64_t sub_253DF0890()
{
  return MEMORY[0x270F3E2E0]();
}

uint64_t sub_253DF08A0()
{
  return MEMORY[0x270F3E308]();
}

uint64_t sub_253DF08B0()
{
  return MEMORY[0x270F3E328]();
}

uint64_t sub_253DF08C0()
{
  return MEMORY[0x270F3E330]();
}

uint64_t sub_253DF08D0()
{
  return MEMORY[0x270F3E338]();
}

uint64_t sub_253DF08E0()
{
  return MEMORY[0x270F3E340]();
}

uint64_t sub_253DF08F0()
{
  return MEMORY[0x270F3E348]();
}

uint64_t sub_253DF0900()
{
  return MEMORY[0x270F3E350]();
}

uint64_t sub_253DF0910()
{
  return MEMORY[0x270F3E358]();
}

uint64_t sub_253DF0920()
{
  return MEMORY[0x270F3E360]();
}

uint64_t sub_253DF0930()
{
  return MEMORY[0x270F3E368]();
}

uint64_t sub_253DF0940()
{
  return MEMORY[0x270F3E370]();
}

uint64_t sub_253DF0950()
{
  return MEMORY[0x270F3E378]();
}

uint64_t sub_253DF0960()
{
  return MEMORY[0x270F3E380]();
}

uint64_t sub_253DF0970()
{
  return MEMORY[0x270F3E388]();
}

uint64_t sub_253DF0980()
{
  return MEMORY[0x270F3E398]();
}

uint64_t sub_253DF0990()
{
  return MEMORY[0x270F3E3C0]();
}

uint64_t sub_253DF09A0()
{
  return MEMORY[0x270F3E3C8]();
}

uint64_t sub_253DF09B0()
{
  return MEMORY[0x270F3E3F0]();
}

uint64_t sub_253DF09D0()
{
  return MEMORY[0x270F3E400]();
}

uint64_t sub_253DF09E0()
{
  return MEMORY[0x270F3E418]();
}

uint64_t sub_253DF09F0()
{
  return MEMORY[0x270F3E420]();
}

uint64_t sub_253DF0A00()
{
  return MEMORY[0x270F3E428]();
}

uint64_t sub_253DF0A10()
{
  return MEMORY[0x270F3E450]();
}

uint64_t sub_253DF0A20()
{
  return MEMORY[0x270F3E458]();
}

uint64_t sub_253DF0A30()
{
  return MEMORY[0x270F3E468]();
}

uint64_t sub_253DF0A40()
{
  return MEMORY[0x270F3E480]();
}

uint64_t sub_253DF0A50()
{
  return MEMORY[0x270F3E488]();
}

uint64_t sub_253DF0A60()
{
  return MEMORY[0x270F3E490]();
}

uint64_t sub_253DF0A70()
{
  return MEMORY[0x270F3F788]();
}

uint64_t sub_253DF0A80()
{
  return MEMORY[0x270F3E548]();
}

uint64_t sub_253DF0A90()
{
  return MEMORY[0x270F3E580]();
}

uint64_t sub_253DF0AA0()
{
  return MEMORY[0x270F3E588]();
}

uint64_t sub_253DF0AB0()
{
  return MEMORY[0x270F3E590]();
}

uint64_t sub_253DF0AC0()
{
  return MEMORY[0x270F3E5A8]();
}

uint64_t sub_253DF0AD0()
{
  return MEMORY[0x270F3E5B8]();
}

uint64_t sub_253DF0AE0()
{
  return MEMORY[0x270F3E5C0]();
}

uint64_t sub_253DF0AF0()
{
  return MEMORY[0x270F3E5D0]();
}

uint64_t sub_253DF0B00()
{
  return MEMORY[0x270F3E5D8]();
}

uint64_t sub_253DF0B10()
{
  return MEMORY[0x270F3E5F0]();
}

uint64_t sub_253DF0B20()
{
  return MEMORY[0x270F3E618]();
}

uint64_t sub_253DF0B30()
{
  return MEMORY[0x270F3E620]();
}

uint64_t sub_253DF0B40()
{
  return MEMORY[0x270F3E628]();
}

uint64_t sub_253DF0B50()
{
  return MEMORY[0x270F3E630]();
}

uint64_t sub_253DF0B60()
{
  return MEMORY[0x270F3E638]();
}

uint64_t sub_253DF0B70()
{
  return MEMORY[0x270F3E640]();
}

uint64_t sub_253DF0B80()
{
  return MEMORY[0x270F3E648]();
}

uint64_t sub_253DF0B90()
{
  return MEMORY[0x270F3E650]();
}

uint64_t sub_253DF0BA0()
{
  return MEMORY[0x270F3E658]();
}

uint64_t sub_253DF0BB0()
{
  return MEMORY[0x270F3E660]();
}

uint64_t sub_253DF0BC0()
{
  return MEMORY[0x270F3E668]();
}

uint64_t sub_253DF0BD0()
{
  return MEMORY[0x270F3E690]();
}

uint64_t sub_253DF0BE0()
{
  return MEMORY[0x270F3E6A0]();
}

uint64_t sub_253DF0BF0()
{
  return MEMORY[0x270F3E6A8]();
}

uint64_t sub_253DF0C00()
{
  return MEMORY[0x270F3E6B0]();
}

uint64_t sub_253DF0C10()
{
  return MEMORY[0x270F3E6B8]();
}

uint64_t sub_253DF0C20()
{
  return MEMORY[0x270F3E6C0]();
}

uint64_t sub_253DF0C30()
{
  return MEMORY[0x270F3E6C8]();
}

uint64_t sub_253DF0C40()
{
  return MEMORY[0x270F3E6D0]();
}

uint64_t sub_253DF0C50()
{
  return MEMORY[0x270F3E6D8]();
}

uint64_t sub_253DF0C60()
{
  return MEMORY[0x270F3E6E0]();
}

uint64_t sub_253DF0C70()
{
  return MEMORY[0x270F3E6E8]();
}

uint64_t sub_253DF0C80()
{
  return MEMORY[0x270F3F790]();
}

uint64_t sub_253DF0C90()
{
  return MEMORY[0x270F3E728]();
}

uint64_t sub_253DF0CA0()
{
  return MEMORY[0x270F3E730]();
}

uint64_t sub_253DF0CB0()
{
  return MEMORY[0x270F3E738]();
}

uint64_t sub_253DF0CC0()
{
  return MEMORY[0x270F3E740]();
}

uint64_t sub_253DF0CD0()
{
  return MEMORY[0x270F3E748]();
}

uint64_t sub_253DF0CE0()
{
  return MEMORY[0x270F3E750]();
}

uint64_t sub_253DF0CF0()
{
  return MEMORY[0x270F3E760]();
}

uint64_t sub_253DF0D00()
{
  return MEMORY[0x270F3E768]();
}

uint64_t sub_253DF0D10()
{
  return MEMORY[0x270F3E770]();
}

uint64_t sub_253DF0D20()
{
  return MEMORY[0x270F3E778]();
}

uint64_t sub_253DF0D30()
{
  return MEMORY[0x270F3E790]();
}

uint64_t sub_253DF0D40()
{
  return MEMORY[0x270F3E798]();
}

uint64_t sub_253DF0D50()
{
  return MEMORY[0x270F3E7A0]();
}

uint64_t sub_253DF0D60()
{
  return MEMORY[0x270F3E7A8]();
}

uint64_t sub_253DF0D70()
{
  return MEMORY[0x270F3E7B0]();
}

uint64_t sub_253DF0D80()
{
  return MEMORY[0x270F3E7B8]();
}

uint64_t sub_253DF0D90()
{
  return MEMORY[0x270F3E7C0]();
}

uint64_t sub_253DF0DA0()
{
  return MEMORY[0x270F3E7C8]();
}

uint64_t sub_253DF0DB0()
{
  return MEMORY[0x270F3E7D0]();
}

uint64_t sub_253DF0DC0()
{
  return MEMORY[0x270F3E7E0]();
}

uint64_t sub_253DF0DD0()
{
  return MEMORY[0x270F3E7E8]();
}

uint64_t sub_253DF0DE0()
{
  return MEMORY[0x270F3E7F0]();
}

uint64_t sub_253DF0DF0()
{
  return MEMORY[0x270F3E7F8]();
}

uint64_t sub_253DF0E10()
{
  return MEMORY[0x270F3E810]();
}

uint64_t sub_253DF0E20()
{
  return MEMORY[0x270F3E818]();
}

uint64_t sub_253DF0E30()
{
  return MEMORY[0x270F3E820]();
}

uint64_t sub_253DF0E40()
{
  return MEMORY[0x270F3E828]();
}

uint64_t sub_253DF0E60()
{
  return MEMORY[0x270F3E840]();
}

uint64_t sub_253DF0E70()
{
  return MEMORY[0x270F3E848]();
}

uint64_t sub_253DF0E80()
{
  return MEMORY[0x270F3E850]();
}

uint64_t sub_253DF0E90()
{
  return MEMORY[0x270F3E858]();
}

uint64_t sub_253DF0EA0()
{
  return MEMORY[0x270F3E868]();
}

uint64_t sub_253DF0EB0()
{
  return MEMORY[0x270F3E870]();
}

uint64_t sub_253DF0EC0()
{
  return MEMORY[0x270F3E878]();
}

uint64_t sub_253DF0ED0()
{
  return MEMORY[0x270F3E890]();
}

uint64_t sub_253DF0EE0()
{
  return MEMORY[0x270F3E8A0]();
}

uint64_t sub_253DF0EF0()
{
  return MEMORY[0x270F3E8A8]();
}

uint64_t sub_253DF0F00()
{
  return MEMORY[0x270F3E8B0]();
}

uint64_t sub_253DF0F10()
{
  return MEMORY[0x270F3E8B8]();
}

uint64_t sub_253DF0F20()
{
  return MEMORY[0x270F3E8C0]();
}

uint64_t sub_253DF0F30()
{
  return MEMORY[0x270F3E8C8]();
}

uint64_t sub_253DF0F40()
{
  return MEMORY[0x270F3E8D0]();
}

uint64_t sub_253DF0F50()
{
  return MEMORY[0x270F3F7A0]();
}

uint64_t sub_253DF0F60()
{
  return MEMORY[0x270F3E900]();
}

uint64_t sub_253DF0F70()
{
  return MEMORY[0x270F3F7A8]();
}

uint64_t sub_253DF0F80()
{
  return MEMORY[0x270F3E910]();
}

uint64_t sub_253DF0F90()
{
  return MEMORY[0x270F3E918]();
}

uint64_t sub_253DF0FA0()
{
  return MEMORY[0x270F3F7B0]();
}

uint64_t sub_253DF0FB0()
{
  return MEMORY[0x270F3E990]();
}

uint64_t sub_253DF0FC0()
{
  return MEMORY[0x270F3E998]();
}

uint64_t sub_253DF0FD0()
{
  return MEMORY[0x270F3E9A0]();
}

uint64_t sub_253DF0FF0()
{
  return MEMORY[0x270F3E9B0]();
}

uint64_t sub_253DF1000()
{
  return MEMORY[0x270F3E9B8]();
}

uint64_t sub_253DF1010()
{
  return MEMORY[0x270F3E9C0]();
}

uint64_t sub_253DF1020()
{
  return MEMORY[0x270F3E9C8]();
}

uint64_t sub_253DF1030()
{
  return MEMORY[0x270F3E9F8]();
}

uint64_t sub_253DF1040()
{
  return MEMORY[0x270F3EA00]();
}

uint64_t sub_253DF1050()
{
  return MEMORY[0x270F3EA08]();
}

uint64_t sub_253DF1060()
{
  return MEMORY[0x270F3EA10]();
}

uint64_t sub_253DF1070()
{
  return MEMORY[0x270F3EA18]();
}

uint64_t sub_253DF1080()
{
  return MEMORY[0x270F3EA20]();
}

uint64_t sub_253DF1090()
{
  return MEMORY[0x270F3EA48]();
}

uint64_t sub_253DF10A0()
{
  return MEMORY[0x270F3EA50]();
}

uint64_t sub_253DF10B0()
{
  return MEMORY[0x270F3EA68]();
}

uint64_t sub_253DF10C0()
{
  return MEMORY[0x270F3EA78]();
}

uint64_t sub_253DF10D0()
{
  return MEMORY[0x270F3EA80]();
}

uint64_t sub_253DF10E0()
{
  return MEMORY[0x270F3EA90]();
}

uint64_t sub_253DF10F0()
{
  return MEMORY[0x270F3EA98]();
}

uint64_t sub_253DF1100()
{
  return MEMORY[0x270F3EAA0]();
}

uint64_t sub_253DF1110()
{
  return MEMORY[0x270F3EAA8]();
}

uint64_t sub_253DF1120()
{
  return MEMORY[0x270F3EAB0]();
}

uint64_t sub_253DF1130()
{
  return MEMORY[0x270F3EAB8]();
}

uint64_t sub_253DF1140()
{
  return MEMORY[0x270F3EAC0]();
}

uint64_t sub_253DF1150()
{
  return MEMORY[0x270F3EAC8]();
}

uint64_t sub_253DF1170()
{
  return MEMORY[0x270F3EAD8]();
}

uint64_t sub_253DF1180()
{
  return MEMORY[0x270F3EAE0]();
}

uint64_t sub_253DF1190()
{
  return MEMORY[0x270F3EAE8]();
}

uint64_t sub_253DF11A0()
{
  return MEMORY[0x270F3EAF0]();
}

uint64_t sub_253DF11B0()
{
  return MEMORY[0x270F3EAF8]();
}

uint64_t sub_253DF11C0()
{
  return MEMORY[0x270F3EB00]();
}

uint64_t sub_253DF11D0()
{
  return MEMORY[0x270F3EB08]();
}

uint64_t sub_253DF11E0()
{
  return MEMORY[0x270F3EB10]();
}

uint64_t sub_253DF11F0()
{
  return MEMORY[0x270F3EB18]();
}

uint64_t sub_253DF1200()
{
  return MEMORY[0x270F3EB20]();
}

uint64_t sub_253DF1210()
{
  return MEMORY[0x270F3EB28]();
}

uint64_t sub_253DF1220()
{
  return MEMORY[0x270F3EB30]();
}

uint64_t sub_253DF1230()
{
  return MEMORY[0x270F3EB38]();
}

uint64_t sub_253DF1240()
{
  return MEMORY[0x270F3EB40]();
}

uint64_t sub_253DF1250()
{
  return MEMORY[0x270F3EB48]();
}

uint64_t sub_253DF1260()
{
  return MEMORY[0x270F3EB50]();
}

uint64_t sub_253DF1270()
{
  return MEMORY[0x270F3EB58]();
}

uint64_t sub_253DF1280()
{
  return MEMORY[0x270F3EB60]();
}

uint64_t sub_253DF1290()
{
  return MEMORY[0x270F3EB68]();
}

uint64_t sub_253DF12A0()
{
  return MEMORY[0x270F3EB70]();
}

uint64_t sub_253DF12B0()
{
  return MEMORY[0x270F3EB78]();
}

uint64_t sub_253DF12C0()
{
  return MEMORY[0x270F3EB80]();
}

uint64_t sub_253DF12D0()
{
  return MEMORY[0x270F3EB88]();
}

uint64_t sub_253DF12E0()
{
  return MEMORY[0x270F3EB90]();
}

uint64_t sub_253DF1300()
{
  return MEMORY[0x270F3EBA0]();
}

uint64_t sub_253DF1310()
{
  return MEMORY[0x270F3EBA8]();
}

uint64_t sub_253DF1320()
{
  return MEMORY[0x270F3EBB0]();
}

uint64_t sub_253DF1330()
{
  return MEMORY[0x270F3EBB8]();
}

uint64_t sub_253DF1340()
{
  return MEMORY[0x270F3EBC0]();
}

uint64_t sub_253DF1350()
{
  return MEMORY[0x270F3EBC8]();
}

uint64_t sub_253DF1360()
{
  return MEMORY[0x270F3EBD0]();
}

uint64_t sub_253DF1370()
{
  return MEMORY[0x270F3EBD8]();
}

uint64_t sub_253DF1380()
{
  return MEMORY[0x270F3EBE0]();
}

uint64_t sub_253DF1390()
{
  return MEMORY[0x270F3EBE8]();
}

uint64_t sub_253DF13A0()
{
  return MEMORY[0x270F3EBF0]();
}

uint64_t sub_253DF13B0()
{
  return MEMORY[0x270F3EBF8]();
}

uint64_t sub_253DF13C0()
{
  return MEMORY[0x270F3EC00]();
}

uint64_t sub_253DF13D0()
{
  return MEMORY[0x270F3EC08]();
}

uint64_t sub_253DF13E0()
{
  return MEMORY[0x270F3EC10]();
}

uint64_t sub_253DF13F0()
{
  return MEMORY[0x270F3EC18]();
}

uint64_t sub_253DF1400()
{
  return MEMORY[0x270F3EC80]();
}

uint64_t sub_253DF1410()
{
  return MEMORY[0x270F3ECF0]();
}

uint64_t sub_253DF1420()
{
  return MEMORY[0x270F3ECF8]();
}

uint64_t sub_253DF1430()
{
  return MEMORY[0x270F3ED00]();
}

uint64_t sub_253DF1440()
{
  return MEMORY[0x270F3ED10]();
}

uint64_t sub_253DF1450()
{
  return MEMORY[0x270F3F850]();
}

uint64_t sub_253DF1460()
{
  return MEMORY[0x270F3EF20]();
}

uint64_t sub_253DF1470()
{
  return MEMORY[0x270F3EF28]();
}

uint64_t sub_253DF1480()
{
  return MEMORY[0x270F3EF30]();
}

uint64_t sub_253DF1490()
{
  return MEMORY[0x270F3EF38]();
}

uint64_t sub_253DF14A0()
{
  return MEMORY[0x270F3EF48]();
}

uint64_t sub_253DF14B0()
{
  return MEMORY[0x270F3EF50]();
}

uint64_t sub_253DF14C0()
{
  return MEMORY[0x270F3EF58]();
}

uint64_t sub_253DF14D0()
{
  return MEMORY[0x270F57F48]();
}

uint64_t sub_253DF14F0()
{
  return MEMORY[0x270F550C8]();
}

uint64_t sub_253DF1500()
{
  return MEMORY[0x270F18248]();
}

uint64_t sub_253DF1510()
{
  return MEMORY[0x270F18290]();
}

uint64_t sub_253DF1520()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_253DF1530()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_253DF1540()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_253DF1550()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_253DF1560()
{
  return MEMORY[0x270F44C70]();
}

uint64_t sub_253DF1570()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_253DF1580()
{
  return MEMORY[0x270F44CA8]();
}

uint64_t sub_253DF1590()
{
  return MEMORY[0x270F41250]();
}

uint64_t sub_253DF15A0()
{
  return MEMORY[0x270F412D8]();
}

uint64_t sub_253DF15B0()
{
  return MEMORY[0x270F412E0]();
}

uint64_t sub_253DF15C0()
{
  return MEMORY[0x270F412F0]();
}

uint64_t sub_253DF15D0()
{
  return MEMORY[0x270F41300]();
}

uint64_t sub_253DF15E0()
{
  return MEMORY[0x270F41308]();
}

uint64_t sub_253DF15F0()
{
  return MEMORY[0x270F41330]();
}

uint64_t sub_253DF1600()
{
  return MEMORY[0x270F41348]();
}

uint64_t sub_253DF1610()
{
  return MEMORY[0x270F41350]();
}

uint64_t sub_253DF1620()
{
  return MEMORY[0x270F41358]();
}

uint64_t sub_253DF1630()
{
  return MEMORY[0x270F41360]();
}

uint64_t sub_253DF1640()
{
  return MEMORY[0x270F41518]();
}

uint64_t sub_253DF1650()
{
  return MEMORY[0x270F41530]();
}

uint64_t sub_253DF1660()
{
  return MEMORY[0x270F41550]();
}

uint64_t sub_253DF1670()
{
  return MEMORY[0x270F3F490]();
}

uint64_t sub_253DF1680()
{
  return MEMORY[0x270F41600]();
}

uint64_t sub_253DF1690()
{
  return MEMORY[0x270F41610]();
}

uint64_t sub_253DF16A0()
{
  return MEMORY[0x270F41698]();
}

uint64_t sub_253DF16B0()
{
  return MEMORY[0x270F417A0]();
}

uint64_t sub_253DF16C0()
{
  return MEMORY[0x270F41888]();
}

uint64_t sub_253DF16D0()
{
  return MEMORY[0x270F41930]();
}

uint64_t sub_253DF16E0()
{
  return MEMORY[0x270F41948]();
}

uint64_t sub_253DF16F0()
{
  return MEMORY[0x270F41A08]();
}

uint64_t sub_253DF1700()
{
  return MEMORY[0x270F41A30]();
}

uint64_t sub_253DF1710()
{
  return MEMORY[0x270F41A48]();
}

uint64_t sub_253DF1720()
{
  return MEMORY[0x270F41A50]();
}

uint64_t sub_253DF1730()
{
  return MEMORY[0x270F41AA8]();
}

uint64_t sub_253DF1740()
{
  return MEMORY[0x270F41AB0]();
}

uint64_t _s23IntelligenceFlowRuntime0aB6DaemonV6logger2os6LoggerVvgZ_0()
{
  return MEMORY[0x270F41AC8]();
}

uint64_t sub_253DF1760()
{
  return MEMORY[0x270F41AD0]();
}

uint64_t sub_253DF1770()
{
  return MEMORY[0x270F41AD8]();
}

uint64_t sub_253DF1780()
{
  return MEMORY[0x270F41AE0]();
}

uint64_t sub_253DF1790()
{
  return MEMORY[0x270F41AE8]();
}

uint64_t sub_253DF17A0()
{
  return MEMORY[0x270F41AF8]();
}

uint64_t sub_253DF17B0()
{
  return MEMORY[0x270F41B00]();
}

uint64_t sub_253DF17C0()
{
  return MEMORY[0x270F575F8]();
}

uint64_t sub_253DF17D0()
{
  return MEMORY[0x270F57600]();
}

uint64_t sub_253DF17E0()
{
  return MEMORY[0x270F57628]();
}

uint64_t sub_253DF17F0()
{
  return MEMORY[0x270F57650]();
}

uint64_t sub_253DF1800()
{
  return MEMORY[0x270F57658]();
}

uint64_t sub_253DF1810()
{
  return MEMORY[0x270F57668]();
}

uint64_t sub_253DF1830()
{
  return MEMORY[0x270F576C0]();
}

uint64_t sub_253DF1840()
{
  return MEMORY[0x270F576C8]();
}

uint64_t sub_253DF1850()
{
  return MEMORY[0x270F576D0]();
}

uint64_t sub_253DF1880()
{
  return MEMORY[0x270F576E8]();
}

uint64_t sub_253DF1890()
{
  return MEMORY[0x270F576F0]();
}

uint64_t sub_253DF18A0()
{
  return MEMORY[0x270F576F8]();
}

uint64_t sub_253DF18B0()
{
  return MEMORY[0x270F57720]();
}

uint64_t sub_253DF18C0()
{
  return MEMORY[0x270F57728]();
}

uint64_t sub_253DF18D0()
{
  return MEMORY[0x270F57738]();
}

uint64_t sub_253DF18E0()
{
  return MEMORY[0x270F577A0]();
}

uint64_t sub_253DF18F0()
{
  return MEMORY[0x270F577A8]();
}

uint64_t sub_253DF1920()
{
  return MEMORY[0x270F577C0]();
}

uint64_t sub_253DF1930()
{
  return MEMORY[0x270F577C8]();
}

uint64_t sub_253DF1940()
{
  return MEMORY[0x270F577D0]();
}

uint64_t sub_253DF1950()
{
  return MEMORY[0x270F57810]();
}

uint64_t sub_253DF1960()
{
  return MEMORY[0x270F57818]();
}

uint64_t sub_253DF1970()
{
  return MEMORY[0x270F57828]();
}

uint64_t sub_253DF1980()
{
  return MEMORY[0x270F57830]();
}

uint64_t sub_253DF1990()
{
  return MEMORY[0x270F3EFD0]();
}

uint64_t sub_253DF19A0()
{
  return MEMORY[0x270F3EFD8]();
}

uint64_t sub_253DF19B0()
{
  return MEMORY[0x270F41EE8]();
}

uint64_t sub_253DF19C0()
{
  return MEMORY[0x270F41F00]();
}

uint64_t sub_253DF19D0()
{
  return MEMORY[0x270F41F18]();
}

uint64_t sub_253DF19E0()
{
  return MEMORY[0x270F41F28]();
}

uint64_t sub_253DF19F0()
{
  return MEMORY[0x270F41F38]();
}

uint64_t sub_253DF1A00()
{
  return MEMORY[0x270F41F40]();
}

uint64_t sub_253DF1A10()
{
  return MEMORY[0x270F41F48]();
}

uint64_t sub_253DF1A20()
{
  return MEMORY[0x270F41F58]();
}

uint64_t sub_253DF1A30()
{
  return MEMORY[0x270F41F60]();
}

uint64_t sub_253DF1A40()
{
  return MEMORY[0x270F41F70]();
}

uint64_t sub_253DF1A50()
{
  return MEMORY[0x270F41F78]();
}

uint64_t sub_253DF1A60()
{
  return MEMORY[0x270F41F80]();
}

uint64_t sub_253DF1A70()
{
  return MEMORY[0x270F3F860]();
}

uint64_t sub_253DF1A80()
{
  return MEMORY[0x270F3F868]();
}

uint64_t sub_253DF1A90()
{
  return MEMORY[0x270F41FD0]();
}

uint64_t sub_253DF1AA0()
{
  return MEMORY[0x270F41FE0]();
}

uint64_t sub_253DF1AB0()
{
  return MEMORY[0x270F41FE8]();
}

uint64_t sub_253DF1AC0()
{
  return MEMORY[0x270F41FF0]();
}

uint64_t sub_253DF1AD0()
{
  return MEMORY[0x270F41FF8]();
}

uint64_t sub_253DF1AE0()
{
  return MEMORY[0x270F42000]();
}

uint64_t sub_253DF1AF0()
{
  return MEMORY[0x270F42008]();
}

uint64_t sub_253DF1B00()
{
  return MEMORY[0x270F42010]();
}

uint64_t sub_253DF1B10()
{
  return MEMORY[0x270F42018]();
}

uint64_t sub_253DF1B20()
{
  return MEMORY[0x270F42020]();
}

uint64_t sub_253DF1B30()
{
  return MEMORY[0x270F42028]();
}

uint64_t sub_253DF1B40()
{
  return MEMORY[0x270F42030]();
}

uint64_t sub_253DF1B50()
{
  return MEMORY[0x270F42038]();
}

uint64_t sub_253DF1B60()
{
  return MEMORY[0x270F42040]();
}

uint64_t sub_253DF1B70()
{
  return MEMORY[0x270F42048]();
}

uint64_t sub_253DF1B80()
{
  return MEMORY[0x270F42050]();
}

uint64_t sub_253DF1B90()
{
  return MEMORY[0x270F42058]();
}

uint64_t sub_253DF1BA0()
{
  return MEMORY[0x270F42060]();
}

uint64_t sub_253DF1BB0()
{
  return MEMORY[0x270F42068]();
}

uint64_t sub_253DF1BC0()
{
  return MEMORY[0x270F42070]();
}

uint64_t sub_253DF1BD0()
{
  return MEMORY[0x270F42078]();
}

uint64_t sub_253DF1BE0()
{
  return MEMORY[0x270F42080]();
}

uint64_t sub_253DF1BF0()
{
  return MEMORY[0x270F42088]();
}

uint64_t sub_253DF1C00()
{
  return MEMORY[0x270F42090]();
}

uint64_t sub_253DF1C10()
{
  return MEMORY[0x270F42098]();
}

uint64_t sub_253DF1C20()
{
  return MEMORY[0x270F420A0]();
}

uint64_t sub_253DF1C30()
{
  return MEMORY[0x270F420A8]();
}

uint64_t sub_253DF1C40()
{
  return MEMORY[0x270F420B0]();
}

uint64_t sub_253DF1C50()
{
  return MEMORY[0x270F420B8]();
}

uint64_t sub_253DF1C60()
{
  return MEMORY[0x270F420C0]();
}

uint64_t sub_253DF1C70()
{
  return MEMORY[0x270F420C8]();
}

uint64_t sub_253DF1C80()
{
  return MEMORY[0x270F420D0]();
}

uint64_t sub_253DF1C90()
{
  return MEMORY[0x270F420D8]();
}

uint64_t sub_253DF1CA0()
{
  return MEMORY[0x270F420E0]();
}

uint64_t sub_253DF1CB0()
{
  return MEMORY[0x270F420E8]();
}

uint64_t sub_253DF1CC0()
{
  return MEMORY[0x270F420F0]();
}

uint64_t sub_253DF1CD0()
{
  return MEMORY[0x270F420F8]();
}

uint64_t sub_253DF1CE0()
{
  return MEMORY[0x270F42100]();
}

uint64_t sub_253DF1CF0()
{
  return MEMORY[0x270F42108]();
}

uint64_t sub_253DF1D00()
{
  return MEMORY[0x270F42110]();
}

uint64_t sub_253DF1D10()
{
  return MEMORY[0x270F42118]();
}

uint64_t sub_253DF1D20()
{
  return MEMORY[0x270F42120]();
}

uint64_t sub_253DF1D30()
{
  return MEMORY[0x270F42128]();
}

uint64_t sub_253DF1D40()
{
  return MEMORY[0x270F42130]();
}

uint64_t sub_253DF1D50()
{
  return MEMORY[0x270F42138]();
}

uint64_t sub_253DF1D60()
{
  return MEMORY[0x270F42140]();
}

uint64_t sub_253DF1D70()
{
  return MEMORY[0x270F42148]();
}

uint64_t sub_253DF1D90()
{
  return MEMORY[0x270F42158]();
}

uint64_t sub_253DF1DA0()
{
  return MEMORY[0x270F42160]();
}

uint64_t sub_253DF1DB0()
{
  return MEMORY[0x270F42168]();
}

uint64_t sub_253DF1DC0()
{
  return MEMORY[0x270F42170]();
}

uint64_t sub_253DF1DD0()
{
  return MEMORY[0x270F42178]();
}

uint64_t sub_253DF1DE0()
{
  return MEMORY[0x270F42180]();
}

uint64_t sub_253DF1DF0()
{
  return MEMORY[0x270F42188]();
}

uint64_t sub_253DF1E00()
{
  return MEMORY[0x270F42190]();
}

uint64_t sub_253DF1E10()
{
  return MEMORY[0x270F42198]();
}

uint64_t sub_253DF1E20()
{
  return MEMORY[0x270F421A0]();
}

uint64_t sub_253DF1E30()
{
  return MEMORY[0x270F421A8]();
}

uint64_t sub_253DF1E40()
{
  return MEMORY[0x270F421B0]();
}

uint64_t sub_253DF1E50()
{
  return MEMORY[0x270F421B8]();
}

uint64_t sub_253DF1E60()
{
  return MEMORY[0x270F421C0]();
}

uint64_t sub_253DF1E70()
{
  return MEMORY[0x270F421C8]();
}

uint64_t sub_253DF1E80()
{
  return MEMORY[0x270F421D0]();
}

uint64_t sub_253DF1E90()
{
  return MEMORY[0x270F421D8]();
}

uint64_t sub_253DF1EA0()
{
  return MEMORY[0x270F421E0]();
}

uint64_t sub_253DF1EB0()
{
  return MEMORY[0x270F421E8]();
}

uint64_t sub_253DF1EC0()
{
  return MEMORY[0x270F421F0]();
}

uint64_t sub_253DF1ED0()
{
  return MEMORY[0x270F421F8]();
}

uint64_t sub_253DF1EE0()
{
  return MEMORY[0x270F42200]();
}

uint64_t sub_253DF1EF0()
{
  return MEMORY[0x270F42208]();
}

uint64_t sub_253DF1F00()
{
  return MEMORY[0x270F42210]();
}

uint64_t sub_253DF1F10()
{
  return MEMORY[0x270F42218]();
}

uint64_t sub_253DF1F20()
{
  return MEMORY[0x270F42220]();
}

uint64_t sub_253DF1F30()
{
  return MEMORY[0x270F42228]();
}

uint64_t sub_253DF1F40()
{
  return MEMORY[0x270F42230]();
}

uint64_t sub_253DF1F50()
{
  return MEMORY[0x270F42238]();
}

uint64_t sub_253DF1F60()
{
  return MEMORY[0x270F42240]();
}

uint64_t sub_253DF1F70()
{
  return MEMORY[0x270F42248]();
}

uint64_t sub_253DF1F80()
{
  return MEMORY[0x270F42250]();
}

uint64_t sub_253DF1F90()
{
  return MEMORY[0x270F42258]();
}

uint64_t sub_253DF1FA0()
{
  return MEMORY[0x270F42260]();
}

uint64_t sub_253DF1FB0()
{
  return MEMORY[0x270F42268]();
}

uint64_t sub_253DF1FC0()
{
  return MEMORY[0x270F42270]();
}

uint64_t sub_253DF1FD0()
{
  return MEMORY[0x270F42278]();
}

uint64_t sub_253DF1FE0()
{
  return MEMORY[0x270F42280]();
}

uint64_t sub_253DF1FF0()
{
  return MEMORY[0x270F42288]();
}

uint64_t sub_253DF2000()
{
  return MEMORY[0x270F42298]();
}

uint64_t sub_253DF2010()
{
  return MEMORY[0x270F422A0]();
}

uint64_t sub_253DF2020()
{
  return MEMORY[0x270F422B0]();
}

uint64_t sub_253DF2030()
{
  return MEMORY[0x270F422B8]();
}

uint64_t sub_253DF2040()
{
  return MEMORY[0x270F422C0]();
}

uint64_t sub_253DF2050()
{
  return MEMORY[0x270F422C8]();
}

uint64_t sub_253DF2060()
{
  return MEMORY[0x270F422D0]();
}

uint64_t sub_253DF2070()
{
  return MEMORY[0x270F422D8]();
}

uint64_t sub_253DF2080()
{
  return MEMORY[0x270F422E0]();
}

uint64_t sub_253DF2090()
{
  return MEMORY[0x270F422E8]();
}

uint64_t sub_253DF20A0()
{
  return MEMORY[0x270F422F0]();
}

uint64_t sub_253DF20B0()
{
  return MEMORY[0x270F422F8]();
}

uint64_t sub_253DF20C0()
{
  return MEMORY[0x270F42300]();
}

uint64_t sub_253DF20D0()
{
  return MEMORY[0x270F42308]();
}

uint64_t sub_253DF20E0()
{
  return MEMORY[0x270F42310]();
}

uint64_t sub_253DF20F0()
{
  return MEMORY[0x270F42318]();
}

uint64_t sub_253DF2100()
{
  return MEMORY[0x270F42320]();
}

uint64_t sub_253DF2110()
{
  return MEMORY[0x270F42328]();
}

uint64_t sub_253DF2120()
{
  return MEMORY[0x270F42330]();
}

uint64_t sub_253DF2130()
{
  return MEMORY[0x270F42338]();
}

uint64_t sub_253DF2140()
{
  return MEMORY[0x270F42340]();
}

uint64_t sub_253DF2150()
{
  return MEMORY[0x270F42348]();
}

uint64_t sub_253DF2160()
{
  return MEMORY[0x270F42350]();
}

uint64_t sub_253DF2170()
{
  return MEMORY[0x270F42358]();
}

uint64_t sub_253DF2180()
{
  return MEMORY[0x270F42360]();
}

uint64_t sub_253DF2190()
{
  return MEMORY[0x270F42368]();
}

uint64_t sub_253DF21A0()
{
  return MEMORY[0x270F42370]();
}

uint64_t sub_253DF21B0()
{
  return MEMORY[0x270F42378]();
}

uint64_t sub_253DF21C0()
{
  return MEMORY[0x270F42380]();
}

uint64_t sub_253DF21D0()
{
  return MEMORY[0x270F42388]();
}

uint64_t sub_253DF21E0()
{
  return MEMORY[0x270F42390]();
}

uint64_t sub_253DF21F0()
{
  return MEMORY[0x270F42398]();
}

uint64_t sub_253DF2200()
{
  return MEMORY[0x270F423A8]();
}

uint64_t sub_253DF2210()
{
  return MEMORY[0x270F423B8]();
}

uint64_t sub_253DF2220()
{
  return MEMORY[0x270F423C0]();
}

uint64_t sub_253DF2230()
{
  return MEMORY[0x270F423D0]();
}

uint64_t sub_253DF2240()
{
  return MEMORY[0x270F423E0]();
}

uint64_t sub_253DF2250()
{
  return MEMORY[0x270F423F0]();
}

uint64_t sub_253DF2260()
{
  return MEMORY[0x270F423F8]();
}

uint64_t sub_253DF2270()
{
  return MEMORY[0x270F42400]();
}

uint64_t sub_253DF2280()
{
  return MEMORY[0x270F42410]();
}

uint64_t sub_253DF2290()
{
  return MEMORY[0x270F42418]();
}

uint64_t sub_253DF22A0()
{
  return MEMORY[0x270F42420]();
}

uint64_t sub_253DF22B0()
{
  return MEMORY[0x270F42428]();
}

uint64_t sub_253DF22C0()
{
  return MEMORY[0x270F42430]();
}

uint64_t sub_253DF22D0()
{
  return MEMORY[0x270F42438]();
}

uint64_t sub_253DF22E0()
{
  return MEMORY[0x270F42440]();
}

uint64_t sub_253DF22F0()
{
  return MEMORY[0x270F42448]();
}

uint64_t sub_253DF2300()
{
  return MEMORY[0x270F42458]();
}

uint64_t sub_253DF2310()
{
  return MEMORY[0x270F42460]();
}

uint64_t sub_253DF2320()
{
  return MEMORY[0x270F42468]();
}

uint64_t sub_253DF2330()
{
  return MEMORY[0x270F43278]();
}

uint64_t sub_253DF2340()
{
  return MEMORY[0x270F43280]();
}

uint64_t sub_253DF2350()
{
  return MEMORY[0x270F43438]();
}

uint64_t sub_253DF2360()
{
  return MEMORY[0x270F43530]();
}

uint64_t sub_253DF2370()
{
  return MEMORY[0x270F43558]();
}

uint64_t sub_253DF2380()
{
  return MEMORY[0x270F441B8]();
}

uint64_t sub_253DF2390()
{
  return MEMORY[0x270F441C0]();
}

uint64_t sub_253DF23A0()
{
  return MEMORY[0x270F441C8]();
}

uint64_t sub_253DF23B0()
{
  return MEMORY[0x270F44208]();
}

uint64_t sub_253DF23C0()
{
  return MEMORY[0x270F44210]();
}

uint64_t sub_253DF23D0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_253DF23E0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_253DF23F0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_253DF2400()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_253DF2410()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_253DF2420()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_253DF2430()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_253DF2440()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_253DF2450()
{
  return MEMORY[0x270FA2DC0]();
}

uint64_t sub_253DF2460()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_253DF2470()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_253DF2480()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_253DF2490()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_253DF24A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t _s23IntelligenceFlowRuntime28StandardToolboxConfigurationV011makeMutableE08delegate22planGenerationDelegate0aB14PlannerSupport0hE0Cx_q_tKAG0eL0RzAG0e4PlankL0R_r0_lFfA0__0()
{
  return MEMORY[0x270F3F498]();
}

uint64_t sub_253DF24C0()
{
  return MEMORY[0x270F3F4A0]();
}

uint64_t sub_253DF24D0()
{
  return MEMORY[0x270F3F4A8]();
}

uint64_t sub_253DF24E0()
{
  return MEMORY[0x270F3F4B0]();
}

uint64_t sub_253DF24F0()
{
  return MEMORY[0x270F3F4B8]();
}

uint64_t sub_253DF2500()
{
  return MEMORY[0x270F3F4C0]();
}

uint64_t _s23IntelligenceFlowRuntime28StandardToolboxConfigurationV011makeMutableE08delegate22planGenerationDelegate0aB14PlannerSupport0hE0Cx_q_tKAG0eL0RzAG0e4PlankL0R_r0_lFfA__0()
{
  return MEMORY[0x270F3F4C8]();
}

uint64_t sub_253DF2520()
{
  return MEMORY[0x270F3F4D0]();
}

uint64_t sub_253DF2530()
{
  return MEMORY[0x270F3F4D8]();
}

uint64_t sub_253DF2560()
{
  return MEMORY[0x270F3F4F0]();
}

uint64_t sub_253DF2580()
{
  return MEMORY[0x270F3F500]();
}

uint64_t sub_253DF2590()
{
  return MEMORY[0x270F3F508]();
}

uint64_t sub_253DF25A0()
{
  return MEMORY[0x270F3F510]();
}

uint64_t sub_253DF25B0()
{
  return MEMORY[0x270F3F518]();
}

uint64_t sub_253DF25C0()
{
  return MEMORY[0x270F3F520]();
}

uint64_t sub_253DF25D0()
{
  return MEMORY[0x270F3F528]();
}

uint64_t sub_253DF25E0()
{
  return MEMORY[0x270F3F530]();
}

uint64_t sub_253DF25F0()
{
  return MEMORY[0x270F3F538]();
}

uint64_t sub_253DF2600()
{
  return MEMORY[0x270F3F540]();
}

uint64_t sub_253DF2610()
{
  return MEMORY[0x270F3F548]();
}

uint64_t sub_253DF2620()
{
  return MEMORY[0x270F3F550]();
}

uint64_t sub_253DF2630()
{
  return MEMORY[0x270F3F558]();
}

uint64_t sub_253DF2640()
{
  return MEMORY[0x270F3F560]();
}

uint64_t sub_253DF2650()
{
  return MEMORY[0x270F3F568]();
}

uint64_t sub_253DF2660()
{
  return MEMORY[0x270F3F570]();
}

uint64_t sub_253DF2670()
{
  return MEMORY[0x270F3F578]();
}

uint64_t sub_253DF2680()
{
  return MEMORY[0x270F3F580]();
}

uint64_t sub_253DF2690()
{
  return MEMORY[0x270F3F588]();
}

uint64_t sub_253DF26A0()
{
  return MEMORY[0x270F3F590]();
}

uint64_t sub_253DF26B0()
{
  return MEMORY[0x270F3F598]();
}

uint64_t sub_253DF26C0()
{
  return MEMORY[0x270F3F5A0]();
}

uint64_t sub_253DF26D0()
{
  return MEMORY[0x270F3F5A8]();
}

uint64_t sub_253DF26E0()
{
  return MEMORY[0x270F3F5B0]();
}

uint64_t sub_253DF26F0()
{
  return MEMORY[0x270F3F5B8]();
}

uint64_t sub_253DF2700()
{
  return MEMORY[0x270F3F5C0]();
}

uint64_t sub_253DF2710()
{
  return MEMORY[0x270F3F5C8]();
}

uint64_t sub_253DF2720()
{
  return MEMORY[0x270F3F5D0]();
}

uint64_t sub_253DF2730()
{
  return MEMORY[0x270F3F5D8]();
}

uint64_t sub_253DF2740()
{
  return MEMORY[0x270F3F5E0]();
}

uint64_t sub_253DF2750()
{
  return MEMORY[0x270F3F5E8]();
}

uint64_t sub_253DF2760()
{
  return MEMORY[0x270F3F5F0]();
}

uint64_t sub_253DF2770()
{
  return MEMORY[0x270F3F5F8]();
}

uint64_t sub_253DF2780()
{
  return MEMORY[0x270F3F600]();
}

uint64_t sub_253DF2790()
{
  return MEMORY[0x270F3F608]();
}

uint64_t sub_253DF27A0()
{
  return MEMORY[0x270F3F610]();
}

uint64_t sub_253DF27B0()
{
  return MEMORY[0x270F3F618]();
}

uint64_t sub_253DF27C0()
{
  return MEMORY[0x270F3F620]();
}

uint64_t sub_253DF27D0()
{
  return MEMORY[0x270F3F628]();
}

uint64_t sub_253DF27E0()
{
  return MEMORY[0x270F3F630]();
}

uint64_t sub_253DF27F0()
{
  return MEMORY[0x270F3F638]();
}

uint64_t sub_253DF2800()
{
  return MEMORY[0x270F3F640]();
}

uint64_t sub_253DF2810()
{
  return MEMORY[0x270F3F648]();
}

uint64_t sub_253DF2820()
{
  return MEMORY[0x270F3F650]();
}

uint64_t sub_253DF2830()
{
  return MEMORY[0x270F3F658]();
}

uint64_t sub_253DF2840()
{
  return MEMORY[0x270F3F660]();
}

uint64_t sub_253DF2850()
{
  return MEMORY[0x270F3F668]();
}

uint64_t sub_253DF2860()
{
  return MEMORY[0x270F3F670]();
}

uint64_t sub_253DF2870()
{
  return MEMORY[0x270F3F678]();
}

uint64_t sub_253DF2880()
{
  return MEMORY[0x270F3F680]();
}

uint64_t sub_253DF2890()
{
  return MEMORY[0x270F3F688]();
}

uint64_t sub_253DF28A0()
{
  return MEMORY[0x270F3F690]();
}

uint64_t sub_253DF28B0()
{
  return MEMORY[0x270F3F698]();
}

uint64_t sub_253DF28C0()
{
  return MEMORY[0x270F3F6A0]();
}

uint64_t sub_253DF28D0()
{
  return MEMORY[0x270F3F6A8]();
}

uint64_t sub_253DF28E0()
{
  return MEMORY[0x270F3F6B0]();
}

uint64_t sub_253DF28F0()
{
  return MEMORY[0x270F3F6B8]();
}

uint64_t sub_253DF2900()
{
  return MEMORY[0x270F3F6C0]();
}

uint64_t sub_253DF2910()
{
  return MEMORY[0x270F3F6C8]();
}

uint64_t sub_253DF2920()
{
  return MEMORY[0x270F3F6D0]();
}

uint64_t sub_253DF2930()
{
  return MEMORY[0x270F3F6D8]();
}

uint64_t sub_253DF2940()
{
  return MEMORY[0x270F3F6E0]();
}

uint64_t sub_253DF2950()
{
  return MEMORY[0x270F3F6E8]();
}

uint64_t sub_253DF2970()
{
  return MEMORY[0x270F3F6F8]();
}

uint64_t sub_253DF2980()
{
  return MEMORY[0x270F3F700]();
}

uint64_t sub_253DF2990()
{
  return MEMORY[0x270F3F708]();
}

uint64_t sub_253DF29A0()
{
  return MEMORY[0x270F3F710]();
}

uint64_t sub_253DF29B0()
{
  return MEMORY[0x270F3F718]();
}

uint64_t sub_253DF29C0()
{
  return MEMORY[0x270F3F720]();
}

uint64_t sub_253DF29D0()
{
  return MEMORY[0x270F3F870]();
}

uint64_t sub_253DF29E0()
{
  return MEMORY[0x270F3F878]();
}

uint64_t sub_253DF29F0()
{
  return MEMORY[0x270F3F880]();
}

uint64_t sub_253DF2A00()
{
  return MEMORY[0x270F3F888]();
}

uint64_t sub_253DF2A10()
{
  return MEMORY[0x270F3F8D8]();
}

uint64_t sub_253DF2A20()
{
  return MEMORY[0x270F3F8E0]();
}

uint64_t sub_253DF2A30()
{
  return MEMORY[0x270F3F8E8]();
}

uint64_t sub_253DF2A40()
{
  return MEMORY[0x270F3F8F0]();
}

uint64_t sub_253DF2A50()
{
  return MEMORY[0x270F3F8F8]();
}

uint64_t sub_253DF2A60()
{
  return MEMORY[0x270F3F900]();
}

uint64_t sub_253DF2A70()
{
  return MEMORY[0x270F3F908]();
}

uint64_t sub_253DF2A80()
{
  return MEMORY[0x270F3F910]();
}

uint64_t sub_253DF2A90()
{
  return MEMORY[0x270F3F968]();
}

uint64_t sub_253DF2AA0()
{
  return MEMORY[0x270F3F970]();
}

uint64_t sub_253DF2AB0()
{
  return MEMORY[0x270F3F978]();
}

uint64_t sub_253DF2AC0()
{
  return MEMORY[0x270F3F988]();
}

uint64_t sub_253DF2AD0()
{
  return MEMORY[0x270F3F990]();
}

uint64_t sub_253DF2AE0()
{
  return MEMORY[0x270F3F998]();
}

uint64_t sub_253DF2AF0()
{
  return MEMORY[0x270F3F9A0]();
}

uint64_t sub_253DF2B00()
{
  return MEMORY[0x270F3F9B0]();
}

uint64_t sub_253DF2B10()
{
  return MEMORY[0x270F3F9B8]();
}

uint64_t sub_253DF2B20()
{
  return MEMORY[0x270F3F9D8]();
}

uint64_t sub_253DF2B30()
{
  return MEMORY[0x270F3F9F8]();
}

uint64_t sub_253DF2B40()
{
  return MEMORY[0x270F3FA18]();
}

uint64_t sub_253DF2B50()
{
  return MEMORY[0x270F3FA28]();
}

uint64_t sub_253DF2B60()
{
  return MEMORY[0x270F3FA30]();
}

uint64_t sub_253DF2B70()
{
  return MEMORY[0x270F3FA38]();
}

uint64_t sub_253DF2B80()
{
  return MEMORY[0x270F3FA40]();
}

uint64_t sub_253DF2B90()
{
  return MEMORY[0x270F3FA48]();
}

uint64_t sub_253DF2BA0()
{
  return MEMORY[0x270F3FA58]();
}

uint64_t sub_253DF2BB0()
{
  return MEMORY[0x270F3FA60]();
}

uint64_t sub_253DF2BC0()
{
  return MEMORY[0x270F3FA68]();
}

uint64_t sub_253DF2BD0()
{
  return MEMORY[0x270F3FA70]();
}

uint64_t sub_253DF2BE0()
{
  return MEMORY[0x270F3FA78]();
}

uint64_t sub_253DF2BF0()
{
  return MEMORY[0x270F3FA80]();
}

uint64_t sub_253DF2C00()
{
  return MEMORY[0x270F3FA88]();
}

uint64_t sub_253DF2C10()
{
  return MEMORY[0x270F3FA98]();
}

uint64_t sub_253DF2C20()
{
  return MEMORY[0x270F3FAB0]();
}

uint64_t sub_253DF2C30()
{
  return MEMORY[0x270F3FAB8]();
}

uint64_t sub_253DF2C40()
{
  return MEMORY[0x270F3FAC0]();
}

uint64_t sub_253DF2C50()
{
  return MEMORY[0x270F3FAD0]();
}

uint64_t sub_253DF2C60()
{
  return MEMORY[0x270F3FAD8]();
}

uint64_t sub_253DF2C70()
{
  return MEMORY[0x270F3FAE0]();
}

uint64_t sub_253DF2C80()
{
  return MEMORY[0x270F3FAE8]();
}

uint64_t sub_253DF2C90()
{
  return MEMORY[0x270F3FAF0]();
}

uint64_t sub_253DF2CA0()
{
  return MEMORY[0x270F3FAF8]();
}

uint64_t sub_253DF2CB0()
{
  return MEMORY[0x270F3FB08]();
}

uint64_t sub_253DF2CC0()
{
  return MEMORY[0x270F3FB10]();
}

uint64_t sub_253DF2CD0()
{
  return MEMORY[0x270F3FB38]();
}

uint64_t sub_253DF2CE0()
{
  return MEMORY[0x270F3FB40]();
}

uint64_t sub_253DF2CF0()
{
  return MEMORY[0x270F3FB48]();
}

uint64_t sub_253DF2D00()
{
  return MEMORY[0x270F3FB50]();
}

uint64_t sub_253DF2D10()
{
  return MEMORY[0x270F3FB58]();
}

uint64_t sub_253DF2D20()
{
  return MEMORY[0x270F3FB60]();
}

uint64_t sub_253DF2D30()
{
  return MEMORY[0x270F3FB68]();
}

uint64_t sub_253DF2D40()
{
  return MEMORY[0x270F3FB70]();
}

uint64_t sub_253DF2D50()
{
  return MEMORY[0x270F3FB78]();
}

uint64_t sub_253DF2D60()
{
  return MEMORY[0x270F3FB80]();
}

uint64_t sub_253DF2D70()
{
  return MEMORY[0x270F3FB88]();
}

uint64_t sub_253DF2D80()
{
  return MEMORY[0x270F3FB90]();
}

uint64_t sub_253DF2D90()
{
  return MEMORY[0x270F3FB98]();
}

uint64_t sub_253DF2DA0()
{
  return MEMORY[0x270F3FBA0]();
}

uint64_t sub_253DF2DB0()
{
  return MEMORY[0x270F3FBA8]();
}

uint64_t sub_253DF2DC0()
{
  return MEMORY[0x270F3FBB0]();
}

uint64_t sub_253DF2DD0()
{
  return MEMORY[0x270F3FBB8]();
}

uint64_t sub_253DF2DE0()
{
  return MEMORY[0x270F3FBC0]();
}

uint64_t sub_253DF2DF0()
{
  return MEMORY[0x270F3FBC8]();
}

uint64_t sub_253DF2E00()
{
  return MEMORY[0x270F3FBD0]();
}

uint64_t sub_253DF2E10()
{
  return MEMORY[0x270F3FBD8]();
}

uint64_t sub_253DF2E20()
{
  return MEMORY[0x270F3FBE0]();
}

uint64_t sub_253DF2E30()
{
  return MEMORY[0x270F3FC10]();
}

uint64_t sub_253DF2E40()
{
  return MEMORY[0x270F3FC18]();
}

uint64_t sub_253DF2E70()
{
  return MEMORY[0x270F3FC50]();
}

uint64_t sub_253DF2E80()
{
  return MEMORY[0x270F3FC58]();
}

uint64_t sub_253DF2EA0()
{
  return MEMORY[0x270F3FC68]();
}

uint64_t sub_253DF2EB0()
{
  return MEMORY[0x270F3FC88]();
}

uint64_t _s23IntelligenceFlowRuntime16FeedbackLearningO20CandidateSearchQueryV2eeoiySbAE_AEtFZ_0()
{
  return MEMORY[0x270F3FC90]();
}

uint64_t sub_253DF2ED0()
{
  return MEMORY[0x270F3FC98]();
}

uint64_t sub_253DF2EF0()
{
  return MEMORY[0x270F3FCA8]();
}

uint64_t sub_253DF2F00()
{
  return MEMORY[0x270F3FCB0]();
}

uint64_t sub_253DF2F10()
{
  return MEMORY[0x270F3FCB8]();
}

uint64_t sub_253DF2F20()
{
  return MEMORY[0x270F3FCC0]();
}

uint64_t sub_253DF2F30()
{
  return MEMORY[0x270F3FCD0]();
}

uint64_t sub_253DF2F40()
{
  return MEMORY[0x270F3FCD8]();
}

uint64_t sub_253DF2F50()
{
  return MEMORY[0x270F3FCE0]();
}

uint64_t sub_253DF2F60()
{
  return MEMORY[0x270F3FCE8]();
}

uint64_t sub_253DF2F70()
{
  return MEMORY[0x270F3FCF0]();
}

uint64_t sub_253DF2F80()
{
  return MEMORY[0x270F3FCF8]();
}

uint64_t sub_253DF2F90()
{
  return MEMORY[0x270F3FD08]();
}

uint64_t sub_253DF2FA0()
{
  return MEMORY[0x270F3FD10]();
}

uint64_t sub_253DF2FB0()
{
  return MEMORY[0x270F3FD18]();
}

uint64_t sub_253DF2FC0()
{
  return MEMORY[0x270F3FD20]();
}

uint64_t sub_253DF2FD0()
{
  return MEMORY[0x270F3FD28]();
}

uint64_t sub_253DF2FE0()
{
  return MEMORY[0x270F3FD30]();
}

uint64_t sub_253DF2FF0()
{
  return MEMORY[0x270F3FD48]();
}

uint64_t sub_253DF3000()
{
  return MEMORY[0x270F3FD50]();
}

uint64_t sub_253DF3010()
{
  return MEMORY[0x270F3FD58]();
}

uint64_t sub_253DF3020()
{
  return MEMORY[0x270F3FD60]();
}

uint64_t sub_253DF3030()
{
  return MEMORY[0x270F3FD70]();
}

uint64_t sub_253DF3040()
{
  return MEMORY[0x270F3FD78]();
}

uint64_t sub_253DF3050()
{
  return MEMORY[0x270F3FD80]();
}

uint64_t sub_253DF3060()
{
  return MEMORY[0x270F3FD88]();
}

uint64_t sub_253DF3070()
{
  return MEMORY[0x270F3FD98]();
}

uint64_t sub_253DF3080()
{
  return MEMORY[0x270F3FDA8]();
}

uint64_t sub_253DF3090()
{
  return MEMORY[0x270F3FDB8]();
}

uint64_t sub_253DF30A0()
{
  return MEMORY[0x270F3FDC0]();
}

uint64_t sub_253DF30B0()
{
  return MEMORY[0x270F3FDE0]();
}

uint64_t sub_253DF30C0()
{
  return MEMORY[0x270F3FDF0]();
}

uint64_t sub_253DF30D0()
{
  return MEMORY[0x270F3FDF8]();
}

uint64_t sub_253DF30E0()
{
  return MEMORY[0x270F3FE48]();
}

uint64_t sub_253DF30F0()
{
  return MEMORY[0x270F3FE50]();
}

uint64_t sub_253DF3100()
{
  return MEMORY[0x270F3FE58]();
}

uint64_t sub_253DF3110()
{
  return MEMORY[0x270F3FE60]();
}

uint64_t sub_253DF3120()
{
  return MEMORY[0x270F3FE70]();
}

uint64_t sub_253DF3130()
{
  return MEMORY[0x270F3FE80]();
}

uint64_t sub_253DF3140()
{
  return MEMORY[0x270F3FE88]();
}

uint64_t sub_253DF3150()
{
  return MEMORY[0x270F3FEB0]();
}

uint64_t sub_253DF3160()
{
  return MEMORY[0x270F3FEC0]();
}

uint64_t sub_253DF3170()
{
  return MEMORY[0x270F3FEC8]();
}

uint64_t sub_253DF3180()
{
  return MEMORY[0x270F3FED0]();
}

uint64_t sub_253DF3190()
{
  return MEMORY[0x270F3FED8]();
}

uint64_t sub_253DF31A0()
{
  return MEMORY[0x270F3FEE0]();
}

uint64_t sub_253DF31B0()
{
  return MEMORY[0x270F3FEE8]();
}

uint64_t sub_253DF31C0()
{
  return MEMORY[0x270F3FEF0]();
}

uint64_t sub_253DF31D0()
{
  return MEMORY[0x270F3FEF8]();
}

uint64_t sub_253DF31E0()
{
  return MEMORY[0x270F3FF18]();
}

uint64_t sub_253DF31F0()
{
  return MEMORY[0x270F3FF20]();
}

uint64_t sub_253DF3200()
{
  return MEMORY[0x270F3FF28]();
}

uint64_t sub_253DF3210()
{
  return MEMORY[0x270F3FF30]();
}

uint64_t sub_253DF3220()
{
  return MEMORY[0x270F3FF38]();
}

uint64_t sub_253DF3230()
{
  return MEMORY[0x270F3FF40]();
}

uint64_t sub_253DF3240()
{
  return MEMORY[0x270F3FF48]();
}

uint64_t sub_253DF3250()
{
  return MEMORY[0x270F3FF58]();
}

uint64_t sub_253DF3260()
{
  return MEMORY[0x270F3FF68]();
}

uint64_t sub_253DF3270()
{
  return MEMORY[0x270F3FF70]();
}

uint64_t sub_253DF3280()
{
  return MEMORY[0x270F3FF78]();
}

uint64_t sub_253DF3290()
{
  return MEMORY[0x270F3FF88]();
}

uint64_t sub_253DF32A0()
{
  return MEMORY[0x270F3FFA0]();
}

uint64_t sub_253DF32B0()
{
  return MEMORY[0x270F3FFA8]();
}

uint64_t sub_253DF32C0()
{
  return MEMORY[0x270F3FFB0]();
}

uint64_t sub_253DF32D0()
{
  return MEMORY[0x270F40010]();
}

uint64_t sub_253DF32E0()
{
  return MEMORY[0x270F40028]();
}

uint64_t sub_253DF32F0()
{
  return MEMORY[0x270F40058]();
}

uint64_t sub_253DF3300()
{
  return MEMORY[0x270F40060]();
}

uint64_t sub_253DF3310()
{
  return MEMORY[0x270F40088]();
}

uint64_t sub_253DF3320()
{
  return MEMORY[0x270F40090]();
}

uint64_t sub_253DF3330()
{
  return MEMORY[0x270F40098]();
}

uint64_t sub_253DF3340()
{
  return MEMORY[0x270F400A0]();
}

uint64_t sub_253DF3350()
{
  return MEMORY[0x270F400A8]();
}

uint64_t sub_253DF3360()
{
  return MEMORY[0x270F400B0]();
}

uint64_t sub_253DF3370()
{
  return MEMORY[0x270F400B8]();
}

uint64_t sub_253DF3380()
{
  return MEMORY[0x270F400C0]();
}

uint64_t sub_253DF3390()
{
  return MEMORY[0x270F400D8]();
}

uint64_t sub_253DF33B0()
{
  return MEMORY[0x270F400E8]();
}

uint64_t sub_253DF33C0()
{
  return MEMORY[0x270F400F0]();
}

uint64_t sub_253DF33D0()
{
  return MEMORY[0x270F400F8]();
}

uint64_t sub_253DF33E0()
{
  return MEMORY[0x270F40100]();
}

uint64_t sub_253DF33F0()
{
  return MEMORY[0x270F40148]();
}

uint64_t sub_253DF3400()
{
  return MEMORY[0x270F40150]();
}

uint64_t sub_253DF3410()
{
  return MEMORY[0x270F40158]();
}

uint64_t sub_253DF3420()
{
  return MEMORY[0x270F40168]();
}

uint64_t sub_253DF3430()
{
  return MEMORY[0x270F40170]();
}

uint64_t sub_253DF3440()
{
  return MEMORY[0x270F40180]();
}

uint64_t sub_253DF3450()
{
  return MEMORY[0x270F40188]();
}

uint64_t sub_253DF3460()
{
  return MEMORY[0x270F40190]();
}

uint64_t sub_253DF3470()
{
  return MEMORY[0x270F40198]();
}

uint64_t sub_253DF3480()
{
  return MEMORY[0x270F401A8]();
}

uint64_t sub_253DF3490()
{
  return MEMORY[0x270F401B8]();
}

uint64_t sub_253DF34A0()
{
  return MEMORY[0x270F401C0]();
}

uint64_t sub_253DF34B0()
{
  return MEMORY[0x270F401C8]();
}

uint64_t sub_253DF34C0()
{
  return MEMORY[0x270F401D0]();
}

uint64_t sub_253DF34D0()
{
  return MEMORY[0x270F401E8]();
}

uint64_t sub_253DF34E0()
{
  return MEMORY[0x270F401F0]();
}

uint64_t sub_253DF34F0()
{
  return MEMORY[0x270F401F8]();
}

uint64_t sub_253DF3500()
{
  return MEMORY[0x270F40200]();
}

uint64_t sub_253DF3510()
{
  return MEMORY[0x270F40210]();
}

uint64_t sub_253DF3520()
{
  return MEMORY[0x270F40218]();
}

uint64_t sub_253DF3530()
{
  return MEMORY[0x270F40240]();
}

uint64_t sub_253DF3540()
{
  return MEMORY[0x270F40250]();
}

uint64_t sub_253DF3550()
{
  return MEMORY[0x270F40258]();
}

uint64_t sub_253DF3560()
{
  return MEMORY[0x270F40260]();
}

uint64_t sub_253DF3570()
{
  return MEMORY[0x270F40268]();
}

uint64_t sub_253DF3580()
{
  return MEMORY[0x270F40270]();
}

uint64_t sub_253DF3590()
{
  return MEMORY[0x270F40278]();
}

uint64_t sub_253DF35A0()
{
  return MEMORY[0x270F40288]();
}

uint64_t sub_253DF35B0()
{
  return MEMORY[0x270F40290]();
}

uint64_t sub_253DF35C0()
{
  return MEMORY[0x270F40298]();
}

uint64_t sub_253DF35D0()
{
  return MEMORY[0x270F402A0]();
}

uint64_t sub_253DF35E0()
{
  return MEMORY[0x270F402A8]();
}

uint64_t sub_253DF35F0()
{
  return MEMORY[0x270F402B0]();
}

uint64_t sub_253DF3600()
{
  return MEMORY[0x270F402B8]();
}

uint64_t sub_253DF3610()
{
  return MEMORY[0x270F402C0]();
}

uint64_t sub_253DF3620()
{
  return MEMORY[0x270F402C8]();
}

uint64_t sub_253DF3630()
{
  return MEMORY[0x270F402D0]();
}

uint64_t sub_253DF3640()
{
  return MEMORY[0x270F402D8]();
}

uint64_t sub_253DF3650()
{
  return MEMORY[0x270F402E0]();
}

uint64_t sub_253DF3660()
{
  return MEMORY[0x270F402E8]();
}

uint64_t sub_253DF3670()
{
  return MEMORY[0x270F402F0]();
}

uint64_t sub_253DF3680()
{
  return MEMORY[0x270F402F8]();
}

uint64_t sub_253DF3690()
{
  return MEMORY[0x270F40308]();
}

uint64_t sub_253DF36A0()
{
  return MEMORY[0x270F40318]();
}

uint64_t sub_253DF36B0()
{
  return MEMORY[0x270F40330]();
}

uint64_t sub_253DF36C0()
{
  return MEMORY[0x270F40338]();
}

uint64_t sub_253DF36D0()
{
  return MEMORY[0x270F40348]();
}

uint64_t sub_253DF36E0()
{
  return MEMORY[0x270F40360]();
}

uint64_t sub_253DF36F0()
{
  return MEMORY[0x270F40368]();
}

uint64_t sub_253DF3700()
{
  return MEMORY[0x270F40370]();
}

uint64_t sub_253DF3710()
{
  return MEMORY[0x270F40380]();
}

uint64_t sub_253DF3720()
{
  return MEMORY[0x270F40390]();
}

uint64_t sub_253DF3730()
{
  return MEMORY[0x270F403D8]();
}

uint64_t sub_253DF3740()
{
  return MEMORY[0x270F40428]();
}

uint64_t sub_253DF3750()
{
  return MEMORY[0x270F40440]();
}

uint64_t sub_253DF3760()
{
  return MEMORY[0x270F40470]();
}

uint64_t sub_253DF3770()
{
  return MEMORY[0x270F40478]();
}

uint64_t sub_253DF3780()
{
  return MEMORY[0x270F40480]();
}

uint64_t sub_253DF3790()
{
  return MEMORY[0x270F40490]();
}

uint64_t sub_253DF37A0()
{
  return MEMORY[0x270F404A0]();
}

uint64_t sub_253DF37B0()
{
  return MEMORY[0x270F404A8]();
}

uint64_t sub_253DF37C0()
{
  return MEMORY[0x270F404E0]();
}

uint64_t sub_253DF37D0()
{
  return MEMORY[0x270F40528]();
}

uint64_t sub_253DF37E0()
{
  return MEMORY[0x270F405D8]();
}

uint64_t sub_253DF37F0()
{
  return MEMORY[0x270F40660]();
}

uint64_t sub_253DF3800()
{
  return MEMORY[0x270F40678]();
}

uint64_t sub_253DF3810()
{
  return MEMORY[0x270F40680]();
}

uint64_t sub_253DF3820()
{
  return MEMORY[0x270F40688]();
}

uint64_t sub_253DF3830()
{
  return MEMORY[0x270F40690]();
}

uint64_t sub_253DF3840()
{
  return MEMORY[0x270F406B0]();
}

uint64_t sub_253DF3850()
{
  return MEMORY[0x270F406C0]();
}

uint64_t sub_253DF3860()
{
  return MEMORY[0x270F406F0]();
}

uint64_t sub_253DF3870()
{
  return MEMORY[0x270F406F8]();
}

uint64_t sub_253DF3880()
{
  return MEMORY[0x270F40700]();
}

uint64_t sub_253DF3890()
{
  return MEMORY[0x270F40708]();
}

uint64_t sub_253DF38A0()
{
  return MEMORY[0x270F40710]();
}

uint64_t sub_253DF38B0()
{
  return MEMORY[0x270F40718]();
}

uint64_t sub_253DF38C0()
{
  return MEMORY[0x270F40720]();
}

uint64_t sub_253DF38D0()
{
  return MEMORY[0x270F40728]();
}

uint64_t sub_253DF38E0()
{
  return MEMORY[0x270F40738]();
}

uint64_t sub_253DF38F0()
{
  return MEMORY[0x270F40748]();
}

uint64_t sub_253DF3900()
{
  return MEMORY[0x270F40780]();
}

uint64_t sub_253DF3910()
{
  return MEMORY[0x270F40788]();
}

uint64_t sub_253DF3920()
{
  return MEMORY[0x270F40790]();
}

uint64_t sub_253DF3930()
{
  return MEMORY[0x270F40798]();
}

uint64_t sub_253DF3940()
{
  return MEMORY[0x270F407A0]();
}

uint64_t sub_253DF39C0()
{
  return MEMORY[0x270F40808]();
}

uint64_t sub_253DF39D0()
{
  return MEMORY[0x270F40880]();
}

uint64_t sub_253DF39E0()
{
  return MEMORY[0x270F40898]();
}

uint64_t sub_253DF39F0()
{
  return MEMORY[0x270F408A0]();
}

uint64_t sub_253DF3A00()
{
  return MEMORY[0x270F40910]();
}

uint64_t sub_253DF3A10()
{
  return MEMORY[0x270F40928]();
}

uint64_t sub_253DF3A20()
{
  return MEMORY[0x270F40930]();
}

uint64_t sub_253DF3A30()
{
  return MEMORY[0x270F40938]();
}

uint64_t sub_253DF3A40()
{
  return MEMORY[0x270F40940]();
}

uint64_t sub_253DF3A50()
{
  return MEMORY[0x270F40948]();
}

uint64_t sub_253DF3A60()
{
  return MEMORY[0x270F40978]();
}

uint64_t sub_253DF3A70()
{
  return MEMORY[0x270F40A30]();
}

uint64_t sub_253DF3A80()
{
  return MEMORY[0x270F40A38]();
}

uint64_t sub_253DF3A90()
{
  return MEMORY[0x270F40A40]();
}

uint64_t sub_253DF3AA0()
{
  return MEMORY[0x270F40A80]();
}

uint64_t sub_253DF3AB0()
{
  return MEMORY[0x270F40A88]();
}

uint64_t sub_253DF3AC0()
{
  return MEMORY[0x270F40A90]();
}

uint64_t sub_253DF3AD0()
{
  return MEMORY[0x270F40AB8]();
}

uint64_t sub_253DF3AE0()
{
  return MEMORY[0x270F40AC0]();
}

uint64_t sub_253DF3AF0()
{
  return MEMORY[0x270F40AE0]();
}

uint64_t sub_253DF3B00()
{
  return MEMORY[0x270F40AE8]();
}

uint64_t sub_253DF3B10()
{
  return MEMORY[0x270F40AF0]();
}

uint64_t sub_253DF3B20()
{
  return MEMORY[0x270F40AF8]();
}

uint64_t sub_253DF3B30()
{
  return MEMORY[0x270F40B00]();
}

uint64_t sub_253DF3B40()
{
  return MEMORY[0x270F40B08]();
}

uint64_t sub_253DF3B50()
{
  return MEMORY[0x270F40B10]();
}

uint64_t sub_253DF3B70()
{
  return MEMORY[0x270F40B78]();
}

uint64_t sub_253DF3B80()
{
  return MEMORY[0x270F40B80]();
}

uint64_t sub_253DF3B90()
{
  return MEMORY[0x270F40BB0]();
}

uint64_t sub_253DF3BA0()
{
  return MEMORY[0x270F40BB8]();
}

uint64_t sub_253DF3BB0()
{
  return MEMORY[0x270F40BC0]();
}

uint64_t sub_253DF3BC0()
{
  return MEMORY[0x270F40BD0]();
}

uint64_t sub_253DF3BD0()
{
  return MEMORY[0x270F40BD8]();
}

uint64_t sub_253DF3BE0()
{
  return MEMORY[0x270F40BE0]();
}

uint64_t sub_253DF3BF0()
{
  return MEMORY[0x270F40BE8]();
}

uint64_t sub_253DF3C00()
{
  return MEMORY[0x270F40BF0]();
}

uint64_t sub_253DF3C10()
{
  return MEMORY[0x270F40BF8]();
}

uint64_t sub_253DF3C20()
{
  return MEMORY[0x270F40C00]();
}

uint64_t sub_253DF3C30()
{
  return MEMORY[0x270F40C08]();
}

uint64_t sub_253DF3C40()
{
  return MEMORY[0x270F40C10]();
}

uint64_t sub_253DF3C50()
{
  return MEMORY[0x270F40C18]();
}

uint64_t sub_253DF3C60()
{
  return MEMORY[0x270F40C20]();
}

uint64_t sub_253DF3C70()
{
  return MEMORY[0x270F40C28]();
}

uint64_t sub_253DF3C80()
{
  return MEMORY[0x270F40C30]();
}

uint64_t sub_253DF3C90()
{
  return MEMORY[0x270F40C38]();
}

uint64_t sub_253DF3CA0()
{
  return MEMORY[0x270F40C40]();
}

uint64_t sub_253DF3CB0()
{
  return MEMORY[0x270F40C48]();
}

uint64_t sub_253DF3CC0()
{
  return MEMORY[0x270F40C50]();
}

uint64_t sub_253DF3CD0()
{
  return MEMORY[0x270F40C58]();
}

uint64_t sub_253DF3CE0()
{
  return MEMORY[0x270F40C60]();
}

uint64_t sub_253DF3CF0()
{
  return MEMORY[0x270F40C68]();
}

uint64_t sub_253DF3D00()
{
  return MEMORY[0x270F40C70]();
}

uint64_t sub_253DF3D10()
{
  return MEMORY[0x270F40C78]();
}

uint64_t sub_253DF3D20()
{
  return MEMORY[0x270F40C80]();
}

uint64_t sub_253DF3D30()
{
  return MEMORY[0x270F40C88]();
}

uint64_t sub_253DF3D40()
{
  return MEMORY[0x270F40C90]();
}

uint64_t sub_253DF3D50()
{
  return MEMORY[0x270F40C98]();
}

uint64_t sub_253DF3D60()
{
  return MEMORY[0x270F40CA0]();
}

uint64_t sub_253DF3D70()
{
  return MEMORY[0x270F40CA8]();
}

uint64_t sub_253DF3D80()
{
  return MEMORY[0x270F40CB0]();
}

uint64_t sub_253DF3D90()
{
  return MEMORY[0x270F40CC0]();
}

uint64_t sub_253DF3DA0()
{
  return MEMORY[0x270F40CC8]();
}

uint64_t sub_253DF3DB0()
{
  return MEMORY[0x270F40CD0]();
}

uint64_t sub_253DF3DC0()
{
  return MEMORY[0x270F40CD8]();
}

uint64_t sub_253DF3DD0()
{
  return MEMORY[0x270F40CE0]();
}

uint64_t sub_253DF3DE0()
{
  return MEMORY[0x270F40CE8]();
}

uint64_t sub_253DF3DF0()
{
  return MEMORY[0x270F40CF0]();
}

uint64_t sub_253DF3E00()
{
  return MEMORY[0x270F40D00]();
}

uint64_t sub_253DF3E10()
{
  return MEMORY[0x270F40D08]();
}

uint64_t sub_253DF3E20()
{
  return MEMORY[0x270F40D10]();
}

uint64_t sub_253DF3E30()
{
  return MEMORY[0x270F40D18]();
}

uint64_t sub_253DF3E40()
{
  return MEMORY[0x270F40D20]();
}

uint64_t sub_253DF3E50()
{
  return MEMORY[0x270F40D28]();
}

uint64_t sub_253DF3E60()
{
  return MEMORY[0x270F40D30]();
}

uint64_t sub_253DF3E70()
{
  return MEMORY[0x270F40D38]();
}

uint64_t sub_253DF3E80()
{
  return MEMORY[0x270F40D40]();
}

uint64_t sub_253DF3E90()
{
  return MEMORY[0x270F40D48]();
}

uint64_t sub_253DF3EA0()
{
  return MEMORY[0x270F40D50]();
}

uint64_t sub_253DF3EB0()
{
  return MEMORY[0x270F40D58]();
}

uint64_t sub_253DF3EC0()
{
  return MEMORY[0x270F40D60]();
}

uint64_t sub_253DF3ED0()
{
  return MEMORY[0x270F40D68]();
}

uint64_t sub_253DF3EE0()
{
  return MEMORY[0x270F40D70]();
}

uint64_t sub_253DF3EF0()
{
  return MEMORY[0x270F40D78]();
}

uint64_t sub_253DF3F00()
{
  return MEMORY[0x270F40D80]();
}

uint64_t sub_253DF3F10()
{
  return MEMORY[0x270F40D88]();
}

uint64_t sub_253DF3F20()
{
  return MEMORY[0x270F40D90]();
}

uint64_t sub_253DF3F30()
{
  return MEMORY[0x270F40D98]();
}

uint64_t sub_253DF3F40()
{
  return MEMORY[0x270F40DA0]();
}

uint64_t sub_253DF3F50()
{
  return MEMORY[0x270F40DA8]();
}

uint64_t sub_253DF3F60()
{
  return MEMORY[0x270F40DB0]();
}

uint64_t sub_253DF3F70()
{
  return MEMORY[0x270F40DB8]();
}

uint64_t sub_253DF3F80()
{
  return MEMORY[0x270F40DC0]();
}

uint64_t sub_253DF3F90()
{
  return MEMORY[0x270F40DC8]();
}

uint64_t sub_253DF3FA0()
{
  return MEMORY[0x270F40DD0]();
}

uint64_t sub_253DF3FB0()
{
  return MEMORY[0x270F40DD8]();
}

uint64_t sub_253DF3FC0()
{
  return MEMORY[0x270F40DE0]();
}

uint64_t sub_253DF3FD0()
{
  return MEMORY[0x270F40DE8]();
}

uint64_t sub_253DF3FE0()
{
  return MEMORY[0x270F40DF0]();
}

uint64_t sub_253DF3FF0()
{
  return MEMORY[0x270F40DF8]();
}

uint64_t sub_253DF4000()
{
  return MEMORY[0x270F40E20]();
}

uint64_t sub_253DF4010()
{
  return MEMORY[0x270F40E28]();
}

uint64_t sub_253DF4020()
{
  return MEMORY[0x270F40E30]();
}

uint64_t sub_253DF4030()
{
  return MEMORY[0x270F40E38]();
}

uint64_t sub_253DF4040()
{
  return MEMORY[0x270F40E40]();
}

uint64_t sub_253DF4050()
{
  return MEMORY[0x270F40E48]();
}

uint64_t sub_253DF4060()
{
  return MEMORY[0x270F40E50]();
}

uint64_t sub_253DF4070()
{
  return MEMORY[0x270F40E58]();
}

uint64_t sub_253DF4080()
{
  return MEMORY[0x270F3F728]();
}

uint64_t sub_253DF4090()
{
  return MEMORY[0x270F40E60]();
}

uint64_t sub_253DF40A0()
{
  return MEMORY[0x270F40E68]();
}

uint64_t sub_253DF40B0()
{
  return MEMORY[0x270F40E70]();
}

uint64_t sub_253DF40C0()
{
  return MEMORY[0x270F40E78]();
}

uint64_t sub_253DF40D0()
{
  return MEMORY[0x270F40E80]();
}

uint64_t sub_253DF40E0()
{
  return MEMORY[0x270F40E88]();
}

uint64_t sub_253DF40F0()
{
  return MEMORY[0x270F40E90]();
}

uint64_t sub_253DF4100()
{
  return MEMORY[0x270F40E98]();
}

uint64_t sub_253DF4110()
{
  return MEMORY[0x270F40EA0]();
}

uint64_t sub_253DF4120()
{
  return MEMORY[0x270F40EA8]();
}

uint64_t sub_253DF4130()
{
  return MEMORY[0x270F40EB0]();
}

uint64_t sub_253DF4140()
{
  return MEMORY[0x270F40EB8]();
}

uint64_t sub_253DF4150()
{
  return MEMORY[0x270F40EC0]();
}

uint64_t sub_253DF4160()
{
  return MEMORY[0x270F40EC8]();
}

uint64_t sub_253DF4170()
{
  return MEMORY[0x270F40ED0]();
}

uint64_t sub_253DF4180()
{
  return MEMORY[0x270F40ED8]();
}

uint64_t sub_253DF4190()
{
  return MEMORY[0x270F40EE0]();
}

uint64_t sub_253DF41A0()
{
  return MEMORY[0x270F40EE8]();
}

uint64_t sub_253DF41B0()
{
  return MEMORY[0x270F40F00]();
}

uint64_t sub_253DF41C0()
{
  return MEMORY[0x270F40F08]();
}

uint64_t sub_253DF41D0()
{
  return MEMORY[0x270F40F10]();
}

uint64_t sub_253DF41E0()
{
  return MEMORY[0x270F40F18]();
}

uint64_t sub_253DF41F0()
{
  return MEMORY[0x270F40F20]();
}

uint64_t sub_253DF4200()
{
  return MEMORY[0x270F40F28]();
}

uint64_t sub_253DF4210()
{
  return MEMORY[0x270F40F30]();
}

uint64_t sub_253DF4220()
{
  return MEMORY[0x270F40F38]();
}

uint64_t sub_253DF4230()
{
  return MEMORY[0x270F40F40]();
}

uint64_t sub_253DF4240()
{
  return MEMORY[0x270F40F50]();
}

uint64_t sub_253DF4250()
{
  return MEMORY[0x270F40F58]();
}

uint64_t sub_253DF4260()
{
  return MEMORY[0x270F40F60]();
}

uint64_t sub_253DF4270()
{
  return MEMORY[0x270F40F68]();
}

uint64_t sub_253DF4280()
{
  return MEMORY[0x270F40F70]();
}

uint64_t sub_253DF4290()
{
  return MEMORY[0x270F40F78]();
}

uint64_t sub_253DF42A0()
{
  return MEMORY[0x270F40F88]();
}

uint64_t sub_253DF42B0()
{
  return MEMORY[0x270F40F98]();
}

uint64_t sub_253DF42C0()
{
  return MEMORY[0x270F40FA8]();
}

uint64_t sub_253DF42D0()
{
  return MEMORY[0x270F40FB0]();
}

uint64_t sub_253DF42E0()
{
  return MEMORY[0x270F40FB8]();
}

uint64_t sub_253DF42F0()
{
  return MEMORY[0x270F40FC0]();
}

uint64_t sub_253DF4300()
{
  return MEMORY[0x270F40FC8]();
}

uint64_t sub_253DF4310()
{
  return MEMORY[0x270F40FD0]();
}

uint64_t sub_253DF4320()
{
  return MEMORY[0x270F41028]();
}

uint64_t sub_253DF4330()
{
  return MEMORY[0x270F41038]();
}

uint64_t sub_253DF4340()
{
  return MEMORY[0x270F41040]();
}

uint64_t sub_253DF4350()
{
  return MEMORY[0x270F41048]();
}

uint64_t sub_253DF4360()
{
  return MEMORY[0x270F41050]();
}

uint64_t sub_253DF4370()
{
  return MEMORY[0x270F41058]();
}

uint64_t sub_253DF4380()
{
  return MEMORY[0x270F41060]();
}

uint64_t sub_253DF4390()
{
  return MEMORY[0x270F41078]();
}

uint64_t sub_253DF43A0()
{
  return MEMORY[0x270F41080]();
}

uint64_t sub_253DF43B0()
{
  return MEMORY[0x270F41088]();
}

uint64_t sub_253DF43C0()
{
  return MEMORY[0x270F41098]();
}

uint64_t sub_253DF43D0()
{
  return MEMORY[0x270F410A8]();
}

uint64_t sub_253DF43E0()
{
  return MEMORY[0x270F410B0]();
}

uint64_t sub_253DF43F0()
{
  return MEMORY[0x270F410B8]();
}

uint64_t sub_253DF4400()
{
  return MEMORY[0x270F410C0]();
}

uint64_t sub_253DF4410()
{
  return MEMORY[0x270F410C8]();
}

uint64_t sub_253DF4420()
{
  return MEMORY[0x270F410D0]();
}

uint64_t sub_253DF4430()
{
  return MEMORY[0x270FA19A0]();
}

uint64_t sub_253DF4440()
{
  return MEMORY[0x270FA19C0]();
}

uint64_t sub_253DF4450()
{
  return MEMORY[0x270FA1A28]();
}

uint64_t sub_253DF4460()
{
  return MEMORY[0x270EE3820]();
}

uint64_t sub_253DF4470()
{
  return MEMORY[0x270EE3828]();
}

uint64_t sub_253DF4480()
{
  return MEMORY[0x270EE3838]();
}

uint64_t sub_253DF4490()
{
  return MEMORY[0x270EE39A0]();
}

uint64_t sub_253DF44A0()
{
  return MEMORY[0x270EE39D0]();
}

uint64_t sub_253DF44B0()
{
  return MEMORY[0x270EE39E8]();
}

uint64_t sub_253DF44C0()
{
  return MEMORY[0x270EE3A00]();
}

uint64_t sub_253DF44D0()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_253DF44E0()
{
  return MEMORY[0x270EE3B78]();
}

uint64_t sub_253DF44F0()
{
  return MEMORY[0x270EE3B80]();
}

uint64_t sub_253DF4500()
{
  return MEMORY[0x270EE3BD0]();
}

uint64_t sub_253DF4510()
{
  return MEMORY[0x270EE3C08]();
}

uint64_t sub_253DF4520()
{
  return MEMORY[0x270EE3C10]();
}

uint64_t sub_253DF4530()
{
  return MEMORY[0x270EE3C28]();
}

uint64_t sub_253DF4540()
{
  return MEMORY[0x270EE3C30]();
}

uint64_t sub_253DF4550()
{
  return MEMORY[0x270EE3C38]();
}

uint64_t sub_253DF4570()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_253DF4580()
{
  return MEMORY[0x270EE3C58]();
}

uint64_t sub_253DF4590()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_253DF45A0()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_253DF45B0()
{
  return MEMORY[0x270EE3D50]();
}

uint64_t sub_253DF45C0()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_253DF45D0()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_253DF45E0()
{
  return MEMORY[0x270EE3EC0]();
}

uint64_t sub_253DF45F0()
{
  return MEMORY[0x270EE3FD0]();
}

uint64_t sub_253DF4600()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_253DF4610()
{
  return MEMORY[0x270F7F910]();
}

uint64_t sub_253DF4620()
{
  return MEMORY[0x270F7F918]();
}

uint64_t sub_253DF4630()
{
  return MEMORY[0x270F7F920]();
}

uint64_t sub_253DF4640()
{
  return MEMORY[0x270F7F928]();
}

uint64_t sub_253DF4650()
{
  return MEMORY[0x270F7F948]();
}

uint64_t sub_253DF4660()
{
  return MEMORY[0x270F7F970]();
}

uint64_t sub_253DF4670()
{
  return MEMORY[0x270F7F980]();
}

uint64_t sub_253DF4680()
{
  return MEMORY[0x270F7F988]();
}

uint64_t sub_253DF4690()
{
  return MEMORY[0x270F7F9B0]();
}

uint64_t sub_253DF46A0()
{
  return MEMORY[0x270F7F9C8]();
}

uint64_t sub_253DF46B0()
{
  return MEMORY[0x270F7F9D0]();
}

uint64_t sub_253DF46C0()
{
  return MEMORY[0x270F7F9D8]();
}

uint64_t sub_253DF46D0()
{
  return MEMORY[0x270F3F730]();
}

uint64_t sub_253DF46E0()
{
  return MEMORY[0x270F3F738]();
}

uint64_t sub_253DF46F0()
{
  return MEMORY[0x270F7FA08]();
}

uint64_t sub_253DF4700()
{
  return MEMORY[0x270F7FA10]();
}

uint64_t sub_253DF4710()
{
  return MEMORY[0x270F7FA18]();
}

uint64_t sub_253DF4720()
{
  return MEMORY[0x270F7FA30]();
}

uint64_t sub_253DF4730()
{
  return MEMORY[0x270F7FA38]();
}

uint64_t sub_253DF4740()
{
  return MEMORY[0x270F7FA40]();
}

uint64_t sub_253DF4750()
{
  return MEMORY[0x270F7FA48]();
}

uint64_t sub_253DF4760()
{
  return MEMORY[0x270F7FA50]();
}

uint64_t sub_253DF4790()
{
  return MEMORY[0x270F7FAC0]();
}

uint64_t sub_253DF47A0()
{
  return MEMORY[0x270F7FAC8]();
}

uint64_t sub_253DF47B0()
{
  return MEMORY[0x270F7FAD0]();
}

uint64_t sub_253DF47C0()
{
  return MEMORY[0x270F7FAD8]();
}

uint64_t sub_253DF47D0()
{
  return MEMORY[0x270F7FAE0]();
}

uint64_t sub_253DF47E0()
{
  return MEMORY[0x270F7FAE8]();
}

uint64_t sub_253DF47F0()
{
  return MEMORY[0x270F7FAF0]();
}

uint64_t sub_253DF4800()
{
  return MEMORY[0x270F7FAF8]();
}

uint64_t sub_253DF4810()
{
  return MEMORY[0x270F7FB00]();
}

uint64_t sub_253DF4820()
{
  return MEMORY[0x270F7FB30]();
}

uint64_t sub_253DF4830()
{
  return MEMORY[0x270F7FB48]();
}

uint64_t sub_253DF4840()
{
  return MEMORY[0x270F7FB50]();
}

uint64_t sub_253DF4850()
{
  return MEMORY[0x270F7FB58]();
}

uint64_t sub_253DF4860()
{
  return MEMORY[0x270F7FB60]();
}

uint64_t sub_253DF4870()
{
  return MEMORY[0x270F7FB68]();
}

uint64_t sub_253DF4880()
{
  return MEMORY[0x270F7FB70]();
}

uint64_t sub_253DF4890()
{
  return MEMORY[0x270F7FB78]();
}

uint64_t sub_253DF48A0()
{
  return MEMORY[0x270F7FB80]();
}

uint64_t sub_253DF48B0()
{
  return MEMORY[0x270F7FB88]();
}

uint64_t sub_253DF48C0()
{
  return MEMORY[0x270F7FB90]();
}

uint64_t sub_253DF48D0()
{
  return MEMORY[0x270F7FB98]();
}

uint64_t sub_253DF48E0()
{
  return MEMORY[0x270F7FBA0]();
}

uint64_t sub_253DF48F0()
{
  return MEMORY[0x270F7FC28]();
}

uint64_t sub_253DF4900()
{
  return MEMORY[0x270F7FC30]();
}

uint64_t sub_253DF4910()
{
  return MEMORY[0x270F7FC38]();
}

uint64_t sub_253DF4920()
{
  return MEMORY[0x270F7FC40]();
}

uint64_t sub_253DF4930()
{
  return MEMORY[0x270F7FC48]();
}

uint64_t sub_253DF4940()
{
  return MEMORY[0x270F7FC50]();
}

uint64_t sub_253DF4950()
{
  return MEMORY[0x270F7FC58]();
}

uint64_t sub_253DF4960()
{
  return MEMORY[0x270F7FC60]();
}

uint64_t sub_253DF4970()
{
  return MEMORY[0x270F7FC68]();
}

uint64_t sub_253DF4980()
{
  return MEMORY[0x270F7FC70]();
}

uint64_t sub_253DF4990()
{
  return MEMORY[0x270F7FC80]();
}

uint64_t sub_253DF49A0()
{
  return MEMORY[0x270F7FC88]();
}

uint64_t sub_253DF49B0()
{
  return MEMORY[0x270F7FCA0]();
}

uint64_t sub_253DF49C0()
{
  return MEMORY[0x270F7FCA8]();
}

uint64_t sub_253DF49D0()
{
  return MEMORY[0x270F7FCB0]();
}

uint64_t sub_253DF49E0()
{
  return MEMORY[0x270F41110]();
}

uint64_t sub_253DF49F0()
{
  return MEMORY[0x270F7FCC0]();
}

uint64_t sub_253DF4A00()
{
  return MEMORY[0x270F7FCD0]();
}

uint64_t sub_253DF4A10()
{
  return MEMORY[0x270F7FCE0]();
}

uint64_t sub_253DF4A20()
{
  return MEMORY[0x270F7FCE8]();
}

uint64_t sub_253DF4A30()
{
  return MEMORY[0x270F7FD28]();
}

uint64_t sub_253DF4A40()
{
  return MEMORY[0x270F7FD30]();
}

uint64_t sub_253DF4A70()
{
  return MEMORY[0x270F7FD50]();
}

uint64_t sub_253DF4A80()
{
  return MEMORY[0x270F7FD58]();
}

uint64_t sub_253DF4A90()
{
  return MEMORY[0x270F7FD60]();
}

uint64_t sub_253DF4AA0()
{
  return MEMORY[0x270F7FD68]();
}

uint64_t sub_253DF4AB0()
{
  return MEMORY[0x270F7FE48]();
}

uint64_t sub_253DF4AC0()
{
  return MEMORY[0x270F7FE50]();
}

uint64_t sub_253DF4AD0()
{
  return MEMORY[0x270F7FE60]();
}

uint64_t sub_253DF4AE0()
{
  return MEMORY[0x270F7FE70]();
}

uint64_t sub_253DF4AF0()
{
  return MEMORY[0x270F7FE78]();
}

uint64_t sub_253DF4B00()
{
  return MEMORY[0x270F7FE98]();
}

uint64_t sub_253DF4B10()
{
  return MEMORY[0x270F7FEB0]();
}

uint64_t sub_253DF4B20()
{
  return MEMORY[0x270F7FEF0]();
}

uint64_t sub_253DF4B30()
{
  return MEMORY[0x270F7FF48]();
}

uint64_t sub_253DF4B40()
{
  return MEMORY[0x270F7FF58]();
}

uint64_t sub_253DF4B50()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_253DF4B60()
{
  return MEMORY[0x270F7FFC8]();
}

uint64_t sub_253DF4B70()
{
  return MEMORY[0x270F7FFD0]();
}

uint64_t sub_253DF4B80()
{
  return MEMORY[0x270F7FFE8]();
}

uint64_t sub_253DF4B90()
{
  return MEMORY[0x270F3F740]();
}

uint64_t sub_253DF4BA0()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_253DF4BB0()
{
  return MEMORY[0x270F80018]();
}

uint64_t sub_253DF4BC0()
{
  return MEMORY[0x270F80020]();
}

uint64_t sub_253DF4BD0()
{
  return MEMORY[0x270F80028]();
}

uint64_t sub_253DF4BE0()
{
  return MEMORY[0x270F80048]();
}

uint64_t sub_253DF4BF0()
{
  return MEMORY[0x270F80060]();
}

uint64_t sub_253DF4C00()
{
  return MEMORY[0x270F80068]();
}

uint64_t sub_253DF4C10()
{
  return MEMORY[0x270F80070]();
}

uint64_t sub_253DF4C20()
{
  return MEMORY[0x270F800C8]();
}

uint64_t sub_253DF4C30()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_253DF4C40()
{
  return MEMORY[0x270F80118]();
}

uint64_t sub_253DF4C50()
{
  return MEMORY[0x270F80120]();
}

uint64_t sub_253DF4C60()
{
  return MEMORY[0x270F80140]();
}

uint64_t sub_253DF4C70()
{
  return MEMORY[0x270F80148]();
}

uint64_t sub_253DF4C80()
{
  return MEMORY[0x270F80168]();
}

uint64_t sub_253DF4C90()
{
  return MEMORY[0x270F80170]();
}

uint64_t sub_253DF4CA0()
{
  return MEMORY[0x270F801A8]();
}

uint64_t sub_253DF4CB0()
{
  return MEMORY[0x270F801B0]();
}

uint64_t sub_253DF4CC0()
{
  return MEMORY[0x270F801B8]();
}

uint64_t sub_253DF4CD0()
{
  return MEMORY[0x270F801C0]();
}

uint64_t sub_253DF4CE0()
{
  return MEMORY[0x270F801C8]();
}

uint64_t sub_253DF4CF0()
{
  return MEMORY[0x270F801D0]();
}

uint64_t sub_253DF4D00()
{
  return MEMORY[0x270F801D8]();
}

uint64_t sub_253DF4D10()
{
  return MEMORY[0x270F801E0]();
}

uint64_t sub_253DF4D20()
{
  return MEMORY[0x270F801E8]();
}

uint64_t sub_253DF4D30()
{
  return MEMORY[0x270F80230]();
}

uint64_t sub_253DF4D40()
{
  return MEMORY[0x270F80288]();
}

uint64_t sub_253DF4D50()
{
  return MEMORY[0x270F80290]();
}

uint64_t sub_253DF4D60()
{
  return MEMORY[0x270F80298]();
}

uint64_t sub_253DF4D70()
{
  return MEMORY[0x270F802A0]();
}

uint64_t sub_253DF4D80()
{
  return MEMORY[0x270F802D0]();
}

uint64_t sub_253DF4D90()
{
  return MEMORY[0x270F802D8]();
}

uint64_t sub_253DF4DA0()
{
  return MEMORY[0x270F802E0]();
}

uint64_t sub_253DF4DB0()
{
  return MEMORY[0x270F802F0]();
}

uint64_t sub_253DF4DC0()
{
  return MEMORY[0x270F802F8]();
}

uint64_t sub_253DF4DD0()
{
  return MEMORY[0x270F80300]();
}

uint64_t sub_253DF4DE0()
{
  return MEMORY[0x270F80318]();
}

uint64_t sub_253DF4DF0()
{
  return MEMORY[0x270F80338]();
}

uint64_t sub_253DF4E00()
{
  return MEMORY[0x270F80360]();
}

uint64_t sub_253DF4E10()
{
  return MEMORY[0x270F3F748]();
}

uint64_t sub_253DF4E20()
{
  return MEMORY[0x270F80390]();
}

uint64_t sub_253DF4E30()
{
  return MEMORY[0x270F80398]();
}

uint64_t sub_253DF4E40()
{
  return MEMORY[0x270F803B0]();
}

uint64_t sub_253DF4E50()
{
  return MEMORY[0x270F803B8]();
}

uint64_t sub_253DF4E60()
{
  return MEMORY[0x270F803E8]();
}

uint64_t sub_253DF4E70()
{
  return MEMORY[0x270F803F0]();
}

uint64_t sub_253DF4E80()
{
  return MEMORY[0x270F803F8]();
}

uint64_t sub_253DF4E90()
{
  return MEMORY[0x270F80460]();
}

uint64_t sub_253DF4EA0()
{
  return MEMORY[0x270F80498]();
}

uint64_t sub_253DF4EB0()
{
  return MEMORY[0x270F804A0]();
}

uint64_t sub_253DF4EC0()
{
  return MEMORY[0x270F804A8]();
}

uint64_t sub_253DF4ED0()
{
  return MEMORY[0x270F804B0]();
}

uint64_t sub_253DF4EE0()
{
  return MEMORY[0x270F804F8]();
}

uint64_t sub_253DF4EF0()
{
  return MEMORY[0x270F80500]();
}

uint64_t sub_253DF4F00()
{
  return MEMORY[0x270F80508]();
}

uint64_t sub_253DF4F10()
{
  return MEMORY[0x270F80510]();
}

uint64_t sub_253DF4F20()
{
  return MEMORY[0x270F80518]();
}

uint64_t sub_253DF4F30()
{
  return MEMORY[0x270F80520]();
}

uint64_t sub_253DF4F40()
{
  return MEMORY[0x270F80568]();
}

uint64_t sub_253DF4F50()
{
  return MEMORY[0x270F80570]();
}

uint64_t sub_253DF4F60()
{
  return MEMORY[0x270F80578]();
}

uint64_t sub_253DF4F70()
{
  return MEMORY[0x270F80580]();
}

uint64_t sub_253DF4F80()
{
  return MEMORY[0x270F80588]();
}

uint64_t sub_253DF4F90()
{
  return MEMORY[0x270F80590]();
}

uint64_t sub_253DF4FA0()
{
  return MEMORY[0x270F80598]();
}

uint64_t sub_253DF4FB0()
{
  return MEMORY[0x270F805A0]();
}

uint64_t sub_253DF4FC0()
{
  return MEMORY[0x270F805A8]();
}

uint64_t sub_253DF4FD0()
{
  return MEMORY[0x270F805B0]();
}

uint64_t sub_253DF4FE0()
{
  return MEMORY[0x270F3F750]();
}

uint64_t sub_253DF4FF0()
{
  return MEMORY[0x270F805C8]();
}

uint64_t sub_253DF5000()
{
  return MEMORY[0x270F805D0]();
}

uint64_t sub_253DF5010()
{
  return MEMORY[0x270F805E8]();
}

uint64_t sub_253DF5020()
{
  return MEMORY[0x270F80650]();
}

uint64_t sub_253DF5030()
{
  return MEMORY[0x270F80660]();
}

uint64_t sub_253DF5040()
{
  return MEMORY[0x270F80670]();
}

uint64_t sub_253DF5050()
{
  return MEMORY[0x270F80688]();
}

uint64_t sub_253DF5060()
{
  return MEMORY[0x270F80690]();
}

uint64_t sub_253DF5070()
{
  return MEMORY[0x270F806E8]();
}

uint64_t sub_253DF5080()
{
  return MEMORY[0x270F806F0]();
}

uint64_t sub_253DF5090()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_253DF50A0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_253DF50B0()
{
  return MEMORY[0x270FA09D8]();
}

uint64_t sub_253DF50C0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_253DF50D0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_253DF50E0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_253DF50F0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_253DF5100()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_253DF5110()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_253DF5120()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_253DF5130()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_253DF5140()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_253DF5150()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_253DF5160()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_253DF5170()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_253DF5180()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_253DF5190()
{
  return MEMORY[0x270F41128]();
}

uint64_t sub_253DF51A0()
{
  return MEMORY[0x270F9D160]();
}

uint64_t sub_253DF51B0()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_253DF51C0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_253DF51D0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_253DF51E0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_253DF51F0()
{
  return MEMORY[0x270F41138]();
}

uint64_t sub_253DF5200()
{
  return MEMORY[0x270F9D230]();
}

uint64_t sub_253DF5210()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_253DF5220()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_253DF5230()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_253DF5240()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_253DF5250()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_253DF5260()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_253DF5270()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_253DF5280()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_253DF5290()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_253DF52A0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_253DF52B0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_253DF52C0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_253DF52D0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_253DF52E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_253DF52F0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_253DF5300()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_253DF5310()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_253DF5320()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_253DF5330()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_253DF5340()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_253DF5350()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_253DF5360()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_253DF5370()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_253DF5380()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_253DF5390()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_253DF53A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_253DF53B0()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_253DF53C0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_253DF53D0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_253DF53E0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_253DF53F0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_253DF5400()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_253DF5410()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_253DF5420()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_253DF5430()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_253DF5440()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_253DF5450()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_253DF5460()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_253DF5470()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_253DF5480()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_253DF5490()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_253DF54A0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_253DF54B0()
{
  return MEMORY[0x270FA1E70]();
}

uint64_t sub_253DF54E0()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_253DF54F0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_253DF5500()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_253DF5510()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_253DF5520()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_253DF5530()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_253DF5540()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_253DF5550()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_253DF5560()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_253DF5570()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_253DF55A0()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_253DF55B0()
{
  return MEMORY[0x270F57838]();
}

uint64_t sub_253DF55D0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_253DF5600()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_253DF5620()
{
  return MEMORY[0x270FA2050]();
}

uint64_t sub_253DF5640()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_253DF5650()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_253DF5670()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_253DF5680()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_253DF5690()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_253DF56A0()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_253DF56B0()
{
  return MEMORY[0x270FA10E0]();
}

uint64_t sub_253DF56C0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_253DF56D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_253DF56E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_253DF56F0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_253DF5700()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_253DF5710()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_253DF5720()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_253DF5730()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_253DF5740()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_253DF5750()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_253DF5760()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_253DF5770()
{
  return MEMORY[0x270F80700]();
}

uint64_t sub_253DF5780()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_253DF5790()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_253DF57A0()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_253DF57B0()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_253DF57C0()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_253DF57D0()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_253DF57E0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_253DF57F0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_253DF5800()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_253DF5810()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_253DF5820()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_253DF5830()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_253DF5840()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_253DF5850()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_253DF5860()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_253DF5870()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_253DF5890()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_253DF58A0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_253DF58B0()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_253DF58C0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_253DF58D0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_253DF58E0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_253DF58F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_253DF5900()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_253DF5910()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_253DF5920()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_253DF5930()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_253DF5940()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_253DF5950()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_253DF5960()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_253DF5970()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_253DF5980()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_253DF5990()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_253DF59B0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_253DF59C0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_253DF59D0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_253DF59E0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_253DF59F0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_253DF5A00()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_253DF5A10()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_253DF5A20()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_253DF5A30()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_253DF5A40()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_253DF5A50()
{
  return MEMORY[0x270F9EDD8]();
}

uint64_t sub_253DF5A60()
{
  return MEMORY[0x270F9EE00]();
}

uint64_t sub_253DF5A70()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_253DF5A80()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_253DF5A90()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_253DF5AA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_253DF5AB0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_253DF5AC0()
{
  return MEMORY[0x270F9F020]();
}

uint64_t sub_253DF5AD0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_253DF5AE0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_253DF5AF0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_253DF5B00()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_253DF5B10()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_253DF5B30()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_253DF5B40()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_253DF5B50()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_253DF5B60()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_253DF5B70()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_253DF5B80()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_253DF5B90()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_253DF5BA0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_253DF5BB0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_253DF5BC0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_253DF5BD0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_253DF5BE0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_253DF5BF0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_253DF5C00()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_253DF5C10()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_253DF5C20()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_253DF5C30()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_253DF5C40()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_253DF5C60()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_253DF5C70()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_253DF5C80()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_253DF5C90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_253DF5CA0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_253DF5CB0()
{
  return MEMORY[0x270F9FA78]();
}

uint64_t sub_253DF5CC0()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_253DF5CD0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_253DF5CE0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_253DF5CF0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_253DF5D00()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_253DF5D40()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_253DF5D50()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_253DF5D60()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_253DF5D70()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_253DF5D80()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_253DF5DA0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_253DF5DB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_253DF5DC0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_253DF5DD0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_253DF5DE0()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t sub_253DF5DF0()
{
  return MEMORY[0x270F9FCC8]();
}

uint64_t sub_253DF5E00()
{
  return MEMORY[0x270F9FCF0]();
}

uint64_t sub_253DF5E10()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_253DF5E20()
{
  return MEMORY[0x270EF27A0]();
}

uint64_t sub_253DF5E30()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_253DF5E40()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_253DF5E50()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_253DF5E90()
{
  return MEMORY[0x270FA0128]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
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

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x270EDA920]();
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

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}