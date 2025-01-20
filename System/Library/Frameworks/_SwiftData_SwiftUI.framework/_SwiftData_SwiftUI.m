unint64_t ModelContext.debugDescription.getter()
{
  return 0xD000000000000016;
}

uint64_t sub_2466FFD80(uint64_t a1, uint64_t a2)
{
  return sub_2466FFF24(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2466FFDAC(uint64_t a1, uint64_t a2)
{
  return sub_2466FFF24(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2466FFDC8(uint64_t a1, id *a2)
{
  uint64_t result = sub_246716A48();
  *a2 = 0;
  return result;
}

uint64_t sub_2466FFE44(uint64_t a1, id *a2)
{
  char v3 = sub_246716A58();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2466FFEC8@<X0>(uint64_t *a1@<X8>)
{
  sub_246716A68();
  uint64_t v2 = sub_246716A38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2466FFF0C(uint64_t a1, uint64_t a2)
{
  return sub_2466FFF24(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2466FFF24(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_246716A68();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2466FFF6C()
{
  sub_246716A68();
  sub_246716A88();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2466FFFC4()
{
  sub_246716A68();
  sub_246716D38();
  sub_246716A88();
  uint64_t v0 = sub_246716D58();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_246700040()
{
  uint64_t v0 = sub_246716A68();
  uint64_t v2 = v1;
  if (v0 == sub_246716A68() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_246716CD8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2467000D0(uint64_t a1)
{
  uint64_t v2 = sub_2467003C0(&qword_268F9C3F0, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_2467003C0(&qword_268F9C3F8, type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_246700190@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_246716A38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2467001D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246716A68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_246700204(uint64_t a1)
{
  uint64_t v2 = sub_2467003C0(&qword_268F9C3E0, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_2467003C0(&qword_268F9C3E8, type metadata accessor for URLResourceKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_2467002E8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_246700330()
{
  return sub_2467003C0(&qword_268F9C3B0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_246700378()
{
  return sub_2467003C0(&qword_268F9C3B8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_2467003C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246700408()
{
  return sub_2467003C0(&qword_268F9C3C0, type metadata accessor for URLResourceKey);
}

uint64_t sub_246700450()
{
  return sub_2467003C0(&qword_268F9C3C8, type metadata accessor for URLResourceKey);
}

uint64_t sub_246700498()
{
  return sub_2467003C0(&qword_268F9C3D0, type metadata accessor for URLResourceKey);
}

uint64_t sub_2467004E0()
{
  return sub_2467003C0(&qword_268F9C3D8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_246700530()
{
  sub_2467168F8();
  MEMORY[0x270FA5388]();
  sub_246716918();
  MEMORY[0x270FA5388]();
  sub_246716878();
  sub_2467169E8();
  swift_allocObject();
  sub_2467169D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C400);
  sub_246716938();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_246717760;
  sub_246716908();
  sub_2467168E8();
  sub_246716948();
  uint64_t result = sub_246716838();
  qword_268F9DA50 = result;
  return result;
}

uint64_t sub_24670071C()
{
  if (qword_268F9C380 != -1) {
    swift_once();
  }
  sub_2467167E8();
  swift_allocObject();
  swift_retain();
  uint64_t result = sub_2467167F8();
  qword_268F9DA58 = result;
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

uint64_t AppStorage.init<A>(wrappedValue:_:store:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_246716978();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v12 = sub_246700944(&qword_268F9C408);
  uint64_t v13 = sub_246700944(&qword_268F9C410);
  uint64_t v14 = MEMORY[0x24C535840](v11, a2, a3, a4, v8, v12, v13);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  return v14;
}

uint64_t sub_246700944(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246716978();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AppStorage.init<A>(_:store:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246716978();
  uint64_t v7 = sub_246700944(&qword_268F9C408);
  uint64_t v8 = sub_246700944(&qword_268F9C410);

  return MEMORY[0x270EFEC40](a1, a2, a3, v6, v7, v8);
}

uint64_t SceneStorage.init<A>(wrappedValue:_:)(uint64_t a1)
{
  uint64_t v2 = sub_246716978();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_246700B94(&qword_268F9C408);
  sub_246700B94(&qword_268F9C410);
  sub_246716528();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t sub_246700B94(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_246716978();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SceneStorage.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C418);
  uint64_t v5 = sub_246700D18(&qword_268F9C420, &qword_268F9C408);
  uint64_t v6 = sub_246700D18(&qword_268F9C428, &qword_268F9C410);
  unint64_t v7 = sub_246700D98();

  return MEMORY[0x270EFF440](a1, a2, v4, v5, v6, v7);
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

uint64_t sub_246700D18(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C418);
    sub_246700B94(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246700D98()
{
  unint64_t result = qword_268F9C430;
  if (!qword_268F9C430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C430);
  }
  return result;
}

uint64_t View.modelContext(_:)()
{
  return swift_release();
}

uint64_t sub_246700E7C@<X0>(void *a1@<X8>)
{
  sub_246701148();
  uint64_t result = sub_246716668();
  *a1 = v3;
  return result;
}

uint64_t sub_246700ECC@<X0>(void *a1@<X8>)
{
  sub_246701148();
  uint64_t result = sub_246716668();
  *a1 = v3;
  return result;
}

uint64_t sub_246700F1C()
{
  return sub_246716678();
}

uint64_t Scene.modelContext(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[0] = swift_getKeyPath();
  v8[1] = a1;
  swift_retain();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C438);
  MEMORY[0x24C535A40](v8, a2, v6, a3);
  swift_release();
  return swift_release();
}

uint64_t sub_246701014(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVy0A4Data12ModelContextCSgGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_268F9C440);
}

uint64_t sub_246701048(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVy0A4Data12ModelContextCSgGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(a1, &qword_268F9C448);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVy0A4Data12ModelContextCSgGGAaBHPxAaBHD1__AkA0cI0HPyHCHCTm(uint64_t a1, unint64_t *a2)
{
  return swift_getWitnessTable();
}

uint64_t sub_246701100(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C438);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_246701148()
{
  unint64_t result = qword_268F9C450[0];
  if (!qword_268F9C450[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268F9C450);
  }
  return result;
}

uint64_t sub_24670119C(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1 + 48));
  uint64_t v3 = *v2;
  uint64_t v4 = *((unsigned __int8 *)v2 + 8);
  j__swift_retain(*v2, v4);
  uint64_t v5 = sub_246702188(v3, v4);
  j__swift_release(v3, v4);
  return v5;
}

uint64_t sub_2467011FC()
{
  swift_getObjectType();
  sub_246716708();
  return v1;
}

uint64_t sub_246701240()
{
  type metadata accessor for QueryController();
  sub_246716728();
  sub_246716718();
  return v1;
}

uint64_t Query.modelContext.getter(uint64_t a1)
{
  uint64_t result = sub_24670119C(a1);
  if (!result)
  {
    if (qword_268F9C388 != -1) {
      swift_once();
    }
    return swift_retain();
  }
  return result;
}

void *Query.fetchError.getter()
{
  uint64_t v0 = (void *)sub_246701240();
  uint64_t v1 = (void *)sub_246705F6C();
  id v2 = v1;

  return v1;
}

uint64_t Query.wrappedValue.getter()
{
  uint64_t v0 = (void *)sub_246701240();
  sub_246703070();

  sub_246716AF8();
  return swift_dynamicCast();
}

Swift::Void __swiftcall Query.update()()
{
  uint64_t v2 = v0;
  sub_246716B28();
  v3[1] = *(_OWORD *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 32);
  uint64_t v5 = v1;
  sub_2467014A4((uint64_t)sub_2467025B4, (uint64_t)v3);
}

uint64_t sub_24670142C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Query();
  uint64_t v3 = (void *)sub_246701240();
  uint64_t v4 = sub_24670119C(v2);
  sub_246703A78(v4, a1, *(void *)(a1 + *(int *)(v2 + 44)));

  return swift_release();
}

uint64_t sub_2467014A4(uint64_t a1, uint64_t a2)
{
  sub_246716B18();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  sub_246702EA4();
  if (v2) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    sub_246716C28();
    sub_246716A98();
    sub_246716D68();
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    uint64_t result = sub_246716C78();
    __break(1u);
  }
  return result;
}

uint64_t static Query._propertyBehaviors.getter()
{
  return 2;
}

uint64_t Query.init<A>(filter:sort:order:animation:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  return sub_246701780(a1, a2, a3, a4, a5, MEMORY[0x263F06410], a6);
}

{
  return sub_246701780(a1, a2, a3, a4, a5, MEMORY[0x263F06418], a6);
}

uint64_t sub_246701650(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270EEE9C0](a1, a2 & 1, a5);
}

uint64_t Query.init<>(_:transaction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_246716AF8();
  uint64_t v6 = (int *)type metadata accessor for Query();
  uint64_t v7 = v6[11];
  *(void *)(a3 + v7) = 1;
  uint64_t v8 = a3 + v6[12];
  *(void *)uint64_t v8 = swift_getKeyPath();
  *(unsigned char *)(v8 + 8) = 0;
  uint64_t v9 = (uint64_t *)(a3 + v6[13]);
  type metadata accessor for QueryController();
  sub_246703010();
  *uint64_t v9 = sub_2467011FC();
  v9[1] = v10;
  uint64_t v11 = sub_2467168C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(a3, a1, v11);
  uint64_t result = sub_2467025F4(*(void *)(a3 + v7));
  *(void *)(a3 + v7) = a2;
  return result;
}

uint64_t sub_246701780@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X5>, void (*a6)(uint64_t, void, uint64_t)@<X6>, uint64_t a7@<X8>)
{
  uint64_t v21 = a5;
  v22 = a6;
  uint64_t v23 = a4;
  uint64_t v24 = a7;
  uint64_t v19 = a1;
  unsigned int v20 = a3 & 1;
  uint64_t v25 = *(void *)(*a2 + *MEMORY[0x263F8EA20]);
  sub_2467163A8();
  uint64_t v8 = sub_246716BA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - v10;
  uint64_t v12 = sub_2467168C8();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v18 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  sub_246716288();
  sub_246716CC8();
  swift_allocObject();
  sub_246716AC8();
  uint64_t v15 = swift_retain();
  v22(v15, v20, v21);
  sub_246716AF8();
  sub_2467168B8();
  swift_retain();
  uint64_t v16 = sub_246716508();
  Query.init<>(_:transaction:)((uint64_t)v14, v16, v24);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v19, v8);
}

uint64_t Query.init<A>(filter:sort:order:transaction:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  return sub_246701A54(a1, a2, a3, a4, a5, MEMORY[0x263F06410], a6);
}

{
  return sub_246701A54(a1, a2, a3, a4, a5, MEMORY[0x263F06418], a6);
}

uint64_t sub_246701A54@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X5>, void (*a6)(uint64_t, void, uint64_t)@<X6>, uint64_t a7@<X8>)
{
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = a7;
  uint64_t v23 = a4;
  uint64_t v18 = a1;
  unsigned int v19 = a3 & 1;
  uint64_t v24 = *(void *)(*a2 + *MEMORY[0x263F8EA20]);
  sub_2467163A8();
  uint64_t v8 = sub_246716BA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - v10;
  uint64_t v12 = sub_2467168C8();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v17 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  sub_246716288();
  sub_246716CC8();
  swift_allocObject();
  sub_246716AC8();
  uint64_t v15 = swift_retain();
  v21(v15, v19, v20);
  sub_246716AF8();
  sub_2467168B8();
  Query.init<>(_:transaction:)((uint64_t)v14, v23, v22);
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v18, v8);
}

uint64_t Query.init<>(filter:sort:animation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  v14[1] = a2;
  sub_2467163A8();
  uint64_t v5 = sub_246716BA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - v7;
  uint64_t v9 = sub_2467168C8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v14 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  sub_2467168B8();
  swift_retain();
  uint64_t v12 = sub_246716508();
  Query.init<>(_:transaction:)((uint64_t)v11, v12, a3);
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
}

uint64_t Query.init<>(filter:sort:transaction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v15[1] = a3;
  sub_2467163A8();
  uint64_t v7 = sub_246716BA8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = sub_2467168C8();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v15 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_2467168B8();
  Query.init<>(_:transaction:)((uint64_t)v13, a2, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

uint64_t Query.init<>(_:animation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_246716AF8();
  uint64_t v4 = (int *)type metadata accessor for Query();
  uint64_t v5 = v4[11];
  *(void *)(a2 + v5) = 1;
  uint64_t v6 = a2 + v4[12];
  *(void *)uint64_t v6 = swift_getKeyPath();
  *(unsigned char *)(v6 + 8) = 0;
  uint64_t v7 = (uint64_t *)(a2 + v4[13]);
  type metadata accessor for QueryController();
  sub_246703010();
  *uint64_t v7 = sub_2467011FC();
  v7[1] = v8;
  uint64_t v9 = sub_2467168C8();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a2, a1, v9);
  uint64_t v11 = sub_246716508();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  uint64_t result = sub_2467025F4(*(void *)(a2 + v5));
  *(void *)(a2 + v5) = v11;
  return result;
}

uint64_t sub_24670216C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, a6, a5);
}

uint64_t sub_24670217C()
{
  return 2;
}

uint64_t sub_246702188(uint64_t a1, char a2)
{
  uint64_t v4 = sub_246716658();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_246716B78();
    uint64_t v9 = sub_246716698();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v14 = sub_24671364C(0xD000000000000016, 0x80000002467184A0, &v15);
      sub_246716BB8();
      _os_log_impl(&dword_2466FE000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C536640](v12, -1, -1);
      MEMORY[0x24C536640](v11, -1, -1);
    }

    sub_246716648();
    swift_getAtKeyPath();
    j__swift_release(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_246702394(void *a1, char a2)
{
  uint64_t v4 = sub_246716658();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_246716B78();
    uint64_t v9 = sub_246716698();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      v17[1] = v11 + 4;
      __swift_instantiateConcreteTypeFromMangledName(qword_268F9C4D8);
      uint64_t v13 = sub_246716D68();
      v17[2] = sub_24671364C(v13, v14, &v18);
      sub_246716BB8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2466FE000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C536640](v12, -1, -1);
      MEMORY[0x24C536640](v11, -1, -1);
    }

    sub_246716648();
    swift_getAtKeyPath();
    sub_246702EFC(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v18;
  }
  return (uint64_t)a1;
}

uint64_t sub_2467025B4()
{
  return sub_24670142C(*(void *)(v0 + 40));
}

uint64_t type metadata accessor for Query()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2467025F4(uint64_t result)
{
  if (result != 1) {
    return swift_release();
  }
  return result;
}

uint64_t sub_246702604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_24670260C()
{
  uint64_t result = sub_2467168C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2467026BC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_2467168C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[11];
    uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    if (v9 != 1) {
      uint64_t v9 = swift_retain();
    }
    *(uint64_t *)((char *)v4 + v8) = v9;
    uint64_t v10 = a3[12];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = *(void *)v12;
    unsigned __int8 v14 = v12[8];
    j__swift_retain(*(void *)v12, v14);
    *(void *)uint64_t v11 = v13;
    v11[8] = v14;
    uint64_t v15 = a3[13];
    uint64_t v16 = (uint64_t *)((char *)v4 + v15);
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *(void **)v17;
    uint64_t v19 = *((void *)v17 + 1);
    *uint64_t v16 = *(void *)v17;
    v16[1] = v19;
    id v20 = v18;
  }
  swift_retain();
  return v4;
}

uint64_t sub_2467027EC(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_2467168C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  if (*(void *)(a1 + a2[11]) != 1) {
    swift_release();
  }
  j__swift_release(*(void *)(a1 + a2[12]), *(unsigned __int8 *)(a1 + a2[12] + 8));

  return swift_release();
}

uint64_t sub_2467028A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467168C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[11];
  uint64_t v8 = *(void *)(a2 + v7);
  if (v8 != 1) {
    uint64_t v8 = swift_retain();
  }
  *(void *)(a1 + v7) = v8;
  uint64_t v9 = a3[12];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v12 = *v11;
  unsigned __int8 v13 = *((unsigned char *)v11 + 8);
  j__swift_retain(*v11, v13);
  *(void *)uint64_t v10 = v12;
  *(unsigned char *)(v10 + 8) = v13;
  uint64_t v14 = a3[13];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void **)v16;
  uint64_t v18 = *(void *)(v16 + 8);
  *uint64_t v15 = *(void *)v16;
  v15[1] = v18;
  id v19 = v17;
  swift_retain();
  return a1;
}

uint64_t sub_246702980(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467168C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[11];
  uint64_t v8 = (uint64_t *)(a1 + v7);
  uint64_t v9 = *(void *)(a2 + v7);
  if (*(void *)(a1 + v7) == 1)
  {
    if (v9 != 1)
    {
      *uint64_t v8 = v9;
      swift_retain();
      goto LABEL_9;
    }
    uint64_t v10 = 1;
  }
  else
  {
    if (v9 != 1)
    {
      *uint64_t v8 = v9;
      swift_retain();
      swift_release();
      goto LABEL_9;
    }
    sub_246702ACC(a1 + v7);
    uint64_t v10 = *(void *)(a2 + v7);
  }
  *uint64_t v8 = v10;
LABEL_9:
  uint64_t v11 = a3[12];
  uint64_t v12 = (uint64_t *)(a1 + v11);
  unsigned __int8 v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  unsigned __int8 v15 = *((unsigned char *)v13 + 8);
  j__swift_retain(*v13, v15);
  uint64_t v16 = *v12;
  uint64_t v17 = *((unsigned __int8 *)v12 + 8);
  *uint64_t v12 = v14;
  *((unsigned char *)v12 + 8) = v15;
  j__swift_release(v16, v17);
  uint64_t v18 = a3[13];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void **)(a2 + v18);
  uint64_t v22 = *(void **)v19;
  *(void *)uint64_t v19 = v21;
  id v23 = v21;

  *(void *)(v19 + 8) = *(void *)(v20 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_246702ACC(uint64_t a1)
{
  return a1;
}

uint64_t sub_246702B20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467168C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_246702BC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467168C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = *(void *)(a2 + v7);
  if (*(void *)(a1 + v7) != 1)
  {
    if (v9 != 1)
    {
      *uint64_t v8 = v9;
      swift_release();
      goto LABEL_6;
    }
    sub_246702ACC(a1 + v7);
    uint64_t v9 = *(void *)(a2 + v7);
  }
  *uint64_t v8 = v9;
LABEL_6:
  uint64_t v10 = a3[12];
  uint64_t v11 = (uint64_t *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v13 = *v12;
  LOBYTE(v12) = *((unsigned char *)v12 + 8);
  uint64_t v14 = *v11;
  uint64_t v15 = *((unsigned __int8 *)v11 + 8);
  uint64_t *v11 = v13;
  *((unsigned char *)v11 + 8) = (_BYTE)v12;
  j__swift_release(v14, v15);
  uint64_t v16 = a3[13];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = *(void **)(a1 + v16);
  *(void *)(a1 + v16) = *v18;

  *(void *)(v17 + 8) = v18[1];
  swift_release();
  return a1;
}

uint64_t sub_246702CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_246702CF4);
}

uint64_t sub_246702CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2467168C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 52));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_246702DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_246702DD0);
}

uint64_t sub_246702DD0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2467168C8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_246702E94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246702EA4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_246702EFC(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_246702F0C()
{
  uint64_t result = sub_2467168C8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2467163E8();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

id sub_246703010()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void *sub_246703044()
{
  uint64_t v0 = (void *)sub_246705F6C();
  id v1 = v0;
  return v0;
}

uint64_t sub_246703070()
{
  id v1 = v0;
  unint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C5A0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  int v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v3 + 80);
  uint64_t v7 = *(void *)(v3 + 88);
  uint64_t v8 = sub_2467168C8();
  uint64_t v36 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v10 = (char *)v32 - v9;
  sub_246716288();
  ((void (*)(void))MEMORY[0x270FA5388])();
  if ((sub_246703E98() & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  if (*(void *)((char *)v1 + *(void *)((*v2 & *v1) + 0x70)))
  {
    v32[1] = v5;
    uint64_t v35 = swift_retain();
    sub_2467167D8();
    sub_246716868();
    swift_release();
    unint64_t v11 = sub_2467169C8();
    swift_release();
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_246716C88();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v12)
    {
      uint64_t v13 = (char *)v1 + *(void *)((*v2 & *v1) + 0x78);
      swift_beginAccess();
      v34 = v13;
      uint64_t v14 = sub_2467168A8();
      uint64_t v15 = swift_endAccess();
      uint64_t v33 = v8;
      v37[0] = v14;
      MEMORY[0x270FA5388](v15);
      v32[-2] = v6;
      v32[-1] = v7;
      sub_246716AF8();
      swift_getWitnessTable();
      LOBYTE(v14) = sub_246716AB8();
      uint64_t v16 = v33;
      uint64_t v17 = swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        MEMORY[0x270FA5388](v17);
        v32[-2] = v6;
        v32[-1] = v7;
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v19 = sub_246716978();
        uint64_t v20 = sub_246706138(&qword_268F9C5B0, MEMORY[0x263F18140]);
        sub_246701650(KeyPath, 0, v6, v19, v20);
        swift_beginAccess();
        uint64_t v21 = (void (*)(uint64_t *, void))sub_246716898();
        sub_246716AE8();
        v21(v37, 0);
        swift_endAccess();
      }
      unint64_t v2 = (void *)MEMORY[0x263F8EED0];
      uint64_t v22 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x80);
      if (*((unsigned char *)v1 + v22) == 1)
      {
        swift_beginAccess();
        sub_246716888();
        swift_endAccess();
      }
      uint64_t v23 = v16;
      uint64_t v24 = v36;
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v10, v34, v23);
      uint64_t v29 = sub_2467167B8();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v23);
      *(void *)((char *)v1 + *(void *)((*v2 & *v1) + 0x68)) = v29;
      swift_bridgeObjectRelease();
      uint64_t v30 = *(void *)((*v2 & *v1) + 0x90);
      v31 = *(void **)((char *)v1 + v30);
      *(void *)((char *)v1 + v30) = 0;

      if (*((unsigned char *)v1 + v22) == 1)
      {
        *((unsigned char *)v1 + v22) = 0;
        swift_beginAccess();
        sub_246716888();
        swift_endAccess();
      }
    }
    swift_release();
    *((unsigned char *)v1 + *(void *)((*v2 & *v1) + 0x60)) = 0;
    return swift_bridgeObjectRetain();
  }
  sub_246716B78();
  if (qword_268F9C398 != -1) {
    swift_once();
  }
  sub_246716438();
  sub_246716758();
  sub_246706138(&qword_268F9C5A8, MEMORY[0x263F18068]);
  uint64_t v25 = swift_allocError();
  sub_246716748();
  uint64_t v26 = *(void *)((*v2 & *v1) + 0x90);
  v27 = *(void **)((char *)v1 + v26);
  *(void *)((char *)v1 + v26) = v25;

  uint64_t result = sub_246716AD8();
  *((unsigned char *)v1 + *(void *)((*v2 & *v1) + 0x60)) = 0;
  return result;
}

uint64_t sub_246703A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v29 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263F8EED0] & *v3;
  uint64_t v8 = sub_2467168C8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - v13;
  if (*(void *)((char *)v4 + *(void *)(v7 + 112)))
  {
    uint64_t v31 = *(void *)((char *)v4 + *(void *)(v7 + 112));
    if (a1)
    {
      uint64_t v30 = a1;
      sub_2467167E8();
      sub_246706138((unint64_t *)&qword_268F9C570, MEMORY[0x263F18090]);
      swift_retain_n();
      char v15 = sub_246716A28();
      swift_release();
      swift_release();
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = a1 == 0;
  }
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v16(v14, a2, v8);
  if (v15)
  {
    uint64_t v17 = (char *)v4 + *(void *)((*MEMORY[0x263F8EED0] & *v4) + 0x78);
    swift_beginAccess();
    uint64_t v18 = ((uint64_t (*)(char *, char *, uint64_t))v16)(v12, v17, v8);
    MEMORY[0x270FA5388](v18);
    *(&v28 - 4) = v8;
    *(&v28 - 3) = (uint64_t)v14;
    *((_DWORD *)&v28 - 4) = 3;
    sub_246705E90((uint64_t)v12, (uint64_t)sub_246706024, (uint64_t)(&v28 - 6), v8, MEMORY[0x263F8E628], MEMORY[0x263F8D4F8], MEMORY[0x263F8E658], v19);
    LOBYTE(v17) = v31;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v9 + 8);
    v20(v12, v8);
    v20(v14, v8);
    uint64_t v21 = (void *)MEMORY[0x263F8EED0];
    if (v17) {
      goto LABEL_11;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    uint64_t v21 = (void *)MEMORY[0x263F8EED0];
  }
  *((unsigned char *)v4 + *(void *)((*v21 & *v4) + 0x60)) = 1;
LABEL_11:
  uint64_t v22 = swift_retain();
  sub_24670456C(v22);
  uint64_t v23 = (char *)v4 + *(void *)((*v21 & *v4) + 0x78);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 24))(v23, a2, v8);
  swift_endAccess();
  uint64_t v24 = *(void *)((*v21 & *v4) + 0x88);
  uint64_t v25 = *(void *)((char *)v4 + v24);
  uint64_t v26 = v29;
  *(void *)((char *)v4 + v24) = v29;
  sub_246706014(v26);
  return sub_2467025F4(v25);
}

uint64_t sub_246703E98()
{
  id v1 = (void *)MEMORY[0x263F8EED0];
  swift_getKeyPath();
  sub_246703FFC();
  swift_release();
  return *((unsigned __int8 *)v0 + *(void *)((*v1 & *v0) + 0x60));
}

uint64_t sub_246703F40()
{
  return swift_release();
}

uint64_t sub_246703FFC()
{
  return sub_2467163C8();
}

uint64_t sub_246704090()
{
  return sub_2467163B8();
}

uint64_t sub_24670415C(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C560);
  uint64_t result = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x70);
  uint64_t v9 = *(void *)((char *)v2 + v8);
  if (!a1)
  {
    if (!v9) {
      return result;
    }
LABEL_7:
    uint64_t v12 = self;
    swift_retain();
    id v13 = objc_msgSend(v12, sel_defaultCenter);
    uint64_t v14 = (void *)sub_246716A38();
    objc_msgSend(v13, sel_addObserver_selector_name_object_, v2, sel_didChange_, v14, v9);

    id v15 = objc_msgSend(v12, sel_defaultCenter);
    sub_2467167E8();
    uint64_t v16 = (void *)sub_2467167C8();
    objc_msgSend(v15, sel_addObserver_selector_name_object_, v2, sel_didRemoteChange_, v16, 0);

    id v17 = objc_msgSend(v12, sel_defaultCenter);
    sub_246716878();
    uint64_t v18 = (void *)sub_246716828();
    objc_msgSend(v17, sel_addObserver_selector_name_object_, v2, sel_didRemoteChange_, v18, sub_2467167D8());
    swift_release();

    swift_release();
LABEL_8:
    uint64_t v19 = sub_246716268();
    uint64_t v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v7, 1, 1, v19);
    sub_246704484(v20);
    return sub_246706180((uint64_t)v7, &qword_268F9C560);
  }
  v21[1] = a1;
  if (!v9
    || (v21[0] = v9,
        sub_2467167E8(),
        sub_246706138((unint64_t *)&qword_268F9C570, MEMORY[0x263F18090]),
        swift_retain(),
        char v10 = sub_246716A28(),
        uint64_t result = swift_release(),
        (v10 & 1) == 0))
  {
    id v11 = objc_msgSend(self, sel_defaultCenter);
    objc_msgSend(v11, sel_removeObserver_, v2);

    uint64_t v9 = *(void *)((char *)v2 + v8);
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_246704484(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x88));
  if (v2 == 1)
  {
    return sub_246704788();
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    swift_retain();
    sub_2467165E8();
    return sub_2467025F4(v2);
  }
}

