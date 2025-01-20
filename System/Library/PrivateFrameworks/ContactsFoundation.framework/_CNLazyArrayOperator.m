@interface _CNLazyArrayOperator
- (_CNLazyArrayOperation)input;
- (_CNLazyArrayOperator)initWithInput:(id)a3;
- (id)nextObject;
@end

@implementation _CNLazyArrayOperator

- (_CNLazyArrayOperator)initWithInput:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNLazyArrayOperator;
  v6 = [(_CNLazyArrayOperator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_input, a3);
    v8 = v7;
  }

  return v7;
}

- (id)nextObject
{
  CNAbstractMethodException(self, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_CNLazyArrayOperation)input
{
  return (_CNLazyArrayOperation *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end