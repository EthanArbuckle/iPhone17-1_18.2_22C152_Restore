@interface _CNLazyArrayOperatorMap
- (_CNLazyArrayOperatorMap)initWithInput:(id)a3 transform:(id)a4;
- (id)nextObject;
@end

@implementation _CNLazyArrayOperatorMap

- (_CNLazyArrayOperatorMap)initWithInput:(id)a3 transform:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNLazyArrayOperatorMap;
  v7 = [(_CNLazyArrayOperator *)&v12 initWithInput:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id transform = v7->_transform;
    v7->_id transform = (id)v8;

    v10 = v7;
  }

  return v7;
}

- (id)nextObject
{
  v3 = [(_CNLazyArrayOperator *)self input];
  v4 = [v3 nextObject];

  if (v4)
  {
    v5 = (*((void (**)(void))self->_transform + 2))();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end