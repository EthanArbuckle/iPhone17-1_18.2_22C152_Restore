id ExcResourceReportPaths()
{
  return +[DiagnosticReportCollectorBridge ExcResourceReportPaths];
}

BOOL WriteJetsamMemoryReport(uint64_t a1, uint64_t a2)
{
  return +[CompatibilityBridge WriteJetsamMemoryReportWithVisibilityEndowmentSet:a1 audioAssertionSet:a2];
}

id DiagnosticPatternMatching.__allocating_init(type:)(int a1)
{
  id v3 = objc_allocWithZone(v1);
  return DiagnosticPatternMatching.init(type:)(a1);
}

id DiagnosticPatternMatching.init(type:)(int a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_DWORD *)&v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_type] = a1;
  if (a1 == 2)
  {
    v4 = v1;
    if (sub_24B3CC3C0())
    {
      v21 = 0;
      long long v19 = 0u;
      long long v20 = 0u;
    }
    else
    {
      *((void *)&v20 + 1) = &type metadata for PanicMatcher;
      v21 = &off_26FE7D4B8;
    }
    uint64_t v7 = (uint64_t)&v4[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher];
    sub_24B3C8098((uint64_t)&v19, (uint64_t)&v4[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher]);
    sub_24B3C8100(v7, (uint64_t)&v19);
    uint64_t v8 = *((void *)&v20 + 1);
    sub_24B3C7E5C((uint64_t)&v19);
    if (v8)
    {
      sub_24B3C8168();
      uint64_t v9 = sub_24B3D9F38();
      MEMORY[0x270FA5388](v9 - 8, v10);
      sub_24B3D9F28();
      uint64_t v11 = sub_24B3DA158();
      MEMORY[0x270FA5388](v11, v12);
      *(void *)&long long v19 = MEMORY[0x263F8EE78];
      sub_24B3C81A8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4188);
      sub_24B3C81F4();
      sub_24B3DA218();
      uint64_t v13 = sub_24B3DA168();
      MEMORY[0x270FA5388](v13, v14);
      (*(void (**)(char *, void))(v16 + 104))((char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
      *(void *)&v4[OBJC_IVAR____SwiftDiagnosticPatternMatching_asyncQueue] = sub_24B3DA178();

      v18.receiver = v4;
      v18.super_class = ObjectType;
      return objc_msgSendSuper2(&v18, sel_init);
    }
  }
  else
  {
    v5 = &v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher];
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((void *)v5 + 4) = 0;
    v6 = v1;
  }
  sub_24B3C7E5C((uint64_t)&v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher]);

  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t DiagnosticPatternMatching.getMatcherType()()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____SwiftDiagnosticPatternMatching_type);
}

Swift::Bool __swiftcall DiagnosticPatternMatching.isPatternPayloadAvailable()()
{
  sub_24B3C8100(v0 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)v3);
  if (v4) {
    BOOL v1 = sub_24B3CC790();
  }
  else {
    BOOL v1 = 0;
  }
  sub_24B3C7E5C((uint64_t)v3);
  return v1;
}

uint64_t DiagnosticPatternMatching.lookForPatternAsync(report:takeAction:callback:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B3C87B0(a1, a3, a4);
}

uint64_t sub_24B3C78F4(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  sub_24B3C8100(a1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)v7);
  if (v7[3]) {
    char v5 = sub_24B3CC918(a2);
  }
  else {
    char v5 = 0;
  }
  sub_24B3C7E5C((uint64_t)v7);
  return a3(v5 & 1);
}

uint64_t sub_24B3C79E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id DiagnosticPatternMatching.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void DiagnosticPatternMatching.init()()
{
}

