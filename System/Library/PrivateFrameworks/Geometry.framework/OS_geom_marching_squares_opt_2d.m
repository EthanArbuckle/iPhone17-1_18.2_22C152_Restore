@interface OS_geom_marching_squares_opt_2d
+ (id)new;
- (OS_geom_marching_squares_opt_2d)init;
- (void)dealloc;
@end

@implementation OS_geom_marching_squares_opt_2d

- (OS_geom_marching_squares_opt_2d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)OS_geom_marching_squares_opt_2d;
  [(OS_geom_marching_squares_opt_2d *)&v2 dealloc];
}

@end