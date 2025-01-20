@interface OS_geom_collection_i
+ (id)new;
- (OS_geom_collection_i)init;
- (void)dealloc;
@end

@implementation OS_geom_collection_i

- (OS_geom_collection_i)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (void)dealloc
{
  isa = self[2].super.isa;
  if (isa)
  {
    self[3].super.isa = isa;
    operator delete(isa);
  }
  v4.receiver = self;
  v4.super_class = (Class)OS_geom_collection_i;
  [(OS_geom_collection_i *)&v4 dealloc];
}

@end