@interface PlatformDisplayLink.DisplayLinkTarget
- (void)frame:(id)a3;
@end

@implementation PlatformDisplayLink.DisplayLinkTarget

- (void)frame:(id)a3
{
  id v4 = a3;
  swift_retain();
  [v4 timestamp];
  double v6 = v5;
  [v4 duration];
  v8 = *(void (**)(uint64_t, double, double))self->callback;
  if (v8)
  {
    double v9 = v7;
    uint64_t v10 = swift_retain();
    v8(v10, v6, v9);
    sub_10000E8EC((uint64_t)v8);
  }

  swift_release();
}

@end