@interface OS_geom_inset_evaluator_2f
+ (id)new;
- (OS_geom_inset_evaluator_2f)init;
- (void)dealloc;
@end

@implementation OS_geom_inset_evaluator_2f

- (OS_geom_inset_evaluator_2f)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom::straight_skeleton_evaluator<float>::~straight_skeleton_evaluator((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_inset_evaluator_2f;
  [(OS_geom_inset_evaluator_2f *)&v3 dealloc];
}

@end