uint64_t sub_24670456C(uint64_t a1)
{
  uint64_t v2 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x70);
  uint64_t v3 = *(void *)((char *)v1 + v2);
  *(void *)((char *)v1 + v2) = a1;
  swift_retain();
  sub_24670415C(v3);
  swift_release();

  return swift_release();
}

uint64_t sub_2467045E8(void *a1)
{
  return swift_release();
}

uint64_t sub_2467046A8()
{
  sub_246716288();
  uint64_t v0 = sub_246716278();
  swift_getKeyPath();
  if (v0)
  {
    sub_246716C58();
    swift_retain();
    char v1 = sub_246716A28();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_246704788()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C578);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v0;
  int v5 = self;
  id v6 = v0;
  if (objc_msgSend(v5, sel_isMainThread))
  {
    sub_246704E54();
    return swift_release();
  }
  else
  {
    uint64_t v8 = sub_246716B48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
    sub_246716B28();
    swift_retain();
    uint64_t v9 = sub_246716B18();
    char v10 = (void *)swift_allocObject();
    uint64_t v11 = MEMORY[0x263F8F500];
    v10[2] = v9;
    v10[3] = v11;
    v10[4] = sub_246705720;
    v10[5] = v4;
    sub_246705010((uint64_t)v3, (uint64_t)&unk_268F9C588, (uint64_t)v10);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_24670492C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C560);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_246716248();
    uint64_t v8 = sub_246716268();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_246716268();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  id v10 = a1;
  sub_246704484((uint64_t)v10);

  return sub_246706180((uint64_t)v7, &qword_268F9C560);
}

uint64_t sub_246704A48(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C560);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246705654(a1, (uint64_t)v6);
  uint64_t v7 = sub_246716268();
  uint64_t v8 = *(void *)(v7 - 8);
  int v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  id v10 = (void *)MEMORY[0x263F8EED0];
  if (v9 == 1)
  {
    sub_246706180((uint64_t)v6, &qword_268F9C560);
    long long v16 = 0u;
    long long v17 = 0u;
LABEL_8:
    uint64_t result = sub_246706180((uint64_t)&v16, &qword_268F9C568);
    goto LABEL_9;
  }
  sub_246716258();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  if (!*((void *)&v17 + 1)) {
    goto LABEL_8;
  }
  sub_2467167E8();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v12 = *(void *)((char *)v2 + *(void *)((*v10 & *v2) + 0x70));
    *(void *)&long long v16 = v15[0];
    if (v12)
    {
      v15[0] = v12;
      sub_246706138((unint64_t *)&qword_268F9C570, MEMORY[0x263F18090]);
      swift_retain();
      char v13 = sub_246716A28();
      swift_release();
      uint64_t result = swift_release();
      if (v13) {
        return result;
      }
    }
    else
    {
      uint64_t result = swift_release();
    }
  }
LABEL_9:
  *((unsigned char *)v2 + *(void *)((*v10 & *v2) + 0x80)) = 1;
  uint64_t v14 = *(void *)((char *)v2 + *(void *)((*v10 & *v2) + 0x88));
  if (v14 == 1) {
    return sub_246704788();
  }
  MEMORY[0x270FA5388](result);
  v15[-2] = v2;
  swift_retain();
  sub_2467165E8();
  return sub_2467025F4(v14);
}

uint64_t sub_246704D34(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C560);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_246716248();
    uint64_t v8 = sub_246716268();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_246716268();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  id v10 = a1;
  sub_246704A48((uint64_t)v7);

  return sub_246706180((uint64_t)v7, &qword_268F9C560);
}

uint64_t sub_246704E54()
{
  return swift_release();
}

uint64_t sub_246704F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_246716B28();
  v5[4] = sub_246716B18();
  uint64_t v7 = sub_246716B08();
  return MEMORY[0x270FA2498](sub_246704FA4, v7, v6);
}

uint64_t sub_246704FA4()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 16);
  uint64_t v2 = swift_release();
  v1(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_246705010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_246716B48();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_246716B38();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246706180(a1, &qword_268F9C578);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246716B08();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_2467051BC()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v13 = *(void *)(v3 + 0x50);
  uint64_t v4 = sub_2467163A8();
  uint64_t v5 = sub_246716BA8();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - v6;
  *((unsigned char *)v0 + *(void *)(v3 + 96)) = 1;
  uint64_t v8 = *(void *)((*v2 & *v0) + 0x68);
  uint64_t v9 = v0;
  *(void *)((char *)v0 + v8) = sub_246716AD8();
  *(void *)((char *)v9 + *(void *)((*v2 & *v9) + 0x70)) = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v7, 1, 1, v4);
  sub_246716288();
  sub_246716AD8();
  sub_2467168B8();
  *((unsigned char *)v9 + *(void *)((*v2 & *v9) + 0x80)) = 0;
  *(void *)((char *)v9 + *(void *)((*v2 & *v9) + 0x88)) = 1;
  *(void *)((char *)v9 + *(void *)((*v2 & *v9) + 0x90)) = 0;
  sub_2467163D8();

  v12.receiver = v9;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_init);
}

id sub_246705438()
{
  return sub_2467051BC();
}

id sub_24670545C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246705494(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (char *)a1 + *(void *)((*v2 & *a1) + 0x78);
  uint64_t v4 = sub_2467168C8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2467025F4(*(void *)((char *)a1 + *(void *)((*v2 & *a1) + 0x88)));

  uint64_t v5 = (char *)a1 + *(void *)((*v2 & *a1) + 0x98);
  uint64_t v6 = sub_2467163E8();
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t type metadata accessor for QueryController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_246705654(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2467056BC()
{
  return sub_246704788();
}

uint64_t sub_2467056E8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246705720()
{
  return sub_246704E54();
}

uint64_t sub_246705728()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_246705768(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_246705828;
  return sub_246704F0C(a1, v4, v5, v7, v6);
}

uint64_t sub_246705828()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24670591C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2467059F8;
  return v6(a1);
}

uint64_t sub_2467059F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_246705AF0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246705B28(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_246705BE0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268F9C590 + dword_268F9C590);
  return v6(a1, v4);
}

uint64_t sub_246705BE0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_246705CD4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (void *)sub_246705F6C();
  *a1 = v2;

  return v2;
}

uint64_t sub_246705D10(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  return sub_2467045E8(v1);
}

uint64_t sub_246705D44()
{
  return 16;
}

__n128 sub_246705D50(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_246705D5C()
{
  return sub_246703F40();
}

uint64_t sub_246705D8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246703E98();
  *a1 = result & 1;
  return result;
}

uint64_t sub_246705DBC()
{
  return sub_246703F40();
}

uint64_t sub_246705DE4()
{
  return 16;
}

__n128 sub_246705DF0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

void sub_246705DFC()
{
  *(unsigned char *)(*(void *)(v0 + 16) + *(void *)((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x60)) = *(unsigned char *)(v0 + 24);
}

void sub_246705E30()
{
  id v2 = *(void **)(v0 + 16);
  id v1 = *(void **)(v0 + 24);
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x90);
  uint64_t v4 = *(void **)((char *)v2 + v3);
  *(void *)((char *)v2 + v3) = v1;
  id v5 = v1;
}

uint64_t sub_246705E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v15(v12, v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t sub_246705F6C()
{
  id v1 = (void *)MEMORY[0x263F8EED0];
  swift_getKeyPath();
  sub_246703FFC();
  swift_release();
  return *(void *)((char *)v0 + *(void *)((*v1 & *v0) + 0x90));
}

uint64_t sub_246706014(uint64_t result)
{
  if (result != 1) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_246706024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(v8 + 24);
  int v10 = *(_DWORD *)(v8 + 32);
  uint64_t v13 = *(void *)(v8 + 16);
  uint64_t v14 = a1;
  int v15 = v10;
  return sub_246705E90(v9, (uint64_t)sub_246706088, (uint64_t)&v12, v13, MEMORY[0x263F8E628], MEMORY[0x263F8D4F8], MEMORY[0x263F8E658], a8);
}

uint64_t sub_246706088@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = AGCompareValues();
  *a1 = result;
  return result;
}

uint64_t sub_2467060C8()
{
  return sub_2467046A8() & 1;
}

