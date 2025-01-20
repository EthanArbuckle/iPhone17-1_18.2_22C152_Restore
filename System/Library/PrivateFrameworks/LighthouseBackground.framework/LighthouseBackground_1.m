unint64_t sub_254521428()
{
  unint64_t result;

  result = qword_269DF4EC0;
  if (!qword_269DF4EC0)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4EC0);
  }
  return result;
}

unint64_t sub_254521480()
{
  unint64_t result = qword_269DF4EC8;
  if (!qword_269DF4EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4EC8);
  }
  return result;
}

unint64_t sub_2545214D8()
{
  unint64_t result = qword_269DF4ED0;
  if (!qword_269DF4ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4ED0);
  }
  return result;
}

uint64_t sub_25452152C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 7235949 && a2 == 0xE300000000000000;
  if (v3 || (sub_2545279E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7889261 && a2 == 0xE300000000000000 || (sub_2545279E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1851876717 && a2 == 0xE400000000000000 || (sub_2545279E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2545279E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t SandboxExtension.__allocating_init(token:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = 0;
  *(unsigned char *)(result + 40) = 1;
  *(void *)(result + 16) = a1;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SandboxExtension.consume()()
{
  uint64_t v1 = v0;
  if (*(unsigned char *)(v0 + 40))
  {
    sub_254527040();
    uint64_t v2 = sandbox_extension_consume();
    uint64_t v3 = swift_release();
    if (v2 < 0)
    {
      unsigned int v12 = MEMORY[0x25A27B630](v3);
      int v13 = MEMORY[0x25A27B630]();
      if (strerror(v13))
      {
        uint64_t v14 = sub_254526FC0();
        uint64_t v16 = v15;
        sub_254521998();
        swift_allocError();
        void *v17 = v12;
        v17[1] = v14;
        v17[2] = v16;
        swift_willThrow();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      *(void *)(v1 + 32) = v2;
      *(unsigned char *)(v1 + 40) = 0;
    }
  }
  else
  {
    if (qword_26B267240 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_254526E00();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B267340);
    swift_retain_n();
    v5 = sub_254526DE0();
    os_log_type_t v6 = sub_254527410();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v18 = v8;
      *(_DWORD *)v7 = 136315138;
      swift_retain();
      unint64_t v9 = SandboxExtension.description.getter();
      unint64_t v11 = v10;
      swift_release();
      sub_254498B68(v9, v11, &v18);
      sub_254527500();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_254486000, v5, v6, "SandboxExtension already consumed: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27C9E0](v8, -1, -1);
      MEMORY[0x25A27C9E0](v7, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
}

uint64_t SandboxExtension.token.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SandboxExtension.init(token:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a2;
  *(void *)(v2 + 32) = 0;
  *(unsigned char *)(v2 + 40) = 1;
  *(void *)(v2 + 16) = a1;
  return v2;
}

unint64_t sub_254521998()
{
  unint64_t result = qword_269DF4ED8;
  if (!qword_269DF4ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4ED8);
  }
  return result;
}

uint64_t SandboxExtension.deinit()
{
  if ((*(unsigned char *)(v0 + 40) & 1) == 0) {
    sandbox_extension_release();
  }
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SandboxExtension.__deallocating_deinit()
{
  if ((*(unsigned char *)(v0 + 40) & 1) == 0) {
    sandbox_extension_release();
  }
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 41, 7);
}

unint64_t SandboxExtension.description.getter()
{
  uint64_t v1 = v0;
  sub_254527630();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_254521DB0(16, v2, v3, v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  MEMORY[0x25A27B820](v5, v7, v9, v11);
  sub_254527080();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_254527080();
  sub_2545279B0();
  sub_254527080();
  swift_bridgeObjectRelease();
  sub_254527080();
  return 0xD000000000000018;
}

char *static SandboxExtension.issue(auditToken:url:readonly:)()
{
  sub_254526C30();
  uint64_t v0 = sub_254527040();
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)sandbox_extension_issue_file_to_process();
  uint64_t v2 = swift_release();
  if (v1)
  {
    uint64_t v3 = sub_254526FC0();
    if (v4)
    {
      uint64_t v5 = v3;
      uint64_t v6 = v4;
      uint64_t v0 = swift_allocObject();
      *(void *)(v0 + 24) = v6;
      *(void *)(v0 + 32) = 0;
      *(unsigned char *)(v0 + 40) = 1;
      *(void *)(v0 + 16) = v5;
    }
    else
    {
      sub_254521998();
      swift_allocError();
      *int v13 = 0;
      v13[1] = 0;
      v13[2] = 1;
      swift_willThrow();
    }
    free(v1);
    return (char *)v0;
  }
  unsigned int v7 = MEMORY[0x25A27B630](v2);
  int v8 = MEMORY[0x25A27B630]();
  unint64_t result = strerror(v8);
  if (result)
  {
    uint64_t v10 = sub_254526FC0();
    uint64_t v0 = v11;
    sub_254521998();
    swift_allocError();
    *unsigned int v12 = v7;
    v12[1] = v10;
    v12[2] = v0;
    swift_willThrow();
    return (char *)v0;
  }
  __break(1u);
  return result;
}

unint64_t sub_254521D8C()
{
  return SandboxExtension.description.getter();
}

uint64_t sub_254521DB0(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_254527070();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

unint64_t destroy for SandboxError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 16);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s20LighthouseBackground12SandboxErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = *(void *)(a2 + 16);
  }
  if ((int)v4 - 1 < 0)
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  return a1;
}

uint64_t assignWithCopy for SandboxError(uint64_t a1, long long *a2)
{
  LODWORD(v4) = -1;
  if (*(void *)(a1 + 16) >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 16);
  }
  int v6 = v5 - 1;
  if (*((void *)a2 + 2) < 0xFFFFFFFFuLL) {
    uint64_t v4 = *((void *)a2 + 2);
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
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
    long long v8 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithTake for SandboxError(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 16);
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = *(void *)(a2 + 16);
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = *(void *)(a2 + 16);
    }
    if ((int)v7 - 1 < 0)
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SandboxError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  unsigned int v5 = v4 + 1;
  unsigned int v6 = v4 - 1;
  if (v5 >= 3) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SandboxError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_2545220D4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_2545220F8(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    result[1] = 0;
    result[2] = 0;
    *unint64_t result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[2] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SandboxError()
{
  return &type metadata for SandboxError;
}

uint64_t type metadata accessor for SandboxExtension()
{
  return self;
}

uint64_t method lookup function for SandboxExtension(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SandboxExtension);
}

uint64_t dispatch thunk of SandboxExtension.__allocating_init(token:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_254522188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3780);
  MEMORY[0x270FA5388](v8 - 8);
  char v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
  MEMORY[0x270FA5388](v11);
  int v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_2544AB568(a1);
    sub_254523F5C(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_2544AB568((uint64_t)v10);
  }
  else
  {
    sub_2544AED30(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *int v4 = 0x8000000000000000;
    sub_2544BB520((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *int v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void (*sub_254522338(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  unsigned int v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_254524314(v6, a2, a3);
  return sub_2545223B8;
}

void sub_2545223B8(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t LedgerStateDefinition.index.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LedgerStateDefinition.index.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LedgerStateDefinition.index.modify())()
{
  return nullsub_1;
}

LighthouseBackground::LedgerStateDefinition __swiftcall LedgerStateDefinition.init(index:)(LighthouseBackground::LedgerStateDefinition index)
{
  *uint64_t v1 = index;
  return index;
}

uint64_t LedgerStateDefinition.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_254527060();

  return swift_bridgeObjectRelease();
}

uint64_t static LedgerStateDefinition.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2545279E0();
  }
}

uint64_t sub_254522528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254525140(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_254522554(uint64_t a1)
{
  unint64_t v2 = sub_254522704();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254522590(uint64_t a1)
{
  unint64_t v2 = sub_254522704();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LedgerStateDefinition.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF4EE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254522704();
  sub_254527B00();
  sub_254527930();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_254522704()
{
  unint64_t result = qword_269DF4EE8;
  if (!qword_269DF4EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4EE8);
  }
  return result;
}

uint64_t LedgerStateDefinition.hashValue.getter()
{
  return sub_254527AB0();
}

uint64_t LedgerStateDefinition.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF4EF0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254522704();
  sub_254527AF0();
  if (!v2)
  {
    uint64_t v9 = sub_254527830();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_254522924()
{
  return sub_254527AB0();
}

uint64_t sub_254522980()
{
  swift_bridgeObjectRetain();
  sub_254527060();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2545229D8()
{
  return sub_254527AB0();
}

uint64_t sub_254522A30@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return LedgerStateDefinition.init(from:)(a1, a2);
}

uint64_t sub_254522A48(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF4EE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254522704();
  sub_254527B00();
  sub_254527930();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_254522B80(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2545279E0();
  }
}

uint64_t LedgerRecipe.project.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LedgerRecipe.project.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*LedgerRecipe.project.modify())()
{
  return nullsub_1;
}

uint64_t LedgerRecipe.events.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LedgerRecipe.events.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*LedgerRecipe.events.modify())()
{
  return nullsub_1;
}

uint64_t LedgerRecipe.transitions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LedgerRecipe.transitions.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*LedgerRecipe.transitions.modify())()
{
  return nullsub_1;
}

LighthouseBackground::LedgerRecipe __swiftcall LedgerRecipe.init(project:events:transitions:)(Swift::String project, Swift::OpaquePointer events, Swift::OpaquePointer transitions)
{
  *(Swift::String *)uint64_t v3 = project;
  *(Swift::OpaquePointer *)(v3 + 16) = events;
  *(Swift::OpaquePointer *)(v3 + 24) = transitions;
  result.project = project;
  result.transitions = transitions;
  result.events = events;
  return result;
}

uint64_t sub_254522CEC(char a1)
{
  return *(void *)&aProject_0[8 * a1];
}

uint64_t sub_254522D0C()
{
  return sub_254522CEC(*v0);
}

uint64_t sub_254522D14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2545251C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254522D3C(uint64_t a1)
{
  unint64_t v2 = sub_254522FC8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254522D78(uint64_t a1)
{
  unint64_t v2 = sub_254522FC8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LedgerRecipe.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF4EF8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254522FC8();
  sub_254527B00();
  LOBYTE(v15) = 0;
  uint64_t v8 = v13;
  sub_254527930();
  if (!v8)
  {
    uint64_t v9 = v11;
    uint64_t v15 = v12;
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF4F08);
    sub_254523380(&qword_269DF4F10, (void (*)(void))sub_25452301C);
    sub_254527970();
    uint64_t v15 = v9;
    char v14 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3C98);
    sub_2544C6460();
    sub_254527970();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_254522FC8()
{
  unint64_t result = qword_269DF4F00;
  if (!qword_269DF4F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F00);
  }
  return result;
}

unint64_t sub_25452301C()
{
  unint64_t result = qword_269DF4F18;
  if (!qword_269DF4F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F18);
  }
  return result;
}

uint64_t LedgerRecipe.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF4F20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254522FC8();
  sub_254527AF0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v20) = 0;
  uint64_t v9 = sub_254527830();
  uint64_t v11 = v10;
  uint64_t v18 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF4F08);
  char v19 = 1;
  sub_254523380(&qword_269DF4F28, (void (*)(void))sub_2545233F0);
  swift_bridgeObjectRetain();
  sub_254527870();
  uint64_t v12 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3C98);
  char v19 = 2;
  sub_2544C6670();
  uint64_t v17 = v12;
  swift_bridgeObjectRetain();
  sub_254527870();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v17;
  *a2 = v18;
  a2[1] = v11;
  a2[2] = v14;
  a2[3] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_254523380(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF4F08);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2545233F0()
{
  unint64_t result = qword_269DF4F30;
  if (!qword_269DF4F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F30);
  }
  return result;
}

uint64_t sub_254523444@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return LedgerRecipe.init(from:)(a1, a2);
}

uint64_t sub_25452345C(void *a1)
{
  return LedgerRecipe.encode(to:)(a1);
}

uint64_t LedgerState.init(def:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  type metadata accessor for LedgerState();
  return sub_254526CF0();
}

uint64_t Graph<>.init(recipe:)(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3780);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  v107 = (char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v93 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
  uint64_t v110 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v112 = (unsigned int (**)(char *, uint64_t, uint64_t))((char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v109 = (uint64_t)&v93 - v10;
  uint64_t v108 = type metadata accessor for LedgerState();
  MEMORY[0x270FA5388](v108);
  uint64_t v12 = (uint64_t *)((char *)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *a1;
  uint64_t v14 = (char *)a1[1];
  uint64_t v15 = a1[2];
  uint64_t v98 = a1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF36E8);
  uint64_t v16 = (void *)swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v17 = MEMORY[0x263F8EE78];
  v16[4] = sub_2544A57B0(MEMORY[0x263F8EE78]);
  uint64_t v18 = v16 + 4;
  v16[2] = v13;
  v16[3] = v14;
  unint64_t v19 = sub_2544A57B0(v17);
  uint64_t v103 = 0;
  swift_beginAccess();
  v16[4] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v15 + 16);
  uint64_t v111 = v7;
  v113 = v16 + 4;
  v100 = v16;
  if (v20)
  {
    v106 = v14;
    swift_retain();
    swift_bridgeObjectRetain();
    v105 = (uint64_t (*)())v15;
    v21 = (uint64_t *)(v15 + 40);
    while (1)
    {
      uint64_t v22 = *(v21 - 1);
      uint64_t v23 = *v21;
      *uint64_t v12 = v22;
      v12[1] = v23;
      swift_bridgeObjectRetain();
      sub_254526CF0();
      uint64_t v24 = v109;
      sub_25448D018((uint64_t)v12, v109);
      *(void *)(v24 + *(int *)(v111 + 52)) = MEMORY[0x263F8EE78];
      swift_beginAccess();
      sub_2544AED30(v24, (uint64_t)v112);
      swift_bridgeObjectRetain();
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v114[0] = *v18;
      uint64_t v26 = v114[0];
      *uint64_t v18 = 0x8000000000000000;
      unint64_t v28 = sub_2544B9B58(v22, v23);
      uint64_t v29 = *(void *)(v26 + 16);
      BOOL v30 = (v27 & 1) == 0;
      uint64_t v31 = v29 + v30;
      if (__OFADD__(v29, v30)) {
        goto LABEL_76;
      }
      char v32 = v27;
      if (*(void *)(v26 + 24) >= v31)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          v35 = (void *)v114[0];
          if ((v27 & 1) == 0) {
            goto LABEL_12;
          }
        }
        else
        {
          sub_2544BBD68();
          v35 = (void *)v114[0];
          if ((v32 & 1) == 0) {
            goto LABEL_12;
          }
        }
      }
      else
      {
        sub_2544B9DB4(v31, isUniquelyReferenced_nonNull_native);
        unint64_t v33 = sub_2544B9B58(v22, v23);
        if ((v32 & 1) != (v34 & 1)) {
          goto LABEL_80;
        }
        unint64_t v28 = v33;
        v35 = (void *)v114[0];
        if ((v32 & 1) == 0)
        {
LABEL_12:
          v35[(v28 >> 6) + 8] |= 1 << v28;
          v36 = (uint64_t *)(v35[6] + 16 * v28);
          uint64_t *v36 = v22;
          v36[1] = v23;
          sub_2544AED30((uint64_t)v112, v35[7] + *(void *)(v110 + 72) * v28);
          uint64_t v37 = v35[2];
          BOOL v38 = __OFADD__(v37, 1);
          uint64_t v39 = v37 + 1;
          if (v38) {
            goto LABEL_78;
          }
          v35[2] = v39;
          swift_bridgeObjectRetain();
          goto LABEL_4;
        }
      }
      sub_254524A80((uint64_t)v112, v35[7] + *(void *)(v110 + 72) * v28);
LABEL_4:
      v21 += 2;
      uint64_t v18 = v113;
      void *v113 = v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_25448D07C((uint64_t)v12);
      if (!--v20)
      {
        swift_bridgeObjectRelease();
        uint64_t v7 = v111;
        goto LABEL_18;
      }
    }
  }
  swift_retain();
LABEL_18:
  uint64_t v40 = v98;
  uint64_t v41 = *(void *)(v98 + 64);
  uint64_t v95 = v98 + 64;
  uint64_t v42 = 1 << *(unsigned char *)(v98 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v43 = 0;
  uint64_t v44 = -1;
  if (v42 < 64) {
    uint64_t v44 = ~(-1 << v42);
  }
  unint64_t v45 = v44 & v41;
  int64_t v96 = (unint64_t)(v42 + 63) >> 6;
  v46 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v110 + 56);
  v112 = (unsigned int (**)(char *, uint64_t, uint64_t))(v110 + 48);
  v106 = v6;
  while (1)
  {
    if (v45)
    {
      unint64_t v47 = __clz(__rbit64(v45));
      uint64_t v48 = (v45 - 1) & v45;
      unint64_t v49 = v47 | (v43 << 6);
      goto LABEL_35;
    }
    BOOL v38 = __OFADD__(v43++, 1);
    if (v38) {
      goto LABEL_77;
    }
    if (v43 >= v96)
    {
LABEL_74:
      v91 = v100;
      swift_release();
      swift_release();
      return (uint64_t)v91;
    }
    unint64_t v50 = *(void *)(v95 + 8 * v43);
    if (!v50) {
      break;
    }
LABEL_34:
    uint64_t v48 = (v50 - 1) & v50;
    unint64_t v49 = __clz(__rbit64(v50)) + (v43 << 6);
LABEL_35:
    v52 = *(void **)(*(void *)(v40 + 56) + 8 * v49);
    if (!v52[2])
    {
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
    v53 = (uint64_t *)(*(void *)(v40 + 48) + 16 * v49);
    uint64_t v54 = v53[1];
    uint64_t v108 = *v53;
    BOOL v55 = v52[4] == 42 && v52[5] == 0xE100000000000000;
    int64_t v102 = v43;
    unint64_t v101 = v48;
    if (v55)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      char v56 = sub_2545279E0();
      swift_bridgeObjectRetain();
      if ((v56 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        goto LABEL_44;
      }
    }
    uint64_t v57 = swift_bridgeObjectRetain();
    v52 = (void *)sub_2544D51E0(v57);
    swift_bridgeObjectRelease();
LABEL_44:
    swift_bridgeObjectRetain();
    uint64_t v58 = v103;
    uint64_t v59 = sub_254524910((uint64_t)v52, v108, v54);
    uint64_t v103 = v58;
    swift_bridgeObjectRelease();
    uint64_t v109 = v54;
    swift_bridgeObjectRelease();
    uint64_t v104 = v59;
    uint64_t v60 = *(void *)(v59 + 16);
    if (v60)
    {
      v61 = (uint64_t *)(v104 + 40);
      while (1)
      {
        uint64_t v62 = *v61;
        uint64_t v63 = *v18;
        if (!*(void *)(*v18 + 16)) {
          break;
        }
        uint64_t v64 = *(v61 - 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v65 = sub_2544B9B58(v64, v62);
        if (v66)
        {
          uint64_t v67 = v110;
          sub_254493CFC(*(void *)(v63 + 56) + *(void *)(v110 + 72) * v65, (uint64_t)v6, &qword_269DF3788);
          v68 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v67 + 56);
          v68(v6, 0, 1, v7);
        }
        else
        {
          v68 = *v46;
          (*v46)(v6, 1, 1, v7);
        }
        swift_bridgeObjectRelease();
        v69 = *v112;
        if ((*v112)(v6, 1, v7) == 1) {
          goto LABEL_52;
        }
        sub_2544AB568((uint64_t)v6);
        uint64_t v70 = *v113;
        if (!*(void *)(*v113 + 16))
        {
          uint64_t v75 = v7;
          uint64_t v73 = (uint64_t)v107;
          v68(v107, 1, 1, v75);
LABEL_59:
          sub_2544AB568(v73);
          uint64_t v7 = v111;
          goto LABEL_62;
        }
        swift_bridgeObjectRetain();
        unint64_t v71 = sub_2544B9B58(v108, v109);
        if (v72)
        {
          uint64_t v73 = (uint64_t)v107;
          sub_254493CFC(*(void *)(v70 + 56) + *(void *)(v110 + 72) * v71, (uint64_t)v107, &qword_269DF3788);
          uint64_t v74 = 0;
        }
        else
        {
          uint64_t v74 = 1;
          uint64_t v73 = (uint64_t)v107;
        }
        uint64_t v76 = v111;
        v68((char *)v73, v74, 1, v111);
        swift_bridgeObjectRelease();
        unsigned int v77 = v69((char *)v73, 1, v76);
        uint64_t v6 = v106;
        if (v77 == 1) {
          goto LABEL_59;
        }
        sub_2544AB568(v73);
        swift_bridgeObjectRetain();
        v105 = sub_25448894C();
        v78 = sub_254522338(v114, v64, v62);
        v80 = v79;
        uint64_t v7 = v111;
        if (!v69(v79, 1, v111))
        {
          v99 = (void (*)(void *, void))v78;
          uint64_t v81 = *(int *)(v7 + 52);
          v82 = *(void **)&v80[v81];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          char v83 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v97 = v81;
          *(void *)&v80[v81] = v82;
          v84 = v80;
          if ((v83 & 1) == 0)
          {
            v82 = sub_2544B91E0(0, v82[2] + 1, 1, v82);
            *(void *)&v80[v97] = v82;
          }
          unint64_t v86 = v82[2];
          unint64_t v85 = v82[3];
          unint64_t v87 = v86 + 1;
          if (v86 >= v85 >> 1)
          {
            unint64_t v94 = v86 + 1;
            v90 = sub_2544B91E0((void *)(v85 > 1), v86 + 1, 1, v82);
            unint64_t v87 = v94;
            v82 = v90;
            *(void *)&v84[v97] = v90;
          }
          uint64_t v18 = v113;
          v82[2] = v87;
          v88 = &v82[4 * v86];
          v88[4] = v64;
          v88[5] = v62;
          uint64_t v89 = v109;
          v88[6] = v108;
          v88[7] = v89;
          v99(v114, 0);
          swift_bridgeObjectRelease();
          ((void (*)(unsigned char *, void))v105)(v115, 0);
          goto LABEL_63;
        }
        ((void (*)(void *, void))v78)(v114, 0);
        swift_bridgeObjectRelease();
        ((void (*)(unsigned char *, void))v105)(v115, 0);
LABEL_62:
        uint64_t v18 = v113;
LABEL_63:
        v61 += 2;
        swift_bridgeObjectRelease();
        if (!--v60) {
          goto LABEL_21;
        }
      }
      (*v46)(v6, 1, 1, v7);
      swift_bridgeObjectRetain();
LABEL_52:
      sub_2544AB568((uint64_t)v6);
      goto LABEL_62;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v40 = v98;
    int64_t v43 = v102;
    unint64_t v45 = v101;
  }
  int64_t v51 = v43 + 1;
  if (v43 + 1 >= v96) {
    goto LABEL_74;
  }
  unint64_t v50 = *(void *)(v95 + 8 * v51);
  if (v50) {
    goto LABEL_33;
  }
  int64_t v51 = v43 + 2;
  if (v43 + 2 >= v96) {
    goto LABEL_74;
  }
  unint64_t v50 = *(void *)(v95 + 8 * v51);
  if (v50) {
    goto LABEL_33;
  }
  int64_t v51 = v43 + 3;
  if (v43 + 3 >= v96) {
    goto LABEL_74;
  }
  unint64_t v50 = *(void *)(v95 + 8 * v51);
  if (v50)
  {
LABEL_33:
    int64_t v43 = v51;
    goto LABEL_34;
  }
  while (1)
  {
    int64_t v43 = v51 + 1;
    if (__OFADD__(v51, 1)) {
      break;
    }
    if (v43 >= v96) {
      goto LABEL_74;
    }
    unint64_t v50 = *(void *)(v95 + 8 * v43);
    ++v51;
    if (v50) {
      goto LABEL_34;
    }
  }
LABEL_79:
  __break(1u);
LABEL_80:
  uint64_t result = sub_254527A30();
  __break(1u);
  return result;
}

uint64_t sub_254523F5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2544B9B58(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2544BBD68();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
    uint64_t v20 = *(void *)(v13 - 8);
    sub_2544AED30(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_2545240F4(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

unint64_t sub_2545240F4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_254527570();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_254527A80();
        swift_bridgeObjectRetain();
        sub_254527060();
        uint64_t v9 = sub_254527AB0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788) - 8) + 72);
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
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
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

void (*sub_254524314(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  unint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_2545246B8(v6);
  v6[10] = sub_254524434(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_2545243C0;
}

void sub_2545243C0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);

  free(v1);
}

void (*sub_254524434(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  unint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[1] = a3;
  v10[2] = v4;
  *unint64_t v10 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3780);
  uint64_t v12 = malloc(*(void *)(*(void *)(v11 - 8) + 64));
  v10[3] = v12;
  uint64_t v13 = *v4;
  unint64_t v15 = sub_2544B9B58(a2, a3);
  *((unsigned char *)v10 + 40) = v14 & 1;
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
  }
  else
  {
    char v19 = v14;
    uint64_t v20 = *(void *)(v13 + 24);
    if (v20 >= v18 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v15;
      if (v19)
      {
LABEL_8:
        uint64_t v21 = *(void *)(*v5 + 56);
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
        uint64_t v23 = *(void *)(v22 - 8);
        sub_2544AED30(v21 + *(void *)(v23 + 72) * v15, (uint64_t)v12);
        uint64_t v24 = 0;
LABEL_12:
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v12, v24, 1, v22);
        return sub_25452465C;
      }
LABEL_11:
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = 1;
      goto LABEL_12;
    }
    if (v20 >= v18 && (a4 & 1) == 0)
    {
      sub_2544BBD68();
      goto LABEL_7;
    }
    sub_2544B9DB4(v18, a4 & 1);
    unint64_t v25 = sub_2544B9B58(a2, a3);
    if ((v19 & 1) == (v26 & 1))
    {
      unint64_t v15 = v25;
      v10[4] = v25;
      if (v19) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_254527A30();
  __break(1u);
  return result;
}

void sub_25452465C(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)(*a1)[3];
  sub_2545246F4((uint64_t)v2, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[2], (*a1)[4], **a1, (*a1)[1]);
  sub_2544AB568((uint64_t)v2);
  free(v2);

  free(v1);
}

uint64_t (*sub_2545246B8(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_2545246E8;
}

uint64_t sub_2545246E8(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

unint64_t sub_2545246F4(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = a5;
  uint64_t v23 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3780);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  BOOL v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  char v19 = (char *)&v22 - v18;
  sub_254493CFC(a1, (uint64_t)v12, &qword_269DF3780);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    unint64_t result = sub_2544AB568((uint64_t)v12);
    if (a2)
    {
      swift_arrayDestroy();
      return sub_2545240F4(a4, *a3);
    }
  }
  else
  {
    sub_2544AED30((uint64_t)v12, (uint64_t)v19);
    uint64_t v21 = (void *)*a3;
    if (a2)
    {
      return sub_2544AED30((uint64_t)v19, v21[7] + *(void *)(v14 + 72) * a4);
    }
    else
    {
      sub_2544AED30((uint64_t)v19, (uint64_t)v17);
      sub_2544BBB64(a4, v22, v23, (uint64_t)v17, v21);
      return swift_bridgeObjectRetain();
    }
  }
  return result;
}

uint64_t sub_2545248FC()
{
  return 0x7865646E69;
}

uint64_t sub_254524910(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(result + 16);
  if (!v3) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t v6 = 0;
  uint64_t v7 = result + 40;
  uint64_t v8 = -(uint64_t)v3;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v19 = result + 40;
  do
  {
    if (v6 <= v3) {
      unint64_t v10 = v3;
    }
    else {
      unint64_t v10 = v6;
    }
    uint64_t v11 = -(uint64_t)v10;
    for (i = (uint64_t *)(v7 + 16 * v6++); ; i += 2)
    {
      if (v11 + v6 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v13 = *(i - 1);
      uint64_t v14 = *i;
      if (v13 != a2 || v14 != a3)
      {
        unint64_t result = sub_2545279E0();
        if ((result & 1) == 0) {
          break;
        }
      }
      ++v6;
      if (v8 + v6 == 1) {
        return v9;
      }
    }
    swift_bridgeObjectRetain();
    unint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      unint64_t result = sub_2544FEE08(0, *(void *)(v9 + 16) + 1, 1);
    }
    unint64_t v17 = *(void *)(v9 + 16);
    unint64_t v16 = *(void *)(v9 + 24);
    if (v17 >= v16 >> 1) {
      unint64_t result = sub_2544FEE08(v16 > 1, v17 + 1, 1);
    }
    *(void *)(v9 + 16) = v17 + 1;
    uint64_t v18 = v9 + 16 * v17;
    *(void *)(v18 + 32) = v13;
    *(void *)(v18 + 40) = v14;
    unint64_t v3 = v20;
    uint64_t v7 = v19;
  }
  while (v8 + v6);
  return v9;
}

uint64_t sub_254524A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF3788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_254524AE8(void *a1)
{
  a1[1] = sub_2545233F0();
  a1[2] = sub_25452301C();
  unint64_t result = sub_254524B20();
  a1[3] = result;
  return result;
}

unint64_t sub_254524B20()
{
  unint64_t result = qword_269DF4F38;
  if (!qword_269DF4F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F38);
  }
  return result;
}

