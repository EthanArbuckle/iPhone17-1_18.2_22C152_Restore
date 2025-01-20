uint64_t ContextRetrieval.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  ContextRetrieval.init()();
  return v0;
}

void *ContextRetrieval.init()()
{
  type metadata accessor for ContextClient();
  uint64_t v1 = swift_allocObject();
  v0[2] = sub_252DC094C(v1, v2);
  sub_252DC2BE0();
  swift_allocObject();
  v0[3] = sub_252DC2BD0();
  sub_252DC2C10();
  swift_allocObject();
  v0[4] = sub_252DC2C00();
  return v0;
}

uint64_t ContextRetrieval.refresh(contextTypes:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_252D88728((uint64_t)sub_252D8788C);
}

uint64_t sub_252D8788C()
{
  uint64_t v2 = v1[3];
  if (v2)
  {
    v1[2] = v2;
    uint64_t v3 = sub_252D8823C(&qword_269CA90A0);
    sub_252D88280();
    uint64_t v4 = sub_252D88734();
    if (!v3)
    {
      sub_252D8836C(v4, v5);
      sub_252DC09F4();
      sub_252D8881C();
      sub_252D8881C();
LABEL_4:
      v6 = (uint64_t (*)(void))v1[1];
      goto LABEL_7;
    }
  }
  else
  {
    sub_252D887BC();
    if (!v0) {
      goto LABEL_4;
    }
  }
  sub_252D88754();
LABEL_7:
  return v6();
}

uint64_t ContextRetrieval.refresh(contextTypes:interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return sub_252D88728((uint64_t)sub_252D87988);
}

uint64_t sub_252D87988()
{
  uint64_t v2 = v1[3];
  if (v2)
  {
    v1[2] = v2;
    uint64_t v3 = sub_252D8823C(&qword_269CA90A0);
    sub_252D88280();
    uint64_t v4 = sub_252D88734();
    if (!v3)
    {
      sub_252D8836C(v4, v5);
      sub_252DC09F4();
      sub_252D8881C();
      sub_252D8881C();
LABEL_4:
      v6 = (uint64_t (*)(void))v1[1];
      goto LABEL_7;
    }
  }
  else
  {
    sub_252D887BC();
    if (!v0) {
      goto LABEL_4;
    }
  }
  sub_252D88754();
LABEL_7:
  return v6();
}

uint64_t ContextRetrieval.refreshAndRetrieve(contextTypes:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_252D88728((uint64_t)sub_252D87A90);
}

uint64_t sub_252D87A90()
{
  uint64_t v1 = v0[3];
  if (!v1)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0xF000000000000000;
LABEL_5:
    sub_252DC0D24();
    uint64_t v8 = v7;
    unint64_t v10 = v9;
    sub_252D8823C(&qword_269CA90C8);
    sub_252D88430();
    sub_252DC2BC0();
    sub_252D883C4(v8, v10);
    sub_252D8841C(v5, v6);
    uint64_t v13 = v0[2];
    v14 = (uint64_t (*)(uint64_t))v0[1];
    return v14(v13);
  }
  v0[2] = v1;
  uint64_t v2 = sub_252D8823C(&qword_269CA90A0);
  sub_252D88280();
  uint64_t v3 = sub_252D88734();
  if (!v2)
  {
    uint64_t v5 = v3;
    unint64_t v6 = v4;
    goto LABEL_5;
  }
  sub_252D88754();
  return v11();
}

uint64_t ContextRetrieval.retrieveContextValues(contextTypes:timeoutInSecs:)(uint64_t a1, uint64_t a2, char a3)
{
  sub_252D8823C(&qword_269CA90A0);
  sub_252D88280();
  uint64_t result = sub_252D887FC();
  if (!v3)
  {
    if (a3) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = (void *)sub_252DC3120();
    }
    sub_252DC1130();
    uint64_t v8 = v7;
    unint64_t v10 = v9;

    sub_252D8823C(&qword_269CA90C8);
    sub_252D88430();
    sub_252D88764();
    sub_252D883C4(v8, v10);
    sub_252D887E4();
    return a1;
  }
  return result;
}

void ContextRetrieval.retrieveAndRankIntelligenceCommandContextValues(query:appBundleIds:threshold:timeoutInSecs:)()
{
  uint64_t v1 = (void *)sub_252DC3120();
  uint64_t v2 = (void *)sub_252DC3120();
  sub_252DC1374();
  uint64_t v4 = v3;
  unint64_t v6 = v5;

  if (!v0)
  {
    sub_252D8823C(&qword_269CA90C8);
    sub_252D88430();
    sub_252DC2BC0();
    sub_252D883C4(v4, v6);
  }
}

uint64_t ContextRetrieval.retrieveContextValues(query:timeoutInSecs:)()
{
  return MEMORY[0x263F8EE78];
}

void ContextRetrieval.retrieveContextValues(query:)()
{
  sub_252DC0EE8();
  if (!v0)
  {
    uint64_t v3 = v1;
    unint64_t v4 = v2;
    sub_252D8823C(&qword_269CA90C8);
    sub_252D88430();
    sub_252D88790();
    sub_252D883C4(v3, v4);
  }
}

uint64_t ContextRetrieval.retrieveRequiredContextValues()()
{
  uint64_t result = sub_252DC1604();
  if (!v0)
  {
    uint64_t v3 = result;
    unint64_t v4 = v2;
    sub_252D8823C(&qword_269CA90C8);
    sub_252D88430();
    sub_252D88790();
    sub_252D883C4(v3, v4);
    return v5;
  }
  return result;
}

uint64_t ContextRetrieval.retrieveAndRankContextValues(query:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return sub_252D88728((uint64_t)sub_252D87F4C);
}

uint64_t sub_252D87F4C()
{
  ContextRetrieval.retrieveContextValues(query:)();
  uint64_t v1 = sub_252DC3110();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

IntelligenceFlowContext::UIContextCacheRepresentation __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContextRetrieval.dumpUIContextFromCache()()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_252DC16D8();
  if (!v1)
  {
    uint64_t v7 = v3;
    unint64_t v8 = (unint64_t)v4;
    sub_252D8851C();
    sub_252DC2BC0();
    uint64_t v3 = sub_252D883C4(v7, v8);
    *uint64_t v2 = v9;
    v2[1] = v10;
  }
  result.commands._rawValue = v6;
  result.elements._rawValue = v5;
  result.hierarchy.value._object = v4;
  result.hierarchy.value._countAndFlagsBits = v3;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ContextRetrieval.prewarm()()
{
}

uint64_t ContextRetrieval.retrieveContextValues(contextTypes:)(uint64_t a1)
{
  sub_252D8823C(&qword_269CA90A0);
  sub_252D88280();
  uint64_t result = sub_252D887FC();
  if (!v1)
  {
    sub_252D8836C(result, v3);
    sub_252DC0D24();
    uint64_t v5 = v4;
    unint64_t v7 = v6;
    sub_252D887E4();
    sub_252D8823C(&qword_269CA90C8);
    sub_252D88430();
    sub_252D88764();
    sub_252D887E4();
    sub_252D883C4(v5, v7);
    return a1;
  }
  return result;
}

uint64_t ContextRetrieval.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t ContextRetrieval.__deallocating_deinit()
{
  ContextRetrieval.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t default argument 1 of UIContextCacheRepresentation.init(hierarchy:elements:commands:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t default argument 2 of UIContextCacheRepresentation.init(hierarchy:elements:commands:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_252D8823C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_252D88280()
{
  unint64_t result = qword_269CA90A8;
  if (!qword_269CA90A8)
  {
    sub_252D88324(&qword_269CA90A0);
    sub_252D884D4(&qword_269CA90B0, MEMORY[0x263F4E2E8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA90A8);
  }
  return result;
}

uint64_t sub_252D88324(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_252D8836C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_252D883C4(uint64_t a1, unint64_t a2)
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

uint64_t sub_252D8841C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_252D883C4(a1, a2);
  }
  return a1;
}

unint64_t sub_252D88430()
{
  unint64_t result = qword_269CA90D0;
  if (!qword_269CA90D0)
  {
    sub_252D88324(&qword_269CA90C8);
    sub_252D884D4(&qword_269CA90D8, MEMORY[0x263F4E500]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA90D0);
  }
  return result;
}

uint64_t sub_252D884D4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_252D8851C()
{
  unint64_t result = qword_269CA90E8;
  if (!qword_269CA90E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA90E8);
  }
  return result;
}

uint64_t type metadata accessor for ContextRetrieval()
{
  return self;
}

uint64_t method lookup function for ContextRetrieval(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ContextRetrieval);
}

uint64_t dispatch thunk of ContextRetrieval.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t initializeBufferWithCopyOfBuffer for DetectedPerson(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithTake for UIContextCacheRepresentation(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_252D885FC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_252D8861C(uint64_t result, int a2, int a3)
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

__n128 initializeWithTake for DetectedPhoneNumber(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_252D88668(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_252D88688(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_252D886D8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_252D88728(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t sub_252D88734()
{
  return sub_252DC2BF0();
}

uint64_t sub_252D88754()
{
  return v0 + 8;
}

uint64_t sub_252D88764()
{
  return sub_252DC2BC0();
}

uint64_t sub_252D88790()
{
  return sub_252DC2BC0();
}

void sub_252D887BC()
{
  sub_252DC09F4();
}

uint64_t sub_252D887E4()
{
  return sub_252D883C4(v1, v0);
}

uint64_t sub_252D887FC()
{
  return sub_252DC2BF0();
}

uint64_t sub_252D8881C()
{
  return sub_252D883C4(v0, v1);
}

uint64_t UIContextCacheRepresentation.hierarchy.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UIContextCacheRepresentation.hierarchy.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UIContextCacheRepresentation.hierarchy.modify())()
{
  return nullsub_1;
}

uint64_t UIContextCacheRepresentation.elements.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UIContextCacheRepresentation.elements.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*UIContextCacheRepresentation.elements.modify())()
{
  return nullsub_1;
}

uint64_t UIContextCacheRepresentation.commands.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UIContextCacheRepresentation.commands.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*UIContextCacheRepresentation.commands.modify())()
{
  return nullsub_1;
}

IntelligenceFlowContext::UIContextCacheRepresentation __swiftcall UIContextCacheRepresentation.init(hierarchy:elements:commands:)(Swift::String_optional hierarchy, Swift::OpaquePointer elements, Swift::OpaquePointer commands)
{
  *(Swift::String_optional *)uint64_t v3 = hierarchy;
  *(Swift::OpaquePointer *)(v3 + 16) = elements;
  *(Swift::OpaquePointer *)(v3 + 24) = commands;
  result.hierarchy = hierarchy;
  result.commands = commands;
  result.elements = elements;
  return result;
}

BOOL sub_252D88974(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_252D88984()
{
  return sub_252DC3390();
}

uint64_t sub_252D889AC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6863726172656968 && a2 == 0xE900000000000079;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x73746E656D656C65 && a2 == 0xE800000000000000;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x73646E616D6D6F63 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_252DC3360();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_252D88B10()
{
  return 3;
}

uint64_t sub_252D88B18()
{
  return sub_252DC33C0();
}

uint64_t sub_252D88B60()
{
  return 0;
}

uint64_t sub_252D88B6C(char a1)
{
  if (!a1) {
    return 0x6863726172656968;
  }
  if (a1 == 1) {
    return 0x73746E656D656C65;
  }
  return 0x73646E616D6D6F63;
}

BOOL sub_252D88BC8(char *a1, char *a2)
{
  return sub_252D88974(*a1, *a2);
}

uint64_t sub_252D88BD4()
{
  return sub_252D88B18();
}

uint64_t sub_252D88BDC()
{
  return sub_252D88984();
}

uint64_t sub_252D88BE4()
{
  return sub_252DC33C0();
}

uint64_t sub_252D88C28()
{
  return sub_252D88B6C(*v0);
}

uint64_t sub_252D88C30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D889AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D88C58()
{
  return sub_252D88B60();
}

uint64_t sub_252D88C78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D88B10();
  *a1 = result;
  return result;
}

uint64_t sub_252D88CA0(uint64_t a1)
{
  unint64_t v2 = sub_252D88F50();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D88CDC(uint64_t a1)
{
  unint64_t v2 = sub_252D88F50();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UIContextCacheRepresentation.encode(to:)(void *a1)
{
  uint64_t v3 = sub_252D8823C(&qword_269CA9108);
  sub_252D89934();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v12 = *(void *)(v1 + 24);
  uint64_t v13 = v8;
  sub_252D88F0C(a1, a1[3]);
  sub_252D88F50();
  sub_252DC33E0();
  LOBYTE(v16) = 0;
  uint64_t v9 = v14;
  sub_252DC32E0();
  if (!v9)
  {
    uint64_t v10 = v12;
    uint64_t v16 = v13;
    char v15 = 1;
    sub_252D8823C(&qword_26B23BD30);
    sub_252D893B8(&qword_269CA9118, &qword_26B23BD30, (void (*)(void))sub_252D88F9C);
    sub_252D89950();
    uint64_t v16 = v10;
    char v15 = 2;
    sub_252D8823C(&qword_269CA9128);
    sub_252D893B8(&qword_269CA9130, &qword_269CA9128, (void (*)(void))sub_252D88FE8);
    sub_252D89950();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v3);
}

void *sub_252D88F0C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_252D88F50()
{
  unint64_t result = qword_269CA9110;
  if (!qword_269CA9110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9110);
  }
  return result;
}

unint64_t sub_252D88F9C()
{
  unint64_t result = qword_269CA9120;
  if (!qword_269CA9120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9120);
  }
  return result;
}

unint64_t sub_252D88FE8()
{
  unint64_t result = qword_269CA9138;
  if (!qword_269CA9138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9138);
  }
  return result;
}

uint64_t UIContextCacheRepresentation.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_252D8823C(&qword_269CA9140);
  sub_252D89934();
  MEMORY[0x270FA5388]();
  sub_252D88F0C(a1, a1[3]);
  sub_252D88F50();
  sub_252DC33D0();
  if (v2)
  {
    sub_252D8931C((uint64_t)a1);
  }
  else
  {
    LOBYTE(v12) = 0;
    uint64_t v5 = sub_252DC3250();
    uint64_t v8 = v7;
    uint64_t v11 = v5;
    sub_252D8823C(&qword_26B23BD30);
    sub_252D893B8(&qword_26B23BD50, &qword_26B23BD30, (void (*)(void))sub_252D8936C);
    swift_bridgeObjectRetain();
    sub_252DC32B0();
    sub_252D8823C(&qword_269CA9128);
    sub_252D893B8(&qword_269CA9148, &qword_269CA9128, (void (*)(void))sub_252D89424);
    swift_bridgeObjectRetain();
    sub_252DC32B0();
    uint64_t v9 = sub_252D8997C();
    v10(v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v11;
    a2[1] = v8;
    a2[2] = v12;
    a2[3] = v12;
    sub_252D8931C((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_252D8931C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_252D8936C()
{
  unint64_t result = qword_26B23BD38;
  if (!qword_26B23BD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23BD38);
  }
  return result;
}

uint64_t sub_252D893B8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_252D89424()
{
  unint64_t result = qword_269CA9150;
  if (!qword_269CA9150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9150);
  }
  return result;
}

uint64_t sub_252D89470@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return UIContextCacheRepresentation.init(from:)(a1, a2);
}

uint64_t sub_252D89488(void *a1)
{
  return UIContextCacheRepresentation.encode(to:)(a1);
}

uint64_t destroy for UIContextCacheRepresentation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for UIContextCacheRepresentation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UIContextCacheRepresentation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UIContextCacheRepresentation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UIContextCacheRepresentation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for UIContextCacheRepresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIContextCacheRepresentation()
{
  return &type metadata for UIContextCacheRepresentation;
}

unsigned char *initializeBufferWithCopyOfBuffer for UIContextCacheRepresentation.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UIContextCacheRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for UIContextCacheRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D897FCLL);
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

uint64_t sub_252D89824(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_252D8982C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UIContextCacheRepresentation.CodingKeys()
{
  return &type metadata for UIContextCacheRepresentation.CodingKeys;
}

unint64_t sub_252D89848()
{
  unint64_t result = qword_269CA9158;
  if (!qword_269CA9158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9158);
  }
  return result;
}

unint64_t sub_252D89898()
{
  unint64_t result = qword_269CA9160;
  if (!qword_269CA9160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9160);
  }
  return result;
}

unint64_t sub_252D898E8()
{
  unint64_t result = qword_269CA9168;
  if (!qword_269CA9168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9168);
  }
  return result;
}

uint64_t sub_252D89950()
{
  return sub_252DC3340();
}

uint64_t sub_252D8997C()
{
  return v0;
}

uint64_t OnScreenContent.content.getter()
{
  return sub_252D89AF0();
}

uint64_t type metadata accessor for OnScreenContent.Content(uint64_t a1)
{
  return sub_252D8FDC8(a1, (uint64_t *)&unk_269CA9390);
}

uint64_t OnScreenContent.content.setter()
{
  return sub_252D89BEC();
}

uint64_t (*OnScreenContent.content.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.uiMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D89A78(type metadata accessor for OnScreenContent, (uint64_t)type metadata accessor for OnScreenContent.UIMetadata, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_252D89AF0, a1);
}

uint64_t sub_252D89A78@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1(0);
  return a3(v4 + *(int *)(v8 + 20), a4, a2);
}

uint64_t type metadata accessor for OnScreenContent(uint64_t a1)
{
  return sub_252D8FDC8(a1, (uint64_t *)&unk_269CA9380);
}

uint64_t sub_252D89AF0()
{
  uint64_t v1 = sub_252D980B4();
  v2(v1);
  sub_252D97EE8();
  uint64_t v3 = sub_252D98338();
  v4(v3);
  return v0;
}

uint64_t type metadata accessor for OnScreenContent.UIMetadata(uint64_t a1)
{
  return sub_252D8FDC8(a1, (uint64_t *)&unk_269CA93D0);
}

uint64_t OnScreenContent.uiMetadata.setter(uint64_t a1)
{
  return sub_252D89B9C(a1, (void (*)(void))type metadata accessor for OnScreenContent, (uint64_t)type metadata accessor for OnScreenContent.UIMetadata, (uint64_t (*)(uint64_t))sub_252D89BEC);
}

uint64_t sub_252D89B9C(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t (*a4)(uint64_t))
{
  return a4(a1);
}

uint64_t sub_252D89BEC()
{
  uint64_t v1 = sub_252D980B4();
  v2(v1);
  sub_252D97EE8();
  uint64_t v3 = sub_252D98324();
  v4(v3);
  return v0;
}

uint64_t (*OnScreenContent.uiMetadata.modify())()
{
  uint64_t v0 = sub_252D9830C();
  type metadata accessor for OnScreenContent(v0);
  sub_252D98194();
  return nullsub_1;
}

BOOL sub_252D89C78(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_252D89C88()
{
  return sub_252DC3390();
}

uint64_t sub_252D89CB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E656D75636F64 && a2 == 0xE800000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6567616D69 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252D89D98()
{
  return 2;
}

uint64_t sub_252D89DA0(char a1)
{
  if (a1) {
    return 0x6567616D69;
  }
  else {
    return 0x746E656D75636F64;
  }
}

uint64_t sub_252D89DD4()
{
  return 1;
}

uint64_t sub_252D89DDC()
{
  return sub_252DC3390();
}

uint64_t sub_252D89E04(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252D89E74()
{
  return sub_252DC33C0();
}

uint64_t sub_252D89EB0()
{
  return 12383;
}

BOOL sub_252D89EBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_252D89C78(*a1, *a2);
}

uint64_t sub_252D89EC8()
{
  return sub_252D8F550();
}

uint64_t sub_252D89EE4()
{
  return sub_252D89C88();
}

uint64_t sub_252D89EF0()
{
  return sub_252D89DA0(*v0);
}

uint64_t sub_252D89EF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D89CB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D89F20@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D89D98();
  *a1 = result;
  return result;
}

uint64_t sub_252D89F48(uint64_t a1)
{
  unint64_t v2 = sub_252D8A594();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D89F84(uint64_t a1)
{
  unint64_t v2 = sub_252D8A594();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D89FC4()
{
  return sub_252D89E74();
}

uint64_t sub_252D89FE8(uint64_t a1)
{
  unint64_t v2 = sub_252D8A684();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D8A024(uint64_t a1)
{
  unint64_t v2 = sub_252D8A684();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D8A060()
{
  return sub_252DC33C0();
}

uint64_t sub_252D8A0A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D89E04(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252D8A0CC()
{
  return sub_252D88B60();
}

uint64_t sub_252D8A0E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D89DD4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_252D8A114(uint64_t a1)
{
  unint64_t v2 = sub_252D8A5E0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D8A150(uint64_t a1)
{
  unint64_t v2 = sub_252D8A5E0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void OnScreenContent.Content.encode(to:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  sub_252D8823C(&qword_269CA9170);
  sub_252D89934();
  MEMORY[0x270FA5388](v3);
  sub_252D97FC4(v4, v14);
  type metadata accessor for OnScreenContent.Image(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v5);
  sub_252D97F28();
  sub_252D8823C(&qword_269CA9178);
  sub_252D89934();
  MEMORY[0x270FA5388](v6);
  sub_252D98020();
  type metadata accessor for OnScreenContent.Document(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v7);
  sub_252D9816C();
  sub_252D97EE8();
  MEMORY[0x270FA5388](v8);
  sub_252D97EF8();
  sub_252D8823C(&qword_269CA9180);
  sub_252D89934();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_252D981A0();
  uint64_t v12 = v2[4];
  sub_252D88F0C(v2, v2[3]);
  sub_252D8A594();
  sub_252D983EC();
  sub_252DC33E0();
  sub_252D89AF0();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_252D8A62C();
    sub_252D8A5E0();
    sub_252D98378();
    sub_252D8A6D0(&qword_269CA9198, (void (*)(uint64_t))type metadata accessor for OnScreenContent.Image);
  }
  else
  {
    sub_252D8A62C();
    sub_252D8A684();
    sub_252D98378();
    sub_252D8A6D0(&qword_269CA91A8, (void (*)(uint64_t))type metadata accessor for OnScreenContent.Document);
  }
  sub_252DC3340();
  sub_252D980DC();
  v13();
  sub_252D8A718();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0, v12);
  sub_252D97FF8();
}

uint64_t type metadata accessor for OnScreenContent.Image(uint64_t a1)
{
  return sub_252D8FDC8(a1, (uint64_t *)&unk_269CA93B8);
}

uint64_t type metadata accessor for OnScreenContent.Document(uint64_t a1)
{
  return sub_252D8FDC8(a1, (uint64_t *)&unk_269CA93A0);
}

unint64_t sub_252D8A594()
{
  unint64_t result = qword_269CA9188;
  if (!qword_269CA9188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9188);
  }
  return result;
}

unint64_t sub_252D8A5E0()
{
  unint64_t result = qword_269CA9190;
  if (!qword_269CA9190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9190);
  }
  return result;
}

uint64_t sub_252D8A62C()
{
  uint64_t v2 = sub_252D980B4();
  v3(v2);
  sub_252D97EE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

unint64_t sub_252D8A684()
{
  unint64_t result = qword_269CA91A0;
  if (!qword_269CA91A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA91A0);
  }
  return result;
}

uint64_t sub_252D8A6D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252D8A718()
{
  uint64_t v1 = sub_252D9830C();
  v2(v1);
  sub_252D97EE8();
  sub_252D980DC();
  v3();
  return v0;
}

void OnScreenContent.Content.init(from:)()
{
  sub_252D97FE0();
  v51 = v0;
  uint64_t v2 = v1;
  uint64_t v42 = v3;
  sub_252D8823C(&qword_269CA91B0);
  sub_252D89934();
  uint64_t v45 = v4;
  uint64_t v46 = v5;
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_252D97F28();
  uint64_t v48 = v6;
  sub_252D8823C(&qword_269CA91B8);
  sub_252D89934();
  uint64_t v43 = v8;
  uint64_t v44 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_252D97F28();
  uint64_t v47 = v9;
  sub_252D8823C(&qword_269CA91C0);
  sub_252D89934();
  uint64_t v49 = v11;
  uint64_t v50 = v10;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = sub_252D98134();
  uint64_t v13 = type metadata accessor for OnScreenContent.Content(v12);
  sub_252D97EE8();
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_252D98010();
  uint64_t v16 = v14 - v15;
  uint64_t v17 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v19 = (char *)v40 - v18;
  MEMORY[0x270FA5388](v17);
  v21 = (char *)v40 - v20;
  sub_252D88F0C(v2, v2[3]);
  sub_252D8A594();
  v22 = v51;
  sub_252DC33D0();
  if (v22) {
    goto LABEL_8;
  }
  v40[1] = v16;
  v40[2] = v19;
  v40[0] = v21;
  uint64_t v41 = v13;
  v51 = v2;
  uint64_t v23 = sub_252DC32C0();
  uint64_t v24 = *(void *)(v23 + 16);
  if (!v24
    || (char v25 = *(unsigned char *)(v23 + 32),
        sub_252D97BB8(1, v24, v23, v23 + 32, 0, (2 * v24) | 1),
        uint64_t v27 = v26,
        unint64_t v29 = v28,
        swift_bridgeObjectRelease(),
        v27 != v29 >> 1))
  {
    uint64_t v30 = v41;
    uint64_t v31 = sub_252DC31E0();
    swift_allocError();
    v33 = v32;
    sub_252D8823C(&qword_269CA91C8);
    uint64_t *v33 = v30;
    sub_252DC3240();
    sub_252DC31D0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v33, *MEMORY[0x263F8DCB0], v31);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v34 = sub_252D9809C();
    v35(v34);
    uint64_t v2 = v51;
LABEL_8:
    uint64_t v36 = (uint64_t)v2;
    goto LABEL_9;
  }
  if (v25)
  {
    sub_252D8A5E0();
    sub_252D983CC();
    type metadata accessor for OnScreenContent.Image(0);
    sub_252D8A6D0(&qword_269CA91D0, (void (*)(uint64_t))type metadata accessor for OnScreenContent.Image);
    sub_252DC32B0();
    sub_252D98398();
  }
  else
  {
    sub_252D8A684();
    sub_252D983CC();
    type metadata accessor for OnScreenContent.Document(0);
    sub_252D8A6D0(&qword_269CA91D8, (void (*)(uint64_t))type metadata accessor for OnScreenContent.Document);
    sub_252DC32B0();
    sub_252D982F8();
  }
  sub_252D980DC();
  v37();
  swift_unknownObjectRelease();
  uint64_t v38 = sub_252D9809C();
  v39(v38);
  swift_storeEnumTagMultiPayload();
  sub_252D8A62C();
  sub_252D8A62C();
  uint64_t v36 = (uint64_t)v51;
LABEL_9:
  sub_252D8931C(v36);
  sub_252D97FF8();
}

void sub_252D8ACB8()
{
}

void sub_252D8ACD0()
{
}

uint64_t OnScreenContent.Document.file.getter()
{
  return swift_retain();
}

uint64_t OnScreenContent.Document.file.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*OnScreenContent.Document.file.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.Document.paginationInfo.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D89A78(type metadata accessor for OnScreenContent.Document, (uint64_t)&unk_269CA91E0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_252D8FE64, a1);
}

uint64_t OnScreenContent.Document.paginationInfo.setter(uint64_t a1)
{
  return sub_252D89B9C(a1, (void (*)(void))type metadata accessor for OnScreenContent.Document, (uint64_t)&unk_269CA91E0, (uint64_t (*)(uint64_t))sub_252D8FEB4);
}

uint64_t (*OnScreenContent.Document.paginationInfo.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.Document.entity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D8BC38(type metadata accessor for OnScreenContent.Document, a1);
}

uint64_t OnScreenContent.Document.entity.setter()
{
  return sub_252D8BC98();
}

uint64_t (*OnScreenContent.Document.entity.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.Document.isWindowContentGeneratedPDF.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for OnScreenContent.Document(0) + 28));
}

uint64_t OnScreenContent.Document.isWindowContentGeneratedPDF.setter(char a1)
{
  uint64_t result = type metadata accessor for OnScreenContent.Document(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*OnScreenContent.Document.isWindowContentGeneratedPDF.modify())()
{
  return nullsub_1;
}

void OnScreenContent.Document.init(file:paginationInfo:entity:)()
{
  sub_252D9806C();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v22 = v7;
  uint64_t v8 = type metadata accessor for OnScreenContent.Document(0);
  uint64_t v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  sub_252D981B8();
  uint64_t v10 = sub_252D8823C(&qword_269CA91E8);
  uint64_t v11 = sub_252D97F80(v10);
  MEMORY[0x270FA5388](v11);
  sub_252D981D0();
  uint64_t v12 = sub_252D8823C(&qword_269CA91E0);
  uint64_t v13 = sub_252D97F80(v12);
  MEMORY[0x270FA5388](v13);
  sub_252D97EF8();
  sub_252D8FE64(v6, v2, &qword_269CA91E0);
  sub_252D8FE64(v4, v1, &qword_269CA91E8);
  uint64_t v14 = (uint64_t)v0 + v9[7];
  uint64_t v15 = sub_252DC2D80();
  sub_252D980C4(v14, v16, v17, v15);
  uint64_t v18 = (uint64_t)v0 + v9[8];
  uint64_t v19 = sub_252DC2FA0();
  sub_252D980C4(v18, v20, v21, v19);
  void *v0 = v22;
  sub_252D8FEB4(v2, v14, &qword_269CA91E0);
  sub_252D8FEB4(v1, v18, &qword_269CA91E8);
  *((unsigned char *)v0 + v9[9]) = 0;
  sub_252D8A62C();
  sub_252D8FF2C(v4, &qword_269CA91E8);
  sub_252D8FF2C(v6, &qword_269CA91E0);
  sub_252D98084();
}

uint64_t OnScreenContent.Document.init(file:paginationInfo:entity:isWindowContentGeneratedPDF:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, void *a5@<X8>)
{
  uint64_t v10 = (int *)type metadata accessor for OnScreenContent.Document(0);
  uint64_t v11 = (uint64_t)a5 + v10[5];
  uint64_t v12 = sub_252DC2D80();
  sub_252D980C4(v11, v13, v14, v12);
  uint64_t v15 = (uint64_t)a5 + v10[6];
  uint64_t v16 = sub_252DC2FA0();
  sub_252D980C4(v15, v17, v18, v16);
  *a5 = a1;
  sub_252D8FEB4(a2, v11, &qword_269CA91E0);
  uint64_t result = sub_252D8FEB4(a3, v15, &qword_269CA91E8);
  *((unsigned char *)a5 + v10[7]) = a4;
  return result;
}

uint64_t sub_252D8B160(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701603686 && a2 == 0xE400000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6974616E69676170 && a2 == 0xEE006F666E496E6FLL;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x797469746E65 && a2 == 0xE600000000000000;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000252DC3C10)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v8 = sub_252DC3360();
        swift_bridgeObjectRelease();
        if (v8) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_252D8B31C()
{
  return 4;
}

unint64_t sub_252D8B324(char a1)
{
  unint64_t result = 1701603686;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6974616E69676170;
      break;
    case 2:
      unint64_t result = 0x797469746E65;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_252D8B3BC()
{
  return sub_252D8B324(*v0);
}

uint64_t sub_252D8B3C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D8B160(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D8B3EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D8B31C();
  *a1 = result;
  return result;
}

uint64_t sub_252D8B414(uint64_t a1)
{
  unint64_t v2 = sub_252D8FD10();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D8B450(uint64_t a1)
{
  unint64_t v2 = sub_252D8FD10();

  return MEMORY[0x270FA00B8](a1, v2);
}

void OnScreenContent.Document.encode(to:)()
{
  sub_252D98108();
  sub_252D8823C(&qword_269CA91F0);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252D8FD10();
  sub_252D97F60();
  sub_252DC2D40();
  sub_252D8A6D0(&qword_269CA9200, MEMORY[0x263F818B0]);
  sub_252D9823C();
  if (!v0)
  {
    type metadata accessor for OnScreenContent.Document(0);
    sub_252DC2D80();
    sub_252D8A6D0(&qword_269CA9208, MEMORY[0x263F81A98]);
    sub_252D9823C();
    sub_252DC2FA0();
    sub_252D8A6D0(&qword_269CA9210, MEMORY[0x263F80388]);
    sub_252D9823C();
    sub_252DC3320();
  }
  uint64_t v2 = sub_252D97F10();
  v3(v2);
  sub_252D98318();
}

void OnScreenContent.Document.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_252D97FE0();
  uint64_t v14 = v13;
  uint64_t v15 = sub_252D8823C(&qword_269CA91E8);
  uint64_t v16 = sub_252D97F80(v15);
  MEMORY[0x270FA5388](v16);
  sub_252D97F28();
  uint64_t v40 = v17;
  uint64_t v18 = sub_252D8823C(&qword_269CA91E0);
  uint64_t v19 = sub_252D97F80(v18);
  MEMORY[0x270FA5388](v19);
  sub_252D97FC4(v20, v39);
  uint64_t v43 = sub_252D8823C(&qword_269CA9218);
  sub_252D89934();
  uint64_t v41 = v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v23 = sub_252D97F8C();
  uint64_t v24 = type metadata accessor for OnScreenContent.Document(v23);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v25);
  sub_252D97EF8();
  *uint64_t v12 = 0;
  uint64_t v27 = (uint64_t)v12 + *(int *)(v26 + 20);
  sub_252DC2D80();
  sub_252D98128();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v28, v29, v30, v31);
  v32 = (char *)v12 + *(int *)(v24 + 24);
  uint64_t v33 = sub_252DC2FA0();
  uint64_t v44 = (uint64_t)v32;
  sub_252D98128();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v34, v35, v36, v33);
  uint64_t v37 = (uint64_t)v14;
  sub_252D88F0C(v14, v14[3]);
  sub_252D8FD10();
  sub_252D983EC();
  sub_252DC33D0();
  if (v10)
  {
    sub_252D8931C((uint64_t)v14);
    swift_release();
    sub_252D8FF2C(v27, &qword_269CA91E0);
    sub_252D8FF2C(v44, &qword_269CA91E8);
  }
  else
  {
    sub_252DC2D40();
    sub_252D8A6D0(&qword_269CA9220, MEMORY[0x263F818B0]);
    sub_252DC3270();
    *uint64_t v12 = a10;
    sub_252D8A6D0(&qword_269CA9228, MEMORY[0x263F81A98]);
    sub_252DC3270();
    sub_252D8FEB4(v42, v27, &qword_269CA91E0);
    sub_252D8A6D0(&qword_269CA9230, MEMORY[0x263F80388]);
    sub_252DC3270();
    sub_252D8FEB4(v40, v44, &qword_269CA91E8);
    char v38 = sub_252DC3290();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v11, v43);
    *((unsigned char *)v12 + *(int *)(v24 + 28)) = v38 & 1;
    sub_252D89AF0();
    sub_252D8931C(v37);
    sub_252D8A718();
  }
  sub_252D97FF8();
}

void sub_252D8BB08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OnScreenContent.Document.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_252D8BB20()
{
}

uint64_t OnScreenContent.Image.image.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D8FE64(v1, a1, &qword_269CA9238);
}

uint64_t OnScreenContent.Image.image.setter(uint64_t a1)
{
  return sub_252D8FEB4(a1, v1, &qword_269CA9238);
}

uint64_t (*OnScreenContent.Image.image.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.Image.isSnapshot.getter()
{
  uint64_t v0 = type metadata accessor for OnScreenContent.Image(0);
  return sub_252D983C0(v0);
}

uint64_t OnScreenContent.Image.isSnapshot.setter(char a1)
{
  return sub_252D8C60C(a1, type metadata accessor for OnScreenContent.Image);
}

uint64_t (*OnScreenContent.Image.isSnapshot.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.Image.entity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D8BC38(type metadata accessor for OnScreenContent.Image, a1);
}

uint64_t sub_252D8BC38@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  return sub_252D8FE64(v2 + *(int *)(v4 + 24), a2, &qword_269CA91E8);
}

uint64_t OnScreenContent.Image.entity.setter()
{
  return sub_252D8BC98();
}

uint64_t sub_252D8BC98()
{
  uint64_t v1 = sub_252D9830C();
  v2(v1);
  sub_252D982E0();
  return sub_252D8FEB4(v0, v3, &qword_269CA91E8);
}

uint64_t (*OnScreenContent.Image.entity.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.Image.init(image:isSnapshot:entity:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_252DC2D70();
  sub_252D980C4(a4, v9, v10, v8);
  uint64_t v11 = type metadata accessor for OnScreenContent.Image(0);
  uint64_t v12 = a4 + *(int *)(v11 + 24);
  uint64_t v13 = sub_252DC2FA0();
  sub_252D980C4(v12, v14, v15, v13);
  sub_252D8FEB4(a1, a4, &qword_269CA9238);
  *(unsigned char *)(a4 + *(int *)(v11 + 20)) = a2;
  return sub_252D8FEB4(a3, v12, &qword_269CA91E8);
}

uint64_t sub_252D8BDC0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6567616D69 && a2 == 0xE500000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x687370616E537369 && a2 == 0xEA0000000000746FLL;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x797469746E65 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_252DC3360();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_252D8BF0C(char a1)
{
  if (!a1) {
    return 0x6567616D69;
  }
  if (a1 == 1) {
    return 0x687370616E537369;
  }
  return 0x797469746E65;
}

uint64_t sub_252D8BF60()
{
  return sub_252D8BF0C(*v0);
}

uint64_t sub_252D8BF68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D8BDC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D8BF90(uint64_t a1)
{
  unint64_t v2 = sub_252D8FD5C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D8BFCC(uint64_t a1)
{
  unint64_t v2 = sub_252D8FD5C();

  return MEMORY[0x270FA00B8](a1, v2);
}

void OnScreenContent.Image.encode(to:)()
{
  sub_252D98108();
  sub_252D8823C(&qword_269CA9240);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252D8FD5C();
  sub_252D97F60();
  sub_252DC2D70();
  sub_252D8A6D0(&qword_269CA9250, MEMORY[0x263F81938]);
  sub_252D9823C();
  if (!v0)
  {
    type metadata accessor for OnScreenContent.Image(0);
    sub_252D98038();
    sub_252DC2FA0();
    sub_252D8A6D0(&qword_269CA9210, MEMORY[0x263F80388]);
    sub_252D9823C();
  }
  uint64_t v2 = sub_252D97F10();
  v3(v2);
  sub_252D98318();
}

void OnScreenContent.Image.init(from:)()
{
  sub_252D97FE0();
  uint64_t v37 = v0;
  uint64_t v3 = v2;
  v32[1] = v4;
  uint64_t v5 = sub_252D8823C(&qword_269CA91E8);
  uint64_t v6 = sub_252D97F80(v5);
  MEMORY[0x270FA5388](v6);
  sub_252D98150(v7, v32[0]);
  uint64_t v8 = sub_252D8823C(&qword_269CA9238);
  uint64_t v9 = sub_252D97F80(v8);
  MEMORY[0x270FA5388](v9);
  sub_252D97FA8(v10, v32[0]);
  uint64_t v36 = sub_252D8823C(&qword_269CA9258);
  sub_252D89934();
  uint64_t v33 = v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = sub_252D98134();
  uint64_t v14 = type metadata accessor for OnScreenContent.Image(v13);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252DC2D70();
  sub_252D98128();
  v32[2] = v18;
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v19, v20, v21, v18);
  uint64_t v22 = (uint64_t)&v17[*(int *)(v14 + 24)];
  uint64_t v23 = sub_252DC2FA0();
  sub_252D98128();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v24, v25, v26, v23);
  sub_252D88F0C(v3, v3[3]);
  sub_252D8FD5C();
  uint64_t v34 = v1;
  uint64_t v27 = v37;
  sub_252DC33D0();
  if (v27)
  {
    sub_252D8931C((uint64_t)v3);
    sub_252D8FF2C((uint64_t)v17, &qword_269CA9238);
    sub_252D8FF2C(v22, &qword_269CA91E8);
  }
  else
  {
    uint64_t v28 = v33;
    sub_252D8A6D0(&qword_269CA9260, MEMORY[0x263F81938]);
    uint64_t v29 = v34;
    sub_252DC3270();
    sub_252D8FEB4(v35, (uint64_t)v17, &qword_269CA9238);
    v17[*(int *)(v14 + 20)] = sub_252DC3290() & 1;
    sub_252D8A6D0(&qword_269CA9230, MEMORY[0x263F80388]);
    uint64_t v30 = v32[0];
    uint64_t v31 = v36;
    sub_252DC3270();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v31);
    sub_252D8FEB4(v30, v22, &qword_269CA91E8);
    sub_252D89AF0();
    sub_252D8931C((uint64_t)v3);
    sub_252D8A718();
  }
  sub_252D97FF8();
}

void sub_252D8C520()
{
}

void sub_252D8C538()
{
}

uint64_t OnScreenContent.UIMetadata.window.getter()
{
  return sub_252D89AF0();
}

uint64_t OnScreenContent.UIMetadata.window.setter()
{
  return sub_252D89BEC();
}

uint64_t (*OnScreenContent.UIMetadata.window.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.UIMetadata.isSelected.getter()
{
  uint64_t v0 = type metadata accessor for OnScreenContent.UIMetadata(0);
  return sub_252D983C0(v0);
}

uint64_t OnScreenContent.UIMetadata.isSelected.setter(char a1)
{
  return sub_252D8C60C(a1, type metadata accessor for OnScreenContent.UIMetadata);
}

uint64_t sub_252D8C60C(char a1, uint64_t (*a2)(void))
{
  uint64_t result = a2(0);
  *(unsigned char *)(v2 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*OnScreenContent.UIMetadata.isSelected.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.UIMetadata.nestedRemoteProcesses.getter()
{
  type metadata accessor for OnScreenContent.UIMetadata(0);

  return swift_bridgeObjectRetain();
}

uint64_t OnScreenContent.UIMetadata.nestedRemoteProcesses.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for OnScreenContent.UIMetadata(0) + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*OnScreenContent.UIMetadata.nestedRemoteProcesses.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.UIMetadata.Window.isActive.getter()
{
  return *v0;
}

uint64_t OnScreenContent.UIMetadata.Window.isActive.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*OnScreenContent.UIMetadata.Window.isActive.modify())()
{
  return nullsub_1;
}

__n128 OnScreenContent.UIMetadata.Window.boundingBox.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 40);
  __n128 result = *(__n128 *)(v1 + 8);
  long long v4 = *(_OWORD *)(v1 + 24);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

uint64_t OnScreenContent.UIMetadata.Window.boundingBox.setter(uint64_t a1)
{
  return sub_252D8FDFC(a1, v1 + 8);
}

uint64_t (*OnScreenContent.UIMetadata.Window.boundingBox.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.UIMetadata.Window.fractionVisible.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t OnScreenContent.UIMetadata.Window.fractionVisible.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(unsigned char *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*OnScreenContent.UIMetadata.Window.fractionVisible.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.UIMetadata.Window.appProcess.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  return sub_252D8FE64(v1 + *(int *)(v3 + 28), a1, &qword_269CA9270);
}

uint64_t OnScreenContent.UIMetadata.Window.appProcess.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  return sub_252D8FEB4(a1, v1 + *(int *)(v3 + 28), &qword_269CA9270);
}

uint64_t (*OnScreenContent.UIMetadata.Window.appProcess.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.UIMetadata.Window.intelligenceUserActivity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  return sub_252D8FE64(v1 + *(int *)(v3 + 32), a1, &qword_269CA9278);
}

uint64_t OnScreenContent.UIMetadata.Window.intelligenceUserActivity.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  return sub_252D8FEB4(a1, v1 + *(int *)(v3 + 32), &qword_269CA9278);
}

uint64_t (*OnScreenContent.UIMetadata.Window.intelligenceUserActivity.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContent.UIMetadata.Window.init(isActive:)@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 8) = 0u;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 56) = 1;
  uint64_t v4 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v5 = a2 + *(int *)(v4 + 28);
  uint64_t v6 = sub_252DC2D90();
  sub_252D980C4(v5, v7, v8, v6);
  uint64_t v9 = a2 + *(int *)(v4 + 32);
  uint64_t v10 = sub_252DC2DA0();
  uint64_t result = sub_252D980C4(v9, v11, v12, v10);
  *(unsigned char *)a2 = a1;
  return result;
}

uint64_t OnScreenContent.UIMetadata.Window.hash(into:)()
{
  sub_252D9830C();
  uint64_t v4 = sub_252DC2DA0();
  sub_252D89934();
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v6);
  sub_252D97FC4(v7, v25);
  uint64_t v8 = sub_252D8823C(&qword_269CA9278);
  uint64_t v9 = sub_252D97F80(v8);
  MEMORY[0x270FA5388](v9);
  sub_252D981B8();
  uint64_t v10 = sub_252DC2D90();
  sub_252D89934();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  sub_252D981A0();
  uint64_t v14 = sub_252D8823C(&qword_269CA9270);
  uint64_t v15 = sub_252D97F80(v14);
  MEMORY[0x270FA5388](v15);
  sub_252D981D0();
  sub_252DC33A0();
  if (*(unsigned char *)(v0 + 40) == 1)
  {
    sub_252D982B4();
  }
  else
  {
    double v17 = *(double *)(v0 + 24);
    double v16 = *(double *)(v0 + 32);
    double v19 = *(double *)(v0 + 8);
    double v18 = *(double *)(v0 + 16);
    sub_252D9829C();
    sub_252D8FC68(v19, v18, v17, v16);
  }
  if (*(unsigned char *)(v0 + 56) == 1)
  {
    sub_252D982B4();
  }
  else
  {
    sub_252D9829C();
    sub_252DC33B0();
  }
  uint64_t v20 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  sub_252D8FE64(v0 + *(int *)(v20 + 28), v3, &qword_269CA9270);
  sub_252D98284(v3, 1, v10);
  if (v21)
  {
    sub_252D982B4();
  }
  else
  {
    sub_252D9834C();
    v22();
    sub_252D9829C();
    sub_252D8A6D0(&qword_269CA9280, MEMORY[0x263F81B08]);
    sub_252DC3040();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v10);
  }
  sub_252D8FE64(v0 + *(int *)(v20 + 32), v1, &qword_269CA9278);
  sub_252D98284(v1, 1, v4);
  if (v21) {
    return sub_252D982B4();
  }
  sub_252D9834C();
  v23();
  sub_252D9829C();
  sub_252D8A6D0(&qword_269CA9288, MEMORY[0x263F81B48]);
  sub_252DC3040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8))(v26, v4);
}

void static OnScreenContent.UIMetadata.Window.== infix(_:_:)()
{
  sub_252D9806C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v68 = sub_252DC2DA0();
  sub_252D89934();
  uint64_t v63 = v5;
  MEMORY[0x270FA5388](v6);
  sub_252D98150(v7, v58);
  uint64_t v8 = sub_252D8823C(&qword_269CA9290);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v9);
  sub_252D97FA8(v10, v58);
  uint64_t v11 = sub_252D8823C(&qword_269CA9278);
  uint64_t v12 = sub_252D97F80(v11);
  MEMORY[0x270FA5388](v12);
  sub_252D98010();
  uint64_t v64 = v13 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v65 = (uint64_t)&v58 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v66 = (uint64_t)&v58 - v18;
  uint64_t v19 = sub_252DC2D90();
  sub_252D89934();
  uint64_t v69 = v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v22 = sub_252D8823C(&qword_269CA9298);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v23);
  sub_252D98020();
  uint64_t v24 = sub_252D8823C(&qword_269CA9270);
  uint64_t v25 = sub_252D97F80(v24);
  MEMORY[0x270FA5388](v25);
  sub_252D98010();
  uint64_t v28 = v26 - v27;
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  v32 = (char *)&v58 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v58 - v33;
  if (*v4 != *v2) {
    goto LABEL_2;
  }
  if (v4[40])
  {
    if (!v2[40]) {
      goto LABEL_2;
    }
  }
  else if ((v2[40] & 1) != 0 || !CGRectEqualToRect(*(CGRect *)(v4 + 8), *(CGRect *)(v2 + 8)))
  {
    goto LABEL_2;
  }
  char v35 = v2[56];
  if (v4[56])
  {
    if (!v2[56]) {
      goto LABEL_2;
    }
LABEL_14:
    uint64_t v61 = v8;
    uint64_t v36 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
    sub_252D8FE64((uint64_t)&v4[*(int *)(v36 + 28)], (uint64_t)v34, &qword_269CA9270);
    uint64_t v60 = v36;
    sub_252D8FE64((uint64_t)&v2[*(int *)(v36 + 28)], (uint64_t)v32, &qword_269CA9270);
    uint64_t v37 = v0 + *(int *)(v22 + 48);
    sub_252D8FE64((uint64_t)v34, v0, &qword_269CA9270);
    sub_252D8FE64((uint64_t)v32, v37, &qword_269CA9270);
    sub_252D98284(v0, 1, v19);
    if (v39)
    {
      sub_252D8FF2C((uint64_t)v32, &qword_269CA9270);
      sub_252D8FF2C((uint64_t)v34, &qword_269CA9270);
      sub_252D98284(v37, 1, v19);
      uint64_t v38 = v61;
      if (v39)
      {
        sub_252D8FF2C(v0, &qword_269CA9270);
LABEL_24:
        uint64_t v45 = v60;
        uint64_t v46 = (uint64_t)&v4[*(int *)(v60 + 32)];
        uint64_t v47 = v66;
        sub_252D8FE64(v46, v66, &qword_269CA9278);
        uint64_t v48 = v65;
        sub_252D8FE64((uint64_t)&v2[*(int *)(v45 + 32)], v65, &qword_269CA9278);
        uint64_t v49 = v67;
        uint64_t v50 = v67 + *(int *)(v38 + 48);
        sub_252D8FE64(v47, v67, &qword_269CA9278);
        sub_252D8FE64(v48, v50, &qword_269CA9278);
        uint64_t v51 = v68;
        sub_252D98284(v49, 1, v68);
        if (v39)
        {
          sub_252D8FF2C(v48, &qword_269CA9278);
          sub_252D8FF2C(v47, &qword_269CA9278);
          sub_252D98284(v50, 1, v51);
          if (v39)
          {
            sub_252D8FF2C(v49, &qword_269CA9278);
            goto LABEL_2;
          }
        }
        else
        {
          uint64_t v52 = v64;
          sub_252D8FE64(v49, v64, &qword_269CA9278);
          sub_252D98284(v50, 1, v51);
          if (!v53)
          {
            uint64_t v55 = v62;
            uint64_t v54 = v63;
            sub_252D9834C();
            v56();
            sub_252D8A6D0(&qword_269CA92A0, MEMORY[0x263F81B48]);
            sub_252DC3060();
            v57 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
            v57(v55, v51);
            sub_252D8FF2C(v48, &qword_269CA9278);
            sub_252D8FF2C(v47, &qword_269CA9278);
            v57(v52, v51);
            sub_252D8FF2C(v49, &qword_269CA9278);
            goto LABEL_2;
          }
          sub_252D8FF2C(v48, &qword_269CA9278);
          sub_252D8FF2C(v47, &qword_269CA9278);
          (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v52, v51);
        }
        uint64_t v40 = &qword_269CA9290;
        uint64_t v41 = v49;
LABEL_33:
        sub_252D8FF2C(v41, v40);
        goto LABEL_2;
      }
    }
    else
    {
      sub_252D8FE64(v0, v28, &qword_269CA9270);
      sub_252D98284(v37, 1, v19);
      if (!v39)
      {
        uint64_t v42 = v69;
        sub_252D9834C();
        v43();
        sub_252D8A6D0(&qword_269CA92A8, MEMORY[0x263F81B08]);
        int v59 = sub_252DC3060();
        uint64_t v44 = *(void (**)(void))(v42 + 8);
        sub_252D98118();
        v44();
        sub_252D8FF2C((uint64_t)v32, &qword_269CA9270);
        sub_252D8FF2C((uint64_t)v34, &qword_269CA9270);
        sub_252D98118();
        v44();
        uint64_t v38 = v61;
        sub_252D8FF2C(v0, &qword_269CA9270);
        if ((v59 & 1) == 0) {
          goto LABEL_2;
        }
        goto LABEL_24;
      }
      sub_252D8FF2C((uint64_t)v32, &qword_269CA9270);
      sub_252D8FF2C((uint64_t)v34, &qword_269CA9270);
      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v28, v19);
    }
    uint64_t v40 = &qword_269CA9298;
    uint64_t v41 = v0;
    goto LABEL_33;
  }
  if (*((double *)v4 + 6) != *((double *)v2 + 6)) {
    char v35 = 1;
  }
  if ((v35 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_2:
  sub_252D98084();
}

uint64_t sub_252D8D3EC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6576697463417369 && a2 == 0xE800000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x676E69646E756F62 && a2 == 0xEB00000000786F42;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E6F697463617266 && a2 == 0xEF656C6269736956;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x65636F7250707061 && a2 == 0xEA00000000007373;
        if (v8 || (sub_252DC3360() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000018 && a2 == 0x8000000252DC3C30)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v9 = sub_252DC3360();
          swift_bridgeObjectRelease();
          if (v9) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t sub_252D8D644()
{
  return 5;
}

unint64_t sub_252D8D64C(char a1)
{
  unint64_t result = 0x6576697463417369;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x676E69646E756F62;
      break;
    case 2:
      unint64_t result = 0x6E6F697463617266;
      break;
    case 3:
      unint64_t result = 0x65636F7250707061;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_252D8D718()
{
  return sub_252D8D64C(*v0);
}

uint64_t sub_252D8D720@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D8D3EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D8D748@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D8D644();
  *a1 = result;
  return result;
}

uint64_t sub_252D8D770(uint64_t a1)
{
  unint64_t v2 = sub_252D8FF7C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D8D7AC(uint64_t a1)
{
  unint64_t v2 = sub_252D8FF7C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnScreenContent.UIMetadata.Window.encode(to:)()
{
  sub_252D8823C(&qword_269CA92B0);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252D8FF7C();
  sub_252D97F60();
  sub_252DC3320();
  if (!v0)
  {
    type metadata accessor for CGRect(0);
    sub_252D8A6D0(&qword_269CA92C0, type metadata accessor for CGRect);
    sub_252DC3300();
    sub_252DC32F0();
    type metadata accessor for OnScreenContent.UIMetadata.Window(0);
    sub_252DC2D90();
    sub_252D8A6D0(&qword_269CA92C8, MEMORY[0x263F81B08]);
    sub_252D983AC();
    sub_252DC3300();
    sub_252DC2DA0();
    sub_252D8A6D0(&qword_269CA92D0, MEMORY[0x263F81B48]);
    sub_252D983AC();
    sub_252DC3300();
  }
  uint64_t v2 = sub_252D97F10();
  return v3(v2);
}

uint64_t OnScreenContent.UIMetadata.Window.hashValue.getter()
{
  return sub_252DC33C0();
}

void OnScreenContent.UIMetadata.Window.init(from:)()
{
  sub_252D97FE0();
  uint64_t v5 = v4;
  uint64_t v6 = sub_252D8823C(&qword_269CA9278);
  uint64_t v7 = sub_252D97F80(v6);
  MEMORY[0x270FA5388](v7);
  sub_252D97F28();
  uint64_t v27 = v8;
  uint64_t v9 = sub_252D8823C(&qword_269CA9270);
  uint64_t v10 = sub_252D97F80(v9);
  MEMORY[0x270FA5388](v10);
  sub_252D98020();
  sub_252D8823C(&qword_269CA92D8);
  sub_252D89934();
  uint64_t v28 = v12;
  uint64_t v29 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = sub_252D97F8C();
  uint64_t v14 = type metadata accessor for OnScreenContent.UIMetadata.Window(v13);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  sub_252D97EF8();
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 8) = 0u;
  *(unsigned char *)(v3 + 40) = 1;
  *(void *)(v3 + 48) = 0;
  *(unsigned char *)(v3 + 56) = 1;
  uint64_t v16 = v3 + *(int *)(v15 + 36);
  uint64_t v17 = sub_252DC2D90();
  sub_252D98128();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v18, v19, v20, v17);
  uint64_t v21 = v3 + *(int *)(v15 + 40);
  uint64_t v22 = sub_252DC2DA0();
  sub_252D98128();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v23, v24, v25, v22);
  sub_252D88F0C(v5, v5[3]);
  sub_252D8FF7C();
  sub_252D983EC();
  sub_252DC33D0();
  if (v1)
  {
    sub_252D8931C((uint64_t)v5);
    sub_252D8FF2C(v16, &qword_269CA9270);
    sub_252D8FF2C(v21, &qword_269CA9278);
  }
  else
  {
    LOBYTE(v30) = 0;
    *(unsigned char *)uint64_t v3 = sub_252DC3290() & 1;
    type metadata accessor for CGRect(0);
    sub_252D8A6D0(&qword_269CA92E0, type metadata accessor for CGRect);
    sub_252DC3270();
    *(_OWORD *)(v3 + 8) = v30;
    *(_OWORD *)(v3 + 24) = v31;
    *(unsigned char *)(v3 + 40) = v32;
    *(void *)(v3 + 48) = sub_252DC3260();
    *(unsigned char *)(v3 + 56) = v26 & 1;
    sub_252D8A6D0(&qword_269CA92E8, MEMORY[0x263F81B08]);
    sub_252DC3270();
    sub_252D8FEB4(v0, v16, &qword_269CA9270);
    sub_252D8A6D0(&qword_269CA92F0, MEMORY[0x263F81B48]);
    sub_252DC3270();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v2, v29);
    sub_252D8FEB4(v27, v21, &qword_269CA9278);
    sub_252D89AF0();
    sub_252D8931C((uint64_t)v5);
    sub_252D8A718();
  }
  sub_252D97FF8();
}

void sub_252D8DF14()
{
}

uint64_t sub_252D8DF2C()
{
  return OnScreenContent.UIMetadata.Window.encode(to:)();
}

uint64_t sub_252D8DF4C()
{
  return sub_252DC33C0();
}

uint64_t OnScreenContent.UIMetadata.init(window:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for OnScreenContent.UIMetadata(0);
  *(void *)(a1 + *(int *)(v2 + 24)) = MEMORY[0x263F8EE78];
  uint64_t result = sub_252D8A62C();
  *(unsigned char *)(a1 + *(int *)(v2 + 20)) = 0;
  return result;
}

uint64_t OnScreenContent.UIMetadata.hash(into:)(uint64_t a1)
{
  OnScreenContent.UIMetadata.Window.hash(into:)();
  uint64_t v3 = type metadata accessor for OnScreenContent.UIMetadata(0);
  sub_252D983C0(v3);
  sub_252DC33A0();
  uint64_t v4 = *(void *)(v1 + *(int *)(v3 + 24));
  swift_bridgeObjectRetain();
  sub_252D8FB74(a1, v4, MEMORY[0x263F81B08], &qword_269CA9280, MEMORY[0x263F81B08]);

  return swift_bridgeObjectRelease();
}

uint64_t static OnScreenContent.UIMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  static OnScreenContent.UIMetadata.Window.== infix(_:_:)();
  if ((v4 & 1) != 0
    && (uint64_t v5 = type metadata accessor for OnScreenContent.UIMetadata(0),
        *(unsigned __int8 *)(a1 + *(int *)(v5 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v5 + 20))))
  {
    sub_252D8E800();
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

void sub_252D8E160()
{
}

void sub_252D8E1A8()
{
  sub_252D9806C();
  uint64_t v4 = sub_252D980B4();
  uint64_t v5 = type metadata accessor for DetectedEntity(v4) - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = *(void *)(v1 + 16);
  if (v7 == *(void *)(v0 + 16) && v7 && v1 != v0)
  {
    sub_252D982CC();
    uint64_t v9 = v8 - 1;
    do
    {
      sub_252D89AF0();
      sub_252D89AF0();
      static DetectedEntity.== infix(_:_:)();
      char v11 = v10;
      sub_252D8A718();
      sub_252D8A718();
      BOOL v13 = v9-- != 0;
      if ((v11 & 1) == 0) {
        break;
      }
      v2 += v3;
    }
    while (v13);
  }
  sub_252D98084();
}

void sub_252D8E324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_252D9806C();
  a19 = v24;
  a20 = v25;
  uint64_t v26 = sub_252D980B4();
  uint64_t v27 = type metadata accessor for DetectedEntityDetails(v26);
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  long long v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  char v32 = (char *)&a9 - v31;
  uint64_t v33 = *(void *)(v21 + 16);
  if (v33 == *(void *)(v20 + 16) && v33 && v21 != v20)
  {
    sub_252D982CC();
    uint64_t v35 = v34 - 1;
    while (1)
    {
      uint64_t v36 = v35;
      sub_252D89AF0();
      sub_252D89AF0();
      static DetectedEntity.== infix(_:_:)();
      if ((v37 & 1) == 0) {
        break;
      }
      char v38 = v32[*(int *)(v27 + 20)] ^ v30[*(int *)(v27 + 20)];
      sub_252D8A718();
      sub_252D8A718();
      if ((v38 & 1) == 0)
      {
        uint64_t v35 = v36 - 1;
        v22 += v23;
        if (v36) {
          continue;
        }
      }
      goto LABEL_11;
    }
    sub_252D8A718();
    sub_252D8A718();
  }
LABEL_11:
  sub_252D98084();
}

void sub_252D8E4F0()
{
  sub_252D9806C();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for DetectedEntity(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  sub_252D98010();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = *(void *)(v3 + 16);
  if (v7 != *(void *)(v1 + 16)) {
    goto LABEL_22;
  }
  if (!v7) {
    goto LABEL_22;
  }
  if (v3 == v1) {
    goto LABEL_22;
  }
  uint64_t v8 = v1 + 32;
  uint64_t v29 = v3 + 32;
  uint64_t v30 = *(void *)(v3 + 16);
  memcpy(v38, (const void *)(v3 + 32), 0xAAuLL);
  uint64_t v9 = (unint64_t *)v38[0];
  uint64_t v28 = v8;
  memcpy(v39, (const void *)v8, 0xAAuLL);
  sub_252D9826C();
  if (v8 != v10)
  {
LABEL_22:
    sub_252D98084();
    return;
  }
  uint64_t v26 = &v39[3];
  uint64_t v27 = &v38[3];
  uint64_t v31 = v5;
  uint64_t v32 = 1;
  while (1)
  {
    if (!v8)
    {
      sub_252D97C34((uint64_t)v38);
      sub_252D97C34((uint64_t)v39);
      goto LABEL_14;
    }
    uint64_t v11 = *(unsigned __int8 *)(v5 + 80);
    sub_252D97C34((uint64_t)v38);
    sub_252D97C34((uint64_t)v39);
    if (v35 != v34) {
      break;
    }
LABEL_14:
    sub_252D8E324(v38[1], v39[1], v12, v13, v14, v15, v16, v17, (uint64_t)v26, (uint64_t)v27, v28, v29, v30, v31, v32, v34, v35, v36[0], v36[1],
      v36[2]);
    if ((v23 & 1) == 0 || (sub_252D8E4F0(v38[2], v39[2]) & 1) == 0)
    {
LABEL_21:
      sub_252D97D64((uint64_t)v39);
      sub_252D97D64((uint64_t)v38);
      goto LABEL_22;
    }
    memcpy(v37, v27, 0x92uLL);
    memcpy(v36, v26, 0x92uLL);
    char v24 = static UIElement.== infix(_:_:)((uint64_t)v37, (uint64_t)v36);
    sub_252D97D64((uint64_t)v39);
    sub_252D97D64((uint64_t)v38);
    uint64_t v5 = v31;
    if ((v24 & 1) != 0 && v33 != v30)
    {
      uint64_t v8 = 176 * v33;
      memcpy(v38, (const void *)(v29 + 176 * v33), 0xAAuLL);
      uint64_t v9 = (unint64_t *)v38[0];
      memcpy(v39, (const void *)(v28 + 176 * v33), 0xAAuLL);
      sub_252D9826C();
      uint64_t v32 = v33 + 1;
      if (v8 == v25) {
        continue;
      }
    }
    goto LABEL_22;
  }
  unint64_t v18 = 0;
  uint64_t v19 = (v11 + 32) & ~v11;
  uint64_t v20 = *(void *)(v31 + 72);
  while (1)
  {
    sub_252D89AF0();
    if (v18 >= *v9) {
      break;
    }
    sub_252D89AF0();
    static DetectedEntity.== infix(_:_:)();
    char v22 = v21;
    sub_252D8A718();
    sub_252D8A718();
    if ((v22 & 1) == 0) {
      goto LABEL_21;
    }
    ++v18;
    v19 += v20;
    if (v8 == v18) {
      goto LABEL_14;
    }
  }
  __break(1u);
}

void sub_252D8E800()
{
  sub_252D9806C();
  uint64_t v34 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9(0);
  sub_252D89934();
  MEMORY[0x270FA5388](v11);
  sub_252D98010();
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v17 = *(void *)(v8 + 16);
  if (v17 == *(void *)(v6 + 16) && v17 && v8 != v6)
  {
    unint64_t v18 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v20 = *(void (**)(uint64_t, unint64_t, uint64_t))(v13 + 16);
    uint64_t v19 = v13 + 16;
    uint64_t v31 = v20;
    uint64_t v32 = v14;
    uint64_t v27 = *(void *)(v19 + 56);
    uint64_t v28 = v6;
    uint64_t v33 = v19;
    uint64_t v29 = v8;
    uint64_t v30 = (void (**)(void))(v19 - 8);
    uint64_t v21 = v17 - 1;
    do
    {
      char v22 = v31;
      v31((uint64_t)v16, v8 + v18, v10);
      v22(v32, v6 + v18, v10);
      sub_252D8A6D0(v4, v2);
      char v23 = sub_252DC3060();
      char v24 = *v30;
      sub_252D98118();
      v24();
      sub_252D98118();
      v24();
      BOOL v26 = v21-- != 0;
      if ((v23 & 1) == 0) {
        break;
      }
      v18 += v27;
      uint64_t v6 = v28;
      uint64_t v8 = v29;
    }
    while (v26);
  }
  sub_252D98084();
}

uint64_t sub_252D8E9C8(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = sub_252DC3360();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v8 = a1 + 7;
  uint64_t v9 = a2 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      uint64_t result = sub_252DC3360();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_252D8EA98(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x776F646E6977 && a2 == 0xE600000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x7463656C65537369 && a2 == 0xEA00000000006465;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000015 && a2 == 0x8000000252DC3C50)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v7 = sub_252DC3360();
      swift_bridgeObjectRelease();
      if (v7) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_252D8EBEC()
{
  return sub_252DC33C0();
}

uint64_t sub_252D8EC2C(char a1)
{
  if (!a1) {
    return 0x776F646E6977;
  }
  if (a1 == 1) {
    return 0x7463656C65537369;
  }
  return 0xD000000000000015;
}

uint64_t sub_252D8EC88()
{
  return sub_252D8EBEC();
}

uint64_t sub_252D8ECA4()
{
  return sub_252D8EC2C(*v0);
}

uint64_t sub_252D8ECAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D8EA98(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D8ECD4(uint64_t a1)
{
  unint64_t v2 = sub_252D8FFC8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D8ED10(uint64_t a1)
{
  unint64_t v2 = sub_252D8FFC8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void OnScreenContent.UIMetadata.encode(to:)()
{
  sub_252D98108();
  sub_252D8823C(&qword_269CA92F8);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252D8FFC8();
  sub_252D97F60();
  type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  sub_252D8A6D0(&qword_269CA9308, (void (*)(uint64_t))type metadata accessor for OnScreenContent.UIMetadata.Window);
  sub_252D980E8();
  if (!v0)
  {
    type metadata accessor for OnScreenContent.UIMetadata(0);
    sub_252D98038();
    sub_252D8823C(&qword_269CA9310);
    sub_252D90014(&qword_269CA9318, &qword_269CA92C8);
    sub_252D980E8();
  }
  uint64_t v2 = sub_252D97F10();
  v3(v2);
  sub_252D98318();
}

uint64_t OnScreenContent.UIMetadata.hashValue.getter()
{
  sub_252D981F4();
  OnScreenContent.UIMetadata.Window.hash(into:)();
  uint64_t v1 = type metadata accessor for OnScreenContent.UIMetadata(0);
  sub_252D983C0(v1);
  sub_252DC33A0();
  uint64_t v2 = *(void *)(v0 + *(int *)(v1 + 24));
  swift_bridgeObjectRetain();
  sub_252D8FB74((uint64_t)v4, v2, MEMORY[0x263F81B08], &qword_269CA9280, MEMORY[0x263F81B08]);
  swift_bridgeObjectRelease();
  return sub_252DC33C0();
}

void OnScreenContent.UIMetadata.init(from:)()
{
  sub_252D97FE0();
  uint64_t v2 = v1;
  v18[0] = v3;
  type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v4);
  sub_252D97FA8(v5, v18[0]);
  sub_252D8823C(&qword_269CA9320);
  sub_252D89934();
  v18[1] = v7;
  v18[2] = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = sub_252D97F8C();
  uint64_t v9 = type metadata accessor for OnScreenContent.UIMetadata(v8);
  sub_252D97EE8();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(int *)(v11 + 24);
  *(void *)&v13[v19] = MEMORY[0x263F8EE78];
  sub_252D88F0C(v2, v2[3]);
  sub_252D8FFC8();
  sub_252D983EC();
  sub_252DC33D0();
  if (v0)
  {
    sub_252D8931C((uint64_t)v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252D8A6D0(&qword_269CA9328, (void (*)(uint64_t))type metadata accessor for OnScreenContent.UIMetadata.Window);
    sub_252DC32B0();
    sub_252D8A62C();
    v13[*(int *)(v9 + 20)] = sub_252DC3290() & 1;
    sub_252D8823C(&qword_269CA9310);
    sub_252D90014(&qword_269CA9330, &qword_269CA92E8);
    sub_252DC32B0();
    uint64_t v14 = sub_252D98254();
    v15(v14);
    uint64_t v17 = v19;
    uint64_t v16 = v20;
    swift_bridgeObjectRelease();
    *(void *)&v13[v17] = v16;
    sub_252D89AF0();
    sub_252D8931C((uint64_t)v2);
    sub_252D8A718();
  }
  sub_252D97FF8();
}

void sub_252D8F2EC()
{
}

void sub_252D8F304()
{
}

uint64_t sub_252D8F324(uint64_t a1, uint64_t a2)
{
  sub_252DC3380();
  OnScreenContent.UIMetadata.Window.hash(into:)();
  sub_252DC33A0();
  uint64_t v4 = *(void *)(v2 + *(int *)(a2 + 24));
  swift_bridgeObjectRetain();
  sub_252D8FB74((uint64_t)v6, v4, MEMORY[0x263F81B08], &qword_269CA9280, MEMORY[0x263F81B08]);
  swift_bridgeObjectRelease();
  return sub_252DC33C0();
}

uint64_t OnScreenContent.init(content:uiMetadata:)()
{
  return sub_252D8A62C();
}

uint64_t sub_252D8F454(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61646174654D6975 && a2 == 0xEA00000000006174)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252D8F550()
{
  return sub_252DC33C0();
}

uint64_t sub_252D8F590(char a1)
{
  if (a1) {
    return 0x61646174654D6975;
  }
  else {
    return 0x746E65746E6F63;
  }
}

uint64_t sub_252D8F5CC()
{
  return sub_252D8F590(*v0);
}

uint64_t sub_252D8F5D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D8F454(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D8F5FC(uint64_t a1)
{
  unint64_t v2 = sub_252D900A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D8F638(uint64_t a1)
{
  unint64_t v2 = sub_252D900A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void OnScreenContent.encode(to:)()
{
  sub_252D98108();
  sub_252D8823C(&qword_269CA9338);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252D900A8();
  sub_252D97F60();
  type metadata accessor for OnScreenContent.Content(0);
  sub_252D8A6D0(&qword_269CA9348, (void (*)(uint64_t))type metadata accessor for OnScreenContent.Content);
  sub_252D980E8();
  if (!v0)
  {
    type metadata accessor for OnScreenContent(0);
    type metadata accessor for OnScreenContent.UIMetadata(0);
    sub_252D8A6D0(&qword_269CA9350, (void (*)(uint64_t))type metadata accessor for OnScreenContent.UIMetadata);
    sub_252DC3340();
  }
  uint64_t v2 = sub_252D97F10();
  v3(v2);
  sub_252D98318();
}

void OnScreenContent.init(from:)()
{
  sub_252D97FE0();
  uint64_t v2 = v1;
  type metadata accessor for OnScreenContent.UIMetadata(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v3);
  sub_252D9816C();
  sub_252D97EE8();
  MEMORY[0x270FA5388](v4);
  sub_252D97F28();
  sub_252D8823C(&qword_269CA9358);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D97EF8();
  type metadata accessor for OnScreenContent(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v6);
  sub_252D88F0C(v2, v2[3]);
  sub_252D900A8();
  sub_252DC33D0();
  if (v0)
  {
    sub_252D8931C((uint64_t)v2);
  }
  else
  {
    sub_252D8A6D0(&qword_269CA9360, (void (*)(uint64_t))type metadata accessor for OnScreenContent.Content);
    sub_252D98358();
    sub_252D8A62C();
    sub_252D8A6D0(&qword_269CA9368, (void (*)(uint64_t))type metadata accessor for OnScreenContent.UIMetadata);
    sub_252D98358();
    uint64_t v7 = sub_252D98224();
    v8(v7);
    sub_252D8A62C();
    sub_252D89AF0();
    sub_252D8931C((uint64_t)v2);
    sub_252D8A718();
  }
  sub_252D97FF8();
}

void sub_252D8FAFC()
{
}

void sub_252D8FB14()
{
}

uint64_t sub_252D8FB2C(uint64_t a1, uint64_t a2)
{
  return sub_252D8FB74(a1, a2, MEMORY[0x263F8F3A0], &qword_269CA94C8, MEMORY[0x263F8F3A0]);
}

uint64_t sub_252D8FB74(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t))
{
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t result = sub_252DC3390();
  if (v9)
  {
    uint64_t v11 = *(void *)(a3(0) - 8);
    uint64_t v12 = a2 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v13 = *(void *)(v11 + 72);
    sub_252D8A6D0(a4, a5);
    do
    {
      uint64_t result = sub_252DC3040();
      v12 += v13;
      --v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_252D8FC68(double a1, double a2, double a3, double a4)
{
  return sub_252DC33B0();
}

uint64_t _s23IntelligenceFlowContext14DetectedEntityOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_252D8FD10()
{
  unint64_t result = qword_269CA91F8;
  if (!qword_269CA91F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA91F8);
  }
  return result;
}

unint64_t sub_252D8FD5C()
{
  unint64_t result = qword_269CA9248;
  if (!qword_269CA9248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9248);
  }
  return result;
}

uint64_t type metadata accessor for OnScreenContent.UIMetadata.Window(uint64_t a1)
{
  return sub_252D8FDC8(a1, (uint64_t *)&unk_269CA93E0);
}

uint64_t sub_252D8FDC8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_252D8FDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252D8823C(&qword_269CA9268);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_252D8FE64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_252D8823C(a3);
  sub_252D97EE8();
  uint64_t v4 = sub_252D98338();
  v5(v4);
  return a2;
}

uint64_t sub_252D8FEB4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_252D8823C(a3);
  sub_252D97EE8();
  uint64_t v4 = sub_252D98324();
  v5(v4);
  return a2;
}

uint64_t _s23IntelligenceFlowContext14DetectedEntityOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_252D8FF2C(uint64_t a1, uint64_t *a2)
{
  sub_252D8823C(a2);
  sub_252D97EE8();
  sub_252D980DC();
  v3();
  return a1;
}

unint64_t sub_252D8FF7C()
{
  unint64_t result = qword_269CA92B8;
  if (!qword_269CA92B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA92B8);
  }
  return result;
}

unint64_t sub_252D8FFC8()
{
  unint64_t result = qword_269CA9300;
  if (!qword_269CA9300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9300);
  }
  return result;
}

uint64_t sub_252D90014(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(&qword_269CA9310);
    sub_252D8A6D0(a2, MEMORY[0x263F81B08]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_252D900A8()
{
  unint64_t result = qword_269CA9340;
  if (!qword_269CA9340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9340);
  }
  return result;
}

uint64_t sub_252D900F4()
{
  return sub_252D8A6D0(&qword_269CA9370, (void (*)(uint64_t))type metadata accessor for OnScreenContent.UIMetadata.Window);
}

uint64_t sub_252D9013C()
{
  return sub_252D8A6D0(&qword_269CA9378, (void (*)(uint64_t))type metadata accessor for OnScreenContent.UIMetadata);
}

uint64_t *initializeBufferWithCopyOfBuffer for OnScreenContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    type metadata accessor for OnScreenContent.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_252DC2D70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v7))
      {
        uint64_t v8 = sub_252D8823C(&qword_269CA9238);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v7);
      }
      uint64_t v16 = type metadata accessor for OnScreenContent.Image(0);
      *((unsigned char *)a1 + *(int *)(v16 + 20)) = *((unsigned char *)a2 + *(int *)(v16 + 20));
      uint64_t v17 = *(int *)(v16 + 24);
      unint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v19, 1, v20))
      {
        uint64_t v21 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v18, 0, 1, v20);
      }
    }
    else
    {
      *a1 = *a2;
      uint64_t v10 = (int *)type metadata accessor for OnScreenContent.Document(0);
      uint64_t v11 = v10[5];
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_252DC2D80();
      swift_retain();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v13, 1, v14))
      {
        uint64_t v15 = sub_252D8823C(&qword_269CA91E0);
        memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v12, 0, 1, v14);
      }
      uint64_t v22 = v10[6];
      char v23 = (char *)a1 + v22;
      char v24 = (char *)a2 + v22;
      uint64_t v25 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v24, 1, v25))
      {
        uint64_t v26 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v23, 0, 1, v25);
      }
      *((unsigned char *)a1 + v10[7]) = *((unsigned char *)a2 + v10[7]);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = *(int *)(a3 + 20);
    uint64_t v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    *uint64_t v28 = *((unsigned char *)a2 + v27);
    *(_OWORD *)(v28 + 8) = *(_OWORD *)((char *)a2 + v27 + 8);
    *(_OWORD *)(v28 + 24) = *(_OWORD *)((char *)a2 + v27 + 24);
    v28[40] = *((unsigned char *)a2 + v27 + 40);
    *((void *)v28 + 6) = *(uint64_t *)((char *)a2 + v27 + 48);
    v28[56] = *((unsigned char *)a2 + v27 + 56);
    uint64_t v30 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
    uint64_t v31 = *(int *)(v30 + 28);
    uint64_t v32 = &v28[v31];
    uint64_t v33 = &v29[v31];
    uint64_t v34 = sub_252DC2D90();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v33, 1, v34))
    {
      uint64_t v35 = sub_252D8823C(&qword_269CA9270);
      memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v32, 0, 1, v34);
    }
    uint64_t v36 = *(int *)(v30 + 32);
    char v37 = &v28[v36];
    char v38 = &v29[v36];
    uint64_t v39 = sub_252DC2DA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v38, 1, v39))
    {
      uint64_t v40 = sub_252D8823C(&qword_269CA9278);
      memcpy(v37, v38, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v37, 0, 1, v39);
    }
    uint64_t v41 = type metadata accessor for OnScreenContent.UIMetadata(0);
    v28[*(int *)(v41 + 20)] = v29[*(int *)(v41 + 20)];
    *(void *)&v28[*(int *)(v41 + 24)] = *(void *)&v29[*(int *)(v41 + 24)];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for OnScreenContent(uint64_t a1, uint64_t a2)
{
  type metadata accessor for OnScreenContent.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_252DC2D70();
    if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, 1, v4)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    }
    uint64_t v5 = *(int *)(type metadata accessor for OnScreenContent.Image(0) + 24);
  }
  else
  {
    swift_release();
    uint64_t v6 = type metadata accessor for OnScreenContent.Document(0);
    uint64_t v7 = a1 + *(int *)(v6 + 20);
    uint64_t v8 = sub_252DC2D80();
    if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    }
    uint64_t v5 = *(int *)(v6 + 24);
  }
  uint64_t v9 = a1 + v5;
  uint64_t v10 = sub_252DC2FA0();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  uint64_t v11 = a1 + *(int *)(a2 + 20);
  uint64_t v12 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v13 = v11 + *(int *)(v12 + 28);
  uint64_t v14 = sub_252DC2D90();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v13, 1, v14)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  uint64_t v15 = v11 + *(int *)(v12 + 32);
  uint64_t v16 = sub_252DC2DA0();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v15, 1, v16)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  }
  type metadata accessor for OnScreenContent.UIMetadata(0);

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for OnScreenContent(void *a1, void *a2, uint64_t a3)
{
  type metadata accessor for OnScreenContent.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_252DC2D70();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6))
    {
      uint64_t v7 = sub_252D8823C(&qword_269CA9238);
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
    }
    uint64_t v14 = type metadata accessor for OnScreenContent.Image(0);
    *((unsigned char *)a1 + *(int *)(v14 + 20)) = *((unsigned char *)a2 + *(int *)(v14 + 20));
    uint64_t v15 = *(int *)(v14 + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
    {
      uint64_t v19 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
    }
  }
  else
  {
    *a1 = *a2;
    uint64_t v8 = (int *)type metadata accessor for OnScreenContent.Document(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_252DC2D80();
    swift_retain();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = sub_252D8823C(&qword_269CA91E0);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v12);
    }
    uint64_t v20 = v8[6];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v22, 1, v23))
    {
      uint64_t v24 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v21, 0, 1, v23);
    }
    *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = *(int *)(a3 + 20);
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *uint64_t v26 = *((unsigned char *)a2 + v25);
  *(_OWORD *)(v26 + 8) = *(_OWORD *)((char *)a2 + v25 + 8);
  *(_OWORD *)(v26 + 24) = *(_OWORD *)((char *)a2 + v25 + 24);
  v26[40] = *((unsigned char *)a2 + v25 + 40);
  *((void *)v26 + 6) = *(void *)((char *)a2 + v25 + 48);
  v26[56] = *((unsigned char *)a2 + v25 + 56);
  uint64_t v28 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v29 = *(int *)(v28 + 28);
  uint64_t v30 = &v26[v29];
  uint64_t v31 = &v27[v29];
  uint64_t v32 = sub_252DC2D90();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v31, 1, v32))
  {
    uint64_t v33 = sub_252D8823C(&qword_269CA9270);
    memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v30, 0, 1, v32);
  }
  uint64_t v34 = *(int *)(v28 + 32);
  uint64_t v35 = &v26[v34];
  uint64_t v36 = &v27[v34];
  uint64_t v37 = sub_252DC2DA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v36, 1, v37))
  {
    uint64_t v38 = sub_252D8823C(&qword_269CA9278);
    memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v35, 0, 1, v37);
  }
  uint64_t v39 = type metadata accessor for OnScreenContent.UIMetadata(0);
  v26[*(int *)(v39 + 20)] = v27[*(int *)(v39 + 20)];
  *(void *)&v26[*(int *)(v39 + 24)] = *(void *)&v27[*(int *)(v39 + 24)];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for OnScreenContent(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_252D8A718();
    type metadata accessor for OnScreenContent.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_252DC2D70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = sub_252D8823C(&qword_269CA9238);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
      }
      uint64_t v14 = type metadata accessor for OnScreenContent.Image(0);
      *((unsigned char *)a1 + *(int *)(v14 + 20)) = *((unsigned char *)a2 + *(int *)(v14 + 20));
      uint64_t v15 = *(int *)(v14 + 24);
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
      {
        uint64_t v19 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
      }
    }
    else
    {
      *a1 = *a2;
      uint64_t v8 = (int *)type metadata accessor for OnScreenContent.Document(0);
      uint64_t v9 = v8[5];
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_252DC2D80();
      swift_retain();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = sub_252D8823C(&qword_269CA91E0);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v12);
      }
      uint64_t v20 = v8[6];
      uint64_t v21 = (char *)a1 + v20;
      uint64_t v22 = (char *)a2 + v20;
      uint64_t v23 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v22, 1, v23))
      {
        uint64_t v24 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v21, 0, 1, v23);
      }
      *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v25 = *(int *)(a3 + 20);
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *uint64_t v26 = *((unsigned char *)a2 + v25);
  long long v28 = *(_OWORD *)((char *)a2 + v25 + 8);
  long long v29 = *(_OWORD *)((char *)a2 + v25 + 24);
  v26[40] = *((unsigned char *)a2 + v25 + 40);
  *(_OWORD *)(v26 + 24) = v29;
  *(_OWORD *)(v26 + 8) = v28;
  uint64_t v30 = *(void *)((char *)a2 + v25 + 48);
  v26[56] = v27[56];
  *((void *)v26 + 6) = v30;
  uint64_t v31 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v32 = *(int *)(v31 + 28);
  uint64_t v33 = &v26[v32];
  uint64_t v34 = &v27[v32];
  uint64_t v35 = sub_252DC2D90();
  int v36 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v33, 1, v35);
  int v37 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v34, 1, v35);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v33, 0, 1, v35);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v38 = *(void *)(v35 - 8);
  if (v37)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v33, v35);
LABEL_22:
    uint64_t v39 = sub_252D8823C(&qword_269CA9270);
    memcpy(v33, v34, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 24))(v33, v34, v35);
LABEL_23:
  uint64_t v40 = *(int *)(v31 + 32);
  uint64_t v41 = &v26[v40];
  uint64_t v42 = &v27[v40];
  uint64_t v43 = sub_252DC2DA0();
  int v44 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v41, 1, v43);
  int v45 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v42, 1, v43);
  if (!v44)
  {
    uint64_t v46 = *(void *)(v43 - 8);
    if (!v45)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 24))(v41, v42, v43);
      goto LABEL_29;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v43);
    goto LABEL_28;
  }
  if (v45)
  {
LABEL_28:
    uint64_t v47 = sub_252D8823C(&qword_269CA9278);
    memcpy(v41, v42, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_29;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v41, 0, 1, v43);
LABEL_29:
  uint64_t v48 = type metadata accessor for OnScreenContent.UIMetadata(0);
  v26[*(int *)(v48 + 20)] = v27[*(int *)(v48 + 20)];
  *(void *)&v26[*(int *)(v48 + 24)] = *(void *)&v27[*(int *)(v48 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for OnScreenContent(void *a1, void *a2, uint64_t a3)
{
  type metadata accessor for OnScreenContent.Content(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_252DC2D70();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6))
    {
      uint64_t v7 = sub_252D8823C(&qword_269CA9238);
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
    }
    uint64_t v14 = type metadata accessor for OnScreenContent.Image(0);
    *((unsigned char *)a1 + *(int *)(v14 + 20)) = *((unsigned char *)a2 + *(int *)(v14 + 20));
    uint64_t v15 = *(int *)(v14 + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
    {
      uint64_t v19 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
    }
  }
  else
  {
    *a1 = *a2;
    uint64_t v8 = (int *)type metadata accessor for OnScreenContent.Document(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_252DC2D80();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = sub_252D8823C(&qword_269CA91E0);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v12);
    }
    uint64_t v20 = v8[6];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v22, 1, v23))
    {
      uint64_t v24 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v21, 0, 1, v23);
    }
    *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = *(int *)(a3 + 20);
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *uint64_t v26 = *((unsigned char *)a2 + v25);
  *(_OWORD *)(v26 + 8) = *(_OWORD *)((char *)a2 + v25 + 8);
  *(_OWORD *)(v26 + 24) = *(_OWORD *)((char *)a2 + v25 + 24);
  v26[40] = *((unsigned char *)a2 + v25 + 40);
  *((void *)v26 + 6) = *(void *)((char *)a2 + v25 + 48);
  v26[56] = *((unsigned char *)a2 + v25 + 56);
  uint64_t v28 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v29 = *(int *)(v28 + 28);
  uint64_t v30 = &v26[v29];
  uint64_t v31 = &v27[v29];
  uint64_t v32 = sub_252DC2D90();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v31, 1, v32))
  {
    uint64_t v33 = sub_252D8823C(&qword_269CA9270);
    memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v30, 0, 1, v32);
  }
  uint64_t v34 = *(int *)(v28 + 32);
  uint64_t v35 = &v26[v34];
  int v36 = &v27[v34];
  uint64_t v37 = sub_252DC2DA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v36, 1, v37))
  {
    uint64_t v38 = sub_252D8823C(&qword_269CA9278);
    memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32))(v35, v36, v37);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v35, 0, 1, v37);
  }
  uint64_t v39 = type metadata accessor for OnScreenContent.UIMetadata(0);
  v26[*(int *)(v39 + 20)] = v27[*(int *)(v39 + 20)];
  *(void *)&v26[*(int *)(v39 + 24)] = *(void *)&v27[*(int *)(v39 + 24)];
  return a1;
}

void *assignWithTake for OnScreenContent(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_252D8A718();
    type metadata accessor for OnScreenContent.Content(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_252DC2D70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = sub_252D8823C(&qword_269CA9238);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
      }
      uint64_t v14 = type metadata accessor for OnScreenContent.Image(0);
      *((unsigned char *)a1 + *(int *)(v14 + 20)) = *((unsigned char *)a2 + *(int *)(v14 + 20));
      uint64_t v15 = *(int *)(v14 + 24);
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
      {
        uint64_t v19 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
      }
    }
    else
    {
      *a1 = *a2;
      uint64_t v8 = (int *)type metadata accessor for OnScreenContent.Document(0);
      uint64_t v9 = v8[5];
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_252DC2D80();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = sub_252D8823C(&qword_269CA91E0);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v12);
      }
      uint64_t v20 = v8[6];
      uint64_t v21 = (char *)a1 + v20;
      uint64_t v22 = (char *)a2 + v20;
      uint64_t v23 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v22, 1, v23))
      {
        uint64_t v24 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v21, 0, 1, v23);
      }
      *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v25 = *(int *)(a3 + 20);
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *uint64_t v26 = *((unsigned char *)a2 + v25);
  *(_OWORD *)(v26 + 8) = *(_OWORD *)((char *)a2 + v25 + 8);
  *(_OWORD *)(v26 + 24) = *(_OWORD *)((char *)a2 + v25 + 24);
  v26[40] = *((unsigned char *)a2 + v25 + 40);
  *((void *)v26 + 6) = *(void *)((char *)a2 + v25 + 48);
  v26[56] = *((unsigned char *)a2 + v25 + 56);
  uint64_t v28 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v29 = *(int *)(v28 + 28);
  uint64_t v30 = &v26[v29];
  uint64_t v31 = &v27[v29];
  uint64_t v32 = sub_252DC2D90();
  int v33 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v30, 1, v32);
  int v34 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v31, 1, v32);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v30, 0, 1, v32);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint64_t v35 = *(void *)(v32 - 8);
  if (v34)
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v30, v32);
LABEL_22:
    uint64_t v36 = sub_252D8823C(&qword_269CA9270);
    memcpy(v30, v31, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v30, v31, v32);
LABEL_23:
  uint64_t v37 = *(int *)(v28 + 32);
  uint64_t v38 = &v26[v37];
  uint64_t v39 = &v27[v37];
  uint64_t v40 = sub_252DC2DA0();
  int v41 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v38, 1, v40);
  int v42 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v39, 1, v40);
  if (!v41)
  {
    uint64_t v43 = *(void *)(v40 - 8);
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v43 + 40))(v38, v39, v40);
      goto LABEL_29;
    }
    (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v40);
    goto LABEL_28;
  }
  if (v42)
  {
LABEL_28:
    uint64_t v44 = sub_252D8823C(&qword_269CA9278);
    memcpy(v38, v39, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_29;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(v38, v39, v40);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v38, 0, 1, v40);
LABEL_29:
  uint64_t v45 = type metadata accessor for OnScreenContent.UIMetadata(0);
  v26[*(int *)(v45 + 20)] = v27[*(int *)(v45 + 20)];
  *(void *)&v26[*(int *)(v45 + 24)] = *(void *)&v27[*(int *)(v45 + 24)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnScreenContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D91F74);
}

uint64_t sub_252D91F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for OnScreenContent.Content(0);
  sub_252D97ED0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = type metadata accessor for OnScreenContent.UIMetadata(0);
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for OnScreenContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D92004);
}

uint64_t sub_252D92004()
{
  uint64_t v1 = sub_252D9820C();
  type metadata accessor for OnScreenContent.Content(v1);
  sub_252D97ED0();
  if (*(_DWORD *)(v2 + 84) != v0) {
    type metadata accessor for OnScreenContent.UIMetadata(0);
  }
  sub_252D981E8();

  return _s23IntelligenceFlowContext14DetectedEntityOwst_0(v3, v4, v5, v6);
}

uint64_t sub_252D92074()
{
  uint64_t result = type metadata accessor for OnScreenContent.Content(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for OnScreenContent.UIMetadata(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for OnScreenContent.Content(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_252DC2D70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6))
      {
        uint64_t v7 = sub_252D8823C(&qword_269CA9238);
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
      }
      uint64_t v15 = type metadata accessor for OnScreenContent.Image(0);
      *((unsigned char *)a1 + *(int *)(v15 + 20)) = *((unsigned char *)a2 + *(int *)(v15 + 20));
      uint64_t v16 = *(int *)(v15 + 24);
      uint64_t v17 = (char *)a1 + v16;
      uint64_t v18 = (char *)a2 + v16;
      uint64_t v19 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v18, 1, v19))
      {
        uint64_t v20 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v17, 0, 1, v19);
      }
    }
    else
    {
      *a1 = *a2;
      uint64_t v9 = (int *)type metadata accessor for OnScreenContent.Document(0);
      uint64_t v10 = v9[5];
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_252DC2D80();
      swift_retain();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v12, 1, v13))
      {
        uint64_t v14 = sub_252D8823C(&qword_269CA91E0);
        memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v11, 0, 1, v13);
      }
      uint64_t v21 = v9[6];
      uint64_t v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      uint64_t v24 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v23, 1, v24))
      {
        uint64_t v25 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v22, 0, 1, v24);
      }
      *((unsigned char *)a1 + v9[7]) = *((unsigned char *)a2 + v9[7]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for OnScreenContent.Content(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_252DC2D70();
    if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, 1, v2)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    }
    uint64_t v3 = *(int *)(type metadata accessor for OnScreenContent.Image(0) + 24);
  }
  else
  {
    swift_release();
    uint64_t v4 = type metadata accessor for OnScreenContent.Document(0);
    uint64_t v5 = a1 + *(int *)(v4 + 20);
    uint64_t v6 = sub_252DC2D80();
    if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v5, 1, v6)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
    }
    uint64_t v3 = *(int *)(v4 + 24);
  }
  uint64_t v7 = a1 + v3;
  uint64_t v8 = sub_252DC2FA0();
  uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v7, 1, v8);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v10(v7, v8);
  }
  return result;
}

void *initializeWithCopy for OnScreenContent.Content(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_252DC2D70();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v4))
    {
      uint64_t v5 = sub_252D8823C(&qword_269CA9238);
      memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v4);
    }
    uint64_t v12 = type metadata accessor for OnScreenContent.Image(0);
    *((unsigned char *)a1 + *(int *)(v12 + 20)) = *((unsigned char *)a2 + *(int *)(v12 + 20));
    uint64_t v13 = *(int *)(v12 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v14, 0, 1, v16);
    }
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = (int *)type metadata accessor for OnScreenContent.Document(0);
    uint64_t v7 = v6[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_252DC2D80();
    swift_retain();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = sub_252D8823C(&qword_269CA91E0);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
    }
    uint64_t v18 = v6[6];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v20, 1, v21))
    {
      uint64_t v22 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v19, 0, 1, v21);
    }
    *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for OnScreenContent.Content(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_252D8A718();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_252DC2D70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v4))
      {
        uint64_t v5 = sub_252D8823C(&qword_269CA9238);
        memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v4);
      }
      uint64_t v12 = type metadata accessor for OnScreenContent.Image(0);
      *((unsigned char *)a1 + *(int *)(v12 + 20)) = *((unsigned char *)a2 + *(int *)(v12 + 20));
      uint64_t v13 = *(int *)(v12 + 24);
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      uint64_t v16 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v16))
      {
        uint64_t v17 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v14, 0, 1, v16);
      }
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = (int *)type metadata accessor for OnScreenContent.Document(0);
      uint64_t v7 = v6[5];
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_252DC2D80();
      swift_retain();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
      {
        uint64_t v11 = sub_252D8823C(&qword_269CA91E0);
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
      }
      uint64_t v18 = v6[6];
      uint64_t v19 = (char *)a1 + v18;
      uint64_t v20 = (char *)a2 + v18;
      uint64_t v21 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v20, 1, v21))
      {
        uint64_t v22 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v19, 0, 1, v21);
      }
      *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for OnScreenContent.Content(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_252DC2D70();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v4))
    {
      uint64_t v5 = sub_252D8823C(&qword_269CA9238);
      memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v4);
    }
    uint64_t v12 = type metadata accessor for OnScreenContent.Image(0);
    *((unsigned char *)a1 + *(int *)(v12 + 20)) = *((unsigned char *)a2 + *(int *)(v12 + 20));
    uint64_t v13 = *(int *)(v12 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v14, 0, 1, v16);
    }
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = (int *)type metadata accessor for OnScreenContent.Document(0);
    uint64_t v7 = v6[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_252DC2D80();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = sub_252D8823C(&qword_269CA91E0);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
    }
    uint64_t v18 = v6[6];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v20, 1, v21))
    {
      uint64_t v22 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v19, 0, 1, v21);
    }
    *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithTake for OnScreenContent.Content(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_252D8A718();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_252DC2D70();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v4))
      {
        uint64_t v5 = sub_252D8823C(&qword_269CA9238);
        memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v4);
      }
      uint64_t v12 = type metadata accessor for OnScreenContent.Image(0);
      *((unsigned char *)a1 + *(int *)(v12 + 20)) = *((unsigned char *)a2 + *(int *)(v12 + 20));
      uint64_t v13 = *(int *)(v12 + 24);
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      uint64_t v16 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v16))
      {
        uint64_t v17 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v14, 0, 1, v16);
      }
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = (int *)type metadata accessor for OnScreenContent.Document(0);
      uint64_t v7 = v6[5];
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_252DC2D80();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
      {
        uint64_t v11 = sub_252D8823C(&qword_269CA91E0);
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
      }
      uint64_t v18 = v6[6];
      uint64_t v19 = (char *)a1 + v18;
      uint64_t v20 = (char *)a2 + v18;
      uint64_t v21 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v20, 1, v21))
      {
        uint64_t v22 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v19, 0, 1, v21);
      }
      *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_252D9335C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_252D9336C()
{
  uint64_t result = type metadata accessor for OnScreenContent.Document(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for OnScreenContent.Image(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for OnScreenContent.Document(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_252DC2D80();
    swift_retain();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = sub_252D8823C(&qword_269CA91E0);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v14, 0, 1, v16);
    }
    *((unsigned char *)v7 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return v7;
}

uint64_t destroy for OnScreenContent.Document(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_252DC2D80();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_252DC2FA0();
  uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v9(v6, v7);
  }
  return result;
}

void *initializeWithCopy for OnScreenContent.Document(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252DC2D80();
  swift_retain();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_252D8823C(&qword_269CA91E0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_252DC2FA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v12, 0, 1, v14);
  }
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

void *assignWithCopy for OnScreenContent.Document(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252DC2D80();
  int v10 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v7, 1, v9);
  int v11 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = sub_252D8823C(&qword_269CA91E0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_252DC2FA0();
  int v18 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v17);
  int v19 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17);
  if (!v18)
  {
    uint64_t v20 = *(void *)(v17 - 8);
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v15, v16, v17);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v17);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v21 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
LABEL_13:
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

void *initializeWithTake for OnScreenContent.Document(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252DC2D80();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_252D8823C(&qword_269CA91E0);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_252DC2FA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v12, 0, 1, v14);
  }
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

void *assignWithTake for OnScreenContent.Document(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252DC2D80();
  int v10 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v7, 1, v9);
  int v11 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = sub_252D8823C(&qword_269CA91E0);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_252DC2FA0();
  int v18 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v17);
  int v19 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17);
  if (!v18)
  {
    uint64_t v20 = *(void *)(v17 - 8);
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v15, v16, v17);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v17);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v21 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
LABEL_13:
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnScreenContent.Document(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D93FD0);
}

uint64_t sub_252D93FD0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    sub_252D8823C(&qword_269CA91E0);
    sub_252D97ED0();
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v11 = sub_252D8823C(&qword_269CA91E8);
      uint64_t v12 = *(int *)(a3 + 24);
    }
    return _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a1 + v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for OnScreenContent.Document(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D940A4);
}

void sub_252D940A4()
{
  sub_252D982EC();
  if (v2 == 2147483646)
  {
    *unint64_t v1 = v0;
  }
  else
  {
    int v3 = v2;
    sub_252D8823C(&qword_269CA91E0);
    sub_252D97ED0();
    if (*(_DWORD *)(v4 + 84) != v3) {
      sub_252D8823C(&qword_269CA91E8);
    }
    sub_252D981E8();
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v5, v6, v7, v8);
  }
}

void sub_252D9414C()
{
  sub_252D96CB4(319, &qword_269CA93B0, MEMORY[0x263F81A98]);
  if (v0 <= 0x3F)
  {
    sub_252D96CB4(319, &qword_26B23BFE0, MEMORY[0x263F80388]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for OnScreenContent.Image(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_252DC2D70();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = sub_252D8823C(&qword_269CA9238);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_252DC2FA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v12, 1, v13))
    {
      uint64_t v14 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v11, 0, 1, v13);
    }
  }
  return a1;
}

uint64_t destroy for OnScreenContent.Image(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DC2D70();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_252DC2FA0();
  uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v8(v5, v6);
  }
  return result;
}

char *initializeWithCopy for OnScreenContent.Image(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2D70();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_252D8823C(&qword_269CA9238);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_252DC2FA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

char *assignWithCopy for OnScreenContent.Image(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2D70();
  int v7 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_252D8823C(&qword_269CA9238);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_252DC2FA0();
  int v15 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v12, 1, v14);
  int v16 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v13, 1, v14);
  if (!v15)
  {
    uint64_t v17 = *(void *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 24))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v18 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v12, 0, 1, v14);
  return a1;
}

char *initializeWithTake for OnScreenContent.Image(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2D70();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_252D8823C(&qword_269CA9238);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_252DC2FA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

char *assignWithTake for OnScreenContent.Image(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2D70();
  int v7 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = sub_252D8823C(&qword_269CA9238);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_252DC2FA0();
  int v15 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v12, 1, v14);
  int v16 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v13, 1, v14);
  if (!v15)
  {
    uint64_t v17 = *(void *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v18 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v12, 0, 1, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnScreenContent.Image(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D94D20);
}

uint64_t sub_252D94D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_252D982EC();
  sub_252D8823C(&qword_269CA9238);
  sub_252D97ED0();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    if (v3 == 254)
    {
      unsigned int v10 = *(unsigned __int8 *)(v4 + *(int *)(a3 + 20));
      if (v10 >= 2) {
        return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = sub_252D8823C(&qword_269CA91E8);
    uint64_t v9 = v4 + *(int *)(a3 + 24);
  }

  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(v9, v3, v8);
}

uint64_t storeEnumTagSinglePayload for OnScreenContent.Image(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D94DF4);
}

void sub_252D94DF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_252D982EC();
  sub_252D8823C(&qword_269CA9238);
  sub_252D97ED0();
  if (*(_DWORD *)(v8 + 84) != a3)
  {
    if (a3 == 254)
    {
      *(unsigned char *)(v5 + *(int *)(a4 + 20)) = v4 + 1;
      return;
    }
    sub_252D8823C(&qword_269CA91E8);
  }
  sub_252D981E8();

  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v9, v10, v11, v12);
}

void sub_252D94E9C()
{
  sub_252D96CB4(319, &qword_269CA93C8, MEMORY[0x263F81938]);
  if (v0 <= 0x3F)
  {
    sub_252D96CB4(319, &qword_26B23BFE0, MEMORY[0x263F80388]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *initializeBufferWithCopyOfBuffer for OnScreenContent.UIMetadata(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *char v4 = *a2;
    char v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    uint64_t v7 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
    uint64_t v8 = *(int *)(v7 + 28);
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_252DC2D90();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = sub_252D8823C(&qword_269CA9270);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = *(int *)(v7 + 32);
    int v15 = (char *)v4 + v14;
    int v16 = (char *)a2 + v14;
    uint64_t v17 = sub_252DC2DA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17))
    {
      uint64_t v18 = sub_252D8823C(&qword_269CA9278);
      memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
    }
    uint64_t v19 = *(int *)(a3 + 24);
    *((unsigned char *)v4 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *(void *)((char *)v4 + v19) = *(uint64_t *)((char *)a2 + v19);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for OnScreenContent.UIMetadata(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v3 = a1 + *(int *)(v2 + 28);
  uint64_t v4 = sub_252DC2D90();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  }
  uint64_t v5 = a1 + *(int *)(v2 + 32);
  uint64_t v6 = sub_252DC2DA0();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for OnScreenContent.UIMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_252DC2D90();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_252D8823C(&qword_269CA9270);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(v6 + 32);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_252DC2DA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_252D8823C(&qword_269CA9278);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v13, 0, 1, v15);
  }
  uint64_t v17 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for OnScreenContent.UIMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v6 = *(_OWORD *)(a2 + 8);
  long long v7 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 8) = v6;
  uint64_t v8 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v10 = *(int *)(v9 + 28);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (const void *)(a2 + v10);
  uint64_t v13 = sub_252DC2D90();
  int v14 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v13);
  int v15 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v12, 1, v13);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v16 = *(void *)(v13 - 8);
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v11, v13);
LABEL_6:
    uint64_t v17 = sub_252D8823C(&qword_269CA9270);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v16 + 24))(v11, v12, v13);
LABEL_7:
  uint64_t v18 = *(int *)(v9 + 32);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = sub_252DC2DA0();
  int v22 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v19, 1, v21);
  int v23 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v20, 1, v21);
  if (!v22)
  {
    uint64_t v24 = *(void *)(v21 - 8);
    if (!v23)
    {
      (*(void (**)(void *, const void *, uint64_t))(v24 + 24))(v19, v20, v21);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v24 + 8))(v19, v21);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v25 = sub_252D8823C(&qword_269CA9278);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v19, 0, 1, v21);
LABEL_13:
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for OnScreenContent.UIMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_252DC2D90();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_252D8823C(&qword_269CA9270);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(v6 + 32);
  uint64_t v13 = (void *)(a1 + v12);
  int v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_252DC2DA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_252D8823C(&qword_269CA9278);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v13, 0, 1, v15);
  }
  uint64_t v17 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  return a1;
}

uint64_t assignWithTake for OnScreenContent.UIMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_252DC2D90();
  int v11 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v10);
  int v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_252D8823C(&qword_269CA9270);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = *(int *)(v6 + 32);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_252DC2DA0();
  int v19 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v18);
  int v20 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18);
  if (!v19)
  {
    uint64_t v21 = *(void *)(v18 - 8);
    if (!v20)
    {
      (*(void (**)(void *, const void *, uint64_t))(v21 + 40))(v16, v17, v18);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v16, v18);
    goto LABEL_12;
  }
  if (v20)
  {
LABEL_12:
    uint64_t v22 = sub_252D8823C(&qword_269CA9278);
    memcpy(v16, v17, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
LABEL_13:
  uint64_t v23 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnScreenContent.UIMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D95C80);
}

uint64_t sub_252D95C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  sub_252D97ED0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return _s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for OnScreenContent.UIMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D95D20);
}

void sub_252D95D20()
{
  uint64_t v4 = sub_252D9820C();
  type metadata accessor for OnScreenContent.UIMetadata.Window(v4);
  sub_252D97ED0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    sub_252D981E8();
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v6, v7, v8, v9);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 24)) = (v0 - 1);
  }
}

uint64_t sub_252D95D94()
{
  uint64_t result = type metadata accessor for OnScreenContent.UIMetadata.Window(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    long long v7 = *(_OWORD *)(a2 + 3);
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    *(_OWORD *)(a1 + 24) = v7;
    uint64_t v11 = sub_252DC2D90();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = sub_252D8823C(&qword_269CA9270);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = *(int *)(a3 + 32);
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_252DC2DA0();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17))
    {
      uint64_t v18 = sub_252D8823C(&qword_269CA9278);
      memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t destroy for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_252DC2D90();
  if (!_s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t v7 = sub_252DC2DA0();
  uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v9(v6, v7);
  }
  return result;
}

uint64_t initializeWithCopy for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 24) = v6;
  uint64_t v10 = sub_252DC2D90();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_252D8823C(&qword_269CA9270);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(a3 + 32);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_252DC2DA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_252D8823C(&qword_269CA9278);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v13, 0, 1, v15);
  }
  return a1;
}

uint64_t assignWithCopy for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v6 = *(_OWORD *)(a2 + 8);
  long long v7 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 8) = v6;
  uint64_t v8 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_252DC2D90();
  int v13 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v12);
  int v14 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v12);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    uint64_t v16 = sub_252D8823C(&qword_269CA9270);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v15 + 24))(v10, v11, v12);
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 32);
  uint64_t v18 = (void *)(a1 + v17);
  int v19 = (const void *)(a2 + v17);
  uint64_t v20 = sub_252DC2DA0();
  int v21 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v18, 1, v20);
  int v22 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v19, 1, v20);
  if (!v21)
  {
    uint64_t v23 = *(void *)(v20 - 8);
    if (!v22)
    {
      (*(void (**)(void *, const void *, uint64_t))(v23 + 24))(v18, v19, v20);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v23 + 8))(v18, v20);
    goto LABEL_12;
  }
  if (v22)
  {
LABEL_12:
    uint64_t v24 = sub_252D8823C(&qword_269CA9278);
    memcpy(v18, v19, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v18, 0, 1, v20);
  return a1;
}

uint64_t initializeWithTake for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 24) = v6;
  uint64_t v10 = sub_252DC2D90();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = sub_252D8823C(&qword_269CA9270);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = *(int *)(a3 + 32);
  int v13 = (void *)(a1 + v12);
  int v14 = (const void *)(a2 + v12);
  uint64_t v15 = sub_252DC2DA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_252D8823C(&qword_269CA9278);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v13, 0, 1, v15);
  }
  return a1;
}

uint64_t assignWithTake for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 24) = v6;
  uint64_t v10 = sub_252DC2D90();
  int v11 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v10);
  int v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_252D8823C(&qword_269CA9270);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_252DC2DA0();
  int v19 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v18);
  int v20 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18);
  if (!v19)
  {
    uint64_t v21 = *(void *)(v18 - 8);
    if (!v20)
    {
      (*(void (**)(void *, const void *, uint64_t))(v21 + 40))(v16, v17, v18);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v16, v18);
    goto LABEL_12;
  }
  if (v20)
  {
LABEL_12:
    uint64_t v22 = sub_252D8823C(&qword_269CA9278);
    memcpy(v16, v17, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D96A28);
}

uint64_t sub_252D96A28(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_252D8823C(&qword_269CA9270);
    sub_252D97ED0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(int *)(a3 + 28);
    }
    else
    {
      uint64_t v12 = sub_252D8823C(&qword_269CA9278);
      uint64_t v13 = *(int *)(a3 + 32);
    }
    return _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a1[v13], a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for OnScreenContent.UIMetadata.Window(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D96AF0);
}

void sub_252D96AF0()
{
  sub_252D982EC();
  if (v2 == 254)
  {
    *unint64_t v1 = v0 + 1;
  }
  else
  {
    int v3 = v2;
    sub_252D8823C(&qword_269CA9270);
    sub_252D97ED0();
    if (*(_DWORD *)(v4 + 84) != v3) {
      sub_252D8823C(&qword_269CA9278);
    }
    sub_252D981E8();
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v5, v6, v7, v8);
  }
}

void sub_252D96B94()
{
  sub_252D96CB4(319, &qword_269CA93F0, MEMORY[0x263F81B08]);
  if (v0 <= 0x3F)
  {
    sub_252D96CB4(319, &qword_269CA93F8, MEMORY[0x263F81B48]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_252D96CB4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_252DC3160();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

ValueMetadata *type metadata accessor for OnScreenContent.CodingKeys()
{
  return &type metadata for OnScreenContent.CodingKeys;
}

ValueMetadata *type metadata accessor for OnScreenContent.UIMetadata.CodingKeys()
{
  return &type metadata for OnScreenContent.UIMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for OnScreenContent.UIMetadata.Window.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for OnScreenContent.UIMetadata.Window.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x252D96E8CLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnScreenContent.UIMetadata.Window.CodingKeys()
{
  return &type metadata for OnScreenContent.UIMetadata.Window.CodingKeys;
}

unsigned char *_s23IntelligenceFlowContext15OnScreenContentV10UIMetadataV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D96F90);
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

ValueMetadata *type metadata accessor for OnScreenContent.Image.CodingKeys()
{
  return &type metadata for OnScreenContent.Image.CodingKeys;
}

uint64_t getEnumTagSinglePayload for OnScreenContent.Document.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for OnScreenContent.Document.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D9711CLL);
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

ValueMetadata *type metadata accessor for OnScreenContent.Document.CodingKeys()
{
  return &type metadata for OnScreenContent.Document.CodingKeys;
}

uint64_t getEnumTagSinglePayload for UIContextOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s23IntelligenceFlowContext15OnScreenContentV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D972A8);
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

unsigned char *sub_252D972D0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OnScreenContent.Content.CodingKeys()
{
  return &type metadata for OnScreenContent.Content.CodingKeys;
}

uint64_t sub_252D972F8()
{
  return 0;
}

ValueMetadata *type metadata accessor for OnScreenContent.Content.DocumentCodingKeys()
{
  return &type metadata for OnScreenContent.Content.DocumentCodingKeys;
}

uint64_t _s23IntelligenceFlowContext15OnScreenContentV7ContentO18DocumentCodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s23IntelligenceFlowContext15OnScreenContentV7ContentO18DocumentCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252D973FCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for OnScreenContent.Content.ImageCodingKeys()
{
  return &type metadata for OnScreenContent.Content.ImageCodingKeys;
}

unint64_t sub_252D97438()
{
  unint64_t result = qword_269CA9400;
  if (!qword_269CA9400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9400);
  }
  return result;
}

unint64_t sub_252D97488()
{
  unint64_t result = qword_269CA9408;
  if (!qword_269CA9408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9408);
  }
  return result;
}

unint64_t sub_252D974D8()
{
  unint64_t result = qword_269CA9410;
  if (!qword_269CA9410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9410);
  }
  return result;
}

unint64_t sub_252D97528()
{
  unint64_t result = qword_269CA9418;
  if (!qword_269CA9418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9418);
  }
  return result;
}

unint64_t sub_252D97578()
{
  unint64_t result = qword_269CA9420;
  if (!qword_269CA9420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9420);
  }
  return result;
}

unint64_t sub_252D975C8()
{
  unint64_t result = qword_269CA9428;
  if (!qword_269CA9428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9428);
  }
  return result;
}

unint64_t sub_252D97618()
{
  unint64_t result = qword_269CA9430;
  if (!qword_269CA9430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9430);
  }
  return result;
}

unint64_t sub_252D97668()
{
  unint64_t result = qword_269CA9438;
  if (!qword_269CA9438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9438);
  }
  return result;
}

unint64_t sub_252D976B8()
{
  unint64_t result = qword_269CA9440;
  if (!qword_269CA9440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9440);
  }
  return result;
}

unint64_t sub_252D97708()
{
  unint64_t result = qword_269CA9448;
  if (!qword_269CA9448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9448);
  }
  return result;
}

unint64_t sub_252D97758()
{
  unint64_t result = qword_269CA9450;
  if (!qword_269CA9450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9450);
  }
  return result;
}

unint64_t sub_252D977A8()
{
  unint64_t result = qword_269CA9458;
  if (!qword_269CA9458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9458);
  }
  return result;
}

unint64_t sub_252D977F8()
{
  unint64_t result = qword_269CA9460;
  if (!qword_269CA9460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9460);
  }
  return result;
}

unint64_t sub_252D97848()
{
  unint64_t result = qword_269CA9468;
  if (!qword_269CA9468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9468);
  }
  return result;
}

unint64_t sub_252D97898()
{
  unint64_t result = qword_269CA9470;
  if (!qword_269CA9470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9470);
  }
  return result;
}

unint64_t sub_252D978E8()
{
  unint64_t result = qword_269CA9478;
  if (!qword_269CA9478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9478);
  }
  return result;
}

unint64_t sub_252D97938()
{
  unint64_t result = qword_269CA9480;
  if (!qword_269CA9480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9480);
  }
  return result;
}

unint64_t sub_252D97988()
{
  unint64_t result = qword_269CA9488;
  if (!qword_269CA9488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9488);
  }
  return result;
}

unint64_t sub_252D979D8()
{
  unint64_t result = qword_269CA9490;
  if (!qword_269CA9490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9490);
  }
  return result;
}

unint64_t sub_252D97A28()
{
  unint64_t result = qword_269CA9498;
  if (!qword_269CA9498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9498);
  }
  return result;
}

unint64_t sub_252D97A78()
{
  unint64_t result = qword_269CA94A0;
  if (!qword_269CA94A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA94A0);
  }
  return result;
}

unint64_t sub_252D97AC8()
{
  unint64_t result = qword_269CA94A8;
  if (!qword_269CA94A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA94A8);
  }
  return result;
}

unint64_t sub_252D97B18()
{
  unint64_t result = qword_269CA94B0;
  if (!qword_269CA94B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA94B0);
  }
  return result;
}

unint64_t sub_252D97B68()
{
  unint64_t result = qword_269CA94B8;
  if (!qword_269CA94B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA94B8);
  }
  return result;
}

uint64_t sub_252D97BB8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_252D97C34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v5 = *(void *)(a1 + 120);
  uint64_t v6 = *(void *)(a1 + 128);
  uint64_t v7 = *(void *)(a1 + 136);
  uint64_t v10 = *(void *)(a1 + 88);
  unsigned __int8 v8 = *(unsigned char *)(a1 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_252D97CE4(v10, v2, v3, v4, v5, v6, v7, v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_252D97CE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 a8)
{
  if (a8 != 255) {
    return sub_252D97CFC(result, a2, a3, a4, a5, a6, a7, a8 & 1);
  }
  return result;
}

uint64_t sub_252D97CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a8 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_252D97D64(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v5 = *(void *)(a1 + 120);
  uint64_t v6 = *(void *)(a1 + 128);
  uint64_t v7 = *(void *)(a1 + 136);
  uint64_t v10 = *(void *)(a1 + 88);
  unsigned __int8 v8 = *(unsigned char *)(a1 + 144);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_252D97E14(v10, v2, v3, v4, v5, v6, v7, v8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_252D97E14(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 a8)
{
  if (a8 != 255) {
    return sub_252D97E2C(result, a2, a3, a4, a5, a6, a7, a8 & 1);
  }
  return result;
}

uint64_t sub_252D97E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D97F10()
{
  return v0;
}

void *sub_252D97F3C()
{
  return sub_252D88F0C(v0, v0[3]);
}

uint64_t sub_252D97F60()
{
  return sub_252DC33E0();
}

uint64_t sub_252D97F80(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_252D97F8C()
{
  return 0;
}

void sub_252D97FA8(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_252D97FC4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_252D98038()
{
  *(unsigned char *)(v0 - 66) = 1;
  return sub_252DC3320();
}

uint64_t sub_252D9809C()
{
  return v0;
}

uint64_t sub_252D980B4()
{
  return 0;
}

uint64_t sub_252D980C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s23IntelligenceFlowContext14DetectedEntityOwst_0(a1, 1, 1, a4);
}

uint64_t sub_252D980E8()
{
  return sub_252DC3340();
}

uint64_t sub_252D98134()
{
  return 0;
}

void sub_252D98150(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_252D9816C()
{
  return type metadata accessor for OnScreenContent.Content(0);
}

uint64_t sub_252D981F4()
{
  return sub_252DC3380();
}

uint64_t sub_252D9820C()
{
  return 0;
}

uint64_t sub_252D98224()
{
  return v0;
}

uint64_t sub_252D9823C()
{
  return sub_252DC3300();
}

uint64_t sub_252D98254()
{
  return v0;
}

void sub_252D9826C()
{
  v0[7] = v0[69];
  v0[8] = v1;
}

uint64_t sub_252D98284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, a2, a3);
}

uint64_t sub_252D9829C()
{
  return sub_252DC33A0();
}

uint64_t sub_252D982B4()
{
  return sub_252DC33A0();
}

uint64_t sub_252D982F8()
{
  return v0;
}

uint64_t sub_252D9830C()
{
  return 0;
}

uint64_t sub_252D98324()
{
  return v0;
}

uint64_t sub_252D98338()
{
  return v0;
}

uint64_t sub_252D98358()
{
  return sub_252DC32B0();
}

uint64_t sub_252D98378()
{
  return sub_252DC32D0();
}

uint64_t sub_252D98398()
{
  return v0;
}

uint64_t sub_252D983AC()
{
  return v0;
}

uint64_t sub_252D983C0(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_252D983CC()
{
  return sub_252DC3230();
}

void OnScreenContent.EntityFormat.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)v1;
  if (*(unsigned char *)(v1 + 8))
  {
    if (*(unsigned char *)(v1 + 8) == 1)
    {
      sub_252DC3390();
      sub_252D9A3F0();
    }
    else
    {
      sub_252DC3390();
    }
  }
  else
  {
    sub_252DC3390();
    sub_252D8FB2C(a1, v3);
  }
}

uint64_t static OnScreenContent.EntityFormat.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  int v3 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v4 = *(void *)a2;
  int v5 = *(unsigned __int8 *)(a2 + 8);
  if (!*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8))
    {
      sub_252D9A618(*(void *)a2, 0);
      sub_252D9A618(v2, 0);
      sub_252D8E160();
      char v7 = v10;
      sub_252D9A62C(v2, 0);
      uint64_t v8 = v4;
      unsigned __int8 v9 = 0;
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      sub_252D9A618(*(void *)a2, 1u);
      sub_252D9A618(v2, 1u);
      sub_252D98CC0();
      char v7 = v6;
      sub_252D9A62C(v2, 1u);
      uint64_t v8 = v4;
      unsigned __int8 v9 = 1;
LABEL_7:
      sub_252D9A62C(v8, v9);
      return v7 & 1;
    }
    goto LABEL_12;
  }
  if (v5 != 2 || v4 != 0)
  {
LABEL_12:
    sub_252D9A618(*(void *)a2, *(unsigned char *)(a2 + 8));
    sub_252D9A618(v2, v3);
    sub_252D9A62C(v2, v3);
    sub_252D9A62C(v4, v5);
    return 0;
  }
  sub_252D9A62C(*(void *)a1, 2u);
  sub_252D9A62C(0, 2u);
  return 1;
}

void sub_252D985DC()
{
  sub_252D9806C();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_252DC2F30();
  sub_252D89934();
  uint64_t v77 = v5;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v84 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v68 - v9;
  uint64_t v79 = v3;
  if (v3 == v1 || *(void *)(v79 + 16) != *(void *)(v1 + 16)) {
    goto LABEL_71;
  }
  uint64_t v70 = v79 + 56;
  sub_252D9B124();
  unint64_t v14 = v13 & v12;
  int64_t v71 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v75 = v1 + 56;
  uint64_t v16 = v77 + 16;
  v81 = (void (**)(char *, uint64_t))(v77 + 8);
  uint64_t v72 = v1;
  if (!v14) {
    goto LABEL_5;
  }
  while (2)
  {
    uint64_t v73 = (v14 - 1) & v14;
    int64_t v74 = v11;
    unint64_t v17 = __clz(__rbit64(v14)) | (v11 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v79 + 48) + 16 * v17;
    uint64_t v26 = *(void *)v25;
    int v27 = *(unsigned __int8 *)(v25 + 8);
    sub_252DC3380();
    uint64_t v85 = v26;
    int v86 = v27;
    if (v27)
    {
      sub_252DC3390();
      if (v27 == 1)
      {
        swift_bridgeObjectRetain();
        sub_252D9A3F0();
      }
    }
    else
    {
      uint64_t v28 = v77;
      sub_252DC3390();
      uint64_t v29 = *(void *)(v26 + 16);
      sub_252DC3390();
      if (v29)
      {
        unint64_t v30 = v26 + ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80));
        uint64_t v31 = *(void *)(v28 + 72);
        sub_252D9AFF8(&qword_269CA94C8, MEMORY[0x263F8F3A0]);
        swift_bridgeObjectRetain();
        do
        {
          sub_252DC3040();
          v30 += v31;
          --v29;
        }
        while (v29);
      }
      else
      {
        swift_bridgeObjectRetain();
      }
    }
    uint64_t v32 = sub_252DC33C0();
    uint64_t v33 = -1 << *(unsigned char *)(v1 + 32);
    unint64_t v34 = v32 & ~v33;
    uint64_t v35 = v75;
    uint64_t v36 = v85;
    int v37 = v86;
    if (((*(void *)(v75 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0)
    {
LABEL_70:
      sub_252D9A62C(v36, v37);
      goto LABEL_71;
    }
    uint64_t v83 = ~v33;
    BOOL v38 = v86 == 2;
    BOOL v39 = v85 == 1 && v86 == 2;
    BOOL v78 = v39;
    if (v85) {
      BOOL v38 = 0;
    }
    BOOL v76 = v38;
    while (1)
    {
      uint64_t v40 = *(void *)(v1 + 48) + 16 * v34;
      uint64_t v41 = *(void *)v40;
      int v42 = *(unsigned __int8 *)(v40 + 8);
      if (!*(unsigned char *)(v40 + 8)) {
        break;
      }
      if (v42 != 1)
      {
        if (v41)
        {
          if (v78)
          {
            sub_252D9A62C(1, 2u);
            uint64_t v64 = 1;
            goto LABEL_63;
          }
        }
        else if (v76)
        {
          sub_252D9A62C(0, 2u);
          uint64_t v64 = 0;
LABEL_63:
          unsigned __int8 v65 = 2;
LABEL_64:
          sub_252D9A62C(v64, v65);
          goto LABEL_67;
        }
LABEL_56:
        sub_252D9A618(v36, v37);
        sub_252D9A618(v41, v42);
        sub_252D9A62C(v41, v42);
        uint64_t v60 = v36;
        unsigned __int8 v61 = v37;
LABEL_57:
        sub_252D9A62C(v60, v61);
        goto LABEL_58;
      }
      if (v37 != 1) {
        goto LABEL_56;
      }
      sub_252D9A618(*(void *)v40, 1u);
      sub_252D9A618(v36, 1u);
      sub_252D9A618(v41, 1u);
      sub_252D98CC0();
      char v44 = v43;
      sub_252D9A62C(v41, 1u);
      sub_252D9A62C(v36, 1u);
      sub_252D9A62C(v41, 1u);
      if (v44)
      {
        uint64_t v64 = v36;
        unsigned __int8 v65 = 1;
        goto LABEL_64;
      }
LABEL_58:
      unint64_t v34 = (v34 + 1) & v83;
      int v37 = v86;
      if (((*(void *)(v35 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
        goto LABEL_70;
      }
    }
    if (v37) {
      goto LABEL_56;
    }
    uint64_t v45 = *(void *)(v41 + 16);
    if (v45 != *(void *)(v36 + 16))
    {
      sub_252D9B1B0();
      uint64_t v60 = sub_252D9B234();
      goto LABEL_57;
    }
    if (v45 && v41 != v36)
    {
      unint64_t v69 = v34;
      uint64_t v87 = v41;
      uint64_t v46 = v77;
      unint64_t v47 = (*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
      sub_252D9A618(v87, 0);
      sub_252D9A618(v36, 0);
      sub_252D9A618(v87, 0);
      unint64_t v48 = 0;
      uint64_t v80 = *(void *)(v46 + 72);
      v82 = *(void (**)(char *, unint64_t, uint64_t))(v46 + 16);
      uint64_t v49 = v87;
      while (1)
      {
        unint64_t v50 = v49 + v47;
        uint64_t v51 = v82;
        v82(v10, v50, v4);
        if (v48 >= *(void *)(v36 + 16)) {
          break;
        }
        uint64_t v52 = v45;
        unint64_t v53 = v36 + v47;
        uint64_t v54 = v4;
        uint64_t v55 = v84;
        uint64_t v56 = v16;
        v51(v84, v53, v54);
        sub_252D9AFF8(&qword_269CA94C0, MEMORY[0x263F8F3A0]);
        char v57 = sub_252DC3060();
        uint64_t v58 = *v81;
        int v59 = v55;
        uint64_t v4 = v54;
        (*v81)(v59, v54);
        v58(v10, v54);
        if ((v57 & 1) == 0)
        {
          uint64_t v62 = v87;
          sub_252D9A62C(v87, 0);
          uint64_t v63 = v85;
          sub_252D9A62C(v85, 0);
          sub_252D9A62C(v62, 0);
          uint64_t v1 = v72;
          uint64_t v35 = v75;
          uint64_t v16 = v56;
          uint64_t v36 = v63;
          unint64_t v34 = v69;
          goto LABEL_58;
        }
        ++v48;
        v47 += v80;
        uint64_t v45 = v52;
        uint64_t v16 = v56;
        uint64_t v36 = v85;
        uint64_t v49 = v87;
        if (v52 == v48) {
          goto LABEL_66;
        }
      }
      __break(1u);
      goto LABEL_73;
    }
    sub_252D9B1B0();
LABEL_66:
    uint64_t v66 = sub_252D9B234();
    sub_252D9A62C(v66, v67);
    sub_252D9A62C(v36, 0);
    uint64_t v1 = v72;
LABEL_67:
    uint64_t v11 = v74;
    unint64_t v14 = v73;
    if (v73) {
      continue;
    }
    break;
  }
LABEL_5:
  if (__OFADD__(v11, 1))
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  if (v11 + 1 >= v71) {
    goto LABEL_71;
  }
  sub_252D9B35C();
  if (v18) {
    goto LABEL_21;
  }
  sub_252D9B2A4();
  if (v20 == v21) {
    goto LABEL_71;
  }
  sub_252D9B294();
  if (v18) {
    goto LABEL_21;
  }
  sub_252D9B2A4();
  if (v20 == v21) {
    goto LABEL_71;
  }
  sub_252D9B294();
  if (v18) {
    goto LABEL_21;
  }
  int64_t v23 = v22 + 3;
  if (v23 >= v71)
  {
LABEL_71:
    sub_252D98084();
    return;
  }
  unint64_t v18 = *(void *)(v70 + 8 * v23);
  if (v18)
  {
    int64_t v19 = v23;
LABEL_21:
    uint64_t v73 = (v18 - 1) & v18;
    int64_t v74 = v19;
    unint64_t v17 = __clz(__rbit64(v18)) + (v19 << 6);
    goto LABEL_22;
  }
  while (!__OFADD__(v23, 1))
  {
    sub_252D9B2A4();
    if (v20 == v21) {
      goto LABEL_71;
    }
    sub_252D9B294();
    int64_t v23 = v24 + 1;
    if (v18) {
      goto LABEL_21;
    }
  }
LABEL_74:
  __break(1u);
}

void sub_252D98CC0()
{
  sub_252D9806C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_252DC2D60();
  sub_252D89934();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_252D9B218();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  sub_252D9B264(v10, v11, v12, v13, v14, v15, v16, v17, v35);
  MEMORY[0x270FA5388](v18);
  sub_252D9B348();
  if (v19 || *(void *)(v4 + 16) != *(void *)(v2 + 16))
  {
LABEL_29:
    sub_252D98084();
  }
  else
  {
    sub_252D9B044();
    if (!v21) {
      goto LABEL_5;
    }
LABEL_4:
    sub_252D9B194();
    while (1)
    {
      uint64_t v28 = (void (*)(void))*((void *)v7 + 2);
      sub_252D9B0EC();
      v28();
      uint64_t v29 = sub_252D9B100();
      v30(v29);
      sub_252D9AFF8(&qword_269CA95E0, MEMORY[0x263F818F8]);
      sub_252D9B310();
      sub_252D9B0BC();
      if ((v31 & 1) == 0)
      {
        (*v0)(v37, v5);
        goto LABEL_29;
      }
      while (1)
      {
        sub_252D9B0EC();
        v28();
        sub_252D9AFF8(&qword_269CA95E8, MEMORY[0x263F818F8]);
        char v32 = sub_252D9B2B4();
        uint64_t v7 = *v0;
        sub_252D9B144();
        ((void (*)(void))v7)();
        if (v32) {
          break;
        }
        sub_252D9B174();
        if ((v33 & 1) == 0)
        {
          v7(v37, v5);
          goto LABEL_29;
        }
      }
      sub_252D9B144();
      ((void (*)(void))v7)();
      sub_252D9B388();
      if (v34) {
        goto LABEL_4;
      }
LABEL_5:
      if (__OFADD__(v20, 1))
      {
        __break(1u);
        goto LABEL_32;
      }
      sub_252D9B33C();
      if (v22 == v23) {
        goto LABEL_29;
      }
      sub_252D9B35C();
      if (!v24)
      {
        sub_252D9B1F0();
        if (v22 == v23) {
          goto LABEL_29;
        }
        sub_252D9B330();
        if (!v24)
        {
          sub_252D9B1F0();
          if (v22 == v23) {
            goto LABEL_29;
          }
          sub_252D9B330();
          if (!v24)
          {
            sub_252D9B33C();
            if (v22 == v23) {
              goto LABEL_29;
            }
            uint64_t v24 = *(void *)(v36 + 8 * v25);
            if (!v24) {
              break;
            }
          }
        }
      }
LABEL_22:
      sub_252D9B1FC(v24);
    }
    while (!__OFADD__(v25, 1))
    {
      sub_252D9B1F0();
      if (v22 == v23) {
        goto LABEL_29;
      }
      uint64_t v24 = *(void *)(v36 + 8 * v27);
      uint64_t v25 = v26 + 1;
      if (v24) {
        goto LABEL_22;
      }
    }
LABEL_32:
    __break(1u);
  }
}

void sub_252D98F38(uint64_t a1, uint64_t a2)
{
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  uint64_t v31 = a1 + 56;
  sub_252D9B124();
  unint64_t v7 = v6 & v5;
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v9 = a2 + 56;
  if ((v6 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  int64_t v33 = v4;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v14 << 6))
  {
    uint64_t v16 = v3;
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_252DC3380();
    swift_bridgeObjectRetain();
    sub_252DC30A0();
    uint64_t v20 = sub_252DC33C0();
    uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v22 = v20 & ~v21;
    if (((*(void *)(v9 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
      goto LABEL_36;
    }
    uint64_t v23 = *(void *)(a2 + 48);
    uint64_t v24 = (void *)(v23 + 16 * v22);
    BOOL v25 = *v24 == v19 && v24[1] == v18;
    if (!v25 && (sub_252DC3360() & 1) == 0)
    {
      uint64_t v26 = ~v21;
      for (unint64_t j = v22 + 1; ; unint64_t j = v28 + 1)
      {
        uint64_t v28 = j & v26;
        if (((*(void *)(v9 + (((j & v26) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v26)) & 1) == 0) {
          break;
        }
        uint64_t v29 = (void *)(v23 + 16 * v28);
        BOOL v30 = *v29 == v19 && v29[1] == v18;
        if (v30 || (sub_252DC3360() & 1) != 0) {
          goto LABEL_25;
        }
      }
LABEL_36:
      swift_bridgeObjectRelease();
      return;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    int64_t v4 = v33;
    if (v7) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v4 + 1 >= v32) {
      return;
    }
    sub_252D9B35C();
    if (!v12)
    {
      int64_t v14 = v13 + 1;
      if (v13 + 1 >= v32) {
        return;
      }
      unint64_t v12 = *(void *)(v31 + 8 * v14);
      if (!v12)
      {
        int64_t v14 = v13 + 2;
        if (v13 + 2 >= v32) {
          return;
        }
        unint64_t v12 = *(void *)(v31 + 8 * v14);
        if (!v12) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v7 = (v12 - 1) & v12;
    int64_t v33 = v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v32) {
    return;
  }
  unint64_t v12 = *(void *)(v31 + 8 * v15);
  if (v12)
  {
    int64_t v14 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v32) {
      return;
    }
    unint64_t v12 = *(void *)(v31 + 8 * v14);
    ++v15;
    if (v12) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
}

void sub_252D991A8()
{
  sub_252D9806C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_252DC2F30();
  sub_252D89934();
  unint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  sub_252D9B218();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  sub_252D9B264(v10, v11, v12, v13, v14, v15, v16, v17, v35);
  MEMORY[0x270FA5388](v18);
  sub_252D9B348();
  if (v19 || *(void *)(v4 + 16) != *(void *)(v2 + 16))
  {
LABEL_29:
    sub_252D98084();
  }
  else
  {
    sub_252D9B044();
    if (!v21) {
      goto LABEL_5;
    }
LABEL_4:
    sub_252D9B194();
    while (1)
    {
      uint64_t v28 = (void (*)(void))*((void *)v7 + 2);
      sub_252D9B0EC();
      v28();
      uint64_t v29 = sub_252D9B100();
      v30(v29);
      sub_252D9AFF8(&qword_269CA94C8, MEMORY[0x263F8F3A0]);
      sub_252D9B310();
      sub_252D9B0BC();
      if ((v31 & 1) == 0)
      {
        (*v0)(v37, v5);
        goto LABEL_29;
      }
      while (1)
      {
        sub_252D9B0EC();
        v28();
        sub_252D9AFF8(&qword_269CA94C0, MEMORY[0x263F8F3A0]);
        char v32 = sub_252D9B2B4();
        unint64_t v7 = *v0;
        sub_252D9B144();
        ((void (*)(void))v7)();
        if (v32) {
          break;
        }
        sub_252D9B174();
        if ((v33 & 1) == 0)
        {
          v7(v37, v5);
          goto LABEL_29;
        }
      }
      sub_252D9B144();
      ((void (*)(void))v7)();
      sub_252D9B388();
      if (v34) {
        goto LABEL_4;
      }
LABEL_5:
      if (__OFADD__(v20, 1))
      {
        __break(1u);
        goto LABEL_32;
      }
      sub_252D9B33C();
      if (v22 == v23) {
        goto LABEL_29;
      }
      sub_252D9B35C();
      if (!v24)
      {
        sub_252D9B1F0();
        if (v22 == v23) {
          goto LABEL_29;
        }
        sub_252D9B330();
        if (!v24)
        {
          sub_252D9B1F0();
          if (v22 == v23) {
            goto LABEL_29;
          }
          sub_252D9B330();
          if (!v24)
          {
            sub_252D9B33C();
            if (v22 == v23) {
              goto LABEL_29;
            }
            uint64_t v24 = *(void *)(v36 + 8 * v25);
            if (!v24) {
              break;
            }
          }
        }
      }
LABEL_22:
      sub_252D9B1FC(v24);
    }
    while (!__OFADD__(v25, 1))
    {
      sub_252D9B1F0();
      if (v22 == v23) {
        goto LABEL_29;
      }
      uint64_t v24 = *(void *)(v36 + 8 * v27);
      uint64_t v25 = v26 + 1;
      if (v24) {
        goto LABEL_22;
      }
    }
LABEL_32:
    __break(1u);
  }
}

uint64_t sub_252D99420(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6710384 && a2 == 0xE300000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x746E656D75636F64 && a2 == 0xE800000000000000;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6567616D69 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_252DC3360();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_252D99558(char a1)
{
  if (!a1) {
    return 6710384;
  }
  if (a1 == 1) {
    return 0x746E656D75636F64;
  }
  return 0x6567616D69;
}

uint64_t sub_252D995A4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E65736572706572 && a2 == 0xEF736E6F69746174)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252D99650()
{
  return sub_252DC33C0();
}

uint64_t sub_252D99694()
{
  return 0x6E65736572706572;
}

uint64_t sub_252D996B8()
{
  return 1;
}

uint64_t sub_252D996D8()
{
  return 0;
}

uint64_t sub_252D996E4()
{
  return sub_252D99558(*v0);
}

uint64_t sub_252D996EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D99420(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D99714(uint64_t a1)
{
  unint64_t v2 = sub_252D9A640();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D99750(uint64_t a1)
{
  unint64_t v2 = sub_252D9A640();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D9978C()
{
  return sub_252D99650();
}

uint64_t sub_252D997A4(uint64_t a1)
{
  unint64_t v2 = sub_252D9A6D8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D997E0(uint64_t a1)
{
  unint64_t v2 = sub_252D9A6D8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D99820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D995A4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252D9984C(uint64_t a1)
{
  unint64_t v2 = sub_252D9A68C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D99888(uint64_t a1)
{
  unint64_t v2 = sub_252D9A68C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D998C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D996B8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_252D998F4(uint64_t a1)
{
  unint64_t v2 = sub_252D9A724();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D99930(uint64_t a1)
{
  unint64_t v2 = sub_252D9A724();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnScreenContent.EntityFormat.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  sub_252D8823C(&qword_269CA94D0);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D97F28();
  sub_252D8823C(&qword_269CA94D8);
  sub_252D89934();
  MEMORY[0x270FA5388](v6);
  sub_252D981D0();
  uint64_t v7 = sub_252D8823C(&qword_269CA94E0);
  sub_252D89934();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  sub_252D981B8();
  sub_252D8823C(&qword_269CA94E8);
  sub_252D89934();
  MEMORY[0x270FA5388](v11);
  sub_252D9B27C();
  int v12 = *(unsigned __int8 *)(v3 + 8);
  sub_252D88F0C(a1, a1[3]);
  sub_252D9A640();
  sub_252DC33E0();
  if (!v12)
  {
    sub_252D9A6D8();
    sub_252D9B39C();
    sub_252D8823C(&qword_269CA9520);
    sub_252D9A7F4(&qword_269CA9528, &qword_269CA9530);
    sub_252DC3340();
    goto LABEL_5;
  }
  if (v12 == 1)
  {
    sub_252D9A68C();
    sub_252D9B39C();
    sub_252D8823C(&qword_269CA9500);
    sub_252D9A770(&qword_269CA9508, &qword_269CA9510);
    sub_252DC3340();
LABEL_5:
    sub_252D980DC();
    v13();
    sub_252D980DC();
    return v14();
  }
  sub_252D9A724();
  sub_252DC32D0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v7);
  sub_252D980DC();
  return v16();
}

uint64_t OnScreenContent.EntityFormat.hashValue.getter()
{
  uint64_t v1 = *(void *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  sub_252DC3380();
  if (v2)
  {
    sub_252DC3390();
    if (v2 == 1) {
      sub_252D9A3F0();
    }
  }
  else
  {
    sub_252DC3390();
    sub_252D8FB2C((uint64_t)v4, v1);
  }
  return sub_252DC33C0();
}

uint64_t OnScreenContent.EntityFormat.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_252D8823C(&qword_269CA9540);
  sub_252D89934();
  MEMORY[0x270FA5388](v4);
  sub_252D97F28();
  sub_252D8823C(&qword_269CA9548);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D9B27C();
  sub_252D8823C(&qword_269CA9550);
  sub_252D89934();
  MEMORY[0x270FA5388](v6);
  sub_252D981D0();
  uint64_t v7 = sub_252D8823C(&qword_269CA9558);
  sub_252D89934();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  sub_252D981B8();
  uint64_t v35 = a1;
  sub_252D88F0C(a1, a1[3]);
  sub_252D9A640();
  sub_252DC33D0();
  if (v36)
  {
    uint64_t v11 = (uint64_t)a1;
  }
  else
  {
    uint64_t v12 = sub_252DC32C0();
    uint64_t v13 = *(void *)(v12 + 16);
    if (v13
      && (int v14 = *(unsigned __int8 *)(v12 + 32),
          sub_252D97BB4(1, v13, v12, v12 + 32, 0, (2 * v13) | 1),
          uint64_t v16 = v15,
          unint64_t v18 = v17,
          swift_bridgeObjectRelease(),
          v16 == v18 >> 1))
    {
      if (v14)
      {
        if (v14 == 1)
        {
          LOBYTE(v37) = 1;
          sub_252D9A6D8();
          sub_252D9B154();
          sub_252D8823C(&qword_269CA9520);
          sub_252D9A7F4(&qword_269CA9570, &qword_269CA9578);
          sub_252D9B2F0();
          uint64_t v11 = (uint64_t)v35;
          sub_252D980DC();
          v26();
          swift_unknownObjectRelease();
          uint64_t v27 = sub_252D9B0A0();
          v28(v27);
          char v29 = 0;
          uint64_t v30 = v37;
        }
        else
        {
          LOBYTE(v37) = 2;
          sub_252D9A68C();
          sub_252D9B154();
          sub_252D8823C(&qword_269CA9500);
          sub_252D9A770(&qword_269CA9560, &qword_269CA9568);
          sub_252D9B2F0();
          uint64_t v11 = (uint64_t)v35;
          sub_252D980DC();
          v31();
          swift_unknownObjectRelease();
          uint64_t v32 = sub_252D9B2D8();
          v33(v32);
          uint64_t v30 = v37;
          char v29 = 1;
        }
      }
      else
      {
        sub_252D9A724();
        sub_252D9B154();
        sub_252D980DC();
        v23();
        swift_unknownObjectRelease();
        uint64_t v24 = sub_252D9B0A0();
        v25(v24);
        uint64_t v30 = 0;
        char v29 = 2;
        uint64_t v11 = (uint64_t)v35;
      }
      *(void *)a2 = v30;
      *(unsigned char *)(a2 + 8) = v29;
    }
    else
    {
      uint64_t v11 = (uint64_t)v35;
      uint64_t v19 = sub_252DC31E0();
      swift_allocError();
      uint64_t v21 = v20;
      sub_252D8823C(&qword_269CA91C8);
      void *v21 = &type metadata for OnScreenContent.EntityFormat;
      sub_252DC3240();
      sub_252DC31D0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v7);
    }
  }
  return sub_252D8931C(v11);
}

uint64_t sub_252D9A330()
{
  uint64_t v1 = *(void *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  sub_252DC3380();
  if (v2)
  {
    sub_252DC3390();
    if (v2 == 1) {
      sub_252D9A3F0();
    }
  }
  else
  {
    sub_252DC3390();
    sub_252D8FB2C((uint64_t)v4, v1);
  }
  return sub_252DC33C0();
}

uint64_t sub_252D9A3BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return OnScreenContent.EntityFormat.init(from:)(a1, a2);
}

uint64_t sub_252D9A3D4(void *a1)
{
  return OnScreenContent.EntityFormat.encode(to:)(a1);
}

void sub_252D9A3F0()
{
  sub_252D9806C();
  uint64_t v2 = v1;
  uint64_t v3 = sub_252DC2D60();
  sub_252D89934();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_252D981B8();
  sub_252DC33C0();
  uint64_t v7 = v2 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v2 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v2;
  swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  int64_t v14 = 0;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v5 + 16))(v0, *(void *)(v12 + 48) + *(void *)(v5 + 72) * i, v3);
    sub_252D9AFF8(&qword_269CA95E0, MEMORY[0x263F818F8]);
    uint64_t v20 = sub_252DC3030();
    sub_252D980DC();
    v21();
    v13 ^= v20;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v14++, 1)) {
      goto LABEL_19;
    }
    if (v14 >= v11)
    {
LABEL_17:
      swift_release();
      sub_252DC3390();
      sub_252D98084();
      return;
    }
    unint64_t v18 = *(void *)(v7 + 8 * v14);
    if (!v18) {
      break;
    }
LABEL_14:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v14 + 1;
  if (v14 + 1 >= v11) {
    goto LABEL_17;
  }
  unint64_t v18 = *(void *)(v7 + 8 * v19);
  if (v18)
  {
    ++v14;
    goto LABEL_14;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_17;
    }
    unint64_t v18 = *(void *)(v7 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
}

uint64_t sub_252D9A618(uint64_t a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_252D9A62C(uint64_t a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_252D9A640()
{
  unint64_t result = qword_269CA94F0;
  if (!qword_269CA94F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA94F0);
  }
  return result;
}

unint64_t sub_252D9A68C()
{
  unint64_t result = qword_269CA94F8;
  if (!qword_269CA94F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA94F8);
  }
  return result;
}

unint64_t sub_252D9A6D8()
{
  unint64_t result = qword_269CA9518;
  if (!qword_269CA9518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9518);
  }
  return result;
}

unint64_t sub_252D9A724()
{
  unint64_t result = qword_269CA9538;
  if (!qword_269CA9538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9538);
  }
  return result;
}

uint64_t sub_252D9A770(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(&qword_269CA9500);
    sub_252D9AFF8(a2, MEMORY[0x263F818F8]);
    uint64_t result = sub_252D9B368();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252D9A7F4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(&qword_269CA9520);
    sub_252D9AFF8(a2, MEMORY[0x263F8F3A0]);
    uint64_t result = sub_252D9B368();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_252D9A87C()
{
  unint64_t result = qword_269CA9580;
  if (!qword_269CA9580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9580);
  }
  return result;
}

uint64_t _s12EntityFormatOwCP(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_252D9A618(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t _s12EntityFormatOwxx(uint64_t a1)
{
  return sub_252D9A62C(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t _s12EntityFormatOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_252D9A618(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_252D9A62C(v5, v6);
  return a1;
}

uint64_t _s12EntityFormatOwtk(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t _s12EntityFormatOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_252D9A62C(v4, v5);
  return a1;
}

uint64_t _s12EntityFormatOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
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

uint64_t _s12EntityFormatOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_252D9AA4C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_252D9AA64(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OnScreenContent.EntityFormat()
{
  return &type metadata for OnScreenContent.EntityFormat;
}

unsigned char *_s12EntityFormatO10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D9AB58);
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

ValueMetadata *_s12EntityFormatO10CodingKeysOMa()
{
  return &_s12EntityFormatO10CodingKeysON;
}

ValueMetadata *_s12EntityFormatO13PdfCodingKeysOMa()
{
  return &_s12EntityFormatO13PdfCodingKeysON;
}

ValueMetadata *_s12EntityFormatO18DocumentCodingKeysOMa()
{
  return &_s12EntityFormatO18DocumentCodingKeysON;
}

unsigned char *_s12EntityFormatO18DocumentCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252D9AC50);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *_s12EntityFormatO15ImageCodingKeysOMa()
{
  return &_s12EntityFormatO15ImageCodingKeysON;
}

unint64_t sub_252D9AC8C()
{
  unint64_t result = qword_269CA9588;
  if (!qword_269CA9588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9588);
  }
  return result;
}

unint64_t sub_252D9ACDC()
{
  unint64_t result = qword_269CA9590;
  if (!qword_269CA9590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9590);
  }
  return result;
}

unint64_t sub_252D9AD2C()
{
  unint64_t result = qword_269CA9598;
  if (!qword_269CA9598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9598);
  }
  return result;
}

unint64_t sub_252D9AD7C()
{
  unint64_t result = qword_269CA95A0;
  if (!qword_269CA95A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95A0);
  }
  return result;
}

unint64_t sub_252D9ADCC()
{
  unint64_t result = qword_269CA95A8;
  if (!qword_269CA95A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95A8);
  }
  return result;
}

unint64_t sub_252D9AE1C()
{
  unint64_t result = qword_269CA95B0;
  if (!qword_269CA95B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95B0);
  }
  return result;
}

unint64_t sub_252D9AE6C()
{
  unint64_t result = qword_269CA95B8;
  if (!qword_269CA95B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95B8);
  }
  return result;
}

unint64_t sub_252D9AEBC()
{
  unint64_t result = qword_269CA95C0;
  if (!qword_269CA95C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95C0);
  }
  return result;
}

unint64_t sub_252D9AF0C()
{
  unint64_t result = qword_269CA95C8;
  if (!qword_269CA95C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95C8);
  }
  return result;
}

unint64_t sub_252D9AF5C()
{
  unint64_t result = qword_269CA95D0;
  if (!qword_269CA95D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95D0);
  }
  return result;
}

unint64_t sub_252D9AFAC()
{
  unint64_t result = qword_269CA95D8;
  if (!qword_269CA95D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA95D8);
  }
  return result;
}

uint64_t sub_252D9AFF8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_252D9B044()
{
  *(void *)(v4 - 160) = v2;
  *(void *)(v4 - 152) = v2 + 56;
  *(void *)(v4 - 144) = (unint64_t)((1 << *(unsigned char *)(v2 + 32)) + 63) >> 6;
  *(void *)(v4 - 112) = v3 + 32;
  *(void *)(v4 - 104) = v1 + 56;
  *(void *)(v4 - 96) = v3 + 16;
  *(void *)(v4 - 176) = v0;
  *(void *)(v4 - 168) = v3;
}

uint64_t sub_252D9B0A0()
{
  return v0;
}

uint64_t sub_252D9B100()
{
  return *(void *)(v0 - 88);
}

uint64_t sub_252D9B154()
{
  return sub_252DC3230();
}

void sub_252D9B194()
{
  *(void *)(v2 - 128) = (v0 - 1) & v0;
  *(void *)(v2 - 120) = v1;
}

uint64_t sub_252D9B1B0()
{
  sub_252D9A618(v1, 0);
  sub_252D9A618(v0, 0);
  return sub_252D9A618(v1, 0);
}

void sub_252D9B1FC(uint64_t a1@<X8>)
{
  *(void *)(v2 - 128) = (a1 - 1) & a1;
  *(void *)(v2 - 120) = v1;
}

uint64_t sub_252D9B234()
{
  sub_252D9A62C(v1, 0);
  sub_252D9A62C(v0, 0);
  return v1;
}

void sub_252D9B264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 88) = (char *)&a9 - v9;
}

uint64_t sub_252D9B2B4()
{
  return sub_252DC3060();
}

uint64_t sub_252D9B2D8()
{
  return v0;
}

uint64_t sub_252D9B2F0()
{
  return sub_252DC32B0();
}

uint64_t sub_252D9B310()
{
  return sub_252DC3030();
}

uint64_t sub_252D9B368()
{
  return swift_getWitnessTable();
}

uint64_t sub_252D9B39C()
{
  return sub_252DC32D0();
}

void OnScreenContentRequestParameters.sources.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

void *OnScreenContentRequestParameters.sources.setter(void *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.sources.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.contentTypes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.contentTypes.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_252D9D294((uint64_t)&unk_270315F30);
  sub_252D8823C(&qword_269CA95F0);
  uint64_t v3 = sub_252DC2F30();
  sub_252D9E160(v3);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252DC6650;
  sub_252DC2EE0();
  uint64_t v5 = sub_252D9CF70(v4);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_252DC6660;
  sub_252DC2F10();
  sub_252DC2EF0();
  sub_252DC2F00();
  uint64_t result = sub_252D9CF70(v6);
  *a1 = v2;
  a1[1] = v5;
  a1[2] = result;
  return result;
}

uint64_t OnScreenContentRequestParameters.appEntityFilteringArgs.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 OnScreenContentRequestParameters.appEntityFilteringArgs.setter(__n128 *a1)
{
  unint64_t v3 = a1[1].n128_u64[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 result = *a1;
  v1[1] = *a1;
  v1[2].n128_u64[0] = v3;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.appEntityFilteringArgs.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.downscaleWindowSnapshots.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t OnScreenContentRequestParameters.downscaleWindowSnapshots.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.downscaleWindowSnapshots.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.preferSingleEntityPerWindow.getter()
{
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t OnScreenContentRequestParameters.preferSingleEntityPerWindow.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 41) = result;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.preferSingleEntityPerWindow.modify())()
{
  return nullsub_1;
}

double OnScreenContentRequestParameters.timeout.getter()
{
  return *(double *)(v0 + 48);
}

void OnScreenContentRequestParameters.timeout.setter(double a1)
{
  *(double *)(v1 + 48) = a1;
}

uint64_t (*OnScreenContentRequestParameters.timeout.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.assistantSchemaKinds.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.assistantSchemaKinds.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.AppEntityFiltering.assistantSchemaKinds.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.coercibleFileTypes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.AppEntityFiltering.coercibleFileTypes.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.coercibleImageTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.coercibleImageTypes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*OnScreenContentRequestParameters.AppEntityFiltering.coercibleImageTypes.modify())()
{
  return nullsub_1;
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.init(assistantSchemaKinds:coercibleFileTypes:coercibleImageTypes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  sub_252D9D294((uint64_t)&unk_270315FD0);
  sub_252D8823C(&qword_269CA95F0);
  uint64_t v8 = sub_252DC2F30();
  sub_252D9E160(v8);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_252DC6650;
  sub_252DC2EE0();
  sub_252D9CF70(v9);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_252DC6660;
  sub_252DC2F10();
  sub_252DC2EF0();
  sub_252DC2F00();
  sub_252D9CF70(v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void static OnScreenContentRequestParameters.AppEntityFiltering.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  sub_252D98F38(*a1, *a2);
  if (v2)
  {
    sub_252D991A8();
    if (v3)
    {
      sub_252D991A8();
    }
  }
}

uint64_t sub_252D9B984(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000252DC3C70 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000252DC3C90 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000252DC3CB0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_252D9BAC8(char a1)
{
  if (!a1) {
    return 0xD000000000000014;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0xD000000000000013;
}

unint64_t sub_252D9BB20()
{
  return sub_252D9BAC8(*v0);
}

uint64_t sub_252D9BB28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D9B984(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D9BB50(uint64_t a1)
{
  unint64_t v2 = sub_252D9D464();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D9BB8C(uint64_t a1)
{
  unint64_t v2 = sub_252D9D464();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.encode(to:)(void *a1)
{
  uint64_t v4 = sub_252D8823C(&qword_269CA95F8);
  sub_252D89934();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_252D9E234();
  sub_252D88F0C(a1, a1[3]);
  sub_252D9D464();
  sub_252DC33E0();
  sub_252D8823C(&qword_269CA9608);
  sub_252D9D4B0((uint64_t)&unk_269CA9610);
  sub_252D9E214();
  if (!v1)
  {
    sub_252D8823C(&qword_269CA9618);
    sub_252D9D510((uint64_t)&unk_269CA9620);
    sub_252D9E1C0();
    sub_252D9E1C0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t OnScreenContentRequestParameters.AppEntityFiltering.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_252D8823C(&qword_269CA9628);
  sub_252D89934();
  MEMORY[0x270FA5388](v4);
  sub_252D9D294((uint64_t)&unk_270316070);
  sub_252D8823C(&qword_269CA95F0);
  uint64_t v5 = sub_252DC2F30();
  sub_252D9E160(v5);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_252DC6650;
  sub_252DC2EE0();
  sub_252D9CF70(v6);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_252DC6660;
  sub_252DC2F10();
  sub_252DC2EF0();
  sub_252DC2F00();
  sub_252D9CF70(v7);
  sub_252D88F0C(a1, a1[3]);
  sub_252D9D464();
  sub_252DC33D0();
  if (!v2)
  {
    sub_252D8823C(&qword_269CA9608);
    sub_252D9D4B0((uint64_t)&unk_269CA9630);
    sub_252DC32B0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_252D8823C(&qword_269CA9618);
    sub_252D9D510((uint64_t)&unk_269CA9638);
    sub_252D9E190();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_252D9E190();
    uint64_t v9 = sub_252D9E178();
    v10(v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v12;
    a2[1] = v12;
    a2[2] = v12;
  }
  sub_252D8931C((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_252D9C128@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return OnScreenContentRequestParameters.AppEntityFiltering.init(from:)(a1, a2);
}

uint64_t sub_252D9C140(void *a1)
{
  return OnScreenContentRequestParameters.AppEntityFiltering.encode(to:)(a1);
}

uint64_t OnScreenContentRequestParameters.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE88];
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = v2;
  uint64_t result = OnScreenContentRequestParameters.AppEntityFiltering.init()((uint64_t *)(a1 + 16));
  *(_WORD *)(a1 + 40) = 257;
  *(void *)(a1 + 48) = 0x4008000000000000;
  return result;
}

uint64_t OnScreenContentRequestParameters.init(sources:contentTypes:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t result = OnScreenContentRequestParameters.AppEntityFiltering.init()((uint64_t *)(a3 + 16));
  *(_WORD *)(a3 + 40) = 257;
  *(void *)(a3 + 48) = 0x4008000000000000;
  *(void *)a3 = v5;
  *(void *)(a3 + 8) = a2;
  return result;
}

uint64_t static OnScreenContentRequestParameters.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  int v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = *(unsigned __int8 *)(a1 + 41);
  double v4 = *(double *)(a1 + 48);
  int v5 = *(unsigned __int8 *)(a2 + 40);
  unsigned int v6 = *(unsigned __int8 *)(a2 + 41);
  double v7 = *(double *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a1 + 16);
  sub_252D985DC();
  if ((v10 & 1) == 0) {
    return 0;
  }
  sub_252D98F38(v9, v8);
  if ((v11 & 1) == 0) {
    return 0;
  }
  sub_252D991A8();
  if ((v12 & 1) == 0) {
    return 0;
  }
  sub_252D991A8();
  return (v4 == v7) & ~(v2 ^ v5 | ~v13 | v3 ^ v6);
}

BOOL sub_252D9C2BC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_252D9C2C8(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1702125924;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1702125924;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6D754E656E6F6870;
      unint64_t v3 = 0xEB00000000726562;
      break;
    case 2:
      uint64_t v5 = 1802398060;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x73736572646461;
      break;
    case 4:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x6E6F73726570;
      break;
    case 5:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6563616C70;
      break;
    case 6:
      uint64_t v5 = 0x617A696E6167726FLL;
      unint64_t v3 = 0xEC0000006E6F6974;
      break;
    case 7:
      uint64_t v5 = 0x7469746E45707061;
      unint64_t v3 = 0xE900000000000079;
      break;
    case 8:
      uint64_t v5 = 0x6E65746E49707061;
      unint64_t v3 = 0xE900000000000074;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      uint64_t v2 = 0x6D754E656E6F6870;
      unint64_t v6 = 0xEB00000000726562;
      break;
    case 2:
      uint64_t v2 = 1802398060;
      break;
    case 3:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v2 = 0x73736572646461;
      break;
    case 4:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x6E6F73726570;
      break;
    case 5:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x6563616C70;
      break;
    case 6:
      uint64_t v2 = 0x617A696E6167726FLL;
      unint64_t v6 = 0xEC0000006E6F6974;
      break;
    case 7:
      uint64_t v2 = 0x7469746E45707061;
      unint64_t v6 = 0xE900000000000079;
      break;
    case 8:
      uint64_t v2 = 0x6E65746E49707061;
      unint64_t v6 = 0xE900000000000074;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_252DC3360();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_252D9C55C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73656372756F73 && a2 == 0xE700000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x54746E65746E6F63 && a2 == 0xEC00000073657079;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x8000000252DC3CD0 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000018 && a2 == 0x8000000252DC3CF0 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000252DC3D10 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else if (a1 == 0x74756F656D6974 && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else
    {
      char v8 = sub_252DC3360();
      swift_bridgeObjectRelease();
      if (v8) {
        return 5;
      }
      else {
        return 6;
      }
    }
  }
}

uint64_t sub_252D9C7D8()
{
  return 6;
}

unint64_t sub_252D9C7E0(char a1)
{
  unint64_t result = 0x73656372756F73;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x54746E65746E6F63;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    case 4:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 5:
      unint64_t result = 0x74756F656D6974;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252D9C8BC()
{
  return sub_252D88B18();
}

unint64_t sub_252D9C8D8()
{
  return sub_252D9C7E0(*v0);
}

uint64_t sub_252D9C8E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D9C55C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D9C908@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D9C7D8();
  *a1 = result;
  return result;
}

uint64_t sub_252D9C930(uint64_t a1)
{
  unint64_t v2 = sub_252D9D58C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D9C96C(uint64_t a1)
{
  unint64_t v2 = sub_252D9D58C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnScreenContentRequestParameters.encode(to:)(void *a1)
{
  uint64_t v4 = sub_252D8823C(&qword_269CA9640);
  sub_252D89934();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_252D9E234();
  sub_252D88F0C(a1, a1[3]);
  sub_252D9D58C();
  sub_252DC33E0();
  sub_252D9D5D8();
  sub_252D9E214();
  if (!v1)
  {
    sub_252D8823C(&qword_269CA9658);
    sub_252D9D624((uint64_t)&unk_269CA9660);
    sub_252D9E214();
    sub_252D9D6DC();
    sub_252D9E214();
    sub_252DC3320();
    sub_252DC3320();
    sub_252DC3330();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t OnScreenContentRequestParameters.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_252D8823C(&qword_269CA9678);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  OnScreenContentRequestParameters.AppEntityFiltering.init()(v16);
  sub_252D88F0C(a1, a1[3]);
  sub_252D9D58C();
  sub_252DC33D0();
  if (!v2)
  {
    sub_252D9D728();
    sub_252D9E1EC();
    sub_252D8823C(&qword_269CA9658);
    sub_252D9D624((uint64_t)&unk_269CA9688);
    sub_252DC32B0();
    sub_252D9D7C0();
    sub_252D9E1EC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16[0] = v13;
    v16[1] = v14;
    v16[2] = v15;
    char v12 = sub_252D9E24C(3);
    char v11 = sub_252D9E24C(4);
    sub_252DC32A0();
    uint64_t v8 = v7;
    uint64_t v9 = sub_252D9E27C();
    v10(v9);
    *(void *)a2 = v13;
    *(void *)(a2 + 8) = v13;
    *(void *)(a2 + 16) = v13;
    *(void *)(a2 + 24) = v14;
    *(void *)(a2 + 32) = v15;
    *(unsigned char *)(a2 + 40) = v12 & 1;
    *(unsigned char *)(a2 + 41) = v11 & 1;
    *(void *)(a2 + 48) = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  sub_252D8931C((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_252D9CF38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return OnScreenContentRequestParameters.init(from:)(a1, a2);
}

uint64_t sub_252D9CF50(void *a1)
{
  return OnScreenContentRequestParameters.encode(to:)(a1);
}

void sub_252D9CF68(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_252D9CF70(uint64_t a1)
{
  uint64_t v2 = sub_252DC2F30();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)&v26 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
    goto LABEL_16;
  }
  sub_252D8823C(&qword_269CA96D0);
  uint64_t result = sub_252DC31B0();
  uint64_t v8 = result;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  unint64_t v9 = 0;
  uint64_t v29 = a1 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
  uint64_t v33 = v31 + 16;
  uint64_t v34 = result + 56;
  char v10 = (void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v27 = a1;
  uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v31 + 72);
    char v12 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v12(v35, v29 + v11 * v9, v2);
    sub_252D9E11C((uint64_t)&qword_269CA94C8);
    uint64_t v13 = sub_252DC3030();
    uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
    uint64_t v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      unint64_t v32 = v9;
      uint64_t v19 = ~v14;
      while (1)
      {
        v12(v5, *(void *)(v8 + 48) + v15 * v11, v2);
        sub_252D9E11C((uint64_t)&unk_269CA94C0);
        char v20 = sub_252DC3060();
        uint64_t v21 = *v10;
        (*v10)(v5, v2);
        if (v20) {
          break;
        }
        unint64_t v15 = (v15 + 1) & v19;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
        uint64_t v18 = 1 << v15;
        if ((v17 & (1 << v15)) == 0)
        {
          a1 = v27;
          unint64_t v9 = v32;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v35, v2);
      a1 = v27;
      unint64_t v9 = v32;
    }
    else
    {
LABEL_10:
      char v22 = v35;
      *(void *)(v34 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v8 + 48) + v15 * v11, v22, v2);
      uint64_t v23 = *(void *)(v8 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_18;
      }
      *(void *)(v8 + 16) = v25;
    }
    if (++v9 == v30) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_252D9D294(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  sub_252D8823C(&qword_269CA96D8);
  uint64_t result = sub_252DC31B0();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    uint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    sub_252DC3380();
    swift_bridgeObjectRetain();
    sub_252DC30A0();
    uint64_t result = sub_252DC33C0();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      unint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = sub_252DC3360(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = sub_252DC3360();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    char v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    *char v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_252D9D464()
{
  unint64_t result = qword_269CA9600;
  if (!qword_269CA9600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9600);
  }
  return result;
}

unint64_t sub_252D9D4B0(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    sub_252D88324(&qword_269CA9608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_252D9D510(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_252D88324(&qword_269CA9618);
    sub_252D9E11C(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_252D9D58C()
{
  unint64_t result = qword_269CA9648;
  if (!qword_269CA9648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9648);
  }
  return result;
}

unint64_t sub_252D9D5D8()
{
  unint64_t result = qword_269CA9650;
  if (!qword_269CA9650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9650);
  }
  return result;
}

unint64_t sub_252D9D624(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_252D88324(&qword_269CA9658);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_252D9D690()
{
  unint64_t result = qword_269CA9668;
  if (!qword_269CA9668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9668);
  }
  return result;
}

unint64_t sub_252D9D6DC()
{
  unint64_t result = qword_269CA9670;
  if (!qword_269CA9670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9670);
  }
  return result;
}

unint64_t sub_252D9D728()
{
  unint64_t result = qword_269CA9680;
  if (!qword_269CA9680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9680);
  }
  return result;
}

unint64_t sub_252D9D774()
{
  unint64_t result = qword_269CA9690;
  if (!qword_269CA9690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9690);
  }
  return result;
}

unint64_t sub_252D9D7C0()
{
  unint64_t result = qword_269CA9698;
  if (!qword_269CA9698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9698);
  }
  return result;
}

uint64_t destroy for OnScreenContentRequestParameters()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for OnScreenContentRequestParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for OnScreenContentRequestParameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for ElementContent.Command(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for OnScreenContentRequestParameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnScreenContentRequestParameters(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for OnScreenContentRequestParameters(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for OnScreenContentRequestParameters()
{
  return &type metadata for OnScreenContentRequestParameters;
}

uint64_t destroy for OnScreenContentRequestParameters.AppEntityFiltering()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s23IntelligenceFlowContext32OnScreenContentRequestParametersV18AppEntityFilteringVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for OnScreenContentRequestParameters.AppEntityFiltering(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for OnScreenContentRequestParameters.AppEntityFiltering(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for OnScreenContentRequestParameters.AppEntityFiltering(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OnScreenContentRequestParameters.AppEntityFiltering(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for OnScreenContentRequestParameters.AppEntityFiltering(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for OnScreenContentRequestParameters.AppEntityFiltering()
{
  return &type metadata for OnScreenContentRequestParameters.AppEntityFiltering;
}

uint64_t getEnumTagSinglePayload for OnScreenContentRequestParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for OnScreenContentRequestParameters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x252D9DE00);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OnScreenContentRequestParameters.CodingKeys()
{
  return &type metadata for OnScreenContentRequestParameters.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for OnScreenContentRequestParameters.AppEntityFiltering.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D9DF04);
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

ValueMetadata *type metadata accessor for OnScreenContentRequestParameters.AppEntityFiltering.CodingKeys()
{
  return &type metadata for OnScreenContentRequestParameters.AppEntityFiltering.CodingKeys;
}

unint64_t sub_252D9DF40()
{
  unint64_t result = qword_269CA96A0;
  if (!qword_269CA96A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96A0);
  }
  return result;
}

unint64_t sub_252D9DF90()
{
  unint64_t result = qword_269CA96A8;
  if (!qword_269CA96A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96A8);
  }
  return result;
}

unint64_t sub_252D9DFE0()
{
  unint64_t result = qword_269CA96B0;
  if (!qword_269CA96B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96B0);
  }
  return result;
}

unint64_t sub_252D9E030()
{
  unint64_t result = qword_269CA96B8;
  if (!qword_269CA96B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96B8);
  }
  return result;
}

unint64_t sub_252D9E080()
{
  unint64_t result = qword_269CA96C0;
  if (!qword_269CA96C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96C0);
  }
  return result;
}

unint64_t sub_252D9E0D0()
{
  unint64_t result = qword_269CA96C8;
  if (!qword_269CA96C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96C8);
  }
  return result;
}

unint64_t sub_252D9E11C(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    sub_252DC2F30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_252D9E160(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_252D9E178()
{
  return v0;
}

uint64_t sub_252D9E190()
{
  return sub_252DC32B0();
}

uint64_t sub_252D9E1C0()
{
  return sub_252DC3340();
}

uint64_t sub_252D9E1EC()
{
  return sub_252DC32B0();
}

uint64_t sub_252D9E214()
{
  return sub_252DC3340();
}

uint64_t _s23IntelligenceFlowContext32OnScreenContentRequestParametersV12contentTypesShyAA0deF4TypeOGvg_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_252D9E24C@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 168) = a1;
  return sub_252DC3290();
}

uint64_t sub_252D9E270(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_252D9E27C()
{
  return v0;
}

uint64_t sub_252D9E290@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t OnScreenContentSources.rawValue.getter()
{
  return *(void *)v0;
}

IntelligenceFlowContext::OnScreenContentSources __swiftcall OnScreenContentSources.init(rawValue:)(IntelligenceFlowContext::OnScreenContentSources rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static OnScreenContentSources.appEntities.getter(void *a1@<X8>)
{
}

void static OnScreenContentSources.uiHierarchyContent.getter(void *a1@<X8>)
{
}

void static OnScreenContentSources.appWindowSnapshots.getter(void *a1@<X8>)
{
}

void static OnScreenContentSources.windowContentGeneratedPDFEnabled.getter(void *a1@<X8>)
{
}

void static OnScreenContentSources.windowContentGeneratedPDFDisabled.getter(void *a1@<X8>)
{
}

unint64_t sub_252D9E324()
{
  unint64_t result = qword_269CA96E0;
  if (!qword_269CA96E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96E0);
  }
  return result;
}

unint64_t sub_252D9E374()
{
  unint64_t result = qword_269CA96E8;
  if (!qword_269CA96E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96E8);
  }
  return result;
}

IntelligenceFlowContext::OnScreenContentSources sub_252D9E3C0(Swift::Int *a1)
{
  return OnScreenContentSources.init(rawValue:)(*a1);
}

uint64_t sub_252D9E3C8()
{
  return sub_252DC30F0();
}

uint64_t sub_252D9E428()
{
  return sub_252DC30D0();
}

unint64_t sub_252D9E47C()
{
  unint64_t result = qword_269CA96F0;
  if (!qword_269CA96F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96F0);
  }
  return result;
}

uint64_t sub_252D9E4C8()
{
  return sub_252DA0420();
}

uint64_t sub_252D9E4D0()
{
  return sub_252DA04A0();
}

uint64_t sub_252D9E4D8()
{
  return sub_252DA0660();
}

unint64_t sub_252D9E4E4()
{
  unint64_t result = qword_269CA96F8;
  if (!qword_269CA96F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA96F8);
  }
  return result;
}

uint64_t sub_252D9E534@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_252D9E540(*a1, *v2, a2);
}

uint64_t sub_252D9E540@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_252D9E54C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_252D9E558(*a1, *v2, a2);
}

uint64_t sub_252D9E558@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_252D9E564@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_252D9E570(*a1, *v2, a2);
}

uint64_t sub_252D9E570@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_252D9E57C(void *a1, uint64_t *a2)
{
  return sub_252D9E584(a1, *a2);
}

BOOL sub_252D9E584(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_252D9E5B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_252D9E5B8(*a1, a2);
}

uint64_t sub_252D9E5B8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_252D9E5E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_252D9E5E8(*a1, a2);
}

uint64_t sub_252D9E5E8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_252D9E608(uint64_t *a1)
{
  return sub_252D9E610(*a1);
}

uint64_t sub_252D9E610(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_252D9E620(uint64_t *a1)
{
  return sub_252D9E628(*a1);
}

uint64_t sub_252D9E628(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_252D9E638(uint64_t *a1)
{
  return sub_252D9E640(*a1);
}

uint64_t sub_252D9E640(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_252D9E650@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_252D9E65C(*a1, *v2, a2);
}

uint64_t sub_252D9E65C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_252D9E668(uint64_t *a1)
{
  return sub_252D9E674(*a1, *v1);
}

BOOL sub_252D9E674(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_252D9E680(uint64_t *a1)
{
  return sub_252D9E68C(*a1, *v1);
}

BOOL sub_252D9E68C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_252D9E698(uint64_t *a1)
{
  return sub_252D9E6A4(*a1, *v1);
}

BOOL sub_252D9E6A4(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_252D9E6B0()
{
  return sub_252D9E6B8(*v0);
}

BOOL sub_252D9E6B8(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_252D9E6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_252D9E6DC(uint64_t *a1)
{
  return sub_252D9E6E4(*a1);
}

uint64_t sub_252D9E6E4(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

IntelligenceFlowContext::OnScreenContentSources sub_252D9E6F4@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = OnScreenContentSources.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_252D9E720@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OnScreenContentSources.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_252D9E748(uint64_t *a1, uint64_t *a2)
{
  return sub_252D9C2BC(*a1, *a2);
}

ValueMetadata *type metadata accessor for OnScreenContentSources()
{
  return &type metadata for OnScreenContentSources;
}

void sub_252D9E76C(void *a1@<X8>)
{
  *a1 = v1;
}

uint64_t static OnScreenContentType.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  int v3 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v4 = *(void *)a2;
  int v5 = *(unsigned __int8 *)(a2 + 8);
  if (!*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8))
    {
      sub_252D9A618(*(void *)a2, 0);
      sub_252D9A618(v2, 0);
      sub_252D8E160();
      char v7 = v10;
      sub_252D9A62C(v2, 0);
      uint64_t v8 = v4;
      unsigned __int8 v9 = 0;
      goto LABEL_7;
    }
    goto LABEL_19;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      sub_252D9A618(*(void *)a2, 1u);
      sub_252D9A618(v2, 1u);
      sub_252D98CC0();
      char v7 = v6;
      sub_252D9A62C(v2, 1u);
      uint64_t v8 = v4;
      unsigned __int8 v9 = 1;
LABEL_7:
      sub_252D9A62C(v8, v9);
      return v7 & 1;
    }
    goto LABEL_19;
  }
  if (!v2)
  {
    if (v5 == 2 && v4 == 0)
    {
      sub_252D9A62C(0, 2u);
      sub_252D9A62C(0, 2u);
      return 1;
    }
    goto LABEL_19;
  }
  if (v5 != 2 || v4 != 1)
  {
LABEL_19:
    sub_252D9A618(*(void *)a2, *(unsigned char *)(a2 + 8));
    sub_252D9A618(v2, v3);
    sub_252D9A62C(v2, v3);
    sub_252D9A62C(v4, v5);
    return 0;
  }
  uint64_t v13 = 1;
  sub_252D9A62C(1, 2u);
  sub_252D9A62C(1, 2u);
  return v13;
}

void OnScreenContentType.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)v1;
  if (*(unsigned char *)(v1 + 8))
  {
    if (*(unsigned char *)(v1 + 8) == 1)
    {
      sub_252DC3390();
      sub_252D9A3F0();
    }
    else
    {
      sub_252DC3390();
    }
  }
  else
  {
    sub_252DC3390();
    sub_252D8FB2C(a1, v3);
  }
}

uint64_t sub_252D9E994(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x797469746E65 && a2 == 0xE600000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701603686 && a2 == 0xE400000000000000;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x746E656D75636F64 && a2 == 0xE800000000000000;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6567616D69 && a2 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_252DC3360();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_252D9EB24(char a1)
{
  uint64_t result = 0x797469746E65;
  switch(a1)
  {
    case 1:
      uint64_t result = 1701603686;
      break;
    case 2:
      uint64_t result = 0x746E656D75636F64;
      break;
    case 3:
      uint64_t result = 0x6567616D69;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252D9EBA8()
{
  return sub_252D9EB24(*v0);
}

uint64_t sub_252D9EBB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D9E994(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D9EBD8(uint64_t a1)
{
  unint64_t v2 = sub_252D9FA54();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D9EC14(uint64_t a1)
{
  unint64_t v2 = sub_252D9FA54();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D9EC50(uint64_t a1)
{
  unint64_t v2 = sub_252D9FAEC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D9EC8C(uint64_t a1)
{
  unint64_t v2 = sub_252D9FAEC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D9ECC8(uint64_t a1)
{
  unint64_t v2 = sub_252D9FB84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D9ED04(uint64_t a1)
{
  unint64_t v2 = sub_252D9FB84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D9ED40(uint64_t a1)
{
  unint64_t v2 = sub_252D9FB38();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D9ED7C(uint64_t a1)
{
  unint64_t v2 = sub_252D9FB38();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252D9EDB8(uint64_t a1)
{
  unint64_t v2 = sub_252D9FAA0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D9EDF4(uint64_t a1)
{
  unint64_t v2 = sub_252D9FAA0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t OnScreenContentType.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  sub_252D8823C(&qword_269CA9700);
  sub_252D89934();
  MEMORY[0x270FA5388](v4);
  sub_252DA03F4(v5, v23);
  sub_252D8823C(&qword_269CA9708);
  sub_252D89934();
  MEMORY[0x270FA5388](v6);
  sub_252D97F28();
  sub_252D8823C(&qword_269CA9710);
  sub_252D89934();
  MEMORY[0x270FA5388](v7);
  sub_252D97F28();
  sub_252D8823C(&qword_269CA9718);
  sub_252D89934();
  MEMORY[0x270FA5388](v8);
  sub_252D9E234();
  uint64_t v9 = sub_252D8823C(&qword_269CA9720);
  sub_252D89934();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  sub_252DA0410();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = *v2;
  int v17 = *((unsigned __int8 *)v2 + 8);
  sub_252D88F0C(a1, a1[3]);
  sub_252D9FA54();
  sub_252DC33E0();
  if (v17)
  {
    if (v17 == 1)
    {
      sub_252D9FAA0();
      sub_252DA03D8();
      sub_252D8823C(&qword_269CA9500);
      sub_252D9FBD0(&qword_269CA9508, &qword_269CA9510);
      sub_252DC3340();
      sub_252D980DC();
      v18();
      sub_252D980DC();
      return v19();
    }
    else
    {
      if (v16) {
        sub_252D9FB38();
      }
      else {
        sub_252D9FB84();
      }
      sub_252DA03D8();
      sub_252D980DC();
      v22();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
    }
  }
  else
  {
    sub_252D9FAEC();
    sub_252DA03D8();
    sub_252D8823C(&qword_269CA9520);
    sub_252D9FC54(&qword_269CA9528, &qword_269CA9530);
    sub_252DC3340();
    sub_252D980DC();
    v21();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  }
}

uint64_t OnScreenContentType.hashValue.getter()
{
  uint64_t v1 = *(void *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  sub_252DC3380();
  if (v2)
  {
    sub_252DC3390();
    if (v2 == 1) {
      sub_252D9A3F0();
    }
  }
  else
  {
    sub_252DC3390();
    sub_252D8FB2C((uint64_t)v4, v1);
  }
  return sub_252DC33C0();
}

uint64_t OnScreenContentType.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_252D8823C(&qword_269CA9750);
  sub_252D89934();
  MEMORY[0x270FA5388](v3);
  sub_252D97F28();
  sub_252D8823C(&qword_269CA9758);
  sub_252D89934();
  MEMORY[0x270FA5388](v4);
  sub_252DA03F4(v5, v38);
  sub_252D8823C(&qword_269CA9760);
  sub_252D89934();
  MEMORY[0x270FA5388](v6);
  sub_252D9E234();
  sub_252D8823C(&qword_269CA9768);
  sub_252D89934();
  MEMORY[0x270FA5388](v7);
  sub_252DA0410();
  uint64_t v8 = sub_252D8823C(&qword_269CA9770);
  sub_252D89934();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  sub_252DA0410();
  uint64_t v14 = v13 - v12;
  uint64_t v40 = (uint64_t)a1;
  sub_252D88F0C(a1, a1[3]);
  sub_252D9FA54();
  sub_252DC33D0();
  if (!v41)
  {
    uint64_t v15 = sub_252DC32C0();
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16
      && (uint64_t v17 = *(unsigned __int8 *)(v15 + 32),
          sub_252D97BB4(1, v16, v15, v15 + 32, 0, (2 * v16) | 1),
          uint64_t v19 = v18,
          unint64_t v21 = v20,
          swift_bridgeObjectRelease(),
          v19 == v21 >> 1))
    {
      switch(v17)
      {
        case 1:
          sub_252D9FB38();
          sub_252DA03A0();
          sub_252D980DC();
          v29();
          swift_unknownObjectRelease();
          sub_252D980DC();
          v30();
          char v25 = 2;
          uint64_t v24 = 1;
          break;
        case 2:
          LOBYTE(v42) = 2;
          sub_252D9FAEC();
          sub_252DA03A0();
          sub_252D8823C(&qword_269CA9520);
          sub_252D9FC54(&qword_269CA9570, &qword_269CA9578);
          sub_252DC32B0();
          sub_252D980DC();
          v32();
          swift_unknownObjectRelease();
          uint64_t v33 = sub_252DA03C0();
          v34(v33);
          char v25 = 0;
          uint64_t v24 = v42;
          break;
        case 3:
          LOBYTE(v42) = 3;
          sub_252D9FAA0();
          sub_252DA03A0();
          sub_252D8823C(&qword_269CA9500);
          sub_252D9FBD0(&qword_269CA9560, &qword_269CA9568);
          sub_252DC32B0();
          sub_252D980DC();
          v35();
          swift_unknownObjectRelease();
          uint64_t v36 = sub_252DA03C0();
          v37(v36);
          uint64_t v24 = v42;
          char v25 = 1;
          break;
        default:
          sub_252D9FB84();
          sub_252DA03A0();
          sub_252D980DC();
          v22();
          swift_unknownObjectRelease();
          sub_252D980DC();
          v23();
          uint64_t v24 = 0;
          char v25 = 2;
          break;
      }
      *(void *)a2 = v24;
      *(unsigned char *)(a2 + 8) = v25;
    }
    else
    {
      uint64_t v26 = sub_252DC31E0();
      swift_allocError();
      uint64_t v28 = v27;
      sub_252D8823C(&qword_269CA91C8);
      *uint64_t v28 = &type metadata for OnScreenContentType;
      sub_252DC3240();
      sub_252DC31D0();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB0], v26);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
    }
  }
  return sub_252D8931C(v40);
}

uint64_t sub_252D9F980@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return OnScreenContentType.init(from:)(a1, a2);
}

uint64_t sub_252D9F998(void *a1)
{
  return OnScreenContentType.encode(to:)(a1);
}

uint64_t sub_252D9F9BC()
{
  uint64_t v1 = *(void *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  sub_252DC3380();
  if (v2)
  {
    sub_252DC3390();
    if (v2 == 1) {
      sub_252D9A3F0();
    }
  }
  else
  {
    sub_252DC3390();
    sub_252D8FB2C((uint64_t)v4, v1);
  }
  return sub_252DC33C0();
}

unint64_t sub_252D9FA54()
{
  unint64_t result = qword_269CA9728;
  if (!qword_269CA9728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9728);
  }
  return result;
}

unint64_t sub_252D9FAA0()
{
  unint64_t result = qword_269CA9730;
  if (!qword_269CA9730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9730);
  }
  return result;
}

unint64_t sub_252D9FAEC()
{
  unint64_t result = qword_269CA9738;
  if (!qword_269CA9738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9738);
  }
  return result;
}

unint64_t sub_252D9FB38()
{
  unint64_t result = qword_269CA9740;
  if (!qword_269CA9740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9740);
  }
  return result;
}

unint64_t sub_252D9FB84()
{
  unint64_t result = qword_269CA9748;
  if (!qword_269CA9748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9748);
  }
  return result;
}

uint64_t sub_252D9FBD0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(&qword_269CA9500);
    sub_252D9FCD8(a2, MEMORY[0x263F818F8]);
    uint64_t result = sub_252D9B368();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252D9FC54(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(&qword_269CA9520);
    sub_252D9FCD8(a2, MEMORY[0x263F8F3A0]);
    uint64_t result = sub_252D9B368();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252D9FCD8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_252D9FD24()
{
  unint64_t result = qword_269CA9778;
  if (!qword_269CA9778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9778);
  }
  return result;
}

ValueMetadata *type metadata accessor for OnScreenContentType()
{
  return &type metadata for OnScreenContentType;
}

unsigned char *storeEnumTagSinglePayload for OnScreenContentType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D9FE4CLL);
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

ValueMetadata *type metadata accessor for OnScreenContentType.CodingKeys()
{
  return &type metadata for OnScreenContentType.CodingKeys;
}

ValueMetadata *type metadata accessor for OnScreenContentType.EntityCodingKeys()
{
  return &type metadata for OnScreenContentType.EntityCodingKeys;
}

ValueMetadata *type metadata accessor for OnScreenContentType.FileCodingKeys()
{
  return &type metadata for OnScreenContentType.FileCodingKeys;
}

ValueMetadata *type metadata accessor for OnScreenContentType.DocumentCodingKeys()
{
  return &type metadata for OnScreenContentType.DocumentCodingKeys;
}

unsigned char *_s23IntelligenceFlowContext19OnScreenContentTypeO18DocumentCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252D9FF54);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for OnScreenContentType.ImageCodingKeys()
{
  return &type metadata for OnScreenContentType.ImageCodingKeys;
}

unint64_t sub_252D9FF90()
{
  unint64_t result = qword_269CA9780;
  if (!qword_269CA9780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9780);
  }
  return result;
}

unint64_t sub_252D9FFE0()
{
  unint64_t result = qword_269CA9788;
  if (!qword_269CA9788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9788);
  }
  return result;
}

unint64_t sub_252DA0030()
{
  unint64_t result = qword_269CA9790;
  if (!qword_269CA9790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9790);
  }
  return result;
}

unint64_t sub_252DA0080()
{
  unint64_t result = qword_269CA9798;
  if (!qword_269CA9798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9798);
  }
  return result;
}

unint64_t sub_252DA00D0()
{
  unint64_t result = qword_269CA97A0;
  if (!qword_269CA97A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97A0);
  }
  return result;
}

unint64_t sub_252DA0120()
{
  unint64_t result = qword_269CA97A8;
  if (!qword_269CA97A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97A8);
  }
  return result;
}

unint64_t sub_252DA0170()
{
  unint64_t result = qword_269CA97B0;
  if (!qword_269CA97B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97B0);
  }
  return result;
}

unint64_t sub_252DA01C0()
{
  unint64_t result = qword_269CA97B8;
  if (!qword_269CA97B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97B8);
  }
  return result;
}

unint64_t sub_252DA0210()
{
  unint64_t result = qword_269CA97C0;
  if (!qword_269CA97C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97C0);
  }
  return result;
}

unint64_t sub_252DA0260()
{
  unint64_t result = qword_269CA97C8;
  if (!qword_269CA97C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97C8);
  }
  return result;
}

unint64_t sub_252DA02B0()
{
  unint64_t result = qword_269CA97D0;
  if (!qword_269CA97D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97D0);
  }
  return result;
}

unint64_t sub_252DA0300()
{
  unint64_t result = qword_269CA97D8;
  if (!qword_269CA97D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97D8);
  }
  return result;
}

unint64_t sub_252DA0350()
{
  unint64_t result = qword_269CA97E0;
  if (!qword_269CA97E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97E0);
  }
  return result;
}

uint64_t sub_252DA03A0()
{
  return sub_252DC3230();
}

uint64_t sub_252DA03C0()
{
  return v0;
}

uint64_t sub_252DA03D8()
{
  return sub_252DC32D0();
}

void sub_252DA03F4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_252DA0420()
{
  return sub_252DC33C0();
}

uint64_t sub_252DA0458()
{
  return sub_252DC33C0();
}

uint64_t sub_252DA04A0()
{
  return sub_252DC3390();
}

uint64_t sub_252DA04C8()
{
  sub_252DC30A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252DA061C()
{
  return sub_252DC33C0();
}

uint64_t sub_252DA0660()
{
  return sub_252DC33C0();
}

uint64_t DetectedEntityDetails.entity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252DA5E40(v1, a1, (void (*)(void))type metadata accessor for DetectedEntity);
}

uint64_t type metadata accessor for DetectedEntity(uint64_t a1)
{
  return sub_252D8FDC8(a1, qword_26B23BE00);
}

uint64_t DetectedEntityDetails.entity.setter(uint64_t a1)
{
  return sub_252DA06F8(a1, v1);
}

uint64_t sub_252DA06F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DetectedEntity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*DetectedEntityDetails.entity.modify())()
{
  return nullsub_1;
}

uint64_t DetectedEntityDetails.isSelected.getter()
{
  return sub_252DB3D8C();
}

uint64_t type metadata accessor for DetectedEntityDetails(uint64_t a1)
{
  return sub_252D8FDC8(a1, qword_26B23BF50);
}

uint64_t DetectedEntityDetails.isSelected.setter(char a1)
{
  uint64_t result = type metadata accessor for DetectedEntityDetails(0);
  *(unsigned char *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*DetectedEntityDetails.isSelected.modify())()
{
  uint64_t v0 = sub_252D9830C();
  type metadata accessor for DetectedEntityDetails(v0);
  return nullsub_1;
}

uint64_t DetectedEntityDetails.init(_:isSelected:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  sub_252DA4DA8(a1, a3, (void (*)(void))type metadata accessor for DetectedEntity);
  uint64_t result = type metadata accessor for DetectedEntityDetails(0);
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t DetectedEntityDetails.hash(into:)()
{
  return sub_252DC33A0();
}

uint64_t static DetectedEntityDetails.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  static DetectedEntity.== infix(_:_:)();
  if (v4)
  {
    uint64_t v5 = type metadata accessor for DetectedEntityDetails(0);
    char v6 = *(unsigned char *)(a1 + *(int *)(v5 + 20)) ^ *(unsigned char *)(a2 + *(int *)(v5 + 20)) ^ 1;
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

void static DetectedEntity.== infix(_:_:)()
{
  sub_252D9806C();
  *(void *)&long long v73 = v4;
  *(void *)&long long v72 = v5;
  uint64_t v6 = type metadata accessor for DetectedAppEntity(0);
  uint64_t v7 = sub_252D97F80(v6);
  MEMORY[0x270FA5388](v7);
  sub_252D97F28();
  uint64_t v67 = v8;
  uint64_t v9 = sub_252DB38C8();
  uint64_t v10 = type metadata accessor for DetectedLink(v9);
  uint64_t v11 = sub_252D97F80(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v66 = (uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_252DB38C8();
  uint64_t v14 = type metadata accessor for DetectedDate(v13);
  uint64_t v15 = sub_252D97F80(v14);
  MEMORY[0x270FA5388](v15);
  sub_252D97F28();
  uint64_t v65 = v16;
  uint64_t v17 = sub_252DB38C8();
  type metadata accessor for DetectedEntity(v17);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v18);
  sub_252DB3C84();
  uint64_t v68 = (uint64_t *)v19;
  sub_252DB371C();
  MEMORY[0x270FA5388](v20);
  sub_252DB3848();
  uint64_t v71 = v21;
  sub_252DB371C();
  MEMORY[0x270FA5388](v22);
  sub_252DB3824();
  MEMORY[0x270FA5388](v23);
  sub_252DB3A9C();
  MEMORY[0x270FA5388](v24);
  sub_252DB3CAC();
  MEMORY[0x270FA5388](v25);
  sub_252DB3848();
  uint64_t v70 = v26;
  sub_252DB371C();
  MEMORY[0x270FA5388](v27);
  sub_252DB3848();
  uint64_t v69 = v28;
  sub_252DB371C();
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  unint64_t v32 = (uint64_t *)((char *)&v64 - v31);
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v64 - v33;
  uint64_t v35 = sub_252D8823C(&qword_269CA97E8);
  uint64_t v36 = sub_252D97F80(v35);
  MEMORY[0x270FA5388](v36);
  sub_252D9E234();
  uint64_t v38 = v0 + *(int *)(v37 + 56);
  sub_252DA5E40(v72, v0, (void (*)(void))type metadata accessor for DetectedEntity);
  uint64_t v39 = v73;
  *(void *)&long long v73 = v38;
  sub_252DA5E40(v39, v38, (void (*)(void))type metadata accessor for DetectedEntity);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_252DA5E40(v0, (uint64_t)v32, (void (*)(void))type metadata accessor for DetectedEntity);
      uint64_t v55 = *v32;
      uint64_t v54 = v32[1];
      uint64_t v56 = (uint64_t *)v73;
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_33;
      }
      uint64_t v57 = *v56;
      uint64_t v58 = v56[1];
      if (v55 == v57 && v54 == v58) {
        goto LABEL_38;
      }
      goto LABEL_28;
    case 2u:
      sub_252DA5E40(v0, v69, (void (*)(void))type metadata accessor for DetectedEntity);
      if (sub_252DB3A24() != 2) {
        goto LABEL_34;
      }
      sub_252DA4DA8(v38, v66, (void (*)(void))type metadata accessor for DetectedLink);
      uint64_t v40 = sub_252DB39FC();
      MEMORY[0x2533CA280](v40);
      goto LABEL_12;
    case 3u:
      sub_252DA5E40(v0, v70, (void (*)(void))type metadata accessor for DetectedEntity);
      sub_252DB39A4(v77);
      uint64_t v41 = (const void *)v73;
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        memcpy(v76, v41, sizeof(v76));
        sub_252DB39A4(v75);
        memcpy(v74, v41, sizeof(v74));
        static AddressComponents.== infix(_:_:)(v75, v74);
        sub_252DAC5EC((uint64_t)v76);
        sub_252DAC5EC((uint64_t)v77);
        goto LABEL_39;
      }
      sub_252DAC5EC((uint64_t)v77);
      goto LABEL_35;
    case 4u:
      sub_252DA5E40(v0, (uint64_t)v3, (void (*)(void))type metadata accessor for DetectedEntity);
      uint64_t v42 = v3[1];
      uint64_t v43 = v3[3];
      uint64_t v44 = v3[5];
      uint64_t v45 = v3[7];
      uint64_t v46 = (uint64_t *)v73;
      if (swift_getEnumCaseMultiPayload() == 4)
      {
        uint64_t v47 = v3[6];
        uint64_t v48 = v3[4];
        uint64_t v49 = v3[2];
        uint64_t v50 = *v46;
        uint64_t v51 = v46[1];
        uint64_t v52 = v46[2];
        uint64_t v53 = v46[7];
        v77[0] = *v3;
        v77[1] = v42;
        v77[2] = v49;
        v77[3] = v43;
        v77[4] = v48;
        v77[5] = v44;
        v77[6] = v47;
        v77[7] = v45;
        v76[0] = v50;
        v76[1] = v51;
        long long v72 = *(_OWORD *)(v46 + 3);
        *(_OWORD *)&v76[3] = v72;
        long long v73 = *(_OWORD *)(v46 + 5);
        *(_OWORD *)&v76[5] = v73;
        v76[2] = v52;
        v76[7] = v53;
        static DetectedPerson.== infix(_:_:)(v77, v76);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_39;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_33:
      swift_bridgeObjectRelease();
      goto LABEL_35;
    case 5u:
      sub_252DA5E40(v0, (uint64_t)v2, (void (*)(void))type metadata accessor for DetectedEntity);
      uint64_t v61 = *v2;
      uint64_t v60 = v2[1];
      if (sub_252DB3BC4() != 5) {
        goto LABEL_33;
      }
      goto LABEL_24;
    case 6u:
      sub_252DA5E40(v0, (uint64_t)v1, (void (*)(void))type metadata accessor for DetectedEntity);
      uint64_t v61 = *v1;
      uint64_t v60 = v1[1];
      if (sub_252DB3BC4() != 6) {
        goto LABEL_33;
      }
      goto LABEL_24;
    case 7u:
      sub_252DA5E40(v0, v71, (void (*)(void))type metadata accessor for DetectedEntity);
      if (sub_252DB3A24() != 7) {
        goto LABEL_34;
      }
      sub_252DA4DA8(v38, v67, (void (*)(void))type metadata accessor for DetectedAppEntity);
      sub_252DB39FC();
      static DetectedAppEntity.== infix(_:_:)();
LABEL_12:
      sub_252DA4D58();
      goto LABEL_37;
    case 8u:
      uint64_t v62 = v68;
      sub_252DA5E40(v0, (uint64_t)v68, (void (*)(void))type metadata accessor for DetectedEntity);
      uint64_t v61 = *v62;
      uint64_t v60 = v62[1];
      if (sub_252DB3BC4() != 8) {
        goto LABEL_33;
      }
LABEL_24:
      if (v61 == *v1 && v60 == v1[1])
      {
LABEL_38:
        swift_bridgeObjectRelease_n();
      }
      else
      {
LABEL_28:
        sub_252DC3360();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      goto LABEL_39;
    default:
      sub_252DA5E40(v0, (uint64_t)v34, (void (*)(void))type metadata accessor for DetectedEntity);
      if (sub_252DB3A24())
      {
LABEL_34:
        sub_252DA4D58();
LABEL_35:
        sub_252D8FF2C(v0, &qword_269CA97E8);
      }
      else
      {
        sub_252DA4DA8(v38, v65, (void (*)(void))type metadata accessor for DetectedDate);
        static DetectedDate.== infix(_:_:)();
        sub_252DA4D58();
LABEL_37:
        sub_252DA4D58();
LABEL_39:
        sub_252DA4D58();
      }
      sub_252D98084();
      return;
  }
}

uint64_t sub_252DA1190(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x797469746E65 && a2 == 0xE600000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463656C65537369 && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252DA1284(char a1)
{
  if (a1) {
    return 0x7463656C65537369;
  }
  else {
    return 0x797469746E65;
  }
}

uint64_t sub_252DA12C0()
{
  return sub_252DA1284(*v0);
}

uint64_t sub_252DA12C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA1190(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DA12F0(uint64_t a1)
{
  unint64_t v2 = sub_252DA5DAC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA132C(uint64_t a1)
{
  unint64_t v2 = sub_252DA5DAC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DetectedEntityDetails.encode(to:)()
{
  sub_252DB3D40();
  sub_252D8823C(&qword_269CA97F0);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252DA5DAC();
  sub_252DB375C();
  type metadata accessor for DetectedEntity(0);
  sub_252DA5DF8(&qword_269CA9800, (void (*)(uint64_t))type metadata accessor for DetectedEntity);
  sub_252DC3340();
  if (!v0)
  {
    type metadata accessor for DetectedEntityDetails(0);
    sub_252DC3320();
  }
  sub_252DB35EC();
  return v2();
}

uint64_t DetectedEntityDetails.hashValue.getter()
{
  return sub_252DC33C0();
}

void DetectedEntityDetails.init(from:)()
{
  sub_252D97FE0();
  int v3 = v2;
  uint64_t v14 = v4;
  type metadata accessor for DetectedEntity(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v5);
  sub_252DB396C(v6, v14);
  sub_252D8823C(&qword_269CA9808);
  sub_252D89934();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_252D97F8C();
  uint64_t v9 = type metadata accessor for DetectedEntityDetails(v8);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v10);
  sub_252D981D0();
  sub_252D88F0C(v3, v3[3]);
  sub_252DA5DAC();
  sub_252DC33D0();
  if (v0)
  {
    sub_252D8931C((uint64_t)v3);
  }
  else
  {
    sub_252DA5DF8(&qword_269CA9810, (void (*)(uint64_t))type metadata accessor for DetectedEntity);
    sub_252DC32B0();
    sub_252DA4DA8(v16, v1, (void (*)(void))type metadata accessor for DetectedEntity);
    char v11 = sub_252DC3290();
    uint64_t v12 = sub_252DB39D4();
    v13(v12);
    *(unsigned char *)(v1 + *(int *)(v9 + 20)) = v11 & 1;
    sub_252DA5E40(v1, v15, (void (*)(void))type metadata accessor for DetectedEntityDetails);
    sub_252D8931C((uint64_t)v3);
    sub_252DA4D58();
  }
  sub_252D97FF8();
}

uint64_t sub_252DA17AC()
{
  return sub_252DC33C0();
}

void sub_252DA17FC()
{
}

uint64_t sub_252DA1814()
{
  return DetectedEntityDetails.encode(to:)();
}

uint64_t DetectedEntity.type.getter@<X0>(char *a1@<X8>)
{
  type metadata accessor for DetectedEntity(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v3);
  sub_252DA5E40(v1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for DetectedEntity);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t result = sub_252DA4D58();
      char v6 = 1;
      goto LABEL_13;
    case 2u:
      char v7 = 2;
      goto LABEL_10;
    case 3u:
      uint64_t result = sub_252DA4D58();
      char v6 = 3;
      goto LABEL_13;
    case 4u:
      uint64_t result = sub_252DA4D58();
      char v6 = 4;
      goto LABEL_13;
    case 5u:
      uint64_t result = sub_252DA4D58();
      char v6 = 5;
      goto LABEL_13;
    case 6u:
      uint64_t result = sub_252DA4D58();
      char v6 = 6;
      goto LABEL_13;
    case 7u:
      char v7 = 7;
LABEL_10:
      *a1 = v7;
      return sub_252DA4D58();
    case 8u:
      uint64_t result = sub_252DA4D58();
      char v6 = 8;
LABEL_13:
      *a1 = v6;
      return result;
    default:
      *a1 = 0;
      return sub_252DA4D58();
  }
}

void DetectedEntity.description.getter()
{
  sub_252D9806C();
  uint64_t v5 = type metadata accessor for DetectedAppEntity(0);
  uint64_t v6 = sub_252D97F80(v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_252DB3934();
  uint64_t v8 = type metadata accessor for DetectedLink(v7);
  uint64_t v9 = sub_252D97F80(v8);
  MEMORY[0x270FA5388](v9);
  sub_252DB3588();
  uint64_t v10 = type metadata accessor for DetectedDate(0);
  uint64_t v11 = sub_252D97F80(v10);
  MEMORY[0x270FA5388](v11);
  uint64_t v12 = sub_252DB3950();
  type metadata accessor for DetectedEntity(v12);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v13);
  sub_252D9B27C();
  sub_252DA5E40(v0, (uint64_t)v3, (void (*)(void))type metadata accessor for DetectedEntity);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_252DB3A50();
      swift_bridgeObjectRelease();
      unint64_t v14 = 0x754E20656E6F6850;
      unsigned int v15 = 1919246957;
      goto LABEL_9;
    case 2u:
      sub_252DA4DA8((uint64_t)v3, v1, (void (*)(void))type metadata accessor for DetectedLink);
      sub_252DB3C5C();
      v27[0] = v16;
      v27[1] = v17;
      sub_252DC2CC0();
      sub_252DA5DF8(&qword_269CA9818, MEMORY[0x263F06EA8]);
      sub_252DC3350();
      sub_252DC30B0();
      swift_bridgeObjectRelease();
      goto LABEL_11;
    case 3u:
      memcpy(v27, v3, sizeof(v27));
      sub_252DB387C();
      uint64_t v25 = v18;
      uint64_t v26 = v19;
      memcpy(v24, v3, sizeof(v24));
      sub_252DAB3C8((uint64_t)v27);
      AddressComponents.description.getter();
      sub_252DC30B0();
      swift_bridgeObjectRelease();
      sub_252DAC5EC((uint64_t)v27);
      sub_252DAC5EC((uint64_t)v27);
      break;
    case 4u:
      uint64_t v20 = v3[1];
      uint64_t v21 = v3[2];
      uint64_t v22 = v3[7];
      v27[0] = *v3;
      v27[1] = v20;
      *(_OWORD *)&v27[3] = *(_OWORD *)(v3 + 3);
      *(_OWORD *)&v27[5] = *(_OWORD *)(v3 + 5);
      v27[2] = v21;
      v27[7] = v22;
      DetectedPerson.description.getter();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 5u:
      sub_252DB3BE0();
      goto LABEL_13;
    case 6u:
      sub_252DB3A50();
      swift_bridgeObjectRelease();
      sub_252DB39E0();
LABEL_9:
      unint64_t v23 = v15 | 0xEE00203A00000000;
      goto LABEL_13;
    case 7u:
      sub_252DA4DA8((uint64_t)v3, v2, (void (*)(void))type metadata accessor for DetectedAppEntity);
      DetectedAppEntity.description.getter();
      goto LABEL_11;
    case 8u:
      v27[0] = 0;
      v27[1] = 0xE000000000000000;
      sub_252DC31C0();
      swift_bridgeObjectRelease();
      unint64_t v14 = 0xD000000000000017;
      unint64_t v23 = 0x8000000252DC3D30;
LABEL_13:
      v27[0] = v14;
      v27[1] = v23;
      swift_bridgeObjectRetain();
      sub_252DC30B0();
      swift_bridgeObjectRelease_n();
      break;
    default:
      sub_252DA4DA8((uint64_t)v3, v4, (void (*)(void))type metadata accessor for DetectedDate);
      DetectedDate.description.getter();
LABEL_11:
      sub_252DA4D58();
      break;
  }
  sub_252D98084();
}

void DetectedEntity.hash(into:)()
{
  sub_252D9806C();
  uint64_t v35 = v6;
  uint64_t v7 = type metadata accessor for DetectedAppEntity(0);
  uint64_t v8 = sub_252D97F80(v7);
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_252DB3684();
  uint64_t v10 = type metadata accessor for DetectedLink(v9);
  uint64_t v11 = sub_252D97F80(v10);
  MEMORY[0x270FA5388](v11);
  sub_252DB3950();
  uint64_t v12 = sub_252DC2C30();
  sub_252D89934();
  uint64_t v34 = v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v33 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_252D8823C(&qword_269CA9820);
  uint64_t v17 = sub_252D97F80(v16);
  MEMORY[0x270FA5388](v17);
  uint64_t v18 = sub_252DB3918();
  uint64_t v19 = type metadata accessor for DetectedDate(v18);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v20);
  uint64_t v21 = sub_252D97F8C();
  type metadata accessor for DetectedEntity(v21);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v22);
  sub_252DB3588();
  sub_252DA5E40(v0, (uint64_t)v1, (void (*)(void))type metadata accessor for DetectedEntity);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 5u:
    case 6u:
    case 8u:
      sub_252DC3390();
      swift_bridgeObjectRetain();
      sub_252DC30A0();
      swift_bridgeObjectRelease_n();
      goto LABEL_11;
    case 2u:
      sub_252DA4DA8((uint64_t)v1, v2, (void (*)(void))type metadata accessor for DetectedLink);
      sub_252DC3390();
      sub_252DC2CC0();
      sub_252DA5DF8(&qword_269CA9828, MEMORY[0x263F06EA8]);
      sub_252DB3D34();
      sub_252DC3040();
      goto LABEL_10;
    case 3u:
      memcpy(v37, v1, 0x80uLL);
      sub_252DC3390();
      memcpy(v36, v37, sizeof(v36));
      AddressComponents.hash(into:)();
      sub_252DAC5EC((uint64_t)v37);
      goto LABEL_11;
    case 4u:
      uint64_t v23 = v1[1];
      uint64_t v34 = *v1;
      uint64_t v25 = v1[2];
      uint64_t v24 = v1[3];
      uint64_t v27 = v1[4];
      uint64_t v26 = v1[5];
      uint64_t v29 = v1[6];
      uint64_t v28 = v1[7];
      sub_252DC3390();
      v37[0] = v34;
      v37[1] = v23;
      v37[2] = v25;
      v37[3] = v24;
      v37[4] = v27;
      v37[5] = v26;
      v37[6] = v29;
      v37[7] = v28;
      DetectedPerson.hash(into:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_11;
    case 7u:
      sub_252DA4DA8((uint64_t)v1, v3, (void (*)(void))type metadata accessor for DetectedAppEntity);
      sub_252DC3390();
      DetectedAppEntity.hash(into:)();
      goto LABEL_10;
    default:
      sub_252DA4DA8((uint64_t)v1, v4, (void (*)(void))type metadata accessor for DetectedDate);
      sub_252DC3390();
      sub_252DA5DF8(&qword_269CA9830, MEMORY[0x263F063B0]);
      sub_252DC3040();
      sub_252D8FE64(v4 + *(int *)(v19 + 20), v5, &qword_269CA9820);
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v5, 1, v12) == 1)
      {
        sub_252DC33A0();
      }
      else
      {
        uint64_t v31 = v33;
        uint64_t v30 = v34;
        sub_252D9834C();
        v32();
        sub_252DC33A0();
        sub_252DC3040();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v12);
      }
LABEL_10:
      sub_252DA4D58();
LABEL_11:
      sub_252D98084();
      return;
  }
}

void static DetectedDate.== infix(_:_:)()
{
  sub_252D9806C();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_252DC2C30();
  sub_252D89934();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_252DB3588();
  uint64_t v10 = sub_252D8823C(&qword_269CA9838);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v11);
  sub_252D98020();
  uint64_t v12 = sub_252D8823C(&qword_269CA9820);
  uint64_t v13 = sub_252D97F80(v12);
  MEMORY[0x270FA5388](v13);
  sub_252DB38D4();
  MEMORY[0x270FA5388](v14);
  sub_252DB3824();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v26 - v16;
  uint64_t v18 = sub_252DB39D4();
  if (MEMORY[0x2533CA220](v18))
  {
    v26[1] = v8;
    uint64_t v19 = type metadata accessor for DetectedDate(0);
    sub_252D8FE64(v6 + *(int *)(v19 + 20), (uint64_t)v17, &qword_269CA9820);
    sub_252D8FE64(v4 + *(int *)(v19 + 20), v2, &qword_269CA9820);
    sub_252DB3B34();
    sub_252D8FE64(v2, v4, &qword_269CA9820);
    sub_252DB364C(v0);
    if (!v20)
    {
      sub_252D8FE64(v0, v1, &qword_269CA9820);
      sub_252DB364C(v4);
      if (!v20)
      {
        uint64_t v23 = sub_252DB37CC();
        v24(v23);
        sub_252DA5DF8(&qword_269CA9840, MEMORY[0x263F063B0]);
        sub_252DB3CC0();
        uint64_t v25 = *(void (**)(void))(v10 + 8);
        sub_252DB35EC();
        v25();
        sub_252DB38B0();
        sub_252DB39BC();
        sub_252DB35EC();
        v25();
        sub_252D8FF2C(v0, &qword_269CA9820);
        goto LABEL_11;
      }
      sub_252DB38B0();
      sub_252DB39BC();
      uint64_t v21 = sub_252DB3B1C();
      v22(v21);
LABEL_10:
      sub_252D8FF2C(v0, &qword_269CA9838);
      goto LABEL_11;
    }
    sub_252DB38B0();
    sub_252DB39BC();
    sub_252DB364C(v4);
    if (!v20) {
      goto LABEL_10;
    }
    sub_252D8FF2C(v0, &qword_269CA9820);
  }
LABEL_11:
  sub_252D98084();
}

uint64_t static DetectedPerson.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[7];
  uint64_t v8 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v9 = a2[5];
  BOOL v11 = *a1 == *a2 && a1[1] == a2[1];
  uint64_t v12 = a2[7];
  uint64_t v20 = a2[6];
  uint64_t v21 = a1[6];
  if (!v11)
  {
    sub_252DC3360();
    uint64_t result = sub_252DB37C0();
    if ((v14 & 1) == 0) {
      return result;
    }
  }
  if (!v4)
  {
    if (v7) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v7) {
    return 0;
  }
  BOOL v15 = v2 == v8 && v4 == v7;
  if (v15 || (sub_252DC3360(), uint64_t result = sub_252DB37C0(), (v16 & 1) != 0))
  {
LABEL_15:
    if (v5)
    {
      if (!v9) {
        return 0;
      }
      if (v3 != v10 || v5 != v9)
      {
        sub_252DC3360();
        uint64_t result = sub_252DB37C0();
        if ((v18 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v9)
    {
      return 0;
    }
    if (v6)
    {
      if (v12)
      {
        BOOL v19 = v21 == v20 && v6 == v12;
        if (v19 || (sub_252DC3360() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

void static DetectedAppEntity.== infix(_:_:)()
{
  sub_252D9806C();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_252DC2FA0();
  sub_252D89934();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_252DB3588();
  uint64_t v10 = sub_252D8823C(&qword_269CA9848);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v11);
  sub_252D98020();
  uint64_t v12 = sub_252D8823C(&qword_269CA91E8);
  uint64_t v13 = sub_252D97F80(v12);
  MEMORY[0x270FA5388](v13);
  sub_252DB38D4();
  MEMORY[0x270FA5388](v14);
  sub_252DB3824();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v33 - v16;
  uint64_t v18 = v6[1];
  uint64_t v19 = v4[1];
  if (!v18)
  {
    if (v19) {
      goto LABEL_28;
    }
LABEL_10:
    uint64_t v22 = v6[3];
    uint64_t v23 = v4[3];
    if (v22)
    {
      if (!v23) {
        goto LABEL_28;
      }
      if (v6[2] != v4[2] || v22 != v23)
      {
        sub_252DC3360();
        sub_252DB37C0();
        if ((v25 & 1) == 0) {
          goto LABEL_28;
        }
      }
    }
    else if (v23)
    {
      goto LABEL_28;
    }
    v33[1] = v8;
    uint64_t v26 = type metadata accessor for DetectedAppEntity(0);
    sub_252D8FE64((uint64_t)v6 + *(int *)(v26 + 24), (uint64_t)v17, &qword_269CA91E8);
    sub_252D8FE64((uint64_t)v4 + *(int *)(v26 + 24), v2, &qword_269CA91E8);
    sub_252DB3B34();
    sub_252D8FE64(v2, (uint64_t)v4, &qword_269CA91E8);
    sub_252DB364C(v0);
    if (v20)
    {
      sub_252DB38B0();
      sub_252DB39BC();
      sub_252DB364C((uint64_t)v4);
      if (v20)
      {
        sub_252D8FF2C(v0, &qword_269CA91E8);
        goto LABEL_28;
      }
    }
    else
    {
      sub_252D8FE64(v0, v1, &qword_269CA91E8);
      sub_252DB364C((uint64_t)v4);
      if (!v27)
      {
        uint64_t v30 = sub_252DB37CC();
        v31(v30);
        sub_252DA5DF8(&qword_269CA9850, MEMORY[0x263F80388]);
        sub_252DB3CC0();
        unint64_t v32 = *(void (**)(void))(v10 + 8);
        sub_252DB35EC();
        v32();
        sub_252DB38B0();
        sub_252DB39BC();
        sub_252DB35EC();
        v32();
        sub_252D8FF2C(v0, &qword_269CA91E8);
        goto LABEL_28;
      }
      sub_252DB38B0();
      sub_252DB39BC();
      uint64_t v28 = sub_252DB3B1C();
      v29(v28);
    }
    sub_252D8FF2C(v0, &qword_269CA9848);
    goto LABEL_28;
  }
  if (v19)
  {
    BOOL v20 = *v6 == *v4 && v18 == v19;
    if (v20) {
      goto LABEL_10;
    }
    sub_252DC3360();
    sub_252DB37C0();
    if (v21) {
      goto LABEL_10;
    }
  }
LABEL_28:
  sub_252D98084();
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_252DC3360();
  }
}

uint64_t sub_252DA2AB8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1802398060 && a2 == 0xE400000000000000;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x73736572646461 && a2 == 0xE700000000000000;
        if (v8 || (sub_252DC3360() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6E6F73726570 && a2 == 0xE600000000000000;
          if (v9 || (sub_252DC3360() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6563616C70 && a2 == 0xE500000000000000;
            if (v10 || (sub_252DC3360() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x617A696E6167726FLL && a2 == 0xEC0000006E6F6974;
              if (v11 || (sub_252DC3360() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x7469746E45707061 && a2 == 0xE900000000000079;
                if (v12 || (sub_252DC3360() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0x6E65746E49707061 && a2 == 0xE900000000000074)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  char v14 = sub_252DC3360();
                  swift_bridgeObjectRelease();
                  if (v14) {
                    return 8;
                  }
                  else {
                    return 9;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_252DA2E58()
{
  return 9;
}

uint64_t sub_252DA2E60(char a1)
{
  uint64_t result = 1702125924;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6D754E656E6F6870;
      break;
    case 2:
      uint64_t result = 1802398060;
      break;
    case 3:
      uint64_t result = 0x73736572646461;
      break;
    case 4:
      uint64_t result = 0x6E6F73726570;
      break;
    case 5:
      uint64_t result = 0x6563616C70;
      break;
    case 6:
      uint64_t result = 0x617A696E6167726FLL;
      break;
    case 7:
      uint64_t result = 0x7469746E45707061;
      break;
    case 8:
      uint64_t result = 0x6E65746E49707061;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252DA2F80(uint64_t a1)
{
  unint64_t v2 = sub_252DAB758();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA2FBC(uint64_t a1)
{
  unint64_t v2 = sub_252DAB758();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA2FF8(uint64_t a1)
{
  unint64_t v2 = sub_252DAB544();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA3034(uint64_t a1)
{
  unint64_t v2 = sub_252DAB544();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA3070(uint64_t a1)
{
  unint64_t v2 = sub_252DAB4AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA30AC(uint64_t a1)
{
  unint64_t v2 = sub_252DAB4AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA30E8()
{
  return sub_252DA2E60(*v0);
}

uint64_t sub_252DA30F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA2AB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DA3118@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252DA2E58();
  *a1 = result;
  return result;
}

uint64_t sub_252DA3140(uint64_t a1)
{
  unint64_t v2 = sub_252DAB460();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA317C(uint64_t a1)
{
  unint64_t v2 = sub_252DAB460();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA31B8(uint64_t a1)
{
  unint64_t v2 = sub_252DAB8D4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA31F4(uint64_t a1)
{
  unint64_t v2 = sub_252DAB8D4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA3230(uint64_t a1)
{
  unint64_t v2 = sub_252DAB7F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA326C(uint64_t a1)
{
  unint64_t v2 = sub_252DAB7F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA32A8(uint64_t a1)
{
  unint64_t v2 = sub_252DAB590();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA32E4(uint64_t a1)
{
  unint64_t v2 = sub_252DAB590();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA3320(uint64_t a1)
{
  unint64_t v2 = sub_252DAB6C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA335C(uint64_t a1)
{
  unint64_t v2 = sub_252DAB6C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA3398(uint64_t a1)
{
  unint64_t v2 = sub_252DAB83C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA33D4(uint64_t a1)
{
  unint64_t v2 = sub_252DAB83C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DA3410(uint64_t a1)
{
  unint64_t v2 = sub_252DAB628();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA344C(uint64_t a1)
{
  unint64_t v2 = sub_252DAB628();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DetectedEntity.encode(to:)()
{
  sub_252D97FE0();
  uint64_t v96 = v1;
  uint64_t v99 = v0;
  BOOL v6 = v5;
  sub_252D8823C(&qword_269CA9858);
  sub_252D89934();
  uint64_t v91 = v8;
  uint64_t v92 = v7;
  MEMORY[0x270FA5388](v7);
  sub_252D97F28();
  uint64_t v89 = v9;
  uint64_t v90 = sub_252D8823C(&qword_269CA9860);
  sub_252D89934();
  uint64_t v88 = v10;
  MEMORY[0x270FA5388](v11);
  sub_252D97F28();
  uint64_t v87 = v12;
  uint64_t v13 = sub_252DB38C8();
  uint64_t v85 = type metadata accessor for DetectedAppEntity(v13);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v14);
  sub_252D97F28();
  uint64_t v86 = v15;
  sub_252D8823C(&qword_269CA9868);
  sub_252D89934();
  uint64_t v83 = v17;
  uint64_t v84 = v16;
  MEMORY[0x270FA5388](v16);
  sub_252D97F28();
  uint64_t v82 = v18;
  sub_252D8823C(&qword_269CA9870);
  sub_252D89934();
  uint64_t v80 = v20;
  uint64_t v81 = v19;
  MEMORY[0x270FA5388](v19);
  sub_252D97F28();
  uint64_t v77 = v21;
  sub_252D8823C(&qword_269CA9878);
  sub_252D89934();
  uint64_t v78 = v23;
  uint64_t v79 = v22;
  MEMORY[0x270FA5388](v22);
  sub_252D97F28();
  uint64_t v76 = v24;
  sub_252D8823C(&qword_269CA9880);
  sub_252D89934();
  uint64_t v74 = v26;
  uint64_t v75 = v25;
  MEMORY[0x270FA5388](v25);
  sub_252D97F28();
  uint64_t v73 = v27;
  sub_252D8823C(&qword_269CA9888);
  sub_252D89934();
  uint64_t v71 = v29;
  uint64_t v72 = v28;
  MEMORY[0x270FA5388](v28);
  sub_252D97F28();
  uint64_t v70 = v30;
  uint64_t v31 = sub_252DB38C8();
  v68[6] = type metadata accessor for DetectedLink(v31);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v32);
  sub_252D97F28();
  uint64_t v69 = v33;
  sub_252D8823C(&qword_269CA9890);
  sub_252D89934();
  v68[4] = v35;
  v68[5] = v34;
  MEMORY[0x270FA5388](v34);
  v68[2] = (char *)v68 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68[3] = sub_252D8823C(&qword_269CA9898);
  sub_252D89934();
  v68[1] = v37;
  MEMORY[0x270FA5388](v38);
  v68[0] = (char *)v68 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_252DB38C8();
  type metadata accessor for DetectedDate(v40);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v41);
  sub_252DB38F0();
  sub_252D97EE8();
  MEMORY[0x270FA5388](v42);
  sub_252D981B8();
  sub_252D8823C(&qword_269CA98A0);
  sub_252D89934();
  uint64_t v94 = v43;
  uint64_t v95 = v44;
  MEMORY[0x270FA5388](v43);
  sub_252D9B27C();
  sub_252D88F0C(v6, v6[3]);
  sub_252DAB460();
  uint64_t v93 = v2;
  sub_252DC33E0();
  sub_252DA5E40(v99, (uint64_t)v3, (void (*)(void))type metadata accessor for DetectedEntity);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v47 = *v3;
      uint64_t v46 = v3[1];
      LOBYTE(v98[0]) = 1;
      sub_252DAB83C();
      sub_252DB35F8();
      v98[0] = v47;
      v98[1] = v46;
      sub_252DAB888();
      sub_252DB3808();
      goto LABEL_12;
    case 2u:
      sub_252DA4DA8((uint64_t)v3, v69, (void (*)(void))type metadata accessor for DetectedLink);
      LOBYTE(v98[0]) = 2;
      sub_252DAB7F0();
      sub_252DB36A0();
      sub_252DA5DF8(&qword_269CA9918, (void (*)(uint64_t))type metadata accessor for DetectedLink);
      sub_252DC3340();
      sub_252D980DC();
      v48();
      goto LABEL_10;
    case 3u:
      memcpy(v98, v3, 0x80uLL);
      v97[0] = 3;
      sub_252DAB758();
      sub_252DB36A0();
      memcpy(v97, v98, sizeof(v97));
      sub_252DAB7A4();
      sub_252DC3340();
      sub_252D980DC();
      v49();
      sub_252D980DC();
      v50();
      sub_252DAC5EC((uint64_t)v98);
      break;
    case 4u:
      uint64_t v51 = v3[1];
      uint64_t v100 = *v3;
      uint64_t v52 = v3[2];
      uint64_t v53 = v3[3];
      uint64_t v54 = v3[5];
      uint64_t v90 = v3[4];
      uint64_t v91 = v52;
      uint64_t v55 = v3[7];
      uint64_t v89 = v3[6];
      LOBYTE(v98[0]) = 4;
      sub_252DAB6C0();
      sub_252DB35F8();
      v98[0] = v100;
      v98[1] = v51;
      uint64_t v92 = v51;
      v98[2] = v91;
      v98[3] = v53;
      v98[4] = v90;
      v98[5] = v54;
      v98[6] = v89;
      v98[7] = v55;
      sub_252DAB70C();
      sub_252DC3340();
      sub_252D980DC();
      v56();
      sub_252D980DC();
      v57();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_13;
    case 5u:
      uint64_t v59 = *v3;
      uint64_t v58 = v3[1];
      LOBYTE(v98[0]) = 5;
      sub_252DAB628();
      sub_252DB35F8();
      v98[0] = v59;
      v98[1] = v58;
      sub_252DAB674();
      sub_252DB3808();
      goto LABEL_12;
    case 6u:
      uint64_t v61 = *v3;
      uint64_t v60 = v3[1];
      LOBYTE(v98[0]) = 6;
      sub_252DAB590();
      sub_252DB35F8();
      v98[0] = v61;
      v98[1] = v60;
      sub_252DAB5DC();
      sub_252DB3808();
      goto LABEL_12;
    case 7u:
      sub_252DA4DA8((uint64_t)v3, v86, (void (*)(void))type metadata accessor for DetectedAppEntity);
      LOBYTE(v98[0]) = 7;
      sub_252DAB544();
      sub_252DB36A0();
      sub_252DA5DF8(&qword_269CA98C8, (void (*)(uint64_t))type metadata accessor for DetectedAppEntity);
      sub_252DC3340();
      sub_252D980DC();
      v62();
      goto LABEL_10;
    case 8u:
      uint64_t v65 = *v3;
      uint64_t v64 = v3[1];
      LOBYTE(v98[0]) = 8;
      sub_252DAB4AC();
      sub_252DB35F8();
      v98[0] = v65;
      v98[1] = v64;
      sub_252DAB4F8();
      sub_252DB3808();
LABEL_12:
      sub_252D980DC();
      v66();
      sub_252D980DC();
      v67();
LABEL_13:
      swift_bridgeObjectRelease();
      break;
    default:
      sub_252DA4DA8((uint64_t)v3, v4, (void (*)(void))type metadata accessor for DetectedDate);
      LOBYTE(v98[0]) = 0;
      sub_252DAB8D4();
      sub_252DB36A0();
      sub_252DA5DF8(&qword_269CA9938, (void (*)(uint64_t))type metadata accessor for DetectedDate);
      sub_252DC3340();
      sub_252D980DC();
      v45();
LABEL_10:
      sub_252DA4D58();
      sub_252D980DC();
      v63();
      break;
  }
  sub_252D97FF8();
}

uint64_t DetectedEntity.hashValue.getter()
{
  return sub_252DAAB00((void (*)(unsigned char *))DetectedEntity.hash(into:));
}

void DetectedEntity.init(from:)()
{
  sub_252D97FE0();
  uint64_t v5 = v4;
  uint64_t v136 = v6;
  uint64_t v135 = sub_252D8823C(&qword_269CA9940);
  sub_252D89934();
  uint64_t v124 = v7;
  MEMORY[0x270FA5388](v8);
  sub_252D97F28();
  sub_252DB37FC(v9);
  uint64_t v134 = sub_252D8823C(&qword_269CA9948);
  sub_252D89934();
  uint64_t v123 = v10;
  MEMORY[0x270FA5388](v11);
  sub_252D97F28();
  sub_252DB37FC(v12);
  uint64_t v133 = sub_252D8823C(&qword_269CA9950);
  sub_252D89934();
  uint64_t v122 = v13;
  MEMORY[0x270FA5388](v14);
  sub_252D97F28();
  sub_252DB37FC(v15);
  uint64_t v132 = sub_252D8823C(&qword_269CA9958);
  sub_252D89934();
  uint64_t v137 = v16;
  MEMORY[0x270FA5388](v17);
  sub_252D97F28();
  sub_252DB37FC(v18);
  uint64_t v131 = sub_252D8823C(&qword_269CA9960);
  sub_252D89934();
  uint64_t v121 = v19;
  MEMORY[0x270FA5388](v20);
  sub_252D97F28();
  uint64_t v140 = v21;
  uint64_t v126 = sub_252D8823C(&qword_269CA9968);
  sub_252D89934();
  uint64_t v129 = v22;
  MEMORY[0x270FA5388](v23);
  sub_252D97F28();
  sub_252DB37FC(v24);
  uint64_t v130 = sub_252D8823C(&qword_269CA9970);
  sub_252D89934();
  uint64_t v120 = v25;
  MEMORY[0x270FA5388](v26);
  sub_252D97F28();
  sub_252DB37FC(v27);
  uint64_t v128 = sub_252D8823C(&qword_269CA9978);
  sub_252D89934();
  uint64_t v119 = v28;
  MEMORY[0x270FA5388](v29);
  sub_252D97F28();
  sub_252DB37FC(v30);
  uint64_t v127 = sub_252D8823C(&qword_269CA9980);
  sub_252D89934();
  uint64_t v118 = v31;
  MEMORY[0x270FA5388](v32);
  sub_252D97F28();
  sub_252DB37FC(v33);
  uint64_t v142 = sub_252D8823C(&qword_269CA9988);
  sub_252D89934();
  uint64_t v138 = v34;
  MEMORY[0x270FA5388](v35);
  uint64_t v141 = sub_252DB38F0();
  sub_252D97EE8();
  MEMORY[0x270FA5388](v36);
  sub_252DB3C84();
  uint64_t v117 = v37;
  sub_252DB371C();
  MEMORY[0x270FA5388](v38);
  sub_252DB3848();
  uint64_t v125 = v39;
  sub_252DB371C();
  MEMORY[0x270FA5388](v40);
  sub_252DB3848();
  uint64_t v116 = v41;
  sub_252DB371C();
  MEMORY[0x270FA5388](v42);
  sub_252DB3848();
  uint64_t v115 = v43;
  sub_252DB371C();
  MEMORY[0x270FA5388](v44);
  sub_252DB3848();
  v114 = v45;
  sub_252DB371C();
  MEMORY[0x270FA5388](v46);
  sub_252DB3C98();
  uint64_t v48 = MEMORY[0x270FA5388](v47);
  uint64_t v50 = (char *)&v109 - v49;
  MEMORY[0x270FA5388](v48);
  sub_252DB3CAC();
  uint64_t v52 = MEMORY[0x270FA5388](v51);
  uint64_t v54 = (char *)&v109 - v53;
  MEMORY[0x270FA5388](v52);
  uint64_t v56 = (char *)&v109 - v55;
  uint64_t v57 = v5[3];
  v143 = v5;
  sub_252D88F0C(v5, v57);
  sub_252DAB460();
  uint64_t v139 = v3;
  sub_252DC33D0();
  if (!v0)
  {
    v111 = v54;
    v110 = v2;
    v112 = v50;
    uint64_t v58 = v141;
    v113 = v56;
    uint64_t v59 = v139;
    uint64_t v60 = sub_252DC32C0();
    uint64_t v61 = *(void *)(v60 + 16);
    if (v61
      && (v109 = 0,
          uint64_t v62 = *(unsigned __int8 *)(v60 + 32),
          sub_252D97BB4(1, v61, v60, v60 + 32, 0, (2 * v61) | 1),
          uint64_t v64 = v63,
          unint64_t v66 = v65,
          swift_bridgeObjectRelease(),
          v64 == v66 >> 1))
    {
      uint64_t v67 = v109;
      switch(v62)
      {
        case 1:
          LOBYTE(v144[0]) = 1;
          sub_252DAB83C();
          sub_252DB34F8();
          sub_252DAC554();
          sub_252DB35AC();
          sub_252DB3788();
          uint64_t v76 = sub_252DB3524();
          v77(v76);
          swift_unknownObjectRelease();
          uint64_t v78 = sub_252DB3618();
          v79(v78);
          uint64_t v80 = *((void *)&v144[0] + 1);
          uint64_t v67 = v110;
          void *v110 = *(void *)&v144[0];
          v67[1] = v80;
          goto LABEL_19;
        case 2:
          LOBYTE(v144[0]) = 2;
          sub_252DAB7F0();
          sub_252DB34F8();
          type metadata accessor for DetectedLink(0);
          sub_252DA5DF8(&qword_269CA99C0, (void (*)(uint64_t))type metadata accessor for DetectedLink);
          sub_252DB3AF4();
          sub_252DB3734();
          uint64_t v81 = sub_252DB3524();
          v82(v81);
          swift_unknownObjectRelease();
          sub_252D980DC();
          v83();
          sub_252DB3D80();
          goto LABEL_18;
        case 3:
          LOBYTE(v144[0]) = 3;
          sub_252DAB758();
          sub_252DB34F8();
          sub_252DAC508();
          sub_252DB35AC();
          uint64_t v95 = sub_252DB3A84();
          v96(v95);
          swift_unknownObjectRelease();
          sub_252DB3728();
          v97();
          memcpy(v1, v144, 0x80uLL);
          sub_252DB3D80();
          goto LABEL_18;
        case 4:
          LOBYTE(v144[0]) = 4;
          sub_252DAB6C0();
          uint64_t v84 = v142;
          sub_252DC3230();
          if (v67)
          {
            swift_unknownObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v59, v84);
          }
          else
          {
            sub_252DAC4BC();
            sub_252DB35AC();
            sub_252DB3788();
            uint64_t v85 = sub_252DB3524();
            v86(v85);
            swift_unknownObjectRelease();
            uint64_t v87 = sub_252DB3618();
            v88(v87);
            uint64_t v89 = *((void *)&v144[0] + 1);
            uint64_t v67 = v114;
            void *v114 = *(void *)&v144[0];
            v67[1] = v89;
            long long v90 = v144[2];
            *((_OWORD *)v67 + 1) = v144[1];
            *((_OWORD *)v67 + 2) = v90;
            *((_OWORD *)v67 + 3) = v144[3];
LABEL_19:
            swift_storeEnumTagMultiPayload();
            uint64_t v103 = (uint64_t)v67;
LABEL_20:
            uint64_t v108 = (uint64_t)v113;
            sub_252DA4DA8(v103, (uint64_t)v113, (void (*)(void))type metadata accessor for DetectedEntity);
            sub_252DA4DA8(v108, v136, (void (*)(void))type metadata accessor for DetectedEntity);
          }
          break;
        case 5:
          LOBYTE(v144[0]) = 5;
          sub_252DAB628();
          sub_252DB34F8();
          sub_252DAC470();
          sub_252DB3734();
          sub_252DB3788();
          sub_252DB35EC();
          v98();
          swift_unknownObjectRelease();
          ++v67;
          sub_252DB3728();
          v99();
          sub_252DB3834(*(uint64_t *)&v144[0]);
          goto LABEL_19;
        case 6:
          LOBYTE(v144[0]) = 6;
          sub_252DAB590();
          sub_252DB34F8();
          sub_252DAC424();
          sub_252DB35AC();
          sub_252DB3788();
          uint64_t v91 = sub_252DB3524();
          v92(v91);
          swift_unknownObjectRelease();
          uint64_t v93 = sub_252DB3618();
          v94(v93);
          sub_252DB3834(*(uint64_t *)&v144[0]);
          goto LABEL_19;
        case 7:
          LOBYTE(v144[0]) = 7;
          sub_252DAB544();
          sub_252DB34F8();
          type metadata accessor for DetectedAppEntity(0);
          sub_252DA5DF8(&qword_269CA9998, (void (*)(uint64_t))type metadata accessor for DetectedAppEntity);
          sub_252DB3AF4();
          sub_252DB3734();
          uint64_t v100 = sub_252DB3524();
          v101(v100);
          swift_unknownObjectRelease();
          sub_252D980DC();
          v102();
          sub_252DB3D80();
          goto LABEL_18;
        case 8:
          LOBYTE(v144[0]) = 8;
          sub_252DAB4AC();
          sub_252DB34F8();
          sub_252DAC3D8();
          sub_252DB35AC();
          sub_252DB3788();
          uint64_t v104 = sub_252DB3524();
          v105(v104);
          swift_unknownObjectRelease();
          uint64_t v106 = sub_252DB3618();
          v107(v106);
          sub_252DB3834(*(uint64_t *)&v144[0]);
          goto LABEL_19;
        default:
          LOBYTE(v144[0]) = 0;
          sub_252DAB8D4();
          sub_252DB34F8();
          type metadata accessor for DetectedDate(0);
          sub_252DA5DF8(&qword_269CA99D0, (void (*)(uint64_t))type metadata accessor for DetectedDate);
          sub_252DB3AF4();
          sub_252DB3734();
          uint64_t v68 = sub_252DB3524();
          v69(v68);
          swift_unknownObjectRelease();
          sub_252D980DC();
          v70();
          sub_252DB3D80();
LABEL_18:
          swift_storeEnumTagMultiPayload();
          uint64_t v103 = (uint64_t)v1;
          goto LABEL_20;
      }
    }
    else
    {
      uint64_t v71 = v59;
      uint64_t v72 = sub_252DC31E0();
      swift_allocError();
      uint64_t v74 = v73;
      sub_252D8823C(&qword_269CA91C8);
      *uint64_t v74 = v58;
      uint64_t v75 = v142;
      sub_252DC3240();
      sub_252DC31D0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v72 - 8) + 104))(v74, *MEMORY[0x263F8DCB0], v72);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v71, v75);
    }
  }
  sub_252D8931C((uint64_t)v143);
  sub_252D97FF8();
}

uint64_t type metadata accessor for DetectedAppEntity(uint64_t a1)
{
  return sub_252D8FDC8(a1, qword_26B23BEA8);
}

uint64_t type metadata accessor for DetectedLink(uint64_t a1)
{
  return sub_252D8FDC8(a1, (uint64_t *)&unk_269CA9B98);
}

uint64_t type metadata accessor for DetectedDate(uint64_t a1)
{
  return sub_252D8FDC8(a1, qword_26B23BD70);
}

uint64_t sub_252DA4D58()
{
  uint64_t v1 = sub_252D9830C();
  v2(v1);
  sub_252D97EE8();
  sub_252D980DC();
  v3();
  return v0;
}

uint64_t sub_252DA4DA8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_252D97EE8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_252DA4E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_252DAADEC(a1, a2, a3, (void (*)(unsigned char *))DetectedEntity.hash(into:));
}

void sub_252DA4E24()
{
}

void sub_252DA4E3C()
{
}

uint64_t AddressComponents.name.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.name.setter()
{
  uint64_t result = sub_252DB3854();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*AddressComponents.name.modify())()
{
  return nullsub_1;
}

uint64_t AddressComponents.jobTitle.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.jobTitle.setter()
{
  uint64_t result = sub_252DB3B58();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*AddressComponents.jobTitle.modify())()
{
  return nullsub_1;
}

uint64_t AddressComponents.organization.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.organization.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*AddressComponents.organization.modify())()
{
  return nullsub_1;
}

uint64_t AddressComponents.street.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.street.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*AddressComponents.street.modify())()
{
  return nullsub_1;
}

uint64_t AddressComponents.city.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.city.setter()
{
  sub_252DB3D28();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return result;
}

uint64_t (*AddressComponents.city.modify())()
{
  return nullsub_1;
}

uint64_t AddressComponents.state.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.state.setter()
{
  sub_252DB3D28();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*AddressComponents.state.modify())()
{
  return nullsub_1;
}

uint64_t AddressComponents.zipCode.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.zipCode.setter()
{
  sub_252DB3D28();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = v2;
  *(void *)(v1 + 104) = v0;
  return result;
}

uint64_t (*AddressComponents.zipCode.modify())()
{
  return nullsub_1;
}

uint64_t AddressComponents.country.getter()
{
  return sub_252DB35A0();
}

uint64_t AddressComponents.country.setter()
{
  sub_252DB3D28();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 112) = v2;
  *(void *)(v1 + 120) = v0;
  return result;
}

uint64_t (*AddressComponents.country.modify())()
{
  return nullsub_1;
}

void __swiftcall AddressComponents.init(name:jobTitle:organization:street:city:state:zipCode:country:)(IntelligenceFlowContext::AddressComponents *__return_ptr retstr, Swift::String_optional name, Swift::String_optional jobTitle, Swift::String_optional organization, Swift::String_optional street, Swift::String_optional city, Swift::String_optional state, Swift::String_optional zipCode, Swift::String_optional country)
{
  retstr->name = name;
  retstr->jobTitle = jobTitle;
  retstr->organization = organization;
  retstr->street = street;
  retstr->city = city;
  retstr->state = state;
  retstr->zipCode = zipCode;
  retstr->country = country;
}

uint64_t AddressComponents.description.getter()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[9];
  uint64_t v31 = v0[5];
  uint64_t v32 = v0[11];
  uint64_t v33 = v0[13];
  uint64_t v4 = v0[15];
  if (!v0[1])
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
    if (!v1) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v30 = v0[7];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[15];
  sub_252DB37F0();
  uint64_t v7 = sub_252DC30B0();
  uint64_t v10 = sub_252DB3BA8(v7, v8, v9, MEMORY[0x263F8EE78]);
  unint64_t v12 = *((void *)v10 + 2);
  unint64_t v11 = *((void *)v10 + 3);
  if (v12 >= v11 >> 1) {
    uint64_t v10 = sub_252DB3540(v11);
  }
  *((void *)v10 + 2) = v12 + 1;
  uint64_t v13 = &v10[16 * v12];
  *((void *)v13 + 4) = v34;
  *((void *)v13 + 5) = v35;
  uint64_t v4 = v6;
  uint64_t v3 = v5;
  uint64_t v2 = v30;
  if (v1)
  {
LABEL_7:
    sub_252DB37F0();
    sub_252DC30B0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_252DB3564();
    }
    unint64_t v15 = *((void *)v10 + 2);
    unint64_t v14 = *((void *)v10 + 3);
    if (v15 >= v14 >> 1) {
      uint64_t v10 = sub_252DB3540(v14);
    }
    *((void *)v10 + 2) = v15 + 1;
    uint64_t v16 = &v10[16 * v15];
    *((void *)v16 + 4) = v34;
    *((void *)v16 + 5) = v35;
  }
LABEL_12:
  uint64_t v17 = v32;
  if (v31)
  {
    sub_252DC31C0();
    swift_bridgeObjectRelease();
    sub_252DB39E0();
    sub_252DB37F0();
    sub_252DC30B0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_252DB3564();
    }
    unint64_t v19 = *((void *)v10 + 2);
    unint64_t v18 = *((void *)v10 + 3);
    if (v19 >= v18 >> 1) {
      uint64_t v10 = sub_252DB3540(v18);
    }
    *((void *)v10 + 2) = v19 + 1;
    uint64_t v20 = &v10[16 * v19];
    *((void *)v20 + 4) = 0;
    *((void *)v20 + 5) = 0xE000000000000000;
  }
  uint64_t v21 = v33;
  if (v2)
  {
    sub_252DB37F0();
    sub_252DC30B0();
    if ((sub_252DB3B04() & 1) == 0) {
      sub_252DB3564();
    }
    sub_252DB374C();
    if (v23) {
      sub_252DB3540(v22);
    }
    sub_252DB3778();
    uint64_t v17 = v32;
    uint64_t v21 = v33;
  }
  if (v3)
  {
    sub_252DB37F0();
    sub_252DC30B0();
    if ((sub_252DB3B04() & 1) == 0) {
      sub_252DB3564();
    }
    sub_252DB374C();
    if (v23) {
      sub_252DB3540(v24);
    }
    sub_252DB3778();
  }
  if (v17)
  {
    sub_252DB3BE0();
    sub_252DB37F0();
    sub_252DC30B0();
    if ((sub_252DB3B04() & 1) == 0) {
      sub_252DB3564();
    }
    sub_252DB374C();
    if (v23) {
      sub_252DB3540(v25);
    }
    sub_252DB3778();
  }
  if (v21)
  {
    sub_252DB37F0();
    sub_252DC30B0();
    if ((sub_252DB3B04() & 1) == 0) {
      sub_252DB3564();
    }
    sub_252DB374C();
    if (v23) {
      sub_252DB3540(v26);
    }
    sub_252DB3778();
  }
  if (v4)
  {
    sub_252DB37F0();
    sub_252DB39D4();
    sub_252DC30B0();
    if ((sub_252DB3B04() & 1) == 0) {
      sub_252DB3564();
    }
    sub_252DB374C();
    if (v23) {
      sub_252DB3540(v27);
    }
    sub_252DB3778();
  }
  sub_252D8823C(&qword_26B23BFE8);
  sub_252DACF3C((unint64_t *)&qword_26B23BFF0, &qword_26B23BFE8);
  uint64_t v28 = sub_252DC3050();
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t AddressComponents.hash(into:)()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[15];
  uint64_t v8 = v0[11];
  if (v0[1])
  {
    sub_252DC33A0();
    swift_bridgeObjectRetain();
    sub_252DB3D08();
    sub_252DC30A0();
    swift_bridgeObjectRelease();
    if (v1)
    {
LABEL_3:
      sub_252DC33A0();
      swift_bridgeObjectRetain();
      sub_252DC30A0();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_252DC33A0();
    if (v1) {
      goto LABEL_3;
    }
  }
  sub_252DC33A0();
LABEL_6:
  if (v2)
  {
    sub_252DC33A0();
    swift_bridgeObjectRetain();
    sub_252DC30A0();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_8;
    }
  }
  else
  {
    sub_252DC33A0();
    if (v3)
    {
LABEL_8:
      sub_252DC33A0();
      swift_bridgeObjectRetain();
      sub_252DC30A0();
      swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  sub_252DC33A0();
  if (v4)
  {
LABEL_9:
    sub_252DC33A0();
    swift_bridgeObjectRetain();
    sub_252DC30A0();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  sub_252DC33A0();
  if (v8)
  {
LABEL_10:
    sub_252DC33A0();
    swift_bridgeObjectRetain();
    sub_252DC30A0();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_11;
    }
LABEL_19:
    sub_252DC33A0();
    if (v6) {
      goto LABEL_12;
    }
    return sub_252DC33A0();
  }
LABEL_18:
  sub_252DC33A0();
  if (!v5) {
    goto LABEL_19;
  }
LABEL_11:
  sub_252DC33A0();
  swift_bridgeObjectRetain();
  sub_252DC30A0();
  swift_bridgeObjectRelease();
  if (!v6) {
    return sub_252DC33A0();
  }
LABEL_12:
  sub_252DC33A0();
  swift_bridgeObjectRetain();
  sub_252DC30A0();

  return swift_bridgeObjectRelease();
}

uint64_t static AddressComponents.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  uint64_t v12 = a1[9];
  uint64_t v11 = a1[10];
  uint64_t v13 = a1[11];
  uint64_t v108 = a1[12];
  uint64_t v112 = a1[13];
  uint64_t v14 = a1[14];
  uint64_t v111 = a1[15];
  uint64_t v15 = a2[1];
  uint64_t v16 = a2[2];
  uint64_t v18 = a2[3];
  uint64_t v17 = a2[4];
  uint64_t v20 = a2[5];
  uint64_t v19 = a2[6];
  uint64_t v22 = a2[7];
  uint64_t v21 = a2[8];
  uint64_t v24 = a2[9];
  uint64_t v23 = a2[10];
  uint64_t v25 = a2[11];
  uint64_t v109 = a2[12];
  uint64_t v26 = a2[13];
  uint64_t v107 = a2[14];
  uint64_t v110 = a2[15];
  if (!v3)
  {
    if (v15) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v15) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v15) {
    goto LABEL_10;
  }
  uint64_t v100 = a2[7];
  uint64_t v103 = a2[8];
  uint64_t v84 = a1[11];
  uint64_t v85 = a2[13];
  uint64_t v82 = a2[2];
  uint64_t v83 = a1[2];
  uint64_t v28 = a1[14];
  uint64_t v89 = a2[5];
  uint64_t v91 = a1[5];
  uint64_t v29 = a1[10];
  uint64_t v95 = a1[6];
  uint64_t v97 = a2[6];
  uint64_t v30 = a2[11];
  uint64_t v31 = a2[10];
  uint64_t v93 = a1[4];
  uint64_t v32 = a1[8];
  uint64_t v33 = a1[9];
  uint64_t v87 = a2[4];
  uint64_t v34 = a2[9];
  uint64_t v35 = a1[7];
  char v36 = sub_252DC3360();
  uint64_t v22 = v100;
  uint64_t v21 = v103;
  uint64_t v9 = v35;
  uint64_t v24 = v34;
  uint64_t v12 = v33;
  uint64_t v8 = v91;
  uint64_t v10 = v32;
  uint64_t v5 = v93;
  uint64_t v7 = v95;
  uint64_t v23 = v31;
  uint64_t v4 = v83;
  uint64_t v13 = v84;
  uint64_t v25 = v30;
  uint64_t v19 = v97;
  uint64_t v11 = v29;
  uint64_t v17 = v87;
  uint64_t v20 = v89;
  uint64_t v14 = v28;
  uint64_t v16 = v82;
  uint64_t v26 = v85;
  char v37 = v36;
  uint64_t result = 0;
  if (v37)
  {
LABEL_10:
    if (v6)
    {
      if (!v18) {
        return 0;
      }
      if (v4 != v16 || v6 != v18)
      {
        uint64_t v101 = v22;
        uint64_t v104 = v21;
        uint64_t v40 = v14;
        uint64_t v88 = v17;
        uint64_t v90 = v20;
        uint64_t v41 = v11;
        uint64_t v42 = v13;
        uint64_t v43 = v25;
        uint64_t v44 = v23;
        uint64_t v92 = v8;
        uint64_t v94 = v5;
        uint64_t v45 = v10;
        uint64_t v46 = v12;
        uint64_t v47 = v24;
        uint64_t v96 = v7;
        uint64_t v98 = v19;
        uint64_t v48 = v9;
        char v49 = sub_252DC3360();
        uint64_t v9 = v48;
        uint64_t v19 = v98;
        uint64_t v22 = v101;
        uint64_t v21 = v104;
        uint64_t v24 = v47;
        uint64_t v12 = v46;
        uint64_t v20 = v90;
        uint64_t v8 = v92;
        uint64_t v10 = v45;
        uint64_t v5 = v94;
        uint64_t v7 = v96;
        uint64_t v23 = v44;
        uint64_t v25 = v43;
        uint64_t v13 = v42;
        uint64_t v11 = v41;
        uint64_t v17 = v88;
        uint64_t v14 = v40;
        char v50 = v49;
        uint64_t result = 0;
        if ((v50 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v8)
    {
      if (!v20) {
        return 0;
      }
      if (v5 != v17 || v8 != v20)
      {
        uint64_t v102 = v22;
        uint64_t v105 = v21;
        uint64_t v86 = v26;
        uint64_t v99 = v19;
        uint64_t v52 = v14;
        uint64_t v53 = v11;
        uint64_t v54 = v13;
        uint64_t v55 = v25;
        uint64_t v56 = v23;
        uint64_t v57 = v10;
        uint64_t v58 = v12;
        uint64_t v59 = v24;
        uint64_t v60 = v7;
        uint64_t v61 = v9;
        char v62 = sub_252DC3360();
        uint64_t v22 = v102;
        uint64_t v21 = v105;
        uint64_t v9 = v61;
        uint64_t v7 = v60;
        uint64_t v24 = v59;
        uint64_t v12 = v58;
        uint64_t v10 = v57;
        uint64_t v23 = v56;
        uint64_t v25 = v55;
        uint64_t v13 = v54;
        uint64_t v11 = v53;
        uint64_t v14 = v52;
        uint64_t v19 = v99;
        uint64_t v26 = v86;
        char v63 = v62;
        uint64_t result = 0;
        if ((v63 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v20)
    {
      return 0;
    }
    if (v9)
    {
      if (!v22) {
        return 0;
      }
      if (v7 != v19 || v9 != v22)
      {
        uint64_t v106 = v21;
        uint64_t v65 = v14;
        uint64_t v66 = v11;
        uint64_t v67 = v13;
        uint64_t v68 = v25;
        uint64_t v69 = v23;
        uint64_t v70 = v10;
        uint64_t v71 = v12;
        uint64_t v72 = v24;
        char v73 = sub_252DC3360();
        uint64_t v21 = v106;
        uint64_t v24 = v72;
        uint64_t v12 = v71;
        uint64_t v10 = v70;
        uint64_t v23 = v69;
        uint64_t v25 = v68;
        uint64_t v13 = v67;
        uint64_t v11 = v66;
        uint64_t v14 = v65;
        char v74 = v73;
        uint64_t result = 0;
        if ((v74 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v22)
    {
      return 0;
    }
    if (v12)
    {
      if (!v24) {
        return 0;
      }
      if (v10 != v21 || v12 != v24)
      {
        sub_252DC3360();
        uint64_t result = sub_252DB37C0();
        if ((v76 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v24)
    {
      return 0;
    }
    if (v13)
    {
      if (!v25) {
        return 0;
      }
      if (v11 != v23 || v13 != v25)
      {
        sub_252DC3360();
        uint64_t result = sub_252DB37C0();
        if ((v78 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v25)
    {
      return 0;
    }
    if (v112)
    {
      if (!v26) {
        return 0;
      }
      if (v108 != v109 || v112 != v26)
      {
        sub_252DC3360();
        uint64_t result = sub_252DB37C0();
        if ((v80 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v26)
    {
      return 0;
    }
    if (v111)
    {
      if (v110)
      {
        BOOL v81 = v14 == v107 && v111 == v110;
        if (v81 || (sub_252DC3360() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v110)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_252DA5DAC()
{
  unint64_t result = qword_269CA97F8;
  if (!qword_269CA97F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA97F8);
  }
  return result;
}

uint64_t sub_252DA5DF8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252DA5E40(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_252D97EE8();
  uint64_t v4 = sub_252D98338();
  v5(v4);
  return a2;
}

uint64_t sub_252DA5E94(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656C746954626F6ALL && a2 == 0xE800000000000000;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x617A696E6167726FLL && a2 == 0xEC0000006E6F6974;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x746565727473 && a2 == 0xE600000000000000;
        if (v8 || (sub_252DC3360() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 2037672291 && a2 == 0xE400000000000000;
          if (v9 || (sub_252DC3360() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
            if (v10 || (sub_252DC3360() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 0x65646F4370697ALL && a2 == 0xE700000000000000;
              if (v11 || (sub_252DC3360() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else if (a1 == 0x7972746E756F63 && a2 == 0xE700000000000000)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                char v13 = sub_252DC3360();
                swift_bridgeObjectRelease();
                if (v13) {
                  return 7;
                }
                else {
                  return 8;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_252DA61B4()
{
  return 8;
}

uint64_t sub_252DA61BC(char a1)
{
  uint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x656C746954626F6ALL;
      break;
    case 2:
      uint64_t result = 0x617A696E6167726FLL;
      break;
    case 3:
      uint64_t result = 0x746565727473;
      break;
    case 4:
      uint64_t result = 2037672291;
      break;
    case 5:
      uint64_t result = 0x6574617473;
      break;
    case 6:
      uint64_t result = 0x65646F4370697ALL;
      break;
    case 7:
      uint64_t result = 0x7972746E756F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252DA62AC()
{
  return sub_252DA61BC(*v0);
}

uint64_t sub_252DA62B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA5E94(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DA62DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252DA61B4();
  *a1 = result;
  return result;
}

uint64_t sub_252DA6304(uint64_t a1)
{
  unint64_t v2 = sub_252DAC5A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA6340(uint64_t a1)
{
  unint64_t v2 = sub_252DAC5A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void AddressComponents.encode(to:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  sub_252D8823C(&qword_269CA99D8);
  sub_252D89934();
  MEMORY[0x270FA5388](v3);
  sub_252D9E234();
  sub_252DB3798();
  sub_252D88F0C(v2, v2[3]);
  sub_252DAC5A0();
  sub_252DC33E0();
  sub_252DB39FC();
  sub_252DC32E0();
  if (!v0)
  {
    sub_252DB3CF4();
    sub_252DB3630();
    sub_252DB3630();
    sub_252DB3630();
    sub_252DB3630();
    sub_252DB3630();
    sub_252DB3630();
    sub_252DB3630();
  }
  sub_252DB3728();
  v4();
  sub_252D97FF8();
}

uint64_t AddressComponents.hashValue.getter()
{
  return sub_252DC33C0();
}

void AddressComponents.init(from:)()
{
  sub_252D97FE0();
  uint64_t v3 = v2;
  uint64_t v41 = v4;
  sub_252D8823C(&qword_269CA99E8);
  sub_252D89934();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_252D981B8();
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  BOOL v10 = sub_252D88F0C(v3, v8);
  sub_252DAC5A0();
  sub_252DC33D0();
  uint64_t v43 = (uint64_t)v3;
  if (v0)
  {
    sub_252DB36C0();
    sub_252D8931C((uint64_t)v3);
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = v6;
    uint64_t v57 = v50;
    uint64_t v58 = v8;
    uint64_t v59 = v42;
    uint64_t v60 = v0;
    uint64_t v61 = v48;
    char v62 = v3;
    char v63 = v10;
    uint64_t v64 = v9;
    uint64_t v65 = v1;
    uint64_t v66 = v44;
    uint64_t v67 = v46;
    uint64_t v68 = 0;
    uint64_t v69 = 0;
  }
  else
  {
    uint64_t v11 = sub_252DC3250();
    uint64_t v13 = v12;
    uint64_t v40 = v11;
    sub_252DB3C44(1);
    uint64_t v52 = v13;
    uint64_t v39 = sub_252DB3898();
    uint64_t v15 = v14;
    swift_bridgeObjectRetain();
    uint64_t v51 = v15;
    uint64_t v16 = sub_252DB3898();
    uint64_t v18 = v17;
    uint64_t v38 = v16;
    sub_252DB3C44(3);
    uint64_t v37 = sub_252DB3898();
    uint64_t v19 = v18;
    LOBYTE(v54) = 4;
    uint64_t v49 = v20;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_252DB3898();
    uint64_t v23 = v22;
    uint64_t v36 = v21;
    sub_252DB3C44(5);
    uint64_t v24 = sub_252DB3898();
    uint64_t v26 = v25;
    uint64_t v35 = v24;
    sub_252DB3C44(6);
    unint64_t v27 = v23;
    uint64_t v45 = sub_252DB3898();
    uint64_t v47 = v28;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_252DC3250();
    uint64_t v31 = v30;
    uint64_t v34 = v29;
    uint64_t v32 = sub_252DB36EC();
    v33(v32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v53[0] = v40;
    v53[1] = v52;
    v53[2] = v39;
    v53[3] = v51;
    v53[4] = v38;
    v53[5] = v19;
    v53[6] = v37;
    v53[7] = v49;
    v53[8] = v36;
    v53[9] = v27;
    v53[10] = v35;
    v53[11] = v26;
    v53[12] = v45;
    v53[13] = v47;
    v53[14] = v34;
    v53[15] = v31;
    sub_252DAB3C8((uint64_t)v53);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v41, v53, 0x80uLL);
    sub_252D8931C(v43);
    uint64_t v54 = v40;
    uint64_t v55 = v52;
    uint64_t v56 = v39;
    uint64_t v57 = v51;
    uint64_t v58 = v38;
    uint64_t v59 = v19;
    uint64_t v60 = v37;
    uint64_t v61 = v49;
    char v62 = (void *)v36;
    char v63 = v27;
    uint64_t v64 = v35;
    uint64_t v65 = v26;
    uint64_t v66 = v45;
    uint64_t v67 = v47;
    uint64_t v68 = v34;
    uint64_t v69 = v31;
  }
  sub_252DAC5EC((uint64_t)&v54);
  sub_252D97FF8();
}

uint64_t sub_252DA6AEC()
{
  return sub_252DC33C0();
}

void sub_252DA6B2C()
{
}

void sub_252DA6B44()
{
}

uint64_t DetectedDate.startDateComponents.getter()
{
  return sub_252DA7AB8(MEMORY[0x263F063B0]);
}

uint64_t DetectedDate.startDateComponents.setter()
{
  return sub_252DA7B34();
}

uint64_t (*DetectedDate.startDateComponents.modify())()
{
  return nullsub_1;
}

uint64_t DetectedDate.endDateComponents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for DetectedDate(0);
  return sub_252D8FE64(v1 + *(int *)(v3 + 20), a1, &qword_269CA9820);
}

uint64_t DetectedDate.endDateComponents.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DetectedDate(0);
  return sub_252DAC998(a1, v1 + *(int *)(v3 + 20), &qword_269CA9820);
}

uint64_t (*DetectedDate.endDateComponents.modify())()
{
  return nullsub_1;
}

uint64_t DetectedDate.init(startDateComponents:endDateComponents:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a3 + *(int *)(type metadata accessor for DetectedDate(0) + 20);
  uint64_t v7 = sub_252DC2C30();
  uint64_t v8 = sub_252DB3A74();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v8, v9, v10, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a3, a1, v7);
  return sub_252DAC998(a2, v6, &qword_269CA9820);
}

void DetectedDate.description.getter()
{
  sub_252D9806C();
  uint64_t v2 = sub_252D8823C(&qword_269CA9820);
  uint64_t v3 = sub_252D97F80(v2);
  MEMORY[0x270FA5388](v3);
  sub_252D9B27C();
  uint64_t v4 = sub_252DC2C30();
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252DB3588();
  sub_252DA5DF8(&qword_269CA99F0, MEMORY[0x263F063B0]);
  sub_252DC3350();
  sub_252DC30B0();
  uint64_t v6 = swift_bridgeObjectRelease();
  uint64_t v9 = sub_252DB3BA8(v6, v7, v8, MEMORY[0x263F8EE78]);
  unint64_t v11 = *((void *)v9 + 2);
  unint64_t v10 = *((void *)v9 + 3);
  if (v11 >= v10 >> 1) {
    uint64_t v9 = sub_252DB3AD0(v10);
  }
  *((void *)v9 + 2) = v11 + 1;
  uint64_t v12 = &v9[16 * v11];
  *((void *)v12 + 4) = 0x203A7472617453;
  *((void *)v12 + 5) = 0xE700000000000000;
  uint64_t v13 = type metadata accessor for DetectedDate(0);
  sub_252D8FE64(v0 + *(int *)(v13 + 20), v1, &qword_269CA9820);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v1, 1, v4) == 1)
  {
    sub_252D8FF2C(v1, &qword_269CA9820);
  }
  else
  {
    sub_252D9834C();
    v14();
    sub_252DC3350();
    sub_252DC30B0();
    swift_bridgeObjectRelease();
    unint64_t v16 = *((void *)v9 + 2);
    unint64_t v15 = *((void *)v9 + 3);
    if (v16 >= v15 >> 1) {
      uint64_t v9 = sub_252DB3AD0(v15);
    }
    *((void *)v9 + 2) = v16 + 1;
    uint64_t v17 = &v9[16 * v16];
    *((void *)v17 + 4) = 0x203A646E45;
    *((void *)v17 + 5) = 0xE500000000000000;
    uint64_t v18 = sub_252DB3BF0();
    v19(v18);
  }
  sub_252D8823C(&qword_26B23BFE8);
  sub_252DACF3C((unint64_t *)&qword_26B23BFF0, &qword_26B23BFE8);
  sub_252DC3050();
  swift_bridgeObjectRelease();
  sub_252DB35A0();
  sub_252D98084();
}

uint64_t DetectedDate.hash(into:)()
{
  sub_252D9830C();
  uint64_t v3 = sub_252DC2C30();
  sub_252D89934();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_252D9E234();
  uint64_t v7 = sub_252D8823C(&qword_269CA9820);
  uint64_t v8 = sub_252D97F80(v7);
  MEMORY[0x270FA5388](v8);
  sub_252D9B27C();
  sub_252DA5DF8(&qword_269CA9830, MEMORY[0x263F063B0]);
  sub_252DC3040();
  uint64_t v9 = type metadata accessor for DetectedDate(0);
  sub_252D8FE64(v0 + *(int *)(v9 + 20), v2, &qword_269CA9820);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v2, 1, v3) == 1) {
    return sub_252DC33A0();
  }
  sub_252D9834C();
  v11();
  sub_252DC33A0();
  sub_252DC3040();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
}

uint64_t sub_252DA714C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x8000000252DC3D70 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000252DC3D90)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_252DA7238(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_252DA7274()
{
  return sub_252DC33C0();
}

unint64_t sub_252DA72B0()
{
  return sub_252DA7238(*v0);
}

uint64_t sub_252DA72B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA714C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DA72E0(uint64_t a1)
{
  unint64_t v2 = sub_252DAC684();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA731C(uint64_t a1)
{
  unint64_t v2 = sub_252DAC684();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DetectedDate.encode(to:)()
{
  sub_252DB3D40();
  sub_252D8823C(&qword_269CA99F8);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252DAC684();
  sub_252DB375C();
  sub_252DC2C30();
  sub_252DA5DF8(&qword_269CA9A08, MEMORY[0x263F063B0]);
  sub_252DB3B74();
  sub_252DC3340();
  if (!v0)
  {
    type metadata accessor for DetectedDate(0);
    sub_252DB3B74();
    sub_252DC3300();
  }
  sub_252DB35EC();
  return v2();
}

uint64_t DetectedDate.hashValue.getter()
{
  return sub_252DAAB00((void (*)(unsigned char *))DetectedDate.hash(into:));
}

void DetectedDate.init(from:)()
{
  sub_252D97FE0();
  uint64_t v4 = v3;
  uint64_t v17 = v5;
  uint64_t v6 = sub_252D8823C(&qword_269CA9820);
  uint64_t v7 = sub_252D97F80(v6);
  MEMORY[0x270FA5388](v7);
  sub_252DB3684();
  uint64_t v8 = sub_252DC2C30();
  sub_252D89934();
  MEMORY[0x270FA5388](v9);
  sub_252D9B27C();
  sub_252D8823C(&qword_269CA9A10);
  sub_252D89934();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_252DB3934();
  uint64_t v12 = type metadata accessor for DetectedDate(v11);
  uint64_t v13 = sub_252D97F80(v12);
  MEMORY[0x270FA5388](v13);
  sub_252D981D0();
  uint64_t v18 = v2 + *(int *)(v14 + 28);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v18, 1, 1, v8);
  sub_252D88F0C(v4, v4[3]);
  sub_252DAC684();
  sub_252DC33D0();
  if (v0)
  {
    sub_252D8931C((uint64_t)v4);
    sub_252D8FF2C(v18, &qword_269CA9820);
  }
  else
  {
    sub_252DA5DF8(&qword_269CA9A18, MEMORY[0x263F063B0]);
    sub_252DC32B0();
    sub_252D9834C();
    v15();
    sub_252DC3270();
    sub_252D980DC();
    v16();
    sub_252DAC998(v1, v18, &qword_269CA9820);
    sub_252DA5E40(v2, v17, (void (*)(void))type metadata accessor for DetectedDate);
    sub_252D8931C((uint64_t)v4);
    sub_252DA4D58();
  }
  sub_252D97FF8();
}

uint64_t sub_252DA77E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_252DAADEC(a1, a2, a3, (void (*)(unsigned char *))DetectedDate.hash(into:));
}

void sub_252DA7800()
{
}

uint64_t sub_252DA7818()
{
  return DetectedDate.encode(to:)();
}

uint64_t (*DetectedPhoneNumber.phoneNumber.modify())()
{
  return nullsub_1;
}

uint64_t DetectedPhoneNumber.description.getter()
{
  return sub_252DB3870(16, 0x754E20656E6F6850);
}

uint64_t sub_252DA7878(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252DA7918()
{
  return 0x6D754E656E6F6870;
}

uint64_t sub_252DA793C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA7878(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252DA7968(uint64_t a1)
{
  unint64_t v2 = sub_252DAC6D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA79A4(uint64_t a1)
{
  unint64_t v2 = sub_252DAC6D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DetectedPhoneNumber.encode(to:)()
{
}

void DetectedPhoneNumber.init(from:)()
{
}

void sub_252DA7A6C()
{
}

void sub_252DA7A84()
{
}

uint64_t DetectedLink.url.getter()
{
  return sub_252DA7AB8(MEMORY[0x263F06EA8]);
}

uint64_t sub_252DA7AB8(void (*a1)(void))
{
  a1(0);
  sub_252D97EE8();
  uint64_t v1 = sub_252DB35A0();

  return v2(v1);
}

uint64_t DetectedLink.url.setter()
{
  return sub_252DA7B34();
}

uint64_t sub_252DA7B34()
{
  uint64_t v0 = sub_252D9830C();
  v1(v0);
  sub_252D97EE8();
  uint64_t v2 = sub_252DB3D08();

  return v3(v2);
}

uint64_t (*DetectedLink.url.modify())()
{
  return nullsub_1;
}

uint64_t DetectedLink.init(url:)()
{
  sub_252DC2CC0();
  sub_252D97EE8();
  uint64_t v0 = sub_252DB3D08();

  return v1(v0);
}

uint64_t DetectedLink.description.getter()
{
  sub_252DB3C5C();
  uint64_t v2 = v0;
  sub_252DC2CC0();
  sub_252DA5DF8(&qword_269CA9818, MEMORY[0x263F06EA8]);
  sub_252DC3350();
  sub_252DC30B0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DetectedLink.hash(into:)()
{
  sub_252D9830C();
  sub_252DC2CC0();
  sub_252DA5DF8(&qword_269CA9828, MEMORY[0x263F06EA8]);

  return sub_252DC3040();
}

uint64_t sub_252DA7D20(uint64_t a1, uint64_t a2)
{
  if (a1 == 7107189 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252DA7D98()
{
  return 7107189;
}

uint64_t sub_252DA7DAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA7D20(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252DA7DD8(uint64_t a1)
{
  unint64_t v2 = sub_252DAC71C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA7E14(uint64_t a1)
{
  unint64_t v2 = sub_252DAC71C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DetectedLink.encode(to:)()
{
  sub_252DB3D40();
  sub_252D8823C(&qword_269CA9A38);
  sub_252D89934();
  MEMORY[0x270FA5388](v0);
  sub_252D97F3C();
  sub_252DAC71C();
  sub_252DB375C();
  sub_252DC2CC0();
  sub_252DA5DF8(&qword_269CA9A48, MEMORY[0x263F06EA8]);
  sub_252DC3340();
  sub_252DB35EC();
  return v1();
}

uint64_t DetectedLink.hashValue.getter()
{
  return sub_252DC33C0();
}

void DetectedLink.init(from:)()
{
  sub_252D97FE0();
  char v3 = v2;
  uint64_t v15 = v4;
  uint64_t v5 = sub_252DC2CC0();
  sub_252D89934();
  uint64_t v14 = v6;
  MEMORY[0x270FA5388](v7);
  sub_252D97F28();
  uint64_t v16 = v8;
  sub_252D8823C(&qword_269CA9A50);
  sub_252D89934();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_252DB3918();
  uint64_t v11 = type metadata accessor for DetectedLink(v10);
  uint64_t v12 = sub_252D97F80(v11);
  MEMORY[0x270FA5388](v12);
  sub_252D981A0();
  sub_252D88F0C(v3, v3[3]);
  sub_252DAC71C();
  sub_252DC33D0();
  if (!v0)
  {
    sub_252DA5DF8(&qword_269CA9A58, MEMORY[0x263F06EA8]);
    sub_252DC32B0();
    sub_252D980DC();
    v13();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v1, v16, v5);
    sub_252DA4DA8(v1, v15, (void (*)(void))type metadata accessor for DetectedLink);
  }
  sub_252D8931C((uint64_t)v3);
  sub_252D97FF8();
}

uint64_t sub_252DA8200()
{
  return sub_252DC33C0();
}

void sub_252DA8284()
{
}

uint64_t sub_252DA829C()
{
  return DetectedLink.encode(to:)();
}

uint64_t DetectedAddress.addressComponents.getter()
{
  sub_252DB39A4(v3);
  uint64_t v0 = (void *)sub_252DB35A0();
  memcpy(v0, v1, 0x80uLL);
  return sub_252DAB3C8((uint64_t)v3);
}

void *DetectedAddress.addressComponents.setter()
{
  sub_252DB39A4(v3);
  sub_252DAC5EC((uint64_t)v3);
  uint64_t v0 = (void *)sub_252DB3D08();
  return memcpy(v0, v1, 0x80uLL);
}

uint64_t (*DetectedAddress.addressComponents.modify())()
{
  return nullsub_1;
}

void __swiftcall DetectedAddress.init(addressComponents:)(IntelligenceFlowContext::DetectedAddress *__return_ptr retstr, IntelligenceFlowContext::AddressComponents *addressComponents)
{
}

uint64_t DetectedAddress.description.getter()
{
  sub_252DB39A4(v3);
  sub_252DB387C();
  uint64_t v2 = v0;
  sub_252DAB3C8((uint64_t)v3);
  AddressComponents.description.getter();
  sub_252DC30B0();
  swift_bridgeObjectRelease();
  sub_252DAC5EC((uint64_t)v3);
  return v2;
}

uint64_t sub_252DA83D4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x8000000252DC3DB0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_252DA845C()
{
  return 0xD000000000000011;
}

uint64_t sub_252DA847C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA83D4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252DA84A8(uint64_t a1)
{
  unint64_t v2 = sub_252DAC768();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA84E4(uint64_t a1)
{
  unint64_t v2 = sub_252DAC768();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DetectedAddress.encode(to:)()
{
  sub_252DB3D40();
  sub_252D8823C(&qword_269CA9A60);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252DAC768();
  sub_252DB375C();
  memcpy(__dst, v0, sizeof(__dst));
  sub_252DAC7B4();
  sub_252DC3340();
  sub_252DB35EC();
  return v2();
}

uint64_t DetectedAddress.hashValue.getter()
{
  return sub_252DC33C0();
}

void DetectedAddress.init(from:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_252D8823C(&qword_269CA9A78);
  sub_252D89934();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v11[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_252D88F0C(v2, v2[3]);
  sub_252DAC768();
  sub_252DC33D0();
  if (!v0)
  {
    sub_252DAC800();
    sub_252DC32B0();
    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v5);
    memcpy(v4, v11, 0x80uLL);
  }
  sub_252D8931C((uint64_t)v2);
  sub_252D97FF8();
}

void sub_252DA87A4()
{
}

uint64_t sub_252DA87BC()
{
  return DetectedAddress.encode(to:)();
}

uint64_t DetectedPerson.name.getter()
{
  return sub_252DB35A0();
}

uint64_t DetectedPerson.name.setter()
{
  uint64_t result = sub_252DB3854();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*DetectedPerson.name.modify())()
{
  return nullsub_1;
}

uint64_t DetectedPerson.emailAddress.getter()
{
  return sub_252DB35A0();
}

uint64_t DetectedPerson.emailAddress.setter()
{
  uint64_t result = sub_252DB3B58();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*DetectedPerson.emailAddress.modify())()
{
  return nullsub_1;
}

uint64_t DetectedPerson.phoneNumber.getter()
{
  return sub_252DB35A0();
}

uint64_t DetectedPerson.phoneNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*DetectedPerson.phoneNumber.modify())()
{
  return nullsub_1;
}

uint64_t DetectedPerson.contactId.getter()
{
  return sub_252DB35A0();
}

uint64_t DetectedPerson.contactId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*DetectedPerson.contactId.modify())()
{
  return nullsub_1;
}

void __swiftcall DetectedPerson.init(name:)(IntelligenceFlowContext::DetectedPerson *__return_ptr retstr, Swift::String name)
{
  retstr->name = name;
  retstr->emailAddress = 0u;
  retstr->phoneNumber = 0u;
  retstr->contactId = 0u;
}

void __swiftcall DetectedPerson.init(name:emailAddress:phoneNumber:)(IntelligenceFlowContext::DetectedPerson *__return_ptr retstr, Swift::String name, Swift::String_optional emailAddress, Swift::String_optional phoneNumber)
{
  retstr->name = name;
  retstr->emailAddress = emailAddress;
  retstr->phoneNumber = phoneNumber;
  retstr->contactId.value._countAndFlagsBits = 0;
  retstr->contactId.value._object = 0;
}

void __swiftcall DetectedPerson.init(inPerson:)(IntelligenceFlowContext::DetectedPerson_optional *__return_ptr retstr, INPerson inPerson)
{
  sub_252D9806C();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_252D8823C(&qword_269CA9A88);
  uint64_t v10 = sub_252D97F80(v9);
  MEMORY[0x270FA5388](v10);
  sub_252DB3824();
  MEMORY[0x270FA5388](v11);
  sub_252DB3C98();
  MEMORY[0x270FA5388](v12);
  sub_252DB3A9C();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v63 - v14;
  sub_252D8823C(&qword_269CA9A90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252DC71D0;
  id v17 = objc_msgSend(v6, sel_nameComponents);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_252DC2C60();

    uint64_t v19 = sub_252DC2C70();
    uint64_t v20 = v4;
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v19 = sub_252DC2C70();
    uint64_t v20 = v4;
    uint64_t v21 = 1;
  }
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v20, v21, 1, v19);
  sub_252DAC84C(v4, (uint64_t)v15);
  sub_252DC2C70();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v19))
  {
    sub_252D8FF2C((uint64_t)v15, &qword_269CA9A88);
    *(void *)(inited + 32) = 0;
    *(void *)(inited + 40) = 0;
  }
  else
  {
    *(void *)(inited + 32) = sub_252DC2C40();
    *(void *)(inited + 40) = v22;
    sub_252D8FF2C((uint64_t)v15, &qword_269CA9A88);
  }
  id v23 = objc_msgSend(v6, sel_nameComponents);
  if (v23)
  {
    uint64_t v24 = v23;
    sub_252DC2C60();

    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v3, v25, 1, v19);
  uint64_t v26 = sub_252DB39FC();
  sub_252DAC84C(v26, v27);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v2, 1, v19))
  {
    sub_252D8FF2C(v2, &qword_269CA9A88);
    *(void *)(inited + 48) = 0;
    *(void *)(inited + 56) = 0;
  }
  else
  {
    *(void *)(inited + 48) = sub_252DC2C50();
    *(void *)(inited + 56) = v28;
    sub_252D8FF2C(v2, &qword_269CA9A88);
  }
  uint64_t v29 = *(void *)(inited + 40);
  if (v29)
  {
    uint64_t v30 = *(void *)(inited + 32);
    uint64_t v31 = swift_bridgeObjectRetain();
    uint64_t v34 = sub_252DB3BA8(v31, v32, v33, MEMORY[0x263F8EE78]);
    unint64_t v36 = *((void *)v34 + 2);
    unint64_t v35 = *((void *)v34 + 3);
    if (v36 >= v35 >> 1) {
      uint64_t v34 = sub_252DB3AAC(v35);
    }
    *((void *)v34 + 2) = v36 + 1;
    uint64_t v37 = &v34[16 * v36];
    *((void *)v37 + 4) = v30;
    *((void *)v37 + 5) = v29;
  }
  else
  {
    uint64_t v34 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v38 = *(void *)(inited + 56);
  if (v38)
  {
    uint64_t v39 = *(void *)(inited + 48);
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v34 = sub_252DABC44(0, *((void *)v34 + 2) + 1, 1, (uint64_t)v34);
    }
    unint64_t v41 = *((void *)v34 + 2);
    unint64_t v40 = *((void *)v34 + 3);
    if (v41 >= v40 >> 1) {
      uint64_t v34 = sub_252DB3AAC(v40);
    }
    *((void *)v34 + 2) = v41 + 1;
    uint64_t v42 = &v34[16 * v41];
    *((void *)v42 + 4) = v39;
    *((void *)v42 + 5) = v38;
  }
  swift_bridgeObjectRelease();
  v63[1] = v34;
  sub_252D8823C(&qword_26B23BFE8);
  sub_252DACF3C((unint64_t *)&qword_26B23BFF0, &qword_26B23BFE8);
  uint64_t v43 = sub_252DC3050();
  unint64_t v45 = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = HIBYTE(v45) & 0xF;
  if ((v45 & 0x2000000000000000) == 0) {
    uint64_t v46 = v43 & 0xFFFFFFFFFFFFLL;
  }
  if (v46)
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_252DAC374(v6);
    uint64_t v49 = v48;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v50 = objc_msgSend(v6, sel_personHandle);
    v63[0] = v47;
    if (v50)
    {
      uint64_t v51 = v50;
      id v52 = objc_msgSend(v50, sel_type);
      if (v52 == (id)1)
      {
        id v58 = objc_msgSend(v51, sel_value);
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = sub_252DC3080();
          uint64_t v62 = v61;
        }
        else
        {

          uint64_t v60 = 0;
          uint64_t v62 = 0;
        }
        swift_bridgeObjectRelease();
        goto LABEL_41;
      }
      if (v52 == (id)2)
      {
        id v53 = objc_msgSend(v51, sel_value);
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = sub_252DC3080();
          uint64_t v57 = v56;
        }
        else
        {

          uint64_t v55 = 0;
          uint64_t v57 = 0;
        }
        swift_bridgeObjectRelease();
        uint64_t v60 = 0;
        uint64_t v62 = 0;
        goto LABEL_42;
      }
    }
    uint64_t v60 = 0;
    uint64_t v62 = 0;
LABEL_41:
    uint64_t v55 = 0;
    uint64_t v57 = 0;
LABEL_42:
    swift_bridgeObjectRetain();
    *uint64_t v8 = v43;
    v8[1] = v45;
    v8[2] = v60;
    v8[3] = v62;
    v8[4] = v55;
    v8[5] = v57;
    v8[6] = v63[0];
    v8[7] = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();

  *((_OWORD *)v8 + 2) = 0u;
  *((_OWORD *)v8 + 3) = 0u;
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
LABEL_43:
  sub_252D98084();
}

uint64_t DetectedPerson.description.getter()
{
  sub_252DB3A40();
  sub_252DC31C0();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "Person Name: ");
  swift_bridgeObjectRetain();
  sub_252DB3B8C();
  swift_bridgeObjectRelease();
  sub_252DC30B0();
  swift_bridgeObjectRetain();
  sub_252DB3B8C();
  swift_bridgeObjectRelease();
  sub_252DC30B0();
  return v1[0];
}

void DetectedPerson.hash(into:)()
{
  sub_252D9806C();
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[7];
  swift_bridgeObjectRetain();
  sub_252DC30A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_252DC33A0();
    swift_bridgeObjectRetain();
    sub_252DB39D4();
    sub_252DC30A0();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_3;
    }
LABEL_8:
    sub_252DC33A0();
    if (v3) {
      goto LABEL_4;
    }
LABEL_9:
    sub_252DC33A0();
    sub_252D98084();
    return;
  }
  sub_252DC33A0();
  if (!v2) {
    goto LABEL_8;
  }
LABEL_3:
  sub_252DC33A0();
  swift_bridgeObjectRetain();
  sub_252DC30A0();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_9;
  }
LABEL_4:
  sub_252DC33A0();
  swift_bridgeObjectRetain();
  sub_252DC30A0();
  sub_252D98084();
  swift_bridgeObjectRelease();
}

uint64_t sub_252DA9118(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6464416C69616D65 && a2 == 0xEC00000073736572;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x49746361746E6F63 && a2 == 0xE900000000000064)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_252DC3360();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_252DA92F4(char a1)
{
  uint64_t result = 1701667182;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6464416C69616D65;
      break;
    case 2:
      uint64_t result = 0x6D754E656E6F6870;
      break;
    case 3:
      uint64_t result = 0x49746361746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252DA9394()
{
  return sub_252DA92F4(*v0);
}

uint64_t sub_252DA939C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA9118(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DA93C4(uint64_t a1)
{
  unint64_t v2 = sub_252DAC8B4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA9400(uint64_t a1)
{
  unint64_t v2 = sub_252DAC8B4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DetectedPerson.encode(to:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  sub_252D8823C(&qword_269CA9A98);
  sub_252D89934();
  MEMORY[0x270FA5388](v3);
  sub_252D9E234();
  sub_252DB3798();
  sub_252D88F0C(v2, v2[3]);
  sub_252DAC8B4();
  sub_252DC33E0();
  sub_252DC3310();
  if (!v0)
  {
    sub_252DB3CF4();
    sub_252DB366C();
    sub_252DB366C();
    sub_252DB366C();
  }
  sub_252DB3728();
  v4();
  sub_252D97FF8();
}

uint64_t DetectedPerson.hashValue.getter()
{
  return sub_252DC33C0();
}

void DetectedPerson.init(from:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_252D8823C(&qword_269CA9AA8);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D981D0();
  sub_252D88F0C(v2, v2[3]);
  sub_252DAC8B4();
  sub_252DC33D0();
  if (v0)
  {
    sub_252D8931C((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_252DC3280();
    uint64_t v8 = v7;
    uint64_t v24 = v6;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_252DB3A08();
    uint64_t v11 = v10;
    uint64_t v22 = v9;
    id v23 = v4;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_252DB3A08();
    uint64_t v14 = v13;
    uint64_t v21 = v12;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_252DB3A08();
    uint64_t v17 = v16;
    uint64_t v20 = v15;
    uint64_t v18 = sub_252DB3700();
    v19(v18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *id v23 = v24;
    v23[1] = v8;
    v23[2] = v22;
    v23[3] = v11;
    v23[4] = v21;
    v23[5] = v14;
    v23[6] = v20;
    v23[7] = v17;
    sub_252D8931C((uint64_t)v2);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_252D97FF8();
}

uint64_t sub_252DA988C()
{
  return sub_252DC33C0();
}

void sub_252DA98E4()
{
}

void sub_252DA98FC()
{
}

uint64_t DetectedPlace.place.getter()
{
  return sub_252DB35A0();
}

uint64_t DetectedPlace.place.setter()
{
  uint64_t result = sub_252DB3854();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*DetectedPlace.place.modify())()
{
  return nullsub_1;
}

IntelligenceFlowContext::DetectedPlace __swiftcall DetectedPlace.init(place:)(IntelligenceFlowContext::DetectedPlace place)
{
  *uint64_t v1 = place;
  return place;
}

uint64_t DetectedPlace.description.getter()
{
  sub_252DB3BE0();
  uint64_t v2 = v0;
  swift_bridgeObjectRetain();
  sub_252DB3B8C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_252DA99EC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6563616C70 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252DA9A6C()
{
  return 0x6563616C70;
}

uint64_t sub_252DA9A84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA99EC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252DA9AB0(uint64_t a1)
{
  unint64_t v2 = sub_252DAC900();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA9AEC(uint64_t a1)
{
  unint64_t v2 = sub_252DAC900();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DetectedPlace.encode(to:)()
{
}

void DetectedPlace.init(from:)()
{
}

void sub_252DA9BA8()
{
}

void sub_252DA9BC0()
{
}

uint64_t (*DetectedOrganization.organization.modify())()
{
  return nullsub_1;
}

uint64_t DetectedOrganization.description.getter()
{
  return sub_252DB3870(16, 0x617A696E6167724FLL);
}

uint64_t sub_252DA9C1C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x617A696E6167726FLL && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252DA9CBC()
{
  return 0x617A696E6167726FLL;
}

uint64_t sub_252DA9CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DA9C1C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252DA9D0C(uint64_t a1)
{
  unint64_t v2 = sub_252DAC94C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DA9D48(uint64_t a1)
{
  unint64_t v2 = sub_252DAC94C();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DetectedOrganization.encode(to:)()
{
}

void DetectedOrganization.init(from:)()
{
}

void sub_252DA9E04()
{
}

void sub_252DA9E1C()
{
}

uint64_t DetectedAppEntity.typeIdentifier.getter()
{
  return sub_252DB35A0();
}

uint64_t DetectedAppEntity.typeIdentifier.setter()
{
  uint64_t result = sub_252DB3854();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*DetectedAppEntity.typeIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t DetectedAppEntity.instanceIdentifier.getter()
{
  return sub_252DB35A0();
}

uint64_t DetectedAppEntity.instanceIdentifier.setter()
{
  uint64_t result = sub_252DB3B58();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*DetectedAppEntity.instanceIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t DetectedAppEntity.entityIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  sub_252DB3DAC();
  return sub_252D8FE64(v1 + v3, a1, &qword_269CA91E8);
}

uint64_t DetectedAppEntity.entityIdentifier.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DetectedAppEntity(0);
  return sub_252DAC998(a1, v1 + *(int *)(v3 + 24), &qword_269CA91E8);
}

uint64_t (*DetectedAppEntity.entityIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t DetectedAppEntity.init(entityIdentifier:)@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DetectedAppEntity(0);
  *a1 = 0u;
  a1[1] = 0u;
  uint64_t v3 = (uint64_t)a1 + *(int *)(v2 + 24);
  uint64_t v4 = sub_252DC2FA0();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v3, 1, 1, v4);
  uint64_t v5 = sub_252DB35A0();
  return sub_252DAC998(v5, v6, v7);
}

void DetectedAppEntity.init(typeId:instanceId:displayRepresentation:appBundleId:)()
{
  sub_252D9806C();
  uint64_t v34 = v2;
  uint64_t v35 = v3;
  uint64_t v36 = v5;
  uint64_t v37 = v4;
  uint64_t v38 = v6;
  uint64_t v39 = v7;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = type metadata accessor for DetectedAppEntity(0);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  sub_252D9E234();
  uint64_t v14 = sub_252D8823C(&qword_269CA9AE0);
  uint64_t v15 = sub_252D97F80(v14);
  MEMORY[0x270FA5388](v15);
  sub_252D98020();
  uint64_t v16 = sub_252D8823C(&qword_269CA91E8);
  uint64_t v17 = sub_252D97F80(v16);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_252DC3010();
  sub_252D89934();
  uint64_t v22 = v21;
  MEMORY[0x270FA5388](v23);
  sub_252DB3A9C();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (uint64_t *)((char *)&v34 - v25);
  uint64_t v27 = (void *)swift_allocObject();
  uint64_t v28 = v35;
  v27[2] = v34;
  v27[3] = v28;
  v27[4] = v11;
  v27[5] = v9;
  *uint64_t v26 = v27;
  (*(void (**)(void *, void, uint64_t))(v22 + 104))(v26, *MEMORY[0x263F80740], v20);
  uint64_t v29 = sub_252DB39D4();
  v30(v29);
  uint64_t v31 = v36;
  sub_252D8FE64(v36, v0, &qword_269CA9AE0);
  sub_252DC2F90();
  uint64_t v32 = sub_252DC2FA0();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v19, 0, 1, v32);
  *uint64_t v1 = 0u;
  v1[1] = 0u;
  uint64_t v33 = (uint64_t)v1 + *(int *)(v13 + 32);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v33, 1, 1, v32);
  sub_252DAC998((uint64_t)v19, v33, &qword_269CA91E8);
  sub_252DA4DA8((uint64_t)v1, v39, (void (*)(void))type metadata accessor for DetectedAppEntity);
  sub_252D8FF2C(v31, &qword_269CA9AE0);
  (*(void (**)(void *, uint64_t))(v22 + 8))(v26, v20);
  sub_252D98084();
}

uint64_t DetectedAppEntity.init(identifier:)@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for DetectedAppEntity(0);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  sub_252DC2FA0();
  uint64_t v2 = sub_252DB3A74();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v2, v3, v4, v5);
  unint64_t v6 = sub_252DACA34();
  uint64_t v7 = MEMORY[0x2533CA770](47, 0xE100000000000000, 1, 1, MEMORY[0x263F8D310], v6);
  swift_bridgeObjectRelease();
  if (*(void *)(v7 + 16) != 2) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_252DB3C1C();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v11;
  if (*(void *)(v7 + 16) < 2uLL)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_252DB3C1C();
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(a1 + 16) = v14;
    *(void *)(a1 + 24) = v16;
  }
  return result;
}

uint64_t DetectedAppEntity.init(typeIdentifier:instanceIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  sub_252DB3DAC();
  uint64_t v11 = (uint64_t)a5 + v10;
  uint64_t v12 = sub_252DC2FA0();
  uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwst_0(v11, 1, 1, v12);
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

unint64_t DetectedAppEntity.description.getter()
{
  return 0xD000000000000017;
}

uint64_t DetectedAppEntity.hash(into:)()
{
  uint64_t v2 = sub_252DC2FA0();
  sub_252D89934();
  MEMORY[0x270FA5388](v3);
  sub_252DB3588();
  uint64_t v4 = sub_252D8823C(&qword_269CA91E8);
  uint64_t v5 = sub_252D97F80(v4);
  MEMORY[0x270FA5388](v5);
  sub_252D9B27C();
  if (*(void *)(v0 + 8))
  {
    sub_252DC33A0();
    swift_bridgeObjectRetain();
    sub_252DC30A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252DC33A0();
  }
  if (*(void *)(v0 + 24))
  {
    sub_252DC33A0();
    swift_bridgeObjectRetain();
    sub_252DC30A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252DC33A0();
  }
  sub_252DB3DAC();
  sub_252D8FE64(v0 + v6, v1, &qword_269CA91E8);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v1, 1, v2) == 1) {
    return sub_252DC33A0();
  }
  sub_252D9834C();
  v8();
  sub_252DC33A0();
  sub_252DA5DF8(&qword_269CA9AF0, MEMORY[0x263F80388]);
  sub_252DB3D34();
  sub_252DC3040();
  uint64_t v9 = sub_252DB3BF0();
  return v10(v9);
}

uint64_t sub_252DAA6D8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E65644965707974 && a2 == 0xEE00726569666974;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000252DC3DD0 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000252DC3DF0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_252DAA848(char a1)
{
  if (!a1) {
    return 0x6E65644965707974;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0xD000000000000010;
}

uint64_t sub_252DAA8B8()
{
  return sub_252DAA848(*v0);
}

uint64_t sub_252DAA8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DAA6D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DAA8E8(uint64_t a1)
{
  unint64_t v2 = sub_252DACA80();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DAA924(uint64_t a1)
{
  unint64_t v2 = sub_252DACA80();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DetectedAppEntity.encode(to:)()
{
  sub_252D8823C(&qword_269CA9AF8);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D97F3C();
  sub_252DACA80();
  sub_252DB375C();
  sub_252DB366C();
  if (!v0)
  {
    sub_252DB366C();
    type metadata accessor for DetectedAppEntity(0);
    sub_252DC2FA0();
    sub_252DA5DF8(&qword_269CA9210, MEMORY[0x263F80388]);
    sub_252DC3300();
  }
  sub_252DB35EC();
  return v2();
}

uint64_t DetectedAppEntity.hashValue.getter()
{
  return sub_252DAAB00((void (*)(unsigned char *))DetectedAppEntity.hash(into:));
}

uint64_t sub_252DAAB00(void (*a1)(unsigned char *))
{
  sub_252D981F4();
  a1(v3);
  return sub_252DC33C0();
}

void DetectedAppEntity.init(from:)()
{
  sub_252D97FE0();
  uint64_t v3 = v2;
  uint64_t v23 = v4;
  uint64_t v5 = sub_252D8823C(&qword_269CA91E8);
  uint64_t v6 = sub_252D97F80(v5);
  MEMORY[0x270FA5388](v6);
  sub_252DB396C(v7, v22);
  sub_252D8823C(&qword_269CA9B08);
  sub_252D89934();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_252DB3684();
  uint64_t v10 = type metadata accessor for DetectedAppEntity(v9);
  uint64_t v11 = sub_252D97F80(v10);
  MEMORY[0x270FA5388](v11);
  sub_252D9B27C();
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  uint64_t v13 = v1 + *(int *)(v12 + 32);
  uint64_t v14 = sub_252DC2FA0();
  uint64_t v15 = sub_252DB3A74();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v15, v16, v17, v14);
  sub_252D88F0C(v3, v3[3]);
  sub_252DACA80();
  sub_252DC33D0();
  if (!v0)
  {
    *(void *)uint64_t v1 = sub_252DC3250();
    *(void *)(v1 + 8) = v18;
    *(void *)(v1 + 16) = sub_252DC3250();
    *(void *)(v1 + 24) = v19;
    sub_252DA5DF8(&qword_269CA9230, MEMORY[0x263F80388]);
    sub_252DC3270();
    uint64_t v20 = sub_252DB3D14();
    v21(v20);
    sub_252DAC998(v24, v13, &qword_269CA91E8);
    sub_252DA5E40(v1, v23, (void (*)(void))type metadata accessor for DetectedAppEntity);
  }
  sub_252D8931C((uint64_t)v3);
  sub_252DA4D58();
  sub_252D97FF8();
}

uint64_t sub_252DAADD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_252DAADEC(a1, a2, a3, (void (*)(unsigned char *))DetectedAppEntity.hash(into:));
}

uint64_t sub_252DAADEC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *))
{
  sub_252DC3380();
  a4(v6);
  return sub_252DC33C0();
}

void sub_252DAAE30()
{
}

uint64_t sub_252DAAE48()
{
  return DetectedAppEntity.encode(to:)();
}

uint64_t (*DetectedAppIntent.identifier.modify())()
{
  return nullsub_1;
}

uint64_t DetectedAppIntent.description.getter()
{
  return sub_252DAAEA4(25, 0xD000000000000017);
}

uint64_t sub_252DAAEA4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberV4hash4intoys6HasherVz_tF_0()
{
  swift_bridgeObjectRetain();
  sub_252DC30A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252DAAF78(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252DAB00C()
{
  return 0x696669746E656469;
}

uint64_t sub_252DAB02C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DAAF78(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252DAB058(uint64_t a1)
{
  unint64_t v2 = sub_252DACACC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DAB094(uint64_t a1)
{
  unint64_t v2 = sub_252DACACC();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DetectedAppIntent.encode(to:)()
{
}

void sub_252DAB10C()
{
  sub_252D97FE0();
  uint64_t v6 = v0;
  sub_252D8823C(v1);
  sub_252D89934();
  MEMORY[0x270FA5388](v2);
  sub_252D981A0();
  char v3 = (void *)sub_252DB39FC();
  sub_252D88F0C(v3, v4);
  v6();
  sub_252DC33E0();
  sub_252DC3310();
  sub_252DB39D4();
  sub_252DB35EC();
  v5();
  sub_252D97FF8();
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberV9hashValueSivg_0()
{
  return sub_252DC33C0();
}

void DetectedAppIntent.init(from:)()
{
}

void sub_252DAB294()
{
  sub_252D97FE0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v12 = v5;
  sub_252D8823C(v6);
  sub_252D89934();
  MEMORY[0x270FA5388](v7);
  sub_252D981B8();
  sub_252D88F0C(v4, v4[3]);
  v2();
  sub_252DC33D0();
  if (!v0)
  {
    uint64_t v8 = sub_252DC3280();
    uint64_t v10 = v9;
    sub_252DB35EC();
    v11();
    *uint64_t v12 = v8;
    v12[1] = v10;
  }
  sub_252D8931C((uint64_t)v4);
  sub_252D97FF8();
}

uint64_t sub_252DAB3C8(uint64_t a1)
{
  return a1;
}

unint64_t sub_252DAB460()
{
  unint64_t result = qword_269CA98A8;
  if (!qword_269CA98A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98A8);
  }
  return result;
}

unint64_t sub_252DAB4AC()
{
  unint64_t result = qword_269CA98B0;
  if (!qword_269CA98B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98B0);
  }
  return result;
}

unint64_t sub_252DAB4F8()
{
  unint64_t result = qword_269CA98B8;
  if (!qword_269CA98B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98B8);
  }
  return result;
}

unint64_t sub_252DAB544()
{
  unint64_t result = qword_269CA98C0;
  if (!qword_269CA98C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98C0);
  }
  return result;
}

unint64_t sub_252DAB590()
{
  unint64_t result = qword_269CA98D0;
  if (!qword_269CA98D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98D0);
  }
  return result;
}

unint64_t sub_252DAB5DC()
{
  unint64_t result = qword_269CA98D8;
  if (!qword_269CA98D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98D8);
  }
  return result;
}

unint64_t sub_252DAB628()
{
  unint64_t result = qword_269CA98E0;
  if (!qword_269CA98E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98E0);
  }
  return result;
}

unint64_t sub_252DAB674()
{
  unint64_t result = qword_269CA98E8;
  if (!qword_269CA98E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98E8);
  }
  return result;
}

unint64_t sub_252DAB6C0()
{
  unint64_t result = qword_269CA98F0;
  if (!qword_269CA98F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98F0);
  }
  return result;
}

unint64_t sub_252DAB70C()
{
  unint64_t result = qword_269CA98F8;
  if (!qword_269CA98F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA98F8);
  }
  return result;
}

unint64_t sub_252DAB758()
{
  unint64_t result = qword_269CA9900;
  if (!qword_269CA9900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9900);
  }
  return result;
}

unint64_t sub_252DAB7A4()
{
  unint64_t result = qword_269CA9908;
  if (!qword_269CA9908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9908);
  }
  return result;
}

unint64_t sub_252DAB7F0()
{
  unint64_t result = qword_269CA9910;
  if (!qword_269CA9910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9910);
  }
  return result;
}

unint64_t sub_252DAB83C()
{
  unint64_t result = qword_269CA9920;
  if (!qword_269CA9920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9920);
  }
  return result;
}

unint64_t sub_252DAB888()
{
  unint64_t result = qword_269CA9928;
  if (!qword_269CA9928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9928);
  }
  return result;
}

unint64_t sub_252DAB8D4()
{
  unint64_t result = qword_269CA9930;
  if (!qword_269CA9930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9930);
  }
  return result;
}

uint64_t sub_252DAB920()
{
  return sub_252DC33C0();
}

void sub_252DAB978()
{
}

void sub_252DAB990()
{
}

IntelligenceFlowContext::DetectableEntityType_optional __swiftcall DetectableEntityType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_252DC3220();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static DetectableEntityType.allCases.getter()
{
  return &unk_270316208;
}

uint64_t DetectableEntityType.rawValue.getter()
{
  uint64_t result = 1702125924;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6D754E656E6F6870;
      break;
    case 2:
      uint64_t result = 1802398060;
      break;
    case 3:
      uint64_t result = 0x73736572646461;
      break;
    case 4:
      uint64_t result = 0x6E6F73726570;
      break;
    case 5:
      uint64_t result = 0x6563616C70;
      break;
    case 6:
      uint64_t result = 0x617A696E6167726FLL;
      break;
    case 7:
      uint64_t result = 0x7469746E45707061;
      break;
    case 8:
      uint64_t result = 0x6E65746E49707061;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252DABB2C(unsigned __int8 *a1, char *a2)
{
  return sub_252D9C2C8(*a1, *a2);
}

IntelligenceFlowContext::DetectableEntityType_optional sub_252DABB38(Swift::String *a1)
{
  return DetectableEntityType.init(rawValue:)(*a1);
}

uint64_t sub_252DABB44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DetectableEntityType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_252DABB6C()
{
  return sub_252DA0458();
}

uint64_t sub_252DABB74()
{
  return sub_252DA04C8();
}

uint64_t sub_252DABB7C()
{
  return sub_252DA061C();
}

void sub_252DABB84(void *a1@<X8>)
{
  *a1 = &unk_270316208;
}

uint64_t sub_252DABB94()
{
  return sub_252DC30E0();
}

uint64_t sub_252DABBF4()
{
  return sub_252DC30C0();
}

char *sub_252DABC44(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_252D8823C(&qword_269CA9DA8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_252DBA468((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252DAC02C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_252DABD34(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
  sub_252D8823C(&qword_269CA95F0);
  uint64_t v10 = *(void *)(sub_252DC2F30() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    sub_252DB3C70();
    uint64_t result = sub_252DC3200();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_252DC2F30() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_252DBA4DC(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252DAC124(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

char *sub_252DABF48(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_252D8823C(&qword_269CA9DA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_252DBA5F0((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252DAC284(0, v8, v12, a4);
  }
  return v10;
}

uint64_t sub_252DAC02C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_252DC3210();
  __break(1u);
  return result;
}

uint64_t sub_252DAC124(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_252DC2F30() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_252DC3210();
  __break(1u);
  return result;
}

char *sub_252DAC284(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = (char *)sub_252DC3210();
  __break(1u);
  return result;
}

uint64_t sub_252DAC374(void *a1)
{
  id v1 = objc_msgSend(a1, sel_contactIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_252DC3080();

  return v3;
}

unint64_t sub_252DAC3D8()
{
  unint64_t result = qword_269CA9990;
  if (!qword_269CA9990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9990);
  }
  return result;
}

unint64_t sub_252DAC424()
{
  unint64_t result = qword_269CA99A0;
  if (!qword_269CA99A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA99A0);
  }
  return result;
}

unint64_t sub_252DAC470()
{
  unint64_t result = qword_269CA99A8;
  if (!qword_269CA99A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA99A8);
  }
  return result;
}

unint64_t sub_252DAC4BC()
{
  unint64_t result = qword_269CA99B0;
  if (!qword_269CA99B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA99B0);
  }
  return result;
}

unint64_t sub_252DAC508()
{
  unint64_t result = qword_269CA99B8;
  if (!qword_269CA99B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA99B8);
  }
  return result;
}

unint64_t sub_252DAC554()
{
  unint64_t result = qword_269CA99C8;
  if (!qword_269CA99C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA99C8);
  }
  return result;
}

unint64_t sub_252DAC5A0()
{
  unint64_t result = qword_269CA99E0;
  if (!qword_269CA99E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA99E0);
  }
  return result;
}

uint64_t sub_252DAC5EC(uint64_t a1)
{
  return a1;
}

unint64_t sub_252DAC684()
{
  unint64_t result = qword_269CA9A00;
  if (!qword_269CA9A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9A00);
  }
  return result;
}

unint64_t sub_252DAC6D0()
{
  unint64_t result = qword_269CA9A28;
  if (!qword_269CA9A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9A28);
  }
  return result;
}

unint64_t sub_252DAC71C()
{
  unint64_t result = qword_269CA9A40;
  if (!qword_269CA9A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9A40);
  }
  return result;
}

unint64_t sub_252DAC768()
{
  unint64_t result = qword_269CA9A68;
  if (!qword_269CA9A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9A68);
  }
  return result;
}

unint64_t sub_252DAC7B4()
{
  unint64_t result = qword_269CA9A70;
  if (!qword_269CA9A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9A70);
  }
  return result;
}

unint64_t sub_252DAC800()
{
  unint64_t result = qword_269CA9A80;
  if (!qword_269CA9A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9A80);
  }
  return result;
}

uint64_t sub_252DAC84C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252D8823C(&qword_269CA9A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_252DAC8B4()
{
  unint64_t result = qword_269CA9AA0;
  if (!qword_269CA9AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9AA0);
  }
  return result;
}

unint64_t sub_252DAC900()
{
  unint64_t result = qword_269CA9AB8;
  if (!qword_269CA9AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9AB8);
  }
  return result;
}

unint64_t sub_252DAC94C()
{
  unint64_t result = qword_269CA9AD0;
  if (!qword_269CA9AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9AD0);
  }
  return result;
}

uint64_t sub_252DAC998(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_252D8823C(a3);
  sub_252D97EE8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t sub_252DAC9F4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_252DACA34()
{
  unint64_t result = qword_269CA9AE8;
  if (!qword_269CA9AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9AE8);
  }
  return result;
}

unint64_t sub_252DACA80()
{
  unint64_t result = qword_269CA9B00;
  if (!qword_269CA9B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B00);
  }
  return result;
}

unint64_t sub_252DACACC()
{
  unint64_t result = qword_269CA9B18;
  if (!qword_269CA9B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B18);
  }
  return result;
}

uint64_t sub_252DACB18()
{
  return sub_252DA5DF8(&qword_269CA9B28, (void (*)(uint64_t))type metadata accessor for DetectedEntityDetails);
}

uint64_t sub_252DACB60()
{
  return sub_252DA5DF8(&qword_269CA9B30, (void (*)(uint64_t))type metadata accessor for DetectedEntity);
}

unint64_t sub_252DACBAC()
{
  unint64_t result = qword_269CA9B38;
  if (!qword_269CA9B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B38);
  }
  return result;
}

uint64_t sub_252DACBF8()
{
  return sub_252DA5DF8(&qword_269CA9B40, (void (*)(uint64_t))type metadata accessor for DetectedDate);
}

unint64_t sub_252DACC44()
{
  unint64_t result = qword_269CA9B48;
  if (!qword_269CA9B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B48);
  }
  return result;
}

uint64_t sub_252DACC90()
{
  return sub_252DA5DF8(&qword_269CA9B50, (void (*)(uint64_t))type metadata accessor for DetectedLink);
}

unint64_t sub_252DACCDC()
{
  unint64_t result = qword_269CA9B58;
  if (!qword_269CA9B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B58);
  }
  return result;
}

unint64_t sub_252DACD2C()
{
  unint64_t result = qword_269CA9B60;
  if (!qword_269CA9B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B60);
  }
  return result;
}

unint64_t sub_252DACD7C()
{
  unint64_t result = qword_269CA9B68;
  if (!qword_269CA9B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B68);
  }
  return result;
}

unint64_t sub_252DACDCC()
{
  unint64_t result = qword_269CA9B70;
  if (!qword_269CA9B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B70);
  }
  return result;
}

uint64_t sub_252DACE18()
{
  return sub_252DA5DF8(&qword_269CA9B78, (void (*)(uint64_t))type metadata accessor for DetectedAppEntity);
}

unint64_t sub_252DACE64()
{
  unint64_t result = qword_269CA9B80;
  if (!qword_269CA9B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9B80);
  }
  return result;
}

unint64_t sub_252DACEB4()
{
  unint64_t result = qword_26B23C110;
  if (!qword_26B23C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23C110);
  }
  return result;
}

uint64_t sub_252DACF00()
{
  return sub_252DACF3C(&qword_269CA9B88, &qword_269CA9B90);
}

uint64_t sub_252DACF3C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for DetectedEntityDetails(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    type metadata accessor for DetectedEntity(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 5u:
      case 6u:
      case 8u:
        uint64_t v34 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v34;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v14 = sub_252DC2CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        break;
      case 3u:
        uint64_t v15 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v15;
        uint64_t v16 = *((void *)a2 + 3);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = v16;
        uint64_t v17 = *((void *)a2 + 5);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = v17;
        uint64_t v18 = *((void *)a2 + 7);
        *((void *)a1 + 6) = *((void *)a2 + 6);
        *((void *)a1 + 7) = v18;
        uint64_t v19 = *((void *)a2 + 9);
        *((void *)a1 + 8) = *((void *)a2 + 8);
        *((void *)a1 + 9) = v19;
        uint64_t v20 = *((void *)a2 + 11);
        *((void *)a1 + 10) = *((void *)a2 + 10);
        *((void *)a1 + 11) = v20;
        uint64_t v21 = *((void *)a2 + 13);
        *((void *)a1 + 12) = *((void *)a2 + 12);
        *((void *)a1 + 13) = v21;
        uint64_t v22 = *((void *)a2 + 15);
        *((void *)a1 + 14) = *((void *)a2 + 14);
        *((void *)a1 + 15) = v22;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 4u:
        uint64_t v23 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v23;
        uint64_t v24 = *((void *)a2 + 3);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = v24;
        uint64_t v25 = *((void *)a2 + 5);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = v25;
        uint64_t v26 = *((void *)a2 + 7);
        *((void *)a1 + 6) = *((void *)a2 + 6);
        *((void *)a1 + 7) = v26;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 7u:
        uint64_t v27 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v27;
        uint64_t v28 = *((void *)a2 + 3);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = v28;
        uint64_t v29 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        uint64_t v30 = &a1[v29];
        uint64_t v31 = &a2[v29];
        uint64_t v32 = sub_252DC2FA0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v31, 1, v32))
        {
          uint64_t v33 = sub_252D8823C(&qword_269CA91E8);
          memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v30, 0, 1, v32);
        }
        break;
      default:
        uint64_t v7 = sub_252DC2C30();
        uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
        v8(a1, a2, v7);
        uint64_t v9 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        uint64_t v10 = &a1[v9];
        unint64_t v11 = &a2[v9];
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a2[v9], 1, v7))
        {
          uint64_t v12 = sub_252D8823C(&qword_269CA9820);
          memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          v8(v10, v11, v7);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v7);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
    a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  }
  return a1;
}

uint64_t destroy for DetectedEntityDetails(uint64_t a1)
{
  type metadata accessor for DetectedEntity(0);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_252DC2C30();
      unint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      v11(a1, v3);
      uint64_t v4 = a1 + *(int *)(type metadata accessor for DetectedDate(0) + 20);
      uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v3);
      if (!result)
      {
        uint64_t v5 = v4;
        uint64_t v6 = v3;
        uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))v11;
        goto LABEL_13;
      }
      return result;
    case 1:
    case 5:
    case 6:
    case 8:
      goto LABEL_2;
    case 2:
      uint64_t v8 = sub_252DC2CC0();
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
      uint64_t v6 = v8;
      uint64_t v5 = a1;
      goto LABEL_13;
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_2;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_2:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v9 = a1 + *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      uint64_t v10 = sub_252DC2FA0();
      uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v9, 1, v10);
      if (!result)
      {
        uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
        uint64_t v5 = v9;
        uint64_t v6 = v10;
LABEL_13:
        uint64_t result = v7(v5, v6);
      }
      break;
    default:
      return result;
  }
  return result;
}

char *initializeWithCopy for DetectedEntityDetails(char *a1, char *a2, uint64_t a3)
{
  type metadata accessor for DetectedEntity(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 5u:
    case 6u:
    case 8u:
      uint64_t v32 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v32;
      swift_bridgeObjectRetain();
      break;
    case 2u:
      uint64_t v12 = sub_252DC2CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
      break;
    case 3u:
      uint64_t v13 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v13;
      uint64_t v14 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v14;
      uint64_t v15 = *((void *)a2 + 5);
      *((void *)a1 + 4) = *((void *)a2 + 4);
      *((void *)a1 + 5) = v15;
      uint64_t v16 = *((void *)a2 + 7);
      *((void *)a1 + 6) = *((void *)a2 + 6);
      *((void *)a1 + 7) = v16;
      uint64_t v17 = *((void *)a2 + 9);
      *((void *)a1 + 8) = *((void *)a2 + 8);
      *((void *)a1 + 9) = v17;
      uint64_t v34 = a3;
      uint64_t v18 = *((void *)a2 + 11);
      *((void *)a1 + 10) = *((void *)a2 + 10);
      *((void *)a1 + 11) = v18;
      uint64_t v19 = *((void *)a2 + 13);
      *((void *)a1 + 12) = *((void *)a2 + 12);
      *((void *)a1 + 13) = v19;
      uint64_t v20 = *((void *)a2 + 15);
      *((void *)a1 + 14) = *((void *)a2 + 14);
      *((void *)a1 + 15) = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a3 = v34;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 4u:
      uint64_t v21 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v21;
      uint64_t v22 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v22;
      uint64_t v23 = *((void *)a2 + 5);
      *((void *)a1 + 4) = *((void *)a2 + 4);
      *((void *)a1 + 5) = v23;
      uint64_t v24 = *((void *)a2 + 7);
      *((void *)a1 + 6) = *((void *)a2 + 6);
      *((void *)a1 + 7) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 7u:
      uint64_t v25 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v25;
      uint64_t v26 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v26;
      uint64_t v27 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      uint64_t v28 = &a1[v27];
      uint64_t v29 = &a2[v27];
      uint64_t v30 = sub_252DC2FA0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v29, 1, v30))
      {
        uint64_t v31 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v28, v29, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v28, 0, 1, v30);
      }
      break;
    default:
      uint64_t v6 = sub_252DC2C30();
      uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
      v7(a1, a2, v6);
      uint64_t v8 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a2[v8], 1, v6))
      {
        uint64_t v11 = sub_252D8823C(&qword_269CA9820);
        memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        v7(v9, v10, v6);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v6);
      }
      break;
  }
  swift_storeEnumTagMultiPayload();
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithCopy for DetectedEntityDetails(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_252DA4D58();
    type metadata accessor for DetectedEntity(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 5u:
      case 6u:
      case 8u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v12 = sub_252DC2CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        *((void *)a1 + 6) = *((void *)a2 + 6);
        *((void *)a1 + 7) = *((void *)a2 + 7);
        *((void *)a1 + 8) = *((void *)a2 + 8);
        *((void *)a1 + 9) = *((void *)a2 + 9);
        *((void *)a1 + 10) = *((void *)a2 + 10);
        *((void *)a1 + 11) = *((void *)a2 + 11);
        *((void *)a1 + 12) = *((void *)a2 + 12);
        *((void *)a1 + 13) = *((void *)a2 + 13);
        *((void *)a1 + 14) = *((void *)a2 + 14);
        *((void *)a1 + 15) = *((void *)a2 + 15);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 4u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        *((void *)a1 + 6) = *((void *)a2 + 6);
        *((void *)a1 + 7) = *((void *)a2 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 7u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        uint64_t v13 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = &a2[v13];
        uint64_t v16 = sub_252DC2FA0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v15, 1, v16))
        {
          uint64_t v17 = sub_252D8823C(&qword_269CA91E8);
          memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v14, 0, 1, v16);
        }
        break;
      default:
        uint64_t v6 = sub_252DC2C30();
        uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
        v7(a1, a2, v6);
        uint64_t v8 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        uint64_t v9 = &a1[v8];
        uint64_t v10 = &a2[v8];
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a2[v8], 1, v6))
        {
          uint64_t v11 = sub_252D8823C(&qword_269CA9820);
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          v7(v9, v10, v6);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v6);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

char *initializeWithTake for DetectedEntityDetails(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DetectedEntity(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 7:
      long long v14 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v14;
      uint64_t v15 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      uint64_t v16 = &a1[v15];
      uint64_t v17 = &a2[v15];
      uint64_t v18 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
      {
        uint64_t v19 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
      }
      goto LABEL_13;
    case 2:
      uint64_t v20 = sub_252DC2CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a1, a2, v20);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      goto LABEL_14;
    case 0:
      uint64_t v8 = sub_252DC2C30();
      uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
      v9(a1, a2, v8);
      uint64_t v10 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a2[v10], 1, v8))
      {
        uint64_t v13 = sub_252D8823C(&qword_269CA9820);
        memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        v9(v11, v12, v8);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v11, 0, 1, v8);
      }
      goto LABEL_13;
  }
  memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
LABEL_14:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for DetectedEntityDetails(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_252DA4D58();
    uint64_t v6 = type metadata accessor for DetectedEntity(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 7:
        long long v14 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((_OWORD *)a1 + 1) = v14;
        uint64_t v15 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        uint64_t v16 = &a1[v15];
        uint64_t v17 = &a2[v15];
        uint64_t v18 = sub_252DC2FA0();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v17, 1, v18))
        {
          uint64_t v19 = sub_252D8823C(&qword_269CA91E8);
          memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v16, 0, 1, v18);
        }
        goto LABEL_14;
      case 2:
        uint64_t v20 = sub_252DC2CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a1, a2, v20);
LABEL_14:
        swift_storeEnumTagMultiPayload();
        goto LABEL_15;
      case 0:
        uint64_t v8 = sub_252DC2C30();
        uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32);
        v9(a1, a2, v8);
        uint64_t v10 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        uint64_t v11 = &a1[v10];
        uint64_t v12 = &a2[v10];
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a2[v10], 1, v8))
        {
          uint64_t v13 = sub_252D8823C(&qword_269CA9820);
          memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
        }
        else
        {
          v9(v11, v12, v8);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v11, 0, 1, v8);
        }
        goto LABEL_14;
    }
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
LABEL_15:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedEntityDetails(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252DAE430);
}

uint64_t sub_252DAE430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252D9830C();
  type metadata accessor for DetectedEntity(v6);
  sub_252D97ED0();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    return _s23IntelligenceFlowContext14DetectedEntityOwet_0(v3, a2, v7);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(v3 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for DetectedEntityDetails(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252DAE4DC);
}

void sub_252DAE4DC()
{
  uint64_t v4 = sub_252D9820C();
  type metadata accessor for DetectedEntity(v4);
  sub_252D97ED0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = sub_252DB3CE0();
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v6, v7, v8, v9);
  }
  else
  {
    *(unsigned char *)(v1 + *(int *)(v2 + 20)) = v0 + 1;
  }
}

uint64_t sub_252DAE548()
{
  uint64_t result = type metadata accessor for DetectedEntity(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DetectedEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 5u:
      case 6u:
      case 8u:
        uint64_t v35 = a2[1];
        *a1 = *a2;
        a1[1] = v35;
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v13 = sub_252DC2CC0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
        break;
      case 3u:
        uint64_t v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        uint64_t v15 = a2[3];
        a1[2] = a2[2];
        a1[3] = v15;
        uint64_t v16 = a2[5];
        a1[4] = a2[4];
        a1[5] = v16;
        uint64_t v17 = a2[7];
        a1[6] = a2[6];
        a1[7] = v17;
        uint64_t v18 = a2[9];
        a1[8] = a2[8];
        a1[9] = v18;
        uint64_t v19 = a2[11];
        a1[10] = a2[10];
        a1[11] = v19;
        uint64_t v20 = a2[13];
        a1[12] = a2[12];
        a1[13] = v20;
        uint64_t v21 = a2[14];
        uint64_t v22 = a2[15];
        a1[14] = v21;
        a1[15] = v22;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 4u:
        uint64_t v23 = a2[1];
        *a1 = *a2;
        a1[1] = v23;
        uint64_t v24 = a2[3];
        a1[2] = a2[2];
        a1[3] = v24;
        uint64_t v25 = a2[5];
        a1[4] = a2[4];
        a1[5] = v25;
        uint64_t v26 = a2[6];
        uint64_t v27 = a2[7];
        a1[6] = v26;
        a1[7] = v27;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 7u:
        uint64_t v28 = a2[1];
        *a1 = *a2;
        a1[1] = v28;
        uint64_t v29 = a2[3];
        a1[2] = a2[2];
        a1[3] = v29;
        uint64_t v30 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        uint64_t v31 = (char *)a1 + v30;
        uint64_t v32 = (char *)a2 + v30;
        uint64_t v33 = sub_252DC2FA0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v32, 1, v33))
        {
          uint64_t v34 = sub_252D8823C(&qword_269CA91E8);
          memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v31, 0, 1, v33);
        }
        break;
      default:
        uint64_t v6 = sub_252DC2C30();
        uint64_t v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
        v7(a1, a2, v6);
        uint64_t v8 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        uint64_t v9 = (char *)a1 + v8;
        unsigned int v10 = (char *)a2 + v8;
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v6))
        {
          uint64_t v11 = sub_252D8823C(&qword_269CA9820);
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          v7((uint64_t *)v9, (uint64_t *)v10, v6);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v6);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for DetectedEntity(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_252DC2C30();
      uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      v11(a1, v3);
      uint64_t v4 = a1 + *(int *)(type metadata accessor for DetectedDate(0) + 20);
      uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v3);
      if (!result)
      {
        uint64_t v5 = v4;
        uint64_t v6 = v3;
        uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))v11;
        goto LABEL_13;
      }
      return result;
    case 1:
    case 5:
    case 6:
    case 8:
      goto LABEL_2;
    case 2:
      uint64_t v8 = sub_252DC2CC0();
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
      uint64_t v6 = v8;
      uint64_t v5 = a1;
      goto LABEL_13;
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_2;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_2:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v9 = a1 + *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      uint64_t v10 = sub_252DC2FA0();
      uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v9, 1, v10);
      if (!result)
      {
        uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
        uint64_t v5 = v9;
        uint64_t v6 = v10;
LABEL_13:
        uint64_t result = v7(v5, v6);
      }
      break;
    default:
      return result;
  }
  return result;
}

char *initializeWithCopy for DetectedEntity(char *a1, char *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 5u:
    case 6u:
    case 8u:
      uint64_t v32 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v32;
      swift_bridgeObjectRetain();
      break;
    case 2u:
      uint64_t v10 = sub_252DC2CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      break;
    case 3u:
      uint64_t v11 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v11;
      uint64_t v12 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v12;
      uint64_t v13 = *((void *)a2 + 5);
      *((void *)a1 + 4) = *((void *)a2 + 4);
      *((void *)a1 + 5) = v13;
      uint64_t v14 = *((void *)a2 + 7);
      *((void *)a1 + 6) = *((void *)a2 + 6);
      *((void *)a1 + 7) = v14;
      uint64_t v15 = *((void *)a2 + 9);
      *((void *)a1 + 8) = *((void *)a2 + 8);
      *((void *)a1 + 9) = v15;
      uint64_t v16 = *((void *)a2 + 11);
      *((void *)a1 + 10) = *((void *)a2 + 10);
      *((void *)a1 + 11) = v16;
      uint64_t v17 = *((void *)a2 + 13);
      *((void *)a1 + 12) = *((void *)a2 + 12);
      *((void *)a1 + 13) = v17;
      uint64_t v18 = *((void *)a2 + 14);
      uint64_t v19 = *((void *)a2 + 15);
      *((void *)a1 + 14) = v18;
      *((void *)a1 + 15) = v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 4u:
      uint64_t v20 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v20;
      uint64_t v21 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v21;
      uint64_t v22 = *((void *)a2 + 5);
      *((void *)a1 + 4) = *((void *)a2 + 4);
      *((void *)a1 + 5) = v22;
      uint64_t v23 = *((void *)a2 + 6);
      uint64_t v24 = *((void *)a2 + 7);
      *((void *)a1 + 6) = v23;
      *((void *)a1 + 7) = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 7u:
      uint64_t v25 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v25;
      uint64_t v26 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v26;
      uint64_t v27 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      uint64_t v28 = &a1[v27];
      uint64_t v29 = &a2[v27];
      uint64_t v30 = sub_252DC2FA0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v29, 1, v30))
      {
        uint64_t v31 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v28, v29, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v28, 0, 1, v30);
      }
      break;
    default:
      uint64_t v4 = sub_252DC2C30();
      uint64_t v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
      uint64_t v7 = &a1[v6];
      uint64_t v8 = &a2[v6];
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v4))
      {
        uint64_t v9 = sub_252D8823C(&qword_269CA9820);
        memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        v5(v7, v8, v4);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v4);
      }
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithCopy for DetectedEntity(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_252DA4D58();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 5u:
      case 6u:
      case 8u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        swift_bridgeObjectRetain();
        break;
      case 2u:
        uint64_t v10 = sub_252DC2CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        *((void *)a1 + 6) = *((void *)a2 + 6);
        *((void *)a1 + 7) = *((void *)a2 + 7);
        *((void *)a1 + 8) = *((void *)a2 + 8);
        *((void *)a1 + 9) = *((void *)a2 + 9);
        *((void *)a1 + 10) = *((void *)a2 + 10);
        *((void *)a1 + 11) = *((void *)a2 + 11);
        *((void *)a1 + 12) = *((void *)a2 + 12);
        *((void *)a1 + 13) = *((void *)a2 + 13);
        *((void *)a1 + 14) = *((void *)a2 + 14);
        *((void *)a1 + 15) = *((void *)a2 + 15);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 4u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        *((void *)a1 + 6) = *((void *)a2 + 6);
        *((void *)a1 + 7) = *((void *)a2 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 7u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        uint64_t v11 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        uint64_t v12 = &a1[v11];
        uint64_t v13 = &a2[v11];
        uint64_t v14 = sub_252DC2FA0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v13, 1, v14))
        {
          uint64_t v15 = sub_252D8823C(&qword_269CA91E8);
          memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v12, 0, 1, v14);
        }
        break;
      default:
        uint64_t v4 = sub_252DC2C30();
        uint64_t v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16);
        v5(a1, a2, v4);
        uint64_t v6 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        uint64_t v7 = &a1[v6];
        uint64_t v8 = &a2[v6];
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v4))
        {
          uint64_t v9 = sub_252D8823C(&qword_269CA9820);
          memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
        }
        else
        {
          v5(v7, v8, v4);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v4);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for DetectedEntity(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 7:
      long long v13 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v13;
      uint64_t v14 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      uint64_t v17 = sub_252DC2FA0();
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17))
      {
        uint64_t v18 = sub_252D8823C(&qword_269CA91E8);
        memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
      }
      goto LABEL_13;
    case 2:
      uint64_t v19 = sub_252DC2CC0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(a1, a2, v19);
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 0:
      uint64_t v7 = sub_252DC2C30();
      uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
      v8(a1, a2, v7);
      uint64_t v9 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v7))
      {
        uint64_t v12 = sub_252D8823C(&qword_269CA9820);
        memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        v8(v10, v11, v7);
        _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v7);
      }
      goto LABEL_13;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for DetectedEntity(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_252DA4D58();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 7:
        long long v13 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((_OWORD *)a1 + 1) = v13;
        uint64_t v14 = *(int *)(type metadata accessor for DetectedAppEntity(0) + 24);
        uint64_t v15 = &a1[v14];
        uint64_t v16 = &a2[v14];
        uint64_t v17 = sub_252DC2FA0();
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v16, 1, v17))
        {
          uint64_t v18 = sub_252D8823C(&qword_269CA91E8);
          memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v15, 0, 1, v17);
        }
        goto LABEL_14;
      case 2:
        uint64_t v19 = sub_252DC2CC0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(a1, a2, v19);
LABEL_14:
        swift_storeEnumTagMultiPayload();
        return a1;
      case 0:
        uint64_t v7 = sub_252DC2C30();
        uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
        v8(a1, a2, v7);
        uint64_t v9 = *(int *)(type metadata accessor for DetectedDate(0) + 20);
        uint64_t v10 = &a1[v9];
        uint64_t v11 = &a2[v9];
        if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v7))
        {
          uint64_t v12 = sub_252D8823C(&qword_269CA9820);
          memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          v8(v10, v11, v7);
          _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v7);
        }
        goto LABEL_14;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_252DAF9B8()
{
  uint64_t result = type metadata accessor for DetectedDate(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_252DC2CC0();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for DetectedAppEntity(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

void *initializeWithTake for AddressComponents(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x80uLL);
}

void type metadata accessor for AddressComponents()
{
}

char *initializeBufferWithCopyOfBuffer for DetectedDate(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_252DC2C30();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v7))
    {
      uint64_t v12 = sub_252D8823C(&qword_269CA9820);
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      v8(v10, v11, v7);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for DetectedDate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DC2C30();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v7(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v5, 1, v4);
  if (!result)
  {
    return v7(v5, v4);
  }
  return result;
}

char *initializeWithCopy for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2C30();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v6))
  {
    uint64_t v11 = sub_252D8823C(&qword_269CA9820);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2C30();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  int v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a1[v9], 1, v6);
  int v13 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v6);
  if (!v12)
  {
    if (!v13)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_252D8823C(&qword_269CA9820);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2C30();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v6))
  {
    uint64_t v11 = sub_252D8823C(&qword_269CA9820);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for DetectedDate(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_252DC2C30();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  int v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)&a1[v9], 1, v6);
  int v13 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v11, 1, v6);
  if (!v12)
  {
    if (!v13)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = sub_252D8823C(&qword_269CA9820);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedDate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252DB0218);
}

uint64_t sub_252DB0218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_252DC2C30();
  sub_252D97ED0();
  if (*(_DWORD *)(v6 + 84) == a2)
  {
    uint64_t v7 = sub_252DB3D34();
  }
  else
  {
    uint64_t v8 = sub_252D8823C(&qword_269CA9820);
    uint64_t v7 = a1 + *(int *)(a3 + 20);
  }

  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(v7, a2, v8);
}

uint64_t storeEnumTagSinglePayload for DetectedDate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252DB02A8);
}

uint64_t sub_252DB02A8()
{
  sub_252D9820C();
  sub_252DC2C30();
  sub_252D97ED0();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    uint64_t v6 = sub_252D8823C(&qword_269CA9820);
    uint64_t v7 = v1 + *(int *)(v2 + 20);
  }

  return _s23IntelligenceFlowContext14DetectedEntityOwst_0(v7, v0, v0, v6);
}

void sub_252DB0320()
{
  sub_252DC2C30();
  if (v0 <= 0x3F)
  {
    sub_252DB1728(319, &qword_26B23BD68, MEMORY[0x263F063B0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for DetectedPhoneNumber()
{
}

uint64_t initializeBufferWithCopyOfBuffer for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DC2CC0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for DetectedLink(uint64_t a1)
{
  uint64_t v2 = sub_252DC2CC0();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DC2CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DC2CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DC2CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DetectedLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DC2CC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedLink(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252DB0690);
}

uint64_t sub_252DB0690(uint64_t a1, uint64_t a2)
{
  sub_252DC2CC0();
  uint64_t v3 = sub_252DB3D34();

  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(v3, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DetectedLink(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252DB06E8);
}

uint64_t sub_252DB06E8()
{
  sub_252DC2CC0();
  uint64_t v0 = sub_252DB3CE0();

  return _s23IntelligenceFlowContext14DetectedEntityOwst_0(v0, v1, v2, v3);
}

uint64_t sub_252DB0728()
{
  uint64_t result = sub_252DC2CC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s23IntelligenceFlowContext17AddressComponentsVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s23IntelligenceFlowContext17AddressComponentsVwcp_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  uint64_t v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  uint64_t v10 = a2[15];
  a1[14] = a2[14];
  a1[15] = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s23IntelligenceFlowContext17AddressComponentsVwca_0(void *a1, void *a2)
{
  v2[1] = sub_252DB3DC8(a1, a2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[2] = a2[2];
  v2[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[4] = a2[4];
  v2[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[6] = a2[6];
  v2[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[8] = a2[8];
  v2[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[10] = a2[10];
  v2[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[12] = a2[12];
  v2[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[14] = a2[14];
  v2[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v2;
}

void *_s23IntelligenceFlowContext17AddressComponentsVwta_0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s23IntelligenceFlowContext17AddressComponentsVwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 128)) {
      return sub_252DB3C3C(*(_DWORD *)a1 + 2147483646);
    }
    sub_252DB3D4C();
  }
  else
  {
    int v3 = -1;
  }
  return sub_252DB3C3C(v3);
}

uint64_t _s23IntelligenceFlowContext17AddressComponentsVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for DetectedAddress()
{
}

uint64_t destroy for DetectedPerson()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DetectedPerson(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DetectedPerson(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for DetectedPerson(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for DetectedPerson(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedPerson(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for DetectedPerson(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for DetectedPerson()
{
}

void *initializeBufferWithCopyOfBuffer for DetectedPlace(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DetectedPlace()
{
  return swift_bridgeObjectRelease();
}

void *assignWithTake for DetectedPlace(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for DetectedPlace()
{
}

void type metadata accessor for DetectedOrganization()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for DetectedAppEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_252DC2FA0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = sub_252D8823C(&qword_269CA91E8);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t destroy for DetectedAppEntity(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_252DC2FA0();
  uint64_t result = _s23IntelligenceFlowContext14DetectedEntityOwet_0(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for DetectedAppEntity(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252DC2FA0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
  }
  return a1;
}

void *assignWithCopy for DetectedAppEntity(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252DC2FA0();
  int v10 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v7, 1, v9);
  int v11 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v8, 1, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for DetectedAppEntity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_252DC2FA0();
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

void *assignWithTake for DetectedAppEntity(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  int v10 = (char *)a2 + v8;
  uint64_t v11 = sub_252DC2FA0();
  int v12 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v9, 1, v11);
  int v13 = _s23IntelligenceFlowContext14DetectedEntityOwet_0((uint64_t)v10, 1, v11);
  if (!v12)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v15 = sub_252D8823C(&qword_269CA91E8);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0((uint64_t)v9, 0, 1, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for DetectedAppEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252DB1558);
}

uint64_t sub_252DB1558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    sub_252DB3D4C();
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_252D8823C(&qword_269CA91E8);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return _s23IntelligenceFlowContext14DetectedEntityOwet_0(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for DetectedAppEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252DB15F0);
}

uint64_t sub_252DB15F0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_252D8823C(&qword_269CA91E8);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return _s23IntelligenceFlowContext14DetectedEntityOwst_0(v8, a2, a2, v7);
  }
  return result;
}

void sub_252DB1674()
{
  sub_252DB1728(319, &qword_26B23BFE0, MEMORY[0x263F80388]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_252DB1728(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_252DC3160();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberVwca_0(void *a1, void *a2)
{
  *(void *)(v2 + 8) = sub_252DB3DC8(a1, a2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t _s23IntelligenceFlowContext19DetectedPhoneNumberVwet_0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
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

uint64_t sub_252DB17F4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

void type metadata accessor for DetectedAppIntent()
{
}

void type metadata accessor for DetectableEntityType()
{
}

ValueMetadata *type metadata accessor for DetectedAppIntent.CodingKeys()
{
  return &type metadata for DetectedAppIntent.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DetectedAppEntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252DB1930);
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

ValueMetadata *type metadata accessor for DetectedAppEntity.CodingKeys()
{
  return &type metadata for DetectedAppEntity.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedOrganization.CodingKeys()
{
  return &type metadata for DetectedOrganization.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedPlace.CodingKeys()
{
  return &type metadata for DetectedPlace.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for DetectedPerson.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252DB1A54);
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

ValueMetadata *type metadata accessor for DetectedPerson.CodingKeys()
{
  return &type metadata for DetectedPerson.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedAddress.CodingKeys()
{
  return &type metadata for DetectedAddress.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedLink.CodingKeys()
{
  return &type metadata for DetectedLink.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedPhoneNumber.CodingKeys()
{
  return &type metadata for DetectedPhoneNumber.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedDate.CodingKeys()
{
  return &type metadata for DetectedDate.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AddressComponents.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AddressComponents.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x252DB1C28);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AddressComponents.CodingKeys()
{
  return &type metadata for AddressComponents.CodingKeys;
}

uint64_t _s23IntelligenceFlowContext20DetectableEntityTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_252DB3C3C(-1);
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return sub_252DB3C3C((*a1 | (v4 << 8)) - 9);
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
      return sub_252DB3C3C((*a1 | (v4 << 8)) - 9);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_252DB3C3C((*a1 | (v4 << 8)) - 9);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return sub_252DB3C3C(v8);
}

unsigned char *_s23IntelligenceFlowContext20DetectableEntityTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x252DB1DB0);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DetectedEntity.CodingKeys()
{
  return &type metadata for DetectedEntity.CodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.DateCodingKeys()
{
  return &type metadata for DetectedEntity.DateCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.PhoneNumberCodingKeys()
{
  return &type metadata for DetectedEntity.PhoneNumberCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.LinkCodingKeys()
{
  return &type metadata for DetectedEntity.LinkCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.AddressCodingKeys()
{
  return &type metadata for DetectedEntity.AddressCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.PersonCodingKeys()
{
  return &type metadata for DetectedEntity.PersonCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.PlaceCodingKeys()
{
  return &type metadata for DetectedEntity.PlaceCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.OrganizationCodingKeys()
{
  return &type metadata for DetectedEntity.OrganizationCodingKeys;
}

ValueMetadata *type metadata accessor for DetectedEntity.AppEntityCodingKeys()
{
  return &type metadata for DetectedEntity.AppEntityCodingKeys;
}

unsigned char *_s23IntelligenceFlowContext17DetectedAppIntentV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252DB1F04);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DetectedEntity.AppIntentCodingKeys()
{
  return &type metadata for DetectedEntity.AppIntentCodingKeys;
}

uint64_t _s23IntelligenceFlowContext12DetectedDateV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_252DB3C3C(-1);
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
      return sub_252DB3C3C((*a1 | (v4 << 8)) - 2);
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
      return sub_252DB3C3C((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_252DB3C3C((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return sub_252DB3C3C(v8);
}

unsigned char *_s23IntelligenceFlowContext12DetectedDateV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252DB208CLL);
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

ValueMetadata *type metadata accessor for DetectedEntityDetails.CodingKeys()
{
  return &type metadata for DetectedEntityDetails.CodingKeys;
}

unint64_t sub_252DB20C8()
{
  unint64_t result = qword_269CA9BA8;
  if (!qword_269CA9BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BA8);
  }
  return result;
}

unint64_t sub_252DB2118()
{
  unint64_t result = qword_269CA9BB0;
  if (!qword_269CA9BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BB0);
  }
  return result;
}

unint64_t sub_252DB2168()
{
  unint64_t result = qword_269CA9BB8;
  if (!qword_269CA9BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BB8);
  }
  return result;
}

unint64_t sub_252DB21B8()
{
  unint64_t result = qword_269CA9BC0;
  if (!qword_269CA9BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BC0);
  }
  return result;
}

unint64_t sub_252DB2208()
{
  unint64_t result = qword_269CA9BC8;
  if (!qword_269CA9BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BC8);
  }
  return result;
}

unint64_t sub_252DB2258()
{
  unint64_t result = qword_269CA9BD0;
  if (!qword_269CA9BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BD0);
  }
  return result;
}

unint64_t sub_252DB22A8()
{
  unint64_t result = qword_269CA9BD8;
  if (!qword_269CA9BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BD8);
  }
  return result;
}

unint64_t sub_252DB22F8()
{
  unint64_t result = qword_269CA9BE0;
  if (!qword_269CA9BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BE0);
  }
  return result;
}

unint64_t sub_252DB2348()
{
  unint64_t result = qword_269CA9BE8;
  if (!qword_269CA9BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BE8);
  }
  return result;
}

unint64_t sub_252DB2398()
{
  unint64_t result = qword_269CA9BF0;
  if (!qword_269CA9BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BF0);
  }
  return result;
}

unint64_t sub_252DB23E8()
{
  unint64_t result = qword_269CA9BF8;
  if (!qword_269CA9BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9BF8);
  }
  return result;
}

unint64_t sub_252DB2438()
{
  unint64_t result = qword_269CA9C00;
  if (!qword_269CA9C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C00);
  }
  return result;
}

unint64_t sub_252DB2488()
{
  unint64_t result = qword_269CA9C08;
  if (!qword_269CA9C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C08);
  }
  return result;
}

unint64_t sub_252DB24D8()
{
  unint64_t result = qword_269CA9C10;
  if (!qword_269CA9C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C10);
  }
  return result;
}

unint64_t sub_252DB2528()
{
  unint64_t result = qword_269CA9C18;
  if (!qword_269CA9C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C18);
  }
  return result;
}

unint64_t sub_252DB2578()
{
  unint64_t result = qword_269CA9C20;
  if (!qword_269CA9C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C20);
  }
  return result;
}

unint64_t sub_252DB25C8()
{
  unint64_t result = qword_269CA9C28;
  if (!qword_269CA9C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C28);
  }
  return result;
}

unint64_t sub_252DB2618()
{
  unint64_t result = qword_269CA9C30;
  if (!qword_269CA9C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C30);
  }
  return result;
}

unint64_t sub_252DB2668()
{
  unint64_t result = qword_269CA9C38;
  if (!qword_269CA9C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C38);
  }
  return result;
}

unint64_t sub_252DB26B8()
{
  unint64_t result = qword_269CA9C40;
  if (!qword_269CA9C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C40);
  }
  return result;
}

unint64_t sub_252DB2708()
{
  unint64_t result = qword_269CA9C48;
  if (!qword_269CA9C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C48);
  }
  return result;
}

unint64_t sub_252DB2758()
{
  unint64_t result = qword_269CA9C50;
  if (!qword_269CA9C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C50);
  }
  return result;
}

unint64_t sub_252DB27A8()
{
  unint64_t result = qword_269CA9C58;
  if (!qword_269CA9C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C58);
  }
  return result;
}

unint64_t sub_252DB27F8()
{
  unint64_t result = qword_269CA9C60;
  if (!qword_269CA9C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C60);
  }
  return result;
}

unint64_t sub_252DB2848()
{
  unint64_t result = qword_269CA9C68;
  if (!qword_269CA9C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C68);
  }
  return result;
}

unint64_t sub_252DB2898()
{
  unint64_t result = qword_269CA9C70;
  if (!qword_269CA9C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C70);
  }
  return result;
}

unint64_t sub_252DB28E8()
{
  unint64_t result = qword_269CA9C78;
  if (!qword_269CA9C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C78);
  }
  return result;
}

unint64_t sub_252DB2938()
{
  unint64_t result = qword_269CA9C80;
  if (!qword_269CA9C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C80);
  }
  return result;
}

unint64_t sub_252DB2988()
{
  unint64_t result = qword_269CA9C88;
  if (!qword_269CA9C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C88);
  }
  return result;
}

unint64_t sub_252DB29D8()
{
  unint64_t result = qword_269CA9C90;
  if (!qword_269CA9C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C90);
  }
  return result;
}

unint64_t sub_252DB2A28()
{
  unint64_t result = qword_269CA9C98;
  if (!qword_269CA9C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9C98);
  }
  return result;
}

unint64_t sub_252DB2A78()
{
  unint64_t result = qword_269CA9CA0;
  if (!qword_269CA9CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CA0);
  }
  return result;
}

unint64_t sub_252DB2AC8()
{
  unint64_t result = qword_269CA9CA8;
  if (!qword_269CA9CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CA8);
  }
  return result;
}

unint64_t sub_252DB2B18()
{
  unint64_t result = qword_269CA9CB0;
  if (!qword_269CA9CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CB0);
  }
  return result;
}

unint64_t sub_252DB2B68()
{
  unint64_t result = qword_269CA9CB8;
  if (!qword_269CA9CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CB8);
  }
  return result;
}

unint64_t sub_252DB2BB8()
{
  unint64_t result = qword_269CA9CC0;
  if (!qword_269CA9CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CC0);
  }
  return result;
}

unint64_t sub_252DB2C08()
{
  unint64_t result = qword_269CA9CC8;
  if (!qword_269CA9CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CC8);
  }
  return result;
}

unint64_t sub_252DB2C58()
{
  unint64_t result = qword_269CA9CD0;
  if (!qword_269CA9CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CD0);
  }
  return result;
}

unint64_t sub_252DB2CA8()
{
  unint64_t result = qword_269CA9CD8;
  if (!qword_269CA9CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CD8);
  }
  return result;
}

unint64_t sub_252DB2CF8()
{
  unint64_t result = qword_269CA9CE0;
  if (!qword_269CA9CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CE0);
  }
  return result;
}

unint64_t sub_252DB2D48()
{
  unint64_t result = qword_269CA9CE8;
  if (!qword_269CA9CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CE8);
  }
  return result;
}

unint64_t sub_252DB2D98()
{
  unint64_t result = qword_269CA9CF0;
  if (!qword_269CA9CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CF0);
  }
  return result;
}

unint64_t sub_252DB2DE8()
{
  unint64_t result = qword_269CA9CF8;
  if (!qword_269CA9CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9CF8);
  }
  return result;
}

unint64_t sub_252DB2E38()
{
  unint64_t result = qword_269CA9D00;
  if (!qword_269CA9D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D00);
  }
  return result;
}

unint64_t sub_252DB2E88()
{
  unint64_t result = qword_269CA9D08;
  if (!qword_269CA9D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D08);
  }
  return result;
}

unint64_t sub_252DB2ED8()
{
  unint64_t result = qword_269CA9D10;
  if (!qword_269CA9D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D10);
  }
  return result;
}

unint64_t sub_252DB2F28()
{
  unint64_t result = qword_269CA9D18;
  if (!qword_269CA9D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D18);
  }
  return result;
}

unint64_t sub_252DB2F78()
{
  unint64_t result = qword_269CA9D20;
  if (!qword_269CA9D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D20);
  }
  return result;
}

unint64_t sub_252DB2FC8()
{
  unint64_t result = qword_269CA9D28;
  if (!qword_269CA9D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D28);
  }
  return result;
}

unint64_t sub_252DB3018()
{
  unint64_t result = qword_269CA9D30;
  if (!qword_269CA9D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D30);
  }
  return result;
}

unint64_t sub_252DB3068()
{
  unint64_t result = qword_269CA9D38;
  if (!qword_269CA9D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D38);
  }
  return result;
}

unint64_t sub_252DB30B8()
{
  unint64_t result = qword_269CA9D40;
  if (!qword_269CA9D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D40);
  }
  return result;
}

unint64_t sub_252DB3108()
{
  unint64_t result = qword_269CA9D48;
  if (!qword_269CA9D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D48);
  }
  return result;
}

unint64_t sub_252DB3158()
{
  unint64_t result = qword_269CA9D50;
  if (!qword_269CA9D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D50);
  }
  return result;
}

unint64_t sub_252DB31A8()
{
  unint64_t result = qword_269CA9D58;
  if (!qword_269CA9D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D58);
  }
  return result;
}

unint64_t sub_252DB31F8()
{
  unint64_t result = qword_269CA9D60;
  if (!qword_269CA9D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D60);
  }
  return result;
}

unint64_t sub_252DB3248()
{
  unint64_t result = qword_269CA9D68;
  if (!qword_269CA9D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D68);
  }
  return result;
}

unint64_t sub_252DB3298()
{
  unint64_t result = qword_269CA9D70;
  if (!qword_269CA9D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D70);
  }
  return result;
}

unint64_t sub_252DB32E8()
{
  unint64_t result = qword_269CA9D78;
  if (!qword_269CA9D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D78);
  }
  return result;
}

unint64_t sub_252DB3338()
{
  unint64_t result = qword_269CA9D80;
  if (!qword_269CA9D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D80);
  }
  return result;
}

unint64_t sub_252DB3388()
{
  unint64_t result = qword_269CA9D88;
  if (!qword_269CA9D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D88);
  }
  return result;
}

unint64_t sub_252DB33D8()
{
  unint64_t result = qword_269CA9D90;
  if (!qword_269CA9D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D90);
  }
  return result;
}

unint64_t sub_252DB3428()
{
  unint64_t result = qword_269CA9D98;
  if (!qword_269CA9D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9D98);
  }
  return result;
}

unint64_t sub_252DB3474()
{
  unint64_t result = qword_26B23C118;
  if (!qword_26B23C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23C118);
  }
  return result;
}

uint64_t sub_252DB34F8()
{
  return sub_252DC3230();
}

uint64_t sub_252DB3524()
{
  return v0;
}

char *sub_252DB3540@<X0>(unint64_t a1@<X8>)
{
  return sub_252DABC44((char *)(a1 > 1), v2, 1, v1);
}

char *sub_252DB3564()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_252DABC44(0, v2, 1, v0);
}

uint64_t sub_252DB35A0()
{
  return v0;
}

uint64_t sub_252DB35AC()
{
  return sub_252DC32B0();
}

uint64_t sub_252DB35D0()
{
  *(void *)(v0 + 96) = v2;
  return v1;
}

uint64_t sub_252DB35F8()
{
  return sub_252DC32D0();
}

uint64_t sub_252DB3618()
{
  return v0;
}

uint64_t sub_252DB3630()
{
  return sub_252DC32E0();
}

uint64_t sub_252DB364C(uint64_t a1)
{
  return _s23IntelligenceFlowContext14DetectedEntityOwet_0(a1, 1, v1);
}

uint64_t sub_252DB366C()
{
  return sub_252DC32E0();
}

uint64_t sub_252DB3684()
{
  return 0;
}

uint64_t sub_252DB36A0()
{
  return sub_252DC32D0();
}

void sub_252DB36C0()
{
  v0[14] = 0;
  v0[15] = 0;
  v0[16] = 0;
  v0[17] = 0;
  v0[11] = 0;
}

uint64_t sub_252DB36EC()
{
  return v0;
}

uint64_t sub_252DB3700()
{
  return v0;
}

uint64_t sub_252DB3734()
{
  return sub_252DC32B0();
}

uint64_t sub_252DB375C()
{
  return sub_252DC33E0();
}

void sub_252DB3778()
{
  *(void *)(v0 + 16) = v1;
  uint64_t v5 = v0 + 16 * v4;
  *(void *)(v5 + 32) = v2;
  *(void *)(v5 + 40) = v3;
}

void sub_252DB3798()
{
  uint64_t v2 = v0[2];
  *(void *)(v1 - 104) = v0[3];
  *(void *)(v1 - 96) = v2;
  uint64_t v3 = v0[4];
  *(void *)(v1 - 120) = v0[5];
  *(void *)(v1 - 112) = v3;
  uint64_t v4 = v0[6];
  *(void *)(v1 - 136) = v0[7];
  *(void *)(v1 - 128) = v4;
}

uint64_t sub_252DB37C0()
{
  return 0;
}

uint64_t sub_252DB37CC()
{
  return v0;
}

void sub_252DB37FC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_252DB3808()
{
  return sub_252DC3340();
}

void *sub_252DB3834@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v2 - 256);
  *uint64_t v3 = a1;
  v3[1] = v1;
  return v3;
}

uint64_t sub_252DB3854()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_252DB3870(uint64_t a1, uint64_t a2)
{
  return sub_252DAAEA4(a1, a2);
}

uint64_t sub_252DB3898()
{
  return sub_252DC3250();
}

uint64_t sub_252DB38B0()
{
  return sub_252D8FF2C(v1, v0);
}

uint64_t sub_252DB38C8()
{
  return 0;
}

uint64_t sub_252DB38F0()
{
  return type metadata accessor for DetectedEntity(0);
}

uint64_t sub_252DB3918()
{
  return 0;
}

uint64_t sub_252DB3934()
{
  return 0;
}

uint64_t sub_252DB3950()
{
  return 0;
}

void sub_252DB396C(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 96) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_252DB3988()
{
  *(void *)(v0 + 128) = 0;
}

void *sub_252DB39A4(void *a1)
{
  return memcpy(a1, v1, 0x80uLL);
}

uint64_t sub_252DB39BC()
{
  return sub_252D8FF2C(v1, v0);
}

uint64_t sub_252DB39D4()
{
  return v0;
}

uint64_t sub_252DB39FC()
{
  return v0;
}

uint64_t sub_252DB3A08()
{
  return sub_252DC3250();
}

uint64_t sub_252DB3A24()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_252DB3A50()
{
  *(void *)(v0 + 176) = 0;
  *(void *)(v0 + 184) = 0xE000000000000000;
  return sub_252DC31C0();
}

uint64_t sub_252DB3A74()
{
  return v0;
}

uint64_t sub_252DB3A84()
{
  return v0;
}

char *sub_252DB3AAC@<X0>(unint64_t a1@<X8>)
{
  return sub_252DABC44((char *)(a1 > 1), v2, 1, v1);
}

char *sub_252DB3AD0@<X0>(unint64_t a1@<X8>)
{
  return sub_252DABC44((char *)(a1 > 1), v1, 1, v2);
}

uint64_t sub_252DB3AF4()
{
  return v0;
}

uint64_t sub_252DB3B04()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_252DB3B1C()
{
  return v0;
}

uint64_t sub_252DB3B34()
{
  return sub_252D8FE64(v1, v0, v2);
}

uint64_t sub_252DB3B58()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_252DB3B8C()
{
  return sub_252DC30B0();
}

char *sub_252DB3BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_252DABC44(0, 1, 1, a4);
}

uint64_t sub_252DB3BC4()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_252DB3BF0()
{
  return v0;
}

uint64_t sub_252DB3C04()
{
  return swift_bridgeObjectRetain();
}

void sub_252DB3C1C()
{
  JUMPOUT(0x2533CA690);
}

uint64_t sub_252DB3C3C@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t sub_252DB3C44@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 216) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_252DB3CC0()
{
  return sub_252DC3060();
}

uint64_t sub_252DB3CE0()
{
  return v0;
}

uint64_t sub_252DB3CF4()
{
  *(unsigned char *)(v0 - 66) = 1;
  return *(void *)(v0 - 96);
}

uint64_t sub_252DB3D08()
{
  return v0;
}

uint64_t sub_252DB3D14()
{
  return v0;
}

uint64_t sub_252DB3D34()
{
  return v0;
}

uint64_t sub_252DB3D68()
{
  return sub_252DC3390();
}

uint64_t sub_252DB3D80()
{
  return v0;
}

uint64_t sub_252DB3D8C()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for DetectedEntityDetails(0) + 20));
}

uint64_t sub_252DB3DAC()
{
  return type metadata accessor for DetectedAppEntity(0);
}

uint64_t sub_252DB3DC8(void *a1, void *a2)
{
  *a1 = *a2;
  return a2[1];
}

uint64_t UIContextClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  UIContextClient.init()();
  return v0;
}

void *UIContextClient.init()()
{
  type metadata accessor for UIContextXPCClient();
  uint64_t v1 = swift_allocObject();
  v0[2] = sub_252DC1F30(v1, v2);
  sub_252DC2BE0();
  swift_allocObject();
  v0[3] = sub_252DC2BD0();
  sub_252DC2C10();
  swift_allocObject();
  v0[4] = sub_252DC2C00();
  return v0;
}

uint64_t UIContextClient.retrieveElementHierarchy(verbose:args:)(uint64_t a1)
{
  return sub_252DC2314(a1);
}

uint64_t UIContextClient.retrieve(options:)(uint64_t a1)
{
  type metadata accessor for UIContextOptions();
  sub_252DB6EBC(&qword_26B23BD40, (void (*)(uint64_t))type metadata accessor for UIContextOptions);
  uint64_t result = sub_252DC2BF0();
  if (!v1)
  {
    uint64_t v4 = result;
    unint64_t v5 = v3;
    uint64_t v6 = sub_252DC1FD8(result);
    unint64_t v8 = v7;
    sub_252D8823C(&qword_26B23BD30);
    sub_252DB6D54(&qword_26B23BD50, &qword_26B23BD30, (void (*)(void))sub_252D8936C);
    sub_252DC2BC0();
    sub_252D883C4(v6, v8);
    sub_252D883C4(v4, v5);
    return a1;
  }
  return result;
}

uint64_t UIContextClient.retrieveUIElements()()
{
  uint64_t result = sub_252DC2148();
  if (!v0)
  {
    uint64_t v3 = result;
    unint64_t v4 = v2;
    sub_252D8823C(&qword_269CA9128);
    sub_252DB6D54(&qword_269CA9148, &qword_269CA9128, (void (*)(void))sub_252D89424);
    sub_252DC2BC0();
    sub_252D883C4(v3, v4);
    return v5;
  }
  return result;
}

uint64_t UIContextClient.retrieveOnScreenContent(parameters:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 80) = v1;
  *(void *)(v2 + 88) = v3;
  long long v4 = *(_OWORD *)(a1 + 3);
  *(_OWORD *)(v2 + 96) = *(_OWORD *)(a1 + 1);
  *(_OWORD *)(v2 + 112) = v4;
  *(unsigned char *)(v2 + 184) = *((unsigned char *)a1 + 40);
  *(unsigned char *)(v2 + 185) = *((unsigned char *)a1 + 41);
  *(void *)(v2 + 128) = a1[6];
  sub_252DB7364();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_252DB4138()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 88);
  long long v1 = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 24) = *(_OWORD *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 128);
  char v3 = *(unsigned char *)(v0 + 185);
  char v4 = *(unsigned char *)(v0 + 184);
  *(_OWORD *)(v0 + 40) = v1;
  *(unsigned char *)(v0 + 56) = v4;
  *(unsigned char *)(v0 + 57) = v3;
  *(void *)(v0 + 64) = v2;
  sub_252DB6DCC();
  uint64_t v5 = sub_252DC2BF0();
  *(void *)(v0 + 136) = v5;
  *(void *)(v0 + 144) = v6;
  uint64_t v7 = v5;
  uint64_t v8 = v6;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_252DB4280;
  return sub_252DC2568(v7, v8);
}

uint64_t sub_252DB4280()
{
  sub_252DB7264();
  sub_252DB7358();
  *char v3 = v2;
  *char v3 = *v1;
  v2[20] = v4;
  v2[21] = v5;
  v2[22] = v0;
  swift_task_dealloc();
  sub_252DB7364();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_252DB436C()
{
  uint64_t v1 = v0[22];
  sub_252D8823C(&qword_269CA9DC0);
  sub_252DB6E18();
  sub_252DC2BC0();
  uint64_t v2 = v0[17];
  unint64_t v3 = v0[18];
  sub_252D883C4(v0[20], v0[21]);
  sub_252D883C4(v2, v3);
  if (v1)
  {
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = v0[9];
    uint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
    return v7(v6);
  }
}

uint64_t sub_252DB4484()
{
  sub_252D883C4(v0[17], v0[18]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t UIContextClient.convert(entity:format:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = a2;
  uint64_t v5 = type metadata accessor for OnScreenContent.Image(0);
  *(void *)(v3 + 96) = v5;
  sub_252D97F80(v5);
  *(void *)(v3 + 104) = sub_252DB71D8();
  uint64_t v6 = sub_252D8823C(&qword_269CA9238);
  sub_252D97F80(v6);
  *(void *)(v3 + 112) = sub_252DB71D8();
  uint64_t v7 = sub_252DC2DC0();
  *(void *)(v3 + 120) = v7;
  sub_252D9E160(v7);
  *(void *)(v3 + 128) = v8;
  *(void *)(v3 + 136) = sub_252DB71D8();
  uint64_t v9 = sub_252DC2D70();
  *(void *)(v3 + 144) = v9;
  sub_252D9E160(v9);
  *(void *)(v3 + 152) = v10;
  *(void *)(v3 + 160) = sub_252DB71D8();
  uint64_t v11 = sub_252DC2DD0();
  *(void *)(v3 + 168) = v11;
  sub_252D9E160(v11);
  *(void *)(v3 + 176) = v12;
  *(void *)(v3 + 184) = sub_252DB71D8();
  uint64_t v13 = sub_252DC2E30();
  *(void *)(v3 + 192) = v13;
  sub_252D9E160(v13);
  *(void *)(v3 + 200) = v14;
  *(void *)(v3 + 208) = sub_252DB720C();
  *(void *)(v3 + 216) = swift_task_alloc();
  uint64_t v15 = sub_252DC2F60();
  *(void *)(v3 + 224) = v15;
  sub_252D9E160(v15);
  *(void *)(v3 + 232) = v16;
  *(void *)(v3 + 240) = sub_252DB720C();
  *(void *)(v3 + 248) = swift_task_alloc();
  *(void *)(v3 + 256) = swift_task_alloc();
  uint64_t v17 = type metadata accessor for OnScreenContent.UIMetadata(0);
  *(void *)(v3 + 264) = v17;
  sub_252D97F80(v17);
  *(void *)(v3 + 272) = sub_252DB71D8();
  uint64_t v18 = sub_252D8823C(&qword_269CA91E8);
  sub_252D97F80(v18);
  *(void *)(v3 + 280) = sub_252DB71D8();
  uint64_t v19 = sub_252D8823C(&qword_269CA91E0);
  sub_252D97F80(v19);
  *(void *)(v3 + 288) = sub_252DB71D8();
  uint64_t v20 = type metadata accessor for OnScreenContent.Content(0);
  *(void *)(v3 + 296) = v20;
  sub_252D97F80(v20);
  *(void *)(v3 + 304) = sub_252DB71D8();
  uint64_t v21 = sub_252DC2D30();
  *(void *)(v3 + 312) = v21;
  sub_252D9E160(v21);
  *(void *)(v3 + 320) = v22;
  *(void *)(v3 + 328) = sub_252DB720C();
  *(void *)(v3 + 336) = swift_task_alloc();
  uint64_t v23 = sub_252D8823C(&qword_269CA9DE0);
  sub_252D97F80(v23);
  *(void *)(v3 + 344) = sub_252DB720C();
  *(void *)(v3 + 352) = swift_task_alloc();
  uint64_t v24 = sub_252DC2D20();
  sub_252D97F80(v24);
  *(void *)(v3 + 360) = sub_252DB71D8();
  uint64_t v25 = sub_252D8823C(&qword_269CA9DE8);
  sub_252D97F80(v25);
  *(void *)(v3 + 368) = sub_252DB720C();
  *(void *)(v3 + 376) = swift_task_alloc();
  *(void *)(v3 + 384) = swift_task_alloc();
  uint64_t v26 = sub_252D8823C(&qword_269CA9DF0);
  sub_252D97F80(v26);
  *(void *)(v3 + 392) = sub_252DB71D8();
  uint64_t v27 = sub_252DC2CC0();
  *(void *)(v3 + 400) = v27;
  sub_252D9E160(v27);
  *(void *)(v3 + 408) = v28;
  *(void *)(v3 + 416) = sub_252DB720C();
  *(void *)(v3 + 424) = swift_task_alloc();
  *(void *)(v3 + 432) = swift_task_alloc();
  uint64_t v29 = sub_252DC2FD0();
  *(void *)(v3 + 440) = v29;
  sub_252D9E160(v29);
  *(void *)(v3 + 448) = v30;
  *(void *)(v3 + 456) = sub_252DB71D8();
  uint64_t v31 = sub_252DC2FC0();
  *(void *)(v3 + 464) = v31;
  sub_252D9E160(v31);
  *(void *)(v3 + 472) = v32;
  *(void *)(v3 + 480) = sub_252DB71D8();
  uint64_t v33 = sub_252DC2FF0();
  *(void *)(v3 + 488) = v33;
  sub_252D9E160(v33);
  *(void *)(v3 + 496) = v34;
  *(void *)(v3 + 504) = sub_252DB71D8();
  uint64_t v35 = sub_252DC2FE0();
  *(void *)(v3 + 512) = v35;
  sub_252D9E160(v35);
  *(void *)(v3 + 520) = v36;
  *(void *)(v3 + 528) = sub_252DB720C();
  *(void *)(v3 + 536) = swift_task_alloc();
  *(void *)(v3 + 544) = swift_task_alloc();
  uint64_t v37 = sub_252DC2F30();
  *(void *)(v3 + 552) = v37;
  sub_252D9E160(v37);
  *(void *)(v3 + 560) = v38;
  *(void *)(v3 + 568) = sub_252DB71D8();
  *(void *)(v3 + 576) = *(void *)a3;
  *(unsigned char *)(v3 + 704) = *(unsigned char *)(a3 + 8);
  uint64_t v39 = (void *)swift_task_alloc();
  *(void *)(v3 + 584) = v39;
  *uint64_t v39 = v3;
  v39[1] = sub_252DB49B8;
  return MEMORY[0x270F7FD48]();
}

uint64_t sub_252DB49B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  sub_252DB727C();
  sub_252DB734C();
  sub_252DB7264();
  uint64_t v39 = v38;
  sub_252DB7358();
  *unint64_t v40 = v39;
  *unint64_t v40 = *v37;
  v39[74] = v41;
  v39[75] = v36;
  swift_task_dealloc();
  if (v36)
  {
    uint64_t v55 = v39[53];
    uint64_t v56 = v39[52];
    uint64_t v57 = v39[49];
    uint64_t v58 = v39[48];
    uint64_t v59 = v39[47];
    uint64_t v60 = v39[46];
    uint64_t v61 = v39[45];
    uint64_t v62 = v39[44];
    uint64_t v63 = v39[43];
    uint64_t v64 = v39[42];
    uint64_t v65 = v39[41];
    uint64_t v66 = v39[38];
    uint64_t v67 = v39[36];
    uint64_t v68 = v39[35];
    uint64_t v69 = v39[34];
    uint64_t v70 = v39[32];
    uint64_t v71 = v39[31];
    uint64_t v72 = v39[30];
    uint64_t v73 = v39[27];
    uint64_t v74 = v39[26];
    uint64_t v75 = v39[23];
    uint64_t v76 = v39[20];
    uint64_t v77 = v39[17];
    uint64_t v78 = v39[14];
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
    sub_252DB71F0();
    return v43(v42, v43, v44, v45, v46, v47, v48, v49, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65,
             v66,
             v67,
             v68,
             v69,
             v70,
             v71,
             v72,
             v73,
             v74,
             v75,
             v76,
             v77,
             v78,
             a33,
             a34,
             a35,
             a36);
  }
  else
  {
    sub_252DB7364();
    sub_252DB71F0();
    return MEMORY[0x270FA2498](v51, v52, v53);
  }
}

uint64_t sub_252DB4C7C()
{
  if (*(unsigned char *)(v0 + 704))
  {
    if (*(unsigned char *)(v0 + 704) == 1)
    {
      uint64_t v1 = *(void *)(v0 + 576);
      uint64_t v2 = swift_bridgeObjectRetain();
      sub_252D9A62C(v2, 1u);
      sub_252D9A62C(0, 2u);
      uint64_t v3 = sub_252DB68C0(v1);
      sub_252DC2F20();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_252DABD34(0, *(void *)(v3 + 16) + 1, 1, v3);
      }
      unint64_t v5 = *(void *)(v3 + 16);
      unint64_t v4 = *(void *)(v3 + 24);
      if (v5 >= v4 >> 1) {
        uint64_t v3 = sub_252DABD34(v4 > 1, v5 + 1, 1, v3);
      }
      uint64_t v6 = *(void *)(v0 + 568);
      uint64_t v7 = *(void *)(v0 + 560);
      uint64_t v8 = *(void *)(v0 + 552);
      *(void *)(v3 + 16) = v5 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(v3+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v5, v6, v8);
    }
    else
    {
      sub_252D9A62C(*(void *)(v0 + 576), 2u);
      sub_252D9A62C(0, 2u);
      sub_252D8823C(&qword_269CA95F0);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_252DC6650;
      sub_252DC2EE0();
    }
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 576);
    uint64_t v9 = swift_bridgeObjectRetain();
    sub_252D9A62C(v9, 0);
    sub_252D9A62C(0, 2u);
    swift_bridgeObjectRetain();
  }
  uint64_t v10 = *(uint64_t **)(v0 + 536);
  uint64_t v11 = *(void *)(v0 + 520);
  uint64_t v12 = *(uint64_t **)(v0 + 504);
  uint64_t v13 = *(void *)(v0 + 512);
  uint64_t v14 = *(void *)(v0 + 496);
  uint64_t v39 = *(void *)(v0 + 488);
  uint64_t v15 = *(void *)(v0 + 88);
  uint64_t v16 = sub_252DC2FA0();
  *(void *)(v0 + 608) = v16;
  uint64_t v17 = swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v18, v15, v16);
  *uint64_t v10 = v17;
  (*(void (**)(uint64_t *, void, uint64_t))(v11 + 104))(v10, *MEMORY[0x263F804B0], v13);
  uint64_t v19 = sub_252D8823C(&qword_269CA9DF8);
  uint64_t v38 = swift_allocBox();
  uint64_t v21 = v20;
  uint64_t v22 = *(int *)(v19 + 48);
  uint64_t v23 = sub_252DC3000();
  uint64_t v24 = swift_allocBox();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F80700], v23);
  uint64_t *v21 = v24;
  uint64_t v26 = *MEMORY[0x263F80760];
  sub_252DC3010();
  sub_252D97EE8();
  (*(void (**)(uint64_t *, uint64_t))(v27 + 104))(v21, v26);
  sub_252D8823C(&qword_269CA9E00);
  uint64_t v28 = *(void *)(sub_252DC3020() - 8);
  unint64_t v29 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_252DC6650;
  *(void *)(v30 + v29) = v3;
  (*(void (**)(void))(v28 + 104))();
  *(uint64_t *)((char *)v21 + v22) = v30;
  *uint64_t v12 = v38;
  (*(void (**)(uint64_t *, void, uint64_t))(v14 + 104))(v12, *MEMORY[0x263F80538], v39);
  uint64_t v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 616) = v31;
  uint64_t v32 = sub_252D8823C(&qword_269CA9E08);
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *uint64_t v31 = v0;
  v31[1] = sub_252DB5100;
  uint64_t v34 = *(void *)(v0 + 544);
  uint64_t v35 = *(void *)(v0 + 536);
  uint64_t v36 = *(void *)(v0 + 504);
  return MEMORY[0x270F7FC18](v34, v35, v36, v32, OpaqueTypeConformance2);
}

uint64_t sub_252DB5100()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  sub_252DB7358();
  *unint64_t v4 = v3;
  *unint64_t v4 = *v1;
  v3[78] = v0;
  swift_task_dealloc();
  uint64_t v5 = v2[65];
  sub_252DB7340();
  v6();
  uint64_t v9 = *(void *)(v5 + 8);
  uint64_t v8 = v5 + 8;
  uint64_t v7 = v9;
  if (!v0)
  {
    v3[79] = v7;
    v3[80] = v8 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  }
  uint64_t v10 = sub_252DB7300();
  v11(v10);
  sub_252DB7364();
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_252DB52CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void (*a29)(uint64_t, uint64_t),uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  sub_252DB727C();
  sub_252DB734C();
  uint64_t v37 = *(void *)(v36 + 528);
  uint64_t v38 = *(void *)(v36 + 520);
  uint64_t v39 = *(void *)(v36 + 512);
  (*(void (**)(uint64_t, void, uint64_t))(v38 + 16))(v37, *(void *)(v36 + 544), v39);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v38 + 88))(v37, v39) != *MEMORY[0x263F804E8])
  {
    (*(void (**)(void, void))(v36 + 632))(*(void *)(v36 + 528), *(void *)(v36 + 512));
LABEL_11:
    sub_252DC2E60();
    uint64_t v82 = sub_252DC2F50();
    os_log_type_t v83 = sub_252DC3140();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v84 = 0;
      _os_log_impl(&dword_252D85000, v82, v83, "unable to convert entity to file", v84, 2u);
      MEMORY[0x2533CADF0](v84, -1, -1);
    }
    uint64_t v85 = *(void (**)(uint64_t, uint64_t))(v36 + 632);
    uint64_t v86 = *(void *)(v36 + 544);
    uint64_t v87 = *(void *)(v36 + 512);
    uint64_t v89 = *(void *)(v36 + 232);
    uint64_t v88 = *(void *)(v36 + 240);
    uint64_t v90 = *(void *)(v36 + 224);
    uint64_t v91 = *(void *)(v36 + 80);
    swift_unknownObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v88, v90);
    v85(v86, v87);
    uint64_t v94 = type metadata accessor for OnScreenContent(0);
    uint64_t v95 = v91;
    goto LABEL_14;
  }
  uint64_t v41 = *(void *)(v36 + 448);
  uint64_t v40 = *(void *)(v36 + 456);
  uint64_t v42 = *(void *)(v36 + 440);
  (*(void (**)(void, void))(*(void *)(v36 + 520) + 96))(*(void *)(v36 + 528), *(void *)(v36 + 512));
  uint64_t v43 = swift_projectBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v40, v43, v42);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v41 + 88))(v40, v42) != *MEMORY[0x263F80468])
  {
    sub_252DB7340();
    v81();
    swift_release();
    goto LABEL_11;
  }
  uint64_t v45 = *(void *)(v36 + 472);
  uint64_t v44 = *(void *)(v36 + 480);
  uint64_t v47 = *(void *)(v36 + 456);
  uint64_t v46 = *(void *)(v36 + 464);
  (*(void (**)(uint64_t, void))(*(void *)(v36 + 448) + 96))(v47, *(void *)(v36 + 440));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v44, v47, v46);
  swift_release();
  uint64_t v48 = (void *)sub_252DC2FB0();
  *(void *)(v36 + 648) = v48;
  id v49 = objc_msgSend(v48, sel_fileURL);
  if (!v49)
  {
    sub_252D980C4(*(void *)(v36 + 392), v50, v51, *(void *)(v36 + 400));
    goto LABEL_19;
  }
  uint64_t v52 = v49;
  uint64_t v53 = *(void *)(v36 + 424);
  uint64_t v55 = *(void *)(v36 + 400);
  uint64_t v54 = *(void *)(v36 + 408);
  uint64_t v56 = *(void *)(v36 + 392);
  sub_252DC2CA0();

  uint64_t v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 32);
  v57(v56, v53, v55);
  sub_252DB7334();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v58, v59, v60, v55);
  if (_s23IntelligenceFlowContext14DetectedEntityOwet_0(v56, 1, v55) == 1)
  {
LABEL_19:
    a31 = v48;
    sub_252DB7098(*(void *)(v36 + 392), &qword_269CA9DF0);
    sub_252DC2E60();
    uint64_t v104 = sub_252DC2F50();
    os_log_type_t v105 = sub_252DC3140();
    if (os_log_type_enabled(v104, v105))
    {
      uint64_t v106 = (_WORD *)swift_slowAlloc();
      *uint64_t v106 = 0;
      sub_252DB7314(&dword_252D85000, v107, v108, "unable to retrieve file URL from INFile");
      MEMORY[0x2533CADF0](v106, -1, -1);
    }
    a29 = *(void (**)(uint64_t, uint64_t))(v36 + 632);
    a30 = *(void *)(v36 + 640);
    uint64_t v109 = *(void *)(v36 + 512);
    uint64_t v110 = *(void *)(v36 + 248);
    uint64_t v112 = *(void *)(v36 + 224);
    uint64_t v111 = *(void *)(v36 + 232);
    a27 = *(void *)(v36 + 544);
    a28 = *(void *)(v36 + 80);

    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v110, v112);
    sub_252DB3728();
    v113();
    a29(a27, v109);
    uint64_t v94 = type metadata accessor for OnScreenContent(0);
    uint64_t v95 = a28;
LABEL_14:
    sub_252D980C4(v95, v92, v93, v94);
    goto LABEL_15;
  }
  int v61 = *(unsigned __int8 *)(v36 + 704);
  v57(*(void *)(v36 + 432), *(void *)(v36 + 392), *(void *)(v36 + 400));
  int v62 = sub_252DC2CB0();
  *(unsigned char *)(v36 + 705) = v62 & 1;
  if (v61 == 1)
  {
    uint64_t v177 = *(void *)(v36 + 576);
    uint64_t v179 = *(void *)(v36 + 432);
    uint64_t v63 = *(void *)(v36 + 320);
    uint64_t v64 = *(void *)(v36 + 328);
    uint64_t v176 = *(void *)(v36 + 312);
    uint64_t v65 = *(void *)(v36 + 216);
    uint64_t v66 = *(void *)(v36 + 200);
    uint64_t v182 = *(void *)(v36 + 192);
    uint64_t v185 = *(void *)(v36 + 208);
    uint64_t v68 = *(void *)(v36 + 176);
    uint64_t v67 = *(void *)(v36 + 184);
    uint64_t v69 = *(void *)(v36 + 168);
    uint64_t v178 = *(void *)(v36 + 136);
    swift_bridgeObjectRetain();
    sub_252DC2E20();
    (*(void (**)(uint64_t, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x263F81B70], v69);
    uint64_t v70 = (void (*)(uint64_t, void))sub_252DC2E10();
    sub_252DC2DE0();
    v70(v36 + 16, 0);
    (*(void (**)(uint64_t, void, uint64_t))(v63 + 104))(v64, *MEMORY[0x263F818A8], v176);
    uint64_t v71 = (void (*)(uint64_t, void))sub_252DC2E10();
    sub_252DC2DF0();
    v71(v36 + 48, 0);
    sub_252DC2E00();
    sub_252DB7364();
    sub_252DC2DB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v185, v65, v182);
    uint64_t v72 = (void *)swift_task_alloc();
    *(void *)(v36 + 656) = v72;
    *uint64_t v72 = v36;
    v72[1] = sub_252DB5E58;
    sub_252DB71F0();
    return MEMORY[0x270F81190](v73, v74, v75, v76, v77, v78, v79, v80, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             v176,
             v177,
             v178,
             v179,
             v182,
             v185,
             a32,
             a33,
             a34,
             a35,
             a36);
  }
  int v114 = v62;
  sub_252DB6F64(v48);
  a31 = v48;
  LODWORD(a25) = v114;
  if (v116) {
    sub_252DC2F40();
  }
  else {
    sub_252D980C4(*(void *)(v36 + 376), 0, v115, *(void *)(v36 + 552));
  }
  v183 = *(void **)(v36 + 624);
  uint64_t v117 = *(void *)(v36 + 432);
  uint64_t v118 = *(void *)(v36 + 408);
  uint64_t v119 = *(void *)(v36 + 416);
  uint64_t v120 = *(void *)(v36 + 400);
  uint64_t v121 = *(void *)(v36 + 384);
  uint64_t v122 = *(void *)(v36 + 368);
  a26 = *(void *)(v36 + 360);
  uint64_t v123 = *(void *)(v36 + 352);
  uint64_t v124 = *(void *)(v36 + 320);
  a28 = *(void *)(v36 + 336);
  uint64_t v180 = *(void *)(v36 + 312);
  sub_252DB6FC8(*(void *)(v36 + 376), v121);
  a27 = sub_252DC2D40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v118 + 16))(v119, v117, v120);
  id v125 = objc_msgSend(a31, sel_filename);
  sub_252DC3080();

  sub_252DB7030(v121, v122);
  uint64_t v126 = sub_252DC2CF0();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v123, 1, 1, v126);
  uint64_t v127 = sub_252DB72C0();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v127, v128, v129, v126);
  sub_252DC2D10();
  (*(void (**)(uint64_t, void, uint64_t))(v124 + 104))(a28, *MEMORY[0x263F818A8], v180);
  uint64_t v130 = sub_252DC2D00();
  if (v183)
  {

    sub_252DC2E60();
    uint64_t v131 = sub_252DC2F50();
    os_log_type_t v132 = sub_252DC3140();
    if (os_log_type_enabled(v131, v132))
    {
      uint64_t v133 = (_WORD *)swift_slowAlloc();
      *uint64_t v133 = 0;
      sub_252DB7314(&dword_252D85000, v134, v135, "unable to construct IntelligenceFile from file URL");
      MEMORY[0x2533CADF0](v133, -1, -1);
    }
    uint64_t v136 = *(void *)(v36 + 384);

    sub_252DB3728();
    v137();
    sub_252DB7098(v136, &qword_269CA9DE8);
    type metadata accessor for OnScreenContent(0);
    uint64_t v138 = sub_252DB7298();
  }
  else
  {
    uint64_t v142 = v130;
    uint64_t v143 = *(void *)(v36 + 608);
    v144 = *(uint64_t **)(v36 + 304);
    a28 = *(void *)(v36 + 296);
    uint64_t v181 = *(void *)(v36 + 384);
    uint64_t v145 = *(void *)(v36 + 280);
    uint64_t v146 = *(void *)(v36 + 288);
    uint64_t v147 = *(void *)(v36 + 272);
    a27 = *(void *)(v36 + 264);
    uint64_t v184 = *(void *)(v36 + 80);
    uint64_t v148 = sub_252DC2D80();
    uint64_t v149 = sub_252DB7298();
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v149, v150, v151, v148);
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v145, 1, 1, v143);
    v152 = (int *)type metadata accessor for OnScreenContent.Document(0);
    uint64_t v153 = (uint64_t)v144 + v152[5];
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v153, 1, 1, v148);
    uint64_t v154 = (uint64_t)v144 + v152[6];
    uint64_t v155 = sub_252DB72C0();
    _s23IntelligenceFlowContext14DetectedEntityOwst_0(v155, v156, v157, v143);
    uint64_t *v144 = v142;
    swift_retain();
    sub_252DAC998(v146, v153, &qword_269CA91E0);
    sub_252DAC998(v145, v154, &qword_269CA91E8);
    *((unsigned char *)v144 + v152[7]) = 0;
    swift_storeEnumTagMultiPayload();
    *(_OWORD *)(v147 + 24) = 0u;
    *(_OWORD *)(v147 + 8) = 0u;
    *(unsigned char *)(v147 + 40) = 1;
    *(void *)(v147 + 48) = 0;
    *(unsigned char *)(v147 + 56) = 1;
    uint64_t v158 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
    uint64_t v159 = v147 + *(int *)(v158 + 28);
    uint64_t v160 = sub_252DC2D90();
    sub_252D980C4(v159, v161, v162, v160);
    uint64_t v163 = v147 + *(int *)(v158 + 32);
    uint64_t v164 = sub_252DC2DA0();
    sub_252D980C4(v163, v165, v166, v164);
    *(unsigned char *)uint64_t v147 = 0;
    uint64_t v167 = *(int *)(a27 + 24);
    swift_release();
    *(void *)(v147 + v167) = MEMORY[0x263F8EE78];
    *(unsigned char *)(v147 + *(int *)(a27 + 20)) = 0;
    sub_252DB7098(v181, &qword_269CA9DE8);
    sub_252DB6F04((uint64_t)v144, v184, (void (*)(void))type metadata accessor for OnScreenContent.Content);
    uint64_t v168 = type metadata accessor for OnScreenContent(0);
    sub_252DB6F04(v147, v184 + *(int *)(v168 + 20), (void (*)(void))type metadata accessor for OnScreenContent.UIMetadata);
    sub_252DB7334();
    uint64_t v141 = v168;
  }
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v138, v139, v140, v141);
  if (a25) {
    sub_252DC2C90();
  }
  a29 = *(void (**)(uint64_t, uint64_t))(v36 + 632);
  a30 = *(void *)(v36 + 640);
  uint64_t v169 = *(void *)(v36 + 544);
  uint64_t v170 = *(void *)(v36 + 512);
  uint64_t v171 = *(void *)(v36 + 432);
  uint64_t v172 = *(void *)(v36 + 400);
  uint64_t v173 = *(void *)(v36 + 408);

  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v171, v172);
  sub_252DB3728();
  v174();
  a29(v169, v170);
LABEL_15:
  sub_252DB713C();
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
  sub_252DB71F0();
  return v97(v96, v97, v98, v99, v100, v101, v102, v103, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36);
}

uint64_t sub_252DB5E58()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  sub_252DB7358();
  *unint64_t v4 = v3;
  *unint64_t v4 = *v1;
  v3[83] = v0;
  swift_task_dealloc();
  uint64_t v5 = v2[25];
  uint64_t v6 = *(void *)(v5 + 8);
  uint64_t v7 = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v0)
  {
    v3[86] = v6;
    v3[87] = v7;
  }
  else
  {
    v3[84] = v6;
    v3[85] = v7;
  }
  sub_252DB7340();
  v8();
  uint64_t v9 = sub_252DB72E8();
  v10(v9);
  sub_252DB7364();
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_252DB602C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  sub_252DB727C();
  sub_252DB734C();
  uint64_t v106 = *(void (**)(uint64_t, uint64_t))(v36 + 672);
  uint64_t v108 = *(void (**)(uint64_t, uint64_t))(v36 + 680);
  int v110 = *(unsigned __int8 *)(v36 + 705);
  uint64_t v37 = *(void *)(v36 + 608);
  uint64_t v94 = *(void *)(v36 + 304);
  uint64_t v38 = *(void *)(v36 + 272);
  uint64_t v39 = *(void *)(v36 + 280);
  uint64_t v98 = *(void *)(v36 + 264);
  uint64_t v102 = *(void *)(v36 + 192);
  uint64_t v104 = *(void *)(v36 + 216);
  uint64_t v40 = *(void *)(v36 + 144);
  uint64_t v41 = *(void *)(v36 + 104);
  uint64_t v42 = *(void *)(v36 + 112);
  uint64_t v43 = *(void *)(v36 + 96);
  uint64_t v100 = *(void *)(v36 + 80);
  (*(void (**)(uint64_t))(*(void *)(v36 + 152) + 16))(v42);
  sub_252DB7334();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v44, v45, v46, v40);
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v39, 1, 1, v37);
  uint64_t v47 = sub_252DB72C0();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v47, v48, v49, v40);
  uint64_t v50 = v41 + *(int *)(v43 + 24);
  uint64_t v51 = sub_252DB7298();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v51, v52, v53, v37);
  sub_252DAC998(v42, v41, &qword_269CA9238);
  *(unsigned char *)(v41 + *(int *)(v43 + 20)) = 0;
  sub_252DAC998(v39, v50, &qword_269CA91E8);
  sub_252DB6F04(v41, v94, (void (*)(void))type metadata accessor for OnScreenContent.Image);
  swift_storeEnumTagMultiPayload();
  *(_OWORD *)(v38 + 24) = 0u;
  *(_OWORD *)(v38 + 8) = 0u;
  *(unsigned char *)(v38 + 40) = 1;
  *(void *)(v38 + 48) = 0;
  *(unsigned char *)(v38 + 56) = 1;
  uint64_t v54 = type metadata accessor for OnScreenContent.UIMetadata.Window(0);
  uint64_t v55 = v38 + *(int *)(v54 + 28);
  uint64_t v56 = sub_252DC2D90();
  sub_252D980C4(v55, v57, v58, v56);
  uint64_t v59 = v38 + *(int *)(v54 + 32);
  uint64_t v60 = sub_252DC2DA0();
  sub_252D980C4(v59, v61, v62, v60);
  *(unsigned char *)uint64_t v38 = 0;
  *(void *)(v38 + *(int *)(v98 + 24)) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v38 + *(int *)(v98 + 20)) = 0;
  sub_252DB3728();
  v63();
  v106(v104, v102);
  sub_252DB6F04(v94, v100, (void (*)(void))type metadata accessor for OnScreenContent.Content);
  uint64_t v64 = type metadata accessor for OnScreenContent(0);
  sub_252DB6F04(v38, v100 + *(int *)(v64 + 20), (void (*)(void))type metadata accessor for OnScreenContent.UIMetadata);
  sub_252DB7334();
  _s23IntelligenceFlowContext14DetectedEntityOwst_0(v65, v66, v67, v64);
  if (v110 == 1) {
    sub_252DC2C90();
  }
  sub_252DB7228();
  swift_unknownObjectRelease();
  uint64_t v68 = sub_252DB72A8();
  v69(v68);
  uint64_t v70 = sub_252DB72D0();
  v71(v70);
  v108(v100, v64);
  uint64_t v81 = *(void *)(v36 + 392);
  uint64_t v82 = *(void *)(v36 + 384);
  uint64_t v83 = *(void *)(v36 + 376);
  uint64_t v84 = *(void *)(v36 + 368);
  uint64_t v85 = *(void *)(v36 + 360);
  uint64_t v86 = *(void *)(v36 + 352);
  uint64_t v87 = *(void *)(v36 + 344);
  uint64_t v88 = *(void *)(v36 + 336);
  uint64_t v89 = *(void *)(v36 + 328);
  uint64_t v90 = *(void *)(v36 + 304);
  uint64_t v91 = *(void *)(v36 + 288);
  uint64_t v92 = *(void *)(v36 + 280);
  uint64_t v93 = *(void *)(v36 + 272);
  uint64_t v95 = *(void *)(v36 + 256);
  uint64_t v96 = *(void *)(v36 + 248);
  uint64_t v97 = *(void *)(v36 + 240);
  uint64_t v99 = *(void *)(v36 + 216);
  uint64_t v101 = *(void *)(v36 + 208);
  uint64_t v103 = *(void *)(v36 + 184);
  uint64_t v105 = *(void *)(v36 + 160);
  uint64_t v107 = *(void *)(v36 + 136);
  uint64_t v109 = *(void *)(v36 + 112);
  uint64_t v111 = *(void *)(v36 + 104);
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
  sub_252DB71F0();
  return v73(v72, v73, v74, v75, v76, v77, v78, v79, a9, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90,
           v91,
           v92,
           v93,
           v95,
           v96,
           v97,
           v99,
           v101,
           v103,
           v105,
           v107,
           v109,
           v111,
           a33,
           a34,
           a35,
           a36);
}

uint64_t sub_252DB649C()
{
  swift_unknownObjectRelease();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_252DB66DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void (*a31)(uint64_t, uint64_t),uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  sub_252DB727C();
  sub_252DB734C();
  int v39 = *(unsigned __int8 *)(v38 + 705);
  (*(void (**)(void, void))(v38 + 688))(*(void *)(v38 + 216), *(void *)(v38 + 192));
  if (v39 == 1) {
    sub_252DC2C90();
  }
  sub_252DB7228();
  swift_unknownObjectRelease();
  uint64_t v40 = sub_252DB72A8();
  v41(v40);
  uint64_t v42 = sub_252DB72D0();
  v43(v42);
  a31(v36, v37);
  uint64_t v53 = *(void *)(v38 + 664);
  sub_252DB713C();
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
  sub_252DB71F0();
  return v45(v44, v45, v46, v47, v48, v49, v50, v51, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           v53,
           a33,
           a34,
           a35,
           a36);
}

uint64_t sub_252DB68C0(uint64_t a1)
{
  uint64_t v48 = sub_252DC2D60();
  uint64_t v2 = *(void *)(v48 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v48);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v47 = (char *)&v41 - v6;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v42 = a1 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  uint64_t v45 = v2 + 32;
  uint64_t v46 = v2 + 16;
  int64_t v43 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v44 = v2 + 8;
  uint64_t v49 = a1;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v12 = MEMORY[0x263F8EE78];
  if (!v10) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v13 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v11 << 6))
  {
    uint64_t v19 = v47;
    uint64_t v18 = v48;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v47, *(void *)(v49 + 48) + *(void *)(v2 + 72) * i, v48);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v19, v18);
    uint64_t v20 = sub_252DC2D50();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v18);
    uint64_t v21 = *(void *)(v20 + 16);
    int64_t v22 = *(void *)(v12 + 16);
    int64_t v23 = v22 + v21;
    if (__OFADD__(v22, v21))
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v23 > *(void *)(v12 + 24) >> 1)
    {
      if (v22 <= v23) {
        int64_t v25 = v22 + v21;
      }
      else {
        int64_t v25 = v22;
      }
      uint64_t v12 = sub_252DABD34(isUniquelyReferenced_nonNull_native, v25, 1, v12);
    }
    if (*(void *)(v20 + 16))
    {
      uint64_t v26 = *(void *)(v12 + 16);
      uint64_t v27 = (*(void *)(v12 + 24) >> 1) - v26;
      uint64_t v28 = *(void *)(sub_252DC2F30() - 8);
      uint64_t v29 = *(void *)(v28 + 72);
      if (v27 < v21) {
        goto LABEL_44;
      }
      unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
      unint64_t v31 = v12 + v30 + v29 * v26;
      unint64_t v32 = v20 + v30;
      uint64_t v33 = v29 * v21;
      unint64_t v34 = v31 + v33;
      unint64_t v35 = v32 + v33;
      if (v32 < v34 && v31 < v35) {
        goto LABEL_48;
      }
      swift_arrayInitWithCopy();
      if (v21)
      {
        uint64_t v37 = *(void *)(v12 + 16);
        BOOL v38 = __OFADD__(v37, v21);
        uint64_t v39 = v37 + v21;
        if (v38) {
          goto LABEL_45;
        }
        *(void *)(v12 + 16) = v39;
      }
    }
    else if (v21)
    {
      goto LABEL_43;
    }
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_46;
    }
    if (v15 >= v43) {
      goto LABEL_41;
    }
    unint64_t v16 = *(void *)(v42 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v43) {
        goto LABEL_41;
      }
      unint64_t v16 = *(void *)(v42 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v43) {
          goto LABEL_41;
        }
        unint64_t v16 = *(void *)(v42 + 8 * v11);
        if (!v16)
        {
          int64_t v11 = v15 + 3;
          if (v15 + 3 >= v43) {
            goto LABEL_41;
          }
          unint64_t v16 = *(void *)(v42 + 8 * v11);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v10 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v43)
  {
LABEL_41:
    swift_release();
    return v12;
  }
  unint64_t v16 = *(void *)(v42 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v43) {
      goto LABEL_41;
    }
    unint64_t v16 = *(void *)(v42 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_47:
  __break(1u);
LABEL_48:
  uint64_t result = sub_252DC3210();
  __break(1u);
  return result;
}

uint64_t UIContextClient.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t UIContextClient.__deallocating_deinit()
{
  UIContextClient.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_252DB6D54(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_252DB6DCC()
{
  unint64_t result = qword_269CA9DB8;
  if (!qword_269CA9DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9DB8);
  }
  return result;
}

unint64_t sub_252DB6E18()
{
  unint64_t result = qword_269CA9DC8;
  if (!qword_269CA9DC8)
  {
    sub_252D88324(&qword_269CA9DC0);
    sub_252DB6EBC(&qword_269CA9DD0, (void (*)(uint64_t))type metadata accessor for OnScreenContent);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9DC8);
  }
  return result;
}

uint64_t sub_252DB6EBC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252DB6F04(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_252D97EE8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_252DB6F64(void *a1)
{
  id v1 = objc_msgSend(a1, sel_typeIdentifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_252DC3080();

  return v3;
}

uint64_t sub_252DB6FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252D8823C(&qword_269CA9DE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_252DB7030(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252D8823C(&qword_269CA9DE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_252DB7098(uint64_t a1, uint64_t *a2)
{
  sub_252D8823C(a2);
  sub_252D97EE8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t type metadata accessor for UIContextClient()
{
  return self;
}

uint64_t method lookup function for UIContextClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIContextClient);
}

uint64_t dispatch thunk of UIContextClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_252DB713C()
{
  uint64_t v3 = v0[20];
  *(void *)(v1 - 128) = v0[23];
  *(void *)(v1 - 120) = v3;
  uint64_t v4 = v0[14];
  *(void *)(v1 - 112) = v0[17];
  *(void *)(v1 - 104) = v4;
  *(void *)(v1 - 96) = v0[13];
  return swift_task_dealloc();
}

uint64_t sub_252DB71D8()
{
  return swift_task_alloc();
}

uint64_t sub_252DB720C()
{
  return swift_task_alloc();
}

void sub_252DB7228()
{
  uint64_t v3 = (void *)v0[81];
  uint64_t v4 = v0[80];
  *(void *)(v1 - 96) = v0[79];
  *(void *)(v1 - 88) = v4;
}

uint64_t sub_252DB7298()
{
  return v0;
}

uint64_t sub_252DB72A8()
{
  return v0;
}

uint64_t sub_252DB72C0()
{
  return v0;
}

uint64_t sub_252DB72D0()
{
  return v0;
}

uint64_t sub_252DB72E8()
{
  return v0;
}

uint64_t sub_252DB7300()
{
  return v0;
}

void sub_252DB7314(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t UIContextElement.detectedEntities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UIContextElement.detectedEntities.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*UIContextElement.detectedEntities.modify())()
{
  return nullsub_1;
}

uint64_t UIContextElement.entities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UIContextElement.entities.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*UIContextElement.entities.modify())()
{
  return nullsub_1;
}

uint64_t UIContextElement.surroundingElements.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*UIContextElement.surroundingElements.modify())()
{
  return nullsub_1;
}

uint64_t UIContextElement.uiElement.getter@<X0>(void *a1@<X8>)
{
  sub_252DBD7EC(v3);
  sub_252DBD7EC(a1);
  return sub_252DB74AC((uint64_t)v3);
}

uint64_t sub_252DB74AC(uint64_t a1)
{
  return a1;
}

void *UIContextElement.uiElement.setter(const void *a1)
{
  sub_252DBD7EC(v4);
  sub_252DB7540((uint64_t)v4);
  return memcpy((void *)(v1 + 24), a1, 0x92uLL);
}

uint64_t sub_252DB7540(uint64_t a1)
{
  return a1;
}

uint64_t (*UIContextElement.uiElement.modify())()
{
  return nullsub_1;
}

void UIContextElement.init(detectedEntities:surroundingElements:uiElement:)()
{
  sub_252D9806C();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for DetectedEntity(0);
  uint64_t v9 = sub_252D9E160(v8);
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = sub_252D98134();
  uint64_t v13 = type metadata accessor for DetectedEntityDetails(v12);
  sub_252D89934();
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v16);
  sub_252D981A0();
  sub_252DBD7EC(v27);
  uint64_t v17 = *(void *)(v5 + 16);
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (v17)
  {
    uint64_t v24 = v7;
    uint64_t v25 = v3;
    uint64_t v26 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_252DBA898();
    sub_252DBD818();
    uint64_t v23 = v5;
    uint64_t v20 = v5 + v19;
    uint64_t v21 = *(void *)(v11 + 72);
    uint64_t v18 = v26;
    do
    {
      sub_252DBA940(v20, v0, (void (*)(void))type metadata accessor for DetectedEntity);
      sub_252DBA940(v0, v1, (void (*)(void))type metadata accessor for DetectedEntity);
      *(unsigned char *)(v1 + *(int *)(v13 + 20)) = 0;
      sub_252DBA9A0(v0, (void (*)(void))type metadata accessor for DetectedEntity);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_252DBD788();
        sub_252DBA898();
        uint64_t v18 = v26;
      }
      unint64_t v22 = *(void *)(v18 + 16);
      if (v22 >= *(void *)(v18 + 24) >> 1)
      {
        sub_252DBA898();
        uint64_t v18 = v26;
      }
      *(void *)(v18 + 16) = v22 + 1;
      sub_252DBA9F8(v1, v18+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v22);
      v20 += v21;
      --v17;
    }
    while (v17);
    uint64_t v5 = v23;
    swift_bridgeObjectRelease();
    uint64_t v3 = v25;
    uint64_t v7 = v24;
  }
  memcpy(v7 + 3, v27, 0x92uLL);
  *uint64_t v7 = v5;
  v7[1] = v18;
  v7[2] = v3;
  sub_252D98084();
}

void UIContextElement.init(entities:surroundingElements:uiElement:)()
{
  sub_252D9806C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = type metadata accessor for DetectedEntityDetails(0);
  uint64_t v8 = sub_252D9E160(v7);
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = sub_252D98134();
  uint64_t v12 = type metadata accessor for DetectedEntity(v11);
  uint64_t v13 = sub_252D9E160(v12);
  uint64_t v15 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252DBD7EC(v28);
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (v18)
  {
    uint64_t v26 = v2;
    uint64_t v27 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_252DBA8EC();
    sub_252DBD818();
    uint64_t v25 = v4;
    uint64_t v21 = v4 + v20;
    uint64_t v22 = *(void *)(v10 + 72);
    uint64_t v19 = v27;
    do
    {
      sub_252DBA940(v21, v0, (void (*)(void))type metadata accessor for DetectedEntityDetails);
      sub_252DBA940(v0, (uint64_t)v17, (void (*)(void))type metadata accessor for DetectedEntity);
      sub_252DBA9A0(v0, (void (*)(void))type metadata accessor for DetectedEntityDetails);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_252DBD788();
        sub_252DBA8EC();
        uint64_t v19 = v27;
      }
      unint64_t v23 = *(void *)(v19 + 16);
      if (v23 >= *(void *)(v19 + 24) >> 1)
      {
        sub_252DBA8EC();
        uint64_t v19 = v27;
      }
      *(void *)(v19 + 16) = v23 + 1;
      sub_252DBA9F8((uint64_t)v17, v19+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v23);
      v21 += v22;
      --v18;
    }
    while (v18);
    uint64_t v4 = v25;
    swift_bridgeObjectRelease();
    uint64_t v2 = v26;
  }
  memcpy(v6 + 3, v28, 0x92uLL);
  *uint64_t v6 = v19;
  v6[1] = v4;
  v6[2] = v2;
  sub_252D98084();
}

#error "252DB7A34: call analysis failed (funcsize=39)"

uint64_t static UIElement.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  CGFloat v2 = *(double *)(a1 + 32);
  CGFloat v3 = *(double *)(a1 + 40);
  CGFloat v4 = *(double *)(a1 + 48);
  CGFloat v5 = *(double *)(a1 + 56);
  uint64_t v84 = *(void *)(a1 + 64);
  uint64_t v86 = *(void *)(a1 + 72);
  uint64_t v87 = *(void *)(a1 + 80);
  uint64_t v88 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 112);
  uint64_t v89 = *(void *)(a1 + 96);
  uint64_t v90 = *(void *)(a1 + 104);
  int v7 = *(unsigned __int8 *)(a1 + 120);
  uint64_t v76 = *(void *)(a1 + 128);
  uint64_t v82 = *(void *)(a1 + 136);
  HIDWORD(v78) = *(unsigned __int8 *)(a1 + 144);
  HIDWORD(v72) = *(unsigned __int8 *)(a1 + 145);
  CGFloat v8 = *(double *)(a2 + 32);
  CGFloat v9 = *(double *)(a2 + 40);
  CGFloat v10 = *(double *)(a2 + 48);
  CGFloat v11 = *(double *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 72);
  uint64_t v15 = *(void *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 88);
  uint64_t v17 = *(void *)(a2 + 96);
  uint64_t v16 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  int v19 = *(unsigned __int8 *)(a2 + 120);
  uint64_t v74 = *(void *)(a2 + 128);
  uint64_t v80 = *(void *)(a2 + 136);
  LODWORD(v78) = *(unsigned __int8 *)(a2 + 144);
  LODWORD(v72) = *(unsigned __int8 *)(a2 + 145);
  uint64_t result = CGRectEqualToRect(*(CGRect *)a1, *(CGRect *)a2);
  if (result)
  {
    v109.origin.x = v2;
    v109.origin.y = v3;
    v109.size.width = v4;
    v109.size.height = v5;
    v110.origin.x = v8;
    v110.origin.y = v9;
    v110.size.width = v10;
    v110.size.height = v11;
    uint64_t result = CGRectEqualToRect(v109, v110);
    if (result)
    {
      char v21 = v7;
      if (v7 == 255)
      {
        if (v19 == 255)
        {
LABEL_8:
          if (!v82)
          {
            uint64_t result = 0;
            if (v80) {
              return result;
            }
LABEL_21:
            if ((HIDWORD(v78) ^ v78)) {
              return result;
            }
            return HIDWORD(v72) ^ v72 ^ 1;
          }
          if (v80)
          {
            if (v76 != v74 || v82 != v80)
            {
              char v38 = sub_252DC3360();
              uint64_t result = 0;
              if ((v38 & 1) == 0) {
                return result;
              }
              goto LABEL_21;
            }
            if (HIDWORD(v78) == v78) {
              return HIDWORD(v72) ^ v72 ^ 1;
            }
          }
          return 0;
        }
      }
      else
      {
        uint64_t v93 = v84;
        uint64_t v94 = v86;
        uint64_t v95 = v87;
        uint64_t v96 = v88;
        uint64_t v97 = v89;
        uint64_t v98 = v90;
        uint64_t v99 = v6;
        char v100 = v7;
        if (v19 != 255)
        {
          v91[0] = v13;
          v91[1] = v12;
          v91[2] = v15;
          v91[3] = v14;
          v91[4] = v17;
          v91[5] = v16;
          v91[6] = v18;
          char v92 = v19 & 1;
          sub_252D97CFC(v84, v86, v87, v88, v89, v90, v6, v7 & 1);
          uint64_t v22 = sub_252DBD6CC();
          sub_252D97CFC(v22, v23, v24, v25, v26, v27, v28, v7 & 1);
          char v29 = static ElementContent.== infix(_:_:)((uint64_t)&v93, v91);
          sub_252D97E2C(v93, v94, v95, v96, v97, v98, v99, v100);
          uint64_t v30 = sub_252DBD6CC();
          sub_252D97E14(v30, v31, v32, v33, v34, v35, v36, v7);
          if ((v29 & 1) == 0) {
            return 0;
          }
          goto LABEL_8;
        }
        LODWORD(v82) = v7 & 1;
        uint64_t v39 = sub_252D97CFC(v84, v86, v87, v88, v89, v90, v6, v7 & 1);
        uint64_t v47 = sub_252DBD7A0(v39, v40, v41, v42, v43, v44, v45, v46, v6, v72, v74, v76, v78, v80, v82, v84);
        uint64_t v55 = sub_252D97CFC(v47, v48, v49, v50, v51, v52, v53, v54);
        uint64_t v63 = sub_252DBD7A0(v55, v56, v57, v58, v59, v60, v61, v62, v71, v73, v75, v77, v79, v81, v83, v85);
        sub_252D97E2C(v63, v64, v65, v66, v67, v68, v69, v70);
        char v21 = v7;
      }
      uint64_t v93 = v84;
      uint64_t v94 = v86;
      uint64_t v95 = v87;
      uint64_t v96 = v88;
      uint64_t v97 = v89;
      uint64_t v98 = v90;
      uint64_t v99 = v6;
      char v100 = v21;
      uint64_t v101 = v13;
      uint64_t v102 = v12;
      uint64_t v103 = v15;
      uint64_t v104 = v14;
      uint64_t v105 = v17;
      uint64_t v106 = v16;
      uint64_t v107 = v18;
      char v108 = v19;
      sub_252D97CE4(v13, v12, v15, v14, v17, v16, v18, v19);
      sub_252DBAA54((uint64_t)&v93);
      return 0;
    }
  }
  return result;
}

uint64_t sub_252DB7DC8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000252DC4000 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x7365697469746E65 && a2 == 0xE800000000000000;
    if (v5 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x8000000252DC4020 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6E656D656C456975 && a2 == 0xE900000000000074)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v7 = sub_252DC3360();
      swift_bridgeObjectRelease();
      if (v7) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_252DB7F80(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7365697469746E65;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0x6E656D656C456975;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_252DB801C()
{
  return sub_252DB7F80(*v0);
}

uint64_t sub_252DB8024@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DB7DC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DB804C(uint64_t a1)
{
  unint64_t v2 = sub_252DBAAE8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DB8088(uint64_t a1)
{
  unint64_t v2 = sub_252DBAAE8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UIContextElement.encode(to:)()
{
  sub_252D8823C(&qword_269CA9E10);
  sub_252D89934();
  MEMORY[0x270FA5388](v2);
  sub_252D9E234();
  uint64_t v3 = *v0;
  uint64_t v7 = v0[2];
  uint64_t v8 = v0[1];
  sub_252DBD844();
  sub_252DBAAE8();
  sub_252D97F60();
  __dst[0] = v3;
  char v10 = 0;
  sub_252D8823C(&qword_269CA9E20);
  sub_252DBAB9C((uint64_t)&unk_269CA9E28);
  sub_252DBD6EC();
  if (!v1)
  {
    __dst[0] = v8;
    char v10 = 1;
    sub_252D8823C(&qword_269CA9E30);
    sub_252DBAC1C((uint64_t)&unk_269CA9E38);
    sub_252DBD6EC();
    __dst[0] = v7;
    char v10 = 2;
    sub_252D8823C(&qword_26B23BD30);
    sub_252DBAB34((uint64_t)&qword_269CA9118);
    sub_252DBD7C8();
    memcpy(__dst, v0 + 3, 0x92uLL);
    char v10 = 3;
    sub_252D88FE8();
    sub_252DC3340();
  }
  uint64_t v4 = sub_252D97F10();
  return v5(v4);
}

uint64_t UIContextElement.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_252D8823C(&qword_269CA9E48);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D88F0C(a1, a1[3]);
  sub_252DBAAE8();
  sub_252DC33D0();
  if (v2) {
    return sub_252D8931C((uint64_t)a1);
  }
  uint64_t v12 = a2;
  uint64_t v13 = (uint64_t)a1;
  sub_252D8823C(&qword_269CA9E20);
  sub_252DBAB9C((uint64_t)&unk_269CA9E50);
  sub_252DC32B0();
  uint64_t v6 = v15[0];
  sub_252D8823C(&qword_269CA9E30);
  sub_252DBAC1C((uint64_t)&unk_269CA9E58);
  swift_bridgeObjectRetain();
  sub_252DC32B0();
  uint64_t v7 = v15[0];
  sub_252D8823C(&qword_26B23BD30);
  LOBYTE(v14[0]) = 2;
  sub_252DBAB34((uint64_t)&qword_26B23BD50);
  swift_bridgeObjectRetain();
  sub_252DC32B0();
  __dst[175] = 3;
  sub_252D89424();
  uint64_t v11 = v15[0];
  swift_bridgeObjectRetain();
  sub_252DC32B0();
  uint64_t v8 = sub_252DBD5E0();
  v9(v8);
  memcpy(&v14[3], v17, 0x92uLL);
  memcpy(__dst, v17, 0x92uLL);
  v14[0] = v6;
  v14[1] = v7;
  v14[2] = v11;
  sub_252D97C34((uint64_t)v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v12, v14, 0xAAuLL);
  sub_252D8931C(v13);
  v15[0] = v6;
  v15[1] = v7;
  v15[2] = v11;
  memcpy(v16, __dst, sizeof(v16));
  return sub_252D97D64((uint64_t)v15);
}

uint64_t sub_252DB8728@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return UIContextElement.init(from:)(a1, a2);
}

uint64_t sub_252DB8740()
{
  return UIContextElement.encode(to:)();
}

double UIElement.frame.getter()
{
  return *(double *)v0;
}

void UIElement.frame.setter(double a1, double a2, double a3, double a4)
{
  *uint64_t v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
}

uint64_t (*UIElement.frame.modify())()
{
  return nullsub_1;
}

double UIElement.screenSize.getter()
{
  return *(double *)(v0 + 32);
}

void UIElement.screenSize.setter(double a1, double a2, double a3, double a4)
{
  v4[4] = a1;
  v4[5] = a2;
  v4[6] = a3;
  v4[7] = a4;
}

uint64_t (*UIElement.screenSize.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.content.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 72);
  uint64_t v4 = *(void *)(v1 + 80);
  uint64_t v5 = *(void *)(v1 + 88);
  uint64_t v6 = *(void *)(v1 + 96);
  uint64_t v7 = *(void *)(v1 + 104);
  uint64_t v8 = *(void *)(v1 + 112);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  unsigned __int8 v9 = *(unsigned char *)(v1 + 120);
  *(unsigned char *)(a1 + 56) = v9;
  return sub_252D97CE4(v2, v3, v4, v5, v6, v7, v8, v9);
}

__n128 UIElement.content.setter(long long *a1)
{
  long long v6 = a1[1];
  long long v7 = *a1;
  __n128 v5 = (__n128)a1[2];
  uint64_t v2 = *((void *)a1 + 6);
  char v3 = *((unsigned char *)a1 + 56);
  sub_252D97E14(*(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(unsigned char *)(v1 + 120));
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  __n128 result = v5;
  *(__n128 *)(v1 + 96) = v5;
  *(void *)(v1 + 112) = v2;
  *(unsigned char *)(v1 + 120) = v3;
  return result;
}

uint64_t (*UIElement.content.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.appBundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UIElement.appBundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*UIElement.appBundleId.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.isSelected.getter()
{
  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t UIElement.isSelected.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 144) = result;
  return result;
}

uint64_t (*UIElement.isSelected.modify())()
{
  return nullsub_1;
}

uint64_t UIElement.isPrimary.getter()
{
  return *(unsigned __int8 *)(v0 + 145);
}

uint64_t UIElement.isPrimary.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 145) = result;
  return result;
}

uint64_t (*UIElement.isPrimary.modify())()
{
  return nullsub_1;
}

void UIElement.init(frame:screenSize:content:appBundleId:isSelected:isPrimary:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>)
{
  sub_252DBD61C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  *(unsigned char *)(v13 + 144) = v12;
  *(unsigned char *)(v13 + 145) = v14;
}

void UIElement.init(frame:screenSize:content:appBundleId:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>)
{
  sub_252DBD61C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  *(_WORD *)(v12 + 144) = 0;
}

uint64_t sub_252DB89A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656D617266 && a2 == 0xE500000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x69536E6565726373 && a2 == 0xEA0000000000657ALL;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
        if (v8 || (sub_252DC3360() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x7463656C65537369 && a2 == 0xEA00000000006465;
          if (v9 || (sub_252DC3360() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x72616D6972507369 && a2 == 0xE900000000000079)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_252DC3360();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_252DB8C44(char a1)
{
  uint64_t result = 0x656D617266;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x69536E6565726373;
      break;
    case 2:
      uint64_t result = 0x746E65746E6F63;
      break;
    case 3:
      uint64_t result = 0x6C646E7542707061;
      break;
    case 4:
      uint64_t result = 0x7463656C65537369;
      break;
    case 5:
      uint64_t result = 0x72616D6972507369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252DB8D24()
{
  return sub_252DB8C44(*v0);
}

uint64_t sub_252DB8D2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DB89A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DB8D54(uint64_t a1)
{
  unint64_t v2 = sub_252DBAC9C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DB8D90(uint64_t a1)
{
  unint64_t v2 = sub_252DBAC9C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UIElement.encode(to:)(void *a1)
{
  uint64_t v4 = sub_252D8823C(&qword_269CA9E68);
  sub_252D89934();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_252D9E234();
  sub_252D88F0C(a1, a1[3]);
  sub_252DBAC9C();
  sub_252DC33E0();
  type metadata accessor for CGRect(0);
  sub_252DBAD34((uint64_t)&qword_269CA92C0);
  sub_252DBD718();
  if (!v1)
  {
    sub_252DBD718();
    sub_252DBACE8();
    sub_252DC3300();
    sub_252DC32E0();
    sub_252DC3320();
    sub_252DC3320();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t UIElement.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_252D8823C(&qword_269CA9E80);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D981B8();
  uint64_t v47 = a1;
  sub_252DBD844();
  sub_252DBAC9C();
  sub_252DC33D0();
  if (v2)
  {
    uint64_t v72 = v2;
    sub_252D8931C(a1);
    sub_252D97E14(0, 0, 0, 0, 0, 0, 0, 0xFFu);
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for CGRect(0);
    sub_252DBAD34((uint64_t)&qword_269CA92E0);
    sub_252DBD6AC();
    sub_252DC32B0();
    uint64_t v6 = v49;
    uint64_t v7 = v50;
    uint64_t v8 = v51;
    uint64_t v9 = v52;
    sub_252DBD6AC();
    sub_252DC32B0();
    uint64_t v10 = v49;
    uint64_t v11 = v50;
    uint64_t v12 = v51;
    uint64_t v13 = v52;
    sub_252DBAD78();
    sub_252DC3270();
    uint64_t v42 = a2;
    uint64_t v15 = v54;
    uint64_t v16 = v55;
    uint64_t v45 = v49;
    uint64_t v46 = v50;
    uint64_t v43 = v52;
    uint64_t v44 = v51;
    sub_252DBD768();
    sub_252D97CE4(v17, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v40 = sub_252DC3250();
    char v41 = v56;
    uint64_t v25 = v53;
    LOBYTE(v49) = 4;
    uint64_t v27 = v26;
    swift_bridgeObjectRetain();
    char v39 = sub_252DC3290();
    char v70 = 5;
    uint64_t v72 = 0;
    char v28 = sub_252DC3290();
    v39 &= 1u;
    uint64_t v29 = sub_252DBD654();
    v30(v29);
    v48[0] = v6;
    v48[1] = v50;
    v48[2] = v51;
    v48[3] = v52;
    v48[4] = v10;
    v48[5] = v50;
    v48[6] = v51;
    v48[7] = v52;
    v48[8] = v45;
    v48[9] = v50;
    v48[10] = v51;
    v48[11] = v52;
    v48[12] = v53;
    v48[13] = v54;
    v48[14] = v55;
    LOBYTE(v48[15]) = v56;
    v48[16] = v40;
    v48[17] = v27;
    LOBYTE(v48[18]) = v39;
    BYTE1(v48[18]) = v28 & 1;
    sub_252DB74AC((uint64_t)v48);
    swift_bridgeObjectRelease();
    sub_252DBD768();
    sub_252D97E14(v31, v32, v33, v34, v35, v36, v37, v38);
    memcpy(v42, v48, 0x92uLL);
    sub_252D8931C(v47);
    uint64_t v49 = v6;
    uint64_t v50 = v7;
    uint64_t v51 = v8;
    uint64_t v52 = v9;
    uint64_t v53 = v10;
    uint64_t v54 = v11;
    uint64_t v55 = v12;
    uint64_t v56 = v13;
    uint64_t v57 = v45;
    uint64_t v58 = v46;
    uint64_t v59 = v44;
    uint64_t v60 = v43;
    uint64_t v61 = v25;
    uint64_t v62 = v15;
    uint64_t v63 = v16;
    char v64 = v41;
    *(_DWORD *)uint64_t v65 = v71[0];
    *(_DWORD *)&v65[3] = *(_DWORD *)((char *)v71 + 3);
    uint64_t v66 = v40;
    uint64_t v67 = v27;
    char v68 = v39;
    char v69 = v28 & 1;
    return sub_252DB7540((uint64_t)&v49);
  }
}

uint64_t sub_252DB9518@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return UIElement.init(from:)(a1, a2);
}

uint64_t sub_252DB9530(void *a1)
{
  return UIElement.encode(to:)(a1);
}

double UIContextOptions.elementCollectionTimeout.getter()
{
  swift_beginAccess();
  return *(double *)(v0 + 24);
}

uint64_t UIContextOptions.elementCollectionTimeout.setter(double a1)
{
  uint64_t result = swift_beginAccess();
  *(double *)(v1 + 24) = a1;
  return result;
}

uint64_t (*UIContextOptions.elementCollectionTimeout.modify())()
{
  return j__swift_endAccess;
}

uint64_t UIContextOptions.__allocating_init(detectableTypes:)(uint64_t a1)
{
  sub_252DBD7B8();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = 0x3FD999999999999ALL;
  return result;
}

uint64_t UIContextOptions.init(detectableTypes:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = 0x3FD999999999999ALL;
  return v1;
}

uint64_t sub_252DB966C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6261746365746564 && a2 == 0xEF7365707954656CLL;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000252DC3FE0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252DB9780()
{
  return sub_252DC33C0();
}

uint64_t sub_252DB97C8(char a1)
{
  if (a1) {
    return 0xD000000000000018;
  }
  else {
    return 0x6261746365746564;
  }
}

uint64_t sub_252DB9810()
{
  return sub_252DB9780();
}

uint64_t sub_252DB9818()
{
  return sub_252DB97C8(*v0);
}

uint64_t sub_252DB9820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DB966C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DB9848(uint64_t a1)
{
  unint64_t v2 = sub_252DBADC4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DB9884(uint64_t a1)
{
  unint64_t v2 = sub_252DBADC4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UIContextOptions.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UIContextOptions.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_252DBD7B8();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t UIContextOptions.encode(to:)()
{
  sub_252D8823C(&qword_26B23BD60);
  sub_252D89934();
  MEMORY[0x270FA5388](v1);
  sub_252D9E234();
  sub_252DBD844();
  sub_252DBADC4();
  sub_252D97F60();
  sub_252D8823C(&qword_26B23C120);
  sub_252DBAB34((uint64_t)&unk_26B23BD58);
  sub_252DBD7C8();
  if (!v0)
  {
    swift_beginAccess();
    sub_252DC3330();
  }
  uint64_t v2 = sub_252D97F10();
  return v3(v2);
}

uint64_t UIContextOptions.__allocating_init(from:)(void *a1)
{
  sub_252DBD7B8();
  uint64_t v2 = swift_allocObject();
  UIContextOptions.init(from:)(a1);
  return v2;
}

uint64_t UIContextOptions.init(from:)(void *a1)
{
  sub_252D8823C(&qword_26B23C000);
  sub_252D89934();
  MEMORY[0x270FA5388](v4);
  sub_252D981A0();
  *(void *)(v1 + 24) = 0x3FD999999999999ALL;
  sub_252D88F0C(a1, a1[3]);
  sub_252DBADC4();
  sub_252DC33D0();
  if (v2)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_252D8823C(&qword_26B23C120);
    sub_252DBAB34((uint64_t)&unk_26B23BFF8);
    sub_252DC32B0();
    *(void *)(v1 + 16) = v10;
    sub_252DC32A0();
    uint64_t v7 = v6;
    uint64_t v8 = sub_252DBD66C();
    v9(v8);
    swift_beginAccess();
    *(void *)(v1 + 24) = v7;
  }
  sub_252D8931C((uint64_t)a1);
  return v1;
}

uint64_t sub_252DB9CE8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = UIContextOptions.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_252DB9D14()
{
  return UIContextOptions.encode(to:)();
}

void Array<A>.loggingDescription.getter()
{
  sub_252D9806C();
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for DetectedEntity(0);
  sub_252D97EE8();
  MEMORY[0x270FA5388](v5);
  sub_252D9E234();
  uint64_t v6 = type metadata accessor for DetectedEntityDetails(0);
  uint64_t v7 = sub_252D9E160(v6);
  MEMORY[0x270FA5388](v7);
  sub_252D981B8();
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  uint64_t v52 = v8;
  uint64_t v50 = v3;
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v51 = v3 + 32;
    memcpy(v56, (const void *)(v3 + 32), 0xAAuLL);
    uint64_t v10 = 1;
    uint64_t v11 = v56[1];
    uint64_t v54 = (uint64_t)v9;
    while (1)
    {
      uint64_t v53 = v10;
      int64_t v12 = *(void *)(v11 + 16);
      if (v12)
      {
        sub_252D97C34((uint64_t)v56);
        uint64_t v55 = v9;
        swift_bridgeObjectRetain();
        sub_252DBAEC8(0, v12, 0);
        sub_252DBD818();
        uint64_t v14 = v11 + v13;
        uint64_t v16 = *(void *)(v15 + 72);
        do
        {
          sub_252DBA940(v14, v1, (void (*)(void))type metadata accessor for DetectedEntityDetails);
          sub_252DBA940(v1, v0, (void (*)(void))type metadata accessor for DetectedEntity);
          char EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          sub_252DBA9A0(v0, (void (*)(void))type metadata accessor for DetectedEntity);
          sub_252DBA9A0(v1, (void (*)(void))type metadata accessor for DetectedEntityDetails);
          uint64_t v18 = v55;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_252DBAEC8(0, v55[2] + 1, 1);
            uint64_t v18 = v55;
          }
          unint64_t v20 = v18[2];
          unint64_t v19 = v18[3];
          if (v20 >= v19 >> 1)
          {
            sub_252DBAEC8((char *)(v19 > 1), v20 + 1, 1);
            uint64_t v18 = v55;
          }
          v18[2] = v20 + 1;
          *((unsigned char *)v18 + v20 + 32) = EnumCaseMultiPayload;
          v14 += v16;
          --v12;
        }
        while (v12);
        swift_bridgeObjectRelease();
        sub_252D97D64((uint64_t)v56);
        uint64_t v9 = (void *)MEMORY[0x263F8EE78];
      }
      else
      {
        uint64_t v18 = v9;
      }
      int64_t v21 = v18[2];
      uint64_t v22 = (char *)v54;
      int64_t v23 = *(void *)(v54 + 16);
      int64_t v24 = v23 + v21;
      if (__OFADD__(v23, v21)) {
        break;
      }
      int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v24 > *(void *)(v54 + 24) >> 1)
      {
        if (v23 <= v24) {
          int64_t v26 = v23 + v21;
        }
        else {
          int64_t v26 = v23;
        }
        uint64_t v22 = sub_252DABF48(isUniquelyReferenced_nonNull_native, v26, 1, v54);
      }
      uint64_t v8 = v52;
      if (v18[2])
      {
        uint64_t v27 = *((void *)v22 + 2);
        if ((*((void *)v22 + 3) >> 1) - v27 < v21) {
          goto LABEL_56;
        }
        char v28 = &v22[v27 + 32];
        if (v18 + 4 < (void *)&v28[v21] && v28 < (char *)v18 + v21 + 32) {
          goto LABEL_58;
        }
        memcpy(v28, v18 + 4, v21);
        if (v21)
        {
          uint64_t v30 = *((void *)v22 + 2);
          BOOL v31 = __OFADD__(v30, v21);
          uint64_t v32 = v30 + v21;
          if (v31) {
            goto LABEL_57;
          }
          *((void *)v22 + 2) = v32;
        }
      }
      else if (v21)
      {
        goto LABEL_51;
      }
      swift_bridgeObjectRelease();
      if (v53 == v52)
      {
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
      uint64_t v54 = (uint64_t)v22;
      memcpy(v56, (const void *)(v51 + 176 * v53), 0xAAuLL);
      uint64_t v11 = v56[1];
      uint64_t v10 = v53 + 1;
    }
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  uint64_t v22 = (char *)MEMORY[0x263F8EE78];
LABEL_34:
  int64_t v33 = *(void *)(sub_252DBA3CC((uint64_t)v22) + 16);
  if (!v33)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_45:
    v56[0] = v4;
    sub_252D8823C(&qword_26B23BFE8);
    sub_252DBC430();
    sub_252DC3050();
    swift_bridgeObjectRelease();
    uint64_t v47 = 0;
    if (!v8)
    {
LABEL_49:
      v56[0] = 0;
      v56[1] = 0xE000000000000000;
      sub_252DC31C0();
      swift_bridgeObjectRelease();
      v56[0] = 0x6465746365746564;
      v56[1] = 0xE900000000000020;
      uint64_t v55 = v47;
      sub_252DC3350();
      sub_252DC30B0();
      swift_bridgeObjectRelease();
      sub_252DC30B0();
      sub_252DC30B0();
      swift_bridgeObjectRelease();
      sub_252DC30B0();
      sub_252D98084();
      return;
    }
    uint64_t v48 = v50 + 40;
    while (1)
    {
      uint64_t v49 = *(void *)(*(void *)v48 + 16);
      BOOL v31 = __OFADD__(v47, v49);
      uint64_t v47 = (void *)((char *)v47 + v49);
      if (v31) {
        goto LABEL_52;
      }
      v48 += 176;
      if (!--v8) {
        goto LABEL_49;
      }
    }
  }
  uint64_t v55 = v9;
  sub_252DBAEA8(0, v33, 0);
  sub_252DBD830();
  int64_t v34 = sub_252DBC3A4((uint64_t)&v55);
  int v36 = v35;
  char v38 = v37 & 1;
  while ((v34 & 0x8000000000000000) == 0 && v34 < 1 << SLOBYTE(v56[3]))
  {
    if (((*(void *)((char *)&v56[6] + (((unint64_t)v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
      goto LABEL_54;
    }
    if (HIDWORD(v56[3]) != v36) {
      goto LABEL_55;
    }
    v56[0] = 0;
    v56[1] = 0xE000000000000000;
    sub_252DC31F0();
    uint64_t v39 = v56[0];
    uint64_t v40 = v56[1];
    uint64_t v55 = (void *)v4;
    unint64_t v42 = *(void *)(v4 + 16);
    unint64_t v41 = *(void *)(v4 + 24);
    if (v42 >= v41 >> 1)
    {
      sub_252DBAEA8((char *)(v41 > 1), v42 + 1, 1);
      sub_252DBD830();
    }
    *(void *)(v4 + 16) = v42 + 1;
    uint64_t v43 = v4 + 16 * v42;
    *(void *)(v43 + 32) = v39;
    *(void *)(v43 + 40) = v40;
    int64_t v44 = sub_252DBC2C0(v34, v36, v38 & 1, (uint64_t)&v55);
    int64_t v34 = v44;
    int v36 = v45;
    char v38 = v46 & 1;
    if (!--v33)
    {
      sub_252DBC424(v44, v45, v46 & 1);
      swift_bridgeObjectRelease();
      uint64_t v8 = v52;
      goto LABEL_45;
    }
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  sub_252DB3C70();
  sub_252DBD69C();
  sub_252DBD684();
  __break(1u);
}

uint64_t sub_252DBA3CC(uint64_t a1)
{
  sub_252DBD594();
  uint64_t v2 = sub_252DC3130();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = a1 + i;
      sub_252DBB220(&v8, *(unsigned __int8 *)(v5 + 32));
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

char *sub_252DBA468(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_252DB3C70();
    __src = (char *)sub_252DBD5F8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_252DBA4DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
}

void sub_252DBA4F4(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_252DB3C70();
    uint64_t v9 = sub_252DBD5F8();
    __break(1u);
_swift_arrayInitWithTakeBackToFront:
    MEMORY[0x270FA01D0](v9);
    return;
  }
  if (a3 < a1 || (a4(0), sub_252D97EE8(), a1 + *(void *)(v8 + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = sub_252DBD804();
    MEMORY[0x270FA01D8](v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = sub_252DBD804();
    goto _swift_arrayInitWithTakeBackToFront;
  }
}

char *sub_252DBA5F0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    sub_252DB3C70();
    __src = (char *)sub_252DBD5F8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_252DBA660(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_252DB3C70();
    sub_252DBD778();
LABEL_11:
    uint64_t result = sub_252DBD684();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    sub_252DB3C70();
    sub_252DBD69C();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

uint64_t sub_252DBA710(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_252DB3C70();
    sub_252DBD778();
LABEL_11:
    uint64_t result = sub_252DBD684();
    __break(1u);
    return result;
  }
  uint64_t v6 = sub_252DBD824();
  v7(v6);
  sub_252D97EE8();
  uint64_t v9 = *(void *)(v8 + 72) * a2;
  unint64_t v10 = a3 + v9;
  unint64_t v11 = a1 + v9;
  if (v10 > a1 && v11 > a3)
  {
    sub_252DB3C70();
    sub_252DBD69C();
    goto LABEL_11;
  }

  return swift_arrayInitWithCopy();
}

void *sub_252DBA7F0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0)
  {
    sub_252DB3C70();
    sub_252DBD778();
LABEL_11:
    uint64_t result = (void *)sub_252DBD684();
    __break(1u);
    return result;
  }
  if (&__dst[__n] > __src && &__src[__n] > __dst)
  {
    sub_252DB3C70();
    sub_252DBD69C();
    goto LABEL_11;
  }

  return memcpy(__dst, __src, __n);
}

void sub_252DBA898()
{
  sub_252DBAEE8();
  void *v0 = v1;
}

void sub_252DBA8EC()
{
  sub_252DBAEE8();
  void *v0 = v1;
}

uint64_t sub_252DBA940(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_252D97EE8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_252DBA9A0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_252D97EE8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_252DBA9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252DBD824();
  v5(v4);
  sub_252D97EE8();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a2, a1);
  return a2;
}

uint64_t sub_252DBAA54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 112);
  unsigned __int8 v9 = *(unsigned char *)(a1 + 120);
  sub_252D97E14(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  sub_252D97E14(v2, v3, v4, v5, v6, v7, v8, v9);
  return a1;
}

unint64_t sub_252DBAAE8()
{
  unint64_t result = qword_269CA9E18;
  if (!qword_269CA9E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9E18);
  }
  return result;
}

unint64_t sub_252DBAB34(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    sub_252D88324(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_252DBAB9C(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_252D88324(&qword_269CA9E20);
    sub_252DBAD34(v4);
    unint64_t result = sub_252D9B368();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_252DBAC1C(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_252D88324(&qword_269CA9E30);
    sub_252DBAD34(v4);
    unint64_t result = sub_252D9B368();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_252DBAC9C()
{
  unint64_t result = qword_269CA9E70;
  if (!qword_269CA9E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9E70);
  }
  return result;
}

unint64_t sub_252DBACE8()
{
  unint64_t result = qword_269CA9E78;
  if (!qword_269CA9E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9E78);
  }
  return result;
}

unint64_t sub_252DBAD34(uint64_t a1)
{
  unint64_t result = sub_252D9E270(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_252DBAD78()
{
  unint64_t result = qword_269CA9E88;
  if (!qword_269CA9E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9E88);
  }
  return result;
}

unint64_t sub_252DBADC4()
{
  unint64_t result = qword_26B23C020;
  if (!qword_26B23C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23C020);
  }
  return result;
}

unint64_t sub_252DBAE10()
{
  unint64_t result = qword_26B23BD48;
  if (!qword_26B23BD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23BD48);
  }
  return result;
}

unint64_t sub_252DBAE5C()
{
  unint64_t result = qword_26B23BF48;
  if (!qword_26B23BF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23BF48);
  }
  return result;
}

char *sub_252DBAEA8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_252DBB064(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *sub_252DBAEC8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_252DBB148(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_252DBAEE8()
{
  sub_252D9806C();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v1;
  char v9 = v8;
  if (v10)
  {
    unint64_t v11 = *(void *)(v1 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < v0)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= v0) {
        uint64_t v12 = v0;
      }
    }
  }
  else
  {
    uint64_t v12 = v0;
  }
  uint64_t v13 = *(void *)(v1 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(v1 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    int64_t v21 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_252D8823C(v2);
  uint64_t v15 = sub_252DBD824();
  uint64_t v16 = v6(v15);
  sub_252D9E160(v16);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  int64_t v21 = (void *)swift_allocObject();
  size_t v22 = j__malloc_size(v21);
  if (!v18)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v22 - v20 == 0x8000000000000000 && v18 == -1) {
    goto LABEL_24;
  }
  v21[2] = v13;
  v21[3] = 2 * ((uint64_t)(v22 - v20) / v18);
LABEL_19:
  uint64_t v24 = sub_252DBD824();
  v6(v24);
  sub_252DBD818();
  unint64_t v26 = (unint64_t)v21 + v25;
  unint64_t v27 = v7 + v25;
  if (v9)
  {
    sub_252DBA4F4(v27, v13, v26, v4);
    *(void *)(v7 + 16) = 0;
  }
  else
  {
    sub_252DBA710(v27, v13, v26);
  }
  swift_release();
  sub_252D98084();
}

char *sub_252DBB064(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_252D8823C(&qword_269CA9DA8);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_252DBA468(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_252DBA660((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_252DBB148(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_252D8823C(&qword_269CA9DA0);
    char v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_252DBA5F0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_252DBA7F0(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_252DBB220(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_252DC3380();
  swift_bridgeObjectRetain();
  sub_252DA04C8();
  uint64_t v5 = sub_252DC33C0();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v8 = ~v6;
    while (1)
    {
      unint64_t v9 = 0xE400000000000000;
      uint64_t v10 = 1702125924;
      switch(*(unsigned char *)(*(void *)(v4 + 48) + v7))
      {
        case 1:
          uint64_t v10 = 0x6D754E656E6F6870;
          unint64_t v9 = 0xEB00000000726562;
          break;
        case 2:
          uint64_t v10 = 1802398060;
          break;
        case 3:
          unint64_t v9 = 0xE700000000000000;
          uint64_t v10 = 0x73736572646461;
          break;
        case 4:
          unint64_t v9 = 0xE600000000000000;
          uint64_t v10 = 0x6E6F73726570;
          break;
        case 5:
          unint64_t v9 = 0xE500000000000000;
          uint64_t v10 = 0x6563616C70;
          break;
        case 6:
          uint64_t v10 = 0x617A696E6167726FLL;
          unint64_t v9 = 0xEC0000006E6F6974;
          break;
        case 7:
          unint64_t v9 = 0xE900000000000079;
          uint64_t v10 = 0x7469746E45707061;
          break;
        case 8:
          uint64_t v10 = 0x6E65746E49707061;
          unint64_t v9 = 0xE900000000000074;
          break;
        default:
          break;
      }
      unint64_t v11 = 0xE400000000000000;
      uint64_t v12 = 1702125924;
      switch((char)a2)
      {
        case 1:
          uint64_t v12 = 0x6D754E656E6F6870;
          unint64_t v11 = 0xEB00000000726562;
          break;
        case 2:
          uint64_t v12 = 1802398060;
          break;
        case 3:
          unint64_t v11 = 0xE700000000000000;
          uint64_t v12 = 0x73736572646461;
          break;
        case 4:
          unint64_t v11 = 0xE600000000000000;
          uint64_t v12 = 0x6E6F73726570;
          break;
        case 5:
          unint64_t v11 = 0xE500000000000000;
          uint64_t v12 = 0x6563616C70;
          break;
        case 6:
          uint64_t v12 = 0x617A696E6167726FLL;
          unint64_t v11 = 0xEC0000006E6F6974;
          break;
        case 7:
          unint64_t v11 = 0xE900000000000079;
          uint64_t v12 = 0x7469746E45707061;
          break;
        case 8:
          uint64_t v12 = 0x6E65746E49707061;
          unint64_t v11 = 0xE900000000000074;
          break;
        default:
          break;
      }
      if (v10 == v12 && v9 == v11) {
        break;
      }
      char v14 = sub_252DC3360();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v14) {
        goto LABEL_29;
      }
      unint64_t v7 = (v7 + 1) & v8;
      if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_29:
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    LOBYTE(a2) = *(unsigned char *)(*(void *)(*v2 + 48) + v7);
  }
  else
  {
LABEL_27:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_252DBB9AC(a2, v7, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v18;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
  }
  *a1 = a2;
  return result;
}

uint64_t sub_252DBB5D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_252D8823C(&qword_269CA9EC8);
  uint64_t v3 = sub_252DC31A0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    swift_retain();
    int64_t v11 = 0;
    if (!v8) {
      goto LABEL_7;
    }
    while (2)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
LABEL_21:
      char v17 = *(unsigned char *)(*(void *)(v2 + 48) + v13);
      sub_252DC3380();
      sub_252DC30A0();
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_252DC33C0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_30;
      }
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(unsigned char *)(*(void *)(v4 + 48) + v22) = v17;
      ++*(void *)(v4 + 16);
      if (v8) {
        continue;
      }
      break;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_38;
    }
    if (v14 < v9)
    {
      unint64_t v15 = v6[v14];
      ++v11;
      if (v15) {
        goto LABEL_20;
      }
      int64_t v11 = v14 + 1;
      if (v14 + 1 < v9)
      {
        unint64_t v15 = v6[v11];
        if (v15) {
          goto LABEL_20;
        }
        int64_t v11 = v14 + 2;
        if (v14 + 2 < v9)
        {
          unint64_t v15 = v6[v11];
          if (v15) {
            goto LABEL_20;
          }
          int64_t v16 = v14 + 3;
          if (v16 < v9)
          {
            unint64_t v15 = v6[v16];
            if (v15)
            {
              int64_t v11 = v16;
LABEL_20:
              unint64_t v8 = (v15 - 1) & v15;
              unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
              goto LABEL_21;
            }
            while (1)
            {
              int64_t v11 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                break;
              }
              if (v11 >= v9) {
                goto LABEL_32;
              }
              unint64_t v15 = v6[v11];
              ++v16;
              if (v15) {
                goto LABEL_20;
              }
            }
LABEL_39:
            __break(1u);
            JUMPOUT(0x252DBB988);
          }
        }
      }
    }
LABEL_32:
    swift_release();
    uint64_t v1 = v0;
    uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
    if (v27 > 63) {
      sub_252DBBD68(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
    }
    else {
      *uint64_t v6 = -1 << v27;
    }
    *(void *)(v2 + 16) = 0;
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_252DBB9AC(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_252DBB5D4();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_252DBBD84();
        goto LABEL_34;
      }
      sub_252DBBF1C();
    }
    uint64_t v8 = *v3;
    sub_252DC3380();
    sub_252DA04C8();
    uint64_t result = sub_252DC33C0();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      while (1)
      {
        unint64_t v11 = 0xE400000000000000;
        uint64_t v12 = 1702125924;
        switch(*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          case 1:
            uint64_t v12 = 0x6D754E656E6F6870;
            unint64_t v11 = 0xEB00000000726562;
            break;
          case 2:
            uint64_t v12 = 1802398060;
            break;
          case 3:
            unint64_t v11 = 0xE700000000000000;
            uint64_t v12 = 0x73736572646461;
            break;
          case 4:
            unint64_t v11 = 0xE600000000000000;
            uint64_t v12 = 0x6E6F73726570;
            break;
          case 5:
            unint64_t v11 = 0xE500000000000000;
            uint64_t v12 = 0x6563616C70;
            break;
          case 6:
            uint64_t v12 = 0x617A696E6167726FLL;
            unint64_t v11 = 0xEC0000006E6F6974;
            break;
          case 7:
            unint64_t v11 = 0xE900000000000079;
            uint64_t v12 = 0x7469746E45707061;
            break;
          case 8:
            uint64_t v12 = 0x6E65746E49707061;
            unint64_t v11 = 0xE900000000000074;
            break;
          default:
            break;
        }
        unint64_t v13 = 0xE400000000000000;
        uint64_t v14 = 1702125924;
        switch(v5)
        {
          case 1:
            uint64_t v14 = 0x6D754E656E6F6870;
            unint64_t v13 = 0xEB00000000726562;
            break;
          case 2:
            uint64_t v14 = 1802398060;
            break;
          case 3:
            unint64_t v13 = 0xE700000000000000;
            uint64_t v14 = 0x73736572646461;
            break;
          case 4:
            unint64_t v13 = 0xE600000000000000;
            uint64_t v14 = 0x6E6F73726570;
            break;
          case 5:
            unint64_t v13 = 0xE500000000000000;
            uint64_t v14 = 0x6563616C70;
            break;
          case 6:
            uint64_t v14 = 0x617A696E6167726FLL;
            unint64_t v13 = 0xEC0000006E6F6974;
            break;
          case 7:
            unint64_t v13 = 0xE900000000000079;
            uint64_t v14 = 0x7469746E45707061;
            break;
          case 8:
            uint64_t v14 = 0x6E65746E49707061;
            unint64_t v13 = 0xE900000000000074;
            break;
          default:
            break;
        }
        if (v12 == v14 && v11 == v13) {
          break;
        }
        char v16 = sub_252DC3360();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_38;
        }
        a2 = (a2 + 1) & v10;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_34;
        }
      }
LABEL_37:
      swift_bridgeObjectRelease_n();
LABEL_38:
      sub_252DC3370();
      __break(1u);
      JUMPOUT(0x252DBBD20);
    }
  }
LABEL_34:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v17 + 48) + a2) = v5;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
    __break(1u);
    goto LABEL_37;
  }
  *(void *)(v17 + 16) = v20;
  return result;
}

uint64_t sub_252DBBD68(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *sub_252DBBD84()
{
  uint64_t v1 = v0;
  sub_252D8823C(&qword_269CA9EC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252DC3190();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(unsigned char *)(*(void *)(v4 + 48) + i) = *(unsigned char *)(*(void *)(v2 + 48) + i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_252DBBF1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_252D8823C(&qword_269CA9EC8);
  uint64_t v3 = sub_252DC31A0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = v2 + 56;
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    swift_retain();
    int64_t v11 = 0;
    if (!v8) {
      goto LABEL_7;
    }
    while (2)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
LABEL_21:
      char v17 = *(unsigned char *)(*(void *)(v2 + 48) + v13);
      sub_252DC3380();
      sub_252DC30A0();
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_252DC33C0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_30;
      }
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(unsigned char *)(*(void *)(v4 + 48) + v22) = v17;
      ++*(void *)(v4 + 16);
      if (v8) {
        continue;
      }
      break;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 < v9)
    {
      unint64_t v15 = *(void *)(v6 + 8 * v14);
      ++v11;
      if (v15) {
        goto LABEL_20;
      }
      int64_t v11 = v14 + 1;
      if (v14 + 1 < v9)
      {
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (v15) {
          goto LABEL_20;
        }
        int64_t v11 = v14 + 2;
        if (v14 + 2 < v9)
        {
          unint64_t v15 = *(void *)(v6 + 8 * v11);
          if (v15) {
            goto LABEL_20;
          }
          int64_t v16 = v14 + 3;
          if (v16 < v9)
          {
            unint64_t v15 = *(void *)(v6 + 8 * v16);
            if (v15)
            {
              int64_t v11 = v16;
LABEL_20:
              unint64_t v8 = (v15 - 1) & v15;
              unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
              goto LABEL_21;
            }
            while (1)
            {
              int64_t v11 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                break;
              }
              if (v11 >= v9) {
                goto LABEL_32;
              }
              unint64_t v15 = *(void *)(v6 + 8 * v11);
              ++v16;
              if (v15) {
                goto LABEL_20;
              }
            }
LABEL_37:
            __break(1u);
            JUMPOUT(0x252DBC29CLL);
          }
        }
      }
    }
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
  }
  else
  {
    uint64_t result = swift_release();
  }
  *uint64_t v1 = v4;
  return result;
}

int64_t sub_252DBC2C0(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_252DBC3A4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_252DBC424(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_252DBC430()
{
  unint64_t result = qword_26B23BFF0;
  if (!qword_26B23BFF0)
  {
    sub_252D88324(&qword_26B23BFE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23BFF0);
  }
  return result;
}

uint64_t destroy for UIContextElement(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v2 = *(unsigned __int8 *)(a1 + 144);
  if (v2 != 255) {
    sub_252D97E2C(*(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), v2 & 1);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UIContextElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  int v5 = *(unsigned __int8 *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    long long v6 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = v6;
    *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
  }
  else
  {
    char v7 = v5 & 1;
    uint64_t v8 = *(void *)(a2 + 88);
    uint64_t v9 = *(void *)(a2 + 96);
    uint64_t v10 = *(void *)(a2 + 104);
    uint64_t v11 = *(void *)(a2 + 112);
    uint64_t v12 = *(void *)(a2 + 120);
    uint64_t v13 = *(void *)(a2 + 128);
    uint64_t v14 = *(void *)(a2 + 136);
    sub_252D97CFC(v8, v9, v10, v11, v12, v13, v14, v7);
    *(void *)(a1 + 88) = v8;
    *(void *)(a1 + 96) = v9;
    *(void *)(a1 + 104) = v10;
    *(void *)(a1 + 112) = v11;
    *(void *)(a1 + 120) = v12;
    *(void *)(a1 + 128) = v13;
    *(void *)(a1 + 136) = v14;
    *(unsigned char *)(a1 + 144) = v7;
  }
  uint64_t v15 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v15;
  *(_WORD *)(a1 + 168) = *(_WORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UIContextElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v4 = (_OWORD *)(a1 + 88);
  int v5 = (long long *)(a2 + 88);
  int v6 = *(unsigned __int8 *)(a2 + 144);
  if (*(unsigned __int8 *)(a1 + 144) == 255)
  {
    if (v6 == 255)
    {
      long long v10 = *v5;
      long long v11 = *(_OWORD *)(a2 + 104);
      long long v12 = *(_OWORD *)(a2 + 120);
      *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
      *(_OWORD *)(a1 + 104) = v11;
      *(_OWORD *)(a1 + 120) = v12;
      *uint64_t v4 = v10;
    }
    else
    {
      char v29 = v6 & 1;
      uint64_t v30 = *(void *)(a2 + 88);
      uint64_t v31 = *(void *)(a2 + 96);
      uint64_t v32 = *(void *)(a2 + 104);
      uint64_t v33 = *(void *)(a2 + 112);
      uint64_t v34 = *(void *)(a2 + 120);
      uint64_t v35 = *(void *)(a2 + 128);
      uint64_t v36 = *(void *)(a2 + 136);
      sub_252D97CFC(v30, v31, v32, v33, v34, v35, v36, v6 & 1);
      *(void *)(a1 + 88) = v30;
      *(void *)(a1 + 96) = v31;
      *(void *)(a1 + 104) = v32;
      *(void *)(a1 + 112) = v33;
      *(void *)(a1 + 120) = v34;
      *(void *)(a1 + 128) = v35;
      *(void *)(a1 + 136) = v36;
      *(unsigned char *)(a1 + 144) = v29;
    }
  }
  else if (v6 == 255)
  {
    sub_252DBC82C(a1 + 88);
    long long v8 = *(_OWORD *)(a2 + 104);
    long long v7 = *(_OWORD *)(a2 + 120);
    long long v9 = *v5;
    *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
    *(_OWORD *)(a1 + 104) = v8;
    *(_OWORD *)(a1 + 120) = v7;
    *uint64_t v4 = v9;
  }
  else
  {
    char v13 = v6 & 1;
    uint64_t v14 = *(void *)(a2 + 88);
    uint64_t v15 = *(void *)(a2 + 96);
    uint64_t v16 = *(void *)(a2 + 104);
    uint64_t v17 = *(void *)(a2 + 112);
    uint64_t v18 = *(void *)(a2 + 120);
    uint64_t v19 = *(void *)(a2 + 128);
    uint64_t v20 = *(void *)(a2 + 136);
    sub_252D97CFC(v14, v15, v16, v17, v18, v19, v20, v6 & 1);
    uint64_t v21 = *(void *)(a1 + 88);
    uint64_t v22 = *(void *)(a1 + 96);
    uint64_t v23 = *(void *)(a1 + 104);
    uint64_t v24 = *(void *)(a1 + 112);
    uint64_t v25 = *(void *)(a1 + 120);
    uint64_t v26 = *(void *)(a1 + 128);
    uint64_t v27 = *(void *)(a1 + 136);
    char v28 = *(unsigned char *)(a1 + 144);
    *(void *)(a1 + 88) = v14;
    *(void *)(a1 + 96) = v15;
    *(void *)(a1 + 104) = v16;
    *(void *)(a1 + 112) = v17;
    *(void *)(a1 + 120) = v18;
    *(void *)(a1 + 128) = v19;
    *(void *)(a1 + 136) = v20;
    *(unsigned char *)(a1 + 144) = v13;
    sub_252D97E2C(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(unsigned char *)(a1 + 169) = *(unsigned char *)(a2 + 169);
  return a1;
}

uint64_t sub_252DBC82C(uint64_t a1)
{
  return a1;
}

void *initializeWithTake for UIContextElement(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xAAuLL);
}

uint64_t assignWithTake for UIContextElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  int v4 = *(unsigned __int8 *)(a1 + 144);
  if (v4 != 255)
  {
    int v5 = *(unsigned __int8 *)(a2 + 144);
    if (v5 != 255)
    {
      char v7 = v4 & 1;
      uint64_t v8 = *(void *)(a2 + 136);
      uint64_t v9 = *(void *)(a1 + 88);
      uint64_t v10 = *(void *)(a1 + 96);
      uint64_t v11 = *(void *)(a1 + 104);
      uint64_t v12 = *(void *)(a1 + 112);
      uint64_t v13 = *(void *)(a1 + 120);
      uint64_t v14 = *(void *)(a1 + 128);
      uint64_t v15 = *(void *)(a1 + 136);
      *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
      *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
      *(void *)(a1 + 136) = v8;
      *(unsigned char *)(a1 + 144) = v5 & 1;
      sub_252D97E2C(v9, v10, v11, v12, v13, v14, v15, v7);
      goto LABEL_6;
    }
    sub_252DBC82C(a1 + 88);
  }
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = v6;
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 129) = *(_OWORD *)(a2 + 129);
LABEL_6:
  uint64_t v16 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v16;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(unsigned char *)(a1 + 169) = *(unsigned char *)(a2 + 169);
  return a1;
}

uint64_t getEnumTagSinglePayload for UIContextElement(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 170))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t storeEnumTagSinglePayload for UIContextElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 168) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 170) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 170) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIContextElement()
{
  return &type metadata for UIContextElement;
}

uint64_t destroy for UIElement(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 120);
  if (v1 != 255) {
    sub_252D97E2C(*(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), v1 & 1);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UIElement(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  int v6 = *(unsigned __int8 *)(a2 + 120);
  if (v6 == 255)
  {
    long long v7 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v7;
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 105) = *(_OWORD *)(a2 + 105);
  }
  else
  {
    char v8 = v6 & 1;
    uint64_t v9 = *(void *)(a2 + 64);
    uint64_t v10 = *(void *)(a2 + 72);
    uint64_t v11 = *(void *)(a2 + 80);
    uint64_t v12 = *(void *)(a2 + 88);
    uint64_t v13 = *(void *)(a2 + 96);
    uint64_t v14 = *(void *)(a2 + 104);
    uint64_t v15 = *(void *)(a2 + 112);
    sub_252D97CFC(v9, v10, v11, v12, v13, v14, v15, v6 & 1);
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 72) = v10;
    *(void *)(a1 + 80) = v11;
    *(void *)(a1 + 88) = v12;
    *(void *)(a1 + 96) = v13;
    *(void *)(a1 + 104) = v14;
    *(void *)(a1 + 112) = v15;
    *(unsigned char *)(a1 + 120) = v8;
  }
  uint64_t v16 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v16;
  *(_WORD *)(a1 + 144) = *(_WORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UIElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  long long v4 = (_OWORD *)(a1 + 64);
  long long v5 = (long long *)(a2 + 64);
  int v6 = *(unsigned __int8 *)(a2 + 120);
  if (*(unsigned __int8 *)(a1 + 120) == 255)
  {
    if (v6 == 255)
    {
      long long v10 = *v5;
      long long v11 = *(_OWORD *)(a2 + 80);
      long long v12 = *(_OWORD *)(a2 + 96);
      *(_OWORD *)(a1 + 105) = *(_OWORD *)(a2 + 105);
      *(_OWORD *)(a1 + 80) = v11;
      *(_OWORD *)(a1 + 96) = v12;
      *long long v4 = v10;
    }
    else
    {
      char v29 = v6 & 1;
      uint64_t v30 = *(void *)(a2 + 64);
      uint64_t v31 = *(void *)(a2 + 72);
      uint64_t v32 = *(void *)(a2 + 80);
      uint64_t v33 = *(void *)(a2 + 88);
      uint64_t v34 = *(void *)(a2 + 96);
      uint64_t v35 = *(void *)(a2 + 104);
      uint64_t v36 = *(void *)(a2 + 112);
      sub_252D97CFC(v30, v31, v32, v33, v34, v35, v36, v6 & 1);
      *(void *)(a1 + 64) = v30;
      *(void *)(a1 + 72) = v31;
      *(void *)(a1 + 80) = v32;
      *(void *)(a1 + 88) = v33;
      *(void *)(a1 + 96) = v34;
      *(void *)(a1 + 104) = v35;
      *(void *)(a1 + 112) = v36;
      *(unsigned char *)(a1 + 120) = v29;
    }
  }
  else if (v6 == 255)
  {
    sub_252DBC82C(a1 + 64);
    long long v8 = v5[1];
    long long v7 = v5[2];
    long long v9 = *v5;
    *(_OWORD *)((char *)v4 + 41) = *(long long *)((char *)v5 + 41);
    v4[1] = v8;
    v4[2] = v7;
    *long long v4 = v9;
  }
  else
  {
    char v13 = v6 & 1;
    uint64_t v14 = *(void *)(a2 + 64);
    uint64_t v15 = *(void *)(a2 + 72);
    uint64_t v16 = *(void *)(a2 + 80);
    uint64_t v17 = *(void *)(a2 + 88);
    uint64_t v18 = *(void *)(a2 + 96);
    uint64_t v19 = *(void *)(a2 + 104);
    uint64_t v20 = *(void *)(a2 + 112);
    sub_252D97CFC(v14, v15, v16, v17, v18, v19, v20, v6 & 1);
    uint64_t v21 = *(void *)(a1 + 64);
    uint64_t v22 = *(void *)(a1 + 72);
    uint64_t v23 = *(void *)(a1 + 80);
    uint64_t v24 = *(void *)(a1 + 88);
    uint64_t v25 = *(void *)(a1 + 96);
    uint64_t v26 = *(void *)(a1 + 104);
    uint64_t v27 = *(void *)(a1 + 112);
    char v28 = *(unsigned char *)(a1 + 120);
    *(void *)(a1 + 64) = v14;
    *(void *)(a1 + 72) = v15;
    *(void *)(a1 + 80) = v16;
    *(void *)(a1 + 88) = v17;
    *(void *)(a1 + 96) = v18;
    *(void *)(a1 + 104) = v19;
    *(void *)(a1 + 112) = v20;
    *(unsigned char *)(a1 + 120) = v13;
    sub_252D97E2C(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(unsigned char *)(a1 + 145) = *(unsigned char *)(a2 + 145);
  return a1;
}

void *initializeWithTake for UIElement(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x92uLL);
}

uint64_t assignWithTake for UIElement(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  int v6 = (_OWORD *)(a1 + 64);
  long long v7 = (_OWORD *)(a2 + 64);
  int v8 = *(unsigned __int8 *)(a1 + 120);
  if (v8 != 255)
  {
    int v9 = *(unsigned __int8 *)(a2 + 120);
    if (v9 != 255)
    {
      char v11 = v8 & 1;
      uint64_t v12 = *(void *)(a2 + 112);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v14 = *(void *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 80);
      uint64_t v16 = *(void *)(a1 + 88);
      uint64_t v17 = *(void *)(a1 + 96);
      uint64_t v18 = *(void *)(a1 + 104);
      uint64_t v19 = *(void *)(a1 + 112);
      long long v20 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 80) = v20;
      *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
      *(void *)(a1 + 112) = v12;
      *(unsigned char *)(a1 + 120) = v9 & 1;
      sub_252D97E2C(v13, v14, v15, v16, v17, v18, v19, v11);
      goto LABEL_6;
    }
    sub_252DBC82C(a1 + 64);
  }
  long long v10 = v7[1];
  *int v6 = *v7;
  v6[1] = v10;
  v6[2] = v7[2];
  *(_OWORD *)((char *)v6 + 41) = *(_OWORD *)((char *)v7 + 41);
LABEL_6:
  uint64_t v21 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v21;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(unsigned char *)(a1 + 145) = *(unsigned char *)(a2 + 145);
  return a1;
}

uint64_t getEnumTagSinglePayload for UIElement(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 146))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 136);
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

uint64_t storeEnumTagSinglePayload for UIElement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 144) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 146) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 146) = 0;
    }
    if (a2) {
      *(void *)(result + 136) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIElement()
{
  return &type metadata for UIElement;
}

uint64_t type metadata accessor for UIContextOptions()
{
  return self;
}

uint64_t method lookup function for UIContextOptions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UIContextOptions);
}

uint64_t dispatch thunk of UIContextOptions.__allocating_init(detectableTypes:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of UIContextOptions.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unsigned char *storeEnumTagSinglePayload for UIContextOptions.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252DBD084);
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

ValueMetadata *type metadata accessor for UIContextOptions.CodingKeys()
{
  return &type metadata for UIContextOptions.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for UIElement.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252DBD188);
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

ValueMetadata *type metadata accessor for UIElement.CodingKeys()
{
  return &type metadata for UIElement.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for UIContextElement.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252DBD28CLL);
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

ValueMetadata *type metadata accessor for UIContextElement.CodingKeys()
{
  return &type metadata for UIContextElement.CodingKeys;
}

unint64_t sub_252DBD2C8()
{
  unint64_t result = qword_269CA9E90;
  if (!qword_269CA9E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9E90);
  }
  return result;
}

unint64_t sub_252DBD318()
{
  unint64_t result = qword_269CA9E98;
  if (!qword_269CA9E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9E98);
  }
  return result;
}

unint64_t sub_252DBD368()
{
  unint64_t result = qword_269CA9EA0;
  if (!qword_269CA9EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9EA0);
  }
  return result;
}

unint64_t sub_252DBD3B8()
{
  unint64_t result = qword_26B23C030;
  if (!qword_26B23C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23C030);
  }
  return result;
}

unint64_t sub_252DBD408()
{
  unint64_t result = qword_26B23C028;
  if (!qword_26B23C028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23C028);
  }
  return result;
}

unint64_t sub_252DBD458()
{
  unint64_t result = qword_269CA9EA8;
  if (!qword_269CA9EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9EA8);
  }
  return result;
}

unint64_t sub_252DBD4A8()
{
  unint64_t result = qword_269CA9EB0;
  if (!qword_269CA9EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9EB0);
  }
  return result;
}

unint64_t sub_252DBD4F8()
{
  unint64_t result = qword_269CA9EB8;
  if (!qword_269CA9EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9EB8);
  }
  return result;
}

unint64_t sub_252DBD548()
{
  unint64_t result = qword_269CA9EC0;
  if (!qword_269CA9EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9EC0);
  }
  return result;
}

unint64_t sub_252DBD594()
{
  unint64_t result = qword_26B23BF40;
  if (!qword_26B23BF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B23BF40);
  }
  return result;
}

uint64_t sub_252DBD5E0()
{
  return v0;
}

uint64_t sub_252DBD5F8()
{
  return sub_252DC3210();
}

__n128 sub_252DBD61C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>, double a11@<D6>, double a12@<D7>)
{
  uint64_t v12 = *(void *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 56);
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  *(double *)(a4 + 16) = a7;
  *(double *)(a4 + 24) = a8;
  *(double *)(a4 + 32) = a9;
  *(double *)(a4 + 40) = a10;
  *(double *)(a4 + 48) = a11;
  *(double *)(a4 + 56) = a12;
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 80) = v14;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a4 + 96) = result;
  *(void *)(a4 + 112) = v12;
  *(unsigned char *)(a4 + 120) = v13;
  *(void *)(a4 + 128) = a2;
  *(void *)(a4 + 136) = a3;
  return result;
}

uint64_t sub_252DBD654()
{
  return v0;
}

uint64_t sub_252DBD66C()
{
  return v0;
}

uint64_t sub_252DBD684()
{
  return sub_252DC3210();
}

uint64_t sub_252DBD6AC()
{
  return v0;
}

uint64_t sub_252DBD6CC()
{
  return v0;
}

uint64_t sub_252DBD6EC()
{
  return sub_252DC3340();
}

uint64_t sub_252DBD718()
{
  return sub_252DC3340();
}

uint64_t sub_252DBD744()
{
  return *(void *)(v0 + 64);
}

uint64_t _s23IntelligenceFlowContext16UIContextElementV19surroundingElementsSayACGvg_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_252DBD788()
{
  return 0;
}

uint64_t sub_252DBD7A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return a16;
}

uint64_t sub_252DBD7B8()
{
  return v0;
}

uint64_t sub_252DBD7C8()
{
  return sub_252DC3340();
}

void *sub_252DBD7EC(void *a1)
{
  return memcpy(a1, v1, 0x92uLL);
}

uint64_t sub_252DBD804()
{
  return v0;
}

uint64_t sub_252DBD824()
{
  return 0;
}

void *sub_252DBD844()
{
  return sub_252D88F0C(v0, v1);
}

uint64_t ElementContent.Text.text.getter()
{
  return sub_252DB35A0();
}

IntelligenceFlowContext::ElementContent::Text __swiftcall ElementContent.Text.init(text:)(IntelligenceFlowContext::ElementContent::Text text)
{
  *uint64_t v1 = text;
  return text;
}

uint64_t static ElementContent.Text.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      BOOL v5 = *a1 == *a2 && v3 == v4;
      if (v5 || (sub_252DC3360() & 1) != 0) {
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

uint64_t sub_252DBD8F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_252DC3360();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_252DBD968()
{
  return 1954047348;
}

uint64_t sub_252DBD97C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DBD8F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_252DBD9A8(uint64_t a1)
{
  unint64_t v2 = sub_252DBDB10();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DBD9E4(uint64_t a1)
{
  unint64_t v2 = sub_252DBDB10();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ElementContent.Text.encode(to:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  uint64_t v3 = sub_252D8823C(&qword_269CA9EE0);
  sub_252D89934();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_252D981B8();
  sub_252D88F0C(v2, v2[3]);
  sub_252DBDB10();
  sub_252DC33E0();
  sub_252DC32E0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  sub_252D97FF8();
}

unint64_t sub_252DBDB10()
{
  unint64_t result = qword_269CA9EE8;
  if (!qword_269CA9EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9EE8);
  }
  return result;
}

void ElementContent.Text.init(from:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_252D8823C(&qword_269CA9EF0);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D981B8();
  sub_252D88F0C(v2, v2[3]);
  sub_252DBDB10();
  sub_252DC33D0();
  if (!v0)
  {
    uint64_t v6 = sub_252DC3250();
    uint64_t v8 = v7;
    uint64_t v9 = sub_252DC06B8();
    v10(v9);
    *uint64_t v4 = v6;
    v4[1] = v8;
  }
  sub_252D8931C((uint64_t)v2);
  sub_252D97FF8();
}

void sub_252DBDC64()
{
}

void sub_252DBDC7C()
{
}

uint64_t ElementContent.Command.title.getter()
{
  return sub_252DB35A0();
}

uint64_t ElementContent.Command.standaloneTitle.getter()
{
  return sub_252DB35A0();
}

uint64_t ElementContent.Command.identifier.getter()
{
  return sub_252DB35A0();
}

uint64_t ElementContent.Command.menuHierarchyComponents.getter()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall ElementContent.Command.init(title:standaloneTitle:identifier:menuHierarchyComponents:)(IntelligenceFlowContext::ElementContent::Command *__return_ptr retstr, Swift::String_optional title, Swift::String_optional standaloneTitle, Swift::String_optional identifier, Swift::OpaquePointer menuHierarchyComponents)
{
  retstr->title = title;
  retstr->standaloneTitle = standaloneTitle;
  retstr->identifier = identifier;
  retstr->menuHierarchyComponents = menuHierarchyComponents;
}

uint64_t static ElementContent.Command.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v11 = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v12 = a2[5];
  if (v3)
  {
    if (!v8) {
      return 0;
    }
    BOOL v13 = *a1 == *a2 && v3 == v8;
    if (!v13 && (sub_252DC3360() & 1) == 0) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  if (v6)
  {
    if (!v11) {
      return 0;
    }
    BOOL v14 = v4 == v9 && v6 == v11;
    if (!v14 && (sub_252DC3360() & 1) == 0) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  if (v7)
  {
    if (v12)
    {
      BOOL v15 = v5 == v10 && v7 == v12;
      if (v15 || (sub_252DC3360() & 1) != 0) {
        goto LABEL_26;
      }
    }
    return 0;
  }
  if (v12) {
    return 0;
  }
LABEL_26:
  uint64_t v16 = (void *)sub_252DB35A0();

  return sub_252D8E9C8(v16, v17);
}

uint64_t sub_252DBDE60(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6F6C61646E617473 && a2 == 0xEF656C746954656ELL;
    if (v6 || (sub_252DC3360() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
      if (v7 || (sub_252DC3360() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000017 && a2 == 0x8000000252DC4080)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v8 = sub_252DC3360();
        swift_bridgeObjectRelease();
        if (v8) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

unint64_t sub_252DBE038(char a1)
{
  unint64_t result = 0x656C746974;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6F6C61646E617473;
      break;
    case 2:
      unint64_t result = 0x696669746E656469;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_252DBE0DC()
{
  return sub_252DBE038(*v0);
}

uint64_t sub_252DBE0E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DBDE60(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DBE10C(uint64_t a1)
{
  unint64_t v2 = sub_252DBE368();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DBE148(uint64_t a1)
{
  unint64_t v2 = sub_252DBE368();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ElementContent.Command.encode(to:)()
{
  sub_252D97FE0();
  uint64_t v3 = v2;
  uint64_t v4 = sub_252D8823C(&qword_269CA9EF8);
  sub_252D89934();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  sub_252D9E234();
  sub_252D88F0C(v3, v3[3]);
  sub_252DBE368();
  sub_252DC33E0();
  sub_252DC32E0();
  if (!v0)
  {
    sub_252DC32E0();
    sub_252DC32E0();
    sub_252D8823C(&qword_26B23BFE8);
    sub_252DBE6C0(&qword_269CA9F08);
    sub_252DC3340();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_252D97FF8();
}

unint64_t sub_252DBE368()
{
  unint64_t result = qword_269CA9F00;
  if (!qword_269CA9F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F00);
  }
  return result;
}

void ElementContent.Command.init(from:)()
{
  sub_252D97FE0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_252D8823C(&qword_269CA9F10);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D981D0();
  sub_252D88F0C(v2, v2[3]);
  sub_252DBE368();
  sub_252DC33D0();
  if (v0)
  {
    sub_252D8931C((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_252DC3250();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_252DC3250();
    uint64_t v18 = v10;
    uint64_t v16 = v9;
    uint64_t v17 = v6;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_252DC3250();
    uint64_t v12 = v11;
    sub_252D8823C(&qword_26B23BFE8);
    sub_252DBE6C0(&qword_269CA9F18);
    swift_bridgeObjectRetain();
    sub_252DC32B0();
    uint64_t v13 = sub_252DC05FC();
    v14(v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v4 = v17;
    v4[1] = v8;
    v4[2] = v16;
    v4[3] = v18;
    v4[4] = v15;
    v4[5] = v12;
    v4[6] = v19;
    sub_252D8931C((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_252D97FF8();
}

uint64_t sub_252DBE6C0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252D88324(&qword_26B23BFE8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_252DBE724()
{
}

void sub_252DBE73C()
{
}

uint64_t static ElementContent.== infix(_:_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v11 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v13 = a2[2];
  uint64_t v12 = a2[3];
  uint64_t v15 = a2[4];
  uint64_t v14 = a2[5];
  uint64_t v16 = a2[6];
  int v17 = *((unsigned __int8 *)a2 + 56);
  v91[0] = *(void *)a1;
  v91[1] = v3;
  v91[2] = v5;
  v91[3] = v4;
  v91[4] = v7;
  v91[5] = v6;
  v91[6] = v8;
  char v92 = v9;
  uint64_t v93 = v11;
  uint64_t v94 = v10;
  uint64_t v95 = v13;
  uint64_t v96 = v12;
  uint64_t v97 = v15;
  uint64_t v98 = v14;
  uint64_t v99 = v16;
  char v100 = v17;
  if ((v9 & 1) == 0)
  {
    if ((v17 & 1) == 0)
    {
      v90[0] = v2;
      v90[1] = v3;
      v90[2] = v5;
      v90[3] = v4;
      v90[4] = v7;
      v90[5] = v6;
      v90[6] = v8;
      v89[0] = v11;
      v89[1] = v10;
      v89[2] = v13;
      v89[3] = v12;
      v89[4] = v15;
      v89[5] = v14;
      v89[6] = v16;
      char v19 = static ElementContent.Command.== infix(_:_:)(v90, v89);
      uint64_t v54 = sub_252DC0638();
      sub_252D97CFC(v54, v55, v56, v57, v58, v59, v60, 0);
      uint64_t v61 = sub_252DC06A0();
      char v68 = 0;
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    uint64_t v34 = v4;
    uint64_t v35 = v7;
    sub_252DC06D0();
    uint64_t v37 = v36;
    sub_252D97CFC(v38, v39, v40, v41, v42, v43, v44, v45);
    uint64_t v46 = v37;
    uint64_t v47 = v3;
    uint64_t v48 = v5;
    uint64_t v49 = v34;
    uint64_t v50 = v35;
    uint64_t v51 = v13;
    uint64_t v52 = v12;
    char v53 = v9;
    goto LABEL_13;
  }
  if (!v3)
  {
    if (!v10)
    {
      sub_252DBE9DC((uint64_t)v91);
      char v19 = 1;
      return v19 & 1;
    }
    swift_bridgeObjectRetain();
    goto LABEL_14;
  }
  if (v10)
  {
    uint64_t v85 = v4;
    uint64_t v86 = v7;
    uint64_t v87 = v6;
    uint64_t v88 = v8;
    if (v2 != v11 || v3 != v10)
    {
      char v84 = sub_252DC3360();
      char v19 = 1;
      uint64_t v20 = sub_252DC0638();
      sub_252D97CFC(v20, v21, v22, v23, v24, v25, v26, 1);
      uint64_t v27 = sub_252DC06A0();
      sub_252D97CFC(v27, v28, v29, v30, v31, v32, v33, 1);
      sub_252DBE9DC((uint64_t)v91);
      if (v84) {
        return v19 & 1;
      }
      goto LABEL_15;
    }
    char v19 = 1;
    uint64_t v82 = v12;
    uint64_t v83 = v2;
    sub_252D97CFC(v2, v3, v13, v82, v15, v14, v16, 1);
    uint64_t v61 = v83;
    uint64_t v62 = v3;
    uint64_t v63 = v5;
    uint64_t v64 = v85;
    uint64_t v65 = v86;
    uint64_t v66 = v87;
    uint64_t v67 = v88;
    char v68 = 1;
LABEL_17:
    sub_252D97CFC(v61, v62, v63, v64, v65, v66, v67, v68);
    sub_252DBE9DC((uint64_t)v91);
    return v19 & 1;
  }
  uint64_t v70 = v5;
  uint64_t v71 = v4;
  uint64_t v72 = v7;
  sub_252DC06D0();
  uint64_t v74 = v73;
  sub_252D97CFC(v75, v76, v77, v78, v79, v80, v81, 1);
  uint64_t v46 = v74;
  uint64_t v47 = v3;
  uint64_t v48 = v70;
  uint64_t v49 = v71;
  uint64_t v50 = v72;
  uint64_t v51 = v13;
  uint64_t v52 = v12;
  char v53 = 1;
LABEL_13:
  sub_252D97CFC(v46, v47, v48, v49, v50, v51, v52, v53);
LABEL_14:
  sub_252DBE9DC((uint64_t)v91);
LABEL_15:
  char v19 = 0;
  return v19 & 1;
}

uint64_t sub_252DBE9DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 112);
  char v9 = *(unsigned char *)(a1 + 120);
  sub_252D97E2C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  sub_252D97E2C(v2, v3, v4, v5, v6, v7, v8, v9);
  return a1;
}

uint64_t sub_252DBEA70(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_252DC3360() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_252DC3360();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252DBEB50(char a1)
{
  if (a1) {
    return 1954047348;
  }
  else {
    return 0x646E616D6D6F63;
  }
}

uint64_t sub_252DBEB80()
{
  return sub_252DBEB50(*v0);
}

uint64_t sub_252DBEB88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252DBEA70(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252DBEBB0(uint64_t a1)
{
  unint64_t v2 = sub_252DBEFCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DBEBEC(uint64_t a1)
{
  unint64_t v2 = sub_252DBEFCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DBEC28(uint64_t a1)
{
  unint64_t v2 = sub_252DBF0B0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DBEC64(uint64_t a1)
{
  unint64_t v2 = sub_252DBF0B0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252DBECA0(uint64_t a1)
{
  unint64_t v2 = sub_252DBF018();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252DBECDC(uint64_t a1)
{
  unint64_t v2 = sub_252DBF018();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ElementContent.encode(to:)()
{
  sub_252D97FE0();
  uint64_t v4 = v3;
  sub_252D8823C(&qword_269CA9F20);
  sub_252D89934();
  uint64_t v28 = v6;
  uint64_t v29 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252D8823C(&qword_269CA9F28);
  sub_252D89934();
  uint64_t v26 = v10;
  uint64_t v27 = v9;
  MEMORY[0x270FA5388](v9);
  sub_252D981D0();
  uint64_t v11 = sub_252D8823C(&qword_269CA9F30);
  sub_252D89934();
  uint64_t v32 = v12;
  MEMORY[0x270FA5388](v13);
  sub_252D9B27C();
  uint64_t v14 = v0[1];
  uint64_t v30 = *v0;
  uint64_t v31 = v14;
  uint64_t v15 = v0[2];
  uint64_t v24 = v0[3];
  uint64_t v25 = v15;
  uint64_t v16 = v0[4];
  uint64_t v22 = v0[5];
  uint64_t v23 = v16;
  uint64_t v21 = v0[6];
  char v17 = *((unsigned char *)v0 + 56);
  sub_252D88F0C(v4, v4[3]);
  sub_252DBEFCC();
  sub_252DC33E0();
  if (v17)
  {
    LOBYTE(v33) = 1;
    sub_252DBF018();
    sub_252DC32D0();
    uint64_t v33 = v30;
    uint64_t v34 = v31;
    sub_252DBF064();
    uint64_t v18 = v29;
    sub_252DC3340();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v18);
  }
  else
  {
    LOBYTE(v33) = 0;
    sub_252DBF0B0();
    sub_252DC32D0();
    uint64_t v33 = v30;
    uint64_t v34 = v31;
    uint64_t v35 = v25;
    uint64_t v36 = v24;
    uint64_t v37 = v23;
    uint64_t v38 = v22;
    uint64_t v39 = v21;
    sub_252DBF0FC();
    uint64_t v19 = v27;
    sub_252DC3340();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v19);
  }
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v1, v11);
  sub_252D97FF8();
}

unint64_t sub_252DBEFCC()
{
  unint64_t result = qword_269CA9F38;
  if (!qword_269CA9F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F38);
  }
  return result;
}

unint64_t sub_252DBF018()
{
  unint64_t result = qword_269CA9F40;
  if (!qword_269CA9F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F40);
  }
  return result;
}

unint64_t sub_252DBF064()
{
  unint64_t result = qword_269CA9F48;
  if (!qword_269CA9F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F48);
  }
  return result;
}

unint64_t sub_252DBF0B0()
{
  unint64_t result = qword_269CA9F50;
  if (!qword_269CA9F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F50);
  }
  return result;
}

unint64_t sub_252DBF0FC()
{
  unint64_t result = qword_269CA9F58;
  if (!qword_269CA9F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F58);
  }
  return result;
}

void ElementContent.init(from:)()
{
  sub_252D97FE0();
  uint64_t v3 = v2;
  uint64_t v33 = v4;
  sub_252D8823C(&qword_269CA9F60);
  sub_252D89934();
  MEMORY[0x270FA5388](v5);
  sub_252D9E234();
  sub_252D8823C(&qword_269CA9F68);
  sub_252D89934();
  MEMORY[0x270FA5388](v6);
  sub_252D981B8();
  uint64_t v7 = sub_252D8823C(&qword_269CA9F70);
  sub_252D89934();
  uint64_t v34 = v8;
  MEMORY[0x270FA5388](v9);
  sub_252D9B27C();
  sub_252D88F0C(v3, v3[3]);
  sub_252DBEFCC();
  sub_252DC33D0();
  if (v0) {
    goto LABEL_9;
  }
  uint64_t v39 = v3;
  uint64_t v10 = sub_252DC32C0();
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v12 = v7;
  if (!v11)
  {
    uint64_t v13 = v1;
    goto LABEL_7;
  }
  uint64_t v13 = v1;
  char v14 = *(unsigned char *)(v10 + 32);
  sub_252D97BB4(1, v11, v10, v10 + 32, 0, (2 * v11) | 1);
  uint64_t v16 = v15;
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (v16 != v18 >> 1)
  {
LABEL_7:
    uint64_t v19 = sub_252DC31E0();
    swift_allocError();
    uint64_t v21 = v20;
    sub_252D8823C(&qword_269CA91C8);
    void *v21 = &type metadata for ElementContent;
    sub_252DC3240();
    sub_252DC31D0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v13, v12);
    uint64_t v3 = v39;
LABEL_9:
    uint64_t v22 = (uint64_t)v3;
    goto LABEL_10;
  }
  if (v14)
  {
    LOBYTE(v35) = 1;
    sub_252DBF018();
    sub_252DC3230();
    sub_252DBF7E0();
    sub_252DC32B0();
    uint64_t v23 = sub_252DC0684();
    v24(v23);
    swift_unknownObjectRelease();
    sub_252DC0658();
    v25();
    uint64_t v26 = 0;
    long long v27 = v35;
    long long v28 = 0uLL;
    long long v29 = 0uLL;
  }
  else
  {
    LOBYTE(v35) = 0;
    sub_252DBF0B0();
    sub_252DC3230();
    sub_252DBF82C();
    sub_252DC32B0();
    uint64_t v30 = sub_252DC0668();
    v31(v30);
    swift_unknownObjectRelease();
    sub_252DC0658();
    v32();
    long long v27 = v35;
    long long v28 = v36;
    long long v29 = v37;
    uint64_t v26 = v38;
  }
  *(_OWORD *)uint64_t v33 = v27;
  *(_OWORD *)(v33 + 16) = v28;
  *(_OWORD *)(v33 + 32) = v29;
  *(void *)(v33 + 48) = v26;
  *(unsigned char *)(v33 + 56) = v14;
  uint64_t v22 = (uint64_t)v39;
LABEL_10:
  sub_252D8931C(v22);
  sub_252D97FF8();
}

void sub_252DBF610()
{
}

void sub_252DBF628()
{
}

uint64_t ElementContent.description.getter()
{
  if (*(unsigned char *)(v0 + 56) != 1) {
    return 0x646E616D6D6F43;
  }
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 8);
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v7 = *(void *)v0;
  swift_bridgeObjectRetain();
  sub_252DC31C0();
  swift_bridgeObjectRelease();
  sub_252DC0614();
  swift_bridgeObjectRetain();
  sub_252DC30B0();
  swift_bridgeObjectRelease();
  sub_252DC30B0();
  sub_252D97E2C(v7, v6, v5, v4, v3, v2, v1, 1);
  return 0;
}

uint64_t ElementContent.Text.description.getter()
{
  return 0;
}

unint64_t sub_252DBF7E0()
{
  unint64_t result = qword_269CA9F78;
  if (!qword_269CA9F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F78);
  }
  return result;
}

unint64_t sub_252DBF82C()
{
  unint64_t result = qword_269CA9F80;
  if (!qword_269CA9F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F80);
  }
  return result;
}

uint64_t destroy for ElementContent(uint64_t a1)
{
  return sub_252D97E2C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
}

uint64_t initializeWithCopy for ElementContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  char v10 = *(unsigned char *)(a2 + 56);
  sub_252D97CFC(*(void *)a2, v4, v5, v6, v7, v8, v9, v10);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  return a1;
}

uint64_t assignWithCopy for ElementContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  char v10 = *(unsigned char *)(a2 + 56);
  sub_252D97CFC(*(void *)a2, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v11 = *(void *)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  char v18 = *(unsigned char *)(a1 + 56);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  sub_252D97E2C(v11, v12, v13, v14, v15, v16, v17, v18);
  return a1;
}

__n128 initializeWithTake for ElementContent(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ElementContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 48);
  char v4 = *(unsigned char *)(a2 + 56);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 56);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v3;
  *(unsigned char *)(a1 + 56) = v4;
  sub_252D97E2C(v5, v7, v6, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementContent(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 57))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
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

uint64_t storeEnumTagSinglePayload for ElementContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 56) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_252DBFADC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 56);
}

uint64_t sub_252DBFAE4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 56) = a2 & 1;
  return result;
}

void type metadata accessor for ElementContent()
{
}

void *assignWithCopy for ElementContent.Text(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementContent.Text(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ElementContent.Text(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
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

void type metadata accessor for ElementContent.Text()
{
}

uint64_t destroy for ElementContent.Command()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ElementContent.Command(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ElementContent.Command(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ElementContent.Command(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementContent.Command(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 48);
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

uint64_t storeEnumTagSinglePayload for ElementContent.Command(uint64_t result, int a2, int a3)
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ElementContent.Command()
{
}

unsigned char *storeEnumTagSinglePayload for ElementContent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252DBFF18);
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

ValueMetadata *type metadata accessor for ElementContent.CodingKeys()
{
  return &type metadata for ElementContent.CodingKeys;
}

ValueMetadata *type metadata accessor for ElementContent.CommandCodingKeys()
{
  return &type metadata for ElementContent.CommandCodingKeys;
}

ValueMetadata *type metadata accessor for ElementContent.TextCodingKeys()
{
  return &type metadata for ElementContent.TextCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ElementContent.Command.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x252DC0040);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ElementContent.Command.CodingKeys()
{
  return &type metadata for ElementContent.Command.CodingKeys;
}

unsigned char *_s23IntelligenceFlowContext14ElementContentO17CommandCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252DC0114);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ElementContent.Text.CodingKeys()
{
  return &type metadata for ElementContent.Text.CodingKeys;
}

unint64_t sub_252DC0150()
{
  unint64_t result = qword_269CA9F88;
  if (!qword_269CA9F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F88);
  }
  return result;
}

unint64_t sub_252DC01A0()
{
  unint64_t result = qword_269CA9F90;
  if (!qword_269CA9F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F90);
  }
  return result;
}

unint64_t sub_252DC01F0()
{
  unint64_t result = qword_269CA9F98;
  if (!qword_269CA9F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9F98);
  }
  return result;
}

unint64_t sub_252DC0240()
{
  unint64_t result = qword_269CA9FA0;
  if (!qword_269CA9FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FA0);
  }
  return result;
}

unint64_t sub_252DC0290()
{
  unint64_t result = qword_269CA9FA8;
  if (!qword_269CA9FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FA8);
  }
  return result;
}

unint64_t sub_252DC02E0()
{
  unint64_t result = qword_269CA9FB0;
  if (!qword_269CA9FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FB0);
  }
  return result;
}

unint64_t sub_252DC0330()
{
  unint64_t result = qword_269CA9FB8;
  if (!qword_269CA9FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FB8);
  }
  return result;
}

unint64_t sub_252DC0380()
{
  unint64_t result = qword_269CA9FC0;
  if (!qword_269CA9FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FC0);
  }
  return result;
}

unint64_t sub_252DC03D0()
{
  unint64_t result = qword_269CA9FC8;
  if (!qword_269CA9FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FC8);
  }
  return result;
}

unint64_t sub_252DC0420()
{
  unint64_t result = qword_269CA9FD0;
  if (!qword_269CA9FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FD0);
  }
  return result;
}

unint64_t sub_252DC0470()
{
  unint64_t result = qword_269CA9FD8;
  if (!qword_269CA9FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FD8);
  }
  return result;
}

unint64_t sub_252DC04C0()
{
  unint64_t result = qword_269CA9FE0;
  if (!qword_269CA9FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FE0);
  }
  return result;
}

unint64_t sub_252DC0510()
{
  unint64_t result = qword_269CA9FE8;
  if (!qword_269CA9FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FE8);
  }
  return result;
}

unint64_t sub_252DC0560()
{
  unint64_t result = qword_269CA9FF0;
  if (!qword_269CA9FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FF0);
  }
  return result;
}

unint64_t sub_252DC05B0()
{
  unint64_t result = qword_269CA9FF8;
  if (!qword_269CA9FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CA9FF8);
  }
  return result;
}

uint64_t sub_252DC05FC()
{
  return v0;
}

uint64_t sub_252DC0638()
{
  return v0;
}

uint64_t sub_252DC0668()
{
  return v0;
}

uint64_t sub_252DC0684()
{
  return v0;
}

uint64_t sub_252DC06A0()
{
  return v0;
}

uint64_t sub_252DC06B8()
{
  return v0;
}

void *sub_252DC06E8()
{
  qword_269CAA000 = (uint64_t)&unk_27031B318;
  return &unk_27031B318;
}

id static ContextXPCService.interface.getter()
{
  if (qword_269CA9080 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269CAA000;

  return v0;
}

unint64_t static ContextXPCService.serviceName.getter()
{
  return sub_252DC1BE8();
}

unint64_t static ContextXPCService.entitlementName.getter()
{
  return sub_252DC1BE8();
}

void sub_252DC0770()
{
  qword_269CAA008 = MEMORY[0x263F8EE78];
}

uint64_t static ContextXPCService.selectorClasses.getter()
{
  if (qword_269CA9088 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_252DC07E0()
{
  uint64_t v0 = sub_252DC2F60();
  sub_252DC19E4(v0, qword_269CAA010);
  sub_252DC08D4(v0, (uint64_t)qword_269CAA010);
  return sub_252DC2E50();
}

uint64_t static ContextXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269CA9090 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252DC2F60();
  uint64_t v3 = sub_252DC08D4(v2, (uint64_t)qword_269CAA010);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_252DC08D4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_252DC0910()
{
  return 0xD000000000000022;
}

ValueMetadata *type metadata accessor for ContextXPCService()
{
  return &type metadata for ContextXPCService;
}

uint64_t sub_252DC094C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = 0;
  sub_252DC1B50(&qword_26B23C2D0, a2, (void (*)(uint64_t))type metadata accessor for ContextClient);
  sub_252D8823C(&qword_26B23C2C8);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + 16) = sub_252DC2EA0();
  swift_release();
  return v2;
}

void sub_252DC09F4()
{
  if (*(void *)(v0 + 16))
  {
    MEMORY[0x270FA5388]();
    sub_252DC1AD8();
    swift_retain();
    sub_252DC2E80();
    swift_release();
    if (!v1) {

    }
    sub_252DC1C14();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252DC0AC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC0B88(a4, a5, a6, a7, (uint64_t)sub_252DC1B18, v14, a1);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC0B88(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v10 = a4;
  if (a2 >> 60 == 15)
  {
    uint64_t v11 = 0;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v11 = (void *)sub_252DC2CD0();
  if (v10) {
LABEL_5:
  }
    uint64_t v10 = (void *)sub_252DC3070();
LABEL_6:
  v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_252DC0C98;
  v13[3] = &unk_270318A10;
  char v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a7, sel_refreshWithContextTypes_interactionId_with_, v11, v10, v12);
  _Block_release(v12);
}

void sub_252DC0C98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_252DC0D24()
{
}

uint64_t sub_252DC0D50(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC0E00(a4, a5, (uint64_t)sub_252DC1BCC, v10, a1);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC0E00(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2 >> 60 == 15) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = (void *)sub_252DC2CD0();
  }
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_252DC1C5C;
  v10[3] = &unk_2703189C0;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_refreshAndRetrieveWithContextTypes_with_, v8, v9);
  _Block_release(v9);
}

void sub_252DC0EE8()
{
}

void sub_252DC0F14()
{
  if (*(void *)(v0 + 16))
  {
    MEMORY[0x270FA5388]();
    swift_retain();
    sub_252DC2E80();
    sub_252DC1BFC();
    sub_252DC1C14();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252DC0FAC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC105C(a4, a5, (uint64_t)sub_252DC1BCC, v10, a1);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC105C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)sub_252DC3070();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_252DC1C5C;
  v10[3] = &unk_2703188D0;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_retrieveContextValuesWithQuery_with_, v8, v9);
  _Block_release(v9);
}

void sub_252DC1130()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v3 = MEMORY[0x270FA5388]();
    uint64_t v4 = v1;
    uint64_t v5 = v2;
    swift_retain();
    sub_252DC2E80();
    sub_252DC1BFC();
    sub_252DC1C14();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252DC11D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC1298(a4, a5, a6, (uint64_t)sub_252DC1BCC, v12, a1);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC1298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = (void *)sub_252DC2CD0();
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_252DC1C5C;
  v12[3] = &unk_270318970;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a6, sel_retrieveContextValuesWithContextTypes_timeout_with_, v10, a3, v11);
  _Block_release(v11);
}

void sub_252DC1374()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v5 = MEMORY[0x270FA5388]();
    uint64_t v6 = v1;
    uint64_t v7 = v2;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    swift_retain();
    sub_252DC2E80();
    sub_252DC1BFC();
    sub_252DC1C14();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252DC1420(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC14F8(a4, a5, a6, a7, a8, (uint64_t)sub_252DC1BCC, v16, a1);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC14F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  long long v13 = (void *)sub_252DC3070();
  uint64_t v14 = (void *)sub_252DC3100();
  v16[4] = a6;
  uint64_t v16[5] = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_252DC1C5C;
  v16[3] = &unk_270318920;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a8, sel_retrieveAndRankIntelligenceCommandContextValuesWithQuery_appBundleIds_threshold_timeout_with_, v13, v14, a4, a5, v15);
  _Block_release(v15);
}

uint64_t sub_252DC1604()
{
  return sub_252DC1704((uint64_t)sub_252DC1630);
}

uint64_t sub_252DC1630(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC1814((uint64_t)sub_252DC1BCC, v6, a1, (uint64_t)&unk_270318880, (SEL *)&selRef_retrieveRequiredContextValuesWith_);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_252DC16D8()
{
  return sub_252DC1704((uint64_t)sub_252DC176C);
}

uint64_t sub_252DC1704(uint64_t result)
{
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = result;
    swift_retain();
    sub_252DC2E80();
    unint64_t result = sub_252DC1BFC();
    if (!v2) {
      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_252DC176C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC1814((uint64_t)sub_252DC1A80, v6, a1, (uint64_t)&unk_270318830, (SEL *)&selRef_dumpUIContextFromCacheWith_);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC1814(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, SEL *a5)
{
  v8[4] = a1;
  v8[5] = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_252DC1C5C;
  v8[3] = a4;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a3, *a5, v7);
  _Block_release(v7);
}

uint64_t sub_252DC18CC()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ContextClient()
{
  return self;
}

uint64_t sub_252DC1928()
{
  return sub_252DC1B50(&qword_269CAA028, 255, MEMORY[0x263F61838]);
}

uint64_t sub_252DC1974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for ContextClient();

  return MEMORY[0x270F57798](a1, v5, a3);
}

uint64_t sub_252DC19C8()
{
  return sub_252DC2EC0();
}

uint64_t *sub_252DC19E4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_252DC1A48()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252DC1A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC1C20(a1, a2, a3, *(uint64_t (**)(void *, uint64_t))(v3 + 16));
}

uint64_t sub_252DC1A88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_252DC1A98()
{
  return swift_release();
}

uint64_t sub_252DC1AA0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC0FAC(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_252DC1AA8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC1420(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_252DC1AB8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC11D8(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t sub_252DC1AC4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC0D50(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_252DC1ACC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC0AC0(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void **)(v3 + 40));
}

unint64_t sub_252DC1AD8()
{
  unint64_t result = qword_269CAA030;
  if (!qword_269CAA030)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_269CAA030);
  }
  return result;
}

uint64_t sub_252DC1B18(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_252DC1B50(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_252DC1BE8()
{
  return 0xD000000000000022;
}

uint64_t sub_252DC1BFC()
{
  return swift_release();
}

uint64_t sub_252DC1C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t))
{
  v5[0] = a1;
  v5[1] = a2;
  return a4(v5, a3);
}

uint64_t sub_252DC1C5C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_252DC2CE0();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_252D8841C((uint64_t)v4, v8);

  return swift_release();
}

void *sub_252DC1D08()
{
  qword_26B23C108 = (uint64_t)&unk_27031B378;
  return &unk_27031B378;
}

id static UIContextXPCService.interface.getter()
{
  if (qword_26B23C018 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B23C108;

  return v0;
}

unint64_t static UIContextXPCService.serviceName.getter()
{
  return sub_252DC2BAC();
}

unint64_t static UIContextXPCService.entitlementName.getter()
{
  return sub_252DC2BAC();
}

void sub_252DC1D90()
{
  qword_26B23C0E8 = MEMORY[0x263F8EE78];
}

uint64_t static UIContextXPCService.selectorClasses.getter()
{
  if (qword_26B23C008 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_252DC1E00()
{
  uint64_t v0 = sub_252DC2F60();
  sub_252DC19E4(v0, qword_26B23C0F0);
  sub_252DC08D4(v0, (uint64_t)qword_26B23C0F0);
  return sub_252DC2E60();
}

uint64_t static UIContextXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B23C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252DC2F60();
  uint64_t v3 = sub_252DC08D4(v2, (uint64_t)qword_26B23C0F0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_252DC1EF8()
{
  return 0xD000000000000024;
}

ValueMetadata *type metadata accessor for UIContextXPCService()
{
  return &type metadata for UIContextXPCService;
}

uint64_t sub_252DC1F30(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = 0;
  sub_252DC2B3C(&qword_26B23C390, a2, (void (*)(uint64_t))type metadata accessor for UIContextXPCClient);
  sub_252D8823C(qword_26B23C300);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + 16) = sub_252DC2EA0();
  swift_release();
  return v2;
}

uint64_t sub_252DC1FD8(uint64_t result)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](result);
    swift_retain();
    sub_252DC2E80();
    uint64_t result = swift_release();
    if (!v2) {
      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_252DC2088(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC28FC(a4, a5, (uint64_t)sub_252DC2AD0, v10, a1, (uint64_t)&unk_270318B20, (SEL *)&selRef_retrieveUIContextElementsWithOptions_with_);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_252DC2148()
{
  if (*(void *)(v0 + 16))
  {
    swift_retain();
    sub_252DC2E80();
    uint64_t result = swift_release();
    if (!v1) {
      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_252DC21C4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC225C((uint64_t)sub_252DC2AD0, v6, a1);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC225C(uint64_t a1, uint64_t a2, void *a3)
{
  v5[4] = a1;
  v5[5] = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  void v5[2] = sub_252DC1C5C;
  v5[3] = &unk_270318AD0;
  uint64_t v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_retrieveUIElementsWith_, v4);
  _Block_release(v4);
}

uint64_t sub_252DC2314(uint64_t result)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](result);
    swift_retain();
    sub_252DC2E80();
    uint64_t result = swift_release();
    if (!v2) {
      return v3;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_252DC23CC(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC247C(a4, a5, (uint64_t)sub_252DC2AD0, v10, a1);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC247C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = (void *)sub_252DC3100();
  v11[4] = a3;
  v11[5] = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_252DC1C5C;
  v11[3] = &unk_270318B70;
  uint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_retrieveElementHierarchyWithVerbose_args_with_, a1 & 1, v9, v10);
  _Block_release(v10);
}

uint64_t sub_252DC2568(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return MEMORY[0x270FA2498](sub_252DC258C, 0, 0);
}

uint64_t sub_252DC258C(void *a1, uint64_t (*a2)(void *a1, uint64_t a2, uint64_t a3), uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(v4[6] + 16);
  v4[7] = v5;
  if (v5)
  {
    uint64_t v7 = v4[4];
    uint64_t v6 = v4[5];
    uint64_t v8 = swift_task_alloc();
    v4[8] = v8;
    *(void *)(v8 + 16) = v7;
    *(void *)(v8 + 24) = v6;
    swift_retain();
    id v9 = (void *)swift_task_alloc();
    v4[9] = v9;
    *id v9 = v4;
    v9[1] = sub_252DC2690;
    a4 = MEMORY[0x263F06F78];
    a2 = sub_252DC2A90;
    a1 = v4 + 2;
    a3 = v8;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270F57710](a1, a2, a3, a4);
}

uint64_t sub_252DC2690()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_252DC27D0;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v2 = sub_252DC27B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252DC27B4()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_252DC27D0()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_252DC283C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252DC28FC(a4, a5, (uint64_t)sub_252DC2AD0, v10, a1, (uint64_t)&unk_270318A80, (SEL *)&selRef_retrieveOnScreenContentWithParameters_with_);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252DC28FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, SEL *a7)
{
  uint64_t v12 = (void *)sub_252DC2CD0();
  v14[4] = a3;
  v14[5] = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_252DC1C5C;
  v14[3] = a6;
  long long v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(a5, *a7, v12, v13);
  _Block_release(v13);
}

uint64_t type metadata accessor for UIContextXPCClient()
{
  return self;
}

uint64_t sub_252DC29F0()
{
  return sub_252DC2B3C(&qword_269CAA028, 255, MEMORY[0x263F61838]);
}

uint64_t sub_252DC2A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for UIContextXPCClient();

  return MEMORY[0x270F57798](a1, v5, a3);
}

uint64_t sub_252DC2A90(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC283C(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_252DC2A98()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252DC2AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_252DC2AE4()
{
  return swift_release();
}

uint64_t sub_252DC2AEC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC2088(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_252DC2AF4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252DC23CC(a1, a2, a3, *(unsigned char *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_252DC2B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  return v4(v6, a3);
}

uint64_t sub_252DC2B3C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_252DC2BAC()
{
  return 0xD000000000000024;
}

uint64_t sub_252DC2BC0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_252DC2BD0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_252DC2BE0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_252DC2BF0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_252DC2C00()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_252DC2C10()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_252DC2C20()
{
  return MEMORY[0x270EEE748]();
}

uint64_t sub_252DC2C30()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_252DC2C40()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_252DC2C50()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_252DC2C60()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_252DC2C70()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_252DC2C80()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_252DC2C90()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_252DC2CA0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_252DC2CB0()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_252DC2CC0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_252DC2CD0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_252DC2CE0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_252DC2CF0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_252DC2D00()
{
  return MEMORY[0x270F80B80]();
}

uint64_t sub_252DC2D10()
{
  return MEMORY[0x270F80B90]();
}

uint64_t sub_252DC2D20()
{
  return MEMORY[0x270F80BB0]();
}

uint64_t sub_252DC2D30()
{
  return MEMORY[0x270F80BC8]();
}

uint64_t sub_252DC2D40()
{
  return MEMORY[0x270F80BF8]();
}

uint64_t sub_252DC2D50()
{
  return MEMORY[0x270F80C48]();
}

uint64_t sub_252DC2D60()
{
  return MEMORY[0x270F80C80]();
}

uint64_t sub_252DC2D70()
{
  return MEMORY[0x270F80C98]();
}

uint64_t sub_252DC2D80()
{
  return MEMORY[0x270F80FD8]();
}

uint64_t sub_252DC2D90()
{
  return MEMORY[0x270F810F8]();
}

uint64_t sub_252DC2DA0()
{
  return MEMORY[0x270F81128]();
}

uint64_t sub_252DC2DB0()
{
  return MEMORY[0x270F81148]();
}

uint64_t sub_252DC2DC0()
{
  return MEMORY[0x270F81150]();
}

uint64_t sub_252DC2DD0()
{
  return MEMORY[0x270F81158]();
}

uint64_t sub_252DC2DE0()
{
  return MEMORY[0x270F81160]();
}

uint64_t sub_252DC2DF0()
{
  return MEMORY[0x270F81168]();
}

uint64_t sub_252DC2E00()
{
  return MEMORY[0x270F81170]();
}

uint64_t sub_252DC2E10()
{
  return MEMORY[0x270F81178]();
}

uint64_t sub_252DC2E20()
{
  return MEMORY[0x270F81180]();
}

uint64_t sub_252DC2E30()
{
  return MEMORY[0x270F81188]();
}

uint64_t sub_252DC2E50()
{
  return MEMORY[0x270F41AC0]();
}

uint64_t sub_252DC2E60()
{
  return MEMORY[0x270F41B08]();
}

uint64_t sub_252DC2E70()
{
  return MEMORY[0x270F57638]();
}

uint64_t sub_252DC2E80()
{
  return MEMORY[0x270F57708]();
}

uint64_t sub_252DC2EA0()
{
  return MEMORY[0x270F57718]();
}

uint64_t sub_252DC2EB0()
{
  return MEMORY[0x270F57788]();
}

uint64_t sub_252DC2EC0()
{
  return MEMORY[0x270F57790]();
}

uint64_t sub_252DC2EE0()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t sub_252DC2EF0()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_252DC2F00()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_252DC2F10()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_252DC2F20()
{
  return MEMORY[0x270FA1868]();
}

uint64_t sub_252DC2F30()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_252DC2F40()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_252DC2F50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252DC2F60()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252DC2F90()
{
  return MEMORY[0x270F7FE88]();
}

uint64_t sub_252DC2FA0()
{
  return MEMORY[0x270F7FE98]();
}

uint64_t sub_252DC2FB0()
{
  return MEMORY[0x270F7FF68]();
}

uint64_t sub_252DC2FC0()
{
  return MEMORY[0x270F7FF70]();
}

uint64_t sub_252DC2FD0()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_252DC2FE0()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_252DC2FF0()
{
  return MEMORY[0x270F80048]();
}

uint64_t sub_252DC3000()
{
  return MEMORY[0x270F800C8]();
}

uint64_t sub_252DC3010()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_252DC3020()
{
  return MEMORY[0x270F802A0]();
}

uint64_t sub_252DC3030()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_252DC3040()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_252DC3050()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_252DC3060()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_252DC3070()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_252DC3080()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_252DC3090()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_252DC30A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252DC30B0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252DC30C0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_252DC30D0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_252DC30E0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_252DC30F0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_252DC3100()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_252DC3110()
{
  return MEMORY[0x270F41B10]();
}

uint64_t sub_252DC3120()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_252DC3130()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_252DC3140()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252DC3150()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_252DC3160()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_252DC3170()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_252DC3190()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_252DC31A0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_252DC31B0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_252DC31C0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_252DC31D0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_252DC31E0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_252DC31F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_252DC3200()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252DC3210()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_252DC3220()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_252DC3230()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_252DC3240()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_252DC3250()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_252DC3260()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_252DC3270()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_252DC3280()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_252DC3290()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_252DC32A0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_252DC32B0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_252DC32C0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_252DC32D0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_252DC32E0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_252DC32F0()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_252DC3300()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_252DC3310()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_252DC3320()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_252DC3330()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_252DC3340()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_252DC3350()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_252DC3360()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252DC3370()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_252DC3380()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_252DC3390()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_252DC33A0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_252DC33B0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_252DC33C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_252DC33D0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_252DC33E0()
{
  return MEMORY[0x270F9FD98]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}