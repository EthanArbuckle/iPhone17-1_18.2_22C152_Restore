@interface HierarchicalDiffableCollectionViewAdaptor
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation HierarchicalDiffableCollectionViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  sub_1AD20E2C8();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73D2B0();
  v12 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29DiffableCollectionViewAdaptor_loaded;
  swift_beginAccess();
  unsigned char *v12 = 1;
  uint64_t v13 = *(void *)&self->super.backingDataSource[OBJC_IVAR____TtC18HealthExperienceUI29DiffableCollectionViewAdaptor_backingDataSource];
  uint64_t ObjectType = swift_getObjectType();
  swift_retain();
  uint64_t v15 = swift_unknownObjectRetain();
  uint64_t v16 = sub_1AD4BBB58(v15, ObjectType, v13);
  swift_unknownObjectRelease();
  sub_1AD4BB564(v16, v5, 0, 0);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end