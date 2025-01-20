@interface NSSQLKeypathExpressionIntermediate
- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)generateSQLStringInContext:(id)a3;
- (uint64_t)_propertyDescriptionsForKeypath:(uint64_t)a3 rootedAtEntity:(uint64_t)a4 allowToMany:(uint64_t)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:;
- (unsigned)_propertyDescriptionForKeypath:(uint64_t)a3 startingAtEntity:(char)a4 allowToMany:(char)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:;
@end

@implementation NSSQLKeypathExpressionIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  v5 = objc_msgSend(-[NSArray objectAtIndex:](-[NSExpression arguments](self->super._expression, "arguments"), "objectAtIndex:", 0), "constantValue");
  [v5 rangeOfString:@".@"];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Keypath containing KVC aggregate where there shouldn't be one; failed to handle %@",
           self->super._expression);
LABEL_4:
    v10 = (__CFString *)v9;
    v11 = v7;
    uint64_t v12 = v8;
    uint64_t v13 = 0;
LABEL_5:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, v13), @"NSUnderlyingException");
    return 0;
  }
  if ([(NSSQLIntermediate *)self isIndexScoped])
  {
    v15 = [(NSSQLIntermediate *)self governingEntity];
    if (!v15 || (uint64_t v16 = [v15[5] objectForKey:v5]) == 0)
    {
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3B8];
      expression = self->super._expression;
      v38 = @"expression";
      v39[0] = expression;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      v10 = @"Bad keypath: can't find property";
      goto LABEL_33;
    }
    v17 = (unsigned __int8 *)v16;
    if ((*(_WORD *)(v16 + 32) & 0x20) == 0)
    {
      [v5 rangeOfString:@"."];
      if (v18)
      {
        v19 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v20 = *MEMORY[0x1E4F1C3B8];
        v21 = self->super._expression;
        v36 = @"expression";
        v37 = v21;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v10 = @"Bad keypath: too many joins for an index";
LABEL_33:
        v11 = v19;
        uint64_t v12 = v20;
        goto LABEL_5;
      }
    }
    int v27 = v17[24];
    if (v27 != 1)
    {
      if ((v27 - 7) >= 3)
      {
        v19 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v20 = *MEMORY[0x1E4F1C3B8];
        v30 = self->super._expression;
        v34 = @"expression";
        v35 = v30;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v10 = @"Unable to generate SQL for keypath";
        goto LABEL_33;
      }
      if (v27 != 7)
      {
        v19 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v20 = *MEMORY[0x1E4F1C3B8];
        v31 = self->super._expression;
        v32 = @"expression";
        v33 = v31;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        v10 = @"Bad keypath: indexes may not contain to many relationshps";
        goto LABEL_33;
      }
    }
    v28 = (void *)[v17 columnName];
    return (id)[v28 mutableCopy];
  }
  else
  {
    if ([(NSSQLIntermediate *)self isTargetColumnsScoped])
    {
      v22 = [(NSSQLIntermediate *)self fetchIntermediate];
      if (v22
        && v22[9]
        && ![(NSSQLIntermediate *)self isFunctionScoped]
        && (-[NSSQLFetchIntermediate groupByClauseContainsKeypath:]((uint64_t)[(NSSQLIntermediate *)self fetchIntermediate], (void *)[(NSExpression *)self->super._expression predicateFormat]) & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        uint64_t v9 = [NSString stringWithFormat:@"SELECT clauses in queries with GROUP BY components can only contain properties named in the GROUP BY or aggregate functions (%@ is not in the GROUP BY)", self->super._expression];
        goto LABEL_4;
      }
      v23 = self->super._expression;
      BOOL allowToMany = [(NSSQLIntermediate *)self isFunctionScoped];
      v25 = self;
      v26 = v23;
    }
    else
    {
      v26 = self->super._expression;
      BOOL allowToMany = self->super._allowToMany;
      v25 = self;
    }
    return [(NSSQLKeypathExpressionIntermediate *)v25 _generateSQLForKeyPathExpression:v26 allowToMany:allowToMany inContext:a3];
  }
}

- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  v75[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)MEMORY[0x18C127630](self, a2);
  v10 = (void *)[a5 objectForKey:@"storeRequest"];
  uint64_t v11 = [v10 requestType];
  if (v11 != 8)
  {
    if (v11 == 6)
    {
      context = v9;
      goto LABEL_8;
    }
    if (v11 != 1)
    {
      objc_msgSend(a5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"this should be inside a fetch or an update", 0), @"NSUnderlyingException");
      return 0;
    }
  }
  context = v9;
  if (!v6)
  {
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  if (([v10 returnsDistinctResults] & 1) != 0
    || (v32 = [(NSSQLIntermediate *)self fetchIntermediate]) == 0)
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v33 = v32[8];
    uint64_t v12 = 1;
    if (v33) {
      *(unsigned char *)(v33 + 48) = 1;
    }
  }