uint64_t sub_2467060E8(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_2467060F0()
{
  return sub_2467168D8();
}

uint64_t sub_246706120()
{
  return 16;
}

__n128 sub_24670612C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_246706138(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246706180(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2467061DC()
{
  return sub_2467056BC();
}

uint64_t View.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_246706390(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(void))View.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:));
}

uint64_t View.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, char a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a1;
  v19[0] = a3;
  v19[1] = a4;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = sub_246707B3C;
  uint64_t v23 = v16;
  char v24 = 0;
  uint64_t v25 = KeyPath;
  char v26 = 0;
  swift_bridgeObjectRetain();
  MEMORY[0x24C535A20](v19, a7, &type metadata for CustomModelContainerViewModifier, a8);
  swift_release();
  return swift_release();
}

uint64_t View.modelContainer(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  return MEMORY[0x24C535A20](&v4, a2, &type metadata for PassthroughModelContainerViewModifier, a3);
}

uint64_t Scene.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_246706390(a1, a2, a3, a4, a5, a6, a7, a8, a9, (void (*)(void))Scene.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:));
}

uint64_t sub_246706390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C5C0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_246717760;
  *(void *)(v12 + 32) = a1;
  *(void *)(v12 + 40) = a2;
  a10();

  return swift_bridgeObjectRelease();
}

uint64_t Scene.modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)(uint64_t a1, char a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a1;
  v19[0] = a3;
  v19[1] = a4;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = sub_246708FA4;
  uint64_t v23 = v16;
  char v24 = 0;
  uint64_t v25 = KeyPath;
  char v26 = 0;
  swift_bridgeObjectRetain();
  MEMORY[0x24C535A40](v19, a7, &type metadata for CustomModelContainerSceneModifier, a8);
  swift_release();
  return swift_release();
}

uint64_t Scene.modelContainer(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  return MEMORY[0x24C535A40](&v4, a2, &type metadata for PassthroughModelContainerSceneModifier, a3);
}

uint64_t sub_246706590()
{
  sub_246707F28(*(id *)(v0 + 16), *(unsigned char *)(v0 + 24));

  return MEMORY[0x270FA0228](v0, 25, 7);
}

uint64_t sub_2467065CC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  uint64_t result = sub_246716478();
  *a1 = result;
  return result;
}

uint64_t sub_24670660C()
{
  uint64_t v0 = sub_2467169A8();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_246716938();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  uint64_t v5 = swift_allocObject();
  sub_246716928();
  swift_bridgeObjectRetain();
  sub_2467169B8();
  sub_2467169E8();
  swift_allocObject();
  sub_2467169F8();
  sub_246716878();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C400);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_246717760;
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 16))(v7 + v6, v4, v1);
  uint64_t v8 = sub_246716838();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(void *)(v5 + 16) = v8;
  *(unsigned char *)(v5 + 24) = 0;
  return v5;
}

void sub_246706840()
{
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  sub_2467081CC(&qword_268F9C608, (void (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer);
  uint64_t v1 = sub_2467164F8();
  uint64_t v2 = *(void **)(v1 + 16);
  char v3 = *(unsigned char *)(v1 + 24);
  sub_246707F1C(v2, v3);
  swift_release();
  if (v3)
  {
    sub_246707F28(v2, 1);
  }
  else
  {
    sub_246716818();
    sub_246707F28(v2, 0);
    sub_246716798();
    if (*(unsigned char *)(v0 + 1))
    {
      uint64_t v4 = *(void **)(v0 + 48);
      char v5 = *(unsigned char *)(v0 + 56);
      sub_246707E08(v4, v5);
      uint64_t v6 = sub_246702394(v4, v5);
      sub_246702EFC(v4, v5);
      if (!v6) {
        objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C50]), sel_init);
      }
    }
    sub_246716788();
    swift_release();
  }
}

uint64_t sub_2467069C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, a6, a5);
}

void sub_2467069D4()
{
}

uint64_t sub_246706A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = (_OWORD *)v2;
  uint64_t v33 = a1;
  uint64_t v38 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C5E8);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C5F0);
  MEMORY[0x270FA5388](v35);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C5F8);
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  MEMORY[0x270FA5388](v10);
  v34 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v11) = *(unsigned char *)(v2 + 1);
  uint64_t v12 = *(void *)(v2 + 8);
  uint64_t v13 = *(void *)(v2 + 24);
  v31[1] = *(void *)(v2 + 16);
  uint64_t v32 = v12;
  long long v40 = *(_OWORD *)(v2 + 41);
  char v14 = v11 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C600);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v7, v33, v16);
  uint64_t v17 = &v7[*(int *)(v5 + 44)];
  *uint64_t v17 = v14;
  *((void *)v17 + 1) = KeyPath;
  v17[16] = 0;
  v31[0] = swift_getKeyPath();
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  sub_2467081CC(&qword_268F9C608, (void (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer);
  uint64_t v33 = v13;
  uint64_t v18 = sub_2467164F8();
  uint64_t v19 = *(void **)(v18 + 16);
  char v20 = *(unsigned char *)(v18 + 24);
  sub_246707F1C(v19, v20);
  swift_release();
  if (v20)
  {
    sub_246707F28(v19, 1);
    if (qword_268F9C388 != -1) {
      swift_once();
    }
    uint64_t v21 = qword_268F9DA58;
    swift_retain();
  }
  else
  {
    uint64_t v21 = sub_246716818();
    sub_246707F28(v19, 0);
  }
  uint64_t v22 = v35;
  sub_246708214((uint64_t)v7, (uint64_t)v9, &qword_268F9C5E8);
  uint64_t v23 = &v9[*(int *)(v22 + 36)];
  *(void *)uint64_t v23 = v31[0];
  *((void *)v23 + 1) = v21;
  sub_24670852C((uint64_t)v7, &qword_268F9C5E8);
  uint64_t v24 = sub_2467164F8();
  uint64_t v25 = *(void **)(v24 + 16);
  int v26 = *(unsigned __int8 *)(v24 + 24);
  sub_246707F1C(v25, v26);
  swift_release();
  if (v26 == 1)
  {
    sub_246707F28(v25, 1);
    uint64_t v25 = 0;
  }
  v39 = v25;
  uint64_t v41 = *(void *)((char *)&v40 + 7);
  char v42 = HIBYTE(v40);
  v27 = (_OWORD *)swift_allocObject();
  long long v28 = v3[1];
  v27[1] = *v3;
  v27[2] = v28;
  v27[3] = v3[2];
  *(_OWORD *)((char *)v27 + 57) = *(_OWORD *)((char *)v3 + 41);
  sub_246707F54(v32);
  sub_246707E00();
  sub_246707F64((uint64_t)&v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C610);
  sub_246707F94();
  sub_246708128();
  uint64_t v29 = v34;
  sub_2467166C8();
  swift_release();
  swift_release();
  sub_24670852C((uint64_t)v9, &qword_268F9C5F0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v29, v37);
}

uint64_t sub_246706E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246706A18(a1, a2);
}

uint64_t sub_246706EDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (_OWORD *)v1;
  uint64_t v49 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C658);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C660);
  MEMORY[0x270FA5388](v46);
  uint64_t v42 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C668);
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v44 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v45 = (char *)&v38 - v10;
  char v11 = *(unsigned char *)(v1 + 1);
  uint64_t v12 = *(void *)(v1 + 8);
  uint64_t v13 = *(void *)(v1 + 24);
  uint64_t v40 = *(void *)(v1 + 16);
  uint64_t v41 = v12;
  long long v54 = *(_OWORD *)(v1 + 41);
  char v14 = v11 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v50) = v14;
  uint64_t v51 = KeyPath;
  LOBYTE(v52) = 0;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C670);
  uint64_t v17 = sub_246708EC4(&qword_268F9C678, &qword_268F9C670);
  MEMORY[0x24C535A40](&v50, v16, &type metadata for SynchronizeSceneUndoManager, v17);
  swift_release();
  uint64_t v39 = swift_getKeyPath();
  type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
  sub_2467081CC(&qword_268F9C608, (void (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer);
  uint64_t v43 = v13;
  uint64_t v18 = sub_2467164F8();
  uint64_t v19 = *(void **)(v18 + 16);
  char v20 = *(unsigned char *)(v18 + 24);
  sub_246707F1C(v19, v20);
  swift_release();
  if (v20)
  {
    sub_246707F28(v19, 1);
    if (qword_268F9C388 != -1) {
      swift_once();
    }
    uint64_t v21 = qword_268F9DA58;
    swift_retain();
  }
  else
  {
    uint64_t v21 = sub_246716818();
    sub_246707F28(v19, 0);
  }
  uint64_t v22 = v46;
  uint64_t v23 = v42;
  sub_246708214((uint64_t)v5, v42, &qword_268F9C658);
  uint64_t v24 = (uint64_t *)(v23 + *(int *)(v22 + 36));
  *uint64_t v24 = v39;
  v24[1] = v21;
  sub_24670852C((uint64_t)v5, &qword_268F9C658);
  uint64_t v25 = sub_2467164F8();
  int v26 = *(void **)(v25 + 16);
  int v27 = *(unsigned __int8 *)(v25 + 24);
  sub_246707F1C(v26, v27);
  swift_release();
  if (v27 == 1)
  {
    sub_246707F28(v26, 1);
    int v26 = 0;
  }
  uint64_t v50 = (uint64_t)v26;
  uint64_t v55 = *(void *)((char *)&v54 + 7);
  char v56 = HIBYTE(v54);
  long long v28 = (_OWORD *)swift_allocObject();
  long long v29 = v2[1];
  v28[1] = *v2;
  v28[2] = v29;
  v28[3] = v2[2];
  *(_OWORD *)((char *)v28 + 57) = *(_OWORD *)((char *)v2 + 41);
  sub_246707F54(v41);
  sub_246707E00();
  sub_246707F64((uint64_t)&v55);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C610);
  unint64_t v31 = sub_2467082D4();
  unint64_t v32 = sub_246708128();
  uint64_t v33 = v44;
  sub_2467166F8();
  swift_release();
  swift_release();
  sub_24670852C(v23, &qword_268F9C660);
  uint64_t v35 = v47;
  uint64_t v34 = v48;
  uint64_t v36 = v45;
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v45, v33, v48);
  uint64_t v50 = v22;
  uint64_t v51 = v30;
  unint64_t v52 = v31;
  unint64_t v53 = v32;
  swift_getOpaqueTypeConformance2();
  sub_246716518();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v36, v34);
}

void sub_2467073F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(void *, uint64_t))(a1 + 8);
  if (v1)
  {
    type metadata accessor for CustomModelContainerState.ResolvedModelContainer();
    sub_2467081CC(&qword_268F9C608, (void (*)(uint64_t))type metadata accessor for CustomModelContainerState.ResolvedModelContainer);
    uint64_t v2 = sub_2467164F8();
    uint64_t v3 = *(void **)(v2 + 16);
    uint64_t v4 = *(unsigned __int8 *)(v2 + 24);
    sub_246707F1C(v3, v4);
    swift_release();
    v1(v3, v4);
    sub_246707F28(v3, v4);
  }
}

uint64_t sub_2467074EC@<X0>(uint64_t a1@<X8>)
{
  return sub_246706EDC(a1);
}

uint64_t sub_246707534()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C6D8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v5 = *v0;
  uint64_t v6 = *((void *)v0 + 1);
  uint64_t v7 = v0[16];
  swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  *(unsigned char *)(v8 + 32) = v7;
  j__swift_retain(v6, v7);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C6E0);
  uint64_t v10 = sub_246708EC4(&qword_268F9C6E8, &qword_268F9C6E0);
  sub_2467166E8();
  swift_release();
  swift_release();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_268F9C4D8);
  v13[1] = v9;
  v13[2] = v11;
  v13[3] = v10;
  swift_getOpaqueTypeConformance2();
  sub_246716518();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_246707728(id *a1, char a2, uint64_t a3, char a4)
{
  if (a2)
  {
    uint64_t v6 = a4 & 1;
    j__swift_retain(a3, v6);
    uint64_t v7 = sub_246702188(a3, v6);
    j__swift_release(a3, v6);
    if (v7)
    {
      uint64_t v8 = sub_246716778();
      swift_release();
      if (v8)
      {

        *a1 = (id)v8;
      }
    }
  }
}

uint64_t sub_2467077B8()
{
  return sub_246716568();
}

uint64_t sub_2467077D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v5 = *v2;
  uint64_t v6 = *((void *)v2 + 1);
  uint64_t v7 = v2[16];
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = v5;
  *(void *)(v9 + 24) = v6;
  *(unsigned char *)(v9 + 32) = v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2, a1, v10);
  uint64_t v11 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F9C6D0) + 36));
  uint64_t *v11 = KeyPath;
  v11[1] = (uint64_t)sub_246708D98;
  v11[2] = v9;

  return j__swift_retain(v6, v7);
}

uint64_t sub_2467078DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v5 = sub_246716818();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C648);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C650);
  uint64_t v8 = (uint64_t *)(a2 + *(int *)(result + 36));
  *uint64_t v8 = KeyPath;
  v8[1] = v5;
  return result;
}

uint64_t sub_24670797C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C698);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v4 = sub_246716818();
  v9[0] = KeyPath;
  v9[1] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C6A0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C438);
  uint64_t v7 = sub_246708EC4(&qword_268F9C6A8, &qword_268F9C6A0);
  MEMORY[0x24C535A40](v9, v5, v6, v7);
  swift_release();
  swift_release();
  sub_246708468();
  sub_246716518();
  return sub_24670852C((uint64_t)v2, &qword_268F9C698);
}

uint64_t sub_246707AD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MEMORY[0x24C535980]();
  *a1 = result;
  return result;
}

uint64_t sub_246707B04()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246707B3C()
{
  return sub_24670660C();
}

uint64_t type metadata accessor for CustomModelContainerState.ResolvedModelContainer()
{
  return self;
}

uint64_t sub_246707B6C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for CustomModelContainerViewModifier, (void (*)(void))sub_246707BA0);
}

unint64_t sub_246707BA0()
{
  unint64_t result = qword_268F9C5C8;
  if (!qword_268F9C5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C5C8);
  }
  return result;
}

uint64_t sub_246707BF4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for PassthroughModelContainerViewModifier, (void (*)(void))sub_246707C28);
}

unint64_t sub_246707C28()
{
  unint64_t result = qword_268F9C5D0;
  if (!qword_268F9C5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C5D0);
  }
  return result;
}

uint64_t sub_246707C7C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for CustomModelContainerSceneModifier, (void (*)(void))sub_246707CB0);
}

unint64_t sub_246707CB0()
{
  unint64_t result = qword_268F9C5D8;
  if (!qword_268F9C5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C5D8);
  }
  return result;
}

uint64_t sub_246707D04(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(a1, (uint64_t)&type metadata for PassthroughModelContainerSceneModifier, (void (*)(void))sub_246707D9C);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx01_a5Data_aB0020CustomModelContainerC8Modifier33_C0145BB3D356D4B01704777C3D5D3ACCLLVGAaBHPxAaBHD1__AhA0cJ0HPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

unint64_t sub_246707D9C()
{
  unint64_t result = qword_268F9C5E0;
  if (!qword_268F9C5E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C5E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PassthroughModelContainerSceneModifier()
{
  return &type metadata for PassthroughModelContainerSceneModifier;
}

uint64_t sub_246707E00()
{
  return swift_retain();
}

id sub_246707E08(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

uint64_t sub_246707E18()
{
  return swift_release();
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

ValueMetadata *type metadata accessor for CustomModelContainerSceneModifier()
{
  return &type metadata for CustomModelContainerSceneModifier;
}

ValueMetadata *type metadata accessor for PassthroughModelContainerViewModifier()
{
  return &type metadata for PassthroughModelContainerViewModifier;
}

ValueMetadata *type metadata accessor for CustomModelContainerViewModifier()
{
  return &type metadata for CustomModelContainerViewModifier;
}

uint64_t sub_246707E98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246707EB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246707ED0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246707EEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246707F08()
{
  return MEMORY[0x263EFDDD8];
}

id sub_246707F1C(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

void sub_246707F28(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

void sub_246707F38()
{
  sub_2467073F4(v0 + 16);
}

uint64_t sub_246707F54(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_246707F64(uint64_t a1)
{
  return a1;
}

unint64_t sub_246707F94()
{
  unint64_t result = qword_268F9C618;
  if (!qword_268F9C618)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C5F0);
    sub_246708034();
    sub_246708EC4(&qword_268F9C440, &qword_268F9C438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C618);
  }
  return result;
}

unint64_t sub_246708034()
{
  unint64_t result = qword_268F9C620;
  if (!qword_268F9C620)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C5E8);
    sub_246708EC4(&qword_268F9C628, &qword_268F9C600);
    sub_2467080D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C620);
  }
  return result;
}

unint64_t sub_2467080D4()
{
  unint64_t result = qword_268F9C630;
  if (!qword_268F9C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C630);
  }
  return result;
}

unint64_t sub_246708128()
{
  unint64_t result = qword_268F9C638;
  if (!qword_268F9C638)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C610);
    sub_2467081CC(&qword_268F9C640, MEMORY[0x263F180B8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C638);
  }
  return result;
}

uint64_t sub_2467081CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246708214(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_20Tm()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  sub_246707E18();
  sub_246702EFC(*(id *)(v0 + 64), *(unsigned char *)(v0 + 72));

  return MEMORY[0x270FA0238](v0, 73, 7);
}

unint64_t sub_2467082D4()
{
  unint64_t result = qword_268F9C680;
  if (!qword_268F9C680)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C660);
    sub_246708374();
    sub_246708EC4(&qword_268F9C448, &qword_268F9C438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C680);
  }
  return result;
}

unint64_t sub_246708374()
{
  unint64_t result = qword_268F9C688;
  if (!qword_268F9C688)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C658);
    sub_246708EC4(&qword_268F9C678, &qword_268F9C670);
    sub_246708414();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C688);
  }
  return result;
}

unint64_t sub_246708414()
{
  unint64_t result = qword_268F9C690;
  if (!qword_268F9C690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C690);
  }
  return result;
}

