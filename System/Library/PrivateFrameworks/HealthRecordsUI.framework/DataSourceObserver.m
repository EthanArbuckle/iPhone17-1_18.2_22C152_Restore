@interface DataSourceObserver
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation DataSourceObserver

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1C2200274();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254E8A0();
  v11 = (void *)MEMORY[0x1C875A200](self->collectionView);
  swift_retain();
  objc_msgSend(v11, sel_reloadData);
  swift_release();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end