@interface OS_geom_arap_deformer_3d
+ (id)new;
- (OS_geom_arap_deformer_3d)init;
- (void)dealloc;
@end

@implementation OS_geom_arap_deformer_3d

- (OS_geom_arap_deformer_3d)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  geom::arap_deformer<float>::~arap_deformer((uint64_t)&self[2]);
  v3.receiver = self;
  v3.super_class = (Class)OS_geom_arap_deformer_3d;
  [(OS_geom_arap_deformer_3d *)&v3 dealloc];
}

@end