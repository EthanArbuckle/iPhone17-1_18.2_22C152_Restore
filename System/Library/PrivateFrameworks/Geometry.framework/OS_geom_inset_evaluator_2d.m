@interface OS_geom_inset_evaluator_2d
+ (id)new;
- (OS_geom_inset_evaluator_2d)init;
- (void)dealloc;
@end

@implementation OS_geom_inset_evaluator_2d

- (OS_geom_inset_evaluator_2d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom::straight_skeleton_evaluator<double>::~straight_skeleton_evaluator((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_inset_evaluator_2d;
  [(OS_geom_inset_evaluator_2d *)&v3 dealloc];
}

@end