@interface OS_geom_sparse_linear_solver_d
+ (id)new;
- (OS_geom_sparse_linear_solver_d)init;
- (void)dealloc;
@end

@implementation OS_geom_sparse_linear_solver_d

- (OS_geom_sparse_linear_solver_d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  std::__destroy_at[abi:nn180100]<geom::sparse_linear_solver<float>,0>(&self[2].super.isa);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_sparse_linear_solver_d;
  [(OS_geom_sparse_linear_solver_d *)&v3 dealloc];
}

@end