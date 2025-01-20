@interface UberContentContainer
- (_TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UberContentContainer

- (_TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_parallaxY) = 0;
  v7 = (char *)self
     + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_prominentPlayButtonCenterYOverride;
  *(void *)v7 = 0;
  v7[8] = 1;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UberContentContainer();
  v8 = -[UberContentContainer initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  [(UberContentContainer *)v8 setClipsToBounds:1];
  return v8;
}

- (_TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_parallaxY) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_prominentPlayButtonCenterYOverride;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (_TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1EE590();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_BA520009733D56FF860AA8122DA44FE220UberContentContainer_contents));
}

@end