@interface IKWeakHandle
- (IKWeakHandle)initWithGetter:(id)a3;
- (id)object;
@end

@implementation IKWeakHandle

- (IKWeakHandle)initWithGetter:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKWeakHandle;
  v5 = [(IKWeakHandle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id getter = v5->_getter;
    v5->_id getter = (id)v6;
  }
  return v5;
}

- (id)object
{
  p_object = &self->_object;
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  if (!WeakRetained)
  {
    v5 = (*((void (**)(void))self->_getter + 2))();
    objc_storeWeak(p_object, v5);
  }
  id v6 = objc_loadWeakRetained(p_object);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getter, 0);
  objc_destroyWeak(&self->_object);
}

@end