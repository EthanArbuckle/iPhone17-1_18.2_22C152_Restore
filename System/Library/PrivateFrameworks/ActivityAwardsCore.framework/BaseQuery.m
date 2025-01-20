@interface BaseQuery
- (_TtC18ActivityAwardsCore9BaseQuery)init;
- (void)transportEvent:(unint64_t)a3 data:(id)a4;
- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5;
@end

@implementation BaseQuery

- (_TtC18ActivityAwardsCore9BaseQuery)init
{
  sub_223140068();
  swift_allocObject();
  v3 = self;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC18ActivityAwardsCore9BaseQuery_transportDispatchService) = (Class)sub_223140058();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for BaseQuery();
  return [(BaseQuery *)&v5 init];
}

- (void).cxx_destruct
{
}

- (void)transportRequest:(unint64_t)a3 data:(NSData *)a4 completion:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599E0);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_2231401C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267F9CD38;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267F9CD48;
  v15[5] = v14;
  v16 = a4;
  v17 = self;
  sub_2231330D4((uint64_t)v10, (uint64_t)&unk_267F9CD58, (uint64_t)v15);
  swift_release();
}

- (void)transportEvent:(unint64_t)a3 data:(id)a4
{
  if (a4)
  {
    v6 = self;
    id v7 = a4;
    uint64_t v8 = sub_22313FFC8();
    unint64_t v10 = v9;
  }
  else
  {
    v11 = self;
    uint64_t v8 = 0;
    unint64_t v10 = 0xF000000000000000;
  }
  _s18ActivityAwardsCore9BaseQueryC14transportEvent_4dataySo16AACTransportItemV_10Foundation4DataVSgtF_0(a3);
  sub_223133654(v8, v10);
}

@end