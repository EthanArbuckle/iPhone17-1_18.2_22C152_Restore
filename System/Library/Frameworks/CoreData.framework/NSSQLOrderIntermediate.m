@interface NSSQLOrderIntermediate
- (NSSQLOrderIntermediate)initWithSortDescriptors:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLOrderIntermediate

- (NSSQLOrderIntermediate)initWithSortDescriptors:(id)a3 inScope:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSSQLOrderIntermediate;
  v5 = [(NSSQLIntermediate *)&v7 initWithScope:a4];
  if (v5) {
    v5->_sortDescriptors = (NSArray *)a3;
  }
  return v5;
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  NSUInteger v47 = [(NSArray *)self->_sortDescriptors count];
  if (!v47)
  {
    v40 = (objc_class *)MEMORY[0x1E4F28E78];
    return objc_alloc_init(v40);
  }
  id v46 = a3;
  id v7 = [(NSSQLIntermediate *)self fetchIntermediate];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"ORDER BY"];
  uint64_t v8 = 0;
  v45 = self;
  uint64_t v44 = *MEMORY[0x1E4F1C3C8];
  while (1)
  {
    id v9 = [(NSArray *)self->_sortDescriptors objectAtIndex:v8];
    v10 = (__CFString *)[v9 key];
    int v48 = [v9 ascending];
    if (v8) {
      [v5 appendString:@","];
    }
    if ([(__CFString *)v10 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v11 = [v7 governingEntity]) == 0)
    {
LABEL_15:
      LOBYTE(v13) = 0;
      goto LABEL_39;
    }
    uint64_t v12 = [*(id *)(v11 + 40) objectForKey:v10];
    uint64_t v13 = v12;
    if (!v12) {
      goto LABEL_39;
    }
    int v14 = *(unsigned __int8 *)(v12 + 24);
    if (v14 == 9)
    {
      if (!*(void *)(v12 + 80)) {
        goto LABEL_15;
      }
      if ([(NSSQLIntermediate *)self isUpdateScoped])
      {
        [v46 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v44, objc_msgSend(NSString, "stringWithFormat:", @"Unsupported join (ordering by mtm not allowed in updates): %@", self->_sortDescriptors), 0), @"NSUnderlyingException" forKey];
      }
      else
      {
        id v17 = [(NSSQLIntermediate *)self fetchIntermediate];
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", objc_msgSend((id)v13, "name"), 0);
        v19 = (id)-[NSSQLFetchIntermediate finalJoinForKeypathWithComponents:]((uint64_t)v17, v18);
        if (!v19) {
          v19 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v18, [(id)v13 entity], -[NSSQLIntermediate governingAlias](v45, "governingAlias"), v45, (uint64_t)-[NSSQLIntermediate fetchIntermediate](v45, "fetchIntermediate"), v46);
        }

        if (![v46 objectForKey:@"NSUnderlyingException"])
        {
          if (v19) {
            v22 = (void *)v19[5];
          }
          else {
            v22 = 0;
          }
          id v15 = (id)[v22 mutableCopy];

          [v15 appendString:@"."];
          [v15 appendString:*(void *)(v13 + 80)];
          goto LABEL_22;
        }
      }
      id v15 = 0;
LABEL_22:
      BOOL v16 = v15 != 0;
      int v14 = *(unsigned __int8 *)(v13 + 24);
      goto LABEL_23;
    }
    id v15 = 0;
    BOOL v16 = 0;
LABEL_23:
    if (v14 == 7)
    {
      v20 = *(void **)(v13 + 56);
      if ([v20 isToMany])
      {
        v21 = v20 ? (void *)[v20 propertyDescription] : 0;
        if ([v21 isOrdered])
        {

          if ([(NSSQLIntermediate *)v45 isUpdateScoped])
          {
            [v46 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", v44, objc_msgSend(NSString, "stringWithFormat:", @"Unsupported join (ordering by tm not allowed in updates): %@", v45->_sortDescriptors), 0), @"NSUnderlyingException" forKey];
            id v15 = 0;
          }
          else
          {
            uint64_t v23 = [*(id *)(v13 + 80) name];
            v24 = [NSSQLKeypathExpressionIntermediate alloc];
            v25 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](v24, "initWithExpression:allowToMany:inScope:", [MEMORY[0x1E4F28C68] expressionForKeyPath:v23], 0, v45);
            id v15 = [(NSSQLKeypathExpressionIntermediate *)v25 generateSQLStringInContext:v46];
          }
          if (v15) {
            BOOL v16 = 1;
          }
        }
      }
    }
    LOBYTE(v13) = v16;
    if (v15)
    {
      [v5 appendString:@" "];
      self = v45;
      goto LABEL_44;
    }
    self = v45;
