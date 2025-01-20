@interface OS_geom_interpolating_curve_1d
+ (id)new;
- (OS_geom_interpolating_curve_1d)init;
- (void)dealloc;
@end

@implementation OS_geom_interpolating_curve_1d

- (OS_geom_interpolating_curve_1d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom::interpolating_curve<double>::~interpolating_curve((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_interpolating_curve_1d;
  [(OS_geom_interpolating_curve_1d *)&v3 dealloc];
}

@end