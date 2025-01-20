@interface _Version
- (NSArray)components;
- (_Version)initWithString:(id)a3;
- (id)description;
- (int64_t)compareTo:(id)a3;
@end

@implementation _Version

- (id)description
{
  return self->_versionString;
}

- (_Version)initWithString:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_Version;
  v6 = [(_Version *)&v22 init];
  if (v6)
  {
    v7 = [v5 componentsSeparatedByString:@"."];
    v8 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v13), "integerValue", (void)v18));
          [(NSArray *)v8 addObject:v14];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    components = v6->_components;
    v6->_components = v8;
    v16 = v8;

    objc_storeStrong((id *)&v6->_versionString, a3);
  }

  return v6;
}

- (int64_t)compareTo:(id)a3
{
  id v4 = a3;
  id v5 = [(_Version *)self components];
  uint64_t v6 = (uint64_t)[v5 count];

  int64_t v7 = [v4 components];
  id v8 = [(id)v7 count];

  if ((unint64_t)v8 > v6)
  {
    int64_t v7 = [v4 components];
    uint64_t v6 = (uint64_t)[(id)v7 count];
  }
  if (v6 < 1)
  {
LABEL_19:
    int64_t v7 = 0;
  }
  else
  {
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = [(_Version *)self components];
      id v11 = [v10 count];

      if ((unint64_t)v11 <= v9)
      {
        id v14 = 0;
      }
      else
      {
        uint64_t v12 = [(_Version *)self components];
        v13 = [v12 objectAtIndexedSubscript:v9];
        id v14 = [v13 integerValue];
      }
      v15 = [v4 components];
      id v16 = [v15 count];

      if ((unint64_t)v16 <= v9)
      {
        id v19 = 0;
      }
      else
      {
        v17 = [v4 components];
        long long v18 = [v17 objectAtIndexedSubscript:v9];
        id v19 = [v18 integerValue];
      }
      uint64_t v20 = (uint64_t)v14 < (uint64_t)v19 ? -1 : v7;
      int64_t v7 = (uint64_t)v14 > (uint64_t)v19 ? 1 : v20;
      if (v14 != v19) {
        break;
      }
      if (v6 == ++v9) {
        goto LABEL_19;
      }
    }
  }

  return v7;
}

- (NSArray)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end