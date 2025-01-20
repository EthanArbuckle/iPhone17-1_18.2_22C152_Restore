@interface APDatabaseRow
- (APDatabaseRow)initWithTable:(id)a3;
- (APDatabaseTableProtocol)table;
- (BOOL)deleteFromDB;
- (BOOL)isDataObjectEqual:(id)a3;
- (BOOL)isNewObject;
- (BOOL)save;
- (NSDictionary)columns;
- (NSSet)readOnlyColumns;
- (NSString)description;
- (id)_allowedCodingClasses;
- (id)dictionaryFromBlobForColumnName:(id)a3;
- (id)initAsNewObjectWithTable:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForColumnName:(id)a3;
- (int64_t)typeForColumnName:(id)a3;
- (void)_createColumns;
- (void)forwardInvocation:(id)a3;
- (void)setColumns:(id)a3;
- (void)setDictionary:(id)a3 forBlobColumnName:(id)a4;
- (void)setIsNewObject:(BOOL)a3;
- (void)setValue:(id)a3 forColumnName:(id)a4;
@end

@implementation APDatabaseRow

- (APDatabaseTableProtocol)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  return (APDatabaseTableProtocol *)WeakRetained;
}

- (NSSet)readOnlyColumns
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:@"rowid"];
}

- (APDatabaseRow)initWithTable:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APDatabaseRow;
  v5 = [(APDatabaseRow *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_isNewObject = 0;
    objc_storeWeak((id *)&v5->_table, v4);
    [(APDatabaseRow *)v6 _createColumns];
  }

  return v6;
}

- (id)initAsNewObjectWithTable:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APDatabaseRow;
  v5 = [(APDatabaseRow *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_isNewObject = 1;
    objc_storeWeak((id *)&v5->_table, v4);
    [(APDatabaseRow *)v6 _createColumns];
  }

  return v6;
}

- (BOOL)save
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v3 = [(APDatabaseRow *)self table];
  id v4 = [v3 manager];

  if (v4)
  {
    uint64_t v5 = [(APDatabaseRow *)self columns];
    v6 = [(id)v5 allValues];

    LOBYTE(v5) = [(APDatabaseRow *)self isNewObject];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = v8;
    if (v5)
    {
      v57 = v8;
      v10 = v7;
      v54 = v4;
      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v52 = v6;
      v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v60 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            v17 = [(APDatabaseRow *)self readOnlyColumns];
            v18 = [v16 name];
            char v19 = [v17 containsObject:v18];

            if ((v19 & 1) == 0)
            {
              v20 = [v16 name];
              [v10 addObject:v20];

              [v57 addObject:@"?"];
              [v56 addObject:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v13);
      }

      v21 = NSString;
      v22 = [(APDatabaseRow *)self table];
      v23 = [v22 tableName];
      id v7 = v10;
      v24 = [v10 componentsJoinedByString:@", "];
      v25 = [v57 componentsJoinedByString:@", "];
      v26 = [v21 stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)", v23, v24, v25];

      v9 = v57;
      id v4 = v54;
      v27 = v56;
      uint64_t v28 = [v54 executeInsertQuery:v26 withParameters:v56];
      v29 = [NSNumber numberWithInteger:v28];
      [(APDatabaseRow *)self setValue:v29 forColumnName:@"rowid"];

      [(APDatabaseRow *)self setIsNewObject:0];
      char v30 = v28 != -1;
      v6 = v52;
      goto LABEL_34;
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v33 = v6;
    v27 = (void *)[v33 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v27)
    {
      v58 = v7;
      v53 = v6;
      v55 = v4;
      v34 = 0;
      uint64_t v35 = *(void *)v64;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v64 != v35) {
            objc_enumerationMutation(v33);
          }
          v37 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          v38 = [v37 name];
          int v39 = [v38 isEqualToString:@"rowid"];

          if (v39)
          {
            id v40 = v37;

            v34 = v40;
          }
          else
          {
            v41 = NSString;
            v42 = [v37 name];
            v43 = [v41 stringWithFormat:@"%@=?", v42];
            [v58 addObject:v43];

            [v9 addObject:v37];
          }
        }
        v27 = (void *)[v33 countByEnumeratingWithState:&v63 objects:v68 count:16];
      }
      while (v27);

      v27 = v34;
      if (v34)
      {
        v44 = [v34 value];

        v6 = v53;
        id v4 = v55;
        id v7 = v58;
        if (v44)
        {
          [v9 addObject:v34];
          v45 = NSString;
          v46 = [(APDatabaseRow *)self table];
          v47 = [v46 tableName];
          v48 = [v58 componentsJoinedByString:@", "];
          v26 = [v45 stringWithFormat:@"UPDATE %@ SET %@ WHERE rowId=?", v47, v48];

          v27 = v34;
          char v30 = [v55 executeQuery:v26 withParameters:v9];
LABEL_34:

          goto LABEL_35;
        }
      }
      else
      {
        v6 = v53;
        id v4 = v55;
        id v7 = v58;
      }
    }
    else
    {
    }
    v26 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v70 = v49;
      id v50 = v49;
      _os_log_impl(&dword_1D70B2000, v26, OS_LOG_TYPE_ERROR, "[%{private}@]: RowId is nil when trying to update row.", buf, 0xCu);
    }
    char v30 = 0;
    goto LABEL_34;
  }
  v6 = APLogForCategory(0xBuLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v31 = objc_opt_class();
    *(_DWORD *)buf = 138477827;
    v70 = v31;
    id v32 = v31;
    _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to save row.", buf, 0xCu);
  }
  char v30 = 0;
