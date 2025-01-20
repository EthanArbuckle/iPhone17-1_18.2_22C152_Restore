@interface IKCSSMediaQueryAndList
- (BOOL)evaluate;
- (BOOL)negated;
- (IKCSSMediaQueryAndList)init;
- (NSString)type;
- (id)description;
- (id)expressionAsString;
- (id)expressionList;
- (id)subQueryAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addQuery:(id)a3;
- (void)setNegated:(BOOL)a3;
- (void)setType:(id)a3;
@end

@implementation IKCSSMediaQueryAndList

- (IKCSSMediaQueryAndList)init
{
  v6.receiver = self;
  v6.super_class = (Class)IKCSSMediaQueryAndList;
  v2 = [(IKCSSMediaQueryAndList *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[IKArray array];
    queryList = v2->_queryList;
    v2->_queryList = (IKMutableArray *)v3;

    v2->_negated = 0;
  }
  return v2;
}

- (void)setType:(id)a3
{
  objc_msgSend(a3, "ik_sharedInstance");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v4;
  MEMORY[0x1F41817F8](v4, type);
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
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v8)
        {
          v11 = [(IKCSSMediaQueryAndList *)self type];
          v12 = [v10 expressionAsString];
          [v3 appendFormat:@"%@ and (%@)", v11, v12, (void)v14];
        }
        else
        {
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) expressionAsString];
          [v3 appendFormat:@" and (%@)", v11];
        }

        char v8 = 0;
      }
      uint64_t v6 = [(IKArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      char v8 = 0;
    }
    while (v6);
  }

  return v3;
}

- (void)addQuery:(id)a3
{
}

- (id)expressionList
{
  return self->_queryList;
}

- (BOOL)evaluate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[IKStyleMediaQuery alloc] initWithMediaType:self->_type featureValues:0 isNegated:0];
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = self->_queryList;
    uint64_t v5 = [(IKArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "evaluate", (void)v12))
          {
            char v9 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(IKArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    char v9 = 1;
LABEL_12:
  }
  else
  {
    char v9 = 0;
  }
  BOOL negated = self->_negated;

  return v9 ^ negated;
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
  v4 = v3;
  if (self->_negated) {
    [v3 appendString:@"!"];
  }
  objc_msgSend(v4, "appendFormat:", @"(type=%@, exprs=["), self->_type;
  if ([(IKArray *)self->_queryList count])
  {
    uint64_t v5 = [(IKArray *)self->_queryList objectAtIndex:0];
    [v4 appendFormat:@"%@", v5];

    if ((unint64_t)[(IKArray *)self->_queryList count] >= 2)
    {
      unint64_t v6 = 1;
      do
      {
        uint64_t v7 = [(IKArray *)self->_queryList objectAtIndex:v6];
        [v4 appendFormat:@" && %@", v7];

        ++v6;
      }
      while (v6 < [(IKArray *)self->_queryList count]);
    }
  }
  [v4 appendString:@"]"]);
  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)negated
{
  return self->_negated;
}

- (void)setNegated:(BOOL)a3
{
  self->_BOOL negated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_queryList, 0);
}

@end