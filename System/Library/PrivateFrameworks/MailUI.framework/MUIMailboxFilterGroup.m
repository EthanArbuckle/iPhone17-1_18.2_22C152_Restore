@interface MUIMailboxFilterGroup
+ (id)groupWithName:(id)a3 combinator:(int64_t)a4 selectionCardinality:(int64_t)a5 filters:(id)a6;
- (BOOL)isEqual:(id)a3;
- (MUIMailboxFilterGroup)initWithName:(id)a3 combinator:(int64_t)a4 selectionCardinality:(int64_t)a5 filters:(id)a6;
- (NSArray)filters;
- (NSString)name;
- (int64_t)combinator;
- (int64_t)selectionCardinality;
- (unint64_t)hash;
@end

@implementation MUIMailboxFilterGroup

- (MUIMailboxFilterGroup)initWithName:(id)a3 combinator:(int64_t)a4 selectionCardinality:(int64_t)a5 filters:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MUIMailboxFilterGroup.m", 20, @"Invalid parameter not satisfying: %@", @"filters" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)MUIMailboxFilterGroup;
  v13 = [(MUIMailboxFilterGroup *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [v12 copy];
    filters = v13->_filters;
    v13->_filters = (NSArray *)v16;

    v13->_combinator = a4;
    v13->_selectionCardinality = a5;
  }

  return v13;
}

+ (id)groupWithName:(id)a3 combinator:(int64_t)a4 selectionCardinality:(int64_t)a5 filters:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)a1) initWithName:v11 combinator:a4 selectionCardinality:a5 filters:v10];

  return v12;
}

- (unint64_t)hash
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(MUIMailboxFilterGroup *)self filters];
  v4 = objc_msgSend(v3, "ef_prefix:", 3);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 ^= [*(id *)(*((void *)&v15 + 1) + 8 * i) hash];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v10 = [(MUIMailboxFilterGroup *)self name];
  uint64_t v11 = [v10 hash];
  int64_t v12 = [(MUIMailboxFilterGroup *)self combinator];
  int64_t v13 = [(MUIMailboxFilterGroup *)self selectionCardinality];

  return v11 ^ v7 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (MUIMailboxFilterGroup *)a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (self == v5)
    {
      BOOL v16 = 1;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      uint64_t v8 = [(MUIMailboxFilterGroup *)self name];
      if (!v8)
      {
        v3 = [(MUIMailboxFilterGroup *)v7 name];
        if (!v3) {
          goto LABEL_8;
        }
      }
      v9 = [(MUIMailboxFilterGroup *)self name];
      id v10 = [(MUIMailboxFilterGroup *)v7 name];
      int v11 = [v9 isEqualToString:v10];

      if (v8)
      {

        if (v11) {
          goto LABEL_8;
        }
      }
      else
      {

        if (v11)
        {
LABEL_8:
          int64_t v12 = [(MUIMailboxFilterGroup *)self filters];
          int64_t v13 = [(MUIMailboxFilterGroup *)v7 filters];
          if ([v12 isEqual:v13]
            && (int64_t v14 = [(MUIMailboxFilterGroup *)self combinator],
                v14 == [(MUIMailboxFilterGroup *)v7 combinator]))
          {
            int64_t v15 = [(MUIMailboxFilterGroup *)self selectionCardinality];
            BOOL v16 = v15 == [(MUIMailboxFilterGroup *)v7 selectionCardinality];
          }
          else
          {
            BOOL v16 = 0;
          }

          goto LABEL_17;
        }
      }
      BOOL v16 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  BOOL v16 = 0;
LABEL_18:

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)filters
{
  return self->_filters;
}

- (int64_t)combinator
{
  return self->_combinator;
}

- (int64_t)selectionCardinality
{
  return self->_selectionCardinality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end