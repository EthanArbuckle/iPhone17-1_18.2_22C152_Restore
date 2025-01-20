@interface ShortcutsUIButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC17_AppIntents_UIKit17ShortcutsUIButton)initWithCoder:(id)a3;
- (_TtC17_AppIntents_UIKit17ShortcutsUIButton)initWithFrame:(CGRect)a3;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
@end

@implementation ShortcutsUIButton

- (_TtC17_AppIntents_UIKit17ShortcutsUIButton)initWithCoder:(id)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = ShortcutsUIButton.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  if (a3)
  {
    double v8 = self;
    swift_unknownObjectRetain();
    sub_22F3BD928();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  ShortcutsUIButton.addTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  sub_22F3A69DC((uint64_t)v10);
}

- (_TtC17_AppIntents_UIKit17ShortcutsUIButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_style;
  sub_22F3BD508();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_hostingView));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC17_AppIntents_UIKit17ShortcutsUIButton_buttonTapHandler);

  sub_22F3A272C(v5);
}

@end