unint64_t sub_246708468()
{
  unint64_t result = qword_268F9C6B0;
  if (!qword_268F9C6B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C698);
    sub_246708EC4(&qword_268F9C6A8, &qword_268F9C6A0);
    sub_246708EC4(&qword_268F9C448, &qword_268F9C438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C6B0);
  }
  return result;
}

uint64_t sub_24670852C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for SynchronizeUndoManager(uint64_t a1)
{
  return j__swift_release(*(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SynchronizeUndoManager()
{
  return &type metadata for SynchronizeUndoManager;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a2 + 16);
  j__swift_retain(v3, v4);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwca_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unsigned __int8 v4 = *(unsigned char *)(a2 + 16);
  j__swift_retain(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  j__swift_release(v5, v6);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwta_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  j__swift_release(v5, v6);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[17]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s18_SwiftData_SwiftUI22SynchronizeUndoManagerVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
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
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SynchronizeSceneUndoManager()
{
  return &type metadata for SynchronizeSceneUndoManager;
}

uint64_t initializeBufferWithCopyOfBuffer for CustomModelContainerState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwxx_0(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    swift_release();
  }
  sub_246707E18();
  uint64_t v2 = *(void **)(a1 + 48);
  char v3 = *(unsigned char *)(a1 + 56);

  sub_246702EFC(v2, v3);
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwcp_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = v4;
    *(void *)(a1 + 16) = v5;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  }
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_246707E00();
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  uint64_t v9 = *(void **)(a2 + 48);
  char v10 = *(unsigned char *)(a2 + 56);
  sub_246707E08(v9, v10);
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v10;
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwca_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v6 = (_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (!*(void *)(a1 + 8))
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *uint64_t v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  char v11 = *(unsigned char *)(a2 + 40);
  sub_246707E00();
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(unsigned char *)(a1 + 40) = v11;
  sub_246707E18();
  uint64_t v12 = *(void **)(a2 + 48);
  char v13 = *(unsigned char *)(a2 + 56);
  sub_246707E08(v12, v13);
  char v14 = *(void **)(a1 + 48);
  char v15 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = v12;
  *(unsigned char *)(a1 + 56) = v13;
  sub_246702EFC(v14, v15);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwta_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v6 = (_OWORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (!*(void *)(a1 + 8))
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v8;
      goto LABEL_8;
    }
LABEL_7:
    *uint64_t v4 = *v6;
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v7;
  swift_release();
LABEL_8:
  char v9 = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v9;
  sub_246707E18();
  char v10 = *(unsigned char *)(a2 + 56);
  char v11 = *(void **)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v10;
  sub_246702EFC(v11, v12);
  return a1;
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s18_SwiftData_SwiftUI33CustomModelContainerSceneModifierVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomModelContainerState()
{
  return &type metadata for CustomModelContainerState;
}

uint64_t sub_246708B54(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___SbyyctSQRd__lFQOyAA15ModifiedContentVyAHyAA01_c9Modifier_I0Vy01_a5Data_aB0020CustomModelContainercJ033_C0145BB3D356D4B01704777C3D5D3ACCLLVGAK22SynchronizeUndoManagerAMLLVGAA022_EnvironmentKeyWritingJ0Vy0aK00M7ContextCSgGG_AU0mN0CSgQo_HOTm(a1, &qword_268F9C5F0, (void (*)(void))sub_246707F94);
}

unint64_t sub_246708B8C()
{
  unint64_t result = qword_268F9C6B8;
  if (!qword_268F9C6B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C650);
    sub_246708EC4(&qword_268F9C6C0, &qword_268F9C648);
    sub_246708EC4(&qword_268F9C440, &qword_268F9C438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C6B8);
  }
  return result;
}

uint64_t sub_246708C50(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___SbyyctSQRd__lFQOyAA15ModifiedContentVyAHyAA01_c9Modifier_I0Vy01_a5Data_aB0020CustomModelContainercJ033_C0145BB3D356D4B01704777C3D5D3ACCLLVGAK22SynchronizeUndoManagerAMLLVGAA022_EnvironmentKeyWritingJ0Vy0aK00M7ContextCSgGG_AU0mN0CSgQo_HOTm(a1, &qword_268F9C660, (void (*)(void))sub_2467082D4);
}

uint64_t get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___SbyyctSQRd__lFQOyAA15ModifiedContentVyAHyAA01_c9Modifier_I0Vy01_a5Data_aB0020CustomModelContainercJ033_C0145BB3D356D4B01704777C3D5D3ACCLLVGAK22SynchronizeUndoManagerAMLLVGAA022_EnvironmentKeyWritingJ0Vy0aK00M7ContextCSgGG_AU0mN0CSgQo_HOTm(uint64_t a1, uint64_t *a2, void (*a3)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246708D00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246708D1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246708D38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MEMORY[0x24C535990]();
  *a1 = result;
  return result;
}

uint64_t sub_246708D64(id *a1)
{
  id v1 = *a1;
  return sub_246716638();
}

void sub_246708D98(id *a1)
{
  sub_246707728(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

uint64_t objectdestroy_38Tm()
{
  j__swift_release(*(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32));

  return MEMORY[0x270FA0238](v0, 33, 7);
}

unint64_t sub_246708E00()
{
  unint64_t result = qword_268F9C6F0;
  if (!qword_268F9C6F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C6D0);
    sub_246708EC4(&qword_268F9C6F8, &qword_268F9C6C8);
    sub_246708EC4(&qword_268F9C700, &qword_268F9C708);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C6F0);
  }
  return result;
}

uint64_t sub_246708EC4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_246708F08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t DocumentGroup<>.init(editing:migrationPlan:editor:prepareDocument:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v47 = a3;
  uint64_t v43 = a9;
  uint64_t v13 = sub_246716428();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v37 - v20;
  sub_246716408();
  char v22 = sub_246716418();
  v45 = *(void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v46 = v14 + 8;
  v45(v21, v13);
  if (v22)
  {
    uint64_t v44 = a8;
    uint64_t v23 = sub_246716968();
    uint64_t v24 = *(void *)(v23 + 16);
    if (v24)
    {
      uint64_t v38 = a10;
      long long v37 = *(_OWORD *)(v23 + 16 * v24 + 16);
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
      v25(v21, a1, v13);
      v25(v19, a1, v13);
      unint64_t v26 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      unint64_t v27 = (v15 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v28 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v28 + v26, v19, v13);
      *(_OWORD *)(v28 + v27) = v37;
      long long v29 = (void *)(v28 + ((v27 + 23) & 0xFFFFFFFFFFFFFFF8));
      uint64_t v30 = v47;
      *long long v29 = a2;
      v29[1] = v30;
      uint64_t v50 = &type metadata for ModelDocumentProvider;
      unint64_t v51 = sub_2467096BC();
      unint64_t v31 = (void *)swift_allocObject();
      uint64_t v48 = v31;
      uint64_t v32 = v40;
      void v31[2] = v39;
      v31[3] = v32;
      v31[4] = sub_2467096A4;
      v31[5] = v28;
      type metadata accessor for ModelDocumentBox(0);
      uint64_t v33 = (void *)swift_allocObject();
      uint64_t v34 = v38;
      v33[2] = v44;
      v33[3] = v34;
      uint64_t v35 = v42;
      v33[4] = v41;
      v33[5] = v35;
      sub_246709778(&qword_268F9C718, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
      sub_246709778(&qword_268F9C720, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
      sub_2467097C0();
      sub_246716578();
      return ((uint64_t (*)(uint64_t, uint64_t))v45)(a1, v13);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v13);
    uint64_t v48 = 0;
    unint64_t v49 = 0xE000000000000000;
    sub_246716C28();
    sub_246716A98();
    sub_2467163F8();
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    sub_246716408();
    sub_2467163F8();
    v45(v21, v13);
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
  }
  uint64_t result = sub_246716C78();
  __break(1u);
  return result;
}

uint64_t sub_2467094B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v6 = sub_246716428();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16(v9, a1, v6);
  sub_2467169E8();
  uint64_t v17 = sub_246716988();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E0);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  long long v15 = xmmword_246717760;
  *(_OWORD *)(v11 + 16) = xmmword_246717760;
  v16((char *)(v11 + v10), (uint64_t)v9, v6);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = v15;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v10, v9, v6);
  *a4 = v11;
  a4[1] = v12;
  uint64_t v14 = v18;
  a4[2] = v17;
  a4[3] = v14;
  a4[4] = v19;
  return result;
}

uint64_t sub_2467096A4()
{
  return sub_246709F4C((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2467094B0);
}

unint64_t sub_2467096BC()
{
  unint64_t result = qword_268F9C710;
  if (!qword_268F9C710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C710);
  }
  return result;
}

uint64_t sub_246709710()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t type metadata accessor for ModelDocumentBox(uint64_t a1)
{
  return sub_2467149B4(a1, (uint64_t *)&unk_268F9C780);
}

uint64_t sub_246709778(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2467097C0()
{
  unint64_t result = qword_268F9C728;
  if (!qword_268F9C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C728);
  }
  return result;
}

uint64_t DocumentGroup<>.init(viewing:migrationPlan:viewer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v35 = a5;
  uint64_t v36 = a7;
  uint64_t v37 = a8;
  uint64_t v38 = a6;
  uint64_t v34 = a4;
  uint64_t v41 = a3;
  uint64_t v10 = sub_246716428();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v33 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v33 - v17;
  sub_246716408();
  char v19 = sub_246716418();
  uint64_t v39 = *(void (**)(char *, uint64_t))(v11 + 8);
  v39(v18, v10);
  if (v19)
  {
    uint64_t v40 = v11 + 8;
    uint64_t v20 = sub_246716968();
    uint64_t v21 = *(void *)(v20 + 16);
    if (v21)
    {
      long long v33 = *(_OWORD *)(v20 + 16 * v21 + 16);
      swift_bridgeObjectRelease();
      char v22 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v22(v18, a1, v10);
      v22(v16, a1, v10);
      unint64_t v23 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      unint64_t v24 = (v12 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v25 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v25 + v23, v16, v10);
      *(_OWORD *)(v25 + v24) = v33;
      unint64_t v26 = (void *)(v25 + ((v24 + 23) & 0xFFFFFFFFFFFFFFF8));
      uint64_t v27 = v41;
      *unint64_t v26 = a2;
      v26[1] = v27;
      uint64_t v44 = &type metadata for ModelDocumentProvider;
      unint64_t v45 = sub_2467096BC();
      uint64_t v28 = (void *)swift_allocObject();
      uint64_t v42 = v28;
      v28[2] = 0;
      v28[3] = 0;
      v28[4] = sub_246709F34;
      v28[5] = v25;
      type metadata accessor for ModelDocumentBox(0);
      long long v29 = (void *)swift_allocObject();
      uint64_t v30 = v36;
      v29[2] = v38;
      v29[3] = v30;
      uint64_t v31 = v35;
      v29[4] = v34;
      v29[5] = v31;
      sub_246709778(&qword_268F9C718, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
      sub_246709778(&qword_268F9C720, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
      sub_2467097C0();
      sub_246716588();
      return ((uint64_t (*)(uint64_t, uint64_t))v39)(a1, v10);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
    uint64_t v42 = 0;
    unint64_t v43 = 0xE000000000000000;
    sub_246716C28();
    sub_246716A98();
    sub_2467163F8();
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    sub_246716408();
    sub_2467163F8();
    v39(v18, v10);
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
  }
  uint64_t result = sub_246716C78();
  __break(1u);
  return result;
}

uint64_t sub_246709CE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  v18[1] = a2;
  uint64_t v7 = sub_246716428();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(v10, a1, v7);
  sub_2467169E8();
  uint64_t v12 = sub_246716998();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E0);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_246717760;
  v11((char *)(v14 + v13), (uint64_t)v10, v7);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v16 = MEMORY[0x263F8EE78];
  *a5 = v14;
  a5[1] = v16;
  uint64_t v17 = v19;
  a5[2] = v12;
  a5[3] = v17;
  a5[4] = v20;
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_246716428();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_246709F34()
{
  return sub_246709F4C((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_246709CE8);
}

uint64_t sub_246709F4C(uint64_t (*a1)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_246716428() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + v4);
  uint64_t v7 = *(void *)(v1 + v4 + 8);
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = *(void *)(v1 + v5 + 8);

  return a1(v1 + v3, v6, v7, v8, v9);
}

uint64_t sub_24670A010()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t DocumentGroup<>.init(editing:contentType:editor:prepareDocument:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v38 = a9;
  uint64_t v39 = a8;
  uint64_t v34 = a6;
  uint64_t v35 = a7;
  uint64_t v36 = a4;
  uint64_t v37 = a5;
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v11 = sub_246716428();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v31 - v18;
  sub_246716408();
  char v20 = sub_246716418();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v41 = v12 + 8;
  v40(v19, v11);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  if (v20)
  {
    v21(v19, a3, v11);
    v21(v17, a3, v11);
    unint64_t v22 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v23 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v23 + v22, v17, v11);
    unint64_t v24 = (void *)(v23 + ((v13 + v22 + 7) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v25 = v33;
    *unint64_t v24 = v32;
    v24[1] = v25;
    uint64_t v44 = &type metadata for ModelDocumentProvider;
    unint64_t v45 = sub_2467096BC();
    unint64_t v26 = (void *)swift_allocObject();
    uint64_t v42 = v26;
    uint64_t v27 = v35;
    v26[2] = v34;
    v26[3] = v27;
    v26[4] = sub_24670A708;
    v26[5] = v23;
    type metadata accessor for ModelDocumentBox(0);
    uint64_t v28 = (void *)swift_allocObject();
    v28[2] = v39;
    v28[3] = a10;
    uint64_t v29 = v37;
    v28[4] = v36;
    v28[5] = v29;
    sub_246709778(&qword_268F9C718, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_246709778(&qword_268F9C720, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_2467097C0();
    sub_246716578();
    return ((uint64_t (*)(uint64_t, uint64_t))v40)(a3, v11);
  }
  else
  {
    v21((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v11);
    uint64_t v42 = 0;
    unint64_t v43 = 0xE000000000000000;
    sub_246716C28();
    sub_246716A98();
    sub_2467163F8();
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    sub_246716408();
    sub_2467163F8();
    v40(v19, v11);
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    uint64_t result = sub_246716C78();
    __break(1u);
  }
  return result;
}

uint64_t sub_24670A4AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  char v20 = a4;
  uint64_t v7 = sub_2467169A8();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_246716428();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v19(v11, a1, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C5C0);
  uint64_t v12 = swift_allocObject();
  long long v21 = xmmword_246717760;
  *(_OWORD *)(v12 + 16) = xmmword_246717760;
  *(void *)(v12 + 32) = a2;
  *(void *)(v12 + 40) = a3;
  sub_2467169B8();
  sub_2467169E8();
  swift_allocObject();
  uint64_t v13 = sub_2467169F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E0);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = v21;
  v19((char *)(v15 + v14), (uint64_t)v11, v8);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v21;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v14, v11, v8);
  uint64_t v18 = v20;
  *char v20 = v15;
  v18[1] = v16;
  v18[3] = 0;
  v18[4] = 0;
  void v18[2] = v13;
  return result;
}

uint64_t sub_24670A708()
{
  return sub_24670B540((uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_24670A4AC);
}

uint64_t sub_24670A720()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t DocumentGroup<>.init(editing:contentType:editor:prepareDocument:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v34 = a4;
  uint64_t v35 = a8;
  uint64_t v36 = a9;
  uint64_t v37 = a7;
  uint64_t v31 = a5;
  uint64_t v32 = a6;
  uint64_t v33 = a3;
  uint64_t v30 = a1;
  uint64_t v10 = sub_246716428();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v29 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v29 - v17;
  sub_246716408();
  char v19 = sub_246716418();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v39 = v11 + 8;
  v38(v18, v10);
  char v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  if (v19)
  {
    v20(v18, a2, v10);
    v20(v16, a2, v10);
    unint64_t v21 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v22 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v22 + v21, v16, v10);
    *(void *)(v22 + ((v12 + v21 + 7) & 0xFFFFFFFFFFFFFFF8)) = v30;
    uint64_t v42 = &type metadata for ModelDocumentProvider;
    unint64_t v43 = sub_2467096BC();
    uint64_t v23 = (void *)swift_allocObject();
    uint64_t v40 = v23;
    uint64_t v24 = v32;
    v23[2] = v31;
    v23[3] = v24;
    v23[4] = sub_24670ADE0;
    v23[5] = v22;
    type metadata accessor for ModelDocumentBox(0);
    uint64_t v25 = (void *)swift_allocObject();
    uint64_t v26 = v35;
    v25[2] = v37;
    v25[3] = v26;
    uint64_t v27 = v34;
    v25[4] = v33;
    v25[5] = v27;
    sub_246709778(&qword_268F9C718, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_246709778(&qword_268F9C720, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_2467097C0();
    sub_246716578();
    return ((uint64_t (*)(uint64_t, uint64_t))v38)(a2, v10);
  }
  else
  {
    v20((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v10);
    uint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
    sub_246716C28();
    sub_246716A98();
    sub_2467163F8();
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    sub_246716408();
    sub_2467163F8();
    v38(v18, v10);
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    uint64_t result = sub_246716C78();
    __break(1u);
  }
  return result;
}

uint64_t sub_24670ABA8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_2467169A8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_246716428();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v15(v8, a1, v5);
  swift_bridgeObjectRetain();
  sub_2467169B8();
  sub_2467169E8();
  swift_allocObject();
  uint64_t v14 = sub_2467169F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E0);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  long long v13 = xmmword_246717760;
  *(_OWORD *)(v10 + 16) = xmmword_246717760;
  v15((char *)(v10 + v9), (uint64_t)v8, v5);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v13;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v11 + v9, v8, v5);
  *a2 = v10;
  a2[1] = v11;
  a2[3] = 0;
  a2[4] = 0;
  a2[2] = v14;
  return result;
}

uint64_t sub_24670ADE0()
{
  return sub_24670BD0C((uint64_t (*)(unint64_t, uint64_t))sub_24670ABA8);
}

uint64_t DocumentGroup<>.init(viewing:contentType:viewer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v33 = a5;
  uint64_t v34 = a7;
  uint64_t v35 = a8;
  uint64_t v36 = a6;
  uint64_t v31 = a2;
  uint64_t v32 = a4;
  uint64_t v30 = a1;
  uint64_t v9 = sub_246716428();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v29 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v29 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v29 - v16;
  sub_246716408();
  char v18 = sub_246716418();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v10 + 8);
  v37(v17, v9);
  char v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  if (v18)
  {
    v19(v17, a3, v9);
    v19(v15, a3, v9);
    unint64_t v20 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v21 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v21 + v20, v15, v9);
    uint64_t v22 = (void *)(v21 + ((v11 + v20 + 7) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v23 = v31;
    *uint64_t v22 = v30;
    v22[1] = v23;
    uint64_t v40 = &type metadata for ModelDocumentProvider;
    unint64_t v41 = sub_2467096BC();
    uint64_t v24 = (void *)swift_allocObject();
    uint64_t v38 = v24;
    v24[2] = 0;
    v24[3] = 0;
    v24[4] = sub_24670B528;
    v24[5] = v21;
    type metadata accessor for ModelDocumentBox(0);
    uint64_t v25 = (void *)swift_allocObject();
    uint64_t v26 = v34;
    v25[2] = v36;
    v25[3] = v26;
    uint64_t v27 = v33;
    v25[4] = v32;
    v25[5] = v27;
    sub_246709778(&qword_268F9C718, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_246709778(&qword_268F9C720, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_2467097C0();
    sub_246716588();
    return ((uint64_t (*)(uint64_t, uint64_t))v37)(a3, v9);
  }
  else
  {
    v19(v29, a3, v9);
    uint64_t v38 = 0;
    unint64_t v39 = 0xE000000000000000;
    sub_246716C28();
    sub_246716A98();
    sub_2467163F8();
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    sub_246716408();
    sub_2467163F8();
    v37(v17, v9);
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    uint64_t result = sub_246716C78();
    __break(1u);
  }
  return result;
}

uint64_t sub_24670B25C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v6 = sub_2467169A8();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_246716428();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(v10, a1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C5C0);
  uint64_t v12 = swift_allocObject();
  long long v19 = xmmword_246717760;
  *(_OWORD *)(v12 + 16) = xmmword_246717760;
  uint64_t v13 = v21;
  *(void *)(v12 + 32) = v20;
  *(void *)(v12 + 40) = v13;
  sub_2467169B8();
  sub_2467169E8();
  swift_allocObject();
  uint64_t v14 = sub_2467169F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E0);
  unint64_t v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v19;
  v11((char *)(v16 + v15), (uint64_t)v10, v7);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = MEMORY[0x263F8EE78];
  *a4 = v16;
  a4[1] = v18;
  a4[3] = 0;
  a4[4] = 0;
  a4[2] = v14;
  return result;
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v1 = sub_246716428();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24670B528()
{
  return sub_24670B540((uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_24670B25C);
}

uint64_t sub_24670B540(uint64_t (*a1)(unint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_246716428() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v1 + v4);
  uint64_t v6 = *(void *)(v1 + v4 + 8);

  return a1(v1 + v3, v5, v6);
}

uint64_t DocumentGroup<>.init(viewing:contentType:viewer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v31 = a4;
  uint64_t v32 = a6;
  uint64_t v33 = a7;
  uint64_t v34 = a5;
  uint64_t v29 = a1;
  uint64_t v30 = a3;
  uint64_t v8 = sub_246716428();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v28 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v27 - v15;
  sub_246716408();
  char v17 = sub_246716418();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v9 + 8);
  v35(v16, v8);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  if (v17)
  {
    v18(v16, a2, v8);
    v18(v14, a2, v8);
    unint64_t v19 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    unint64_t v20 = (v10 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v21 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v21 + v19, v14, v8);
    *(void *)(v21 + v20) = v29;
    uint64_t v38 = &type metadata for ModelDocumentProvider;
    unint64_t v39 = sub_2467096BC();
    uint64_t v22 = (void *)swift_allocObject();
    uint64_t v36 = v22;
    v22[2] = 0;
    v22[3] = 0;
    v22[4] = sub_24670BCF4;
    v22[5] = v21;
    type metadata accessor for ModelDocumentBox(0);
    uint64_t v23 = (void *)swift_allocObject();
    uint64_t v24 = v32;
    v23[2] = v34;
    v23[3] = v24;
    uint64_t v25 = v31;
    v23[4] = v30;
    v23[5] = v25;
    sub_246709778(&qword_268F9C718, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_246709778(&qword_268F9C720, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
    sub_2467097C0();
    sub_246716588();
    return ((uint64_t (*)(uint64_t, uint64_t))v35)(a2, v8);
  }
  else
  {
    v18(v28, a2, v8);
    uint64_t v36 = 0;
    unint64_t v37 = 0xE000000000000000;
    sub_246716C28();
    sub_246716A98();
    sub_2467163F8();
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    sub_246716408();
    sub_2467163F8();
    v35(v16, v8);
    sub_246716A98();
    swift_bridgeObjectRelease();
    sub_246716A98();
    uint64_t result = sub_246716C78();
    __break(1u);
  }
  return result;
}

uint64_t sub_24670BA4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v3 = sub_2467169A8();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_246716428();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v8(v7, v15, v4);
  swift_bridgeObjectRetain();
  sub_2467169B8();
  sub_2467169E8();
  swift_allocObject();
  uint64_t v9 = sub_2467169F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E0);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_246717760;
  v8((char *)(v11 + v10), (uint64_t)v7, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v13 = MEMORY[0x263F8EE78];
  *a2 = v11;
  a2[1] = v13;
  a2[3] = 0;
  a2[4] = 0;
  a2[2] = v9;
  return result;
}

uint64_t objectdestroy_22Tm()
{
  uint64_t v1 = sub_246716428();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24670BCF4()
{
  return sub_24670BD0C((uint64_t (*)(unint64_t, uint64_t))sub_24670BA4C);
}

uint64_t sub_24670BD0C(uint64_t (*a1)(unint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(sub_246716428() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));

  return a1(v1 + v3, v4);
}

uint64_t NewDocumentAction.callAsFunction(contentType:prepareDocument:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = a3;
  swift_retain();
  sub_246716688();

  return swift_release();
}

uint64_t sub_24670BE4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_246714DD8(a1, (uint64_t)v11, &qword_268F9C8D0);
  if (!v12) {
    return sub_246714E3C((uint64_t)v11, &qword_268F9C8D0);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8D8);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    swift_retain();
    sub_246711CC8(v8);
    uint64_t v12 = &type metadata for ModelDocumentProvider;
    unint64_t v13 = sub_2467096BC();
    uint64_t v7 = (void *)swift_allocObject();
    v11[0] = v7;
    v7[2] = a2;
    v7[3] = a3;
    v7[4] = v9;
    v7[5] = v10;
    swift_retain();
    sub_246714E98((uint64_t)v11, a1, &qword_268F9C8D0);
    return swift_release();
  }
  return result;
}

uint64_t sub_24670BF5C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24670BF94(uint64_t a1)
{
  return sub_24670BE4C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t initializeBufferWithCopyOfBuffer for ModelDocument(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ModelDocument()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for ModelDocument(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ModelDocument(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
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

uint64_t assignWithTake for ModelDocument(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelDocument(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelDocument(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelDocument()
{
  return &type metadata for ModelDocument;
}

uint64_t type metadata accessor for ModelPlatformDocument(uint64_t a1)
{
  return sub_2467149B4(a1, (uint64_t *)&unk_268F9C738);
}

uint64_t sub_24670C218()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24670C268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(long long *__return_ptr, uint64_t))
{
  type metadata accessor for ModelDocumentBox(0);
  uint64_t v8 = (uint64_t *)(swift_dynamicCastClassUnconditional()
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument);
  uint64_t v9 = *v8;
  *uint64_t v8 = a3;
  v8[1] = a4;
  sub_246711CB8(a3);
  swift_unknownObjectRetain();
  uint64_t v10 = sub_246711CC8(v9);
  a5(&v14, v10);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  uint64_t v11 = v13;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2467164B8();
  sub_24670DD4C((uint64_t)&v13);
  sub_246713148(v11);
  return swift_unknownObjectRelease();
}

uint64_t sub_24670C408(uint64_t a1, uint64_t a2)
{
  return sub_24670C268(a1, a2, *(void *)v2, *(void *)(v2 + 8), *(void (**)(long long *__return_ptr, uint64_t))(v2 + 16));
}

uint64_t sub_24670C414@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_246713EF0();
  uint64_t result = swift_unknownObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24670C45C()
{
  return sub_246716568();
}

uint64_t sub_24670C478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C860);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a2, a1, v7);
  uint64_t v8 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F9C868) + 36));
  *uint64_t v8 = KeyPath;
  v8[1] = v5;

  return swift_retain();
}

unint64_t sub_24670C524(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C880);
  uint64_t v2 = sub_246716C98();
  long long v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_246714DD8(v6, (uint64_t)v15, &qword_268F9C888);
    unint64_t result = sub_246713CA4((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_246714824(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    _OWORD v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

void sub_24670C668(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246716398();
  v22[8] = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246716468();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v22 - v13;
  char v15 = sub_24670CBB0(v3);
  if (!v2)
  {
    v22[6] = v7;
    v22[7] = v12;
    if (v15)
    {
      sub_24670D12C(a1);
    }
    else
    {
      if (qword_268F9C390 != -1) {
        swift_once();
      }
      uint64_t v16 = v8;
      uint64_t v17 = __swift_project_value_buffer(v8, (uint64_t)qword_268F9DA60);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v17, v8);
      uint64_t v18 = sub_246716448();
      os_log_type_t v19 = sub_246716B78();
      if (os_log_type_enabled(v18, v19))
      {
        unint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v20 = 0;
        _os_log_impl(&dword_2466FE000, v18, v19, "Non-package URLs are not supported.", v20, 2u);
        MEMORY[0x24C536640](v20, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v16);
      sub_246714ABC();
      swift_allocError();
      *uint64_t v21 = 0;
      swift_willThrow();
    }
  }
}

uint64_t sub_24670CBB0(uint64_t a1)
{
  uint64_t v41 = a1;
  uint64_t v2 = sub_246716398();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v38 - v7;
  uint64_t v9 = sub_246716468();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8B8);
  MEMORY[0x270FA5388](v13 - 8);
  char v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2467162E8())
  {
    uint64_t v16 = sub_2467162B8();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    MEMORY[0x270FA5388](v18);
    *(&v38 - 2) = (uint64_t *)v15;
    uint64_t v19 = (uint64_t)v1;
    LOBYTE(v1) = v41;
    uint64_t v20 = v42;
    sub_246712544(v19, 4, 0, (uint64_t)sub_246714B8C, (uint64_t)(&v38 - 4));
    if (!v20)
    {
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16)) {
        LOBYTE(v1) = 0;
      }
      else {
        LOBYTE(v1) = sub_2467162A8() & 1;
      }
    }
    sub_246714E3C((uint64_t)v15, &qword_268F9C8B8);
  }
  else
  {
    if (qword_268F9C390 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer(v9, (uint64_t)qword_268F9DA60);
    uint64_t v42 = v10;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v21, v9);
    uint64_t v22 = *(void (**)(char *, os_log_t, uint64_t))(v3 + 16);
    v22(v8, v1, v2);
    v22(v6, v1, v2);
    uint64_t v23 = sub_246716448();
    os_log_type_t v24 = sub_246716B78();
    int v25 = v24;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v26 = swift_slowAlloc();
      os_log_t v40 = v23;
      uint64_t v27 = v26;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v45 = v41;
      *(_DWORD *)uint64_t v27 = 136315394;
      int v39 = v25;
      uint64_t v28 = sub_246716368();
      uint64_t v43 = sub_24671364C(v28, v29, &v45);
      uint64_t v38 = &v44;
      sub_246716BB8();
      swift_bridgeObjectRelease();
      uint64_t v30 = *(void (**)(char *, uint64_t))(v3 + 8);
      v30(v8, v2);
      *(_WORD *)(v27 + 12) = 2080;
      uint64_t v31 = sub_246716378();
      if (v32)
      {
        unint64_t v33 = v32;
      }
      else
      {
        uint64_t v31 = 0x6E776F6E6B6E75;
        unint64_t v33 = 0xE700000000000000;
      }
      uint64_t v43 = sub_24671364C(v31, v33, &v45);
      sub_246716BB8();
      swift_bridgeObjectRelease();
      v30(v6, v2);
      os_log_t v1 = v40;
      _os_log_impl(&dword_2466FE000, v40, (os_log_type_t)v39, "Attempted opening %s with %s scheme.\nURLs with non-file scheme are not supported.", (uint8_t *)v27, 0x16u);
      uint64_t v34 = v41;
      swift_arrayDestroy();
      MEMORY[0x24C536640](v34, -1, -1);
      MEMORY[0x24C536640](v27, -1, -1);
    }
    else
    {
      uint64_t v35 = *(void (**)(char *, uint64_t))(v3 + 8);
      LOBYTE(v1) = (_BYTE)v35;
      v35(v8, v2);
      v35(v6, v2);
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v12, v9);
    sub_246714ABC();
    swift_allocError();
    *uint64_t v36 = 0;
    swift_willThrow();
  }
  return v1 & 1;
}

void sub_24670D12C(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246716468();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_246716398();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = sub_24670CBB0((uint64_t)v3);
  if (!v2)
  {
    uint64_t v27 = v10;
    uint64_t v28 = a1;
    unint64_t v29 = v12;
    if (v13)
    {
      uint64_t v14 = v3;
      sub_2467165F8();
      type metadata accessor for ModelDocumentBox(0);
      uint64_t v15 = *(void *)(swift_dynamicCastClassUnconditional()
                      + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database);
      swift_retain();
      swift_unknownObjectRelease();
      if (!v15)
      {
        sub_246711CD8((uint64_t)v3, v28);
        return;
      }
      uint64_t v16 = v27;
      uint64_t v17 = v9;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v29, v28, v9);
      if (*(unsigned char *)(v15 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_readOnly) == 1)
      {
        id v18 = v3;
      }
      else
      {
        id v24 = v3;
        swift_retain();
        char v25 = sub_246716768();
        swift_release();
        if (v25)
        {
          swift_retain();
          sub_2467167A8();
          uint64_t v26 = (uint64_t)v29;
          swift_release();
          uint64_t v14 = v3;
LABEL_16:
          swift_retain();
          sub_246716858();
          swift_release();
          swift_retain();
          sub_246716808();
          swift_release();
          sub_246711CD8((uint64_t)v14, v26);

          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v26, v17);
          return;
        }
        uint64_t v14 = v3;
      }
      uint64_t v26 = (uint64_t)v29;
      goto LABEL_16;
    }
    if (qword_268F9C390 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v5, (uint64_t)qword_268F9DA60);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v19, v5);
    uint64_t v20 = sub_246716448();
    os_log_type_t v21 = sub_246716B78();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_2466FE000, v20, v21, "Non-package URLs are not supported.", v22, 2u);
      MEMORY[0x24C536640](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_246714ABC();
    swift_allocError();
    *uint64_t v23 = 0;
    swift_willThrow();
  }
}

uint64_t sub_24670D558(void *a1)
{
  uint64_t v2 = sub_246716398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246716358();
  id v6 = a1;
  sub_24670C668((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return 1;
}

uint64_t sub_24670D6A4(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8 = sub_246716398();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  id v12 = a5;
  id v13 = a1;
  id v14 = a4;
  sub_246716BD8();
  swift_unknownObjectRelease();
  if (v14)
  {
    uint64_t v15 = sub_246716A18();
  }
  else
  {
    uint64_t v15 = 0;
  }
  sub_246716358();

  sub_246714034((uint64_t)v18, v15, (uint64_t)v11);
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  return 1;
}

uint64_t sub_24670D898(uint64_t a1)
{
  uint64_t v3 = sub_246716398();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)objc_allocWithZone(v1);
  uint64_t v8 = qword_268F9C730;
  uint64_t v9 = self;
  uint64_t v10 = v7;
  *(void *)&v7[v8] = objc_msgSend(v9, sel_defaultManager);

  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v11 = sub_246716608();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v11;
}

void sub_24670DA00()
{
}

id sub_24670DA10()
{
  sub_24670DA54(0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModelPlatformDocument(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24670DA54(void (*a1)(uint64_t))
{
  sub_2467165F8();
  type metadata accessor for ModelDocumentBox(0);
  uint64_t v2 = *(void *)(swift_dynamicCastClassUnconditional()
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database);
  swift_retain();
  swift_unknownObjectRelease();
  if (v2)
  {
    if (*(unsigned char *)(v2 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_readOnly) == 1)
    {
      id v3 = v10;
      sub_246711CB8((uint64_t)a1);
    }
    else
    {
      id v6 = v10;
      sub_246711CB8((uint64_t)a1);
      swift_retain();
      char v7 = sub_246716768();
      swift_release();
      if (v7)
      {
        swift_retain();
        sub_2467167A8();
        swift_release();
      }
    }
    swift_retain();
    sub_246716858();
    swift_release();
    swift_retain();
    sub_246716808();
    swift_release();
    sub_2467165F8();
    uint64_t v8 = *(void *)(swift_dynamicCastClassUnconditional()
                   + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
    swift_retain();
    uint64_t v9 = swift_unknownObjectRelease();
    if (v8)
    {
      sub_24671097C();
      uint64_t v9 = swift_release();
    }
    if (a1)
    {
      a1(v9);

      sub_246711CC8((uint64_t)a1);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  else
  {
    sub_2467165F8();
    uint64_t v4 = *(void *)(swift_dynamicCastClassUnconditional()
                   + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
    swift_retain();
    uint64_t v5 = swift_unknownObjectRelease();
    if (v4)
    {
      sub_24671097C();
      uint64_t v5 = swift_release();
    }
    if (a1) {
      a1(v5);
    }
  }
}

id sub_24670DCE0(void *a1)
{
  id v1 = a1;
  sub_24670DA54(0);
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for ModelPlatformDocument(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_24670DD34(uint64_t a1)
{
}

uint64_t sub_24670DD44()
{
  return type metadata accessor for ModelPlatformDocument(0);
}

uint64_t sub_24670DD4C(uint64_t a1)
{
  sub_246713194(a1, (uint64_t)v8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  uint64_t v2 = v9;
  if (v9) {
    sub_246713148(v9);
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasLoadedDocument) = v2 != 0;
  sub_24670E934();
  uint64_t result = sub_246713194((uint64_t)v8, (uint64_t)&v9);
  if (v9)
  {
    uint64_t v4 = (void **)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
    uint64_t result = swift_beginAccess();
    uint64_t v5 = *v4;
    if (*v4)
    {
      uint64_t v6 = swift_allocObject();
      sub_246713194((uint64_t)v8, v6 + 16);
      id v7 = v5;
      sub_246713250(v8);
      type metadata accessor for ModelDocumentBox(0);
      sub_246716B58();

      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24670DEB0(uint64_t a1, uint64_t *a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246713250(a2);
  sub_2467164A8();
  swift_release();
  swift_release();
  uint64_t v3 = v9;
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246713194((uint64_t)a2, (uint64_t)&v9);
  swift_retain();
  sub_2467164B8();
  uint64_t v9 = v3;
  uint64_t v10 = v4;
  uint64_t v11 = v5;
  uint64_t v12 = v6;
  uint64_t v13 = v7;
  sub_24670DD4C(&v9);
  return sub_246713148(v3);
}

uint64_t sub_24670DFC8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();

  return swift_release();
}

uint64_t sub_24670E040()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  uint64_t v0 = v2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2467164B8();
  sub_24670DD4C((uint64_t)&v2);
  return sub_246713148(v0);
}

uint64_t sub_24670E160()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24670E1D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();

  return swift_release();
}

uint64_t sub_24670E24C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  return v1;
}

void (*sub_24670E2C0(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_24670E32C;
}

void sub_24670E32C(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[3];
    if (*(void *)(v4 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
    {
      id v5 = *(id *)(v4 + v3[4]);
      swift_retain();
      swift_retain();
      sub_246716788();
      swift_release();
      swift_release();
    }
  }

  free(v3);
}

uint64_t sub_24670E3C8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C840);
  uint64_t v37 = *(void *)(v1 - 8);
  uint64_t v38 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v36 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C848);
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v33 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
  uint64_t v5 = MEMORY[0x270FA5388](v32);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C850);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C858);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__base;
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C798);
  sub_246716488();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v17, v14);
  uint64_t v19 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__context;
  *(void *)&long long v39 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7A8);
  sub_246716488();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v19, v13, v10);
  uint64_t v20 = (void *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument);
  *uint64_t v20 = 0;
  v20[1] = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasLoadedDocument) = 0;
  uint64_t v21 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__fileURL;
  uint64_t v22 = sub_246716398();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 1, 1, v22);
  sub_246714DD8((uint64_t)v9, (uint64_t)v7, &qword_268F9C7B8);
  uint64_t v23 = v33;
  sub_246716488();
  sub_246714E3C((uint64_t)v9, &qword_268F9C7B8);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v21, v23, v35);
  uint64_t v24 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__isEditable;
  LOBYTE(v39) = 0;
  char v25 = v36;
  sub_246716488();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v24, v25, v38);
  *(void *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager) = 0;
  uint64_t v26 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName;
  strcpy((char *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName), "StoreContent");
  *(unsigned char *)(v26 + 13) = 0;
  *(_WORD *)(v26 + 14) = -5120;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened) = 1;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasPrepared) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = 0;
  *(void *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database) = 0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  long long v27 = v39;
  long long v28 = v40;
  uint64_t v29 = v41;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  swift_retain();
  sub_2467164B8();
  long long v39 = v27;
  long long v40 = v28;
  uint64_t v41 = v29;
  sub_24670DD4C((uint64_t)&v39);
  sub_246713148(v27);
  return v0;
}

