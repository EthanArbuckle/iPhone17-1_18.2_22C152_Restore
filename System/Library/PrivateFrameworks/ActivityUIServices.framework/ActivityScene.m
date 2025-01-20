@interface ActivityScene
- (_TtC18ActivityUIServices13ActivityScene)initWithSession:(id)a3 connectionOptions:(id)a4;
@end

@implementation ActivityScene

- (_TtC18ActivityUIServices13ActivityScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  return (_TtC18ActivityUIServices13ActivityScene *)sub_23C97B424(a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene__settingsDiffer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_contentPayloadID));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_backgroundTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_textColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices13ActivityScene_resolvedMetrics));
  swift_bridgeObjectRelease();
}

@end