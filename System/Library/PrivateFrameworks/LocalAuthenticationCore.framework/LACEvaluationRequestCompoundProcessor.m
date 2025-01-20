@interface LACEvaluationRequestCompoundProcessor
- (BOOL)canProcessRequest:(id)a3;
- (_TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor)init;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
@end

@implementation LACEvaluationRequestCompoundProcessor

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  swift_unknownObjectRetain();
  id v9 = a4;
  v10 = self;
  specialized LACEvaluationRequestCompoundProcessor.processRequest(_:configuration:completion:)(a3, v9, (char *)v10, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_unknownObjectRelease();
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  if (self->processors[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_currentProcessorIndex])
  {
    swift_unknownObjectRetain();
    id v9 = a4;
    v10 = self;
    _Block_copy(v7);
    (*((void (**)(void *, id))v7 + 2))(v7, v9);
  }
  else
  {
    unint64_t v11 = *(unint64_t *)((char *)&self->super.isa
                              + OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_currentProcessorIndex);
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectRetain();
    id v13 = a4;
    v14 = self;
    _Block_copy(v7);
    specialized LACEvaluationRequestCompoundProcessor.postProcessRequest(_:result:subProcessorIndex:completion:)((uint64_t)a3, (uint64_t)v13, v11, (uint64_t)v14, v12, (void (*)(uint64_t))_sSo19LACEvaluationResultCIeyBy_ABIegg_TRTA_0, v8);
    swift_release();
  }
  swift_release();
  _Block_release(v7);
  swift_unknownObjectRelease();
}

- (BOOL)canProcessRequest:(id)a3
{
  return 1;
}

- (_TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor)init
{
  result = (_TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end