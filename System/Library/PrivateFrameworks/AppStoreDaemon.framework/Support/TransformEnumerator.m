@interface TransformEnumerator
- (id)nextObject;
@end

@implementation TransformEnumerator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (id)nextObject
{
  Property = [(NSEnumerator *)self->_enumerator nextObject];
  v4 = Property;
  v5 = 0;
  if (Property)
  {
    while (1)
    {
      v6 = v5;
      (*((void (**)(void))self->_transform + 2))();
      v5 = (unsigned char *)objc_claimAutoreleasedReturnValue();

      if (!v5) {
        break;
      }
      char v8 = v5[8];
      if ((v8 & 1) == 0)
      {
        uint64_t v10 = [(NSEnumerator *)self->_enumerator nextObject];

        v4 = (void *)v10;
        if (v10) {
          continue;
        }
      }
      Property = objc_getProperty(v5, v9, 16, 1);
      goto LABEL_7;
    }
    Property = 0;
  }
LABEL_7:
  id v11 = Property;

  return v11;
}

@end