@interface UIContextXPCServiceServer.Server
- (_TtCC30IntelligenceFlowContextRuntime25UIContextXPCServiceServer6Server)init;
- (void)retrieveElementHierarchyWithVerbose:(BOOL)a3 args:(id)a4 with:(id)a5;
- (void)retrieveOnScreenContentWithParameters:(id)a3 with:(id)a4;
- (void)retrieveUIContextElementsWithOptions:(id)a3 with:(id)a4;
- (void)retrieveUIElementsWith:(id)a3;
@end

@implementation UIContextXPCServiceServer.Server

- (void)retrieveUIContextElementsWithOptions:(id)a3 with:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = sub_252E43768();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_252E413B0(v8, v10, (uint64_t)sub_252E3E37C, v11);
  swift_release();
  sub_252DD946C(v8, v10);
}

- (void)retrieveUIElementsWith:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_252E40158((uint64_t)sub_252E3E37C, v5);

  swift_release();
}

- (void)retrieveElementHierarchyWithVerbose:(BOOL)a3 args:(id)a4 with:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = sub_252E44DE8();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  unint64_t v10 = self;
  sub_252E40C40(a3, v8, (uint64_t)sub_252E3E37C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)retrieveOnScreenContentWithParameters:(id)a3 with:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = sub_252E43768();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_252E413B0(v8, v10, (uint64_t)sub_252E3D8B8, v11);
  swift_release();
  sub_252DD946C(v8, v10);
}

- (_TtCC30IntelligenceFlowContextRuntime25UIContextXPCServiceServer6Server)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end