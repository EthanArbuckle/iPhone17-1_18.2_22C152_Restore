@interface MTLLinkedFunctions
+ (MTLLinkedFunctions)allocWithZone:(_NSZone *)a3;
+ (MTLLinkedFunctions)linkedFunctions;
- (NSArray)privateFunctions;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPrivateFunctions:(NSArray *)privateFunctions;
@end

@implementation MTLLinkedFunctions

+ (MTLLinkedFunctions)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLLinkedFunctions *)+[MTLLinkedFunctionsInternal allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLLinkedFunctions;
    return (MTLLinkedFunctions *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLLinkedFunctions)linkedFunctions
{
  v2 = objc_alloc_init(MTLLinkedFunctionsInternal);

  return (MTLLinkedFunctions *)v2;
}

- (NSArray)privateFunctions
{
  return self->_privateFunctions;
}

- (void)setPrivateFunctions:(NSArray *)privateFunctions
{
}

@end