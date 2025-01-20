@interface OS_geom_exact_winding_number_3f
+ (id)new;
- (OS_geom_exact_winding_number_3f)init;
- (void)dealloc;
@end

@implementation OS_geom_exact_winding_number_3f

- (OS_geom_exact_winding_number_3f)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom_exact_winding_number_3f_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_exact_winding_number_3f;
  [(OS_geom_exact_winding_number_3f *)&v3 dealloc];
}

@end