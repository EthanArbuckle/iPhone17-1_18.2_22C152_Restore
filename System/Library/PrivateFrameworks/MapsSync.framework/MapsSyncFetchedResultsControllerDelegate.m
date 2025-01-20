@interface MapsSyncFetchedResultsControllerDelegate
- (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate)init;
- (void)contextDidChangeWithNotification:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)remoteChangeWithNotification:(id)a3;
@end

@implementation MapsSyncFetchedResultsControllerDelegate

- (void)contextDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A6F969C0(v4);
}

- (void)remoteChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A6F9C3D8(v4);
}

- (void)controllerDidChangeContent:(id)a3
{
}

- (void)controllerWillChangeContent:(id)a3
{
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB66FCC0);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  v15 = &v26[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v13);
  v17 = &v26[-v16];
  id v18 = a3;
  swift_unknownObjectRetain();
  v19 = self;
  id v20 = a5;
  id v21 = a7;
  sub_1A709D888();
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_1A709D278();

    uint64_t v22 = sub_1A709D288();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_1A709D288();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v17, 1, 1, v23);
  }
  if (v21)
  {
    sub_1A709D278();

    uint64_t v24 = sub_1A709D288();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v15, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = sub_1A709D288();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 1, 1, v25);
  }
  sub_1A6F9C4A4((uint64_t)v26, (uint64_t)v17, a6, (uint64_t)v15);

  sub_1A6F22460((uint64_t)v15, &qword_1EB66FCC0);
  sub_1A6F22460((uint64_t)v17, &qword_1EB66FCC0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
}

- (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate)init
{
  result = (_TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1A6F33A08((uint64_t)self + OBJC_IVAR____TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate__delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate__contentPredicate));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8MapsSync40MapsSyncFetchedResultsControllerDelegate__otherWatchedContentPredicate);
}

@end