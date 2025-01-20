@interface LoadingIndicatorCoverView
- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView)initWithFrame:(CGRect)a3;
@end

@implementation LoadingIndicatorCoverView

- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView_spinner;
  id v6 = objc_allocWithZone((Class)type metadata accessor for LoadingIndicatorView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 100);
  uint64_t v8 = OBJC_IVAR____TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView_textLabel;
  type metadata accessor for LoadingLabel();
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  result = (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView *)sub_18F5D3E84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView_spinner));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7ChatKitP33_BD78CF6CDE905E05AD6D455A82FAED4A25LoadingIndicatorCoverView_textLabel);
}

@end