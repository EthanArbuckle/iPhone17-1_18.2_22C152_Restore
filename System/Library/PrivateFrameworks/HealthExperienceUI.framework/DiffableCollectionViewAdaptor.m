@interface DiffableCollectionViewAdaptor
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation DiffableCollectionViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1AD20F320(0, (unint64_t *)&qword_1EB738C20, MEMORY[0x1E4FBB1B0], MEMORY[0x1E4FB0FF8]);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v11 - v9;
  sub_1AD73D2B0();
  swift_retain();
  sub_1AD1F0360((uint64_t)v10, a5);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end