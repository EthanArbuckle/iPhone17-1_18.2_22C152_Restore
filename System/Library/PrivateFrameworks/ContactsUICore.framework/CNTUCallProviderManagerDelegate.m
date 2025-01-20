@interface CNTUCallProviderManagerDelegate
- (CNTUCallProviderManagerDelegate)initWithBlock:(id)a3;
- (id)block;
- (void)providersChangedForProviderManager:(id)a3;
@end

@implementation CNTUCallProviderManagerDelegate

- (CNTUCallProviderManagerDelegate)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTUCallProviderManagerDelegate;
  v5 = [(CNTUCallProviderManagerDelegate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  v5 = [(CNTUCallProviderManagerDelegate *)self block];
  v5[2](v5, v4);
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
}

@end