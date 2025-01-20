@interface NSSQLRTreeIndex
- (id)bulkUpdateStatementsForStore:(id)a3;
- (id)dropStatementsForStore:(id)a3;
- (id)generateStatementsForStore:(id)a3;
- (id)initForIndexDescription:(id)a3 sqlEntity:(id)a4;
- (void)dealloc;
- (void)generateSQLStrings;
@end

@implementation NSSQLRTreeIndex

- (id)initForIndexDescription:(id)a3 sqlEntity:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLRTreeIndex;
  v6 = -[NSSQLIndex initForIndexDescription:sqlEntity:](&v8, sel_initForIndexDescription_sqlEntity_);
  if (v6) {
    v6[6] = [[NSString alloc] initWithFormat:@"Z_%@_%@", objc_msgSend(a4, "name"), objc_msgSend(a3, "name")];
  }
  return v6;
}

- (void)dealloc
{
  self->_tableName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLRTreeIndex;
  [(NSSQLIndex *)&v3 dealloc];
}

- (void)generateSQLStrings
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    context = (void *)MEMORY[0x18C127630]();
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v46 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1ED787880];
    v43 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1ED787880];
    v45 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1ED787880];
    v44 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1ED787880];
    uint64_t v38 = objc_msgSend((id)objc_msgSend(v1, "sqlEntity"), "tableName");
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = (id)objc_msgSend((id)objc_msgSend(v1, "indexDescription"), "elements");
    uint64_t v2 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (!v2) {
      goto LABEL_20;
    }
    uint64_t v3 = v2;
    v4 = &stru_1ED787880;
    uint64_t v5 = *(void *)v49;
    v6 = &stru_1ED787880;
    v7 = v1;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v49 != v5) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v48 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x18C127630]();
        v11 = (void *)[v9 property];
        if (([v11 _propertyType] & 0xFFFFFFFFFFFFFFFBLL) == 2)
        {
          if (v11 && [v11 superCompositeAttribute])
          {
            uint64_t v12 = [v11 _qualifiedName];
            v13 = (void *)[v1 sqlEntity];
            if (v13)
            {
              uint64_t v14 = (uint64_t)v13;
              goto LABEL_14;
            }
          }
          else
          {
            uint64_t v14 = [v1 sqlEntity];
            uint64_t v15 = [v11 name];
            if (v14)
            {
              uint64_t v12 = v15;
LABEL_14:
              v13 = (void *)[*(id *)(v14 + 40) objectForKey:v12];
            }
            else
            {
              v13 = 0;
            }
          }
          uint64_t v16 = [v13 columnName];
          [v46 appendFormat:@"%@%@_MIN, %@_MAX", v6, v16, v16];
          [v43 appendFormat:@"%@NEW.%@, NEW.%@", v6, v16, v16];
          [v44 appendFormat:@"%@%@, %@", v6, v16, v16];
          [v45 appendFormat:@"%@%@ NOT NULL", v4, v16];
          v1 = v7;
        }
        ++v8;
        v4 = @" AND ";
        v6 = @", ";
      }
      while (v3 != v8);
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      uint64_t v3 = v17;
      v4 = @" AND ";
      if (!v17)
      {
LABEL_20:
        v18 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", [v1 sqlEntity], objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"CREATE VIRTUAL TABLE IF NOT EXISTS %@ USING RTREE (Z_PK INTEGER PRIMARY KEY, %@)", v1[6], v46));
        [v39 addObject:v18];

        v19 = [NSSQLiteStatement alloc];
        uint64_t v20 = [v1 sqlEntity];
        v21 = -[NSSQLiteStatement initWithEntity:sqlString:](v19, "initWithEntity:sqlString:", v20, [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", v1[6]]);
        [v40 addObject:v21];

        v22 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", [v1 sqlEntity], objc_msgSend(NSString, "stringWithFormat:", @"CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW BEGIN INSERT OR REPLACE INTO %@ (Z_PK, %@) VALUES (NEW.Z_PK, %@) ; END",
                  v1[6],
                  v38,
                  v1[6],
                  v46,
                  v43));
        [v39 addObject:v22];

        v23 = [NSSQLiteStatement alloc];
        uint64_t v24 = [v1 sqlEntity];
        v25 = -[NSSQLiteStatement initWithEntity:sqlString:](v23, "initWithEntity:sqlString:", v24, [NSString stringWithFormat:@"DROP TRIGGER IF EXISTS %@_INSERT", v1[6]]);
        [v40 addObject:v25];

        v26 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", [v1 sqlEntity], objc_msgSend(NSString, "stringWithFormat:", @"CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = NEW.Z_PK ; INSERT INTO %@ (Z_PK, %@) VALUES (NEW.Z_PK, %@) ; END",
                  v1[6],
                  v38,
                  v1[6],
                  v1[6],
                  v46,
                  v43));
        [v39 addObject:v26];

        v27 = [NSSQLiteStatement alloc];
        uint64_t v28 = [v1 sqlEntity];
        v29 = -[NSSQLiteStatement initWithEntity:sqlString:](v27, "initWithEntity:sqlString:", v28, [NSString stringWithFormat:@"DROP TRIGGER IF EXISTS %@_UPDATE", v1[6]]);
        [v40 addObject:v29];

        v30 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", [v1 sqlEntity], objc_msgSend(NSString, "stringWithFormat:", @"CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = OLD.Z_PK ; END",
                  v1[6],
                  v38,
                  v1[6]));
        [v39 addObject:v30];

        v31 = [NSSQLiteStatement alloc];
        uint64_t v32 = [v1 sqlEntity];
        v33 = -[NSSQLiteStatement initWithEntity:sqlString:](v31, "initWithEntity:sqlString:", v32, [NSString stringWithFormat:@"DROP TRIGGER IF EXISTS %@_DELETE", v1[6]]);
        [v40 addObject:v33];

        v34 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", [v1 sqlEntity], objc_msgSend(NSString, "stringWithFormat:", @"INSERT OR REPLACE INTO %@ (Z_PK, %@) SELECT Z_PK, %@ from %@ where %@", v1[6], v46, v44, v38, v45));
        [v41 addObject:v34];

        objc_setProperty_nonatomic(v1, v35, v39, 24);
        objc_setProperty_nonatomic(v1, v36, v40, 32);

        objc_setProperty_nonatomic(v1, v37, v41, 40);
        return;
      }
    }
  }
}

- (id)generateStatementsForStore:(id)a3
{
  if (self)
  {
    id result = self->super._createStrings;
    if (!result)
    {
      -[NSSQLRTreeIndex generateSQLStrings](self);
      return self->super._createStrings;
    }
  }
  else
  {
    -[NSSQLRTreeIndex generateSQLStrings](0);
    return 0;
  }
  return result;
}

- (id)dropStatementsForStore:(id)a3
{
  if (self)
  {
    id result = self->super._dropStrings;
    if (!result)
    {
      -[NSSQLRTreeIndex generateSQLStrings](self);
      return self->super._dropStrings;
    }
  }
  else
  {
    -[NSSQLRTreeIndex generateSQLStrings](0);
    return 0;
  }
  return result;
}

- (id)bulkUpdateStatementsForStore:(id)a3
{
  if (self)
  {
    id result = self->super._updateStrings;
    if (!result)
    {
      -[NSSQLRTreeIndex generateSQLStrings](self);
      return self->super._updateStrings;
    }
  }
  else
  {
    -[NSSQLRTreeIndex generateSQLStrings](0);
    return 0;
  }
  return result;
}

@end