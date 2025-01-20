@interface _SYWeakServiceDBRef
- (NSString)name;
- (_SYSharedServiceDB)db;
- (_SYWeakServiceDBRef)initWithServiceName:(id)a3;
- (void)setDb:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _SYWeakServiceDBRef

- (_SYWeakServiceDBRef)initWithServiceName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SYWeakServiceDBRef;
  v5 = [(_SYWeakServiceDBRef *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (_SYSharedServiceDB)db
{
  p_db = &self->_db;
  WeakRetained = (_SYSharedServiceDB *)objc_loadWeakRetained((id *)&self->_db);
  if (!WeakRetained)
  {
    v5 = [_SYSharedServiceDB alloc];
    uint64_t v6 = [(_SYWeakServiceDBRef *)self name];
    WeakRetained = [(_SYSharedServiceDB *)v5 initWithServiceName:v6];

    objc_storeWeak((id *)p_db, WeakRetained);
  }
  return WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setDb:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_db);
  objc_storeStrong((id *)&self->_name, 0);
}

@end