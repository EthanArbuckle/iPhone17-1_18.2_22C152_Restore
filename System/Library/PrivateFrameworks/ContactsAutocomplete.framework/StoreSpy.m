@interface StoreSpy
- (_TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy)init;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidFinish:(id)a3;
@end

@implementation StoreSpy

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E20);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E28);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BEFB0118();
  uint64_t v12 = sub_1BEFB2718();
  v13 = (char *)self
      + OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_streamContinuation;
  swift_beginAccess();
  sub_1BEFAFF68((uint64_t)v13, (uint64_t)v7, &qword_1EA139E20);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E18);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v17 = v12;
    swift_unknownObjectRetain();
    v16 = self;
    swift_bridgeObjectRetain();
    sub_1BEFB2758();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  uint64_t v6 = self;
  sub_1BEFAFFCC(v7);
  swift_unknownObjectRelease();
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E20);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (char *)self
     + OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_streamContinuation;
  swift_beginAccess();
  sub_1BEFAFF68((uint64_t)v7, (uint64_t)v6, &qword_1EA139E20);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA139E18);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = 0;
    swift_unknownObjectRetain();
    uint64_t v10 = self;
    sub_1BEFB2768();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
    swift_unknownObjectRelease();
  }
}

- (_TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy)init
{
  result = (_TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BEFA135C((uint64_t)self + OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_results, &qword_1EA139D10);
  sub_1BEFA135C((uint64_t)self+ OBJC_IVAR____TtC20ContactsAutocompleteP33_EBE34D4C21093596BE6E4DA9F1A7E5D28StoreSpy_streamContinuation, &qword_1EA139E20);
  swift_unknownObjectRelease();
}

@end