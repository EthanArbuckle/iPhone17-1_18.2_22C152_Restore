@interface _MFResultsGenerator
- (_MFResultsGenerator)init;
- (_MFResultsGenerator)initWithKeys:(id)a3;
- (id)blockForKey:(id)a3;
- (id)copyResults;
- (id)keys;
- (id)results;
- (id)valueForKey:(id)a3;
@end

@implementation _MFResultsGenerator

- (_MFResultsGenerator)init
{
  return 0;
}

- (_MFResultsGenerator)initWithKeys:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MFResultsGenerator;
  v5 = [(_MFResultsGenerator *)&v10 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    resultKeys = v5->_resultKeys;
    v5->_resultKeys = v6;

    v8 = v5;
  }

  return v5;
}

- (id)keys
{
  return self->_resultKeys;
}

- (id)blockForKey:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[_MFResultsGenerator blockForKey:]", "_MFResultsGenerator.m", 40, "0 && \"subclass must implement\"");
}

- (id)copyResults
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_resultKeys, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_resultKeys;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = -[_MFResultsGenerator blockForKey:](self, "blockForKey:", v9, (void)v14);
        v11 = (void *)v10;
        if (v10)
        {
          v12 = (*(void (**)(uint64_t, _MFResultsGenerator *, uint64_t))(v10 + 16))(v10, self, v9);
          if (v12) {
            [v3 setObject:v12 forKeyedSubscript:v9];
          }
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)results
{
  id v2 = [(_MFResultsGenerator *)self copyResults];

  return v2;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_MFResultsGenerator *)self blockForKey:v4];
  id v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = (*(void (**)(uint64_t, _MFResultsGenerator *, id))(v5 + 16))(v5, self, v4);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end