unint64_t sub_254524B78()
{
  unint64_t result = qword_269DF4F40;
  if (!qword_269DF4F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F40);
  }
  return result;
}

ValueMetadata *type metadata accessor for LedgerStateDefinition()
{
  return &type metadata for LedgerStateDefinition;
}

uint64_t destroy for LedgerRecipe()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for LedgerRecipe(void *a1, void *a2)
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

void *assignWithCopy for LedgerRecipe(void *a1, void *a2)
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

uint64_t assignWithTake for LedgerRecipe(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LedgerRecipe()
{
  return &type metadata for LedgerRecipe;
}

unsigned char *storeEnumTagSinglePayload for LedgerRecipe.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x254524E24);
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

ValueMetadata *type metadata accessor for LedgerRecipe.CodingKeys()
{
  return &type metadata for LedgerRecipe.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for LedgerStateDefinition.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x254524EF8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LedgerStateDefinition.CodingKeys()
{
  return &type metadata for LedgerStateDefinition.CodingKeys;
}

unint64_t sub_254524F34()
{
  unint64_t result = qword_269DF4F48;
  if (!qword_269DF4F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F48);
  }
  return result;
}

unint64_t sub_254524F8C()
{
  unint64_t result = qword_269DF4F50;
  if (!qword_269DF4F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F50);
  }
  return result;
}

