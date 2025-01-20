@interface AppInstallAction
- (_TtC21CloudRecommendationUI16AppInstallAction)init;
- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation AppInstallAction

- (_TtC21CloudRecommendationUI16AppInstallAction)init
{
  result = (_TtC21CloudRecommendationUI16AppInstallAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI16AppInstallAction_activeRecommendation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI16AppInstallAction_storeProductViewController));
  v3 = (char *)self + OBJC_IVAR____TtC21CloudRecommendationUI16AppInstallAction_delegate;
  sub_24A3186D8((uint64_t)v3);
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  _s21CloudRecommendationUI16AppInstallActionC21productViewController_13didFinishWithySo014SKStoreProducthI0CSg_So19SKProductPageResultVtF_0();
}

@end