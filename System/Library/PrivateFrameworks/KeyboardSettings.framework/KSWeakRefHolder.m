@interface KSWeakRefHolder
+ (id)weakRefHolderWithObject:(id)a3;
- (KSWeakRefHolder)initWithObject:(id)a3;
- (id)strongRef;
- (id)weakObject;
- (void)setWeakObject:(id)a3;
@end

@implementation KSWeakRefHolder

- (KSWeakRefHolder)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KSWeakRefHolder;
  v5 = [(KSWeakRefHolder *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_weakObject, v4);
  }

  return v6;
}

+ (id)weakRefHolderWithObject:(id)a3
{
  id v3 = a3;
  id v4 = [[KSWeakRefHolder alloc] initWithObject:v3];

  return v4;
}

- (id)strongRef
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  return WeakRetained;
}

- (id)weakObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObject);
  return WeakRetained;
}

- (void)setWeakObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end