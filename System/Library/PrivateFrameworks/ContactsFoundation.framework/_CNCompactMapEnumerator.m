@interface _CNCompactMapEnumerator
- (_CNCompactMapEnumerator)initWithEnumerator:(id)a3 transform:(id)a4;
- (id)nextObject;
@end

@implementation _CNCompactMapEnumerator

- (_CNCompactMapEnumerator)initWithEnumerator:(id)a3 transform:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNCompactMapEnumerator;
  v9 = [(_CNCompactMapEnumerator *)&v15 init];
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_enumerator;
  uint64_t v4 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (*((void (**)(id))self->_transform + 2))(self->_transform);
        if (v8)
        {
          v9 = (void *)v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);

  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end