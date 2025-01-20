@interface NSSQLFetchCountIntermediate
- (id)generateSQLStringInContext:(id)a3;
@end

@implementation NSSQLFetchCountIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  if ((unint64_t)(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"storeRequest"), "fetchLimit")
                        - 10001) > 0xFFFFFFFFFFFFD8EFLL)
  {
    v15 = objc_alloc_init(NSSQLColumn);
    -[NSSQLColumn _setColumnName:]((uint64_t)v15, @"Z_PK");
    if (v15) {
      *(_WORD *)&v15->super._flags |= 1u;
    }
    v21.receiver = self;
    v21.super_class = (Class)NSSQLFetchCountIntermediate;
    v16 = [(NSSQLFetchIntermediate *)&v21 selectIntermediate];
    if (v16) {
      v16[48] = 1;
    }
    v20.receiver = self;
    v20.super_class = (Class)NSSQLFetchCountIntermediate;
    id v17 = [(NSSQLFetchIntermediate *)&v20 selectIntermediate];
    -[NSSQLSelectIntermediate setFetchColumns:]((uint64_t)v17, (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v15]);

    v19.receiver = self;
    v19.super_class = (Class)NSSQLFetchCountIntermediate;
    id v18 = [(NSSQLFetchIntermediate *)&v19 generateSQLStringInContext:a3];
    if (![a3 objectForKey:@"NSUnderlyingException"])
    {
      id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"SELECT COUNT(*) FROM (");
      [v5 appendString:v18];
      [v5 appendString:@""]);

      return v5;
    }

    return 0;
  }
  -[NSSQLStatementIntermediate setLimitIntermediate:]((uint64_t)self, 0);
  v7 = objc_alloc_init(NSSQLColumn);
  -[NSSQLColumn _setColumnName:]((uint64_t)v7, @"Z_PK");
  if (v7) {
    *(_WORD *)&v7->super._flags |= 1u;
  }
  id v8 = [(NSSQLFetchIntermediate *)self selectIntermediate];
  -[NSSQLSelectIntermediate setFetchColumns:]((uint64_t)v8, (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v7]);

  v9 = [(NSSQLFetchIntermediate *)self selectIntermediate];
  if (v9) {
    v9[48] = 1;
  }
  v10 = [(NSSQLFetchIntermediate *)self selectIntermediate];
  if (v10) {
    v10[64] = 1;
  }
  v22.receiver = self;
  v22.super_class = (Class)NSSQLFetchCountIntermediate;
  id v5 = [(NSSQLFetchIntermediate *)&v22 generateSQLStringInContext:a3];
  v11 = (void *)[v5 componentsSeparatedByString:@" "];
  if ((unint64_t)[v11 count] >= 6
    && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "isEqualToString:", @"SELECT")
    && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "isEqualToString:", @"COUNT("))
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "isEqualToString:", @"DISTINCT")? 3: 2;
    if ([(id)objc_msgSend(v11 objectAtIndex:v12), "isEqualToString:", @"t0.Z_PK"]))
    {
      if (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v12 + 1), "isEqualToString:", @"FROM"))
      {
        uint64_t v13 = [v11 objectAtIndex:v12 + 2];
        if (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v12 + 3), "isEqualToString:", @"t0"))
        {
          unint64_t v14 = v12 | 4;
          if (v14 >= [v11 count])
          {
LABEL_23:

            return (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT COUNT(*) FROM %@", v13];
          }
          else
          {
            while ((objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v14), "isEqualToString:", &stru_1ED787880) & 1) != 0)
            {
              if (++v14 >= [v11 count]) {
                goto LABEL_23;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

@end