LABEL_9:
  id v13 = [(NSSQLIntermediate *)self governingEntityForKeypathExpression:a3];
  v14 = [(NSSQLIntermediate *)self governingAliasForKeypathExpression:a3];
  v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
  uint64_t v16 = (void *)[v15 componentsSeparatedByString:@"."];
  uint64_t v71 = 0;
  v17 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, (uint64_t)v13, v12, 1, &v71, a5);
  if (objc_msgSend((id)objc_msgSend(v17, "propertyDescription"), "_propertyType") != 7)
  {
    uint64_t v18 = (void *)[v17 propertyDescription];
    if ((!v18 || ![v18 superCompositeAttribute])
      && [(NSSQLIntermediate *)self isUpdateScoped]
      && (unint64_t)[v16 count] >= 2)
    {
      v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v20 = *MEMORY[0x1E4F1C3C8];
      v21 = @"keypaths (joins) not supported in batch update statements";
LABEL_35:
      uint64_t v34 = 0;
LABEL_36:
      uint64_t v35 = [v19 exceptionWithName:v20 reason:v21 userInfo:v34];
      v36 = @"NSUnderlyingException";
LABEL_37:
      [a5 setObject:v35 forKey:v36];
      goto LABEL_38;
    }
  }
  v22 = [(NSSQLIntermediate *)self disambiguatingEntity];
  if (v17 || (uint64_t v23 = (uint64_t)v22) == 0)
  {
    uint64_t v23 = (uint64_t)v13;
  }
  else
  {
    v24 = [(NSSQLIntermediate *)self disambiguationKeypath];
    if ([(NSArray *)v24 count])
    {
      if (!objc_msgSend(v15, "hasPrefix:", -[NSArray componentsJoinedByString:](v24, "componentsJoinedByString:", @".")))
      {
        v25 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v26 = *MEMORY[0x1E4F1C3C8];
        uint64_t v27 = [NSString stringWithFormat:@"invalid keypath %@", self->super._expression];
LABEL_34:
        v21 = (__CFString *)v27;
        v19 = v25;
        uint64_t v20 = v26;
        goto LABEL_35;
      }
      v17 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, objc_msgSend(v16, "subarrayWithRange:", -[NSArray count](v24, "count"), objc_msgSend(v16, "count") - -[NSArray count](v24, "count")), v23, v12 & !-[NSSQLIntermediate disambiguationKeypathHasToMany](self, "disambiguationKeypathHasToMany"), 1, &v71, a5);
      uint64_t v23 = (uint64_t)v13;
      if (!v17)
      {
        if ([a5 objectForKey:@"NSUnderlyingException"])
        {
LABEL_38:
          v30 = 0;
LABEL_39:
          return v30;
        }
        v25 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v26 = *MEMORY[0x1E4F1C3C8];
        uint64_t v27 = [NSString stringWithFormat:@"invalid keypath : %@", self->super._expression];
        goto LABEL_34;
      }
      goto LABEL_53;
    }
    uint64_t v71 = 0;
    v31 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, v23, v12, 1, &v71, a5);
    if (v31)
    {
      v17 = v31;
      id v13 = (id)v23;
      goto LABEL_53;
    }
    uint64_t v71 = 0;
    v40 = (void *)-[NSSQLKeypathExpressionIntermediate _propertyDescriptionsForKeypath:rootedAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, v23, v12, 1, &v71, a5);
    if (!v40)
    {
      if ([a5 valueForKey:@"NSUnderlyingException"]) {
        goto LABEL_38;
      }
      goto LABEL_24;
    }
    v41 = v40;
    if ([v40 count] != 1)
    {
      if ((unint64_t)[v41 count] >= 2)
      {
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        uint64_t v44 = [NSString stringWithFormat:@"ambiguous keypath %@", self->super._expression];
        v74 = @"found";
        v75[0] = [v41 valueForKey:@"propertyDescription"];
        v45 = (void *)MEMORY[0x1E4F1C9E8];
        v46 = v75;
        v47 = &v74;
        goto LABEL_115;
      }
LABEL_24:
      uint64_t v71 = 0;
      v28 = (void *)-[NSSQLKeypathExpressionIntermediate _propertyDescriptionsForKeypath:rootedAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:]((uint64_t)self, v16, (uint64_t)v13, v12, (unint64_t)[v16 count] < 2, &v71, a5);
      if (!v28)
      {
        if (v23
          && *(_DWORD *)(v23 + 184) == 16001
          && [v15 isEqualToString:@"changedObjectID"])
        {
          [a5 setValue:&unk_1ED7E2B00 forKey:@"generatePairs"];
          v38 = (void *)[*(id *)(v23 + 40) objectForKey:@"ENTITY"];
          v39 = (void *)[*(id *)(v23 + 40) objectForKey:@"ENTITYPK"];
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"(%@,%@)", objc_msgSend(v38, "columnName"), objc_msgSend(v39, "columnName")];
          goto LABEL_39;
        }
        v17 = 0;
        v30 = 0;
        if ([a5 valueForKey:@"NSUnderlyingException"]) {
          goto LABEL_39;
        }
        goto LABEL_53;
      }
      v29 = v28;
      if ([v28 count] == 1)
      {
        v17 = (unsigned __int8 *)[v29 anyObject];
        goto LABEL_53;
      }
      if ((unint64_t)[v29 count] < 2)
      {
        v17 = 0;
        goto LABEL_53;
      }
      v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      uint64_t v44 = [NSString stringWithFormat:@"Ambiguous keypath %@", self->super._expression];
      v72 = @"found";
      uint64_t v73 = [v29 valueForKey:@"propertyDescription"];
      v45 = (void *)MEMORY[0x1E4F1C9E8];
      v46 = &v73;
      v47 = &v72;
