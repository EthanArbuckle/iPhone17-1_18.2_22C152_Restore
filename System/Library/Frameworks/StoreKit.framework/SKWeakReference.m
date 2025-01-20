@interface SKWeakReference
- (BOOL)isEqual:(id)a3;
- (SKWeakReference)initWithObject:(id)a3;
- (id)object;
- (unint64_t)hash;
- (void)setObject:(id)a3;
@end

@implementation SKWeakReference

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (SKWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKWeakReference;
  v5 = [(SKWeakReference *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SKWeakReference *)v5 setObject:v4];
  }

  return v6;
}

- (void)setObject:(id)a3
{
}

- (unint64_t)hash
{
  v2 = [(SKWeakReference *)self object];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 object];
    v6 = [(SKWeakReference *)self object];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end