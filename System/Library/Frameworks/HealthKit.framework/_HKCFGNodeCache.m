@interface _HKCFGNodeCache
- (_HKCFGNodeCache)init;
- (id)nodesForPosition:(unint64_t)a3 nonTerminal:(id)a4 withLengthAllowance:(unint64_t)a5;
- (void)cacheNodes:(id)a3 forPosition:(unint64_t)a4 nonTerminal:(id)a5 lengthAllowance:(unint64_t)a6;
@end

@implementation _HKCFGNodeCache

- (_HKCFGNodeCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HKCFGNodeCache;
  v2 = [(_HKCFGNodeCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)nodesForPosition:(unint64_t)a3 nonTerminal:(id)a4 withLengthAllowance:(unint64_t)a5
{
  id v8 = a4;
  cache = self->_cache;
  v10 = [NSNumber numberWithUnsignedInteger:a3];
  v11 = [(NSMutableDictionary *)cache objectForKey:v10];

  if (v11)
  {
    v12 = [v11 objectForKey:v8];
    v13 = v12;
    if (v12
      && ([v12 objectForKey:@"allowance"],
          v14 = objc_claimAutoreleasedReturnValue(),
          unint64_t v15 = [v14 unsignedIntegerValue],
          v14,
          v15 >= a5))
    {
      v16 = [v13 objectForKey:@"nodes"];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)cacheNodes:(id)a3 forPosition:(unint64_t)a4 nonTerminal:(id)a5 lengthAllowance:(unint64_t)a6
{
  id v23 = a5;
  cache = self->_cache;
  v12 = NSNumber;
  id v13 = a3;
  v14 = [v12 numberWithUnsignedInteger:a4];
  unint64_t v15 = [(NSMutableDictionary *)cache objectForKey:v14];

  if (!v15)
  {
    unint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v16 = self->_cache;
    v17 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v16 setObject:v15 forKey:v17];
  }
  v18 = [v15 objectForKey:v23];
  if (!v18)
  {
    v18 = [MEMORY[0x1E4F1CA60] dictionary];
    [v15 setObject:v18 forKey:v23];
  }
  v19 = [v18 objectForKey:@"allowance"];
  unint64_t v20 = [v19 unsignedIntegerValue];

  if (v20 > a6)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"_HKContextFreeGrammar.m" lineNumber:182 description:@"Attempt to cache nodes with length allowance < cached length allowance"];
  }
  v21 = [NSNumber numberWithUnsignedInteger:a6];
  [v18 setObject:v21 forKey:@"allowance"];

  [v18 setObject:v13 forKey:@"nodes"];
}

- (void).cxx_destruct
{
}

@end