unint64_t sub_254524FE4()
{
  unint64_t result = qword_269DF4F58;
  if (!qword_269DF4F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F58);
  }
  return result;
}

unint64_t sub_25452503C()
{
  unint64_t result = qword_269DF4F60;
  if (!qword_269DF4F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F60);
  }
  return result;
}

unint64_t sub_254525094()
{
  unint64_t result = qword_269DF4F68;
  if (!qword_269DF4F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F68);
  }
  return result;
}

unint64_t sub_2545250EC()
{
  unint64_t result = qword_269DF4F70;
  if (!qword_269DF4F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF4F70);
  }
  return result;
}

uint64_t sub_254525140(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2545279E0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2545251C0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7463656A6F7270 && a2 == 0xE700000000000000;
  if (v3 || (sub_2545279E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746E657665 && a2 == 0xE600000000000000 || (sub_2545279E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x697469736E617274 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2545279E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_254525310(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B266FC8);
  if (swift_dynamicCast())
  {
    sub_2544D79D4(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_254526BF0();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_254526144((uint64_t)v38);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      char v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_2545276A0();
      }
      if (v4) {
        char v6 = (unsigned char *)(v4 + v5);
      }
      else {
        char v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_254526910(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_2545270A0();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_254526974(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_254526220((void *(*)(uint64_t *__return_ptr, char *, char *))sub_254526A14);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_254526C90();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_2545261A4(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_2545270D0();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_2545276A0();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_2545261A4(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_2545270B0();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_254526CA0();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_254526CA0();
    sub_25451DFFC(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_25451DFFC((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

double defaultStreamMaxAge.getter()
{
  return 5184000.0;
}

uint64_t defaultStreamMaxSize.getter()
{
  return 0x200000;
}

id getDefaultStorageConfig(basePath:)()
{
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_254526FD0();
  id v2 = objc_msgSend(v0, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v1);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A660]), sel_initPruneOnAccess_filterByAgeOnRead_maxAge_maxStreamSize_, 1, 1, 0x200000, 5184000.0);
  objc_msgSend(v2, sel_setPruningPolicy_, v3);

  return v2;
}

id getStorageStream(stream:basePath:)()
{
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_254526FD0();
  id v2 = objc_msgSend(v0, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v1);

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A660]), sel_initPruneOnAccess_filterByAgeOnRead_maxAge_maxStreamSize_, 1, 1, 0x200000, 5184000.0);
  objc_msgSend(v2, sel_setPruningPolicy_, v3);

  type metadata accessor for LHStoreItem();
  id v4 = objc_allocWithZone(MEMORY[0x263F2A990]);
  id v5 = v2;
  char v6 = (void *)sub_254526FD0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithPrivateStreamIdentifier_storeConfig_eventDataClass_, v6, v5, swift_getObjCClassFromMetadata());

  return v7;
}

uint64_t createStorageItem<A>(payload:)(uint64_t a1, uint64_t a2, uint64_t (**a3)(void, id))
{
  uint64_t v41 = a1;
  uint64_t v37 = a3;
  uint64_t v39 = a2;
  uint64_t v3 = sub_254527010();
  MEMORY[0x270FA5388](v3 - 8);
  v36[1] = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_254526D90();
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  char v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_254526B10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_254526B20();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254526B70();
  swift_allocObject();
  sub_254526B60();
  uint64_t v15 = v11;
  uint64_t v16 = v37;
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F06198], v15);
  uint64_t v17 = v39;
  sub_254526B40();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F06160], v7);
  sub_254526B30();
  sub_254526D80();
  sub_254526CE0();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v40);
  uint64_t v20 = v42;
  uint64_t v21 = sub_254526B50();
  if (v20)
  {
    swift_release();
    return (uint64_t)v16;
  }
  uint64_t v23 = v21;
  unint64_t v24 = v22;
  sub_254527000();
  uint64_t result = sub_254526FF0();
  if (v26)
  {
    uint64_t v27 = result;
    uint64_t v28 = v26;
    uint64_t v29 = v16[6](v17, v16);
    uint64_t v31 = v30;
    char v32 = (objc_class *)type metadata accessor for LHStoreItem();
    uint64_t v33 = (char *)objc_allocWithZone(v32);
    *(_DWORD *)&v33[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_dataVersion] = 1;
    *(void *)&v33[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messageTimestamp] = v19;
    uint64_t v34 = (uint64_t *)&v33[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messageType];
    *uint64_t v34 = v29;
    v34[1] = v31;
    uint64_t v35 = &v33[OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messagePayload];
    *(void *)uint64_t v35 = v27;
    *((void *)v35 + 1) = v28;
    v43.receiver = v33;
    v43.super_class = v32;
    uint64_t v16 = (uint64_t (**)(void, id))objc_msgSendSuper2(&v43, sel_init);
    sub_2544E848C(v23, v24);
    swift_release();
    return (uint64_t)v16;
  }
  __break(1u);
  return result;
}

uint64_t parseStorageItem<A>(item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v32 = a4;
  uint64_t v7 = sub_254526AA0();
  uint64_t v29 = *(void *)(v7 - 8);
  uint64_t v30 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_254526AB0();
  uint64_t v10 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = a1;
  uint64_t v13 = (uint64_t *)(a1 + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messageType);
  swift_beginAccess();
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 48);
  swift_bridgeObjectRetain();
  uint64_t v33 = a3;
  if (v15 == v16(a2, a3) && v14 == v17)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v19 = sub_2545279E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      sub_2544E83E4();
      swift_allocError();
      *uint64_t v20 = 1;
      return swift_willThrow();
    }
  }
  sub_254526B00();
  swift_allocObject();
  sub_254526AF0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F060E0], v28);
  sub_254526AD0();
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v9, *MEMORY[0x263F060C0], v30);
  sub_254526AC0();
  unint64_t v22 = (unint64_t *)(v31 + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_messagePayload);
  swift_beginAccess();
  unint64_t v24 = *v22;
  unint64_t v23 = v22[1];
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_254525310(v24, v23);
  unint64_t v27 = v26;
  sub_254526AE0();
  sub_2544E848C(v25, v27);
  return swift_release();
}

