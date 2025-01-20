@interface MOAngelControllerWrapper
- (_TtC16MomentsUIService24MOAngelControllerWrapper)init;
- (void)didReceivePresentationRequestWithOptions:(id)a3;
- (void)didReceiveUpdateRequestWithState:(unint64_t)a3 animated:(BOOL)a4;
- (void)shouldRefreshEvents;
- (void)willReturnAssetsForSuggestion:(MOSuggestion *)a3 withTypes:(NSArray *)a4 completion:(id)a5;
- (void)willReturnAssetsForSuggestion:(MOSuggestion *)a3 withTypes:(NSArray *)a4 onAssetsCallback:(id)a5;
@end

@implementation MOAngelControllerWrapper

- (_TtC16MomentsUIService24MOAngelControllerWrapper)init
{
  return (_TtC16MomentsUIService24MOAngelControllerWrapper *)MOAngelControllerWrapper.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper_serverManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper_engagementWriter));
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper_delegate, &demangling cache variable for type metadata for MOAngelControllerWrapperDelegate?);
  v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper__isVisible;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Bool>);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16MomentsUIService24MOAngelControllerWrapper__isExpanded;

  v6(v5, v4);
}

- (void)shouldRefreshEvents
{
  v2 = self;
  MOAngelControllerWrapper.shouldRefreshEvents()();
}

- (void)willReturnAssetsForSuggestion:(MOSuggestion *)a3 withTypes:(NSArray *)a4 completion:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in MOAngelControllerWrapper.willReturnAssets(for:withTypes:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_72Tu;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_77Tu, (uint64_t)v16);
  swift_release();
}

- (void)willReturnAssetsForSuggestion:(MOSuggestion *)a3 withTypes:(NSArray *)a4 onAssetsCallback:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in MOAngelControllerWrapper.willReturnAssets(for:withTypes:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTATu;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v16);
  swift_release();
}

- (void)didReceivePresentationRequestWithOptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  MOAngelControllerWrapper.didReceivePresentationRequest(with:)(v4);
}

- (void)didReceiveUpdateRequestWithState:(unint64_t)a3 animated:(BOOL)a4
{
  v6 = self;
  MOAngelControllerWrapper.didReceiveUpdateRequest(with:animated:)(a3, a4);
}

@end