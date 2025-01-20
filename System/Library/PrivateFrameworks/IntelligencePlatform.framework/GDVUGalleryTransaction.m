@interface GDVUGalleryTransaction
- (BOOL)addWithObservation:(id)a3 context:(id)a4 priority:(int64_t)a5 at:(int64_t)a6 output:(int64_t *)a7 error:(id *)a8;
- (BOOL)remove:(int64_t)a3 error:(id *)a4;
- (BOOL)removeWithAsset:(id)a3 error:(id *)a4;
- (BOOL)tag:(int64_t)a3 with:(id)a4 type:(int64_t)a5 error:(id *)a6;
- (BOOL)untag:(int64_t)a3 error:(id *)a4;
- (GDVUGalleryTransaction)init;
@end

@implementation GDVUGalleryTransaction

- (BOOL)addWithObservation:(id)a3 context:(id)a4 priority:(int64_t)a5 at:(int64_t)a6 output:(int64_t *)a7 error:(id *)a8
{
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  GDVUGalleryTransaction.add(with:context:priority:at:output:)();

  return 1;
}

- (BOOL)remove:(int64_t)a3 error:(id *)a4
{
  return sub_1B2E2CF3C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))GDVUGalleryTransaction.remove(_:));
}

- (BOOL)removeWithAsset:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1B2E806B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B2E80698();
  v9 = self;
  GDVUGalleryTransaction.remove(withAsset:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (BOOL)tag:(int64_t)a3 with:(id)a4 type:(int64_t)a5 error:(id *)a6
{
  uint64_t v8 = sub_1B2E806B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B2E80698();
  v12 = self;
  GDVUGalleryTransaction.tag(_:with:type:)(a3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return 1;
}

- (BOOL)untag:(int64_t)a3 error:(id *)a4
{
  return sub_1B2E2CF3C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))GDVUGalleryTransaction.untag(_:));
}

- (GDVUGalleryTransaction)init
{
}

- (void).cxx_destruct
{
}

@end