LABEL_35:

  return v30;
}

- (BOOL)deleteFromDB
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(APDatabaseRow *)self table];
  id v4 = [v3 manager];

  if (!v4)
  {
    v6 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v19 = (id)objc_opt_class();
      id v7 = v19;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to delete row.", buf, 0xCu);
    }
    char v5 = 0;
    goto LABEL_13;
  }
  if (![(APDatabaseRow *)self isNewObject])
  {
    id v8 = [(APDatabaseRow *)self columns];
    v6 = [v8 objectForKey:@"rowid"];

    v9 = [v6 value];

    if (v9)
    {
      v10 = NSString;
      v11 = [(APDatabaseRow *)self table];
      uint64_t v12 = [v11 tableName];
      uint64_t v13 = [v10 stringWithFormat:@"DELETE FROM %@ WHERE rowid = ?", v12];

      v17 = v6;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      char v5 = [v4 executeQuery:v13 withParameters:v14];

      [(APDatabaseRow *)self setIsNewObject:1];
    }
    else
    {
      uint64_t v13 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v19 = (id)objc_opt_class();
        id v15 = v19;
        _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_ERROR, "[%{private}@]: Error - Can't delete from DB rowId is nill.", buf, 0xCu);
      }
      char v5 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  char v5 = 0;
LABEL_14:

  return v5;
}

- (BOOL)isDataObjectEqual:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  v45 = [(APDatabaseRow *)self columns];
  [v45 allKeys];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (!v5)
  {
LABEL_33:
    BOOL v40 = 1;
    goto LABEL_48;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v48;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v48 != v7) {
      objc_enumerationMutation(v4);
    }
    v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
    if ([v9 isEqualToString:@"rowid"]) {
      goto LABEL_31;
    }
    v10 = [v45 objectForKey:v9];
    v11 = [v46 columns];
    uint64_t v12 = [v11 objectForKey:v9];

    uint64_t v13 = [v10 value];
    if (v13) {
      break;
    }
    uint64_t v14 = [v12 value];

    if (v14) {
      goto LABEL_10;
    }
LABEL_30:

LABEL_31:
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (!v6) {
        goto LABEL_33;
      }
      goto LABEL_3;
    }
  }