id DiagnosticPatternMatching.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_24B3C7BC0(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24B3C7BD4(uint64_t a1, uint64_t a2)
{
  return sub_24B3C7D34(a1, a2, MEMORY[0x270FA9B98]);
}

uint64_t sub_24B3C7BE0(uint64_t a1, id *a2)
{
  uint64_t result = sub_24B3D9F78();
  *a2 = 0;
  return result;
}

uint64_t sub_24B3C7C58(uint64_t a1, id *a2)
{
  char v3 = sub_24B3D9F88();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24B3C7CD8@<X0>(uint64_t *a1@<X8>)
{
  sub_24B3D9F98();
  uint64_t v2 = sub_24B3D9F68();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24B3C7D1C(uint64_t a1, uint64_t a2)
{
  return sub_24B3C7D34(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24B3C7D34(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24B3D9F98();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24B3C7D78()
{
  sub_24B3D9F98();
  sub_24B3D9FF8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24B3C7DCC()
{
  sub_24B3D9F98();
  sub_24B3DA458();
  sub_24B3D9FF8();
  uint64_t v0 = sub_24B3DA478();
  swift_bridgeObjectRelease();
  return v0;
}

_DWORD *sub_24B3C7E40@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_24B3C7E50(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24B3C7E5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4170);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_24B3C7F00()
{
  uint64_t v0 = sub_24B3D9F98();
  uint64_t v2 = v1;
  if (v0 == sub_24B3D9F98() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24B3DA3D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24B3C7F8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24B3D9F68();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24B3C7FD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24B3D9F98();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24B3C8000(uint64_t a1)
{
  uint64_t v2 = sub_24B3C8A50(&qword_2697C41C8);
  uint64_t v3 = sub_24B3C8A50(&qword_2697C41D0);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24B3C8098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B3C8100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24B3C8168()
{
  unint64_t result = qword_2697C4178;
  if (!qword_2697C4178)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697C4178);
  }
  return result;
}

unint64_t sub_24B3C81A8()
{
  unint64_t result = qword_2697C4180;
  if (!qword_2697C4180)
  {
    sub_24B3DA158();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4180);
  }
  return result;
}

unint64_t sub_24B3C81F4()
{
  unint64_t result = qword_2697C4190;
  if (!qword_2697C4190)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697C4188);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4190);
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

uint64_t _s15CoreDiagnostics25DiagnosticPatternMatchingC07lookForD06report10takeActionSbAA10CriterialsC_SbtF_0(void *a1)
{
  uint64_t v3 = (uint64_t)v1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher;
  sub_24B3C8100((uint64_t)v1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)&v12);
  uint64_t v4 = v13;
  sub_24B3C7E5C((uint64_t)&v12);
  if (v4)
  {
    sub_24B3C8100(v3, (uint64_t)&v12);
    if (v13) {
      char v10 = sub_24B3CC918(a1);
    }
    else {
      char v10 = 0;
    }
    sub_24B3C7E5C((uint64_t)&v12);
  }
  else
  {
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24B3D9F18();
    __swift_project_value_buffer(v5, (uint64_t)qword_2697C5500);
    v6 = v1;
    uint64_t v7 = sub_24B3D9EE8();
    os_log_type_t v8 = sub_24B3DA148();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67109120;
      LODWORD(v12) = *(_DWORD *)&v6[OBJC_IVAR____SwiftDiagnosticPatternMatching_type];
      sub_24B3DA1D8();

      _os_log_impl(&dword_24B3C5000, v7, v8, "there is no available matcher with type %u", v9, 8u);
      MEMORY[0x24C5D1F90](v9, -1, -1);
    }
    else
    {
    }
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_24B3C87B0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(NSObject **)&v3[OBJC_IVAR____SwiftDiagnosticPatternMatching_asyncQueue];
  os_log_type_t v8 = (void *)swift_allocObject();
  v8[2] = v3;
  v8[3] = a1;
  v8[4] = a2;
  v8[5] = a3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_24B3C8B60;
  *(void *)(v9 + 24) = v8;
  v15[4] = sub_24B3C8B7C;
  v15[5] = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_24B3C79E0;
  v15[3] = &block_descriptor;
  char v10 = _Block_copy(v15);
  uint64_t v11 = v3;
  id v12 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_async_and_wait(v7, v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticPatternMatching()
{
  return self;
}

uint64_t method lookup function for DiagnosticPatternMatching(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DiagnosticPatternMatching);
}

uint64_t dispatch thunk of DiagnosticPatternMatching.__allocating_init(type:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for pattern_matching_type(uint64_t a1)
{
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void sub_24B3C89A0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_24B3C89E8()
{
  return sub_24B3C8A50(&qword_2697C41B0);
}

uint64_t sub_24B3C8A1C()
{
  return sub_24B3C8A50(&qword_2697C41B8);
}

uint64_t sub_24B3C8A50(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24B3C8A94()
{
  return sub_24B3C8A50(&qword_2697C41C0);
}

uint64_t sub_24B3C8AC8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24B3C8B00(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_24B3C8B18()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24B3C8B60()
{
  return sub_24B3C78F4(*(void *)(v0 + 16), *(void **)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_24B3C8B6C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24B3C8B7C()
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id Criterials.__allocating_init(id:type:path:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (char *)objc_allocWithZone(v6);
  uint64_t v14 = &v13[OBJC_IVAR____SwiftCriterials_incidentID];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  uint64_t v15 = &v13[OBJC_IVAR____SwiftCriterials_logType];
  *(void *)uint64_t v15 = a3;
  *((void *)v15 + 1) = a4;
  uint64_t v16 = &v13[OBJC_IVAR____SwiftCriterials_panicReportPath];
  *(void *)uint64_t v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id Criterials.init(id:type:path:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = &v6[OBJC_IVAR____SwiftCriterials_incidentID];
  *(void *)uint64_t v7 = a1;
  *((void *)v7 + 1) = a2;
  os_log_type_t v8 = &v6[OBJC_IVAR____SwiftCriterials_logType];
  *(void *)os_log_type_t v8 = a3;
  *((void *)v8 + 1) = a4;
  uint64_t v9 = &v6[OBJC_IVAR____SwiftCriterials_panicReportPath];
  *(void *)uint64_t v9 = a5;
  *((void *)v9 + 1) = a6;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for Criterials();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for Criterials()
{
  return self;
}

id Criterials.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void Criterials.init()()
{
}

id Criterials.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Criterials();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for Criterials(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Criterials);
}

uint64_t dispatch thunk of Criterials.__allocating_init(id:type:path:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_24B3C8F28()
{
  uint64_t v0 = sub_24B3D9F18();
  __swift_allocate_value_buffer(v0, qword_2697C5500);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697C5500);
  return sub_24B3D9EF8();
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

id sub_24B3C900C(uint64_t a1)
{
  if (MEMORY[0x263F80E20])
  {
    id v1 = objc_msgSend(self, sel_clientWithIdentifier_, a1);
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_24B3D9F18();
    __swift_project_value_buffer(v2, (uint64_t)qword_2697C5500);
    uint64_t v3 = sub_24B3D9EE8();
    os_log_type_t v4 = sub_24B3DA148();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_24B3C5000, v3, v4, "found trial clinet", v5, 2u);
      MEMORY[0x24C5D1F90](v5, -1, -1);
    }
  }
  else
  {
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24B3D9F18();
    __swift_project_value_buffer(v6, (uint64_t)qword_2697C5500);
    uint64_t v7 = sub_24B3D9EE8();
    os_log_type_t v8 = sub_24B3DA148();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_24B3C5000, v7, v8, "Trial is not available on this OS", v9, 2u);
      MEMORY[0x24C5D1F90](v9, -1, -1);
    }

    return 0;
  }
  return v1;
}

ValueMetadata *type metadata accessor for PanicMatcher()
{
  return &type metadata for PanicMatcher;
}

uint64_t sub_24B3C91EC(char a1)
{
  return *(void *)&aTelemetraction[8 * a1];
}

uint64_t sub_24B3C920C(char *a1, char *a2)
{
  return sub_24B3C9218(*a1, *a2);
}

uint64_t sub_24B3C9218(char a1, char a2)
{
  if (*(void *)&aTelemetraction[8 * a1] == *(void *)&aTelemetraction[8 * a2]
    && *(void *)&aYMode[8 * a1] == *(void *)&aYMode[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24B3DA3D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24B3C92A0()
{
  return sub_24B3C92A8();
}

uint64_t sub_24B3C92A8()
{
  return sub_24B3DA478();
}

uint64_t sub_24B3C9314()
{
  return sub_24B3C931C();
}

uint64_t sub_24B3C931C()
{
  sub_24B3D9FF8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24B3C9370()
{
  return sub_24B3C9378();
}

uint64_t sub_24B3C9378()
{
  return sub_24B3DA478();
}

uint64_t sub_24B3C93E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24B3CDCAC();
  *a1 = result;
  return result;
}

uint64_t sub_24B3C9410@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24B3C91EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24B3C943C()
{
  return sub_24B3C91EC(*v0);
}

uint64_t sub_24B3C9444@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24B3CDCAC();
  *a1 = result;
  return result;
}

uint64_t sub_24B3C946C()
{
  return 0;
}

void sub_24B3C9478(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24B3C9484(uint64_t a1)
{
  unint64_t v2 = sub_24B3CDFA8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24B3C94C0(uint64_t a1)
{
  unint64_t v2 = sub_24B3CDFA8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24B3C94FC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4290);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B3CDFA8();
  sub_24B3DA4A8();
  LOBYTE(v13[0]) = 0;
  sub_24B3DA3A8();
  if (!v2)
  {
    char v10 = *(unsigned char *)(v3 + 20);
    LOBYTE(v13[0]) = 1;
    char v15 = v10;
    sub_24B3DA398();
    long long v11 = *(_OWORD *)(v3 + 40);
    v13[0] = *(_OWORD *)(v3 + 24);
    v13[1] = v11;
    v13[2] = *(_OWORD *)(v3 + 56);
    uint64_t v14 = *(void *)(v3 + 72);
    char v15 = 2;
    sub_24B3CE050();
    sub_24B3DA3B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

__n128 sub_24B3C96C0@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24B3CDCF8(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_24B3C970C(void *a1)
{
  return sub_24B3C94FC(a1);
}

uint64_t sub_24B3C9724(char a1)
{
  return *(void *)&aBugtype_0[8 * a1];
}

BOOL sub_24B3C9744(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24B3C9758()
{
  return sub_24B3DA478();
}

uint64_t sub_24B3C97A0()
{
  return sub_24B3DA468();
}

uint64_t sub_24B3C97CC()
{
  return sub_24B3DA478();
}

uint64_t sub_24B3C9810(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C42D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B3CE874();
  sub_24B3DA4A8();
  LOBYTE(v12) = 0;
  sub_24B3DA3A8();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_24B3DA3A8();
    long long v12 = *(_OWORD *)(v3 + 32);
    uint64_t v13 = *(void *)(v3 + 48);
    v11[15] = 2;
    sub_24B3CE91C();
    sub_24B3DA3B8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_24B3C99B8()
{
  return sub_24B3C9724(*v0);
}

uint64_t sub_24B3C99C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24B3CE46C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24B3C99E8(uint64_t a1)
{
  unint64_t v2 = sub_24B3CE874();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24B3C9A24(uint64_t a1)
{
  unint64_t v2 = sub_24B3CE874();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_24B3C9A60@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24B3CE5AC(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_24B3C9AB0(void *a1)
{
  return sub_24B3C9810(a1);
}

uint64_t sub_24B3C9AC8(char a1)
{
  if (a1) {
    return 0x61724663696E6170;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_24B3C9B0C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[0] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4318);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  char v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B3CF130();
  sub_24B3DA4A8();
  char v14 = 0;
  sub_24B3DA3A8();
  if (!v4)
  {
    v12[1] = v12[0];
    char v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4308);
    sub_24B3CF184(&qword_2697C4320);
    sub_24B3DA388();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

BOOL sub_24B3C9CC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24B3C9CE0()
{
  return sub_24B3C9AC8(*v0);
}

uint64_t sub_24B3C9CE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24B3CEDE8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24B3C9D10(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24B3C9D1C(uint64_t a1)
{
  unint64_t v2 = sub_24B3CF130();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24B3C9D58(uint64_t a1)
{
  unint64_t v2 = sub_24B3CF130();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24B3C9D94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_24B3CEEE8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_24B3C9DC4(void *a1)
{
  return sub_24B3C9B0C(a1, *v1, v1[1], v1[2]);
}

void sub_24B3C9DE4()
{
  qword_2697C5520 = MEMORY[0x263F8EE78];
}

uint64_t sub_24B3C9DF8(uint64_t a1, unint64_t a2)
{
  uint64_t v82 = sub_24B3DA2A8();
  uint64_t v84 = *(void *)(v82 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v82, v4);
  uint64_t v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v5, v8);
  v78 = (char *)&v70 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  v80 = (char *)&v70 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12, v14);
  v17 = (char *)&v70 - v16;
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  v85 = (char *)&v70 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19, v21);
  v24 = (char *)&v70 - v23;
  uint64_t v26 = MEMORY[0x270FA5388](v22, v25);
  v28 = (char *)&v70 - v27;
  uint64_t v30 = MEMORY[0x270FA5388](v26, v29);
  *(void *)&long long v86 = (char *)&v70 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30, v32);
  v35 = (char *)&v70 - v34;
  uint64_t v37 = MEMORY[0x270FA5388](v33, v36);
  v72 = (char *)&v70 - v38;
  MEMORY[0x270FA5388](v37, v39);
  v73 = (char *)&v70 - v40;
  uint64_t v83 = sub_24B3DA2B8();
  uint64_t v81 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83, v41);
  if (qword_2697C4150 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_24B3D9F18();
  uint64_t v43 = __swift_project_value_buffer(v42, (uint64_t)qword_2697C5500);
  swift_bridgeObjectRetain_n();
  uint64_t v87 = v43;
  v44 = sub_24B3D9EE8();
  os_log_type_t v45 = sub_24B3DA148();
  BOOL v46 = os_log_type_enabled(v44, v45);
  v75 = v35;
  v77 = v24;
  v79 = v7;
  v74 = v28;
  v76 = v17;
  if (v46)
  {
    v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v90 = v48;
    *(_DWORD *)v47 = 136315138;
    swift_bridgeObjectRetain();
    v89[0] = sub_24B3D3974(a1, a2, &v90);
    sub_24B3DA1D8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24B3C5000, v44, v45, "read %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D1F90](v48, -1, -1);
    MEMORY[0x24C5D1F90](v47, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v49 = sub_24B3D9E58();
  uint64_t v50 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49, v51);
  v53 = (char *)&v70 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B3D9E18();
  uint64_t v54 = sub_24B3D9E68();
  unint64_t v56 = v55;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v49);
  sub_24B3CD6E8(v54, v56);
  if (qword_2697C4158 != -1) {
    swift_once();
  }
  sub_24B3D9D08();
  swift_allocObject();
  sub_24B3D9CF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4240);
  sub_24B3CD740();
  sub_24B3D9CE8();
  sub_24B3CD808(v54, v56);
  swift_release();
  v57 = sub_24B3CBC44(v90);
  swift_bridgeObjectRelease();
  qword_2697C5520 = (uint64_t)v57;
  swift_bridgeObjectRelease();
  uint64_t v58 = *(void *)(qword_2697C5520 + 16);
  if (v58)
  {
    uint64_t v71 = v54;
    unint64_t v70 = v56;
    uint64_t v59 = qword_2697C5520 + 32;
    v85 = (char *)qword_2697C5520;
    swift_bridgeObjectRetain();
    *(void *)&long long v60 = 136315138;
    long long v86 = v60;
    do
    {
      sub_24B3CD860(v59, (uint64_t)&v90);
      v61 = sub_24B3D9EE8();
      os_log_type_t v62 = sub_24B3DA148();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        uint64_t v88 = v64;
        *(_DWORD *)uint64_t v63 = v86;
        sub_24B3CD860((uint64_t)&v90, (uint64_t)v89);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4270);
        uint64_t v65 = sub_24B3D9FA8();
        *(void *)(v63 + 4) = sub_24B3D3974(v65, v66, &v88);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
        _os_log_impl(&dword_24B3C5000, v61, v62, "%s", (uint8_t *)v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5D1F90](v64, -1, -1);
        MEMORY[0x24C5D1F90](v63, -1, -1);
      }
      else
      {

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
      }
      v59 += 40;
      --v58;
    }
    while (v58);
    swift_bridgeObjectRelease();
    uint64_t v67 = v71;
    unint64_t v68 = v70;
  }
  else
  {
    uint64_t v67 = v54;
    unint64_t v68 = v56;
  }
  sub_24B3CD808(v67, v68);
  return 1;
}

void *sub_24B3CB7C4(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4238);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24B3DAF10;
  *(void *)(inited + 32) = 0x556E726574746170;
  *(void *)(inited + 40) = 0xEB00000000444955;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24B3D9F68();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = 0x6E6F69746361;
  *(void *)(inited + 64) = 0xE600000000000000;
  swift_beginAccess();
  *(void *)(inited + 72) = sub_24B3DA488();
  *(void *)(inited + 80) = 0x657079745F677562;
  *(void *)(inited + 88) = 0xE800000000000000;
  uint64_t result = __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v7 = result[3];
  unint64_t v8 = result[4];
  uint64_t v9 = HIBYTE(v8) & 0xF;
  uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v8) & 0xF;
  }
  else {
    uint64_t v11 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v11) {
    goto LABEL_35;
  }
  if ((v8 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24B3D4060(v7, v8, 10);
    swift_bridgeObjectRelease();
LABEL_35:
    *(void *)(inited + 96) = sub_24B3DA1C8();
    return (void *)sub_24B3D09E4(inited);
  }
  if ((v8 & 0x2000000000000000) == 0)
  {
    if ((v7 & 0x1000000000000000) != 0) {
      uint64_t v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v12 = (unsigned __int8 *)sub_24B3DA2C8();
    }
    sub_24B3D4048(v12, v10, 10);
    goto LABEL_35;
  }
  v30[0] = result[3];
  v30[1] = v8 & 0xFFFFFFFFFFFFFFLL;
  if (v7 == 43)
  {
    if (v9)
    {
      if (v9 != 1 && (BYTE1(v7) - 48) <= 9u && v9 != 2 && (BYTE2(v7) - 48) <= 9u)
      {
        unint64_t v16 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
        uint64_t v17 = v9 - 3;
        if (v17)
        {
          uint64_t v18 = (unsigned __int8 *)v30 + 3;
          do
          {
            unsigned int v19 = *v18 - 48;
            if (v19 > 9) {
              break;
            }
            if (!is_mul_ok(v16, 0xAuLL)) {
              break;
            }
            BOOL v14 = __CFADD__(10 * v16, v19);
            unint64_t v16 = 10 * v16 + v19;
            if (v14) {
              break;
            }
            ++v18;
            --v17;
          }
          while (v17);
        }
      }
      goto LABEL_35;
    }
  }
  else
  {
    if (v7 != 45)
    {
      if (v9)
      {
        if ((v7 - 48) <= 9u && v9 != 1 && (BYTE1(v7) - 48) <= 9u)
        {
          unint64_t v20 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
          uint64_t v21 = v9 - 2;
          if (v21)
          {
            uint64_t v22 = (unsigned __int8 *)v30 + 2;
            do
            {
              unsigned int v23 = *v22 - 48;
              if (v23 > 9) {
                break;
              }
              if (!is_mul_ok(v20, 0xAuLL)) {
                break;
              }
              BOOL v14 = __CFADD__(10 * v20, v23);
              unint64_t v20 = 10 * v20 + v23;
              if (v14) {
                break;
              }
              ++v22;
              --v21;
            }
            while (v21);
          }
        }
      }
      goto LABEL_35;
    }
    if (v9)
    {
      if (v9 != 1)
      {
        unsigned __int8 v13 = BYTE1(v7) - 48;
        if ((BYTE1(v7) - 48) <= 9u)
        {
          BOOL v14 = v13 == 0;
          unint64_t v15 = -(uint64_t)v13;
          if (v14 && v9 != 2)
          {
            unsigned __int8 v24 = BYTE2(v7) - 48;
            if ((BYTE2(v7) - 48) <= 9u && is_mul_ok(v15, 0xAuLL))
            {
              unint64_t v25 = 10 * v15;
              unint64_t v26 = v25 - v24;
              if (v25 >= v24)
              {
                uint64_t v27 = v9 - 3;
                if (v27)
                {
                  v28 = (unsigned __int8 *)v30 + 3;
                  do
                  {
                    unsigned int v29 = *v28 - 48;
                    if (v29 > 9) {
                      break;
                    }
                    if (!is_mul_ok(v26, 0xAuLL)) {
                      break;
                    }
                    BOOL v14 = 10 * v26 >= v29;
                    unint64_t v26 = 10 * v26 - v29;
                    if (!v14) {
                      break;
                    }
                    ++v28;
                    --v27;
                  }
                  while (v27);
                }
              }
            }
          }
        }
      }
      goto LABEL_35;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_24B3CBBB8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_24B3CD6A8();
    uint64_t v4 = (void *)sub_24B3D9F48();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

long long *sub_24B3CBC44(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (long long *)MEMORY[0x263F8EE78];
  if (v1)
  {
    os_log_type_t v45 = (long long *)MEMORY[0x263F8EE78];
    sub_24B3D8CF8(0, v1, 0);
    uint64_t v2 = v45;
    uint64_t v4 = (void *)(a1 + 104);
    do
    {
      uint64_t v37 = v2;
      int64_t v38 = v1;
      uint64_t v5 = *(v4 - 9);
      uint64_t v6 = *(v4 - 8);
      int v7 = *((_DWORD *)v4 - 14);
      char v8 = *((unsigned char *)v4 - 52);
      uint64_t v9 = *(v4 - 6);
      uint64_t v10 = *(v4 - 5);
      uint64_t v11 = *(v4 - 3);
      unint64_t v36 = *(v4 - 4);
      uint64_t v12 = *(v4 - 1);
      *(void *)&long long v35 = *(v4 - 2);
      uint64_t v13 = *v4;
      uint64_t v43 = &type metadata for PanicPayload;
      v44 = &off_26FE7D650;
      uint64_t v14 = swift_allocObject();
      v42[0] = v14;
      *(void *)(v14 + 16) = v5;
      *(void *)(v14 + 24) = v6;
      *(_DWORD *)(v14 + 32) = v7;
      *(unsigned char *)(v14 + 36) = v8;
      unint64_t v15 = v36;
      unint64_t v16 = v37;
      *(void *)(v14 + 40) = v9;
      *(void *)(v14 + 48) = v10;
      *(void *)(v14 + 56) = v15;
      *(void *)(v14 + 64) = v11;
      *(void *)(v14 + 72) = v35;
      *(void *)(v14 + 80) = v12;
      *(void *)(v14 + 88) = v13;
      unint64_t v18 = *((void *)v16 + 2);
      unint64_t v17 = *((void *)v16 + 3);
      os_log_type_t v45 = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v36 = v18;
      unsigned int v19 = &type metadata for PanicPayload;
      if (v18 >= v17 >> 1)
      {
        sub_24B3D8CF8(v17 > 1, v18 + 1, 1);
        unsigned int v19 = v43;
        unint64_t v16 = v45;
      }
      v4 += 10;
      uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, (uint64_t)v19);
      uint64_t v37 = &v33;
      MEMORY[0x270FA5388](v20, v20);
      uint64_t v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v23 + 16))(v22);
      unsigned __int8 v24 = v16;
      uint64_t v25 = *(void *)v22;
      uint64_t v26 = *((void *)v22 + 1);
      int v27 = *((_DWORD *)v22 + 4);
      char v28 = v22[20];
      long long v29 = *(_OWORD *)(v22 + 24);
      long long v34 = *(_OWORD *)(v22 + 40);
      long long v35 = v29;
      long long v33 = *(_OWORD *)(v22 + 56);
      uint64_t v30 = *((void *)v22 + 9);
      uint64_t v40 = &type metadata for PanicPayload;
      uint64_t v41 = &off_26FE7D650;
      uint64_t v31 = swift_allocObject();
      *(void *)&long long v39 = v31;
      *(void *)(v31 + 16) = v25;
      *(void *)(v31 + 24) = v26;
      uint64_t v2 = v24;
      *(_DWORD *)(v31 + 32) = v27;
      *(unsigned char *)(v31 + 36) = v28;
      *(_OWORD *)(v31 + 40) = v35;
      *(_OWORD *)(v31 + 56) = v34;
      *(_OWORD *)(v31 + 72) = v33;
      *(void *)(v31 + 88) = v30;
      *((void *)v24 + 2) = v18 + 1;
      sub_24B3CD55C(&v39, (uint64_t)v24 + 40 * v36 + 32);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      int64_t v1 = v38 - 1;
    }
    while (v38 != 1);
  }
  return v2;
}

id sub_24B3CBF0C()
{
  if (qword_2697C4150 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24B3D9F18();
  __swift_project_value_buffer(v0, (uint64_t)qword_2697C5500);
  int64_t v1 = sub_24B3D9EE8();
  os_log_type_t v2 = sub_24B3DA148();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_24B3C5000, v1, v2, "update panic payloads", v3, 2u);
    MEMORY[0x24C5D1F90](v3, -1, -1);
  }

  uint64_t v4 = (void *)qword_2697C5518;
  if (!qword_2697C5518)
  {
    uint64_t v5 = sub_24B3D9EE8();
    os_log_type_t v6 = sub_24B3DA148();
    if (os_log_type_enabled(v5, v6))
    {
      int v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_24B3C5000, v5, v6, "No payloadManager", v7, 2u);
      MEMORY[0x24C5D1F90](v7, -1, -1);
    }

    uint64_t v4 = (void *)qword_2697C5518;
    if (!qword_2697C5518) {
      goto LABEL_10;
    }
  }
  id v8 = v4;
  objc_msgSend(v8, sel_refresh);
  uint64_t v9 = (void *)sub_24B3D9F68();
  uint64_t v10 = (void *)sub_24B3D9F68();
  id v11 = objc_msgSend(v8, sel_levelForFactor_withNamespaceName_, v9, v10);

  objc_msgSend(v8, sel_dispose);
  if (!v11)
  {
LABEL_10:
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F80E80]), sel_init);
    uint64_t v13 = (void *)sub_24B3D9F68();
    objc_msgSend(v12, sel_setPath_, v13);

    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F80E90]), sel_init);
  }
  id result = objc_msgSend(v11, sel_fileValue);
  if (result)
  {
    unint64_t v15 = result;
    unsigned int v16 = objc_msgSend(result, sel_hasPath);

    if (!v16) {
      goto LABEL_17;
    }
    id result = objc_msgSend(v11, sel_fileValue);
    if (result)
    {
      unint64_t v17 = result;
      id v18 = objc_msgSend(result, sel_path);

      if (v18)
      {
        uint64_t v19 = sub_24B3D9F98();
        unint64_t v21 = v20;

        swift_bridgeObjectRetain_n();
        uint64_t v22 = sub_24B3D9EE8();
        os_log_type_t v23 = sub_24B3DA148();
        if (os_log_type_enabled(v22, v23))
        {
          unsigned __int8 v24 = (uint8_t *)swift_slowAlloc();
          uint64_t v25 = swift_slowAlloc();
          uint64_t v29 = v25;
          *(_DWORD *)unsigned __int8 v24 = 136315138;
          swift_bridgeObjectRetain();
          sub_24B3D3974(v19, v21, &v29);
          sub_24B3DA1D8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24B3C5000, v22, v23, "found Trial payload at %s", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5D1F90](v25, -1, -1);
          MEMORY[0x24C5D1F90](v24, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        return (id)v19;
      }
LABEL_17:
      uint64_t v26 = sub_24B3D9EE8();
      os_log_type_t v27 = sub_24B3DA148();
      if (os_log_type_enabled(v26, v27))
      {
        char v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v28 = 0;
        _os_log_impl(&dword_24B3C5000, v26, v27, "No valid assets in trial level for factor panicPayloadV1", v28, 2u);
        MEMORY[0x24C5D1F90](v28, -1, -1);
      }

      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24B3CC3C0()
{
  if (!MEMORY[0x263F80E20])
  {
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24B3D9F18();
    __swift_project_value_buffer(v1, (uint64_t)qword_2697C5500);
    os_log_type_t v2 = sub_24B3D9EE8();
    os_log_type_t v3 = sub_24B3DA148();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_24B3C5000, v2, v3, "Trial is not available on this OS", v4, 2u);
      MEMORY[0x24C5D1F90](v4, -1, -1);
    }

    uint64_t v5 = (void *)qword_2697C5518;
    qword_2697C5518 = 0;

    return 1;
  }
  if (qword_2697C5518) {
    return 0;
  }
  id v6 = sub_24B3C900C(332);
  int v7 = (void *)qword_2697C5518;
  qword_2697C5518 = (uint64_t)v6;

  id v8 = sub_24B3CBF0C();
  if (v9)
  {
    uint64_t v10 = (uint64_t)v8;
    unint64_t v11 = v9;
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_24B3D9F18();
    __swift_project_value_buffer(v12, (uint64_t)qword_2697C5500);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_24B3D9EE8();
    os_log_type_t v14 = sub_24B3DA148();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v23 = v16;
      *(_DWORD *)unint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_24B3D3974(v10, v11, &v23);
      sub_24B3DA1D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24B3C5000, v13, v14, "panic payload %s updated", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5D1F90](v16, -1, -1);
      MEMORY[0x24C5D1F90](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    char v22 = sub_24B3C9DF8(v10, v11);
    swift_bridgeObjectRelease();
    if (v22) {
      return 0;
    }
    id v18 = sub_24B3D9EE8();
    os_log_type_t v19 = sub_24B3DA148();
    if (!os_log_type_enabled(v18, v19)) {
      goto LABEL_23;
    }
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v20 = 0;
    unint64_t v21 = "Failed to parse payload";
  }
  else
  {
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24B3D9F18();
    __swift_project_value_buffer(v17, (uint64_t)qword_2697C5500);
    id v18 = sub_24B3D9EE8();
    os_log_type_t v19 = sub_24B3DA148();
    if (!os_log_type_enabled(v18, v19)) {
      goto LABEL_23;
    }
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v20 = 0;
    unint64_t v21 = "Failed to find panic payload from Trial";
  }
  _os_log_impl(&dword_24B3C5000, v18, v19, v21, v20, 2u);
  MEMORY[0x24C5D1F90](v20, -1, -1);
LABEL_23:

  return 1;
}

BOOL sub_24B3CC790()
{
  if (qword_2697C4150 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24B3D9F18();
  __swift_project_value_buffer(v0, (uint64_t)qword_2697C5500);
  uint64_t v1 = sub_24B3D9EE8();
  os_log_type_t v2 = sub_24B3DA148();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v3 = 134217984;
    if (qword_2697C4158 != -1) {
      swift_once();
    }
    sub_24B3DA1D8();
    _os_log_impl(&dword_24B3C5000, v1, v2, "payloads count %ld", v3, 0xCu);
    MEMORY[0x24C5D1F90](v3, -1, -1);
  }

  if (qword_2697C4158 != -1) {
    swift_once();
  }
  return *(void *)(qword_2697C5520 + 16) != 0;
}

uint64_t sub_24B3CC918(void *a1)
{
  uint64_t v2 = sub_24B3D9F18();
  uint64_t v88 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4200);
  MEMORY[0x270FA5388](v6 - 8, v7);
  v76 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4208);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!qword_2697C5518) {
    goto LABEL_33;
  }
  if (qword_2697C4158 != -1) {
    swift_once();
  }
  uint64_t v69 = qword_2697C5520;
  uint64_t v14 = *(void *)(qword_2697C5520 + 16);
  if (!v14)
  {
LABEL_33:
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_2697C5500);
    v61 = sub_24B3D9EE8();
    os_log_type_t v62 = sub_24B3DA148();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v63 = 0;
      _os_log_impl(&dword_24B3C5000, v61, v62, "There is no panic payload available", v63, 2u);
      MEMORY[0x24C5D1F90](v63, -1, -1);
    }

    char v64 = 0;
    goto LABEL_38;
  }
  type metadata accessor for PanicCriterials();
  uint64_t v15 = swift_dynamicCastClass();
  if (!v15)
  {
    char v64 = 1;
LABEL_38:
    sub_24B3CD3E4();
    swift_allocError();
    *uint64_t v65 = v64;
    swift_willThrow();
    return v66 & 1;
  }
  uint64_t v16 = v15;
  uint64_t v87 = v13;
  uint64_t v74 = v9;
  v75 = v5;
  uint64_t v17 = swift_allocObject();
  uint64_t v81 = swift_allocObject();
  id v18 = (_DWORD *)(v81 + 16);
  v73 = (uint64_t *)(v16 + OBJC_IVAR____SwiftPanicCriterials_panicReasonString);
  uint64_t v19 = v69 + 32;
  id v20 = a1;
  uint64_t v21 = v17;
  id v68 = v20;
  swift_bridgeObjectRetain();
  long long v86 = v18;
  swift_beginAccess();
  char v22 = 0;
  int v80 = 0;
  v72 = (void (**)(char *, uint64_t, uint64_t))(v88 + 16);
  uint64_t v71 = (void (**)(char *, uint64_t))(v88 + 8);
  unint64_t v70 = (void (**)(char *, uint64_t))(v10 + 8);
  v79 = &v91;
  *(void *)&long long v23 = 136315138;
  long long v82 = v23;
  uint64_t v78 = MEMORY[0x263F8EE58] + 8;
  unint64_t v77 = 0x800000024B3DB890;
  uint64_t v83 = v2;
  unsigned __int8 v24 = v84;
  uint64_t v85 = v21;
  do
  {
    sub_24B3CD860(v19, (uint64_t)&v97);
    uint64_t v25 = __swift_project_boxed_opaque_existential_1(&v97, v98);
    uint64_t v27 = v25[5];
    uint64_t v26 = v25[6];
    swift_bridgeObjectRetain();
    if (v22) {
      swift_bridgeObjectRelease();
    }
    *(void *)(v21 + 16) = v27;
    *(void *)(v21 + 24) = v26;
    char v28 = __swift_project_boxed_opaque_existential_1(&v97, v98);
    int v29 = *((_DWORD *)v28 + 4);
    if (*((unsigned char *)v28 + 20)) {
      int v29 = 0;
    }
    *long long v86 = v29;
    BOOL v96 = 0;
    if (qword_2697C4150 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v2, (uint64_t)qword_2697C5500);
    sub_24B3CD860((uint64_t)&v97, (uint64_t)&aBlock);
    uint64_t v31 = sub_24B3D9EE8();
    os_log_type_t v32 = sub_24B3DA148();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v88 = v14;
    if (v33)
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(void *)&long long v95 = v35;
      *(_DWORD *)uint64_t v34 = v82;
      unint64_t v36 = __swift_project_boxed_opaque_existential_1(&aBlock, (uint64_t)v92);
      uint64_t v37 = v36[7];
      unint64_t v38 = v36[8];
      swift_bridgeObjectRetain();
      *(void *)(v34 + 4) = sub_24B3D3974(v37, v38, (uint64_t *)&v95);
      uint64_t v2 = v83;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
      _os_log_impl(&dword_24B3C5000, v31, v32, "create a regex %s", (uint8_t *)v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5D1F90](v35, -1, -1);
      MEMORY[0x24C5D1F90](v34, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
    }

    __swift_project_boxed_opaque_existential_1(&v97, v98);
    swift_bridgeObjectRetain();
    long long v39 = v87;
    sub_24B3D9ED8();
    if (v24)
    {
      uint64_t v40 = sub_24B3D9EE8();
      os_log_type_t v41 = sub_24B3DA148();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v42 = 0;
        _os_log_impl(&dword_24B3C5000, v40, v41, "Failed to create regex", v42, 2u);
        MEMORY[0x24C5D1F90](v42, -1, -1);
      }

      unsigned __int8 v24 = 0;
    }
    else
    {
      uint64_t v84 = 0;
      uint64_t v43 = v73[1];
      uint64_t aBlock = *v73;
      uint64_t v90 = v43;
      sub_24B3D9EC8();
      sub_24B3CD598();
      sub_24B3CD5EC();
      uint64_t v44 = (uint64_t)v76;
      uint64_t v45 = v74;
      sub_24B3D9F58();
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4228);
      BOOL v47 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 48))(v44, 1, v46) != 1;
      sub_24B3CD648(v44);
      swift_beginAccess();
      BOOL v96 = v47;
      uint64_t v48 = v75;
      (*v72)(v75, v30, v2);
      uint64_t v49 = sub_24B3D9EE8();
      os_log_type_t v50 = sub_24B3DA148();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = v48;
        uint64_t v52 = swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        uint64_t aBlock = v53;
        *(_DWORD *)uint64_t v52 = v82;
        if (v96) {
          uint64_t v54 = 7562585;
        }
        else {
          uint64_t v54 = 28494;
        }
        if (v96) {
          unint64_t v55 = 0xE300000000000000;
        }
        else {
          unint64_t v55 = 0xE200000000000000;
        }
        *(void *)(v52 + 4) = sub_24B3D3974(v54, v55, &aBlock);
        uint64_t v2 = v83;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24B3C5000, v49, v50, "panic string matched: %s", (uint8_t *)v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5D1F90](v53, -1, -1);
        MEMORY[0x24C5D1F90](v52, -1, -1);

        (*v71)(v51, v2);
      }
      else
      {

        (*v71)(v48, v2);
      }
      (*v70)(v39, v45);
      unsigned __int8 v24 = v84;
    }
    uint64_t v56 = v88;
    uint64_t v21 = v85;
    swift_beginAccess();
    if (v96)
    {
      v57 = (void *)sub_24B3D9F68();
      sub_24B3CD860((uint64_t)&v97, (uint64_t)&v95);
      uint64_t v58 = swift_allocObject();
      uint64_t v59 = v81;
      *(void *)(v58 + 16) = v21;
      *(void *)(v58 + 24) = v59;
      sub_24B3CD55C(&v95, v58 + 32);
      v93 = sub_24B3CD574;
      uint64_t v94 = v58;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v90 = 1107296256;
      v91 = sub_24B3CBBB8;
      v92 = &block_descriptor_0;
      long long v60 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v60);

      int v80 = 1;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v97);
    v19 += 40;
    char v22 = 1;
    uint64_t v14 = v56 - 1;
  }
  while (v14);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_deallocUninitializedObject();
  char v66 = v80;
  return v66 & 1;
}

