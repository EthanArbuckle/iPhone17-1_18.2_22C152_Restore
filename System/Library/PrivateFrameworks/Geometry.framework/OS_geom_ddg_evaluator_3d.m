@interface OS_geom_ddg_evaluator_3d
+ (id)new;
- (OS_geom_ddg_evaluator_3d)init;
- (void)dealloc;
@end

@implementation OS_geom_ddg_evaluator_3d

- (OS_geom_ddg_evaluator_3d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  std::__destroy_at[abi:nn180100]<geom::ddg_evaluator<float>,0>((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_ddg_evaluator_3d;
  [(OS_geom_ddg_evaluator_3d *)&v3 dealloc];
}

@end