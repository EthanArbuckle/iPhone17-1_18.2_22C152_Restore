@interface NSSQLGroupByIntermediate
- (NSSQLGroupByIntermediate)initWithProperties:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLGroupByIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSSQLIntermediate *)self isUpdateScoped])
  {
    [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported clause (group by not allowed in updates)", 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  else
  {
    id v5 = [(NSSQLIntermediate *)self fetchIntermediate];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obj = self->_properties;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v12 = -v9;
        uint64_t v19 = v8 + v9;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          if ([v13 _propertyType] == 5)
          {
            -[NSSQLFetchIntermediate addGroupByKeypath:]((uint64_t)v5, objc_msgSend((id)objc_msgSend(v13, "expression"), "predicateFormat"));
            v14 = (void *)[v13 expression];
          }
          else
          {
            uint64_t v15 = [v13 name];
            -[NSSQLFetchIntermediate addGroupByKeypath:]((uint64_t)v5, v15);
            v14 = (void *)[MEMORY[0x1E4F28C68] expressionForKeyPath:v15];
          }
          id v16 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v14, 0, a3);
          if (!v16)
          {
            if (![a3 valueForKey:@"NSUnderlyingException"]) {
              [a3 setValue:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Failed to generate SQL for group by property: %@", v13), 0), @"NSUnderlyingException" forKey];
            }

            return 0;
          }
          v17 = v16;
          if (v12 != v11) {
            [v6 appendString:@", "];
          }
          [v6 appendString:v17];

          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v9 = v19;
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  self->_properties = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLGroupByIntermediate;
  [(NSSQLGroupByIntermediate *)&v3 dealloc];
}

- (NSSQLGroupByIntermediate)initWithProperties:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSSQLGroupByIntermediate;
  id v5 = [(NSSQLIntermediate *)&v7 initWithScope:a4];
  if (v5) {
    v5->_properties = (NSArray *)[a3 copy];
  }
  return v5;
}

@end