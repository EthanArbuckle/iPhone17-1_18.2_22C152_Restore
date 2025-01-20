@interface _CNFlatMapEnumerator
- (_CNFlatMapEnumerator)initWithEnumerator:(id)a3 transform:(id)a4;
- (id)nextBufferedObject;
- (id)nextObject;
- (void)refillBuffer;
@end

@implementation _CNFlatMapEnumerator

- (_CNFlatMapEnumerator)initWithEnumerator:(id)a3 transform:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNFlatMapEnumerator;
  v9 = [(_CNFlatMapEnumerator *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    uint64_t v11 = [v8 copy];
    id transform = v10->_transform;
    v10->_id transform = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (id)nextObject
{
  if (self->_buffer) {
    goto LABEL_3;
  }
  while (1)
  {
    [(_CNFlatMapEnumerator *)self refillBuffer];
LABEL_3:
    v3 = [(_CNFlatMapEnumerator *)self nextBufferedObject];
    if (v3) {
      break;
    }
    if (!self->_buffer)
    {
      v3 = 0;
      break;
    }
  }

  return v3;
}

- (id)nextBufferedObject
{
  return [(NSEnumerator *)self->_buffer nextObject];
}

- (void)refillBuffer
{
  id v5 = [(NSEnumerator *)self->_enumerator nextObject];
  if (v5)
  {
    (*((void (**)(void))self->_transform + 2))();
    v3 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    buffer = self->_buffer;
    self->_buffer = v3;
  }
  else
  {
    buffer = self->_buffer;
    self->_buffer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong(&self->_transform, 0);

  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end