@interface SizeClassResponsiveDataSource
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation SizeClassResponsiveDataSource

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1AD20E2C8();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73D2B0();
  swift_beginAccess();
  v12 = *(void **)self->changeObservers;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = self;
  *(unsigned char *)(v13 + 24) = a5;
  aBlock[4] = sub_1AD6C5960;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AD1EFE6C;
  aBlock[3] = &block_descriptor_32_0;
  v14 = _Block_copy(aBlock);
  swift_retain_n();
  id v15 = v12;
  swift_release();
  objc_msgSend(v15, sel_notifyObservers_, v14);
  _Block_release(v14);
  swift_release();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end