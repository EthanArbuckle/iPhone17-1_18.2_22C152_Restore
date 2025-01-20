@interface OS_geom_approximate_winding_number_3d
+ (id)new;
- (OS_geom_approximate_winding_number_3d)init;
- (void)dealloc;
@end

@implementation OS_geom_approximate_winding_number_3d

- (OS_geom_approximate_winding_number_3d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom_approximate_winding_number_3d_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_approximate_winding_number_3d;
  [(OS_geom_approximate_winding_number_3d *)&v3 dealloc];
}

@end