LABEL_10:
  uint64_t v15 = [v10 value];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [v12 value];

    if (!v17) {
      goto LABEL_47;
    }
  }
  v18 = [v10 value];
  if (v18)
  {
  }
  else
  {
    id v19 = [v12 value];

    if (v19) {
      goto LABEL_47;
    }
  }
  switch([v10 type])
  {
    case 0:
    case 1:
    case 2:
    case 5:
      uint64_t v20 = [v10 value];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_35:
        v41 = APLogForCategory(0xBuLL);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      v21 = [v12 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_35;
      }
      v23 = [v10 value];
      v24 = [v12 value];
      char v25 = [v23 isEqualToNumber:v24];
      goto LABEL_29;
    case 3:
      v26 = [v10 value];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_38:
        v41 = APLogForCategory(0xBuLL);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      v27 = [v12 value];
      objc_opt_class();
      char v28 = objc_opt_isKindOfClass();

      if ((v28 & 1) == 0) {
        goto LABEL_38;
      }
      v23 = [v10 value];
      v24 = [v12 value];
      char v25 = [v23 isEqualToString:v24];
      goto LABEL_29;
    case 4:
      v29 = [v10 value];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_41:
        v41 = APLogForCategory(0xBuLL);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      char v30 = [v12 value];
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0) {
        goto LABEL_41;
      }
      id v32 = [v10 value];
      v33 = [v12 value];
      [v32 timeIntervalSinceDate:v33];
      double v35 = fabs(v34);

      if (v35 > 0.001) {
        goto LABEL_47;
      }
      goto LABEL_30;
    case 6:
      v36 = [v10 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v37 = [v12 value];
        objc_opt_class();
        char v38 = objc_opt_isKindOfClass();

        if ((v38 & 1) == 0) {
          goto LABEL_44;
        }
        v23 = [v10 value];
        v24 = [v12 value];
        char v25 = [v23 isEqualToData:v24];
LABEL_29:
        char v39 = v25;

        if ((v39 & 1) == 0) {
          goto LABEL_47;
        }
        goto LABEL_30;
      }

LABEL_44:
      v41 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
LABEL_45:
        v42 = objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v52 = v42;
        id v43 = v42;
        _os_log_impl(&dword_1D70B2000, v41, OS_LOG_TYPE_ERROR, "[%{private}@]: Error - Column type class type missmatch.", buf, 0xCu);
      }
LABEL_46:

LABEL_47:
      BOOL v40 = 0;
LABEL_48:

      return v40;
    default:
      goto LABEL_30;
  }
}

- (id)dictionaryFromBlobForColumnName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(APDatabaseRow *)self valueForColumnName:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = [(APDatabaseRow *)self _allowedCodingClasses];
    id v16 = 0;
    uint64_t v8 = [v6 unarchivedObjectOfClasses:v7 fromData:v5 error:&v16];
    id v9 = v16;

    if (v9)
    {
      v10 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_opt_class();
        id v12 = v11;
        uint64_t v13 = [v9 localizedDescription];
        *(_DWORD *)buf = 138478339;
        v18 = v11;
        __int16 v19 = 2113;
        id v20 = v4;
        __int16 v21 = 2114;
        v22 = v13;
        _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "[%{private}@] Could not unarchive data for %{private}@ column, error: %{public}@", buf, 0x20u);
      }
      id v14 = 0;
    }
    else
    {
      id v14 = v8;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)setDictionary:(id)a3 forBlobColumnName:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v13 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v13];
    id v8 = v13;
    if (v8)
    {
      id v9 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        id v11 = v10;
        id v12 = [v8 localizedDescription];
        *(_DWORD *)buf = 138478339;
        uint64_t v15 = v10;
        __int16 v16 = 2113;
        id v17 = v6;
        __int16 v18 = 2114;
        __int16 v19 = v12;
        _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "[%{private}@] Could not archive data for %{private}@ column, error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      [(APDatabaseRow *)self setValue:v7 forColumnName:v6];
    }
  }
  else
  {
    [(APDatabaseRow *)self setValue:0 forColumnName:v6];
  }
}

