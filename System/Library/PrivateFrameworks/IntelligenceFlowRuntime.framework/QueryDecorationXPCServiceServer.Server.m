@interface QueryDecorationXPCServiceServer.Server
- (_TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server)init;
- (void)queryDecorationCollectionWithQdInputData:(id)a3 crossAPIAssociationKeyData:(id)a4 with:(id)a5;
- (void)queryDecorationCollectionWithQdInputData:(id)a3 sessionUUIDData:(id)a4 with:(id)a5;
- (void)queryDecorationCollectionWithQdInputData:(id)a3 with:(id)a4;
@end

@implementation QueryDecorationXPCServiceServer.Server

- (void)queryDecorationCollectionWithQdInputData:(id)a3 with:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = sub_253DEFDD0();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_253DCC708(v8, v10, (uint64_t)sub_253DD1120, v11);
  swift_release();
  sub_253D75D88(v8, v10);
}

- (void)queryDecorationCollectionWithQdInputData:(id)a3 sessionUUIDData:(id)a4 with:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v18 = self;
  uint64_t v11 = sub_253DEFDD0();
  unint64_t v13 = v12;

  uint64_t v14 = sub_253DEFDD0();
  unint64_t v16 = v15;

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v8;
  sub_253DCE14C(v11, v13, v14, v16, (uint64_t)sub_253DD1120, v17, (uint64_t)&unk_270366F20, (uint64_t)&unk_270366F48, (uint64_t)sub_253DD111C, (uint64_t)&unk_269D7ECE8);
  swift_release();
  sub_253D75D88(v14, v16);
  sub_253D75D88(v11, v13);
}

- (void)queryDecorationCollectionWithQdInputData:(id)a3 crossAPIAssociationKeyData:(id)a4 with:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v18 = self;
  uint64_t v11 = sub_253DEFDD0();
  unint64_t v13 = v12;

  uint64_t v14 = sub_253DEFDD0();
  unint64_t v16 = v15;

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v8;
  sub_253DCE14C(v11, v13, v14, v16, (uint64_t)sub_253DD0CFC, v17, (uint64_t)&unk_270366EA8, (uint64_t)&unk_270366ED0, (uint64_t)sub_253DD0D04, (uint64_t)&unk_269D7ECA0);
  swift_release();
  sub_253D75D88(v14, v16);
  sub_253D75D88(v11, v13);
}

- (_TtCC23IntelligenceFlowRuntime31QueryDecorationXPCServiceServer6Server)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

@end