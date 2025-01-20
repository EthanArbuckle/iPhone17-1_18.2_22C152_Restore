@interface MockOnOffCluster
- (_TtC13HomeDataModel16MockOnOffCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5;
- (_TtC13HomeDataModel16MockOnOffCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
- (id)readAttributeOnOffWithParams:(id)a3;
- (void)offWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)onWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)toggleWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
@end

@implementation MockOnOffCluster

- (id)readAttributeOnOffWithParams:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_251AE7688();

  v6 = (void *)sub_251F35540();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)onWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269BA5550);
    a4 = (id)sub_251F35AC0();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = *(void (**)(uint64_t, id, uint64_t))((char *)&self->super.super.super.super.isa
                                                    + OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_commandObserver);
  id v13 = a3;
  id v14 = a5;
  v15 = self;
  if (v12)
  {
    sub_251AE9658((uint64_t)v12);
    v12(1, a4, 1);
    sub_251A27C7C((uint64_t)v12);
  }
  sub_251AE2E9C((uint64_t)a4, &OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_attributes);
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = 1;
  sub_251AE31FC((uint64_t)sub_251AE96D8, v11, (uint64_t)sub_251AE95FC, v16, (uint64_t)&unk_270267BA8, (uint64_t)&unk_270267BD0, (uint64_t)sub_251AE964C, (uint64_t)&block_descriptor_393);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)offWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269BA5550);
    a4 = (id)sub_251F35AC0();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = *(void (**)(void, id, void))((char *)&self->super.super.super.super.isa
                                                  + OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_commandObserver);
  id v13 = a3;
  id v14 = a5;
  v15 = self;
  if (v12)
  {
    sub_251AE9658((uint64_t)v12);
    v12(0, a4, 0);
    sub_251A27C7C((uint64_t)v12);
  }
  sub_251AE2E9C((uint64_t)a4, &OBJC_IVAR____TtC13HomeDataModel16MockOnOffCluster_attributes);
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = 0;
  sub_251AE31FC((uint64_t)sub_251AE96D8, v11, (uint64_t)sub_251AE95FC, v16, (uint64_t)&unk_270267BA8, (uint64_t)&unk_270267BD0, (uint64_t)sub_251AE964C, (uint64_t)&block_descriptor_393);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)toggleWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
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
  id v14 = self;
  sub_251AE7784((uint64_t)a4, (uint64_t)sub_251AE96D8, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC13HomeDataModel16MockOnOffCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
}

- (_TtC13HomeDataModel16MockOnOffCluster)initWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
}

- (void).cxx_destruct
{
}

@end