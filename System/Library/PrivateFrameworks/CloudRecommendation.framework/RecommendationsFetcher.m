@interface RecommendationsFetcher
+ (_TtC19CloudRecommendation22RecommendationsFetcher)shared;
- (_TtC19CloudRecommendation22RecommendationsFetcher)init;
- (void)fetchClientRecommendationsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchClientRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5;
- (void)fetchCompletedRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5;
- (void)fetchRulesetsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchRulesetsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5;
- (void)fetchServerRecommendationsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchServerRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5;
- (void)refreshCacheFor:(id)a3;
- (void)refreshCacheFor:(id)a3 completion:(id)a4;
@end

@implementation RecommendationsFetcher

+ (_TtC19CloudRecommendation22RecommendationsFetcher)shared
{
  if (qword_269789F30 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26978A168;
  return (_TtC19CloudRecommendation22RecommendationsFetcher *)v2;
}

- (void)refreshCacheFor:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_24A2E10B4(v5, 0, 0);
}

- (void)refreshCacheFor:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_24A2EE648;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v9 = a3;
  v8 = self;
  sub_24A2E10B4(v9, (uint64_t)v6, v7);
  sub_24A2DFD38((uint64_t)v6);
}

- (void)fetchServerRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)())_Block_copy(a5);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_24A2EEEA8;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  *(void *)(v14 + 32) = self;
  *(void *)(v14 + 40) = a3;
  *(unsigned char *)(v14 + 48) = a4;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = v12;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  sub_24A2E00DC((uint64_t)v11);
  sub_24A2E2934((uint64_t)v10, (uint64_t)&unk_26978A428, v14);
  swift_release();
  sub_24A2DFD38((uint64_t)v11);
}

- (void)fetchServerRecommendationsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(unsigned char *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26978A410;
  v14[5] = v12;
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26978A418;
  v15[5] = v14;
  v16 = a3;
  id v17 = self;
  sub_24A2EAE34((uint64_t)v10, (uint64_t)&unk_26978A420, (uint64_t)v15);
  swift_release();
}

- (void)fetchRulesetsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_24A2EE478;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  *(void *)(v14 + 32) = self;
  *(void *)(v14 + 40) = a3;
  *(unsigned char *)(v14 + 48) = a4;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = v12;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  sub_24A2E00DC((uint64_t)v11);
  sub_24A2E2934((uint64_t)v10, (uint64_t)&unk_26978A400, v14);
  swift_release();
  sub_24A2DFD38((uint64_t)v11);
}

- (void)fetchRulesetsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(unsigned char *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26978A3E8;
  v14[5] = v12;
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26978A3F0;
  v15[5] = v14;
  v16 = a3;
  id v17 = self;
  sub_24A2EAE34((uint64_t)v10, (uint64_t)&unk_26978A3F8, (uint64_t)v15);
  swift_release();
}

- (void)fetchCompletedRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)())_Block_copy(a5);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_24A2EEEA8;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  *(void *)(v14 + 32) = self;
  *(void *)(v14 + 40) = a3;
  *(unsigned char *)(v14 + 48) = a4;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = v12;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  sub_24A2E00DC((uint64_t)v11);
  sub_24A2E2934((uint64_t)v10, (uint64_t)&unk_26978A3D8, v14);
  swift_release();
  sub_24A2DFD38((uint64_t)v11);
}

- (void)fetchClientRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_24A2EE398;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(void *)(v14 + 24) = 0;
  *(void *)(v14 + 32) = self;
  *(void *)(v14 + 40) = a3;
  *(unsigned char *)(v14 + 48) = a4;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = v12;
  id v15 = a3;
  v16 = self;
  id v17 = v15;
  sub_24A2E00DC((uint64_t)v11);
  sub_24A2E2934((uint64_t)v10, (uint64_t)&unk_26978A3D0, v14);
  swift_release();
  sub_24A2DFD38((uint64_t)v11);
}

- (void)fetchClientRecommendationsAsyncFor:(ACAccount *)a3 shouldIgnoreCache:(BOOL)a4 completionHandler:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26978A170);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(unsigned char *)(v12 + 24) = a4;
  *(void *)(v12 + 32) = v11;
  *(void *)(v12 + 40) = self;
  uint64_t v13 = sub_24A2F59C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26978A398;
  v14[5] = v12;
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26978A3A8;
  v15[5] = v14;
  v16 = a3;
  id v17 = self;
  sub_24A2EAE34((uint64_t)v10, (uint64_t)&unk_26978A3B8, (uint64_t)v15);
  swift_release();
}

- (_TtC19CloudRecommendation22RecommendationsFetcher)init
{
  uint64_t v3 = OBJC_IVAR____TtC19CloudRecommendation22RecommendationsFetcher_dataFetchers;
  type metadata accessor for DataFetchers();
  v4 = (objc_class *)swift_allocObject();
  id v5 = self;
  swift_defaultActor_initialize();
  *((void *)v4 + 14) = sub_24A2E0418(MEMORY[0x263F8EE78]);
  *(Class *)((char *)&self->super.isa + v3) = v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for RecommendationsFetcher();
  return [(RecommendationsFetcher *)&v7 init];
}

- (void).cxx_destruct
{
}

@end