@interface IDSRecommendationProvider
- (IDSRecommendationProvider)init;
- (id)getIDForBestGuessIDWithHandle:(id)a3;
- (id)getIDForEmailAddressWithHandle:(id)a3;
- (id)getIDForPhoneNumberWithPhoneNumber:(id)a3;
- (void)validateHandlesWithIdsDestinations:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation IDSRecommendationProvider

- (id)getIDForEmailAddressWithHandle:(id)a3
{
  return sub_218BFE5B8(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x263F4A268]);
}

- (id)getIDForBestGuessIDWithHandle:(id)a3
{
  return sub_218BFE5B8(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x263F49E18]);
}

- (id)getIDForPhoneNumberWithPhoneNumber:(id)a3
{
  if (a3)
  {
    sub_218CAEE38();
    v4 = self;
    v5 = (void *)sub_218CAEDF8();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions();

  if (v7)
  {
    sub_218CAEE38();

    swift_bridgeObjectRelease();
    v8 = (void *)sub_218CAEDF8();
  }
  else
  {

    v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

- (void)validateHandlesWithIdsDestinations:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BEECA8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BEF290;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BE8C80, (uint64_t)v14);
  swift_release();
}

- (IDSRecommendationProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSRecommendationProvider();
  return [(IDSRecommendationProvider *)&v3 init];
}

@end