@interface FPInFlightDrawableLifetime
- (void)dealloc;
@end

@implementation FPInFlightDrawableLifetime

- (void).cxx_destruct
{
}

- (void)dealloc
{
  atomic_fetch_add(&gFPInFlightDrawableLifetimeCount, 0xFFFFFFFFFFFFFFFFLL);
  v2.receiver = self;
  v2.super_class = (Class)FPInFlightDrawableLifetime;
  [(FPInFlightDrawableLifetime *)&v2 dealloc];
}

@end