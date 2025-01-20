@interface CondensedAdLockupWithIconBackgroundView
- (NSArray)accessibilityElements;
- (_TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)isa;
@end

@implementation CondensedAdLockupWithIconBackgroundView

- (_TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView *)sub_5DB104(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5DBDC0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5DB70C();
}

- (NSArray)accessibilityElements
{
  sub_FD50(&qword_953E80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_78DBA0;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLockupView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = sub_77D880().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_77D890();
    NSArray v6 = self;
    isa = sub_77D880().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(CondensedAdLockupWithIconBackgroundView *)&v8 setAccessibilityElements:isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView_backgroundArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider39CondensedAdLockupWithIconBackgroundView_backgroundEffectView));

  swift_unknownObjectRelease();
}

@end