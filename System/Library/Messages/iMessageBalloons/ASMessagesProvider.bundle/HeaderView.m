@interface HeaderView
- (_TtC18ASMessagesProviderP33_325AD3F8116EAD3DD531EDE1E760761810HeaderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_325AD3F8116EAD3DD531EDE1E760761810HeaderView)initWithReuseIdentifier:(id)a3;
- (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView)init;
- (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeaderView

- (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView)init
{
  return (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView *)sub_1CD2B8();
}

- (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1CF310();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4033E8();
}

- (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView_mediaView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProviderP33_F8126028EBC951D565C2F73D484F972E10HeaderView_gradientBlurView);
}

- (_TtC18ASMessagesProviderP33_325AD3F8116EAD3DD531EDE1E760761810HeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    sub_77D670();
    NSString v4 = sub_77D640();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_s18ASMessagesProvider10HeaderViewCMa_0();
  v5 = [(HeaderView *)&v7 initWithReuseIdentifier:v4];

  return v5;
}

- (_TtC18ASMessagesProviderP33_325AD3F8116EAD3DD531EDE1E760761810HeaderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s18ASMessagesProvider10HeaderViewCMa_0();
  return [(HeaderView *)&v5 initWithCoder:a3];
}

@end