unint64_t sub_24B3CD3E4()
{
  unint64_t result = qword_2697C4210;
  if (!qword_2697C4210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4210);
  }
  return result;
}

uint64_t sub_24B3CD438()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24B3CD470()
{
  return MEMORY[0x270FA0238](v0, 20, 7);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

uint64_t sub_24B3CD514()
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24B3CD55C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_24B3CD574()
{
  return sub_24B3CB7C4(v0[2], v0[3], v0 + 4);
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

unint64_t sub_24B3CD598()
{
  unint64_t result = qword_2697C4218;
  if (!qword_2697C4218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4218);
  }
  return result;
}

unint64_t sub_24B3CD5EC()
{
  unint64_t result = qword_2697C4220;
  if (!qword_2697C4220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697C4208);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4220);
  }
  return result;
}

uint64_t sub_24B3CD648(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4200);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24B3CD6A8()
{
  unint64_t result = qword_2697C4230;
  if (!qword_2697C4230)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697C4230);
  }
  return result;
}

uint64_t sub_24B3CD6E8(uint64_t a1, unint64_t a2)
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

unint64_t sub_24B3CD740()
{
  unint64_t result = qword_2697C4248;
  if (!qword_2697C4248)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697C4240);
    sub_24B3CD7B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4248);
  }
  return result;
}

unint64_t sub_24B3CD7B4()
{
  unint64_t result = qword_2697C4250;
  if (!qword_2697C4250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4250);
  }
  return result;
}

uint64_t sub_24B3CD808(uint64_t a1, unint64_t a2)
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

uint64_t sub_24B3CD860(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24B3CD8C4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PanicPayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PanicPayload()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PanicPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PanicPayload(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for PanicPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PanicPayload(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PanicPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PanicPayload()
{
  return &type metadata for PanicPayload;
}

uint64_t sub_24B3CDCAC()
{
  unint64_t v0 = sub_24B3DA338();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_24B3CDCF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4278);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B3CDFA8();
  sub_24B3DA498();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v24) = 0;
  uint64_t v10 = sub_24B3DA368();
  uint64_t v12 = v11;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_24B3DA358();
  char v31 = 2;
  sub_24B3CDFFC();
  sub_24B3DA378();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v13 = v25;
  uint64_t v14 = v27;
  uint64_t v22 = v26;
  uint64_t v15 = v29;
  uint64_t v20 = v24;
  uint64_t v21 = v28;
  uint64_t v16 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  char v18 = BYTE4(v23);
  *(_DWORD *)(a2 + 16) = v23;
  *(unsigned char *)(a2 + 20) = v18 & 1;
  *(void *)(a2 + 24) = v20;
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v22;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v21;
  *(void *)(a2 + 64) = v15;
  *(void *)(a2 + 72) = v16;
  return result;
}

unint64_t sub_24B3CDFA8()
{
  unint64_t result = qword_2697C4280;
  if (!qword_2697C4280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4280);
  }
  return result;
}

unint64_t sub_24B3CDFFC()
{
  unint64_t result = qword_2697C4288;
  if (!qword_2697C4288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4288);
  }
  return result;
}

unint64_t sub_24B3CE050()
{
  unint64_t result = qword_2697C4298;
  if (!qword_2697C4298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4298);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_24B3CE0BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24B3CE0C8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PanicPayload.CodingKeys()
{
  return &type metadata for PanicPayload.CodingKeys;
}

uint64_t destroy for Pattern()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Pattern(void *a1, void *a2)
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

void *assignWithCopy for Pattern(void *a1, void *a2)
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

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for Pattern(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for Pattern(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Pattern(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Pattern()
{
  return &type metadata for Pattern;
}

unint64_t sub_24B3CE368()
{
  unint64_t result = qword_2697C42A0;
  if (!qword_2697C42A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42A0);
  }
  return result;
}

unint64_t sub_24B3CE3C0()
{
  unint64_t result = qword_2697C42A8;
  if (!qword_2697C42A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42A8);
  }
  return result;
}

unint64_t sub_24B3CE418()
{
  unint64_t result = qword_2697C42B0;
  if (!qword_2697C42B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42B0);
  }
  return result;
}

uint64_t sub_24B3CE46C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65707954677562 && a2 == 0xE700000000000000;
  if (v3 || (sub_24B3DA3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684632949 && a2 == 0xE400000000000000 || (sub_24B3DA3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6974696E69666564 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24B3DA3D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24B3CE5AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C42B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B3CE874();
  sub_24B3DA498();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v24) = 0;
  uint64_t v10 = sub_24B3DA368();
  uint64_t v12 = v11;
  uint64_t v23 = v10;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_24B3DA368();
  uint64_t v15 = v14;
  uint64_t v21 = v13;
  char v27 = 2;
  sub_24B3CE8C8();
  swift_bridgeObjectRetain();
  uint64_t v22 = v15;
  sub_24B3DA378();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v17 = v24;
  uint64_t v16 = v25;
  uint64_t v18 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v22;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v23;
  a2[1] = v12;
  a2[2] = v21;
  a2[3] = v19;
  a2[4] = v17;
  a2[5] = v16;
  a2[6] = v18;
  return result;
}

unint64_t sub_24B3CE874()
{
  unint64_t result = qword_2697C42C0;
  if (!qword_2697C42C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42C0);
  }
  return result;
}

unint64_t sub_24B3CE8C8()
{
  unint64_t result = qword_2697C42C8;
  if (!qword_2697C42C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42C8);
  }
  return result;
}

unint64_t sub_24B3CE91C()
{
  unint64_t result = qword_2697C42D8;
  if (!qword_2697C42D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42D8);
  }
  return result;
}

uint64_t _s15CoreDiagnostics12PanicPayloadV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15CoreDiagnostics12PanicPayloadV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24B3CEACCLL);
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

ValueMetadata *type metadata accessor for Pattern.CodingKeys()
{
  return &type metadata for Pattern.CodingKeys;
}

uint64_t destroy for Definition()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s15CoreDiagnostics10DefinitionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Definition(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Definition(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Definition(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Definition(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Definition()
{
  return &type metadata for Definition;
}

unint64_t sub_24B3CECE4()
{
  unint64_t result = qword_2697C42E0;
  if (!qword_2697C42E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42E0);
  }
  return result;
}

unint64_t sub_24B3CED3C()
{
  unint64_t result = qword_2697C42E8;
  if (!qword_2697C42E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42E8);
  }
  return result;
}

unint64_t sub_24B3CED94()
{
  unint64_t result = qword_2697C42F0;
  if (!qword_2697C42F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C42F0);
  }
  return result;
}

uint64_t sub_24B3CEDE8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024B3DB910 || (sub_24B3DA3D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61724663696E6170 && a2 == 0xEB0000000073656DLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24B3DA3D8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24B3CEEE8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C42F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  BOOL v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B3CF130();
  sub_24B3DA498();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v10[31] = 0;
    uint64_t v8 = sub_24B3DA368();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4308);
    v10[15] = 1;
    sub_24B3CF184(&qword_2697C4310);
    swift_bridgeObjectRetain();
    sub_24B3DA348();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v8;
}

unint64_t sub_24B3CF130()
{
  unint64_t result = qword_2697C4300;
  if (!qword_2697C4300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4300);
  }
  return result;
}

uint64_t sub_24B3CF184(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697C4308);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Definition.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Definition.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24B3CF344);
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

unsigned char *sub_24B3CF36C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Definition.CodingKeys()
{
  return &type metadata for Definition.CodingKeys;
}

unint64_t sub_24B3CF38C()
{
  unint64_t result = qword_2697C4328;
  if (!qword_2697C4328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4328);
  }
  return result;
}

unint64_t sub_24B3CF3E4()
{
  unint64_t result = qword_2697C4330;
  if (!qword_2697C4330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4330);
  }
  return result;
}

unint64_t sub_24B3CF43C()
{
  unint64_t result = qword_2697C4338;
  if (!qword_2697C4338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4338);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DiagnosticPatternMatchingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24B3CF568);
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

ValueMetadata *type metadata accessor for DiagnosticPatternMatchingError()
{
  return &type metadata for DiagnosticPatternMatchingError;
}

unint64_t sub_24B3CF5A4()
{
  if (*v0) {
    return 0xD000000000000025;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

uint64_t sub_24B3CF5E4()
{
  return sub_24B3D9DA8();
}

uint64_t sub_24B3CF5FC()
{
  return sub_24B3D9DB8();
}

uint64_t sub_24B3CF614()
{
  return sub_24B3D9D98();
}

unint64_t sub_24B3CF630()
{
  unint64_t result = qword_2697C4340;
  if (!qword_2697C4340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C4340);
  }
  return result;
}

uint64_t WriteJetsamMemoryReport(visibilityEndowmentSet:audioAssertionSet:)(void *a1, void *a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F08D70]);
  uint64_t v5 = (void *)sub_24B3D9F68();
  id v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, 4096);

  id v7 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FE7FA10);
  objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

  objc_msgSend(v6, sel_resume);
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = 0;
  uint64_t v19 = sub_24B3CF9A8;
  uint64_t v20 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_24B3CFBB4;
  uint64_t v18 = &block_descriptor_1;
  uint64_t v9 = _Block_copy(&aBlock);
  id v10 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);
  sub_24B3DA208();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17BE08);
  if (swift_dynamicCast())
  {
    if (a1) {
      a1 = (void *)sub_24B3DA0D8();
    }
    if (a2) {
      a2 = (void *)sub_24B3DA0D8();
    }
    uint64_t v19 = sub_24B3CFC34;
    uint64_t v20 = v8;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_24B3CFC74;
    uint64_t v18 = &block_descriptor_3;
    uint64_t v11 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_writeJetsamMemoryReportWithVisibilityEndowmentSet_audioAssertionSet_with_, a1, a2, v11);
    _Block_release(v11);
    swift_unknownObjectRelease();
  }
  objc_msgSend(v6, sel_invalidate);

  swift_beginAccess();
  uint64_t v12 = *(unsigned __int8 *)(v8 + 16);
  swift_release();
  return v12;
}

