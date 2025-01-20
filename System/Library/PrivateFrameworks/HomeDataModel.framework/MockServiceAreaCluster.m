@interface MockServiceAreaCluster
- (_TtC13HomeDataModel22MockServiceAreaCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
- (void)selectAreasWithParams:(MTRServiceAreaClusterSelectAreasParams *)a3 expectedValues:(NSArray *)a4 expectedValueInterval:(NSNumber *)a5 completion:(id)a6;
- (void)skipAreaWithParams:(MTRServiceAreaClusterSkipAreaParams *)a3 expectedValues:(NSArray *)a4 expectedValueInterval:(NSNumber *)a5 completion:(id)a6;
@end

@implementation MockServiceAreaCluster

- (void)selectAreasWithParams:(MTRServiceAreaClusterSelectAreasParams *)a3 expectedValues:(NSArray *)a4 expectedValueInterval:(NSNumber *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269B9DD88;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269B9DD90;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_251AE7218((uint64_t)v13, (uint64_t)&unk_269B9DD98, (uint64_t)v18);
  swift_release();
}

- (void)skipAreaWithParams:(MTRServiceAreaClusterSkipAreaParams *)a3 expectedValues:(NSArray *)a4 expectedValueInterval:(NSNumber *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B220BB0);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_251F35CD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269B9DD18;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269B9DD28;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_251AE7218((uint64_t)v13, (uint64_t)&unk_269B9DD38, (uint64_t)v18);
  swift_release();
}

- (_TtC13HomeDataModel22MockServiceAreaCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
}

- (void).cxx_destruct
{
}

@end