uint64_t sub_24670E934()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_246716468();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246716398();
  uint64_t v56 = *(void *)(v8 - 8);
  uint64_t v57 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v55 = (uint64_t)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v62 = (char *)&v50 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database);
  if (v15)
  {
    uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
    if (*(unsigned char *)(v15 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_readOnly) == 1)
    {
      swift_retain_n();
      swift_retain();
    }
    else
    {
      long long v54 = v7;
      uint64_t v17 = v5;
      uint64_t v18 = v4;
      swift_retain_n();
      swift_retain();
      swift_retain();
      char v19 = sub_246716768();
      swift_release();
      if (v19)
      {
        swift_retain();
        sub_2467167A8();
        if (v1)
        {

          swift_release();
          uint64_t v2 = 0;
        }
        else
        {
          swift_release();
        }
      }
      uint64_t v4 = v18;
      uint64_t v5 = v17;
      uint64_t v7 = v54;
    }
    swift_retain();
    sub_246716858();
    if (v2)
    {

      uint64_t v2 = 0;
    }
    swift_release();
    swift_retain();
    sub_246716808();
    swift_release();
    if (v16)
    {
      sub_24671097C();
      swift_release();
      swift_release();
    }
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  uint64_t v20 = v61[0];
  uint64_t result = sub_246713148(v61[0]);
  if (v20)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2467164A8();
    swift_release();
    swift_release();
    uint64_t result = v61[0];
    if (v61[0])
    {
      uint64_t v22 = *(void *)(v61[1] + 16);
      uint64_t result = sub_246713148(v61[0]);
      if (!v22) {
        return result;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56))(v14, 1, 1, v57);
      uint64_t v23 = *(void *)(v3 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName);
      uint64_t v24 = *(void *)(v3 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName + 8);
      type metadata accessor for TemporaryDocument(0);
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t result = sub_246710124((uint64_t)v14, v23, v24);
      if (!result) {
        return result;
      }
      uint64_t v25 = result;
      uint64_t v53 = v4;
      sub_2467107E0(0);
      *(void *)(v3 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = v25;
      swift_retain();
      swift_release();
      sub_24670FF00((uint64_t)v62);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2467164A8();
      swift_release();
      uint64_t result = swift_release();
      uint64_t v26 = v61[0];
      if (v61[0])
      {
        uint64_t v27 = v61[2];
        swift_retain();
        sub_246713148(v26);
        swift_getKeyPath();
        swift_getKeyPath();
        sub_2467164A8();
        swift_release();
        swift_release();
        uint64_t result = v58;
        if (v58)
        {
          uint64_t v29 = v59;
          uint64_t v28 = v60;
          sub_246713148(v58);
          type metadata accessor for Database(0);
          swift_allocObject();
          uint64_t v30 = sub_246710E20(v62, v27, v29, v28, 0);
          uint64_t v31 = v53;
          if (v2)
          {
            if (qword_268F9C390 != -1) {
              swift_once();
            }
            uint64_t v32 = __swift_project_value_buffer(v31, (uint64_t)qword_268F9DA60);
            (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v32, v31);
            swift_retain();
            id v33 = v2;
            swift_retain();
            id v34 = v2;
            uint64_t v35 = v7;
            uint64_t v36 = sub_246716448();
            os_log_type_t v37 = sub_246716B78();
            if (os_log_type_enabled(v36, v37))
            {
              uint64_t v38 = swift_slowAlloc();
              os_log_t v52 = v36;
              uint64_t v39 = v38;
              unint64_t v51 = (void *)swift_slowAlloc();
              v62 = (char *)swift_slowAlloc();
              v61[0] = (uint64_t)v62;
              *(_DWORD *)uint64_t v39 = 136315394;
              uint64_t v40 = v55;
              long long v54 = v35;
              sub_24670FF00(v55);
              uint64_t v41 = sub_246716368();
              unint64_t v43 = v42;
              (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v40, v57);
              uint64_t v58 = sub_24671364C(v41, v43, v61);
              sub_246716BB8();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v39 + 12) = 2112;
              id v44 = v2;
              uint64_t v45 = v5;
              uint64_t v46 = _swift_stdlib_bridgeErrorToNSError();
              uint64_t v58 = v46;
              sub_246716BB8();
              uint64_t v47 = v51;
              *unint64_t v51 = v46;

              os_log_t v48 = v52;
              _os_log_impl(&dword_2466FE000, v52, v37, "Failed to create the database at %s: %@", (uint8_t *)v39, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C890);
              swift_arrayDestroy();
              MEMORY[0x24C536640](v47, -1, -1);
              unint64_t v49 = v62;
              swift_arrayDestroy();
              MEMORY[0x24C536640](v49, -1, -1);
              MEMORY[0x24C536640](v39, -1, -1);

              (*(void (**)(char *, uint64_t))(v45 + 8))(v54, v53);
            }
            else
            {
              swift_release_n();

              (*(void (**)(char *, uint64_t))(v5 + 8))(v35, v31);
            }
            swift_willThrow();
          }
          else
          {
            sub_246713DB0(v30);
            swift_release();
          }
          return swift_release();
        }
LABEL_32:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_32;
  }
  return result;
}

