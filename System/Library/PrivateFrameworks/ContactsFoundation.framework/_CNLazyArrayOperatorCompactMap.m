@interface _CNLazyArrayOperatorCompactMap
- (_CNLazyArrayOperatorCompactMap)initWithInput:(id)a3 transform:(id)a4;
- (id)nextObject;
@end

@implementation _CNLazyArrayOperatorCompactMap

- (_CNLazyArrayOperatorCompactMap)initWithInput:(id)a3 transform:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNLazyArrayOperatorCompactMap;
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
  while (1)
  {
    v3 = [(_CNLazyArrayOperator *)self input];
    v4 = [v3 nextObject];

    if (!v4) {
      break;
    }
    v5 = (*((void (**)(void))self->_transform + 2))();

    if (v5) {
      goto LABEL_5;
    }
  }
  v5 = 0;
LABEL_5:

  return v5;
}

- (void).cxx_destruct
{
}

@end