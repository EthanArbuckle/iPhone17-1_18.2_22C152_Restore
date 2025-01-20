@interface CNDispatchSource
- (CNDispatchSource)initWithSource:(id)a3;
- (id)source;
- (void)cancel;
@end

@implementation CNDispatchSource

- (CNDispatchSource)initWithSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNDispatchSource;
  v6 = [(CNDispatchSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v8 = v7;
  }

  return v7;
}

- (id)source
{
  return self->_source;
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end