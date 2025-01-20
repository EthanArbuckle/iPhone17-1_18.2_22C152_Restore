@interface IMWeakReference
+ (id)weakRefWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)copyObject;
- (id)initRefWithObject:(id)a3;
- (id)object;
- (unint64_t)hash;
@end

@implementation IMWeakReference

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[2] == self->_objectAddress;

  return v5;
}

- (id)copyObject
{
  return objc_loadWeakRetained(&self->_object);
}

- (id)initRefWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMWeakReference;
  BOOL v5 = [(IMWeakReference *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v6->_objectAddress = (unint64_t)v4;
  }

  return v6;
}

+ (id)weakRefWithObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v5 + 1, v4);

  v5[2] = v4;
  return v5;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end