LABEL_115:
      uint64_t v34 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:1];
      v19 = v42;
      uint64_t v20 = v43;
      v21 = (__CFString *)v44;
      goto LABEL_36;
    }
    v17 = (unsigned __int8 *)[v41 anyObject];
  }
  id v13 = (id)v23;
  if (!v17) {
    goto LABEL_24;
  }
LABEL_53:
  unsigned int v48 = [v17 propertyType];
  v49 = (void *)[(id)v23 entityDescription];
  if (v48 > 0xA) {
    goto LABEL_85;
  }
  if (((1 << v48) & 0x42E) != 0) {
    goto LABEL_62;
  }
  if (((1 << v48) & 0x300) != 0)
  {
    uint64_t v50 = [v17 entity];
    if (v50)
    {
      v17 = *(unsigned __int8 **)(v50 + 128);
      if (!self) {
        goto LABEL_73;
      }
    }
    else
    {
      v17 = 0;
      if (!self) {
        goto LABEL_73;
      }
    }
    goto LABEL_63;
  }
  if (v48 != 7)
  {
LABEL_85:
    uint64_t v61 = [v16 firstObject];
    if (v61 && (v62 = objc_msgSend((id)objc_msgSend(v49, "propertiesByName"), "objectForKey:", v61)) != 0) {
      int v63 = [v62 isTransient];
    }
    else {
      int v63 = 0;
    }
    if ([a5 objectForKey:@"NSUnderlyingException"]) {
      goto LABEL_38;
    }
    [a5 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"keypath %@ not found in entity %@", a3, objc_msgSend(v13, "name")), 0), @"NSUnderlyingException" forKey];
    v30 = 0;
    if (!v63) {
      goto LABEL_39;
    }
    uint64_t v35 = [NSNumber numberWithBool:1];
    v36 = @"LastKeyPathWasTransientProperty";
    goto LABEL_37;
  }
  if (![(NSSQLIntermediate *)self isTargetColumnsScoped]) {
    v17 = (unsigned __int8 *)[v17 foreignKey];
  }
LABEL_62:
  if (!self) {
    goto LABEL_73;
  }