uint64_t sub_24670F178()
{
  uint64_t v1 = v0;
  uint64_t v2 = (unsigned char *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened);
  uint64_t result = swift_beginAccess();
  if ((*v2 & 1) == 0)
  {
    uint64_t v4 = OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasPrepared;
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasPrepared) != 1)
    {
      if (*(void *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
      {
        uint64_t v5 = (id *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
        swift_beginAccess();
        id v6 = *v5;
        swift_retain();
        objc_msgSend(v6, sel_disableUndoRegistration);
        uint64_t v7 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument);
        if (v7)
        {
          sub_246711CB8(*(void *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument));
          uint64_t v8 = swift_retain();
          v7(v8);
          sub_246711CC8((uint64_t)v7);
          swift_release();
        }
        id v9 = *v5;
        objc_msgSend(v9, sel_enableUndoRegistration);

        uint64_t result = swift_release();
        *(unsigned char *)(v1 + v4) = 1;
      }
    }
  }
  return result;
}

uint64_t sub_24670F2B8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__base;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C858);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__context;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_246711CC8(*(void *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_prepareDocument));
  uint64_t v5 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__fileURL;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C848);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox__isEditable;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C840);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_24670F450()
{
  sub_24670F2B8();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24670F4A8()
{
  return type metadata accessor for ModelDocumentBox(0);
}

void sub_24670F4B0()
{
  sub_24670F650(319, &qword_268F9C790, &qword_268F9C798);
  if (v0 <= 0x3F)
  {
    sub_24670F650(319, &qword_268F9C7A0, &qword_268F9C7A8);
    if (v1 <= 0x3F)
    {
      sub_24670F650(319, &qword_268F9C7B0, &qword_268F9C7B8);
      if (v2 <= 0x3F)
      {
        sub_24670F6A0();
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_24670F650(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_2467164C8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_24670F6A0()
{
  if (!qword_268F9C7C0)
  {
    unint64_t v0 = sub_2467164C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F9C7C0);
    }
  }
}

uint64_t sub_24670F6F8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ModelDocumentBox(0);
  uint64_t result = sub_246716478();
  *a1 = result;
  return result;
}

uint64_t sub_24670F738()
{
  return type metadata accessor for ModelPlatformDocument(0);
}

uint64_t sub_24670F740()
{
  type metadata accessor for ModelDocumentBox(0);
  uint64_t v0 = swift_allocObject();
  sub_24670E3C8();
  return v0;
}

uint64_t sub_24670F77C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_hasLoadedDocument);
}

uint64_t sub_24670F78C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24670F7D4(char a1)
{
  unint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_wasOpened);
  swift_beginAccess();
  *unint64_t v3 = a1;
  return sub_24670F178();
}

uint64_t (*sub_24670F82C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_24670F88C;
}

uint64_t sub_24670F88C(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_24670F178();
  }
  return result;
}

uint64_t sub_24670F8C0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();

  return swift_release();
}

uint64_t sub_24670F938(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246714DD8(a1, (uint64_t)v4, &qword_268F9C7B8);
  swift_retain();
  sub_2467164B8();
  return sub_246714E3C(a1, &qword_268F9C7B8);
}

uint64_t (*sub_24670FA10(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_246716498();
  return sub_24670FA9C;
}

uint64_t sub_24670FAA0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24670FB14()
{
  return sub_2467164B8();
}

uint64_t (*sub_24670FB84(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_246716498();
  return sub_24670FC10;
}

void sub_24670FC14(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

void *sub_24670FC7C()
{
  unsigned __int8 v1 = (void **)(v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_24670FCCC(void *a1)
{
  sub_24671449C(a1);
}

void (*sub_24670FD04(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24670E2C0(v2);
  return sub_24670FD5C;
}

void sub_24670FD5C(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_24670FDA4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  uint64_t result = swift_release();
  if (v2)
  {
    uint64_t v1 = swift_bridgeObjectRetain();
    sub_246713148(v1);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24670FE50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  uint64_t result = swift_release();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_246713148(v1);
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24670FF00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1
     + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument____lazy_storage___project;
  swift_beginAccess();
  sub_246714DD8(v9, (uint64_t)v8, &qword_268F9C7B8);
  uint64_t v10 = sub_246716398();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(a1, v8, v10);
  }
  sub_246714E3C((uint64_t)v8, &qword_268F9C7B8);
  swift_bridgeObjectRetain();
  sub_246716348();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_246714E98((uint64_t)v6, v9, &qword_268F9C7B8);
  return swift_endAccess();
}

uint64_t sub_246710124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v68 = a2;
  uint64_t v69 = a3;
  v70[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_246716428();
  uint64_t v61 = *(void *)(v5 - 8);
  uint64_t v62 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v60 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v63 = (uint64_t)v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v56 - v10;
  uint64_t v12 = sub_246716398();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v59 = (char *)v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v56 - v16;
  uint64_t v18 = *(void (**)(void))(v13 + 56);
  uint64_t v57 = v3
      + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument____lazy_storage___project;
  v18();
  *(unsigned char *)(v3 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) = 1;
  uint64_t v19 = OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager;
  uint64_t v20 = self;
  id v21 = objc_msgSend(v20, sel_defaultManager);
  uint64_t v58 = v19;
  *(void *)(v3 + v19) = v21;
  uint64_t v66 = v3;
  uint64_t v22 = (void *)(v3
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_databaseName);
  v56[1] = v22;
  uint64_t v23 = v69;
  *uint64_t v22 = v68;
  v22[1] = v23;
  uint64_t v68 = a1;
  sub_246714DD8(a1, (uint64_t)v11, &qword_268F9C7B8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  uint64_t v69 = v12;
  int v25 = v24(v11, 1, v12);
  v67 = v17;
  v64 = (void (*)(void, void, void))v20;
  uint64_t v65 = v13;
  if (v25 == 1)
  {
    id v26 = objc_msgSend(v20, sel_defaultManager);
    v70[0] = 0;
    id v27 = objc_msgSend(v26, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 9, 1, 0, 0, v70);

    id v28 = v70[0];
    if (!v27)
    {
      id v53 = v70[0];
      long long v54 = (void *)sub_2467162D8();

      swift_willThrow();
      sub_246714E3C((uint64_t)v11, &qword_268F9C7B8);
      sub_246714E3C(v68, &qword_268F9C7B8);

      sub_246714E3C(v57, &qword_268F9C7B8);
      swift_bridgeObjectRelease();

      goto LABEL_12;
    }
    sub_246716358();
    id v29 = v28;

    sub_246714E3C((uint64_t)v11, &qword_268F9C7B8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v11, v69);
  }
  uint64_t v30 = v63;
  sub_246714DD8(v68, v63, &qword_268F9C7B8);
  int v31 = v24((char *)v30, 1, v69);
  uint64_t v32 = v64;
  if (v31 == 1)
  {
    sub_246714E3C(v30, &qword_268F9C7B8);
    unint64_t v33 = 0xEB00000000746E65;
    uint64_t v34 = 0x6D75636F4477654ELL;
    uint64_t v35 = v67;
    uint64_t v36 = v65;
  }
  else
  {
    uint64_t v34 = sub_246716318();
    unint64_t v33 = v37;
    uint64_t v36 = v65;
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v30, v69);
    uint64_t v35 = v67;
  }
  uint64_t v38 = v66;
  uint64_t v39 = (uint64_t *)(v66
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_documentName);
  uint64_t *v39 = v34;
  v39[1] = v33;
  id v40 = objc_msgSend(v32, sel_defaultManager);
  uint64_t v41 = (void *)sub_246716328();
  v70[0] = 0;
  id v42 = objc_msgSend(v40, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v41, 1, v70);

  id v43 = v70[0];
  if (!v42)
  {
    id v51 = v70[0];
    os_log_t v52 = (void *)sub_2467162D8();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v69);
    sub_246714E3C(v68, &qword_268F9C7B8);

    sub_246714E3C(v57, &qword_268F9C7B8);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
LABEL_12:
    type metadata accessor for TemporaryDocument(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  id v44 = v59;
  sub_246716358();
  id v45 = v43;

  uint64_t v46 = v38 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_tempDirectory;
  uint64_t v47 = v38;
  uint64_t v48 = v69;
  v64 = *(void (**)(void, void, void))(v36 + 32);
  v64(v46, v44, v69);
  unint64_t v49 = v60;
  sub_246716408();
  sub_246716338();
  sub_246714E3C(v68, &qword_268F9C7B8);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v49, v62);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v67, v48);
  uint64_t v50 = v47;
  v64(v47 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_document, v44, v48);
  return v50;
}

void sub_2467107E0(void *a1)
{
  uint64_t v2 = v1;
  v11[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(v1
                + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager);
  uint64_t v5 = (void *)sub_246716328();
  if (a1)
  {
    type metadata accessor for FileAttributeKey(0);
    sub_246709778(&qword_268F9C3F0, type metadata accessor for FileAttributeKey);
    a1 = (void *)sub_246716A08();
  }
  v11[0] = 0;
  unsigned int v6 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v5, 1, a1, v11);

  id v7 = v11[0];
  if (v6)
  {
    *(unsigned char *)(v2 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) = 0;
    id v8 = v7;
  }
  else
  {
    id v9 = v11[0];
    uint64_t v10 = (void *)sub_2467162D8();

    swift_willThrow();
  }
}

void sub_24671097C()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed;
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) & 1) == 0)
  {
    uint64_t v2 = v0;
    uint64_t v3 = *(void **)(v0
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager);
    uint64_t v4 = (void *)sub_246716328();
    v9[0] = 0;
    LODWORD(v3) = objc_msgSend(v3, sel_removeItemAtURL_error_, v4, v9);

    id v5 = v9[0];
    if (v3)
    {
      *(unsigned char *)(v2 + v1) = 1;
      id v6 = v5;
    }
    else
    {
      id v7 = v9[0];
      id v8 = (void *)sub_2467162D8();

      swift_willThrow();
    }
  }
}

uint64_t sub_246710AA4()
{
  uint64_t v1 = v0;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed;
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_removed) & 1) == 0)
  {
    uint64_t v3 = *(void **)(v0
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager);
    uint64_t v4 = (void *)sub_246716328();
    v13[0] = 0;
    LOBYTE(v3) = objc_msgSend(v3, sel_removeItemAtURL_error_, v4, v13);

    id v5 = v13[0];
    if (v3)
    {
      *(unsigned char *)(v1 + v2) = 1;
      id v6 = v5;
    }
    else
    {
      id v7 = v13[0];
      id v8 = (void *)sub_2467162D8();

      swift_willThrow();
    }
  }
  uint64_t v9 = v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_tempDirectory;
  uint64_t v10 = sub_246716398();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_document, v10);
  sub_246714E3C(v1+ OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument____lazy_storage___project, &qword_268F9C7B8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v1
                     + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D56517TemporaryDocument_fileManager));
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_246710C4C()
{
  uint64_t v0 = sub_246710AA4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_246710CA0()
{
  return type metadata accessor for TemporaryDocument(0);
}

uint64_t type metadata accessor for TemporaryDocument(uint64_t a1)
{
  return sub_2467149B4(a1, (uint64_t *)&unk_268F9C800);
}

void sub_246710CC8()
{
  sub_246716398();
  if (v0 <= 0x3F)
  {
    sub_246710DB8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_246710DB8()
{
  if (!qword_268F9C810)
  {
    sub_246716398();
    unint64_t v0 = sub_246716BA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F9C810);
    }
  }
}

uint64_t sub_246710E20(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v53 = a4;
  int v55 = a5;
  uint64_t v52 = a3;
  uint64_t v60 = a2;
  uint64_t v62 = a1;
  uint64_t v6 = sub_246716918();
  MEMORY[0x270FA5388](v6 - 8);
  id v51 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246716938();
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246716398();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v50 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v43 - v14;
  uint64_t v16 = sub_246716468();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Database.Error(0);
  sub_246709778(&qword_268F9C8A0, (void (*)(uint64_t))type metadata accessor for Database.Error);
  uint64_t v20 = swift_allocError();
  swift_storeEnumTagMultiPayload();
  uint64_t v61 = v5;
  *(void *)(v5 + 24) = v20;
  if (qword_268F9C390 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v16, (uint64_t)qword_268F9DA60);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v21, v16);
  unint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v49(v15, (uint64_t)v62, v10);
  uint64_t v22 = sub_246716448();
  os_log_type_t v23 = sub_246716B68();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v56 = v11;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    os_log_t v43 = v22;
    uint64_t v46 = v16;
    uint64_t v26 = v25;
    uint64_t v44 = swift_slowAlloc();
    uint64_t v64 = v44;
    *(_DWORD *)uint64_t v26 = 136315394;
    id v45 = v19;
    uint64_t v27 = sub_246716368();
    uint64_t v63 = sub_24671364C(v27, v28, &v64);
    sub_246716BB8();
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void (**)(char *, uint64_t))(v11 + 8);
    v47(v15, v10);
    *(_WORD *)(v26 + 12) = 1024;
    char v29 = v55;
    LODWORD(v63) = v55 & 1;
    sub_246716BB8();
    os_log_t v30 = v43;
    _os_log_impl(&dword_2466FE000, v43, v23, "Creating a document at %s, readOnly: %{BOOL}d", (uint8_t *)v26, 0x12u);
    uint64_t v31 = v44;
    swift_arrayDestroy();
    MEMORY[0x24C536640](v31, -1, -1);
    MEMORY[0x24C536640](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v45, v46);
  }
  else
  {
    uint64_t v47 = *(void (**)(char *, uint64_t))(v11 + 8);
    v47(v15, v10);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    char v29 = v55;
  }
  uint64_t v48 = v10;
  uint64_t v32 = v62;
  v49(v50, (uint64_t)v62, v10);
  swift_retain();
  sub_246716908();
  unint64_t v33 = v57;
  sub_246716958();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C400);
  uint64_t v34 = v58;
  char v35 = v29;
  unint64_t v36 = (*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_246717760;
  uint64_t v38 = v59;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 16))(v37 + v36, v33, v59);
  sub_246716878();
  swift_allocObject();
  swift_retain();
  uint64_t v39 = v54;
  uint64_t v40 = sub_246716848();
  if (v39)
  {
    swift_release();
    v47(v32, v48);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v38);

    type metadata accessor for Database(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v41 = v61;
    *(void *)(v61 + 32) = v40;
    *(unsigned char *)(v41 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_readOnly) = v35 & 1;
    sub_2467167E8();
    swift_allocObject();
    swift_retain();
    *(void *)(v41 + 16) = sub_2467167F8();
    swift_retain();
    sub_246716798();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v38);
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 32))(v41 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_url, v62, v48);
  }
  return v61;
}