uint64_t sub_24B3CF998()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_24B3CF9A8(void *a1)
{
  uint64_t v2 = sub_24B3D9F18();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  id v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B3D9F08();
  MEMORY[0x24C5D1E70](a1);
  MEMORY[0x24C5D1E70](a1);
  id v7 = sub_24B3D9EE8();
  os_log_type_t v8 = sub_24B3DA138();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    v15[0] = v2;
    id v10 = (uint8_t *)v9;
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)id v10 = 138412290;
    MEMORY[0x24C5D1E70](a1);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v15[1] = v12;
    sub_24B3DA1D8();
    *uint64_t v11 = v12;

    _os_log_impl(&dword_24B3C5000, v7, v8, "Error connecting to remote object: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B17BE20);
    swift_arrayDestroy();
    MEMORY[0x24C5D1F90](v11, -1, -1);
    uint64_t v13 = v10;
    uint64_t v2 = v15[0];
    MEMORY[0x24C5D1F90](v13, -1, -1);
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_24B3CFBB4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
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

uint64_t sub_24B3CFC34(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_24B3CFC74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_24B3CFCCC(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_24B3DA238()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x263F8EE88];
    if (v2) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17BE28);
  uint64_t v3 = sub_24B3DA268();
  if (v2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    swift_retain();
    sub_24B3DA228();
    sub_24B3D06E4();
    sub_24B3D0724();
    uint64_t result = sub_24B3DA108();
    uint64_t v1 = v22;
    uint64_t v20 = v23;
    uint64_t v5 = v24;
    uint64_t v6 = v25;
    unint64_t v7 = v26;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
  uint64_t v20 = v1 + 56;
  uint64_t v5 = ~v8;
  uint64_t v9 = -v8;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v7 = v10 & *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  uint64_t v6 = 0;
LABEL_11:
  int64_t v19 = (unint64_t)(v5 + 64) >> 6;
  if (v1 < 0)
  {
    if (sub_24B3DA248())
    {
      sub_24B3D06E4();
      swift_dynamicCast();
      uint64_t v12 = v21;
LABEL_33:
      id v18 = v12;
      sub_24B3DA438();

      swift_release_n();
      sub_24B3D0770();
      return 0;
    }
    goto LABEL_34;
  }
  if (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7)) | (v6 << 6);
LABEL_32:
    uint64_t v12 = *(void **)(*(void *)(v1 + 48) + 8 * v11);
    id v17 = v12;
    goto LABEL_33;
  }
  int64_t v13 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v13 < v19)
    {
      unint64_t v14 = *(void *)(v20 + 8 * v13);
      uint64_t v15 = v6 + 1;
      if (v14) {
        goto LABEL_31;
      }
      uint64_t v15 = v6 + 2;
      if (v6 + 2 < v19)
      {
        unint64_t v14 = *(void *)(v20 + 8 * v15);
        if (v14) {
          goto LABEL_31;
        }
        uint64_t v15 = v6 + 3;
        if (v6 + 3 < v19)
        {
          unint64_t v14 = *(void *)(v20 + 8 * v15);
          if (v14) {
            goto LABEL_31;
          }
          uint64_t v15 = v6 + 4;
          if (v6 + 4 < v19)
          {
            unint64_t v14 = *(void *)(v20 + 8 * v15);
            if (v14) {
              goto LABEL_31;
            }
            uint64_t v15 = v6 + 5;
            if (v6 + 5 < v19)
            {
              unint64_t v14 = *(void *)(v20 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 6;
                while (v19 != v16)
                {
                  unint64_t v14 = *(void *)(v20 + 8 * v16++);
                  if (v14)
                  {
                    uint64_t v15 = v16 - 1;
                    goto LABEL_31;
                  }
                }
                goto LABEL_34;
              }
LABEL_31:
              unint64_t v11 = __clz(__rbit64(v14)) + (v15 << 6);
              goto LABEL_32;
            }
          }
        }
      }
    }
LABEL_34:
    swift_release();
    sub_24B3D0770();
    return v3;
  }
  __break(1u);
  return result;
}

id CompatibilityBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CompatibilityBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CompatibilityBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15CoreDiagnostics19CompatibilityBridgeC23WriteJetsamMemoryReport22visibilityEndowmentSet014audioAssertionK0SbShySo8NSNumberCGSg_AJtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24B3D9F18();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v31 - v11;
  if (!a1 || (int64_t v13 = (void *)sub_24B3CFCCC(a1)) == 0)
  {
    sub_24B3D9F08();
    swift_bridgeObjectRetain_n();
    unint64_t v14 = sub_24B3D9EE8();
    os_log_type_t v15 = sub_24B3DA138();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v31 = v4;
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v34 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v32 = v5;
      if (a1)
      {
        sub_24B3D06E4();
        sub_24B3D0724();
        uint64_t v18 = sub_24B3DA0F8();
        unint64_t v20 = v19;
      }
      else
      {
        uint64_t v18 = 0x7263736564206F4ELL;
        unint64_t v20 = 0xEE006E6F69747069;
      }
      uint64_t v33 = sub_24B3D3974(v18, v20, &v34);
      sub_24B3DA1D8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24B3C5000, v14, v15, "Unable to represent visibility endowments as a set as PIDs: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5D1F90](v17, -1, -1);
      MEMORY[0x24C5D1F90](v16, -1, -1);

      uint64_t v4 = v31;
      uint64_t v5 = v32;
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
    int64_t v13 = 0;
    if (!a2) {
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v21 = (void *)sub_24B3CFCCC(a2);
    if (v21) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  if (a2) {
    goto LABEL_12;
  }
LABEL_13:
  sub_24B3D9F08();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = sub_24B3D9EE8();
  os_log_type_t v23 = sub_24B3DA138();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v32 = v5;
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v34 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    if (a2)
    {
      sub_24B3D06E4();
      sub_24B3D0724();
      uint64_t v26 = sub_24B3DA0F8();
      unint64_t v28 = v27;
    }
    else
    {
      uint64_t v26 = 0x7263736564206F4ELL;
      unint64_t v28 = 0xEE006E6F69747069;
    }
    uint64_t v33 = sub_24B3D3974(v26, v28, &v34);
    sub_24B3DA1D8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B3C5000, v22, v23, "Unable to represent audio assertions as a set as PIDs: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5D1F90](v25, -1, -1);
    MEMORY[0x24C5D1F90](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v4);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
  uint64_t v21 = 0;
LABEL_20:
  char v29 = WriteJetsamMemoryReport(visibilityEndowmentSet:audioAssertionSet:)(v13, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v29 & 1;
}

uint64_t type metadata accessor for CompatibilityBridge()
{
  return self;
}

unint64_t sub_24B3D06E4()
{
  unint64_t result = qword_26B17BE10;
  if (!qword_26B17BE10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B17BE10);
  }
  return result;
}

unint64_t sub_24B3D0724()
{
  unint64_t result = qword_26B17BE18;
  if (!qword_26B17BE18)
  {
    sub_24B3D06E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17BE18);
  }
  return result;
}

uint64_t sub_24B3D0770()
{
  return swift_release();
}

uint64_t sub_24B3D0780(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_24B3DA2C8();
      }
      uint64_t v7 = (uint64_t)sub_24B3D43EC(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        os_log_type_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        unint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = sub_24B3D4078(result, a2, 10, (uint64_t (*)(void *, uint64_t, uint64_t))sub_24B3D43EC);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

unint64_t sub_24B3D09E4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C43B0);
  objc_super v2 = (void *)sub_24B3DA308();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24B3D9288(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_24B3D0B00(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C43A8);
  objc_super v2 = (void *)sub_24B3DA308();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24B3D9288(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

uint64_t sub_24B3D0C24(uint64_t result, uint64_t a2)
{
  if (result)
  {
    MEMORY[0x270FA5388](result, a2);
    return sub_24B3D9E28();
  }
  return result;
}

uint64_t sub_24B3D0CA8(const char *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, void *a6)
{
  uint64_t v10 = sub_24B3D9FB8();
  ssize_t v11 = getxattr(a1, (const char *)(v10 + 32), a4, a5, 0, 0);
  uint64_t result = swift_release();
  if (v11 >= 1)
  {
    *a6 = MEMORY[0x24C5D1580](a4);
    a6[1] = v13;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_24B3D0D44()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  objc_super v2 = self;
  uint64_t v4 = qword_26FE7D348;
  unint64_t v3 = unk_26FE7D350;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_24B3D0B00(v1);
  uint64_t v6 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v6 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    uint64_t v7 = sub_24B3D9F98();
    uint64_t v9 = v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v5;
    sub_24B3D970C(v4, v3, v7, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_24B3D0FB0(v5);
  swift_bridgeObjectRelease();
  ssize_t v11 = (void *)sub_24B3D9F48();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_24B3D6D88;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B3D1D74;
  aBlock[3] = &block_descriptor_2;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_iterateLogsWithOptions_usingBlock_, v11, v12);
  _Block_release(v12);

  swift_arrayDestroy();
  swift_beginAccess();
  if (*(void *)(*(void *)(v0 + 16) + 16))
  {
    BOOL v14 = *(void **)(v0 + 16);
    swift_bridgeObjectRetain_n();
    sub_24B3D4C04(&v14);
    swift_release();
    swift_bridgeObjectRelease();
    return v14;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t sub_24B3D0FB0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C43A0);
    uint64_t v2 = sub_24B3DA308();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_24B3D6EFC(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_24B3D6EFC(v35, v36);
    sub_24B3D6EFC(v36, &v32);
    uint64_t result = sub_24B3DA258();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_24B3D6EFC(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_24B3D0770();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24B3D1370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24B3D9F18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  int64_t v8 = (char *)v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B3D9D88();
  swift_allocObject();
  uint64_t v9 = sub_24B3D9D78();
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v66 = a1;
  uint64_t v67 = 0x657079745F677562;
  unint64_t v68 = 0xE800000000000000;
  uint64_t v69 = 128;
  unint64_t v70 = &v71;
  uint64_t v73 = 0;
  uint64_t v74 = v9;
  sub_24B3D4B54(sub_24B3D6E08);
  uint64_t result = swift_release();
  uint64_t v11 = v72;
  if (!v72) {
    return result;
  }
  v60[0] = a2;
  uint64_t v63 = v8;
  uint64_t v12 = v71;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4390);
  uint64_t v14 = *(void *)(*(void *)(v13 - 8) + 64);
  MEMORY[0x270FA5388](v13 - 8, v15);
  uint64_t v16 = sub_24B3D9EB8();
  v61 = *(void **)(v16 - 8);
  uint64_t v17 = (void (*)(uint64_t, uint64_t, uint64_t))v61[7];
  uint64_t v65 = (uint64_t)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = v16;
  v17(v65, 1, 1);
  char v64 = v60;
  if (v12 == 3487795 && v11 == 0xE300000000000000
    || ((char v18 = sub_24B3DA3D8(), v12 == 3617331) ? (v19 = v11 == 0xE300000000000000) : (v19 = 0),
        !v19 ? (char v20 = 0) : (char v20 = 1),
        (v18 & 1) != 0 || (v20 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v21 = sub_24B3DA3D8();
  uint64_t v22 = swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_15:
    v60[1] = v5;
    v60[2] = v4;
    uint64_t v24 = sub_24B3D9DE8();
    uint64_t v25 = *(void *)(v24 - 8);
    MEMORY[0x270FA5388](v24, v26);
    long long v28 = (char *)v60 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4350);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24B3DB590;
    uint64_t v30 = (void *)*MEMORY[0x263EFF618];
    *(void *)(inited + 32) = *MEMORY[0x263EFF618];
    id v31 = v30;
    sub_24B3D6610(inited);
    swift_setDeallocating();
    type metadata accessor for URLResourceKey(0);
    swift_arrayDestroy();
    sub_24B3D9E08();
    uint64_t v32 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v32, v33);
    sub_24B3D9DC8();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    uint64_t v34 = v65;
    sub_24B3D6DA8(v65);
    uint64_t v22 = sub_24B3D6E94((uint64_t)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v34);
  }
  uint64_t v63 = v60;
  uint64_t v35 = v61;
  uint64_t v36 = v61[8];
  uint64_t v37 = MEMORY[0x270FA5388](v22, v23);
  unint64_t v38 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0;
  long long v39 = (char *)v60 - v38;
  MEMORY[0x270FA5388](v37, v40);
  os_log_type_t v41 = (char *)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = v65;
  sub_24B3D6E2C(v65, (uint64_t)v41);
  uint64_t v43 = v62;
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v35[6])(v41, 1, v62) == 1)
  {
    sub_24B3D6DA8(v42);
    return sub_24B3D6DA8((uint64_t)v41);
  }
  else
  {
    uint64_t v44 = ((uint64_t (*)(char *, char *, uint64_t))v35[4])((char *)v60 - v38, v41, v43);
    MEMORY[0x270FA5388](v44, v45);
    sub_24B3D9EA8();
    sub_24B3D9E88();
    double v47 = v46;
    uint64_t v48 = v43;
    uint64_t v49 = (void (*)(char *, uint64_t))v35[1];
    v49((char *)v60 - v38, v48);
    if (v47 <= 86400.0)
    {
      os_log_type_t v50 = (unint64_t *)(v60[0] + 16);
      uint64_t v51 = sub_24B3D9E58();
      v61 = v60;
      uint64_t v52 = *(void *)(v51 - 8);
      MEMORY[0x270FA5388](v51, v53);
      unint64_t v55 = (char *)v60 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v55, a1, v51);
      swift_beginAccess();
      unint64_t v56 = *v50;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *os_log_type_t v50 = v56;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v56 = sub_24B3D33C4(0, *(void *)(v56 + 16) + 1, 1, v56);
        *os_log_type_t v50 = v56;
      }
      unint64_t v59 = *(void *)(v56 + 16);
      unint64_t v58 = *(void *)(v56 + 24);
      if (v59 >= v58 >> 1)
      {
        unint64_t v56 = sub_24B3D33C4(v58 > 1, v59 + 1, 1, v56);
        *os_log_type_t v50 = v56;
      }
      *(void *)(v56 + 16) = v59 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v52 + 32))(v56+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(void *)(v52 + 72) * v59, v55, v51);
      swift_endAccess();
      v49(v39, v62);
      return sub_24B3D6DA8(v65);
    }
    else
    {
      v49((char *)v60 - v38, v48);
      return sub_24B3D6DA8(v42);
    }
  }
}