LABEL_63:
  if ([(NSSQLIntermediate *)self isUpdateScoped]) {
    id v51 = (id)[a5 objectForKey:@"outerFetch"];
  }
  else {
    id v51 = [(NSSQLIntermediate *)self fetchIntermediateForKeypathExpression:self->super._expression];
  }
  v52 = (__CFString **)+[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v16, (uint64_t)v13, v14, self, (uint64_t)v51, a5);
  if (![(NSSQLIntermediate *)self isUpdateScoped])
  {
    if ([a5 objectForKey:@"NSUnderlyingException"])
    {

      goto LABEL_73;
    }
    if (v52 && *((unsigned char *)v52 + 56))
    {
      id v56 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" "];
      [v56 appendString:v52[5]];
      [v56 appendString:@"."];
      v59 = -[NSSQLManyToMany inverseColumnName](v52[2]);
    }
    else
    {
      if ([(NSSQLIntermediate *)self isTargetColumnsScoped]
        && [v17 propertyType] == 7)
      {
        if (v52) {
          v14 = v52[4];
        }
        id v56 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" "];
        uint64_t v64 = [v17 destinationEntity];
        if (v64)
        {
          v65 = *(void **)(v64 + 152);
          if (v65)
          {
            if ([v65 count])
            {
              [v56 appendString:v14];
              [v56 appendString:@"."];
              if (v17) {
                v66 = (void *)*((void *)v17 + 9);
              }
              else {
                v66 = 0;
              }
              objc_msgSend(v56, "appendString:", objc_msgSend(v66, "columnName"));
              [v56 appendString:@", "];
            }
          }
        }
        [v56 appendString:v14];
        [v56 appendString:@"."];
        objc_msgSend(v56, "appendString:", objc_msgSend((id)objc_msgSend(v17, "foreignKey"), "columnName"));
        [a5 setObject:v17 forKey:@"keypathExpressionDestinationRelationship"];
        goto LABEL_84;
      }
      id v56 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@" "];
      if (![a5 objectForKeyedSubscript:@"fabricatedSQLEntityForReadOnlyFetch"]
        || (uint64_t v67 = [a5 objectForKeyedSubscript:@"fabricatedSQLEntityForReadOnlyFetch"],
            v67 != [v17 entity]))
      {
        if (v52) {
          v14 = v52[4];
        }
        [v56 appendString:v14];
        [v56 appendString:@"."];
      }
      if (*(&self->super._allowToMany + 1))
      {
        v60 = @"Z_PK";
        goto LABEL_83;
      }
      v59 = (__CFString *)[v17 columnName];
    }
    v60 = v59;
LABEL_83:
    [v56 appendString:v60];
LABEL_84:

    goto LABEL_120;
  }
  if (!v52)
  {
    id v56 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    int v57 = [v17 propertyType];
    if ((v57 - 1) >= 3)
    {
      if (v57 == 7)
      {
        if (v17) {
          v68 = (unsigned __int8 *)*((void *)v17 + 9);
        }
        else {
          v68 = 0;
        }
        goto LABEL_118;
      }
      if (v57 != 5)
      {

        if ([a5 objectForKey:@"NSUnderlyingException"]) {
          goto LABEL_73;
        }
        v53 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v54 = *MEMORY[0x1E4F1C3C8];
        uint64_t v55 = [NSString stringWithFormat:@"Unsupported property %@ in update", v17];
        goto LABEL_70;
      }
    }
    if (*(&self->super._allowToMany + 1))
    {
      v58 = @"Z_PK";
LABEL_119:
      [v56 appendString:v58];
      goto LABEL_120;
    }
    v68 = v17;
LABEL_118:
    v58 = (__CFString *)[v68 columnName];
    goto LABEL_119;
  }

  if (![a5 objectForKey:@"NSUnderlyingException"])
  {
    v53 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v54 = *MEMORY[0x1E4F1C3C8];
    uint64_t v55 = [NSString stringWithFormat:@"Unsupported property %@ in update - no joins allowed here", v17];
LABEL_70:
    objc_msgSend(a5, "setObject:forKey:", objc_msgSend(v53, "exceptionWithName:reason:userInfo:", v54, v55, 0), @"NSUnderlyingException");
  }
LABEL_73:
  id v56 = 0;
LABEL_120:
  id v69 = v56;

  return v56;
}

