uint64_t sub_3724()
{
  uint64_t v0;

  v0 = sub_6B10();
  sub_3934(v0, static Logger.safetySession);
  sub_3844(v0, (uint64_t)static Logger.safetySession);
  if (qword_C4B8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_6B00();
}

uint64_t Logger.safetySession.unsafeMutableAddressor()
{
  if (qword_C4B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_6B10();

  return sub_3844(v0, (uint64_t)static Logger.safetySession);
}

uint64_t sub_3844(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.safetySession.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_C4B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_6B10();
  uint64_t v3 = sub_3844(v2, (uint64_t)static Logger.safetySession);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t *sub_3934(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_3998()
{
  unk_C9E6 = -4864;
}

uint64_t sub_39C8()
{
  sub_3A24(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for SharedObjectsHolder()
{
  return self;
}

uint64_t sub_3A24(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_3A74@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  sub_4744(v1 + 56, (uint64_t)&v6);
  if (!v7)
  {
    sub_47AC((uint64_t)&v6, &qword_C698);
    sub_4744(v1 + 16, (uint64_t)&v4);
    if (v5)
    {
      sub_4914(&v4, (uint64_t)&v6);
    }
    else
    {
      v7 = &type metadata for SafetySessionFlowPlugin.SharedObjectProvider;
      v8 = &off_86C8;
      *(void *)&long long v6 = swift_allocObject();
      sub_6A30();
      sub_6A20();
      sub_47AC((uint64_t)&v4, &qword_C698);
    }
    sub_4848((uint64_t)&v6, (uint64_t)&v4);
    swift_beginAccess();
    sub_48AC((uint64_t)&v4, v1 + 56);
    swift_endAccess();
  }
  return sub_4914(&v6, a1);
}

uint64_t sub_3B94()
{
  if (qword_C4B0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_6B10();
  sub_3844(v0, (uint64_t)static Logger.safetySession);
  uint64_t v1 = sub_6AF0();
  os_log_type_t v2 = sub_6B30();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "SafetySessionFlowPlugin is being initialized", v3, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for SafetySessionFlowPlugin();
  memset(v6, 0, sizeof(v6));
  uint64_t v7 = 0;
  uint64_t v4 = swift_allocObject();
  sub_3CA0((uint64_t)v6);
  return v4;
}

uint64_t sub_3CA0(uint64_t a1)
{
  sub_6AE0();
  __chkstk_darwin();
  type metadata accessor for SafetySessionCATs();
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(void *)(v1 + 88) = 0;
  sub_6AD0();
  *(void *)(v1 + 96) = sub_6A60();
  sub_46DC(a1, v1 + 16);
  return v1;
}

uint64_t sub_3D5C()
{
  sub_3A74((uint64_t)v4);
  uint64_t v0 = sub_4574(v4, v4[3]);
  sub_4848((uint64_t)(v0 + 5), (uint64_t)&v3);
  sub_6970();
  swift_allocObject();
  swift_retain();
  uint64_t v1 = sub_6960();
  sub_3A24((uint64_t)v4);
  v4[0] = v1;
  sub_6980();
  swift_release();
  sub_6990();
  return swift_release();
}

uint64_t sub_3E38()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_3ED4;
  return sub_3F94();
}

uint64_t sub_3ED4()
{
  sub_4DCC();
  sub_4DB4();
  uint64_t v1 = *v0;
  sub_4DD8();
  *os_log_type_t v2 = v1;
  swift_task_dealloc();
  sub_4DE8();
  return v3();
}

uint64_t sub_3F94()
{
  sub_4DCC();
  v1[17] = v2;
  v1[18] = v0;
  sub_4530(&qword_C678);
  v1[19] = swift_task_alloc();
  uint64_t v3 = sub_6A10();
  v1[20] = v3;
  v1[21] = *(void *)(v3 - 8);
  v1[22] = swift_task_alloc();
  return _swift_task_switch(sub_4080, 0, 0);
}

uint64_t sub_4080()
{
  sub_4DCC();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_4118;
  uint64_t v2 = *(void *)(v0 + 176);
  return sub_4E7C(v2);
}

uint64_t sub_4118()
{
  sub_4DCC();
  sub_4DB4();
  uint64_t v2 = *v1;
  sub_4DD8();
  *uint64_t v3 = v2;
  *(void *)(v4 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_4378;
  }
  else {
    uint64_t v5 = sub_41FC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_41FC()
{
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v5 = *(uint64_t **)(v0 + 136);
  sub_3A74(v0 + 16);
  long long v6 = sub_4574((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_4848((uint64_t)v6, v0 + 56);
  uint64_t v7 = sub_6A00();
  sub_45B8(v3, 1, 1, v7);
  uint64_t v8 = sub_6A40();
  *(_OWORD *)(v0 + 112) = 0u;
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  v5[3] = v8;
  v5[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_45E0(v5);
  sub_69F0();
  sub_47AC(v0 + 96, &qword_C680);
  sub_47AC(v3, &qword_C678);
  sub_3A24(v0 + 56);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  sub_3A24(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_4DE8();
  return v9();
}

uint64_t sub_4378()
{
  sub_4DCC();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_4DE8();
  return v0();
}

uint64_t sub_43E0()
{
  sub_47AC(v0 + 16, &qword_C698);
  sub_47AC(v0 + 56, &qword_C698);
  swift_release();
  return v0;
}

uint64_t sub_4428()
{
  sub_43E0();

  return _swift_deallocClassInstance(v0, 104, 7);
}

uint64_t type metadata accessor for SafetySessionFlowPlugin()
{
  return self;
}

uint64_t sub_4480()
{
  return sub_3D5C();
}

uint64_t sub_44A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3B94();
  *a1 = result;
  return result;
}

unint64_t sub_44E4()
{
  unint64_t result = qword_C670;
  if (!qword_C670)
  {
    type metadata accessor for SafetySessionFlowPlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C670);
  }
  return result;
}

uint64_t sub_4530(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_4574(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_45B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t *sub_45E0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_4644()
{
  sub_4DCC();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_3ED4;
  return sub_3E38();
}

uint64_t sub_46DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4530(&qword_C698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_4744(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4530(&qword_C698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_47AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4530(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_4808()
{
  sub_3A24(v0 + 16);
  sub_3A24(v0 + 56);

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_4848(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_48AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4530(&qword_C698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_4914(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for SafetySessionFlowPlugin.SharedObjectProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SafetySessionFlowPlugin.SharedObjectProvider(uint64_t a1)
{
  sub_3A24(a1);

  return sub_3A24(a1 + 40);
}

uint64_t initializeWithCopy for SafetySessionFlowPlugin.SharedObjectProvider(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for SafetySessionFlowPlugin.SharedObjectProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_4A7C(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

void *initializeWithTake for SafetySessionFlowPlugin.SharedObjectProvider(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for SafetySessionFlowPlugin.SharedObjectProvider(uint64_t a1, uint64_t a2)
{
  sub_3A24(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_3A24(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for SafetySessionFlowPlugin.SharedObjectProvider(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SafetySessionFlowPlugin.SharedObjectProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SafetySessionFlowPlugin.SharedObjectProvider()
{
  return &type metadata for SafetySessionFlowPlugin.SharedObjectProvider;
}

uint64_t sub_4DE8()
{
  return v0 + 8;
}

uint64_t type metadata accessor for SafetySessionCATs()
{
  uint64_t result = qword_C6A0;
  if (!qword_C6A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_4E3C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_4E7C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, void *))((char *)&async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:)
                                                                                   + async function pointer to dispatch thunk of CATWrapper.execute(catId:parameters:));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_4F4C;
  return v5(a1, 0xD000000000000020, 0x80000000000073E0, &_swiftEmptyArrayStorage);
}

uint64_t sub_4F4C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_5040(uint64_t a1, uint64_t a2)
{
  return sub_5094(a1, a2);
}

uint64_t sub_5094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6AE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4530(&qword_C6F8);
  __chkstk_darwin();
  sub_5234(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v9 = sub_6A50();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_529C(a1);
  return v9;
}

uint64_t sub_51FC()
{
  uint64_t v0 = sub_6A70();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_522C()
{
  return type metadata accessor for SafetySessionCATs();
}

uint64_t sub_5234(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4530(&qword_C6F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_529C(uint64_t a1)
{
  uint64_t v2 = sub_4530(&qword_C6F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_52FC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000011;
  }
  else {
    unint64_t v3 = 1701667182;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0x8000000000007250;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000011;
  }
  else {
    unint64_t v5 = 1701667182;
  }
  if (a2) {
    unint64_t v6 = 0x8000000000007250;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_6BA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_5398()
{
  return sub_540C();
}

uint64_t sub_53A4()
{
  sub_6B20();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_540C()
{
  return sub_6BC0();
}

uint64_t sub_5488()
{
  sub_6184(v0 + OBJC_IVAR____TtCC23SafetySessionFlowPlugin10SirikitApp7Builder_name);
  sub_65E8();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return _swift_deallocClassInstance(v0, v2, v3);
}

uint64_t sub_54CC()
{
  return 0x2E74696B69726973;
}

uint64_t sub_54EC()
{
  return 0;
}

uint64_t sub_54F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_4530(&qword_C928);
  __chkstk_darwin();
  sub_65FC();
  uint64_t v9 = v8 - v7;
  BOOL v10 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v10 || (uint64_t result = sub_6BA0(), (result & 1) != 0))
  {
    sub_6298(v3 + OBJC_IVAR____TtC23SafetySessionFlowPlugin10SirikitApp_name, v9);
    uint64_t v12 = sub_6A80();
    if (sub_6300(v9, 1, v12) == 1)
    {
      uint64_t result = sub_6184(v9);
LABEL_8:
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return result;
    }
    *(void *)(a3 + 24) = v12;
    v13 = sub_45E0((uint64_t *)a3);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v13, v9, v12);
  }
  else
  {
    if (a1 != 0xD000000000000011 || a2 != 0x8000000000007250)
    {
      uint64_t result = sub_6BA0();
      if ((result & 1) == 0) {
        goto LABEL_8;
      }
    }
    char v14 = *(unsigned char *)(v3 + OBJC_IVAR____TtC23SafetySessionFlowPlugin10SirikitApp_isDesignedByApple);
    *(void *)(a3 + 24) = &type metadata for Bool;
    *(unsigned char *)a3 = v14;
  }
  return result;
}

uint64_t sub_569C(uint64_t a1, void *a2)
{
  v7._countAndFlagsBits = a1;
  v3._rawValue = &off_85B0;
  v7._object = a2;
  Swift::Int v4 = sub_6B50(v3, v7);
  swift_bridgeObjectRelease();
  if (v4 == 1) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_56F4(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_5728(char *a1, char *a2)
{
  return sub_52FC(*a1, *a2);
}

Swift::Int sub_5734()
{
  return sub_5398();
}

uint64_t sub_573C()
{
  return sub_53A4();
}

Swift::Int sub_5744()
{
  return sub_540C();
}

uint64_t sub_574C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_569C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_577C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_56F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_57A8()
{
  return sub_56F4(*v0);
}

uint64_t sub_57B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_56F0();
  *a1 = result;
  return result;
}

uint64_t sub_57D8()
{
  return 0;
}

void sub_57E4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_57F0(uint64_t a1)
{
  unint64_t v2 = sub_61E4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_582C(uint64_t a1)
{
  unint64_t v2 = sub_61E4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_5868()
{
  sub_6184(v0 + OBJC_IVAR____TtC23SafetySessionFlowPlugin10SirikitApp_name);
  sub_65E8();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return _swift_deallocClassInstance(v0, v2, v3);
}

uint64_t sub_58B4()
{
  return type metadata accessor for SirikitApp(0);
}

uint64_t type metadata accessor for SirikitApp(uint64_t a1)
{
  return sub_5BDC(a1, (uint64_t *)&unk_C728);
}

void sub_58DC()
{
  sub_5B5C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_5980(void *a1)
{
  uint64_t v3 = sub_4530(&qword_C948);
  sub_65CC();
  uint64_t v5 = v4;
  __chkstk_darwin();
  sub_65FC();
  uint64_t v8 = v7 - v6;
  sub_4574(a1, a1[3]);
  sub_61E4();
  sub_6BE0();
  sub_6A80();
  sub_613C(&qword_C950, (void (*)(uint64_t))&type metadata accessor for SpeakableString);
  sub_6B80();
  if (!v1) {
    sub_6B90();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v8, v3);
}

uint64_t sub_5B0C(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_5CA8(a1);
  return v2;
}

void sub_5B5C()
{
  if (!qword_C738)
  {
    sub_6A80();
    unint64_t v0 = sub_6B40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C738);
    }
  }
}

uint64_t sub_5BB4()
{
  return type metadata accessor for SirikitApp.Builder(0);
}

uint64_t type metadata accessor for SirikitApp.Builder(uint64_t a1)
{
  return sub_5BDC(a1, qword_C838);
}

uint64_t sub_5BDC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_5C10()
{
  sub_5B5C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_5CA8(void *a1)
{
  uint64_t v3 = v1;
  sub_4530(&qword_C928);
  __chkstk_darwin();
  sub_65FC();
  uint64_t v7 = v6 - v5;
  sub_4530(&qword_C930);
  sub_65CC();
  __chkstk_darwin();
  sub_65FC();
  *(void *)(v1 + 16) = 0;
  sub_4574(a1, a1[3]);
  sub_61E4();
  sub_6BD0();
  if (v2)
  {

    type metadata accessor for SirikitApp(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_6A80();
    sub_613C(&qword_C940, (void (*)(uint64_t))&type metadata accessor for SpeakableString);
    sub_6B60();
    sub_6230(v7, v1 + OBJC_IVAR____TtC23SafetySessionFlowPlugin10SirikitApp_name);
    char v9 = sub_6B70();
    uint64_t v10 = sub_660C();
    v11(v10);
    *(unsigned char *)(v3 + OBJC_IVAR____TtC23SafetySessionFlowPlugin10SirikitApp_isDesignedByApple) = v9 & 1;
  }
  sub_3A24((uint64_t)a1);
  return v3;
}

uint64_t sub_5F30()
{
  return sub_54CC();
}

void *sub_5F48()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 16);
  id v3 = v2;
  return v2;
}

void sub_5F90(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = a1;
}

uint64_t (*sub_5FDC())()
{
  return j__swift_endAccess;
}

uint64_t sub_6038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_54F4(a1, a2, a3);
}

uint64_t sub_605C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_5B0C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_6088(void *a1)
{
  return sub_5980(a1);
}

uint64_t sub_60AC()
{
  return sub_613C(&qword_C918, (void (*)(uint64_t))type metadata accessor for SirikitApp);
}

uint64_t sub_60F4()
{
  return sub_613C(&qword_C920, (void (*)(uint64_t))type metadata accessor for SirikitApp);
}

uint64_t sub_613C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_6184(uint64_t a1)
{
  uint64_t v2 = sub_4530(&qword_C928);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_61E4()
{
  unint64_t result = qword_C938;
  if (!qword_C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C938);
  }
  return result;
}

uint64_t sub_6230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4530(&qword_C928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_6298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4530(&qword_C928);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unsigned char *initializeBufferWithCopyOfBuffer for SirikitApp.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SirikitApp.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SirikitApp.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x648CLL);
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

uint64_t sub_64B4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_64C0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SirikitApp.CodingKeys()
{
  return &type metadata for SirikitApp.CodingKeys;
}

unint64_t sub_64E0()
{
  unint64_t result = qword_C958;
  if (!qword_C958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C958);
  }
  return result;
}

unint64_t sub_6530()
{
  unint64_t result = qword_C960;
  if (!qword_C960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C960);
  }
  return result;
}

unint64_t sub_6580()
{
  unint64_t result = qword_C968;
  if (!qword_C968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C968);
  }
  return result;
}

uint64_t sub_660C()
{
  return v0;
}

uint64_t type metadata accessor for SafetySessionCATsSimple()
{
  uint64_t result = qword_C970;
  if (!qword_C970) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_666C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_66AC(uint64_t a1, uint64_t a2)
{
  return sub_6700(a1, a2);
}

uint64_t sub_6700(uint64_t a1, uint64_t a2)
{
  sub_6AE0();
  sub_6940();
  uint64_t v6 = v5;
  __chkstk_darwin();
  sub_65FC();
  uint64_t v9 = v8 - v7;
  sub_4530(&qword_C6F8);
  __chkstk_darwin();
  sub_65FC();
  sub_5234(a1, v11 - v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v9, a2, v2);
  uint64_t v12 = sub_6A90();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_529C(a1);
  return v12;
}

uint64_t sub_682C(uint64_t a1, uint64_t a2)
{
  sub_6AE0();
  sub_6940();
  uint64_t v5 = v4;
  __chkstk_darwin();
  sub_65FC();
  uint64_t v8 = v7 - v6;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, a2, v2);
  uint64_t v9 = sub_6AA0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v9;
}

uint64_t sub_6908()
{
  uint64_t v0 = sub_6AB0();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_6938()
{
  return type metadata accessor for SafetySessionCATsSimple();
}

uint64_t sub_6960()
{
  return SimpleOutputFlowAsync.init(outputPublisher:outputGenerator:)();
}

uint64_t sub_6970()
{
  return type metadata accessor for SimpleOutputFlowAsync();
}

uint64_t sub_6980()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_6990()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_69A0()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_69B0()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_69C0()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_69D0(Swift::String refId)
{
}

void sub_69E0()
{
}

uint64_t sub_69F0()
{
  return static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_6A00()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_6A10()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_6A20()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_6A30()
{
  return static Device.current.getter();
}

uint64_t sub_6A40()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_6A50()
{
  return CATWrapper.init(templateDir:options:globals:)();
}

uint64_t sub_6A60()
{
  return CATWrapper.__allocating_init(options:globals:)();
}

uint64_t sub_6A70()
{
  return CATWrapper.deinit();
}

uint64_t sub_6A80()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_6A90()
{
  return CATWrapperSimple.init(templateDir:options:globals:)();
}

uint64_t sub_6AA0()
{
  return CATWrapperSimple.init(useResponseMode:options:)();
}

uint64_t sub_6AB0()
{
  return CATWrapperSimple.deinit();
}

uint64_t sub_6AC0()
{
  return CATType.toDictionary.getter();
}

uint64_t sub_6AD0()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_6AE0()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_6AF0()
{
  return Logger.logObject.getter();
}

uint64_t sub_6B00()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_6B10()
{
  return type metadata accessor for Logger();
}

uint64_t sub_6B20()
{
  return String.hash(into:)();
}

uint64_t sub_6B30()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6B40()
{
  return type metadata accessor for Optional();
}

Swift::Int sub_6B50(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_6B60()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_6B70()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_6B80()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_6B90()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_6BA0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_6BB0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_6BC0()
{
  return Hasher._finalize()();
}

uint64_t sub_6BD0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_6BE0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t self
{
  return _self;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}