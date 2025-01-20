@interface InteractiveBackgroundContentView
- (UIColor)backgroundColor;
- (_TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation InteractiveBackgroundContentView

- (_TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView *)sub_2676E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView_artworkView;
  sub_76E300();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView *)sub_77EB20();
  __break(1u);
  return result;
}

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  v2 = [(InteractiveBackgroundContentView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v4 = a3;
  id v5 = v7.receiver;
  [(InteractiveBackgroundContentView *)&v7 setBackgroundColor:v4];
  id v6 = objc_msgSend(v5, "backgroundColor", v7.receiver, v7.super_class);
  sub_76E150();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractiveBackgroundContentView();
  id v2 = v3.receiver;
  [(InteractiveBackgroundContentView *)&v3 layoutSubviews];
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  sub_76E260();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_CA50C1B270CA71294BF32D54EF49CF7332InteractiveBackgroundContentView_artworkView));
}

@end