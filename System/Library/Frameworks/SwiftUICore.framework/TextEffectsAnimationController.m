@interface TextEffectsAnimationController
- (void)displayLink:(id)a3;
@end

@implementation TextEffectsAnimationController

- (void)displayLink:(id)a3
{
  id v3 = a3;
  swift_retain();
  objc_msgSend(v3, sel_targetTimestamp);
  uint64_t v5 = v4;
  TextEffectsAnimationController.displayLinkUpdate(at:removeFinished:)(&v5, 1);

  swift_release();
}

@end