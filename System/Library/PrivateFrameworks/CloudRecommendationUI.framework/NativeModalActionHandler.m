@interface NativeModalActionHandler
- (_TtC21CloudRecommendationUI24NativeModalActionHandler)init;
- (void)userDidCancelAction;
- (void)userDidCompleteAction:(id)a3;
@end

@implementation NativeModalActionHandler

- (void)userDidCompleteAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A34A974(v4);
}

- (void)userDidCancelAction
{
  v2 = self;
  sub_24A34AAAC();
}

- (_TtC21CloudRecommendationUI24NativeModalActionHandler)init
{
  result = (_TtC21CloudRecommendationUI24NativeModalActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24NativeModalActionHandler_presenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24NativeModalActionHandler_activeRecommendation));
  swift_unknownObjectRelease();
}

@end