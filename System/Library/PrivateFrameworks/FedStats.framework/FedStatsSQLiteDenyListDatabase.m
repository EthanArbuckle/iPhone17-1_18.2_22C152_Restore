@interface FedStatsSQLiteDenyListDatabase
+ (id)databaseWithFileURL:(id)a3 tableName:(id)a4 columnName:(id)a5 error:(id *)a6;
- (BOOL)isInDenyList:(id)a3 partialMatch:(BOOL)a4;
- (FedStatsSQLiteDatabase)denyListDB;
- (FedStatsSQLiteDatabase)sqliteDB;
- (FedStatsSQLiteDenyListDatabase)initWithDenyList:(id)a3 tableName:(id)a4 columnName:(id)a5;
- (NSString)columnName;
- (NSString)tableName;
@end

@implementation FedStatsSQLiteDenyListDatabase

- (FedStatsSQLiteDenyListDatabase)initWithDenyList:(id)a3 tableName:(id)a4 columnName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FedStatsSQLiteDenyListDatabase;
  v12 = [(FedStatsSQLiteDenyListDatabase *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_denyListDB, a3);
    objc_storeStrong((id *)&v13->_tableName, a4);
    objc_storeStrong((id *)&v13->_columnName, a5);
  }

  return v13;
}

+ (id)databaseWithFileURL:(id)a3 tableName:(id)a4 columnName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [NSURL URLWithString:v10];
LABEL_5:
    v14 = v13;
    id v51 = 0;
    objc_super v15 = +[FedStatsSQLiteDatabase databaseWithURL:v10 mode:114 error:&v51];
    id v16 = v51;
    v17 = v16;
    if (!v15)
    {
      if (a6)
      {
        +[FedStatsError errorWithCode:101 underlyingError:v16 description:@"The URL cannot be loaded as a database"];
        v29 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      goto LABEL_50;
    }
    v46 = (objc_class *)a1;
    id v47 = v16;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a6 && (isKindOfClass & 1) == 0) {
      v19 = {;
    }
      *a6 = +[FedStatsError errorWithCode:101 description:v19];
    }
    v20 = [NSString stringWithFormat:@"SELECT COUNT(1) AS %@ FROM SQLITE_MASTER WHERE type == 'table' AND name == '%@'", @"tableCount", v11];
    id v50 = 0;
    v21 = [v15 runQuery:v20 error:&v50];
    id v22 = v50;
    v48 = v14;
    if (!v21 || ([v21 next], (v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (a6)
      {
        *a6 = +[FedStatsError errorWithCode:101 underlyingError:v22 description:@"Cannot query list of tables in deny list database"];
      }
      BOOL v28 = 1;
LABEL_28:

      if (v28)
      {
        v29 = 0;
        v17 = v47;
        v14 = v48;
LABEL_50:

        goto LABEL_51;
      }
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();
      if (a6 && (v31 & 1) == 0) {
        v32 = {;
      }
        *a6 = +[FedStatsError errorWithCode:101 description:v32];
      }
      v33 = [NSString stringWithFormat:@"SELECT COUNT(1) AS %@ FROM PRAGMA_TABLE_XINFO('%@') WHERE name == '%@'", @"columnCount", v11, v12];
      id v49 = 0;
      v34 = [v15 runQuery:v33 error:&v49];
      id v35 = v49;
      if (!v34 || ([v34 next], (v36 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (a6)
        {
          *a6 = +[FedStatsError errorWithCode:101 underlyingError:v35 description:@"Cannot query list of columns in deny list database table"];
        }
        BOOL v41 = 1;
        v17 = v47;
        goto LABEL_46;
      }
      v37 = v36;
      id v45 = v35;
      v38 = [v36 objectForKey:@"columnCount"];
      v39 = v38;
      if (v38)
      {
        uint64_t v40 = [v38 unsignedIntegerValue];
        BOOL v41 = v40 != 1;
        if (!a6 || v40 == 1) {
          goto LABEL_45;
        }
      }
      else if (!a6)
      {
LABEL_44:
        BOOL v41 = 1;
LABEL_45:

        v17 = v47;
        id v35 = v45;
LABEL_46:

        if (v41) {
          v29 = 0;
        }
        else {
          v29 = (void *)[[v46 alloc] initWithDenyList:v15 tableName:v11 columnName:v12];
        }
        v14 = v48;
        goto LABEL_50;
      v42 = };
      *a6 = +[FedStatsError errorWithCode:101 description:v42];

      goto LABEL_44;
    }
    v24 = v23;
    id v44 = v12;
    v25 = [v23 objectForKey:@"tableCount"];
    v26 = v25;
    if (v25)
    {
      uint64_t v27 = [v25 unsignedIntegerValue];
      BOOL v28 = v27 != 1;
      if (!a6 || v27 == 1) {
        goto LABEL_27;
      }
    }
    else if (!a6)
    {
LABEL_26:
      BOOL v28 = 1;
LABEL_27:

      id v12 = v44;
      goto LABEL_28;
    v30 = };
    *a6 = +[FedStatsError errorWithCode:101 description:v30];

    goto LABEL_26;
  }
  if (a6)
  {
    +[FedStatsError errorWithCode:101 description:@"The parameter fileURL is not a URL or path string"];
    v29 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
LABEL_51:

  return v29;
}

- (BOOL)isInDenyList:(id)a3 partialMatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = NSString;
  [(FedStatsSQLiteDenyListDatabase *)self tableName];
  if (v4) {
    v8 = {;
  }
    id v9 = [(FedStatsSQLiteDenyListDatabase *)self columnName];
    [v7 stringWithFormat:@"SELECT COUNT(1) AS %@ FROM '%@' WHERE '%@' LIKE '%%' || %@ || '%%'", @"matchCount", v8, v6, v9];
  }
  else {
    v8 = {;
  }
    id v9 = [(FedStatsSQLiteDenyListDatabase *)self columnName];
    [v7 stringWithFormat:@"SELECT COUNT(1) AS %@ FROM '%@' WHERE %@ == '%@'", @"matchCount", v8, v9, v6];
  id v10 = };

  id v11 = [(FedStatsSQLiteDenyListDatabase *)self denyListDB];
  id v12 = [v11 runQuery:v10 error:0];

  if (v12 && ([v12 next], (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = v13;
    objc_super v15 = [v13 objectForKey:@"matchCount"];
    id v16 = v15;
    if (v15) {
      BOOL v17 = [v15 unsignedIntegerValue] != 0;
    }
    else {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (FedStatsSQLiteDatabase)sqliteDB
{
  return (FedStatsSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (FedStatsSQLiteDatabase)denyListDB
{
  return self->_denyListDB;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_denyListDB, 0);
  objc_storeStrong((id *)&self->_sqliteDB, 0);
}

@end