uint64_t sub_246711534(uint64_t a1)
{
  uint64_t v4 = sub_246716398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246716468();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_readOnly) == 1)
  {
    uint64_t v19 = v4;
    uint64_t v20 = v1;
    uint64_t v21 = a1;
    if (qword_268F9C390 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_268F9DA60);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
    uint64_t v13 = sub_246716448();
    os_log_type_t v14 = sub_246716B78();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      v18[1] = v2;
      uint64_t v16 = v15;
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_2466FE000, v13, v14, "The application attempts to write to a read-only document: aborting.", v15, 2u);
      MEMORY[0x24C536640](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v4 = v19;
    uint64_t v1 = v20;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_url, v4);
  sub_246714560();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2467117DC()
{
  swift_release();

  swift_release();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC18_SwiftData_SwiftUIP33_524154066D3CC43FAE4463A0B504D5658Database_url;
  uint64_t v2 = sub_246716398();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_246711894()
{
  return type metadata accessor for Database(0);
}

uint64_t type metadata accessor for Database(uint64_t a1)
{
  return sub_2467149B4(a1, (uint64_t *)&unk_268F9C828);
}

uint64_t sub_2467118BC()
{
  uint64_t result = sub_246716398();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for ContentModifier()
{
  return &type metadata for ContentModifier;
}

uint64_t destroy for ModelDocumentProvider(void *a1)
{
  if (*a1) {
    swift_release();
  }

  return swift_release();
}

void *initializeWithCopy for ModelDocumentProvider(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  return a1;
}

void *assignWithCopy for ModelDocumentProvider(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for ModelDocumentProvider(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*(void *)a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  swift_release();
LABEL_8:
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelDocumentProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelDocumentProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ModelDocumentProvider()
{
  return &type metadata for ModelDocumentProvider;
}

uint64_t sub_246711BE0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246711BFC(uint64_t a1)
{
  uint64_t result = sub_246709778(&qword_268F9C720, (void (*)(uint64_t))type metadata accessor for ModelDocumentBox);
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246711C58()
{
  unint64_t result = qword_268F9C838;
  if (!qword_268F9C838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C838);
  }
  return result;
}

uint64_t sub_246711CAC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_246711CB8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_246711CC8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_246711CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246716398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v41 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2467165F8();
  type metadata accessor for ModelDocumentBox(0);
  uint64_t v10 = *(void *)(swift_dynamicCastClassUnconditional()
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
  swift_retain();
  swift_unknownObjectRelease();
  if (v10)
  {
    sub_24671097C();
    swift_release();
  }
  sub_2467165F8();
  *(void *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = 0;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, a2, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v9, 0, 1, v4);
  sub_2467165F8();
  uint64_t v11 = swift_dynamicCastClassUnconditional();
  uint64_t v12 = *(void *)(v11 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName);
  uint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName + 8);
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
  type metadata accessor for TemporaryDocument(0);
  swift_allocObject();
  uint64_t v14 = sub_246710124((uint64_t)v9, v12, v13);
  sub_2467165F8();
  *(void *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument) = v14;
  swift_unknownObjectRelease();
  swift_release();
  sub_2467165F8();
  uint64_t v15 = *(void *)(swift_dynamicCastClassUnconditional()
                  + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_tempDocument);
  swift_retain();
  uint64_t v16 = swift_unknownObjectRelease();
  if (!v15)
  {
    sub_246714ABC();
    swift_allocError();
    *BOOL v24 = 2;
    swift_willThrow();
    return;
  }
  MEMORY[0x270FA5388](v16);
  v34[-2] = a1;
  v34[-1] = v15;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08830]), sel_initWithFilePresenter_, a1);
  v35[0] = 0;
  uint64_t v18 = sub_246716328();
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = sub_246714B10;
  v19[3] = &v34[-4];
  v19[4] = v35;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_246714B3C;
  *(void *)(v20 + 24) = v19;
  uint64_t v39 = sub_246715D24;
  uint64_t v40 = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t v37 = sub_246712E80;
  uint64_t v38 = &block_descriptor_178;
  uint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v18, 0, 0, v21);

  _Block_release(v21);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v18)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v35[0])
  {
    id v22 = v35[0];
    swift_willThrow();

    id v23 = v35[0];
    swift_release();
    swift_release();

    return;
  }

  id v25 = v35[0];
  swift_release();

  v34[1] = sub_2467165F8();
  v34[0] = swift_dynamicCastClassUnconditional();
  uint64_t v26 = v41;
  sub_24670FF00((uint64_t)v41);
  sub_2467165F8();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  uint64_t v27 = aBlock[0];
  if (!aBlock[0]) {
    goto LABEL_16;
  }
  uint64_t v28 = (uint64_t)v37;
  swift_retain();
  sub_246713148(v27);
  swift_unknownObjectRelease();
  sub_2467165F8();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (!aBlock[0])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v30 = (uint64_t)v38;
  uint64_t v29 = (uint64_t)v39;
  sub_246713148(aBlock[0]);
  sub_2467165F8();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (!v35[0])
  {
LABEL_18:
    __break(1u);
    return;
  }
  uint64_t v31 = *((void *)v35[1] + 2);
  sub_246713148((uint64_t)v35[0]);
  type metadata accessor for Database(0);
  swift_allocObject();
  uint64_t v32 = v34[2];
  uint64_t v33 = sub_246710E20(v26, v28, v30, v29, v31 == 0);
  if (v32)
  {
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_246713DB0(v33);
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
  }
}

id sub_246712444(uint64_t a1, uint64_t a2)
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = *(id *)(a2 + qword_268F9C730);
  long long v3 = (void *)sub_246716328();
  uint64_t v4 = (void *)sub_246716328();
  v8[0] = 0;
  unsigned int v5 = objc_msgSend(v2, sel_copyItemAtURL_toURL_error_, v3, v4, v8);

  if (v5) {
    return v8[0];
  }
  id v7 = v8[0];
  sub_2467162D8();

  return (id)swift_willThrow();
}

void sub_246712544(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08830]), sel_initWithFilePresenter_, v5);
  id v20 = 0;
  uint64_t v11 = (void *)sub_246716328();
  if (a3) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = a2;
  }
  uint64_t v13 = (void *)swift_allocObject();
  id v13[2] = a4;
  v13[3] = a5;
  void v13[4] = &v20;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_246715CF8;
  *(void *)(v14 + 24) = v13;
  aBlock[4] = sub_246715D28;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  uint64_t aBlock[2] = sub_246712E80;
  aBlock[3] = &block_descriptor_189;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v11, v12, 0, v15);

  _Block_release(v15);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    if (v20)
    {
      id v17 = v20;
      swift_willThrow();
    }
    id v18 = v20;
    swift_release();
  }
}

uint64_t sub_246712730(uint64_t a1, uint64_t a2)
{
  v23[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_2467162F8();
  uint64_t v20 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246716398();
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = *(id *)(a2 + qword_268F9C730);
  id v10 = (void *)sub_246716328();
  v23[0] = 0;
  unsigned int v11 = objc_msgSend(v9, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v10, 1, 0, v23);

  if (v11)
  {
    id v12 = v23[0];
    sub_2467165F8();
    type metadata accessor for ModelDocumentBox(0);
    uint64_t v13 = *(void *)(swift_dynamicCastClassUnconditional()
                    + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database);
    swift_retain();
    uint64_t result = swift_unknownObjectRelease();
    if (v13)
    {
      sub_2467165F8();
      uint64_t v15 = swift_dynamicCastClassUnconditional();
      id v17 = *(void **)(v15 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName);
      uint64_t v16 = *(void **)(v15 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_storeName + 8);
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      v23[0] = v17;
      v23[1] = v16;
      uint64_t v18 = v20;
      (*(void (**)(char *, void, uint64_t))(v20 + 104))(v5, *MEMORY[0x263F06E38], v3);
      sub_246714A68();
      sub_246716388();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v3);
      swift_bridgeObjectRelease();
      sub_246711534((uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
      return swift_release();
    }
  }
  else
  {
    id v19 = v23[0];
    sub_2467162D8();

    return swift_willThrow();
  }
  return result;
}

void sub_246712A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08830]), sel_initWithFilePresenter_, v4);
  id v16 = 0;
  id v9 = (void *)sub_246716328();
  id v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = &v16;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_246715CF4;
  *(void *)(v11 + 24) = v10;
  v15[4] = sub_246714A28;
  v15[5] = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  _OWORD v15[2] = sub_246712E80;
  v15[3] = &block_descriptor;
  id v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_coordinateWritingItemAtURL_options_error_byAccessor_, v9, a2, 0, v12);

  _Block_release(v12);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (a2)
  {
    __break(1u);
  }
  else
  {
    if (v16)
    {
      id v13 = v16;
      swift_willThrow();
    }
    id v14 = v16;
    swift_release();
  }
}

uint64_t sub_246712C34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8B8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246717760;
  id v8 = (void *)*MEMORY[0x263EFF6D0];
  *(void *)(inited + 32) = *MEMORY[0x263EFF6D0];
  id v9 = v8;
  sub_246714BA8(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_246716308();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v11 = sub_2467162B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
    return sub_246714E98((uint64_t)v6, a2, &qword_268F9C8B8);
  }
  return result;
}

BOOL sub_246712DA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_246712DB8()
{
  return sub_246716D58();
}

uint64_t sub_246712E00()
{
  return sub_246716D48();
}

uint64_t sub_246712E2C()
{
  return sub_246716D58();
}

