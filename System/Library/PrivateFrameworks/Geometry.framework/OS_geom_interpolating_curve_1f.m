@interface OS_geom_interpolating_curve_1f
+ (id)new;
- (OS_geom_interpolating_curve_1f)init;
- (void)dealloc;
@end

@implementation OS_geom_interpolating_curve_1f

- (OS_geom_interpolating_curve_1f)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom::interpolating_curve<float>::~interpolating_curve((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_interpolating_curve_1f;
  [(OS_geom_interpolating_curve_1f *)&v3 dealloc];
}

@end