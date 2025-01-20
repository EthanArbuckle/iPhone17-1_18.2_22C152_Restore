@interface ContextXPCServiceServer.Server
- (_TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server)init;
- (void)dumpUIContextFromCacheWith:(id)a3;
- (void)refreshAndRetrieveWithContextTypes:(id)a3 with:(id)a4;
- (void)refreshWithContextTypes:(id)a3 interactionId:(id)a4 with:(id)a5;
- (void)retrieveAndRankIntelligenceCommandContextValuesWithQuery:(id)a3 appBundleIds:(id)a4 threshold:(id)a5 timeout:(id)a6 with:(id)a7;
- (void)retrieveContextValuesWithContextTypes:(id)a3 timeout:(id)a4 with:(id)a5;
- (void)retrieveContextValuesWithQuery:(id)a3 with:(id)a4;
- (void)retrieveRequiredContextValuesWith:(id)a3;
@end

@implementation ContextXPCServiceServer.Server

- (void)refreshWithContextTypes:(id)a3 interactionId:(id)a4 with:(id)a5
{
  v7 = _Block_copy(a5);
  if (a3)
  {
    id v8 = a4;
    v9 = self;
    id v10 = a3;
    a3 = (id)sub_252E43768();
    unint64_t v12 = v11;

    if (a4)
    {
LABEL_3:
      uint64_t v13 = sub_252E44CF8();
      uint64_t v15 = v14;

      goto LABEL_6;
    }
  }
  else
  {
    id v16 = a4;
    v17 = self;
    unint64_t v12 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v7;
  sub_252E372B8((uint64_t)a3, v12, v13, v15, (uint64_t)sub_252E3E0B4, v18);
  swift_release();
  swift_bridgeObjectRelease();
  sub_252E0E55C((uint64_t)a3, v12);
}

- (void)refreshAndRetrieveWithContextTypes:(id)a3 with:(id)a4
{
  v5 = _Block_copy(a4);
  v6 = self;
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = sub_252E43768();
    unint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v10 = 0xF000000000000000;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v5;
  sub_252E37B74(v8, v10, (uint64_t)sub_252E3E37C, v11);
  swift_release();
  sub_252E0E55C(v8, v10);
}

- (void)retrieveContextValuesWithContextTypes:(id)a3 timeout:(id)a4 with:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v15 = self;
  uint64_t v11 = sub_252E43768();
  unint64_t v13 = v12;

  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v8;
  sub_252E39358(v11, v13, a4, (uint64_t)sub_252E3E37C, v14);
  swift_release();
  sub_252DD946C(v11, v13);
}

- (void)retrieveAndRankIntelligenceCommandContextValuesWithQuery:(id)a3 appBundleIds:(id)a4 threshold:(id)a5 timeout:(id)a6 with:(id)a7
{
  id v10 = _Block_copy(a7);
  uint64_t v11 = sub_252E44CF8();
  uint64_t v13 = v12;
  uint64_t v14 = sub_252E44DE8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v10;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = self;
  sub_252E3A9B8(v11, v13, v14, a5, a6, (uint64_t)sub_252E3E37C, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)retrieveContextValuesWithQuery:(id)a3 with:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_252E44CF8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = self;
  sub_252E3B0C4(v6, v8, (uint64_t)sub_252E3E37C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)retrieveRequiredContextValuesWith:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_252E3CB28((uint64_t)sub_252E3E37C, v5);

  swift_release();
}

- (void)dumpUIContextFromCacheWith:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_252E3CB28((uint64_t)sub_252E3D8B8, v5);

  swift_release();
}

- (_TtCC30IntelligenceFlowContextRuntime23ContextXPCServiceServer6Server)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end