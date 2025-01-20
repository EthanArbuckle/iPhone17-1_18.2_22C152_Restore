@interface FigWeakReference
+ (id)weakReferenceToObject:(id)a3;
- (FigWeakReference)initWithReferencedObject:(id)a3;
- (id)referencedObject;
- (id)retainReferencedObject;
- (void)dealloc;
@end

@implementation FigWeakReference

+ (id)weakReferenceToObject:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithReferencedObject:a3];
  return v3;
}

- (FigWeakReference)initWithReferencedObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigWeakReference;
  v4 = [(FigWeakReference *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      objc_storeWeak(&v4->_referencedObject, a3);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (id)retainReferencedObject
{
  return objc_loadWeakRetained(&self->_referencedObject);
}

- (void)dealloc
{
  objc_storeWeak(&self->_referencedObject, 0);
  v3.receiver = self;
  v3.super_class = (Class)FigWeakReference;
  [(FigWeakReference *)&v3 dealloc];
}

- (id)referencedObject
{
  return objc_loadWeak(&self->_referencedObject);
}

@end