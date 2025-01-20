@interface QIDCategoryProviderImpl
- (QIDCategoryProviderImpl)initWithTreasureMap:(id)a3;
- (id)categoryIdsForQIDWithNSString:(id)a3;
@end

@implementation QIDCategoryProviderImpl

- (QIDCategoryProviderImpl)initWithTreasureMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QIDCategoryProviderImpl;
  v6 = [(QIDCategoryProviderImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tsm, a3);
  }

  return v7;
}

- (id)categoryIdsForQIDWithNSString:(id)a3
{
  v3 = [(KeylessMap *)self->_tsm objectsForKey:a3];
  if (v3)
  {
    v4 = -[JavaUtilArrayList initWithInt:]([JavaUtilArrayList alloc], "initWithInt:", [v3 count]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          -[JavaUtilArrayList addWithId:](v4, "addWithId:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end