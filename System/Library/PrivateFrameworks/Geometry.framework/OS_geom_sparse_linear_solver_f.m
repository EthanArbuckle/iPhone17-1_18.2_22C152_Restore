@interface OS_geom_sparse_linear_solver_f
+ (id)new;
- (OS_geom_sparse_linear_solver_f)init;
- (void)dealloc;
@end

@implementation OS_geom_sparse_linear_solver_f

- (OS_geom_sparse_linear_solver_f)init
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
  v3.super_class = (Class)OS_geom_sparse_linear_solver_f;
  [(OS_geom_sparse_linear_solver_f *)&v3 dealloc];
}

@end