- (NSString)description
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!+[APSystemInternal isAppleInternalInstall])
  {
    v29 = &stru_1F2EA2540;
LABEL_29:
    char v28 = v29;
    goto LABEL_30;
  }
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = [(APDatabaseRow *)self columns];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v11 = [v10 name];
        id v12 = [v10 value];
        if (([v11 isEqualToString:@"rowid"] & 1) == 0 && v12) {
          [v3 setObject:v12 forKey:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v7);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = [(APDatabaseRow *)self readOnlyColumns];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        if (([v18 isEqualToString:@"rowid"] & 1) == 0)
        {
          __int16 v19 = [(APDatabaseRow *)self valueForKey:v18];
          if (v19) {
            [v3 setObject:v19 forKey:v18];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v15);
  }

  uint64_t v20 = +[APJSONArchiver JSONObjectWithObject:v3];

  id v31 = 0;
  __int16 v21 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v20 options:0 error:&v31];
  id v22 = v31;
  if (!v22)
  {
    v29 = (__CFString *)[[NSString alloc] initWithData:v21 encoding:4];

    goto LABEL_29;
  }
  uint64_t v23 = v22;
  v24 = APLogForCategory(0xBuLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    char v25 = objc_opt_class();
    id v26 = v25;
    v27 = [v23 description];
    *(_DWORD *)buf = 138478083;
    v41 = v25;
    __int16 v42 = 2113;
    id v43 = v27;
    _os_log_impl(&dword_1D70B2000, v24, OS_LOG_TYPE_ERROR, "[%{private}@]: Error generating JSON description %{private}@.", buf, 0x16u);
  }
  char v28 = &stru_1F2EA2540;
LABEL_30:

  return (NSString *)v28;
}

- (void)_createColumns
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int outCount = 0;
  id v4 = [[APDatabaseColumn alloc] initWithName:@"rowid" forColumnType:0 withValue:0];
  uint64_t v5 = [(APDatabaseColumn *)v4 name];
  uint64_t v46 = v4;
  [v3 setObject:v4 forKey:v5];

  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = class_copyPropertyList(v6, &outCount);
  uint64_t v8 = v7;
  if (outCount)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0x1E4F29000uLL;
    id v47 = v3;
    long long v48 = v7;
    long long v49 = self;
    while (1)
    {
      id v11 = v8[v9];
      Name = property_getName(v11);
      if (Name) {
        break;
      }
LABEL_28:
      if (++v9 >= (unint64_t)outCount) {
        goto LABEL_37;
      }
    }
    id v13 = [*(id *)(v10 + 24) stringWithUTF8String:Name];
    uint64_t v14 = [(APDatabaseRow *)self readOnlyColumns];
    char v15 = [v14 containsObject:v13];

    if (v15)
    {
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v16 = [*(id *)(v10 + 24) stringWithUTF8String:property_getAttributes(v11)];
    id v17 = [v16 componentsSeparatedByString:@","];
    __int16 v18 = [v17 objectAtIndex:0];
    id v19 = [v18 substringFromIndex:1];
    uint64_t v20 = (const char *)[v19 UTF8String];
    if (![v18 hasPrefix:@"T@"])
    {
      if (!strcmp(v20, "q"))
      {
        uint64_t v25 = 0;
      }
      else if (!strcmp(v20, "Q"))
      {
        uint64_t v25 = 3;
      }
      else
      {
        if (strcmp(v20, "B"))
        {
          APLogForCategory(0xBuLL);
          __int16 v21 = (APDatabaseColumn *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR))
          {
            id v26 = objc_opt_class();
            *(_DWORD *)buf = 138477827;
            v52 = v26;
            id v27 = v26;
            _os_log_impl(&dword_1D70B2000, &v21->super, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to match property type to DB Column type.", buf, 0xCu);

            id v3 = v47;
          }
          uint64_t v25 = 0;
          goto LABEL_24;
        }
        uint64_t v25 = 5;
      }
LABEL_25:
      __int16 v21 = [[APDatabaseColumn alloc] initWithName:v13 forColumnType:v25 withValue:0];
      [v3 setObject:v21 forKey:v13];
LABEL_26:

      uint64_t v8 = v48;
      self = v49;
      unint64_t v10 = 0x1E4F29000;
      goto LABEL_27;
    }
    objc_msgSend(v18, "substringWithRange:", 3, objc_msgSend(v18, "length") - 4);
    __int16 v21 = (APDatabaseColumn *)objc_claimAutoreleasedReturnValue();
    id v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    char v24 = [(APDatabaseColumn *)v21 isEqualToString:v23];

    if (v24)
    {
      uint64_t v25 = 3;
    }
    else
    {
      char v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      char v30 = [(APDatabaseColumn *)v21 isEqualToString:v29];

      if (v30)
      {
        uint64_t v25 = 2;
      }
      else
      {
        id v31 = (objc_class *)objc_opt_class();
        long long v32 = NSStringFromClass(v31);
        char v33 = [(APDatabaseColumn *)v21 isEqualToString:v32];

        if (v33)
        {
          uint64_t v25 = 4;
        }
        else
        {
          long long v34 = (objc_class *)objc_opt_class();
          long long v35 = NSStringFromClass(v34);
          char v36 = [(APDatabaseColumn *)v21 isEqualToString:v35];

          if ((v36 & 1) == 0)
          {
            long long v37 = (objc_class *)objc_opt_class();
            long long v38 = NSStringFromClass(v37);
            if ([(APDatabaseColumn *)v21 isEqualToString:v38])
            {
            }
            else
            {
              long long v39 = (objc_class *)objc_opt_class();
              BOOL v40 = NSStringFromClass(v39);
              char v41 = [(APDatabaseColumn *)v21 isEqualToString:v40];

              if ((v41 & 1) == 0)
              {
                __int16 v42 = APLogForCategory(0xBuLL);
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  id v43 = objc_opt_class();
                  *(_DWORD *)buf = 138477827;
                  v52 = v43;
                  id v44 = v43;
                  _os_log_impl(&dword_1D70B2000, v42, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to match property type to DB Column type.", buf, 0xCu);
                }
                uint64_t v25 = 0;
                goto LABEL_23;
              }
            }
            id v3 = v47;
            goto LABEL_26;
          }
          uint64_t v25 = 6;
        }
      }
    }
LABEL_23:
    id v3 = v47;
LABEL_24:

    goto LABEL_25;
  }