uint64_t sub_24B3D1D74(uint64_t a1)
{
  uint64_t v1 = *(void (**)(char *))(a1 + 32);
  uint64_t v2 = sub_24B3D9E58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B3D9E38();
  swift_retain();
  v1(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_24B3D1E64(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = a2;
  uint64_t v2 = sub_24B3D9F18();
  unint64_t v58 = *(void **)(v2 - 8);
  unint64_t v59 = (void *)v2;
  MEMORY[0x270FA5388](v2, v3);
  v61 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24B3D9DE8();
  uint64_t v54 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v54 + 64);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v8 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4350);
  uint64_t inited = swift_initStackObject();
  long long v56 = xmmword_24B3DB590;
  *(_OWORD *)(inited + 16) = xmmword_24B3DB590;
  uint64_t v10 = (void *)*MEMORY[0x263EFF618];
  *(void *)(inited + 32) = *MEMORY[0x263EFF618];
  id v55 = v10;
  sub_24B3D6610(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  uint64_t v11 = v60;
  sub_24B3D9E08();
  if (v11)
  {
    swift_bridgeObjectRelease();
    char v18 = v61;
    sub_24B3D9F08();
    MEMORY[0x24C5D1E70](v11);
    MEMORY[0x24C5D1E70](v11);
    BOOL v19 = sub_24B3D9EE8();
    os_log_type_t v20 = sub_24B3DA138();
    if (os_log_type_enabled(v19, v20))
    {
      char v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = (void *)swift_slowAlloc();
      *(_DWORD *)char v21 = 138412290;
      MEMORY[0x24C5D1E70](v11);
      uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v62 = v23;
      sub_24B3DA1D8();
      *uint64_t v22 = v23;
      char v18 = v61;

      _os_log_impl(&dword_24B3C5000, v19, v20, "Error retrieving file CreationDate: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B17BE20);
      swift_arrayDestroy();
      MEMORY[0x24C5D1F90](v22, -1, -1);
      MEMORY[0x24C5D1F90](v21, -1, -1);
    }
    else
    {
    }
    ((void (*)(char *, void *))v58[1])(v18, v59);
  }
  else
  {
    long long v60 = (char *)v51 - v8;
    uint64_t v53 = v5;
    uint64_t v12 = swift_bridgeObjectRelease();
    MEMORY[0x270FA5388](v12, v13);
    uint64_t v14 = (char *)v51 - v8;
    uint64_t v15 = swift_initStackObject();
    *(_OWORD *)(v15 + 16) = v56;
    uint64_t v16 = v55;
    *(void *)(v15 + 32) = v55;
    id v17 = v16;
    sub_24B3D6610(v15);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_24B3D9E08();
    unint64_t v59 = v51;
    id v55 = 0;
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_24B3D9EB8();
    unint64_t v58 = v51;
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = *(void *)(v27 + 64);
    MEMORY[0x270FA5388](v26, v29);
    unint64_t v52 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
    *(void *)&long long v56 = (char *)v51 - v52;
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4390);
    v61 = (char *)v51;
    uint64_t v31 = *(void *)(*(void *)(v30 - 8) + 64);
    MEMORY[0x270FA5388](v30 - 8, v32);
    unint64_t v33 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v34 = v60;
    sub_24B3D9DC8();
    uint64_t v57 = v27;
    uint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
    if (v35((char *)v51 - v33, 1, v26) == 1)
    {
      uint64_t v36 = v53;
      uint64_t v37 = *(void (**)(char *, uint64_t))(v54 + 8);
      v37(v14, v53);
      v37(v34, v36);
      sub_24B3D6DA8((uint64_t)v51 - v33);
    }
    else
    {
      unint64_t v38 = *(uint64_t (**)(void, char *, uint64_t))(v57 + 32);
      v51[1] = v57 + 32;
      v51[0] = v38;
      uint64_t v39 = v38(v56, (char *)v51 - v33, v26);
      v61 = (char *)v51;
      uint64_t v41 = MEMORY[0x270FA5388](v39, v40);
      uint64_t v42 = (char *)v51 - v52;
      MEMORY[0x270FA5388](v41, v43);
      uint64_t v44 = (char *)v51 - v33;
      sub_24B3D9DC8();
      int v45 = v35((char *)v51 - v33, 1, v26);
      uint64_t v46 = v53;
      if (v45 != 1)
      {
        ((void (*)(char *, char *, uint64_t))v51[0])(v42, v44, v26);
        uint64_t v48 = (char *)v56;
        char v24 = sub_24B3D9E98();
        uint64_t v49 = *(void (**)(char *, uint64_t))(v57 + 8);
        v49(v42, v26);
        v49(v48, v26);
        os_log_type_t v50 = *(void (**)(char *, uint64_t))(v54 + 8);
        v50(v14, v46);
        v50(v60, v46);
        return v24 & 1;
      }
      (*(void (**)(void, uint64_t))(v57 + 8))(v56, v26);
      double v47 = *(void (**)(char *, uint64_t))(v54 + 8);
      v47(v14, v46);
      v47(v60, v46);
      sub_24B3D6DA8((uint64_t)v44);
    }
  }
  char v24 = 0;
  return v24 & 1;
}

Swift::OpaquePointer_optional __swiftcall ExcResourceReportPaths()()
{
  uint64_t v86 = sub_24B3D9F18();
  uint64_t v0 = *(void *)(v86 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v86, v1);
  uint64_t v4 = (char *)v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2, v5);
  uint64_t v7 = (char *)v79 - v6;
  unint64_t v8 = sub_24B3D0D44();
  if (!v8)
  {
    sub_24B3D9F08();
    uint64_t v66 = sub_24B3D9EE8();
    os_log_type_t v67 = sub_24B3DA128();
    if (os_log_type_enabled(v66, v67))
    {
      unint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v68 = 0;
      _os_log_impl(&dword_24B3C5000, v66, v67, "No ExcResource reports found", v68, 2u);
      MEMORY[0x24C5D1F90](v68, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v0 + 8))(v7, v86);
    goto LABEL_52;
  }
  uint64_t v9 = v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4348);
  v79[2] = v79;
  MEMORY[0x270FA5388](v10 - 8, v11);
  uint64_t v13 = (char *)v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v9[2];
  v79[3] = v9;
  if (v14)
  {
    uint64_t v87 = v4;
    uint64_t v15 = sub_24B3D9E58();
    uint64_t v83 = 0;
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = v16;
    char v18 = (char *)v9 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    uint64_t v89 = *(void *)(v16 + 72);
    uint64_t v20 = v16 + 16;
    BOOL v19 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    uint64_t v97 = v20;
    uint64_t v98 = v19;
    long long v95 = (uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
    BOOL v96 = (void (**)(char *, void, uint64_t, uint64_t))(v17 + 56);
    uint64_t v93 = v17 + 32;
    uint64_t v94 = v17;
    uint64_t v88 = (void (**)(char *, uint64_t))(v17 + 8);
    uint64_t v85 = v0 + 8;
    uint64_t v21 = v15;
    v79[1] = *MEMORY[0x263F5B640];
    uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    *((void *)&v23 + 1) = 2;
    long long v92 = xmmword_24B3DB590;
    v79[0] = MEMORY[0x263F8EE60] + 8;
    *(void *)&long long v23 = 136446466;
    long long v82 = v23;
    uint64_t v81 = MEMORY[0x263F8EE58] + 8;
    int v80 = (void *)MEMORY[0x263F8EE78];
    uint64_t v90 = v13;
    uint64_t v91 = v15;
    while (1)
    {
      v98(v13, v18, v21);
      (*v96)(v13, 0, 1, v21);
      uint64_t v24 = (*v95)(v13, 1, v21);
      if (v24 == 1) {
        goto LABEL_39;
      }
      v100 = v18;
      uint64_t v101 = v14;
      v102 = v22;
      v99 = v79;
      uint64_t v26 = *(void *)(v94 + 64);
      MEMORY[0x270FA5388](v24, v25);
      unint64_t v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))((char *)v79 - v27, v13, v21);
      uint64_t v29 = sub_24B3D9DE8();
      v103 = v79;
      uint64_t v30 = *(void *)(v29 - 8);
      MEMORY[0x270FA5388](v29, v31);
      unint64_t v33 = (char *)v79 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4350);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v92;
      uint64_t v35 = (void *)*MEMORY[0x263EFF680];
      *(void *)(inited + 32) = *MEMORY[0x263EFF680];
      id v36 = v35;
      sub_24B3D6610(inited);
      swift_setDeallocating();
      type metadata accessor for URLResourceKey(0);
      swift_arrayDestroy();
      sub_24B3D9E08();
      uint64_t v37 = v91;
      swift_bridgeObjectRelease();
      uint64_t v38 = sub_24B3D9DD8();
      LOBYTE(inited) = v39;
      uint64_t v40 = (char *)(*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v33, v29);
      if (inited) {
        break;
      }
      uint64_t v42 = (char *)v79 - v27;
      uint64_t v43 = v83 + v38;
      uint64_t v22 = v102;
      if (__OFADD__(v83, v38)) {
        goto LABEL_55;
      }
      uint64_t v21 = v37;
      if (v43 > 10485760)
      {
        (*v88)(v42, v37);
LABEL_10:
        uint64_t v13 = v90;
        uint64_t v44 = v101;
        goto LABEL_11;
      }
      uint64_t v84 = v38;
      v103 = (void *)sub_24B3D9F98();
      uint64_t v46 = v45;
      sub_24B3D9D88();
      swift_allocObject();
      sub_24B3D9D78();
      uint64_t v104 = 0;
      unint64_t v105 = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        if (sub_24B3D9D48())
        {
          uint64_t v40 = (char *)sub_24B3D9D68();
          if (__OFSUB__(0, v40)) {
            goto LABEL_57;
          }
        }
        swift_allocObject();
        sub_24B3D9D38();
        swift_release();
      }
      uint64_t v40 = (char *)sub_24B3D9D48();
      if (!v40) {
        goto LABEL_58;
      }
      double v47 = v40;
      uint64_t v40 = (char *)sub_24B3D9D68();
      if (__OFSUB__(0, v40)) {
        goto LABEL_56;
      }
      int64_t v48 = v47 - v40;
      uint64_t v49 = sub_24B3D9D58();
      MEMORY[0x270FA5388](v49, v50);
      v79[-6] = v103;
      v79[-5] = v46;
      v79[-4] = v48;
      v79[-3] = 128;
      v79[-2] = &v104;
      sub_24B3D9E28();
      swift_bridgeObjectRelease();
      swift_release();
      if (!v105 || (uint64_t v51 = sub_24B3D0780(v104, v105), (v52 & 1) != 0) || v51)
      {
        uint64_t v60 = sub_24B3D9E48();
        uint64_t v62 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v22 = sub_24B3D362C(0, v22[2] + 1, 1, v22);
        }
        unint64_t v64 = v22[2];
        unint64_t v63 = v22[3];
        if (v64 >= v63 >> 1) {
          uint64_t v22 = sub_24B3D362C((void *)(v63 > 1), v64 + 1, 1, v22);
        }
        v22[2] = v64 + 1;
        uint64_t v65 = &v22[2 * v64];
        v65[4] = v60;
        v65[5] = v62;
        uint64_t v83 = v43;
        uint64_t v13 = v90;
        uint64_t v44 = v101;
      }
      else
      {
        uint64_t v53 = sub_24B3D9E48();
        uint64_t v55 = v54;
        if (swift_isUniquelyReferenced_nonNull_native()) {
          long long v56 = v80;
        }
        else {
          long long v56 = sub_24B3D373C(0, v80[2] + 1, 1, v80);
        }
        uint64_t v13 = v90;
        uint64_t v44 = v101;
        unint64_t v58 = v56[2];
        unint64_t v57 = v56[3];
        if (v58 >= v57 >> 1) {
          long long v56 = sub_24B3D373C((void *)(v57 > 1), v58 + 1, 1, v56);
        }
        v56[2] = v58 + 1;
        int v80 = v56;
        unint64_t v59 = &v56[3 * v58];
        v59[4] = v53;
        v59[5] = v55;
        v59[6] = v84;
      }
      (*v88)(v42, v21);
LABEL_11:
      char v18 = &v100[v89];
      uint64_t v14 = v44 - 1;
      if (!v14) {
        goto LABEL_38;
      }
    }
    uint64_t v21 = v37;
    (*v88)((char *)v79 - v27, v37);
    uint64_t v22 = v102;
    goto LABEL_10;
  }
  uint64_t v83 = 0;
  uint64_t v22 = (void *)MEMORY[0x263F8EE78];
  int v80 = (void *)MEMORY[0x263F8EE78];
LABEL_38:
  uint64_t v69 = sub_24B3D9E58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v13, 1, 1, v69);
LABEL_39:
  swift_bridgeObjectRelease();
  uint64_t v70 = v83;
  if (v83 >= 10485760 || (uint64_t v40 = (char *)v80, (v71 = v80[2]) == 0))
  {
LABEL_50:
    swift_bridgeObjectRelease();
    if (v22[2])
    {
LABEL_53:
      uint64_t v40 = (char *)v22;
      goto LABEL_59;
    }
    swift_bridgeObjectRelease();
LABEL_52:
    uint64_t v22 = 0;
    goto LABEL_53;
  }
  uint64_t v72 = v80 + 6;
  while (1)
  {
    uint64_t v74 = v70 + *v72;
    if (__OFADD__(v70, *v72)) {
      break;
    }
    if (v74 <= 10485760)
    {
      uint64_t v76 = *(v72 - 2);
      uint64_t v75 = *(v72 - 1);
      swift_bridgeObjectRetain_n();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v22 = sub_24B3D362C(0, v22[2] + 1, 1, v22);
      }
      unint64_t v78 = v22[2];
      unint64_t v77 = v22[3];
      if (v78 >= v77 >> 1) {
        uint64_t v22 = sub_24B3D362C((void *)(v77 > 1), v78 + 1, 1, v22);
      }
      v22[2] = v78 + 1;
      uint64_t v73 = &v22[2 * v78];
      v73[4] = v76;
      v73[5] = v75;
      uint64_t v40 = (char *)swift_bridgeObjectRelease();
      uint64_t v70 = v74;
    }
    v72 += 3;
    if (!--v71) {
      goto LABEL_50;
    }
  }
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  result.value._rawValue = v40;
  result.is_nil = v41;
  return result;
}

id DiagnosticReportCollectorBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id DiagnosticReportCollectorBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DiagnosticReportCollectorBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24B3D33C4(char a1, int64_t a2, char a3, unint64_t a4)
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
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4398);
  uint64_t v10 = *(void *)(sub_24B3D9E58() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24B3DA2D8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  _OWORD v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24B3D9E58() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24B3D687C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_24B3D362C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4380);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24B3D6AE4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24B3D373C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4360);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24B3D69D4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_24B3D3864(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4358);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24B3D6BD8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24B3D3974(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24B3D3A48(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24B3D6CF4((uint64_t)v12, *a3);
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
      sub_24B3D6CF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24B3D3A48(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24B3DA1E8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24B3D3C04(a5, a6);
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
  uint64_t v8 = sub_24B3DA2C8();
  if (!v8)
  {
    sub_24B3DA2D8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24B3DA318();
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

uint64_t sub_24B3D3C04(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24B3D3C9C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24B3D3EF8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24B3D3EF8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24B3D3C9C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24B3D3E14(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24B3DA278();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24B3DA2D8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24B3DA018();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24B3DA318();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24B3DA2D8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24B3D3E14(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4370);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24B3D3E7C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24B3DA068();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x24C5D15E0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_24B3D3EF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4370);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

unsigned __int8 *sub_24B3D4048(unsigned __int8 *a1, uint64_t a2, int64_t a3)
{
  return sub_24B3D4170(a1, a2, a3);
}

uint64_t sub_24B3D4060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B3D4078(a1, a2, a3, (uint64_t (*)(void *, uint64_t, uint64_t))sub_24B3D4170);
}

uint64_t sub_24B3D4078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24B3DA088();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    int64_t v9 = &v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_24B3D4668();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    int64_t v9 = (void *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v9 = (void *)sub_24B3DA2C8();
  }
LABEL_7:
  uint64_t v13 = a4(v9, v10, a3);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_24B3D4170(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            unint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
              }
              char v30 = -87;
            }
            else
            {
              char v30 = -55;
            }
          }
          else
          {
            char v30 = -48;
          }
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  uint64_t v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
        }
        char v22 = -87;
      }
      else
      {
        char v22 = -55;
      }
    }
    else
    {
      char v22 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_24B3D43EC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  unsigned __int8 v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_24B3D4668()
{
  unint64_t v0 = sub_24B3DA098();
  uint64_t v4 = sub_24B3D46E8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24B3D46E8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_24B3D4840(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_24B3D3E14(v9, 0);
      unint64_t v12 = sub_24B3D4940((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24B3DA2C8();
LABEL_4:
        JUMPOUT(0x24C5D1590);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x24C5D1590](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24C5D1590]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_24B3D4840(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_24B3D3E7C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_24B3D3E7C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_24B3D4940(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_24B3D3E7C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_24B3DA058();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_24B3DA2C8();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_24B3D3E7C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_24B3DA028();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24B3D4B54(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t result = sub_24B3D9E78();
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = sub_24B3D9D48();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v6 = result;
  uint64_t result = sub_24B3D9D68();
  uint64_t v7 = v4 - result;
  if (__OFSUB__(v4, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = v5 - v4;
  uint64_t v9 = sub_24B3D9D58();
  if (v9 >= v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  return a1(v6 + v7, v6 + v7 + v10);
}

uint64_t sub_24B3D4C04(void **a1)
{
  unint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = (void *)sub_24B3D65FC(v2);
  }
  uint64_t v3 = v2[2];
  uint64_t v4 = *(void *)(sub_24B3D9E58() - 8);
  v6[0] = (uint64_t)v2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v6[1] = v3;
  uint64_t result = sub_24B3D4CA8(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_24B3D4CA8(uint64_t *a1)
{
  unint64_t v2 = v1;
  v154 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_24B3DA3C8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_145;
    }
    if (v3) {
      return sub_24B3D598C(0, v3, 1, v154);
    }
    return result;
  }
  uint64_t v135 = result;
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_154;
  }
  uint64_t v6 = (char *)MEMORY[0x263F8EE78];
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v3 > 1)
  {
    uint64_t v8 = v5 >> 1;
    sub_24B3D9E58();
    uint64_t v7 = sub_24B3DA0C8();
    *(void *)(v7 + 16) = v8;
  }
  uint64_t isUniquelyReferenced_nonNull_native = sub_24B3D9E58();
  uint64_t v153 = isUniquelyReferenced_nonNull_native;
  uint64_t v10 = *(void *)(isUniquelyReferenced_nonNull_native - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v137 = v7;
  unint64_t v150 = v7 + ((v11 + 32) & ~v11);
  v151 = (void *)v10;
  if (v3 < 1)
  {
    unint64_t v50 = *((void *)v6 + 2);
    goto LABEL_108;
  }
  unint64_t v12 = 0;
  uint64_t v147 = v10 + 16;
  v148 = (void (**)(char *, uint64_t))(v10 + 8);
  v152 = (uint64_t (**)(char *, char *, uint64_t))(v10 + 32);
  while (1)
  {
    v145 = (char *)v3;
    if ((uint64_t)(v12 + 1) >= v3)
    {
      uint64_t v24 = (uint64_t)(v12 + 1);
      goto LABEL_35;
    }
    v155 = &v132;
    uint64_t v141 = *v154;
    uint64_t v14 = v151[8];
    uint64_t v13 = v151[9];
    uint64_t v139 = (uint64_t)(v12 + 1);
    MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native, v141 + v13 * (void)(v12 + 1));
    v143 = (char *)((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = (char *)((char *)&v132 - v143);
    unint64_t v17 = *(char **)(v16 + 16);
    uint64_t v18 = v153;
    uint64_t v19 = ((uint64_t (*)(int64_t))v17)((char *)&v132 - v143);
    v146 = &v132;
    uint64_t v149 = v13;
    uint64_t v144 = v14;
    MEMORY[0x270FA5388](v19, v141 + v13 * (void)v12);
    char v20 = (char *)((char *)&v132 - v143);
    uint64_t v21 = (char *)((char *)&v132 - v143);
    v143 = v17;
    ((void (*)(char *))v17)(v21);
    LODWORD(v142) = sub_24B3D1E64((uint64_t)v15, (uint64_t)v20);
    if (v2)
    {
      v131 = *v148;
      (*v148)(v20, v18);
      v131(v15, v18);
      swift_bridgeObjectRelease();
LABEL_120:
      *(void *)(v137 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v136 = v6;
    uint64_t v22 = (char *)*v148;
    (*v148)(v20, v18);
    v140 = (void (*)(char *, uint64_t))v22;
    uint64_t isUniquelyReferenced_nonNull_native = ((uint64_t (*)(char *, uint64_t))v22)(v15, v18);
    uint64_t v24 = (uint64_t)(v12 + 2);
    if ((uint64_t)(v12 + 2) >= (uint64_t)v145) {
      goto LABEL_21;
    }
    v134 = v12;
    v155 = 0;
    uint64_t v25 = v141;
    uint64_t v138 = v149 * v24;
    v139 *= v149;
    while (1)
    {
      uint64_t v26 = v24;
      v146 = &v132;
      uint64_t v27 = v144;
      MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native, v25 + v138);
      uint64_t v28 = (char *)&v132 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = v153;
      char v30 = v143;
      uint64_t v31 = ((uint64_t (*)(char *))v143)(v28);
      MEMORY[0x270FA5388](v31, v25 + v139);
      ((void (*)(char *))v30)(v28);
      unsigned __int8 v32 = v155;
      int v33 = sub_24B3D1E64((uint64_t)v28, (uint64_t)v28);
      v155 = v32;
      if (v32)
      {
        v130 = v140;
        v140(v28, v29);
        v130(v28, v29);
        swift_bridgeObjectRelease();
        goto LABEL_120;
      }
      int v34 = v33;
      uint64_t v35 = (uint64_t (*)(char *, uint64_t))v140;
      v140(v28, v29);
      uint64_t isUniquelyReferenced_nonNull_native = v35(v28, v29);
      if ((v142 ^ v34)) {
        break;
      }
      ++v24;
      v25 += v149;
      if (v145 == (char *)(v26 + 1))
      {
        uint64_t v24 = (uint64_t)v145;
        unint64_t v2 = v155;
        goto LABEL_20;
      }
    }
    unint64_t v2 = v155;
LABEL_20:
    unint64_t v12 = v134;
LABEL_21:
    uint64_t v36 = v141;
    uint64_t v6 = v136;
    if (v142) {
      break;
    }
LABEL_35:
    if (v24 >= (uint64_t)v145) {
      goto LABEL_43;
    }
    if (__OFSUB__(v24, v12)) {
      goto LABEL_146;
    }
    if (v24 - (uint64_t)v12 >= v135) {
      goto LABEL_43;
    }
    if (__OFADD__(v12, v135)) {
      goto LABEL_147;
    }
    double v47 = v145;
    if ((uint64_t)&v12[v135] < (uint64_t)v145) {
      double v47 = &v12[v135];
    }
    if ((uint64_t)v47 < (uint64_t)v12)
    {
LABEL_148:
      __break(1u);
      goto LABEL_149;
    }
    if ((char *)v24 == v47)
    {
LABEL_43:
      if (v24 < (uint64_t)v12) {
        goto LABEL_144;
      }
      goto LABEL_44;
    }
    v134 = v12;
    v136 = v6;
    uint64_t v98 = v151[9];
    uint64_t v144 = v151[8];
    v99 = (uint64_t (*)(void))v151[2];
    uint64_t v138 = v98;
    uint64_t v139 = (uint64_t)v99;
    uint64_t v149 = v98 * (v24 - 1);
    uint64_t v100 = v24 * v98;
    v133 = v47;
    do
    {
      uint64_t v101 = 0;
      v102 = v134;
      uint64_t v103 = v153;
      v143 = (char *)v24;
      v140 = (void (*)(char *, uint64_t))v100;
      while (1)
      {
        v155 = v2;
        v142 = (uint64_t (*)(char *, char *, uint64_t))v102;
        v146 = &v132;
        uint64_t v105 = *v154;
        uint64_t v141 = v100 + v101;
        uint64_t v106 = v144;
        MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native, v100 + v101 + v105);
        unint64_t v107 = (v106 + 15) & 0xFFFFFFFFFFFFFFF0;
        v108 = (char *)&v132 - v107;
        v109 = (void (*)(char *))v139;
        uint64_t v110 = ((uint64_t (*)(char *))v139)((char *)&v132 - v107);
        v145 = (char *)&v132;
        MEMORY[0x270FA5388](v110, v149 + v101 + v105);
        v111 = (char *)&v132 - v107;
        v109((char *)&v132 - v107);
        v112 = v155;
        char v113 = sub_24B3D1E64((uint64_t)&v132 - v107, (uint64_t)&v132 - v107);
        if (v112)
        {
          v129 = *v148;
          (*v148)((char *)&v132 - v107, v103);
          v129((char *)&v132 - v107, v103);
          swift_bridgeObjectRelease();
          goto LABEL_120;
        }
        char v114 = v113;
        v155 = 0;
        v115 = *v148;
        (*v148)(v111, v103);
        uint64_t isUniquelyReferenced_nonNull_native = ((uint64_t (*)(char *, uint64_t))v115)(v108, v103);
        if ((v114 & 1) == 0) {
          break;
        }
        uint64_t v117 = *v154;
        uint64_t v100 = (uint64_t)v140;
        if (!*v154) {
          goto LABEL_151;
        }
        v118 = (char *)v140 + v117 + v101;
        v119 = (char *)(v117 + v149 + v101);
        MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native, v116);
        v121 = (char *)&v132 - ((v120 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v103 = v153;
        v122 = *v152;
        (*v152)(v121, v118, v153);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t isUniquelyReferenced_nonNull_native = v122(v119, v121, v103);
        v101 -= v138;
        uint64_t v104 = v143;
        v102 = (char *)v142 + 1;
        unint64_t v2 = v155;
        if (v143 == (char *)v142 + 1) {
          goto LABEL_101;
        }
      }
      unint64_t v2 = v155;
      uint64_t v104 = v143;
      uint64_t v100 = (uint64_t)v140;
LABEL_101:
      uint64_t v24 = (uint64_t)(v104 + 1);
      v149 += v138;
      v100 += v138;
    }
    while ((char *)v24 != v133);
    uint64_t v24 = (uint64_t)v133;
    uint64_t v6 = v136;
    unint64_t v12 = v134;
    if ((uint64_t)v133 < (uint64_t)v134) {
      goto LABEL_144;
    }
LABEL_44:
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_24B3D63AC(0, *((void *)v6 + 2) + 1, 1, v6);
      uint64_t v6 = (char *)isUniquelyReferenced_nonNull_native;
    }
    unint64_t v49 = *((void *)v6 + 2);
    unint64_t v48 = *((void *)v6 + 3);
    unint64_t v50 = v49 + 1;
    if (v49 >= v48 >> 1)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_24B3D63AC((char *)(v48 > 1), v49 + 1, 1, v6);
      uint64_t v6 = (char *)isUniquelyReferenced_nonNull_native;
    }
    *((void *)v6 + 2) = v50;
    uint64_t v51 = v6 + 32;
    char v52 = &v6[16 * v49 + 32];
    *(void *)char v52 = v12;
    *((void *)v52 + 1) = v24;
    v143 = (char *)v24;
    if (v49)
    {
      while (2)
      {
        unint64_t v53 = v50 - 1;
        if (v50 >= 4)
        {
          unint64_t v58 = &v51[16 * v50];
          uint64_t v59 = *((void *)v58 - 8);
          uint64_t v60 = *((void *)v58 - 7);
          BOOL v64 = __OFSUB__(v60, v59);
          uint64_t v61 = v60 - v59;
          if (v64) {
            goto LABEL_129;
          }
          uint64_t v63 = *((void *)v58 - 6);
          uint64_t v62 = *((void *)v58 - 5);
          BOOL v64 = __OFSUB__(v62, v63);
          uint64_t v56 = v62 - v63;
          char v57 = v64;
          if (v64) {
            goto LABEL_130;
          }
          unint64_t v65 = v50 - 2;
          uint64_t v66 = &v51[16 * v50 - 32];
          uint64_t v68 = *(void *)v66;
          uint64_t v67 = *((void *)v66 + 1);
          BOOL v64 = __OFSUB__(v67, v68);
          uint64_t v69 = v67 - v68;
          if (v64) {
            goto LABEL_132;
          }
          BOOL v64 = __OFADD__(v56, v69);
          uint64_t v70 = v56 + v69;
          if (v64) {
            goto LABEL_135;
          }
          if (v70 >= v61)
          {
            uint64_t v88 = &v51[16 * v53];
            uint64_t v90 = *(void *)v88;
            uint64_t v89 = *((void *)v88 + 1);
            BOOL v64 = __OFSUB__(v89, v90);
            uint64_t v91 = v89 - v90;
            if (v64) {
              goto LABEL_143;
            }
            BOOL v81 = v56 < v91;
          }
          else
          {
LABEL_62:
            if (v57) {
              goto LABEL_131;
            }
            unint64_t v65 = v50 - 2;
            uint64_t v71 = &v51[16 * v50 - 32];
            uint64_t v73 = *(void *)v71;
            uint64_t v72 = *((void *)v71 + 1);
            BOOL v74 = __OFSUB__(v72, v73);
            uint64_t v75 = v72 - v73;
            char v76 = v74;
            if (v74) {
              goto LABEL_134;
            }
            unint64_t v77 = &v51[16 * v53];
            uint64_t v79 = *(void *)v77;
            uint64_t v78 = *((void *)v77 + 1);
            BOOL v64 = __OFSUB__(v78, v79);
            uint64_t v80 = v78 - v79;
            if (v64) {
              goto LABEL_137;
            }
            if (__OFADD__(v75, v80)) {
              goto LABEL_138;
            }
            if (v75 + v80 < v56) {
              goto LABEL_74;
            }
            BOOL v81 = v56 < v80;
          }
          if (v81) {
            unint64_t v53 = v65;
          }
        }
        else
        {
          if (v50 == 3)
          {
            uint64_t v55 = *((void *)v6 + 4);
            uint64_t v54 = *((void *)v6 + 5);
            BOOL v64 = __OFSUB__(v54, v55);
            uint64_t v56 = v54 - v55;
            char v57 = v64;
            goto LABEL_62;
          }
          uint64_t v82 = *((void *)v6 + 4);
          uint64_t v83 = *((void *)v6 + 5);
          BOOL v64 = __OFSUB__(v83, v82);
          uint64_t v75 = v83 - v82;
          char v76 = v64;
LABEL_74:
          if (v76) {
            goto LABEL_133;
          }
          uint64_t v84 = &v51[16 * v53];
          uint64_t v86 = *(void *)v84;
          uint64_t v85 = *((void *)v84 + 1);
          BOOL v64 = __OFSUB__(v85, v86);
          uint64_t v87 = v85 - v86;
          if (v64) {
            goto LABEL_136;
          }
          if (v87 < v75) {
            goto LABEL_91;
          }
        }
        unint64_t v92 = v53 - 1;
        if (v53 - 1 >= v50)
        {
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
          goto LABEL_148;
        }
        if (!*v154) {
          goto LABEL_150;
        }
        uint64_t v93 = &v51[16 * v92];
        uint64_t v94 = *(void *)v93;
        long long v95 = &v51[16 * v53];
        uint64_t v96 = *((void *)v95 + 1);
        sub_24B3D5CCC(*v154 + v151[9] * *(void *)v93, *v154 + v151[9] * *(void *)v95, (char *)(*v154 + v151[9] * v96), v150);
        if (v2) {
          goto LABEL_119;
        }
        if (v96 < v94) {
          goto LABEL_126;
        }
        if (v53 > *((void *)v6 + 2)) {
          goto LABEL_127;
        }
        *(void *)uint64_t v93 = v94;
        *(void *)&v51[16 * v92 + 8] = v96;
        unint64_t v97 = *((void *)v6 + 2);
        if (v53 >= v97) {
          goto LABEL_128;
        }
        unint64_t v50 = v97 - 1;
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)memmove(&v51[16 * v53], v95 + 16, 16 * (v97 - 1 - v53));
        *((void *)v6 + 2) = v97 - 1;
        if (v97 <= 2) {
          goto LABEL_91;
        }
        continue;
      }
    }
    unint64_t v50 = 1;
LABEL_91:
    uint64_t v3 = v154[1];
    unint64_t v12 = v143;
    if ((uint64_t)v143 >= v3)
    {
LABEL_108:
      if (v50 >= 2)
      {
        uint64_t v123 = *v154;
        do
        {
          unint64_t v124 = v50 - 2;
          if (v50 < 2) {
            goto LABEL_139;
          }
          if (!v123) {
            goto LABEL_152;
          }
          uint64_t v125 = *(void *)&v6[16 * v124 + 32];
          uint64_t v126 = *(void *)&v6[16 * v50 + 24];
          sub_24B3D5CCC(v123 + v151[9] * v125, v123 + v151[9] * *(void *)&v6[16 * v50 + 16], (char *)(v123 + v151[9] * v126), v150);
          if (v2) {
            break;
          }
          if (v126 < v125) {
            goto LABEL_140;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24B3D65E8((uint64_t)v6);
          }
          if (v124 >= *((void *)v6 + 2)) {
            goto LABEL_141;
          }
          v127 = &v6[16 * v124 + 32];
          *(void *)v127 = v125;
          *((void *)v127 + 1) = v126;
          unint64_t v128 = *((void *)v6 + 2);
          if (v50 > v128) {
            goto LABEL_142;
          }
          memmove(&v6[16 * v50 + 16], &v6[16 * v50 + 32], 16 * (v128 - v50));
          *((void *)v6 + 2) = v128 - 1;
          unint64_t v50 = v128 - 1;
        }
        while (v128 > 2);
      }
LABEL_119:
      swift_bridgeObjectRelease();
      goto LABEL_120;
    }
  }
  if (v24 >= (uint64_t)v12)
  {
    if ((uint64_t)v12 < v24)
    {
      v155 = v2;
      uint64_t v37 = v12;
      uint64_t v38 = 0;
      uint64_t v39 = v149 * (v24 - 1);
      uint64_t v40 = v24 * v149;
      Swift::Bool v41 = v37;
      v134 = v37;
      uint64_t v42 = (void)v37 * v149;
      v143 = (char *)v24;
      do
      {
        if (v41 != (char *)(v24 + v38 - 1))
        {
          if (!v36) {
            goto LABEL_153;
          }
          v146 = &v132;
          uint64_t v44 = v36 + v39;
          MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native, v23);
          uint64_t v46 = (char *)&v132 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
          v142 = *v152;
          v142(v46, (char *)(v36 + v42), v153);
          if (v42 < v39 || v36 + v42 >= (unint64_t)(v36 + v40))
          {
            uint64_t v43 = v153;
            swift_arrayInitWithTakeFrontToBack();
          }
          else
          {
            uint64_t v43 = v153;
            if (v42 != v39) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          uint64_t isUniquelyReferenced_nonNull_native = v142((char *)v44, v46, v43);
          uint64_t v24 = (uint64_t)v143;
          uint64_t v36 = v141;
        }
        ++v41;
        --v38;
        v39 -= v149;
        v40 -= v149;
        v42 += v149;
      }
      while ((uint64_t)v41 < v24 + v38);
      unint64_t v2 = v155;
      uint64_t v6 = v136;
      unint64_t v12 = v134;
    }
    goto LABEL_35;
  }
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
LABEL_154:
  uint64_t result = sub_24B3DA2D8();
  __break(1u);
  return result;
}

uint64_t sub_24B3D598C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = v4;
  unint64_t v48 = a4;
  uint64_t v35 = a2;
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v7 = result;
    uint64_t result = sub_24B3D9E58();
    uint64_t v8 = result;
    uint64_t v9 = *(void **)(result - 8);
    uint64_t v10 = (void (*)(void))v9[2];
    uint64_t v38 = v9 + 2;
    uint64_t v39 = (void (*)(char *))v10;
    uint64_t v11 = v9[9];
    uint64_t v45 = v9[8];
    uint64_t v36 = v11;
    uint64_t v37 = (void (**)(char *, uint64_t))(v9 + 1);
    uint64_t v42 = (uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 4);
    uint64_t v49 = v11 * (v6 - 1);
    uint64_t v12 = v11 * v6;
    uint64_t v34 = v7;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v40 = v6;
      uint64_t v41 = v12;
      while (1)
      {
        uint64_t v50 = v5;
        double v47 = &v34;
        uint64_t v15 = *v48;
        uint64_t v43 = v12 + v13;
        uint64_t v44 = v7;
        uint64_t v16 = v45;
        MEMORY[0x270FA5388](result, v12 + v13 + v15);
        unint64_t v17 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v18 = (char *)&v34 - v17;
        uint64_t v19 = v39;
        uint64_t v20 = ((uint64_t (*)(char *))v39)((char *)&v34 - v17);
        uint64_t v46 = &v34;
        MEMORY[0x270FA5388](v20, v49 + v13 + v15);
        uint64_t v21 = (char *)&v34 - v17;
        v19((char *)&v34 - v17);
        uint64_t v22 = v50;
        char v23 = sub_24B3D1E64((uint64_t)&v34 - v17, (uint64_t)&v34 - v17);
        uint64_t v50 = v22;
        if (v22)
        {
          int v33 = *v37;
          (*v37)((char *)&v34 - v17, v8);
          return ((uint64_t (*)(char *, uint64_t))v33)((char *)&v34 - v17, v8);
        }
        char v24 = v23;
        uint64_t v25 = *v37;
        (*v37)(v21, v8);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v25)(v18, v8);
        if ((v24 & 1) == 0) {
          break;
        }
        uint64_t v27 = *v48;
        uint64_t v12 = v41;
        if (!*v48)
        {
          __break(1u);
          return result;
        }
        double v47 = &v34;
        uint64_t v28 = v27 + v41 + v13;
        uint64_t v29 = (char *)(v27 + v49 + v13);
        MEMORY[0x270FA5388](result, v26);
        uint64_t v31 = (char *)&v34 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
        unsigned __int8 v32 = *v42;
        (*v42)(v31, v28, v8);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = v32(v29, (uint64_t)v31, v8);
        v13 -= v36;
        uint64_t v7 = v44 + 1;
        uint64_t v14 = v40;
        uint64_t v5 = v50;
        if (v40 == v44 + 1) {
          goto LABEL_10;
        }
      }
      uint64_t v5 = v50;
      uint64_t v14 = v40;
      uint64_t v12 = v41;
LABEL_10:
      uint64_t v6 = v14 + 1;
      v49 += v36;
      v12 += v36;
      uint64_t v7 = v34;
      if (v6 != v35) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_24B3D5CCC(unint64_t a1, unint64_t a2, char *a3, unint64_t a4)
{
  uint64_t v9 = sub_24B3D9E58();
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (!v12)
  {
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  uint64_t v13 = v9;
  if (a2 - a1 == 0x8000000000000000 && v12 == -1) {
    goto LABEL_69;
  }
  uint64_t v14 = (uint64_t)&a3[-a2];
  if (&a3[-a2] == (char *)0x8000000000000000 && v12 == -1) {
    goto LABEL_70;
  }
  uint64_t v15 = (uint64_t)(a2 - a1) / v12;
  unint64_t v76 = a1;
  unint64_t v75 = a4;
  uint64_t v16 = v14 / v12;
  if (v15 >= v14 / v12)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v18 = v16 * v12;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        uint64_t v9 = swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        uint64_t v9 = swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v38 = a4 + v18;
      unint64_t v74 = a4 + v18;
      unint64_t v76 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        uint64_t v40 = -v12;
        uint64_t v42 = *(void (**)(char *, unint64_t, uint64_t))(v11 + 16);
        uint64_t v41 = v11 + 16;
        uint64_t v63 = *(void *)(v41 + 48);
        BOOL v64 = v42;
        uint64_t v69 = v41;
        unint64_t v65 = (void (**)(char *, uint64_t))(v41 - 8);
        uint64_t v43 = v4;
        unint64_t v71 = a4;
        unint64_t v62 = a1;
        while (1)
        {
          uint64_t v73 = v43;
          uint64_t v70 = a3;
          uint64_t v68 = &v62;
          uint64_t v44 = v63;
          MEMORY[0x270FA5388](v9, v38 + v40);
          uint64_t v45 = (char *)&v62 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v46 = v64;
          uint64_t v47 = ((uint64_t (*)(char *))v64)(v45);
          uint64_t v67 = &v62;
          unint64_t v48 = a2 + v40;
          MEMORY[0x270FA5388](v47, v49);
          v46(v45, a2 + v40, v13);
          uint64_t v50 = v73;
          char v51 = sub_24B3D1E64((uint64_t)v45, (uint64_t)v45);
          if (v50) {
            break;
          }
          char v52 = v51;
          unint64_t v72 = a2;
          uint64_t v73 = 0;
          unint64_t v53 = (unint64_t)v70;
          uint64_t v66 = &v70[v40];
          uint64_t v54 = *v65;
          (*v65)(v45, v13);
          uint64_t v9 = ((uint64_t (*)(char *, uint64_t))v54)(v45, v13);
          if (v52)
          {
            unint64_t v55 = v71;
            unint64_t v56 = v62;
            a3 = v66;
            if (v53 < v72 || (unint64_t)v66 >= v72)
            {
              uint64_t v9 = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v53 != v72)
            {
              uint64_t v9 = swift_arrayInitWithTakeBackToFront();
            }
            v76 += v40;
          }
          else
          {
            unint64_t v57 = v74;
            v74 += v40;
            unint64_t v55 = v71;
            unint64_t v56 = v62;
            a3 = v66;
            if (v53 < v57 || (unint64_t)v66 >= v57)
            {
              uint64_t v9 = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v53 != v57)
            {
              uint64_t v9 = swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v48 = v72;
          }
          unint64_t v38 = v74;
          if (v74 > v55)
          {
            a2 = v48;
            BOOL v58 = v48 > v56;
            uint64_t v43 = v73;
            if (v58) {
              continue;
            }
          }
          goto LABEL_66;
        }
        uint64_t v60 = *v65;
        (*v65)(v45, v13);
        v60(v45, v13);
      }
      goto LABEL_66;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = v15 * v12;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      uint64_t v9 = swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      uint64_t v9 = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v68 = (unint64_t *)(a4 + v17);
    unint64_t v74 = a4 + v17;
    if (v17 >= 1 && a2 < (unint64_t)a3)
    {
      uint64_t v21 = *(char **)(v11 + 16);
      uint64_t v20 = v11 + 16;
      unint64_t v65 = *(void (***)(char *, uint64_t))(v20 + 48);
      uint64_t v66 = v21;
      uint64_t v69 = v20;
      uint64_t v70 = a3;
      uint64_t v67 = (unint64_t *)(v20 - 8);
      uint64_t v22 = v4;
      BOOL v64 = (void (*)(char *, unint64_t, uint64_t))v12;
      while (1)
      {
        unint64_t v71 = a4;
        char v23 = v65;
        MEMORY[0x270FA5388](v9, v10);
        char v24 = (char *)&v62 - (((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF0);
        unint64_t v72 = a2;
        uint64_t v25 = v66;
        uint64_t v26 = ((uint64_t (*)(char *, unint64_t, uint64_t))v66)(v24, a2, v13);
        MEMORY[0x270FA5388](v26, v27);
        ((void (*)(char *, unint64_t, uint64_t))v25)(v24, v71, v13);
        char v28 = sub_24B3D1E64((uint64_t)v24, (uint64_t)v24);
        uint64_t v73 = v22;
        if (v22) {
          break;
        }
        char v29 = v28;
        uint64_t v30 = (uint64_t (*)(char *, uint64_t))*v67;
        ((void (*)(char *, uint64_t))*v67)(v24, v13);
        uint64_t v9 = v30(v24, v13);
        unint64_t v31 = v76;
        if (v29)
        {
          unsigned __int8 v32 = v64;
          unint64_t v10 = v72;
          unint64_t v33 = (unint64_t)v64 + v72;
          if (v76 < v72 || v76 >= v33)
          {
            uint64_t v9 = swift_arrayInitWithTakeFrontToBack();
            uint64_t v34 = v73;
            unint64_t v35 = (unint64_t)v70;
          }
          else
          {
            uint64_t v34 = v73;
            unint64_t v35 = (unint64_t)v70;
            if (v76 == v72) {
              unint64_t v31 = v72;
            }
            else {
              uint64_t v9 = swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        else
        {
          unint64_t v10 = v75;
          unsigned __int8 v32 = v64;
          unint64_t v36 = (unint64_t)v64 + v75;
          if (v76 < v75 || v76 >= v36)
          {
            uint64_t v9 = swift_arrayInitWithTakeFrontToBack();
            unint64_t v37 = v72;
            uint64_t v34 = v73;
            unint64_t v35 = (unint64_t)v70;
          }
          else
          {
            unint64_t v37 = v72;
            uint64_t v34 = v73;
            unint64_t v35 = (unint64_t)v70;
            if (v76 != v75) {
              uint64_t v9 = swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v75 = v36;
          unint64_t v33 = v37;
        }
        unint64_t v76 = (unint64_t)v32 + v31;
        a4 = v75;
        if (v75 < (unint64_t)v68)
        {
          a2 = v33;
          uint64_t v22 = v34;
          if (v33 < v35) {
            continue;
          }
        }
        goto LABEL_66;
      }
      uint64_t v68 = &v62;
      uint64_t v59 = (void (*)(char *, uint64_t))*v67;
      ((void (*)(char *, uint64_t))*v67)(v24, v13);
      v59(v24, v13);
    }
LABEL_66:
    sub_24B3D64A8(&v76, &v75, (uint64_t *)&v74);
    return 1;
  }
LABEL_71:
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

char *sub_24B3D63AC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4388);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24B3D64A8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_24B3D9E58();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_24B3DA318();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_24B3D65E8(uint64_t a1)
{
  return sub_24B3D63AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24B3D65FC(void *a1)
{
  return sub_24B3D8EDC(0, a1[2], 0, a1);
}

uint64_t sub_24B3D6610(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4378);
    uint64_t v3 = sub_24B3DA268();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_24B3D9F98();
      sub_24B3DA458();
      id v7 = v6;
      sub_24B3D9FF8();
      uint64_t v8 = sub_24B3DA478();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_24B3D9F98();
        uint64_t v17 = v16;
        if (v15 == sub_24B3D9F98() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_24B3DA3D8();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_24B3D9F98();
          uint64_t v24 = v23;
          if (v22 == sub_24B3D9F98() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_24B3DA3D8();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_24B3D6840(const char *a1)
{
  return sub_24B3D6CD0(a1);
}

uint64_t type metadata accessor for DiagnosticReportCollectorBridge()
{
  return self;
}

uint64_t sub_24B3D687C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_24B3D9E58() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

uint64_t sub_24B3D69D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4368);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

uint64_t sub_24B3D6AE4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

uint64_t sub_24B3D6BD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

uint64_t sub_24B3D6CD0(const char *a1)
{
  return sub_24B3D0CA8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_24B3D6CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24B3D6D50()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24B3D6D88(uint64_t a1)
{
  return sub_24B3D1370(a1, v1);
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

uint64_t sub_24B3D6DA8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4390);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24B3D6E08(uint64_t a1, uint64_t a2)
{
  return sub_24B3D0C24(a1, a2);
}

uint64_t sub_24B3D6E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B3D6E94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24B3D6EFC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id PanicCriterials.__allocating_init(id:type:path:panicString:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v17 = objc_allocWithZone(v8);
  return PanicCriterials.init(id:type:path:panicString:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

id PanicCriterials.init(id:type:path:panicString:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v83 = a2;
  uint64_t v82 = a1;
  uint64_t v91 = sub_24B3D9F18();
  uint64_t v15 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91, v16);
  uint64_t v18 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = &v8[OBJC_IVAR____SwiftPanicCriterials_panicStringDelimiter];
  *(void *)uint64_t v19 = 0xD000000000000010;
  *((void *)v19 + 1) = 0x800000024B3DBD70;
  v98[0] = a7;
  v98[1] = a8;
  unint64_t v96 = 0xD000000000000010;
  unint64_t v97 = 0x800000024B3DBD70;
  sub_24B3D8CA4();
  char v20 = v8;
  uint64_t v21 = sub_24B3DA118();
  swift_bridgeObjectRelease();
  uint64_t v22 = (void *)sub_24B3D76F0(v21);
  swift_bridgeObjectRelease();
  unint64_t v23 = v22[2];
  uint64_t v86 = a5;
  uint64_t v87 = a6;
  uint64_t v84 = a3;
  uint64_t v85 = a4;
  BOOL v81 = v20;
  if (v23)
  {
    uint64_t v24 = v22[5];
    uint64_t v25 = &v20[OBJC_IVAR____SwiftPanicCriterials_panicReasonString];
    *(void *)uint64_t v25 = v22[4];
    *((void *)v25 + 1) = v24;
    if (v23 > v22[2])
    {
      __break(1u);
      JUMPOUT(0x24B3D76D0);
    }
    uint64_t v26 = (uint64_t)&v22[2 * v23 + 4];
    uint64_t v27 = *(void *)(v26 - 16);
    unint64_t v28 = *(void *)(v26 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v27 = 0;
    BOOL v29 = &v20[OBJC_IVAR____SwiftPanicCriterials_panicReasonString];
    unint64_t v28 = 0xE000000000000000;
    *(void *)BOOL v29 = 0;
    *((void *)v29 + 1) = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_24B3D9A50(v27, v28);
  swift_bridgeObjectRelease();
  uint64_t v31 = 0;
  uint64_t v32 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v93 = (void (**)(char *, uint64_t))(v15 + 8);
  unint64_t v94 = (unint64_t)"Swift/Range.swift";
  *(void *)&long long v33 = 136315394;
  long long v89 = v33;
  uint64_t v88 = MEMORY[0x263F8EE58] + 8;
  uint64_t v34 = v91;
  uint64_t v92 = v30;
  uint64_t v90 = (void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  while (2)
  {
    uint64_t v35 = byte_26FE7D380[v31++ + 32];
    unint64_t v36 = v94 | 0x8000000000000000;
    uint64_t v37 = 0xD000000000000010;
    switch(v35)
    {
      case 1:
        goto LABEL_12;
      case 2:
        uint64_t v37 = 0x657620746F6F4269;
        unint64_t v36 = 0xED00006E6F697372;
LABEL_12:
        if (*(void *)(v30 + 16)) {
          goto LABEL_13;
        }
        goto LABEL_16;
      case 3:
        uint64_t v37 = 0x6220657275636573;
        unint64_t v36 = 0xEB00000000746F6FLL;
        if (!*(void *)(v30 + 16)) {
          goto LABEL_16;
        }
        goto LABEL_13;
      default:
        uint64_t v37 = 0x73206C656E72654BLL;
        unint64_t v36 = 0xEC0000006564696CLL;
        if (!*(void *)(v30 + 16)) {
          goto LABEL_16;
        }
LABEL_13:
        unint64_t v38 = sub_24B3D9288(v37, v36);
        if (v39)
        {
          uint64_t v40 = (uint64_t *)(*(void *)(v30 + 56) + 16 * v38);
          uint64_t v41 = *v40;
          unint64_t v42 = v40[1];
          swift_bridgeObjectRetain();
        }
        else
        {
LABEL_16:
          uint64_t v41 = 0;
          unint64_t v42 = 0xE000000000000000;
        }
        swift_bridgeObjectRelease();
        if (qword_2697C4150 != -1) {
          swift_once();
        }
        uint64_t v43 = __swift_project_value_buffer(v34, (uint64_t)qword_2697C5500);
        (*v32)(v18, v43, v34);
        swift_bridgeObjectRetain();
        uint64_t v44 = sub_24B3D9EE8();
        os_log_type_t v45 = sub_24B3DA148();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          v98[0] = v47;
          *(_DWORD *)uint64_t v46 = v89;
          unint64_t v48 = v94 | 0x8000000000000000;
          uint64_t v49 = v47;
          uint64_t v50 = 0xD000000000000010;
          switch((int)v35)
          {
            case 1:
              break;
            case 2:
              uint64_t v50 = 0x657620746F6F4269;
              unint64_t v48 = 0xED00006E6F697372;
              break;
            case 3:
              uint64_t v50 = 0x6220657275636573;
              unint64_t v48 = 0xEB00000000746F6FLL;
              break;
            default:
              uint64_t v50 = 0x73206C656E72654BLL;
              unint64_t v48 = 0xEC0000006564696CLL;
              break;
          }
          *(void *)(v46 + 4) = sub_24B3D3974(v50, v48, v98);
          swift_bridgeObjectRelease();
          *(_WORD *)(v46 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v46 + 14) = sub_24B3D3974(v41, v42, v98);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24B3C5000, v44, v45, "key %s -> %s", (uint8_t *)v46, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24C5D1F90](v49, -1, -1);
          MEMORY[0x24C5D1F90](v46, -1, -1);

          uint64_t v34 = v91;
          (*v93)(v18, v91);
          uint64_t v30 = v92;
          uint64_t v32 = v90;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*v93)(v18, v34);
        }
        if (v31 != 4) {
          continue;
        }
        if (*(void *)(v30 + 16))
        {
          unint64_t v51 = sub_24B3D9288(0x73206C656E72654BLL, 0xEC0000006564696CLL);
          uint64_t v53 = v86;
          uint64_t v52 = v87;
          uint64_t v54 = v30;
          uint64_t v56 = v84;
          uint64_t v55 = v85;
          unint64_t v57 = v81;
          if (v58)
          {
            uint64_t v59 = *(void *)(*(void *)(v54 + 56) + 16 * v51);
            uint64_t v60 = swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v59 = 0;
            uint64_t v60 = 0;
          }
        }
        else
        {
          uint64_t v59 = 0;
          uint64_t v60 = 0;
          uint64_t v53 = v86;
          uint64_t v52 = v87;
          uint64_t v56 = v84;
          uint64_t v55 = v85;
          unint64_t v57 = v81;
        }
        uint64_t v61 = &v57[OBJC_IVAR____SwiftPanicCriterials_kernelSlide];
        *(void *)uint64_t v61 = v59;
        *((void *)v61 + 1) = v60;
        uint64_t v62 = v92;
        if (*(void *)(v92 + 16)
          && (unint64_t v63 = sub_24B3D9288(0xD000000000000010, v94 | 0x8000000000000000), (v64 & 1) != 0))
        {
          uint64_t v65 = *(void *)(*(void *)(v62 + 56) + 16 * v63);
          uint64_t v66 = swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v65 = 0;
          uint64_t v66 = 0;
        }
        uint64_t v67 = &v57[OBJC_IVAR____SwiftPanicCriterials_kernelTextBase];
        *(void *)uint64_t v67 = v65;
        *((void *)v67 + 1) = v66;
        uint64_t v68 = v92;
        if (*(void *)(v92 + 16) && (unint64_t v69 = sub_24B3D9288(0x657620746F6F4269, 0xED00006E6F697372), (v70 & 1) != 0))
        {
          unint64_t v71 = (uint64_t *)(*(void *)(v68 + 56) + 16 * v69);
          uint64_t v73 = *v71;
          uint64_t v72 = v71[1];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v73 = 0;
          uint64_t v72 = 0;
        }
        swift_bridgeObjectRelease();
        unint64_t v74 = &v57[OBJC_IVAR____SwiftPanicCriterials_iBootVersion];
        *(void *)unint64_t v74 = v73;
        *((void *)v74 + 1) = v72;

        unint64_t v75 = &v57[OBJC_IVAR____SwiftCriterials_incidentID];
        uint64_t v76 = v83;
        *(void *)unint64_t v75 = v82;
        *((void *)v75 + 1) = v76;
        unint64_t v77 = &v57[OBJC_IVAR____SwiftCriterials_logType];
        *(void *)unint64_t v77 = v56;
        *((void *)v77 + 1) = v55;
        uint64_t v78 = &v57[OBJC_IVAR____SwiftCriterials_panicReportPath];
        *(void *)uint64_t v78 = v53;
        *((void *)v78 + 1) = v52;
        uint64_t v79 = (objc_class *)type metadata accessor for Criterials();
        v95.receiver = v57;
        v95.super_class = v79;
        return objc_msgSendSuper2(&v95, sel_init);
    }
  }
}

uint64_t sub_24B3D76F0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_24B3D8D18(0, v1, 0);
    uint64_t v2 = v16;
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 3);
      uint64_t v6 = *(v4 - 2);
      uint64_t v7 = *(v4 - 1);
      uint64_t v8 = *v4;
      swift_bridgeObjectRetain();
      uint64_t v9 = MEMORY[0x24C5D1570](v5, v6, v7, v8);
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
      unint64_t v13 = *(void *)(v16 + 16);
      unint64_t v12 = *(void *)(v16 + 24);
      if (v13 >= v12 >> 1) {
        sub_24B3D8D18(v12 > 1, v13 + 1, 1);
      }
      *(void *)(v16 + 16) = v13 + 1;
      uint64_t v14 = v16 + 16 * v13;
      *(void *)(v14 + 32) = v9;
      *(void *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_24B3D7894(uint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  uint64_t v58 = 58;
  unint64_t v59 = 0xE100000000000000;
  unint64_t v57 = &v58;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_24B3D8540(0x7FFFFFFFFFFFFFFFLL, 1, sub_24B3D9BD4, (uint64_t)v56, v3, v4);
  uint64_t v6 = v5;
  unint64_t v7 = v5[2];
  if (v7)
  {
    uint64_t v8 = v5[4];
    uint64_t v9 = v5[5];
    uint64_t v10 = v5[6];
    uint64_t v11 = v5[7];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v8 = MEMORY[0x24C5D1750](0, 0xE000000000000000);
    uint64_t v9 = v12;
    uint64_t v10 = v13;
    uint64_t v11 = v14;
  }
  unint64_t v15 = 0xD000000000000010;
  uint64_t v16 = MEMORY[0x24C5D1570](v8, v9, v10, v11);
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  unint64_t v19 = 0x800000024B3DBDB0;
  unint64_t v20 = 0xD000000000000010;
  switch(byte_26FE7D378)
  {
    case 1:
      break;
    case 2:
      unint64_t v19 = 0xED00006E6F697372;
      unint64_t v20 = 0x657620746F6F4269;
      break;
    case 3:
      unint64_t v19 = 0xEB00000000746F6FLL;
      unint64_t v20 = 0x6220657275636573;
      break;
    default:
      unint64_t v19 = 0xEC0000006564696CLL;
      unint64_t v20 = 0x73206C656E72654BLL;
      break;
  }
  if (v20 == v16 && v19 == v18) {
    goto LABEL_28;
  }
  char v22 = sub_24B3DA3D8();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_29;
  }
  unint64_t v23 = 0x800000024B3DBDB0;
  unint64_t v24 = 0xD000000000000010;
  switch(byte_26FE7D379)
  {
    case 1:
      break;
    case 2:
      unint64_t v23 = 0xED00006E6F697372;
      unint64_t v24 = 0x657620746F6F4269;
      break;
    case 3:
      unint64_t v23 = 0xEB00000000746F6FLL;
      unint64_t v24 = 0x6220657275636573;
      break;
    default:
      unint64_t v23 = 0xEC0000006564696CLL;
      unint64_t v24 = 0x73206C656E72654BLL;
      break;
  }
  if (v24 == v16 && v23 == v18)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  char v26 = sub_24B3DA3D8();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
    unint64_t v27 = 0x800000024B3DBDB0;
    unint64_t v28 = 0xD000000000000010;
    switch(byte_26FE7D37A)
    {
      case 1:
        break;
      case 2:
        unint64_t v27 = 0xED00006E6F697372;
        unint64_t v28 = 0x657620746F6F4269;
        break;
      case 3:
        unint64_t v27 = 0xEB00000000746F6FLL;
        unint64_t v28 = 0x6220657275636573;
        break;
      default:
        unint64_t v27 = 0xEC0000006564696CLL;
        unint64_t v28 = 0x73206C656E72654BLL;
        break;
    }
    if (v28 != v16 || v27 != v18)
    {
      char v51 = sub_24B3DA3D8();
      swift_bridgeObjectRelease();
      if (v51) {
        goto LABEL_29;
      }
      unint64_t v52 = 0x800000024B3DBDB0;
      switch(byte_26FE7D37B)
      {
        case 1:
          break;
        case 2:
          unint64_t v52 = 0xED00006E6F697372;
          unint64_t v15 = 0x657620746F6F4269;
          break;
        case 3:
          unint64_t v52 = 0xEB00000000746F6FLL;
          unint64_t v15 = 0x6220657275636573;
          break;
        default:
          unint64_t v52 = 0xEC0000006564696CLL;
          unint64_t v15 = 0x73206C656E72654BLL;
          break;
      }
      if (v15 != v16 || v52 != v18)
      {
        char v53 = sub_24B3DA3D8();
        swift_bridgeObjectRelease();
        if ((v53 & 1) == 0) {
          goto LABEL_34;
        }
        goto LABEL_29;
      }
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t v55 = v18;
  if (v7)
  {
    if (v7 > v6[2])
    {
      __break(1u);
      JUMPOUT(0x24B3D7E84);
    }
    uint64_t v29 = v16;
    uint64_t v30 = &v6[4 * v7];
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    uint64_t v34 = v30[2];
    uint64_t v33 = v30[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = v16;
    swift_bridgeObjectRelease();
    uint64_t v31 = MEMORY[0x24C5D1750](0, 0xE000000000000000);
    uint64_t v32 = v35;
    uint64_t v34 = v36;
    uint64_t v33 = v37;
  }
  uint64_t v38 = MEMORY[0x24C5D1570](v31, v32, v34, v33);
  unint64_t v40 = v39;
  swift_bridgeObjectRelease();
  uint64_t v58 = v38;
  unint64_t v59 = v40;
  uint64_t v41 = sub_24B3D9D28();
  uint64_t v42 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41, v43);
  os_log_type_t v45 = (char *)&v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B3D9D18();
  sub_24B3D9C48();
  uint64_t v46 = sub_24B3DA1F8();
  uint64_t v48 = v47;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v41);
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v58 = *a1;
  *a1 = 0x8000000000000000;
  sub_24B3D970C(v46, v48, v29, v55, isUniquelyReferenced_nonNull_native);
  *a1 = v58;
LABEL_34:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void PanicCriterials.__allocating_init(id:type:path:)()
{
}

void PanicCriterials.init(id:type:path:)()
{
}

uint64_t sub_24B3D7F54()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id PanicCriterials.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PanicCriterials();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24B3D809C(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_24B3D89E4(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_24B3DA078();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_24B3DA008();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_24B3DA008();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_24B3DA098();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_24B3D3864(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_24B3D3864((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  unint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_24B3DA008();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_24B3DA098();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_24B3D3864(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_24B3D3864((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    unint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_24B3DA2D8();
  __break(1u);
LABEL_42:
  uint64_t result = sub_24B3DA2D8();
  __break(1u);
  return result;
}

uint64_t sub_24B3D8540(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, unint64_t a5, unint64_t a6)
{
  v47[3] = a4;
  if (a1 < 0) {
    goto LABEL_35;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = a5;
  if (!a1 || (unint64_t v45 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_24B3D8B40(a6, v44, a2 & 1, v10);
    swift_bridgeObjectRelease();
    a6 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    swift_release();
    return a6;
  }
  uint64_t v35 = a1;
  uint64_t v36 = v10;
  uint64_t v43 = (void *)MEMORY[0x263F8EE78];
  unint64_t v12 = a5;
  unint64_t v13 = a5;
  unint64_t v40 = a5;
  while (1)
  {
    v47[0] = sub_24B3DA198();
    v47[1] = v14;
    char v15 = a3(v47);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a6;
    }
    char v16 = v15;
    swift_bridgeObjectRelease();
    if (v16) {
      break;
    }
    unint64_t v12 = sub_24B3DA188();
LABEL_9:
    if (v45 == v12 >> 14) {
      goto LABEL_24;
    }
  }
  if (v13 >> 14 == v12 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v12 = sub_24B3DA188();
    *(void *)(v44 + 16) = v12;
    unint64_t v13 = v12;
    unint64_t v40 = v12;
    goto LABEL_9;
  }
  if (v12 >> 14 < v13 >> 14) {
    goto LABEL_34;
  }
  uint64_t v17 = sub_24B3DA1B8();
  uint64_t v39 = v18;
  uint64_t v41 = v17;
  uint64_t v37 = v20;
  uint64_t v38 = v19;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v43 = sub_24B3D3864(0, v43[2] + 1, 1, v43);
  }
  unint64_t v22 = v43[2];
  unint64_t v21 = v43[3];
  if (v22 >= v21 >> 1) {
    uint64_t v43 = sub_24B3D3864((void *)(v21 > 1), v22 + 1, 1, v43);
  }
  v43[2] = v22 + 1;
  uint64_t v23 = &v43[4 * v22];
  v23[4] = v41;
  v23[5] = v39;
  v23[6] = v38;
  v23[7] = v37;
  *(void *)(v36 + 16) = v43;
  uint64_t v24 = sub_24B3DA188();
  unint64_t v12 = v24;
  *(void *)(v44 + 16) = v24;
  if (v43[2] != v35)
  {
    unint64_t v13 = v24;
    unint64_t v40 = v24;
    goto LABEL_9;
  }
  unint64_t v40 = v24;
  unint64_t v13 = v24;
LABEL_24:
  if (v45 == v13 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
LABEL_33:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  if (v45 >= v40 >> 14)
  {
    uint64_t v25 = sub_24B3DA1B8();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a6 = (unint64_t)sub_24B3D3864(0, v43[2] + 1, 1, v43);
    }
    unint64_t v33 = *(void *)(a6 + 16);
    unint64_t v32 = *(void *)(a6 + 24);
    if (v33 >= v32 >> 1) {
      a6 = (unint64_t)sub_24B3D3864((void *)(v32 > 1), v33 + 1, 1, (void *)a6);
    }
    *(void *)(a6 + 16) = v33 + 1;
    uint64_t v34 = (void *)(a6 + 32 * v33);
    v34[4] = v25;
    v34[5] = v27;
    v34[6] = v29;
    v34[7] = v31;
    *(void *)(v36 + 16) = a6;
    goto LABEL_33;
  }
LABEL_34:
  sub_24B3DA2D8();
  __break(1u);
LABEL_35:
  uint64_t result = sub_24B3DA2D8();
  __break(1u);
  return result;
}

uint64_t sub_24B3D89E4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_24B3DA098();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_24B3D3864(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_24B3D3864((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    uint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_24B3DA2D8();
  __break(1u);
  return result;
}

uint64_t sub_24B3D8B40(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_24B3DA1B8();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_24B3D3864(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_24B3D3864((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    uint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_24B3DA2D8();
  __break(1u);
  return result;
}

unint64_t sub_24B3D8CA4()
{
  unint64_t result = qword_2697C43C0;
  if (!qword_2697C43C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C43C0);
  }
  return result;
}

uint64_t sub_24B3D8CF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24B3D8D38(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24B3D8D18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24B3D911C(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24B3D8D38(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697C43F0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4270);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

uint64_t sub_24B3D8EDC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4398);
  uint64_t v10 = *(void *)(sub_24B3D9E58() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  _OWORD v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24B3D9E58() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

uint64_t sub_24B3D911C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697C4380);
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
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24B3DA318();
  __break(1u);
  return result;
}

unint64_t sub_24B3D9288(uint64_t a1, uint64_t a2)
{
  sub_24B3DA458();
  sub_24B3D9FF8();
  uint64_t v4 = sub_24B3DA478();

  return sub_24B3D9300(a1, a2, v4);
}

unint64_t sub_24B3D9300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24B3DA3D8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24B3DA3D8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24B3D93E4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C43A8);
  char v42 = a2;
  uint64_t v6 = sub_24B3DA2F8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24B3DA458();
    sub_24B3D9FF8();
    uint64_t result = sub_24B3DA478();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24B3D970C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_24B3D9288(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_24B3D9894();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_24B3D93E4(v17, a5 & 1);
  unint64_t v23 = sub_24B3D9288(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_24B3DA3E8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *unint64_t v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  *int64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

void *sub_24B3D9894()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697C43A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24B3DA2E8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24B3D9A50(uint64_t a1, unint64_t a2)
{
  *(void *)&long long v11 = 10;
  *((void *)&v11 + 1) = 0xE100000000000000;
  v10[2] = &v11;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24B3D809C(0x7FFFFFFFFFFFFFFFLL, 1, sub_24B3D9BD4, (uint64_t)v10, a1, a2);
  uint64_t v14 = MEMORY[0x263F8EE80];
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = (uint64_t *)(v4 + 56);
    do
    {
      uint64_t v7 = *(v6 - 1);
      uint64_t v8 = *v6;
      long long v11 = *(_OWORD *)(v6 - 3);
      uint64_t v12 = v7;
      uint64_t v13 = v8;
      swift_bridgeObjectRetain();
      sub_24B3D7894(&v14, (unint64_t *)&v11);
      swift_bridgeObjectRelease();
      v6 += 4;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease_n();
    return v14;
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE80];
  }
}

uint64_t type metadata accessor for PanicCriterials()
{
  return self;
}

uint64_t method lookup function for PanicCriterials(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PanicCriterials);
}

uint64_t dispatch thunk of PanicCriterials.__allocating_init(id:type:path:panicString:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_24B3D9BD4(void *a1)
{
  return sub_24B3D9BF0(a1) & 1;
}

uint64_t sub_24B3D9BF0(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_24B3DA3D8() & 1;
  }
}

unint64_t sub_24B3D9C48()
{
  unint64_t result = qword_2697C43E8;
  if (!qword_2697C43E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697C43E8);
  }
  return result;
}

uint64_t sub_24B3D9C9C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24B3D9CD4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24B3D9CE8()
{
  return MEMORY[0x270EEDDD8]();
}

uint64_t sub_24B3D9CF8()
{
  return MEMORY[0x270EEDE08]();
}

uint64_t sub_24B3D9D08()
{
  return MEMORY[0x270EEDE20]();
}

uint64_t sub_24B3D9D18()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_24B3D9D28()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_24B3D9D38()
{
  return MEMORY[0x270EEE620]();
}

uint64_t sub_24B3D9D48()
{
  return MEMORY[0x270EEE640]();
}

uint64_t sub_24B3D9D58()
{
  return MEMORY[0x270EEE660]();
}

uint64_t sub_24B3D9D68()
{
  return MEMORY[0x270EEE668]();
}

uint64_t sub_24B3D9D78()
{
  return MEMORY[0x270EEE678]();
}

uint64_t sub_24B3D9D88()
{
  return MEMORY[0x270EEE690]();
}

uint64_t sub_24B3D9D98()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_24B3D9DA8()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_24B3D9DB8()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_24B3D9DC8()
{
  return MEMORY[0x270EEEEF8]();
}

uint64_t sub_24B3D9DD8()
{
  return MEMORY[0x270EEEFD8]();
}

uint64_t sub_24B3D9DE8()
{
  return MEMORY[0x270EEF000]();
}

uint64_t sub_24B3D9DF8()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_24B3D9E08()
{
  return MEMORY[0x270EEFC80]();
}

uint64_t sub_24B3D9E18()
{
  return MEMORY[0x270EEFCA8]();
}

uint64_t sub_24B3D9E28()
{
  return MEMORY[0x270EEFDF8]();
}

uint64_t sub_24B3D9E38()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_24B3D9E48()
{
  return MEMORY[0x270EEFE78]();
}

uint64_t sub_24B3D9E58()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_24B3D9E68()
{
  return MEMORY[0x270EEFFD0]();
}

uint64_t sub_24B3D9E78()
{
  return MEMORY[0x270EEFFF8]();
}

uint64_t sub_24B3D9E88()
{
  return MEMORY[0x270EF07D8]();
}

uint64_t sub_24B3D9E98()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_24B3D9EA8()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_24B3D9EB8()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_24B3D9EC8()
{
  return MEMORY[0x270FA2A48]();
}

uint64_t sub_24B3D9ED8()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_24B3D9EE8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24B3D9EF8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24B3D9F08()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_24B3D9F18()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24B3D9F28()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_24B3D9F38()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_24B3D9F48()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_24B3D9F58()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t sub_24B3D9F68()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_24B3D9F78()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_24B3D9F88()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_24B3D9F98()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_24B3D9FA8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24B3D9FB8()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24B3D9FC8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24B3D9FD8()
{
  return MEMORY[0x270F9D658]();
}

uint64_t sub_24B3D9FE8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24B3D9FF8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24B3DA008()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24B3DA018()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24B3DA028()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24B3DA038()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24B3DA058()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24B3DA068()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24B3DA078()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24B3DA088()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24B3DA098()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24B3DA0A8()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_24B3DA0B8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24B3DA0C8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24B3DA0D8()
{
  return MEMORY[0x270EF1CA0]();
}

uint64_t sub_24B3DA0E8()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_24B3DA0F8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24B3DA108()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24B3DA118()
{
  return MEMORY[0x270FA2B98]();
}

uint64_t sub_24B3DA128()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24B3DA138()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24B3DA148()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24B3DA158()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_24B3DA168()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_24B3DA178()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_24B3DA188()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_24B3DA198()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_24B3DA1A8()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_24B3DA1B8()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_24B3DA1C8()
{
  return MEMORY[0x270EF23C0]();
}

uint64_t sub_24B3DA1D8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24B3DA1E8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24B3DA1F8()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_24B3DA208()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24B3DA218()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24B3DA228()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24B3DA238()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24B3DA248()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24B3DA258()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24B3DA268()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24B3DA278()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24B3DA288()
{
  return MEMORY[0x270F9EA80]();
}

uint64_t sub_24B3DA298()
{
  return MEMORY[0x270F9EA88]();
}

uint64_t sub_24B3DA2A8()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_24B3DA2B8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24B3DA2C8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24B3DA2D8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24B3DA2E8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24B3DA2F8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24B3DA308()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24B3DA318()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24B3DA338()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24B3DA348()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24B3DA358()
{
  return MEMORY[0x270F9F2D8]();
}

uint64_t sub_24B3DA368()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24B3DA378()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24B3DA388()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24B3DA398()
{
  return MEMORY[0x270F9F410]();
}

uint64_t sub_24B3DA3A8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24B3DA3B8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24B3DA3C8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24B3DA3D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24B3DA3E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24B3DA3F8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24B3DA408()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24B3DA418()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24B3DA428()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24B3DA438()
{
  return MEMORY[0x270EF26C0]();
}

uint64_t sub_24B3DA448()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_24B3DA458()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24B3DA468()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24B3DA478()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24B3DA488()
{
  return MEMORY[0x270EF2768]();
}

uint64_t sub_24B3DA498()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24B3DA4A8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24B3DA4B8()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_24B3DA4E8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DB8](path, name, value, size, *(void *)&position, *(void *)&options);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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