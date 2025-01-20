@interface MTLStructTypeInternal
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndirectArgumentBuffer;
- (BOOL)isStructLayoutThreadSafeWith:(id)a3;
- (MTLStructTypeInternal)init;
- (MTLStructTypeInternal)initWithMembers:(id *)a3 count:(unint64_t)a4;
- (MTLStructTypeInternal)initWithMembers:(id *)a3 count:(unint64_t)a4 typeName:(id)a5;
- (NSString)typeName;
- (id)description;
- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4;
- (id)memberByName:(id)a3;
- (id)members;
- (unint64_t)dataType;
- (void)dealloc;
- (void)setIsIndirectArgumentBuffer:(BOOL)a3;
- (void)setMembers:(id *)a3 count:(unint64_t)a4;
@end

@implementation MTLStructTypeInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLStructTypeInternal;
  [(MTLStructTypeInternal *)&v3 dealloc];
}

- (void)setIsIndirectArgumentBuffer:(BOOL)a3
{
  self->_isIndirectArgumentBuffer = a3;
}

- (MTLStructTypeInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLStructTypeInternal;
  result = [(MTLStructTypeInternal *)&v3 init];
  result->_dataType = 1;
  return result;
}

- (MTLStructTypeInternal)initWithMembers:(id *)a3 count:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)MTLStructTypeInternal;
  v6 = [(MTLStructTypeInternal *)&v18 init];
  v6->_dataType = 1;
  v6->_members = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a3 count:a4];
  v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  members = v6->_members;
  uint64_t v9 = [(NSArray *)members countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(members);
        }
        -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), [*(id *)(*((void *)&v14 + 1) + 8 * i) name]);
      }
      uint64_t v10 = [(NSArray *)members countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
  v6->_dictionary = v7;
  return v6;
}

- (void)setMembers:(id *)a3 count:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];

  self->_members = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a3 count:a4];
  v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  members = self->_members;
  uint64_t v9 = [(NSArray *)members countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(members);
        }
        -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), [*(id *)(*((void *)&v13 + 1) + 8 * i) name]);
      }
      uint64_t v10 = [(NSArray *)members countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  self->_dictionary = v7;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (id)members
{
  return self->_members;
}

- (BOOL)isIndirectArgumentBuffer
{
  return self->_isIndirectArgumentBuffer;
}

- (MTLStructTypeInternal)initWithMembers:(id *)a3 count:(unint64_t)a4 typeName:(id)a5
{
  v6 = [(MTLStructTypeInternal *)self initWithMembers:a3 count:a4];
  v6->_typeName = (NSString *)[a5 copy];
  return v6;
}

- (id)memberByName:(id)a3
{
  return [(NSDictionary *)self->_dictionary objectForKey:a3];
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3 + 4;
  uint64_t v7 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:128];
  v28[0] = v7;
  v28[1] = @"DataType =";
  v28[2] = MTLDataTypeString(self->_dataType);
  unint64_t v9 = 0x1E4F1C000uLL;
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 3));
  if ([a4 containsObject:self])
  {
    v27[0] = v7;
    v27[1] = @"<Recursive>";
    objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 2));
  }
  else
  {
    [a4 addObject:self];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v18 = self;
    obj = self->_members;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          unint64_t v15 = v9;
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v25[0] = v7;
          v25[1] = objc_msgSend(NSString, "stringWithFormat:", @"%u", v12 + i);
          v25[2] = [v16 formattedDescription:v6 withPrintedTypes:a4];
          unint64_t v9 = v15;
          objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(*(id *)(v15 + 2424), "arrayWithObjects:count:", v25, 3));
        }
        uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        uint64_t v12 = (v12 + i);
      }
      while (v11);
    }
    [a4 removeLastObject];
    self = v18;
  }
  v20.receiver = self;
  v20.super_class = (Class)MTLStructTypeInternal;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLStructTypeInternal description](&v20, sel_description), objc_msgSend(v8, "componentsJoinedByString:", @" "];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(MTLStructTypeInternal *)self formattedDescription:0 withPrintedTypes:v3];

  return v4;
}

- (BOOL)isStructLayoutThreadSafeWith:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 members];
  NSUInteger v5 = [(NSArray *)self->_members count];
  if (v5 == [v4 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = self->_members;
    uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v25;
      int v6 = 1;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v9 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            int v11 = 0;
            uint64_t v12 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v4);
                }
                long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                uint64_t v15 = [v14 offset];
                if (v15 == [v8 offset])
                {
                  v6 &= [v8 isMemberLayoutThreadSafeWith:v14];
                  int v11 = 1;
                }
              }
              uint64_t v10 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v10);
          }
          else
          {
            int v11 = 0;
          }
          v6 &= v11;
        }
        uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v19);
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6 & 1;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_dataType == *((void *)a3 + 1))
  {
    NSUInteger v5 = [(NSArray *)self->_members count];
    if (v5 == [*((id *)a3 + 3) count])
    {
      if (![(NSArray *)self->_members count]) {
        return self->_isIndirectArgumentBuffer == *((unsigned __int8 *)a3 + 32);
      }
      uint64_t v6 = 0;
      while ((objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_members, "objectAtIndexedSubscript:", v6), "isEqual:", objc_msgSend(*((id *)a3 + 3), "objectAtIndexedSubscript:", v6)) & 1) != 0)
      {
        if ([(NSArray *)self->_members count] <= ++v6) {
          return self->_isIndirectArgumentBuffer == *((unsigned __int8 *)a3 + 32);
        }
      }
    }
  }
  return 0;
}

- (NSString)typeName
{
  return self->_typeName;
}

@end