uint64_t sub_246712E80(uint64_t a1)
{
  uint64_t v2 = sub_246716398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_246716358();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_246712F64(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_246712FE8()
{
  uint64_t v0 = sub_246716468();
  __swift_allocate_value_buffer(v0, qword_268F9DA60);
  __swift_project_value_buffer(v0, (uint64_t)qword_268F9DA60);
  return sub_246716458();
}

double sub_246713064@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_2467130F0(uint64_t *a1)
{
  return sub_24670E040();
}

uint64_t sub_246713148(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_246713194(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C798);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2467131FC()
{
  if (*(void *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_246713248(uint64_t a1)
{
  return sub_24670DEB0(a1, (uint64_t *)(v1 + 16));
}

uint64_t *sub_246713250(uint64_t *a1)
{
  return a1;
}

uint64_t sub_246713284(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_2467132D0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_246713350()
{
  return sub_2467164B8();
}

uint64_t sub_2467133CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();

  return swift_release();
}

uint64_t sub_246713448(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_246714DD8(a1, (uint64_t)&v9 - v6, &qword_268F9C7B8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246714DD8((uint64_t)v7, (uint64_t)v5, &qword_268F9C7B8);
  swift_retain();
  sub_2467164B8();
  return sub_246714E3C((uint64_t)v7, &qword_268F9C7B8);
}

uint64_t sub_246713558@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2467164A8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2467135D8()
{
  return sub_2467164B8();
}

uint64_t sub_24671364C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_246713720(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_246714934((uint64_t)v12, *a3);
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
      sub_246714934((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_246713720(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_246716BC8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2467138DC(a5, a6);
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
  uint64_t v8 = sub_246716C48();
  if (!v8)
  {
    sub_246716C68();
    __break(1u);
LABEL_17:
    uint64_t result = sub_246716CA8();
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

uint64_t sub_2467138DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_246713974(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_246713B54(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_246713B54(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246713974(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_246713AEC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_246716C38();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_246716C68();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_246716AA8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_246716CA8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_246716C68();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_246713AEC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C898);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_246713B54(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C898);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_246716CA8();
  __break(1u);
  return result;
}

unint64_t sub_246713CA4(uint64_t a1)
{
  uint64_t v2 = sub_246716BE8();

  return sub_246713CE8(a1, v2);
}

unint64_t sub_246713CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_246714834(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C535F60](v9, a1);
      sub_246714890((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_246713DB0(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database;
  if (*(void *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
  {
    swift_retain();
    swift_retain();
    sub_246716788();
    swift_release();
    swift_release();
  }
  *(void *)(v1 + v3) = a1;
  swift_retain();
  uint64_t result = swift_release();
  if (*(void *)(v1 + v3))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_2467164B8();
    size_t v5 = (id *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
    swift_beginAccess();
    id v6 = *v5;
    swift_retain();
    sub_246716788();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_246713EF0()
{
  type metadata accessor for ModelDocumentBox(0);
  if (swift_dynamicCastClass())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_unknownObjectRetain();
    sub_2467164A8();
    swift_release();
    swift_release();
    if (v1)
    {
      swift_unknownObjectRelease();
      return v1;
    }
    __break(1u);
  }
  sub_246716C28();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  sub_246716D68();
  sub_246716A98();
  swift_bridgeObjectRelease();
  uint64_t result = sub_246716C78();
  __break(1u);
  return result;
}

uint64_t sub_246714034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_246716398();
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  MEMORY[0x270FA5388](v7);
  int64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246716468();
  uint64_t v43 = *(void *)(v10 - 8);
  unint64_t v11 = MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    unint64_t v11 = sub_24670C524(MEMORY[0x263F8EE78]);
  }
  MEMORY[0x270FA5388](v11);
  *(&v35 - 2) = v3;
  swift_bridgeObjectRetain();
  sub_246712A54(a3, 0, (uint64_t)sub_2467149EC, (uint64_t)(&v35 - 4));
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_268F9C390 != -1) {
    swift_once();
  }
  uint64_t v14 = v10;
  uint64_t v15 = __swift_project_value_buffer(v10, (uint64_t)qword_268F9DA60);
  uint64_t v16 = v43;
  id v17 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v13, v15, v14);
  uint64_t v19 = v41;
  uint64_t v18 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v9, a3, v42);
  id v20 = v4;
  id v21 = v4;
  uint64_t v22 = sub_246716448();
  os_log_type_t v23 = sub_246716B78();
  int v24 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v39 = v17;
    uint64_t v40 = v14;
    uint64_t v26 = v19;
    uint64_t v27 = v25;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v45 = v38;
    *(_DWORD *)uint64_t v27 = 136315394;
    int v37 = v24;
    uint64_t v28 = sub_246716368();
    uint64_t v44 = sub_24671364C(v28, v29, &v45);
    os_log_t v36 = v22;
    sub_246716BB8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v18);
    *(_WORD *)(v27 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v30 = sub_246716CE8();
    uint64_t v44 = sub_24671364C(v30, v31, &v45);
    sub_246716BB8();
    swift_bridgeObjectRelease();

    os_log_t v32 = v36;
    _os_log_impl(&dword_2466FE000, v36, (os_log_type_t)v37, "Failed to write the document at %s: %s.", (uint8_t *)v27, 0x16u);
    uint64_t v33 = v38;
    swift_arrayDestroy();
    MEMORY[0x24C536640](v33, -1, -1);
    MEMORY[0x24C536640](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v39, v40);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v18);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v17, v14);
  }
  return swift_willThrow();
}

void sub_24671449C(void *a1)
{
  uint64_t v3 = (id *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_undoManager);
  swift_beginAccess();
  id v4 = *v3;
  *uint64_t v3 = a1;
  id v5 = a1;

  if (*(void *)(v1 + OBJC_IVAR____TtC18_SwiftData_SwiftUI16ModelDocumentBox_database))
  {
    id v6 = *v3;
    swift_retain();
    swift_retain();
    sub_246716788();
    swift_release();
    swift_release();
  }
}

id sub_246714560()
{
  v13[15] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF298]), sel_init);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF320]), sel_initWithManagedObjectModel_, v0);

  uint64_t v2 = (void *)sub_246716328();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C870);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246717760;
  v13[0] = (id)sub_246716A68();
  v13[1] = v4;
  sub_246716C08();
  unint64_t v5 = sub_2467147E4();
  uint64_t v6 = sub_246716B88();
  *(void *)(inited + 96) = v5;
  *(void *)(inited + 72) = v6;
  sub_24670C524(inited);
  uint64_t v7 = (void *)sub_246716A08();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_246716328();
  uint64_t v9 = *MEMORY[0x263EFF168];
  v13[0] = 0;
  unsigned int v10 = objc_msgSend(v1, sel_replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_, v2, v7, v8, 0, v9, v13);

  if (v10) {
    return v13[0];
  }
  id v12 = v13[0];
  sub_2467162D8();

  return (id)swift_willThrow();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

unint64_t sub_2467147E4()
{
  unint64_t result = qword_268F9C878;
  if (!qword_268F9C878)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F9C878);
  }
  return result;
}

_OWORD *sub_246714824(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_246714834(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_246714890(uint64_t a1)
{
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

uint64_t sub_246714934(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for Database.Error(uint64_t a1)
{
  return sub_2467149B4(a1, (uint64_t *)&unk_268F9C8F0);
}

uint64_t sub_2467149B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2467149EC(uint64_t a1)
{
  return sub_246712730(a1, *(void *)(v1 + 16));
}

uint64_t sub_246714A08()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246714A18()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246714A28()
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

unint64_t sub_246714A68()
{
  unint64_t result = qword_268F9C8A8;
  if (!qword_268F9C8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C8A8);
  }
  return result;
}

unint64_t sub_246714ABC()
{
  unint64_t result = qword_268F9C8B0;
  if (!qword_268F9C8B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C8B0);
  }
  return result;
}

id sub_246714B10(uint64_t a1)
{
  return sub_246712444(a1, *(void *)(v1 + 16));
}

uint64_t sub_246714B2C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246714B3C(uint64_t a1)
{
  return sub_246712F64(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_246714B5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246714B6C()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_246714B7C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_246714B8C(uint64_t a1)
{
  return sub_246712C34(a1, *(void *)(v1 + 16));
}

uint64_t sub_246714BA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8C8);
    uint64_t v3 = sub_246716C18();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      uint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_246716A68();
      sub_246716D38();
      id v7 = v6;
      sub_246716A88();
      uint64_t v8 = sub_246716D58();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_246716A68();
        uint64_t v17 = v16;
        if (v15 == sub_246716A68() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_246716CD8();
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
          uint64_t v22 = sub_246716A68();
          uint64_t v24 = v23;
          if (v22 == sub_246716A68() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_246716CD8();
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

uint64_t sub_246714DD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246714E3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246714E98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ModelDocumentError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ModelDocumentError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246715068);
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

uint64_t sub_246715090(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24671509C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ModelDocumentError()
{
  return &type metadata for ModelDocumentError;
}

uint64_t *sub_2467150B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = sub_246716398();
      uint64_t v9 = *(void *)(v8 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 16))(a1, a2, v8);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E8) + 48);
      uint64_t v14 = *(void **)((char *)a2 + v13);
      id v15 = v14;
      *(uint64_t *)((char *)a1 + v13) = (uint64_t)v14;
      goto LABEL_11;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

void sub_24671529C(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v3 = sub_246716398();
    uint64_t v4 = *(void *)(v3 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3)) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
    }
    int v5 = *(void **)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E8) + 48));
  }
}

void *sub_2467153B4(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = sub_246716398();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E8) + 48);
    uint64_t v12 = *(void **)((char *)a2 + v11);
    id v13 = v12;
    *(void *)((char *)a1 + v11) = v12;
    goto LABEL_9;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *sub_246715558(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_246715714((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = sub_246716398();
      uint64_t v8 = *(void *)(v7 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E8) + 48);
      uint64_t v11 = *(void **)((char *)a2 + v10);
      id v12 = v11;
      *(void *)((char *)a1 + v10) = v11;
      goto LABEL_10;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_246715714(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Database.Error(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_246715770(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_246716398();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E8);
    *(void *)&a1[*(int *)(v9 + 48)] = *(void *)&a2[*(int *)(v9 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_2467158E8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_246715714((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_246716398();
      uint64_t v7 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C7B8);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9C8E8);
      *(void *)&a1[*(int *)(v9 + 48)] = *(void *)&a2[*(int *)(v9 + 48)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_246715A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_246715A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_246715AC8()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_246715AD8()
{
  sub_246710DB8();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v1[4] = v1;
    v1[5] = &unk_246717ED0;
    swift_initEnumMetadataMultiPayload();
  }
}

unint64_t sub_246715B80()
{
  unint64_t result = qword_268F9C900;
  if (!qword_268F9C900)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C868);
    sub_246715C44(&qword_268F9C908, &qword_268F9C860);
    sub_246715C44(&qword_268F9C440, &qword_268F9C438);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C900);
  }
  return result;
}

uint64_t sub_246715C44(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_246715C8C()
{
  unint64_t result = qword_268F9C910;
  if (!qword_268F9C910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C910);
  }
  return result;
}

uint64_t sub_246715D2C()
{
  sub_246715D8C();
  uint64_t result = sub_246716B98();
  qword_268F9DAB0 = result;
  return result;
}

unint64_t sub_246715D8C()
{
  unint64_t result = qword_268F9C918;
  if (!qword_268F9C918)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F9C918);
  }
  return result;
}

uint64_t sub_246715DCC()
{
  sub_246701148();
  sub_246716668();
  return v1;
}

uint64_t EnvironmentValues.modelContext.getter()
{
  sub_246701148();
  sub_246716668();
  uint64_t result = v1;
  if (!v1)
  {
    if (qword_268F9C388 != -1) {
      swift_once();
    }
    return swift_retain();
  }
  return result;
}

uint64_t sub_246715E84@<X0>(uint64_t *a1@<X8>)
{
  sub_246701148();
  sub_246716668();
  uint64_t result = v3;
  if (!v3)
  {
    if (qword_268F9C388 != -1) {
      swift_once();
    }
    uint64_t result = swift_retain();
  }
  *a1 = result;
  return result;
}

uint64_t sub_246715F14()
{
  return sub_246716678();
}

uint64_t EnvironmentValues.modelContext.setter()
{
  return sub_246716678();
}

uint64_t (*EnvironmentValues.modelContext.modify(uint64_t *a1))(void *a1, char a2)
{
  a1[2] = v1;
  a1[3] = sub_246701148();
  sub_246716668();
  uint64_t v3 = a1[1];
  if (!v3)
  {
    if (qword_268F9C388 != -1) {
      swift_once();
    }
    uint64_t v3 = swift_retain();
  }
  *a1 = v3;
  return sub_246716064;
}

uint64_t sub_246716064(void *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0) {
    return sub_246716678();
  }
  swift_retain();
  sub_246716678();

  return swift_release();
}

ValueMetadata *type metadata accessor for ModelContextEnvironmentKey()
{
  return &type metadata for ModelContextEnvironmentKey;
}

void sub_246716110(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_246716118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_24671617C();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

unint64_t sub_24671617C()
{
  unint64_t result = qword_268F9C920;
  if (!qword_268F9C920)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9C7A8);
    sub_2467161F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C920);
  }
  return result;
}

unint64_t sub_2467161F0()
{
  unint64_t result = qword_268F9C570;
  if (!qword_268F9C570)
  {
    sub_2467167E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9C570);
  }
  return result;
}

uint64_t sub_246716248()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_246716258()
{
  return MEMORY[0x270EEE3A8]();
}

uint64_t sub_246716268()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_246716278()
{
  return MEMORY[0x270EEE978]();
}

uint64_t sub_246716288()
{
  return MEMORY[0x270EEE980]();
}

uint64_t sub_2467162A8()
{
  return MEMORY[0x270EEEFE0]();
}

uint64_t sub_2467162B8()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_2467162C8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2467162D8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2467162E8()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_2467162F8()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_246716308()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_246716318()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_246716328()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_246716338()
{
  return MEMORY[0x270FA1648]();
}

uint64_t sub_246716348()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_246716358()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_246716368()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_246716378()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_246716388()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_246716398()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2467163A8()
{
  return MEMORY[0x270EF1760]();
}

uint64_t sub_2467163B8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2467163C8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2467163D8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2467163E8()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2467163F8()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_246716408()
{
  return MEMORY[0x270FA18D8]();
}

uint64_t sub_246716418()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_246716428()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_246716438()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_246716448()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_246716458()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_246716468()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_246716478()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_246716488()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_246716498()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_2467164A8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2467164B8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2467164C8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2467164D8()
{
  return MEMORY[0x270EFEC38]();
}

uint64_t sub_2467164F8()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_246716508()
{
  return MEMORY[0x270EFF1E0]();
}

uint64_t sub_246716518()
{
  return MEMORY[0x270EFF420]();
}

uint64_t sub_246716528()
{
  return MEMORY[0x270EFF438]();
}

uint64_t sub_246716548()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_246716558()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_246716568()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_246716578()
{
  return MEMORY[0x270EFF678]();
}

uint64_t sub_246716588()
{
  return MEMORY[0x270EFF680]();
}

uint64_t sub_2467165A8()
{
  return MEMORY[0x270EFFD70]();
}

uint64_t sub_2467165C8()
{
  return MEMORY[0x270EFFE90]();
}

uint64_t sub_2467165D8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2467165E8()
{
  return MEMORY[0x270F00340]();
}

uint64_t sub_2467165F8()
{
  return MEMORY[0x270F004F0]();
}

uint64_t sub_246716608()
{
  return MEMORY[0x270F004F8]();
}

uint64_t sub_246716618()
{
  return MEMORY[0x270F00920]();
}

uint64_t sub_246716628()
{
  return MEMORY[0x270F00928]();
}

uint64_t sub_246716638()
{
  return MEMORY[0x270F00930]();
}

uint64_t sub_246716648()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_246716658()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_246716668()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_246716678()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_246716688()
{
  return MEMORY[0x270F00F98]();
}

uint64_t sub_246716698()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2467166A8()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_2467166B8()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2467166C8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2467166D8()
{
  return MEMORY[0x270F04790]();
}

uint64_t sub_2467166E8()
{
  return MEMORY[0x270F04798]();
}

uint64_t sub_2467166F8()
{
  return MEMORY[0x270F047A0]();
}

uint64_t sub_246716708()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_246716718()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_246716728()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_246716738()
{
  return MEMORY[0x270EFE760]();
}

uint64_t sub_246716748()
{
  return MEMORY[0x270EFE768]();
}

uint64_t sub_246716758()
{
  return MEMORY[0x270EFE780]();
}

uint64_t sub_246716768()
{
  return MEMORY[0x270EFE798]();
}

uint64_t sub_246716778()
{
  return MEMORY[0x270EFE7A0]();
}

uint64_t sub_246716788()
{
  return MEMORY[0x270EFE7A8]();
}

uint64_t sub_246716798()
{
  return MEMORY[0x270EFE7C0]();
}

uint64_t sub_2467167A8()
{
  return MEMORY[0x270EFE7D0]();
}

uint64_t sub_2467167B8()
{
  return MEMORY[0x270EFE7D8]();
}

uint64_t sub_2467167C8()
{
  return MEMORY[0x270EFE808]();
}

uint64_t sub_2467167D8()
{
  return MEMORY[0x270EFE810]();
}

uint64_t sub_2467167E8()
{
  return MEMORY[0x270EFE818]();
}

uint64_t sub_2467167F8()
{
  return MEMORY[0x270EFE828]();
}

uint64_t sub_246716808()
{
  return MEMORY[0x270EFE838]();
}

uint64_t sub_246716818()
{
  return MEMORY[0x270EFE840]();
}

uint64_t sub_246716828()
{
  return MEMORY[0x270EFE848]();
}

uint64_t sub_246716838()
{
  return MEMORY[0x270EFE850]();
}

uint64_t sub_246716848()
{
  return MEMORY[0x270EFE858]();
}

uint64_t sub_246716858()
{
  return MEMORY[0x270EFE868]();
}

uint64_t sub_246716868()
{
  return MEMORY[0x270EFE870]();
}

uint64_t sub_246716878()
{
  return MEMORY[0x270EFE878]();
}

uint64_t sub_246716888()
{
  return MEMORY[0x270EFE8A0]();
}

uint64_t sub_246716898()
{
  return MEMORY[0x270EFE8A8]();
}

uint64_t sub_2467168A8()
{
  return MEMORY[0x270EFE8B0]();
}

uint64_t sub_2467168B8()
{
  return MEMORY[0x270EFE8B8]();
}

uint64_t sub_2467168C8()
{
  return MEMORY[0x270EFE8C0]();
}

uint64_t sub_2467168D8()
{
  return MEMORY[0x270EFE8C8]();
}

uint64_t sub_2467168E8()
{
  return MEMORY[0x270EFE948]();
}

uint64_t sub_2467168F8()
{
  return MEMORY[0x270EFE950]();
}

uint64_t sub_246716908()
{
  return MEMORY[0x270EFE958]();
}

uint64_t sub_246716918()
{
  return MEMORY[0x270EFE970]();
}

uint64_t sub_246716928()
{
  return MEMORY[0x270EFE978]();
}

uint64_t sub_246716938()
{
  return MEMORY[0x270EFE988]();
}

uint64_t sub_246716948()
{
  return MEMORY[0x270EFE990]();
}

uint64_t sub_246716958()
{
  return MEMORY[0x270EFE998]();
}

uint64_t sub_246716968()
{
  return MEMORY[0x270EFE9B8]();
}

uint64_t sub_246716978()
{
  return MEMORY[0x270EFE9D0]();
}

uint64_t sub_246716988()
{
  return MEMORY[0x270EFEA20]();
}

uint64_t sub_246716998()
{
  return MEMORY[0x270EFEA28]();
}

uint64_t sub_2467169A8()
{
  return MEMORY[0x270EFEA68]();
}

uint64_t sub_2467169B8()
{
  return MEMORY[0x270EFEA70]();
}

uint64_t sub_2467169C8()
{
  return MEMORY[0x270EFEA78]();
}

uint64_t sub_2467169D8()
{
  return MEMORY[0x270EFEAB0]();
}

uint64_t sub_2467169E8()
{
  return MEMORY[0x270EFEAB8]();
}

uint64_t sub_2467169F8()
{
  return MEMORY[0x270EFEAC0]();
}

uint64_t sub_246716A08()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_246716A18()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_246716A28()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_246716A38()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246716A48()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_246716A58()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_246716A68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_246716A78()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_246716A88()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_246716A98()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_246716AA8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_246716AB8()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_246716AC8()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_246716AD8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_246716AE8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_246716AF8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_246716B08()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_246716B18()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_246716B28()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_246716B38()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_246716B48()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_246716B58()
{
  return MEMORY[0x270EF1F00]();
}

uint64_t sub_246716B68()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_246716B78()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_246716B88()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_246716B98()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_246716BA8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_246716BB8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_246716BC8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_246716BD8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_246716BE8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_246716BF8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_246716C08()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_246716C18()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_246716C28()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_246716C38()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_246716C48()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_246716C58()
{
  return MEMORY[0x270F9EB50]();
}

uint64_t sub_246716C68()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_246716C78()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_246716C88()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_246716C98()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_246716CA8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_246716CC8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_246716CD8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_246716CE8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_246716CF8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_246716D08()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_246716D18()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_246716D28()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_246716D38()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246716D48()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_246716D58()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_246716D68()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AGCompareValues()
{
  return MEMORY[0x270F0F118]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x270FA2468]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}