uint64_t sub_254526144(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B266FD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2545261A4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2545270E0();
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
    uint64_t v5 = MEMORY[0x25A27B890](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_254526220(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_254532800;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_254526BA0() && __OFSUB__((int)v4, sub_254526BD0())) {
        goto LABEL_24;
      }
      sub_254526BE0();
      swift_allocObject();
      uint64_t v13 = sub_254526B80();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_25452660C((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_254526C70();
      uint64_t result = sub_25452660C(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_254526524@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_25452674C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_254526810((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_25452688C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_25452659C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_25452660C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_254526BA0();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_254526BD0();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_254526BC0();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_2545266C0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_254527640();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25452674C(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_254526810(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_254526BE0();
  swift_allocObject();
  uint64_t result = sub_254526B90();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_254526C80();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_25452688C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_254526BE0();
  swift_allocObject();
  uint64_t result = sub_254526B90();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_254526910(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_25452674C(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_254526810((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_25452688C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_254526974(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_254526BE0();
      swift_allocObject();
      sub_254526BB0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_254526C80();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_254526A14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_25452659C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_254526A80, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_254526A80@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2545266C0(a1, a2);
}

uint64_t sub_254526AA0()
{
  return MEMORY[0x270EEDD78]();
}

uint64_t sub_254526AB0()
{
  return MEMORY[0x270EEDD88]();
}

uint64_t sub_254526AC0()
{
  return MEMORY[0x270EEDD90]();
}

uint64_t sub_254526AD0()
{
  return MEMORY[0x270EEDDA0]();
}

uint64_t sub_254526AE0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_254526AF0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_254526B00()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_254526B10()
{
  return MEMORY[0x270EEDE98]();
}

uint64_t sub_254526B20()
{
  return MEMORY[0x270EEDEA0]();
}

uint64_t sub_254526B30()
{
  return MEMORY[0x270EEDEB0]();
}

uint64_t sub_254526B40()
{
  return MEMORY[0x270EEDEB8]();
}

uint64_t sub_254526B50()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_254526B60()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_254526B70()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_254526B80()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_254526B90()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_254526BA0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_254526BB0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_254526BC0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_254526BD0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_254526BE0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_254526BF0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_254526C00()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_254526C10()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_254526C20()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_254526C30()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_254526C40()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_254526C50()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_254526C60()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_254526C70()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_254526C80()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_254526C90()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_254526CA0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_254526CB0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_254526CC0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_254526CD0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_254526CE0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_254526CF0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_254526D00()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_254526D10()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_254526D20()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_254526D30()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_254526D40()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_254526D50()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_254526D60()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_254526D70()
{
  return MEMORY[0x270EF0BE8]();
}

uint64_t sub_254526D80()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_254526D90()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_254526DA0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_254526DB0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_254526DC0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_254526DD0()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_254526DE0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_254526DF0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_254526E00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_254526E10()
{
  return MEMORY[0x270FA19D0]();
}

uint64_t sub_254526E20()
{
  return MEMORY[0x270FA1A38]();
}

uint64_t sub_254526E30()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_254526E40()
{
  return MEMORY[0x270FA1A58]();
}

uint64_t sub_254526E50()
{
  return MEMORY[0x270FA1A68]();
}

uint64_t sub_254526E60()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_254526E70()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_254526E80()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_254526E90()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_254526EA0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_254526EB0()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_254526EC0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_254526ED0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_254526EE0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_254526EF0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_254526F00()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_254526F10()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_254526F20()
{
  return MEMORY[0x270F9D200]();
}

uint64_t sub_254526F30()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_254526F40()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_254526F50()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_254526F60()
{
  return MEMORY[0x270FA2B48]();
}

uint64_t sub_254526F70()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_254526F80()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_254526F90()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_254526FA0()
{
  return MEMORY[0x270F9D4E8]();
}

uint64_t sub_254526FB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_254526FC0()
{
  return MEMORY[0x270EF1890]();
}

uint64_t sub_254526FD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_254526FE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_254526FF0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_254527000()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_254527010()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_254527020()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_254527030()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_254527040()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_254527050()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_254527060()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_254527070()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_254527080()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_254527090()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_2545270A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2545270B0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2545270C0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2545270D0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2545270E0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2545270F0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_254527110()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_254527120()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_254527130()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_254527140()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_254527150()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_254527160()
{
  return MEMORY[0x270F9DA88]();
}

uint64_t sub_254527170()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_254527180()
{
  return MEMORY[0x270F9DB08]();
}

uint64_t sub_254527190()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2545271A0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2545271B0()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_2545271C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2545271D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2545271E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2545271F0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_254527200()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_254527210()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_254527220()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_254527230()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_254527240()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_254527250()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_254527260()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_254527270()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_254527280()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_254527290()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_2545272A0()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_2545272B0()
{
  return MEMORY[0x270EF1BE8]();
}

uint64_t sub_2545272C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2545272D0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2545272E0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2545272F0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_254527300()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_254527310()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_254527320()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_254527330()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_254527340()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_254527350()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_254527360()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_254527370()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_254527380()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_254527390()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2545273A0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2545273B0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2545273C0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2545273D0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2545273E0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2545273F0()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_254527400()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_254527410()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_254527420()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_254527430()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_254527440()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_254527450()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_254527460()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_254527470()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_254527480()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_254527490()
{
  return MEMORY[0x270FA0FA8]();
}

uint64_t sub_2545274A0()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2545274B0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2545274C0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2545274D0()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_2545274E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2545274F0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_254527500()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_254527510()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_254527520()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_254527530()
{
  return MEMORY[0x270F9E6C0]();
}

uint64_t sub_254527540()
{
  return MEMORY[0x270F9E6E0]();
}

uint64_t sub_254527550()
{
  return MEMORY[0x270F9E700]();
}

uint64_t sub_254527560()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_254527570()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_254527580()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_254527590()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2545275A0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2545275B0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_2545275C0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2545275D0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2545275E0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2545275F0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_254527600()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_254527610()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_254527620()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_254527630()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_254527640()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_254527650()
{
  return MEMORY[0x270F9E9C8]();
}

uint64_t sub_254527660()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_254527670()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_254527680()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_254527690()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2545276A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2545276B0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2545276C0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2545276D0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2545276E0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2545276F0()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_254527700()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_254527710()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_254527720()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_254527730()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_254527740()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_254527750()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_254527760()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_254527770()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_254527780()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_254527790()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2545277A0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2545277B0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2545277C0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2545277D0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_2545277E0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_2545277F0()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_254527800()
{
  return MEMORY[0x270F9F298]();
}

uint64_t sub_254527810()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_254527820()
{
  return MEMORY[0x270F9F2C0]();
}

uint64_t sub_254527830()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_254527840()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_254527850()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_254527860()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_254527870()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_254527880()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_254527890()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2545278A0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_2545278B0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2545278C0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2545278D0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_2545278E0()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_2545278F0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_254527900()
{
  return MEMORY[0x270F9F3D8]();
}

uint64_t sub_254527910()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_254527920()
{
  return MEMORY[0x270F9F3F8]();
}

uint64_t sub_254527930()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_254527940()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_254527950()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_254527960()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_254527970()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_254527980()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_254527990()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_2545279A0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2545279B0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2545279D0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_2545279E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2545279F0()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_254527A10()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_254527A20()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_254527A30()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_254527A40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_254527A50()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_254527A60()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_254527A70()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_254527A80()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_254527A90()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_254527AA0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_254527AB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_254527AC0()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_254527AD0()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_254527AE0()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_254527AF0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_254527B00()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_254527B10()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_254527B40()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x270EDB2C8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x270EDBE38]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}