@interface HKHealthRecordAttachmentsIndexerHandler
- (HKHealthRecordAttachmentsIndexerHandler)init;
- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4;
- (void)indexWithRequest:(HKClinicalDocumentIndexingRequest *)a3 completion:(id)a4;
@end

@implementation HKHealthRecordAttachmentsIndexerHandler

- (void)indexWithRequest:(HKClinicalDocumentIndexingRequest *)a3 completion:(id)a4
{
  sub_23300BBD4();
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_23309BA90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2687583A0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2687583A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23306D818((uint64_t)v9, (uint64_t)&unk_2687583B0, (uint64_t)v14);
  swift_release();
}

- (void)fetchSpotlightSearchResultsForQueryString:(id)a3 completion:(id)a4
{
  sub_23300BBD4();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_23309B710();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = sub_23309BA90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v10;
  v15[5] = v12;
  v15[6] = sub_23300BD50;
  v15[7] = v13;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23300B72C((uint64_t)v8, (uint64_t)&unk_268758388, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (HKHealthRecordAttachmentsIndexerHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(HKHealthRecordAttachmentsIndexerHandler *)&v3 init];
}

@end