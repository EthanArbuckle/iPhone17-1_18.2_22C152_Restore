@interface PlaceInferenceSourceProvider
- (_TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider)init;
@end

@implementation PlaceInferenceSourceProvider

- (_TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider)init
{
  return (_TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider *)sub_252DEB9DC();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider_type;
  sub_252E43DC8();
  sub_252DE8A24();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider_queue));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC30IntelligenceFlowContextRuntime28PlaceInferenceSourceProvider_locationManager);
}

@end