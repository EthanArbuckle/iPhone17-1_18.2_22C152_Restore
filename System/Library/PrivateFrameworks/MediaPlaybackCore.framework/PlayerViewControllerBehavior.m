@interface PlayerViewControllerBehavior
- (PlayerViewControllerBehavior)init;
- (void)contextWillHandleUserAction:(int64_t)a3;
- (void)skipToNextItem;
- (void)skipToPreviousItem;
- (void)willMoveToContext:(id)a3;
@end

@implementation PlayerViewControllerBehavior

- (void)skipToPreviousItem
{
  v2 = self;
  sub_21BC5BF54();
}

- (void)skipToNextItem
{
  v2 = self;
  sub_21BC5BFA4();
}

- (void)contextWillHandleUserAction:(int64_t)a3
{
  v4 = self;
  sub_21BC5BFF4(a3);
}

- (void)willMoveToContext:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_21BC5C9D8(a3);
  swift_unknownObjectRelease();
}

- (PlayerViewControllerBehavior)init
{
}

- (void).cxx_destruct
{
  sub_21BC332AC((uint64_t)self + OBJC_IVAR___PlayerViewControllerBehavior_delegate);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PlayerViewControllerBehavior_reporter;

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
}

@end