@interface OS_geom_approximate_convex_decomposition_3f
+ (id)new;
- (OS_geom_approximate_convex_decomposition_3f)init;
- (void)dealloc;
@end

@implementation OS_geom_approximate_convex_decomposition_3f

- (OS_geom_approximate_convex_decomposition_3f)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom::acd<float>::~acd((uint64_t *)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_approximate_convex_decomposition_3f;
  [(OS_geom_approximate_convex_decomposition_3f *)&v3 dealloc];
}

@end