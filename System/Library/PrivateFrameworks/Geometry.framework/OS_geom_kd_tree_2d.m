@interface OS_geom_kd_tree_2d
+ (id)new;
- (OS_geom_kd_tree_2d)init;
- (void)dealloc;
@end

@implementation OS_geom_kd_tree_2d

- (OS_geom_kd_tree_2d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  std::__destroy_at[abi:nn180100]<geom::kd_tree<double,(unsigned char)2>,0>((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_kd_tree_2d;
  [(OS_geom_kd_tree_2d *)&v3 dealloc];
}

@end