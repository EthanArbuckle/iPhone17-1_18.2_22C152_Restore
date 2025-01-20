@interface NSSQLBinaryIndex
- (id)bulkUpdateStatementsForStore:(id)a3;
- (id)dropStatementsForStore:(id)a3;
- (id)generateStatementsForStore:(id)a3;
@end

@implementation NSSQLBinaryIndex

- (id)generateStatementsForStore:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  v6 = (void *)MEMORY[0x18C127630]();
  if (-[NSFetchIndexDescription _isMappedSinglePropertyIndex]((uint64_t)-[NSSQLIndex indexDescription](self, "indexDescription"))&& objc_msgSend((id)objc_msgSend(-[NSArray firstObject](-[NSFetchIndexDescription elements](-[NSSQLIndex indexDescription](self, "indexDescription"), "elements"), "firstObject"), "property"), "_propertyType") == 4&& !-[NSFetchIndexDescription _isUnique]((uint64_t)-[NSSQLIndex indexDescription](self, "indexDescription")))
  {
    goto LABEL_54;
  }
  if (!-[NSFetchIndexDescription partialIndexPredicate](-[NSSQLIndex indexDescription](self, "indexDescription"), "partialIndexPredicate")&& (-[NSFetchIndexDescription _isPurelyModeledIndex]((uint64_t)[(NSSQLIndex *)self indexDescription]) & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E4F28E78];
    if ([(NSSQLIndex *)self isUnique]) {
      v8 = @"UNIQUE ";
    }
    else {
      v8 = &stru_1ED787880;
    }
    v42 = objc_msgSend(v7, "stringWithFormat:", @"CREATE %@INDEX IF NOT EXISTS Z_%@_%@ ON %@ ("), v8, -[NSSQLEntity name](-[NSSQLIndex sqlEntity](self, "sqlEntity"), "name"), -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self, "indexDescription"), "name"), -[NSSQLEntity tableName](-[NSSQLIndex sqlEntity](self, "sqlEntity"), "tableName");
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v9 = [(NSFetchIndexDescription *)[(NSSQLIndex *)self indexDescription] elements];
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (!v10) {
      goto LABEL_54;
    }
    uint64_t v11 = v10;
    v12 = self;
    v40 = v6;
    v41 = v5;
    char v13 = 0;
    uint64_t v14 = *(void *)v44;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x18C127630]();
        v18 = (void *)[v16 property];
        uint64_t v19 = [v18 _propertyType];
        if ([v18 isTransient]) {
          BOOL v20 = v19 == 5;
        }
        else {
          BOOL v20 = 1;
        }
        if (v20)
        {
          if ([v18 _isAttribute])
          {
            if (v18 && [v18 superCompositeAttribute])
            {
              uint64_t v21 = [v18 _qualifiedName];
              uint64_t v22 = [(NSSQLIndex *)v12 sqlEntity];
              if (!v22) {
                goto LABEL_47;
              }
              v23 = *(void **)(v22 + 40);
              uint64_t v24 = v21;
LABEL_29:
              v27 = (void *)[v23 objectForKey:v24];
              if (!v27) {
                goto LABEL_47;
              }
LABEL_30:
              uint64_t v28 = [v27 columnName];
              if (v13) {
                [v42 appendString:@", "];
              }
              int v29 = [v16 isAscending];
              v30 = @"DESC";
              if (v29) {
                v30 = @"ASC";
              }
              [v42 appendFormat:@"%@ COLLATE BINARY %@", v28, v30];
              char v13 = 1;
              goto LABEL_47;
            }
LABEL_27:
            uint64_t v25 = [(NSSQLIndex *)v12 sqlEntity];
            uint64_t v26 = [v18 name];
            if (!v25) {
              goto LABEL_47;
            }
            uint64_t v24 = v26;
            v23 = *(void **)(v25 + 40);
            goto LABEL_29;
          }
          if ([v18 _isRelationship])
          {
            if ([v18 inverseRelationship] && (objc_msgSend(v18, "isToMany") & 1) != 0) {
              goto LABEL_47;
            }
            goto LABEL_27;
          }
          if (v19 != 5) {
            goto LABEL_47;
          }
          v31 = (void *)[v18 expression];
          uint64_t v32 = [v31 expressionType];
          if (v32 == 3)
          {
            uint64_t v33 = [v31 keyPath];
            if ([@"self" isEqual:v33]) {
              goto LABEL_40;
            }
            if (![@"entity" isEqual:v33]) {
              goto LABEL_47;
            }
            uint64_t v34 = [(NSSQLIndex *)v12 sqlEntity];
            if (!v34) {
              goto LABEL_47;
            }
            uint64_t v35 = 136;
          }
          else
          {
            if (v32 != 1) {
              goto LABEL_47;
            }
LABEL_40:
            uint64_t v34 = [(NSSQLIndex *)v12 sqlEntity];
            if (!v34) {
              goto LABEL_47;
            }
            uint64_t v35 = 128;
          }
          v27 = *(void **)(v34 + v35);
          if (!v27) {
            goto LABEL_47;
          }
          goto LABEL_30;
        }
LABEL_47:
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (!v11)
      {
        v6 = v40;
        v5 = v41;
        if (v13)
        {
          [v42 appendString:@""]);
          v36 = [[NSSQLiteStatement alloc] initWithEntity:[(NSSQLIndex *)v12 sqlEntity] sqlString:v42];
          [v41 addObject:v36];
          goto LABEL_53;
        }
        goto LABEL_54;
      }
    }
  }
  v36 = [[NSSQLGenerator alloc] initWithPersistentStore:a3];
  uint64_t v37 = -[NSSQLGenerator newSQLStatmentForBinaryIndex:inStore:]((uint64_t)v36, self, (uint64_t)a3);
  if (v37)
  {
    v38 = (void *)v37;
    [v5 addObject:v37];
  }
LABEL_53:

LABEL_54:
  return v5;
}

- (id)dropStatementsForStore:(id)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", -[NSSQLIndex sqlEntity](self, "sqlEntity"), [MEMORY[0x1E4F28E78] stringWithFormat:@"DROP INDEX IF EXISTS Z_%@_%@", -[NSSQLEntity name](-[NSSQLIndex sqlEntity](self, "sqlEntity", a3), "name"), -[NSFetchIndexDescription name](-[NSSQLIndex indexDescription](self, "indexDescription"), "name")]);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
}

- (id)bulkUpdateStatementsForStore:(id)a3
{
  return (id)NSArray_EmptyArray;
}

@end