- (unsigned)_propertyDescriptionForKeypath:(uint64_t)a3 startingAtEntity:(char)a4 allowToMany:(char)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:
{
  if (!a1) {
    return 0;
  }
  uint64_t v13 = [a2 count];
  if (!v13) {
    return 0;
  }
  uint64_t v14 = v13;
  v36 = a7;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = v13 - 1;
  while (1)
  {
    uint64_t v18 = [a2 objectAtIndex:v15];
    *a6 = v18;
    uint64_t v19 = [@"entity" compare:v18 options:1];
    if (v17 == v15 && !v19) {
      break;
    }
    id v20 = -[NSEntityDescription _attributeNamed:]([(id)a3 entityDescription], *a6);
    if (v20 && [v20 attributeType] == 2100) {
      uint64_t v21 = [a2 componentsJoinedByString:@"."];
    }
    else {
      uint64_t v21 = *a6;
    }
    if (a3) {
      v22 = (unsigned __int8 *)[*(id *)(a3 + 40) objectForKey:v21];
    }
    else {
      v22 = 0;
    }
    if (v14 != 1 || v22) {
      goto LABEL_22;
    }
    uint64_t v23 = [v36 objectForKeyedSubscript:@"fabricatedSQLEntityForReadOnlyFetch"];
    if (v23)
    {
      int v24 = *(_DWORD *)(v23 + 184);
      if (a3) {
        goto LABEL_16;
      }
    }
    else
    {
      int v24 = 0;
      if (a3)
      {
LABEL_16:
        int v25 = *(_DWORD *)(a3 + 184);
        goto LABEL_17;
      }
    }
    int v25 = 0;
LABEL_17:
    if (v24 == v25)
    {
      if (v23) {
        uint64_t v23 = *(void *)(v23 + 40);
      }
      v22 = (unsigned __int8 *)[(id)v23 objectForKeyedSubscript:*a6];
    }
    else
    {
      v22 = 0;
    }
LABEL_22:
    int v26 = [v22 propertyType];
    if (objc_msgSend((id)objc_msgSend(v22, "propertyDescription"), "isTransient"))
    {
      v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      v30 = @"transient property used in fetch request";
      goto LABEL_46;
    }
    if ([v22 isToMany]) {
      goto LABEL_26;
    }
    if (!v22) {
      goto LABEL_32;
    }
    int v27 = v22[24];
    if (v27 == 9)
    {
LABEL_26:
      if ((a4 & 1) == 0)
      {
        v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        v30 = @"to-many key not allowed here";
        goto LABEL_46;
      }
      if (v16)
      {
        v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        v30 = @"multiple to-many keys not allowed here";
LABEL_46:
        objc_msgSend(v36, "setObject:forKey:", objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0), @"NSUnderlyingException");
        return 0;
      }
      if (!v22)
      {
        uint64_t v16 = 1;
        goto LABEL_32;
      }
      int v27 = v22[24];
      uint64_t v16 = 1;
    }
    if (v27 == 7 && (a5 & 1) == 0)
    {
      v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      v30 = @"to-one key not allowed here";
      goto LABEL_46;
    }
LABEL_32:
    if ((v26 - 7) <= 2)
    {
      a3 = [v22 destinationEntity];
      if (v14 != ++v15) {
        continue;
      }
    }
    return v22;
  }
  if (a3)
  {
    v31 = v36;
    if (*(_DWORD *)(a3 + 184) == 16001) {
      v22 = (unsigned __int8 *)[*(id *)(a3 + 40) objectForKey:*a6];
    }
    else {
      v22 = *(unsigned __int8 **)(a3 + 136);
    }
  }
  else
  {
    v22 = 0;
    v31 = v36;
  }
  objc_msgSend(v31, "setValue:forKey:", objc_msgSend(a2, "subarrayWithRange:", 0, v17), @"entitySpecificationKeypath");
  if (v16) {
    uint64_t v33 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v33 = MEMORY[0x1E4F1CC28];
  }
  [v31 setValue:v33 forKey:@"entitySpecificationKeypathContainsToMany"];
  uint64_t v34 = (void *)[v31 valueForKey:@"explicitRestrictingEntityQualifier"];
  if (v34)
  {
    [v34 addObject:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v35 addObject:MEMORY[0x1E4F1CC38]];
    [v31 setValue:v35 forKey:@"explicitRestrictingEntityQualifier"];
  }
  return v22;
}

- (uint64_t)_propertyDescriptionsForKeypath:(uint64_t)a3 rootedAtEntity:(uint64_t)a4 allowToMany:(uint64_t)a5 allowToOne:(uint64_t *)a6 lastKeyVisited:(void *)a7 inContext:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = a3 ? *(void **)(a3 + 152) : 0;
    result = [v13 count];
    if (result)
    {
      uint64_t v14 = (void *)[MEMORY[0x1E4F1CA80] set];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id obj = v13;
        uint64_t v22 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v19 = -[NSSQLKeypathExpressionIntermediate _propertyDescriptionForKeypath:startingAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:](v12, a2, v18, a4, a5, a6, a7);
            if (v19)
            {
              [v14 addObject:v19];
            }
            else if ([a7 objectForKey:@"NSUnderlyingException"])
            {
              return 0;
            }
            id v20 = (void *)-[NSSQLKeypathExpressionIntermediate _propertyDescriptionsForKeypath:rootedAtEntity:allowToMany:allowToOne:lastKeyVisited:inContext:](v12, a2, v18, a4, a5, a6, a7);
            if (v20)
            {
              objc_msgSend(v14, "addObjectsFromArray:", objc_msgSend(v20, "allObjects"));
            }
            else if ([a7 objectForKey:@"NSUnderlyingException"])
            {
              return 0;
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
      if (objc_msgSend(v14, "count", obj)) {
        return (uint64_t)v14;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

@end