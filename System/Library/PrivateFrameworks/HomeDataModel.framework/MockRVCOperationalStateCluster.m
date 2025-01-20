@interface MockRVCOperationalStateCluster
- (_TtC13HomeDataModel30MockRVCOperationalStateCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
- (void)pauseWithExpectedValues:(NSArray *)a3 expectedValueInterval:(NSNumber *)a4 completion:(id)a5;
- (void)resumeWithExpectedValues:(NSArray *)a3 expectedValueInterval:(NSNumber *)a4 completion:(id)a5;
@end

@implementation MockRVCOperationalStateCluster

- (void)resumeWithExpectedValues:(NSArray *)a3 expectedValueInterval:(NSNumber *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269B9DE00;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269B9DE08;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_251AE7218((uint64_t)v11, (uint64_t)&unk_269B9DE10, (uint64_t)v16);
  swift_release();
}

- (void)pauseWithExpectedValues:(NSArray *)a3 expectedValueInterval:(NSNumber *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269B9DDC8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269B9DDD0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_251AE7218((uint64_t)v11, (uint64_t)&unk_269B9DDD8, (uint64_t)v16);
  swift_release();
}

- (_TtC13HomeDataModel30MockRVCOperationalStateCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
}

- (void).cxx_destruct
{
}

@end