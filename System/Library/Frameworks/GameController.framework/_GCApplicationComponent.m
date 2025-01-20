@interface _GCApplicationComponent
- (_GCApplicationComponent)init;
- (id)_init;
@end

@implementation _GCApplicationComponent

- (id)_init
{
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)_GCApplicationComponent;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (_GCApplicationComponent)init
{
  return 0;
}

@end