LABEL_37:
  free(v8);
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];
  [(APDatabaseRow *)self setColumns:v45];
}

- (id)_allowedCodingClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

- (void)setValue:(id)a3 forColumnName:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(APDatabaseRow *)self columns];
  uint64_t v9 = [v8 objectForKey:v7];

  if (v9)
  {
    [v9 setValue:v6];
  }
  else
  {
    unint64_t v10 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138478083;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2113;
      id v15 = v7;
      id v11 = v13;
      _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "[%{private}@]: Column not avaliable for column name %{private}@.", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (id)valueForColumnName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(APDatabaseRow *)self columns];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [v6 value];
  }
  else
  {
    uint64_t v8 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138478083;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2113;
      id v14 = v4;
      id v9 = v12;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Column not avaliable for column name %{private}@.", (uint8_t *)&v11, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (int64_t)typeForColumnName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(APDatabaseRow *)self columns];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    int64_t v7 = [v6 type];
  }
  else
  {
    uint64_t v8 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138478083;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2113;
      id v14 = v4;
      id v9 = v12;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Column not avaliable for column name %{private}@.", (uint8_t *)&v11, 0x16u);
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector((SEL)[v4 selector]);
  id v6 = objc_msgSend(v5, "ap_propertyName");
  if (v6)
  {
    if ([v5 hasPrefix:@"set"])
    {
      id location = 0;
      [v4 getArgument:&location atIndex:2];
      id v7 = objc_loadWeakRetained(&location);
      [(APDatabaseRow *)self setValue:v7 forColumnName:v6];

      objc_destroyWeak(&location);
    }
    else
    {
      id location = [(APDatabaseRow *)self valueForColumnName:v5];
      [v4 setReturnValue:&location];
    }
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)APDatabaseRow;
  id v4 = -[APDatabaseRow methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v4)
  {
    uint64_t v5 = NSStringFromSelector(a3);
    if ([v5 hasPrefix:@"set"]) {
      id v6 = "v@:@";
    }
    else {
      id v6 = "@@:";
    }
    id v4 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:v6];
  }
  return v4;
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
}

- (BOOL)isNewObject
{
  return self->_isNewObject;
}

- (void)setIsNewObject:(BOOL)a3
{
  self->_isNewObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_destroyWeak((id *)&self->_table);
}

@end