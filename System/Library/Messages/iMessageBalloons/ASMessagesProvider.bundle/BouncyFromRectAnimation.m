@interface BouncyFromRectAnimation
- (_TtC18ASMessagesProvider23BouncyFromRectAnimation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation BouncyFromRectAnimation

- (double)transitionDuration:(id)a3
{
  return 0.7;
}

- (void)animateTransition:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1A9598(a3);
  if (*((unsigned char *)&v5->super.super.isa
       + OBJC_IVAR____TtC18ASMessagesProvider23BouncyFromRectAnimation_shouldAnimateTabBar) == 1)
    sub_1A93E8(a3);
  swift_unknownObjectRelease();
}

- (_TtC18ASMessagesProvider23BouncyFromRectAnimation)init
{
  result = (_TtC18ASMessagesProvider23BouncyFromRectAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end