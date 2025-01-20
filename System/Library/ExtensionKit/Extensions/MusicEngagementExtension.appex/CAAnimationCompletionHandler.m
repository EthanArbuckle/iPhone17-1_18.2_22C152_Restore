@interface CAAnimationCompletionHandler
- (_TtC14MusicUtilities28CAAnimationCompletionHandler)init;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)displayLinkFiredWithDisplayLink:(id)a3;
@end

@implementation CAAnimationCompletionHandler

- (void)animationDidStart:(id)a3
{
  v4 = (objc_class *)a3;
  v7._id attr = self;
  id attr = v7._attr;
  v7.super.isa = v4;
  CAAnimationCompletionHandler.animationDidStart(_:)(v7);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  CAAnimation v7 = self;
  specialized CAAnimationCompletionHandler.animationDidStop(_:finished:)(a4);
}

- (void)displayLinkFiredWithDisplayLink:(id)a3
{
  id v4 = a3;
  v5 = self;
  CAAnimationCompletionHandler.displayLinkFired(displayLink:)(v4);
}

- (_TtC14MusicUtilities28CAAnimationCompletionHandler)init
{
  result = (_TtC14MusicUtilities28CAAnimationCompletionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_animating));
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_completion));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14MusicUtilities28CAAnimationCompletionHandler_displayLink);
}

@end