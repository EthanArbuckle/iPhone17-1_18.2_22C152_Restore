@interface NSSQLCompoundWhereIntermediate
- (BOOL)disambiguationKeypathHasToMany;
- (BOOL)isOrScoped;
- (NSSQLCompoundWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5;
- (id)disambiguatingEntity;
- (id)disambiguationKeypath;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5;
@end

@implementation NSSQLCompoundWhereIntermediate

- (id)disambiguatingEntity
{
  if (self->_disambiguatingEntity) {
    return self->_disambiguatingEntity;
  }
  else {
    return [(NSSQLIntermediate *)self->super.super._scope disambiguatingEntity];
  }
}

- (BOOL)isOrScoped
{
  if ([(NSPredicate *)self->super._predicate compoundPredicateType] == 2) {
    return 1;
  }
  scope = self->super.super._scope;

  return [(NSSQLIntermediate *)scope isOrScoped];
}

- (id)disambiguationKeypath
{
  if (self->_disambiguationKeypath) {
    return self->_disambiguationKeypath;
  }
  else {
    return [(NSSQLIntermediate *)self->super.super._scope disambiguationKeypath];
  }
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v7 = [(NSPredicate *)self->super._predicate compoundPredicateType];
  if ((unint64_t)(v7 - 1) < 2)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if ([(NSPredicate *)self->super._predicate compoundPredicateType] == 1) {
      v9 = @" AND ";
    }
    else {
      v9 = @" OR ";
    }
    objc_msgSend(v8, "appendString:", @"(");
    uint64_t v10 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", 0), "generateSQLStringInContext:", a3);
    if (v10)
    {
      v11 = (void *)v10;
      [v8 appendString:v10];

      unint64_t v12 = [(NSMutableArray *)self->_subclauses count];
      if (v12 < 2)
      {
LABEL_13:
        [v8 appendString:@""]);
LABEL_20:

        return v8;
      }
      unint64_t v13 = v12;
      uint64_t v14 = 1;
      while (1)
      {
        [v8 appendString:v9];
        uint64_t v15 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", v14), "generateSQLStringInContext:", a3);
        if (!v15) {
          break;
        }
        v16 = (void *)v15;
        [v8 appendString:v15];

        if (v13 == ++v14) {
          goto LABEL_13;
        }
      }
    }

    id v8 = 0;
    goto LABEL_20;
  }
  if (v7)
  {
    [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unknown compound predicate type %@", self->super._predicate), 0), @"NSUnderlyingException" forKey];
    goto LABEL_22;
  }
  objc_msgSend(v5, "appendString:", @" NOT (");
  uint64_t v17 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_subclauses, "objectAtIndex:", 0), "generateSQLStringInContext:", a3);
  if (!v17)
  {
LABEL_22:

    return 0;
  }
  v18 = (void *)v17;
  [v5 appendString:v17];
  [v5 appendString:@""]);

  if (v5) {
    return v5;
  }
  if (![a3 objectForKey:@"NSUnderlyingException"])
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = [NSString stringWithFormat:@"Unable to generate compound where clause for predicate (%@) (unknown problem)", self->super._predicate];
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", self->super._predicate, @"predicate")), @"NSUnderlyingException");
  }
  return 0;
}

- (NSSQLCompoundWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4 inContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NSSQLCompoundWhereIntermediate;
  v6 = [(NSSQLWhereIntermediate *)&v20 initWithPredicate:a3 inScope:a4];
  if (v6)
  {
    v6->_subclauses = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = (void *)[(NSPredicate *)v6->super._predicate subpredicates];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v13 = [[NSSQLSimpleWhereIntermediate alloc] initWithPredicate:v12 inScope:v6];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_15;
            }
            unint64_t v13 = [[NSSQLCompoundWhereIntermediate alloc] initWithPredicate:v12 inScope:v6 inContext:a5];
          }
          uint64_t v14 = v13;
          if (!v13)
          {
LABEL_15:
            if (![a5 objectForKey:@"NSUnderlyingException"]) {
              [a5 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Problem with subpredicate %@", v12), 0), @"NSUnderlyingException" forKey];
            }

            return 0;
          }
          [(NSMutableArray *)v6->_subclauses addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  return v6;
}

- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5
{
  self->_disambiguatingEntity = (NSSQLEntity *)a3;
  self->_disambiguationKeypath = (NSArray *)a4;
  self->_disambiguationKeypathHasToMany = a5;
}

- (void)dealloc
{
  self->_subclauses = 0;
  self->_disambiguationKeypath = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLCompoundWhereIntermediate;
  [(NSSQLCompoundWhereIntermediate *)&v3 dealloc];
}

- (BOOL)disambiguationKeypathHasToMany
{
  if (self->_disambiguationKeypath) {
    return self->_disambiguationKeypathHasToMany;
  }
  else {
    return [(NSSQLIntermediate *)self->super.super._scope disambiguationKeypathHasToMany];
  }
}

@end