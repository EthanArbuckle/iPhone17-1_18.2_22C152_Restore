@interface AegirEditingCoordinator
- (void)pulseAnimationDidFinish;
- (void)styleAnimationDidFinish;
@end

@implementation AegirEditingCoordinator

- (void)styleAnimationDidFinish
{
  v2 = *(void **)self->vistaController;
  if (v2)
  {
    swift_retain();
    id v3 = v2;
    if ([v3 mode] != (id)1) {
      [v3 applyMode:1];
    }
    swift_release();
  }
}

- (void)pulseAnimationDidFinish
{
  self->locationPulseAnimating[0] = 0;
  swift_retain();
  sub_100029C58();

  swift_release();
}

@end