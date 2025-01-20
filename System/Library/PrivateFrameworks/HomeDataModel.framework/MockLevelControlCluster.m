@interface MockLevelControlCluster
- (_TtC13HomeDataModel23MockLevelControlCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5;
- (_TtC13HomeDataModel23MockLevelControlCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
- (void)moveToLevelWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
@end

@implementation MockLevelControlCluster

- (void)moveToLevelWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269BA5550);
    a4 = (id)sub_251F35AC0();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_251AE791C(v12, (uint64_t)a4, (uint64_t)sub_251AE9574, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC13HomeDataModel23MockLevelControlCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
}

- (_TtC13HomeDataModel23MockLevelControlCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
}

- (void).cxx_destruct
{
}

@end