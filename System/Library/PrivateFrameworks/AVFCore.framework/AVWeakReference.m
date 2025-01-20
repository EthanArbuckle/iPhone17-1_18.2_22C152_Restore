@interface AVWeakReference
+ (AVWeakReference)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (AVWeakReference)initWithReferencedObject:(id)a3;
- (id)referencedObject;
@end

@implementation AVWeakReference

+ (AVWeakReference)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    v6 = (void *)_concreteAVWeakReferenceClass;
    return (AVWeakReference *)[v6 allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___AVWeakReference;
    return (AVWeakReference *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    _concreteAVWeakReferenceClass = objc_opt_class();
  }
}

- (AVWeakReference)initWithReferencedObject:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);

  return 0;
}

- (id)referencedObject
{
  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end