LABEL_39:
    v26 = @"_pk";
    if ([(__CFString *)v10 caseInsensitiveCompare:@"self"])
    {
      if ([(__CFString *)v10 compare:@"objectID"]) {
        v26 = v10;
      }
      else {
        v26 = @"_pk";
      }
    }
    v27 = [NSSQLKeypathExpressionIntermediate alloc];
    v28 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](v27, "initWithExpression:allowToMany:inScope:", [MEMORY[0x1E4F28C68] expressionForKeyPath:v26], 0, self);
    id v15 = [(NSSQLKeypathExpressionIntermediate *)v28 generateSQLStringInContext:v46];

    if (!v15) {
      goto LABEL_90;
    }
LABEL_44:
    [v5 appendString:v15];

    if (v13) {
      goto LABEL_73;
    }
    v29 = objc_msgSend((id)objc_msgSend(v7, "governingEntity"), "entityDescription");
    v30 = (void *)[(__CFString *)v10 componentsSeparatedByString:@"."];
    unint64_t v31 = [v30 count];
    uint64_t v32 = [v30 objectAtIndex:0];
    if (v29) {
      v33 = objc_msgSend((id)objc_msgSend(v29, "propertiesByName"), "objectForKey:", v32);
    }
    else {
      v33 = 0;
    }
    if ([v33 _propertyType] != 2
      && [v33 _propertyType] != 6
      && [v33 _propertyType] != 7)
    {
      v29 = (void *)[v33 destinationEntity];
    }
    v34 = (void *)[MEMORY[0x1E4F1CA48] array];
    [v34 addObject:v32];
    if (v31 >= 2)
    {
      for (uint64_t i = 1; i != v31; ++i)
      {
        -[NSSQLFetchIntermediate promoteToOuterJoinAtKeypathWithComponents:]((uint64_t)v7, v34);
        uint64_t v36 = [v30 objectAtIndex:i];
        if (v29) {
          v29 = objc_msgSend((id)objc_msgSend(v29, "propertiesByName"), "objectForKey:", v36);
        }
        if ([v29 _isAttribute]) {
          break;
        }
        [v34 addObject:v36];
        v29 = (void *)[v29 destinationEntity];
      }
    }
    v37 = (char *)[v9 selector];
    if (!v37 || v37 == sel_compare_) {
      break;
    }
    self = v45;
    if (v37 == sel_caseInsensitiveCompare_)
    {
      v38 = @" COLLATE NSCollateNoCase ";
    }
    else if (v37 == sel__caseInsensitiveNumericCompare_)
    {
      v38 = @" COLLATE NSCollateNumericallyNoCase ";
    }
    else if (v37 == sel_localizedCompare_)
    {
      v38 = @" COLLATE NSCollateLocaleSensitive ";
    }
    else if (v37 == sel_localizedCaseInsensitiveCompare_)
    {
      v38 = @" COLLATE NSCollateLocaleSensitiveNoCase ";
    }
    else
    {
      v38 = @" COLLATE NSCollateFinderlike ";
      if (v37 != sel_localizedStandardCompare_)
      {
        v41 = (void *)MEMORY[0x1E4F1CA00];
        v42 = (__CFString *)[NSString stringWithFormat:@"unsupported NSSortDescriptor selector: %@", NSStringFromSelector(v37)];
        v43 = v41;
        goto LABEL_89;
      }
    }
    [v5 appendString:v38];
LABEL_73:
    if ((v48 & 1) == 0) {
      [v5 appendString:@" DESC"];
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 reverseNullOrder])
    {
      if (v48) {
        v39 = @" ASC NULLS LAST";
      }
      else {
        v39 = @" NULLS FIRST";
      }
      [v5 appendString:v39];
    }
    if (++v8 == v47) {
      return v5;
    }
  }
  self = v45;
  if (![v9 comparator] || !HIBYTE(z9dsptsiQ80etb9782fsrs98bfdle88)) {
    goto LABEL_73;
  }
  v43 = (void *)MEMORY[0x1E4F1CA00];
  v42 = @"unsupported NSSortDescriptor (comparator blocks are not supported)";
LABEL_89:
  objc_msgSend(v46, "setObject:forKey:", objc_msgSend(v43, "exceptionWithName:reason:userInfo:", v44, v42, 0), @"NSUnderlyingException");
LABEL_90:

  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLOrderIntermediate;
  [(NSSQLOrderIntermediate *)&v3 dealloc];
}

@end