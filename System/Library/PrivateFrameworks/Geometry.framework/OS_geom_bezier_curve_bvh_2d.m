@interface OS_geom_bezier_curve_bvh_2d
+ (id)new;
- (OS_geom_bezier_curve_bvh_2d)init;
- (void)dealloc;
@end

@implementation OS_geom_bezier_curve_bvh_2d

- (OS_geom_bezier_curve_bvh_2d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom_bezier_curve_bvh_2d_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_bezier_curve_bvh_2d;
  [(OS_geom_bvh_2d *)&v3 dealloc];
}

@end