@interface IKCSSMediaQueryOrList
- (BOOL)evaluate;
- (IKCSSMediaQueryOrList)init;
- (id)description;
- (id)expressionAsString;
- (id)subQueryAtIndex:(unint64_t)a3;
- (id)subQueryList;
- (unint64_t)count;
- (void)addSubQueryList:(id)a3;
@end

@implementation IKCSSMediaQueryOrList

- (IKCSSMediaQueryOrList)init
{
  v6.receiver = self;
  v6.super_class = (Class)IKCSSMediaQueryOrList;
  v2 = [(IKCSSMediaQueryOrList *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[IKArray array];
    queryList = v2->_queryList;
    v2->_queryList = (IKMutableArray *)v3;
  }
  return v2;
}

- (id)expressionAsString
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_queryList;
  uint64_t v5 = [(IKArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) expressionAsString];
        v11 = (void *)v10;
        if (v8) {
          v12 = @"%@";
        }
        else {
          v12 = @" or %@";
        }
        objc_msgSend(v3, "appendFormat:", v12, v10);

        char v8 = 0;
      }
      uint64_t v6 = [(IKArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      char v8 = 0;
    }
    while (v6);
  }

  return v3;
}

- (id)subQueryList
{
  return self->_queryList;
}

- (void)addSubQueryList:(id)a3
{
}

- (BOOL)evaluate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_queryList;
  uint64_t v3 = [(IKArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "evaluate", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(IKArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)subQueryAtIndex:(unint64_t)a3
{
  return [(IKArray *)self->_queryList objectAtIndex:a3];
}

- (unint64_t)count
{
  return [(IKArray *)self->_queryList count];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendString:", @"(");
  if ([(IKArray *)self->_queryList count])
  {
    uint64_t v4 = [(IKArray *)self->_queryList objectAtIndex:0];
    [v3 appendFormat:@"%@", v4];

    if ((unint64_t)[(IKArray *)self->_queryList count] >= 2)
    {
      unint64_t v5 = 1;
      do
      {
        uint64_t v6 = [(IKArray *)self->_queryList objectAtIndex:v5];
        [v3 appendFormat:@" || %@", v6];

        ++v5;
      }
      while (v5 < [(IKArray *)self->_queryList count]);
    }
  }
  [v3 appendString:@""]);
  return v3;
}

- (void).cxx_destruct
{
}

@end