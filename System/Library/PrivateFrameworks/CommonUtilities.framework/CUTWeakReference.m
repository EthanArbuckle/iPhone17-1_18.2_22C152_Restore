@interface CUTWeakReference
+ (id)weakRefWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CUTWeakReference)initWithObject:(id)a3;
- (id)object;
- (unint64_t)hash;
- (unint64_t)objectAddress;
- (void)setObject:(id)a3;
- (void)setObjectAddress:(unint64_t)a3;
@end

@implementation CUTWeakReference

- (void).cxx_destruct
{
}

+ (id)weakRefWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return v5;
}

- (CUTWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CUTWeakReference;
  v5 = [(CUTWeakReference *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v6->_objectAddress = (unint64_t)v4;
  }

  return v6;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 objectAddress];
    BOOL v6 = v5 == [(CUTWeakReference *)self objectAddress];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setObject:(id)a3
{
}

- (unint64_t)objectAddress
{
  return self->_objectAddress;
}

- (void)setObjectAddress:(unint64_t)a3
{
  self->_objectAddress = a3;
}

@end