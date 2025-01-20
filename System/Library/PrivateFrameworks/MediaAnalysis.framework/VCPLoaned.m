@interface VCPLoaned
- (VCPLoaned)initWithObject:(id)a3 fromPool:(id)a4;
- (id)object;
- (void)dealloc;
@end

@implementation VCPLoaned

- (VCPLoaned)initWithObject:(id)a3 fromPool:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPLoaned;
  v9 = [(VCPLoaned *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_object, a3);
    objc_storeWeak((id *)&v10->_pool, v8);
  }

  return v10;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pool);
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained returnObject:self->_object];
  }

  v5.receiver = self;
  v5.super_class = (Class)VCPLoaned;
  [(VCPLoaned *)&v5 dealloc];
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pool);
  objc_storeStrong(&self->_object, 0);
}

@end