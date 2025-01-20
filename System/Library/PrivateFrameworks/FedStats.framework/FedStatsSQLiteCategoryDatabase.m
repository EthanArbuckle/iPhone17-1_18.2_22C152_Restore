@interface FedStatsSQLiteCategoryDatabase
+ (FedStatsSQLiteCategoryDatabase)databaseWithFileURL:(id)a3 minIndex:(unint64_t)a4 maxIndex:(unint64_t)a5 checkForPrimaryKey:(BOOL)a6 error:(id *)a7;
+ (id)categoryDatabaseAt:(id)a3 withCategories:(id)a4 tableName:(id)a5 categoryColumnName:(id)a6 indexColumnName:(id)a7 error:(id *)a8;
- (FedStatsSQLiteCategoryDatabase)initWithSQLiteDatabase:(id)a3 tableName:(id)a4 categoryColumnName:(id)a5 indexColumnName:(id)a6 minIndex:(unint64_t)a7 maxIndex:(unint64_t)a8;
- (FedStatsSQLiteDatabase)sqliteDB;
- (NSString)categoryColumnName;
- (NSString)indexColumnName;
- (NSString)tableName;
- (id)decode:(unint64_t)a3 error:(id *)a4;
- (id)encode:(id)a3 error:(id *)a4;
- (id)encodeCategories:(id)a3 error:(id *)a4;
- (unint64_t)dimensionality;
- (unint64_t)maxIndex;
- (unint64_t)minIndex;
@end

@implementation FedStatsSQLiteCategoryDatabase

- (FedStatsSQLiteCategoryDatabase)initWithSQLiteDatabase:(id)a3 tableName:(id)a4 categoryColumnName:(id)a5 indexColumnName:(id)a6 minIndex:(unint64_t)a7 maxIndex:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)FedStatsSQLiteCategoryDatabase;
  v18 = [(FedStatsSQLiteCategoryDatabase *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sqliteDB, a3);
    objc_storeStrong((id *)&v19->_tableName, a4);
    objc_storeStrong((id *)&v19->_categoryColumnName, a5);
    objc_storeStrong((id *)&v19->_indexColumnName, a6);
    v19->_minIndex = a7;
    v19->_maxIndex = a8;
  }

  return v19;
}

- (unint64_t)dimensionality
{
  unint64_t v3 = [(FedStatsSQLiteCategoryDatabase *)self maxIndex];
  return v3 - [(FedStatsSQLiteCategoryDatabase *)self minIndex] + 1;
}

+ (FedStatsSQLiteCategoryDatabase)databaseWithFileURL:(id)a3 minIndex:(unint64_t)a4 maxIndex:(unint64_t)a5 checkForPrimaryKey:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v77 = 0;
    v13 = +[FedStatsSQLiteDatabase databaseWithURL:v12 mode:114 error:&v77];
    id v14 = v77;
    if (!v13)
    {
      if (a7)
      {
        v37 = +[FedStatsError errorWithCode:302 underlyingError:v14 description:@"Cannot open database"];
LABEL_23:
        v36 = 0;
        *a7 = v37;
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:
      v36 = 0;
      goto LABEL_25;
    }
    unint64_t v73 = a4;
    id v15 = NSString;
    id v16 = v13;
    id v17 = [v15 stringWithFormat:@"SELECT COUNT(*) AS %@ FROM SQLITE_MASTER WHERE type == 'table'", @"tableCount"];
    id v78 = 0;
    v18 = [v16 runQuery:v17 error:&v78];

    if (v18)
    {
      unint64_t v72 = a5;
      v19 = [v18 next];
      if (v19)
      {
        v20 = v19;
        v71 = (objc_class *)a1;
        v21 = [v19 objectForKey:@"tableCount"];
        if (v21)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v70 = v13;
            uint64_t v22 = [v21 unsignedIntegerValue];

            BOOL v23 = v22 == 1;
            v13 = v70;
            if (!v23)
            {
LABEL_21:
              if (a7)
              {
                v37 = +[FedStatsError errorWithCode:302 description:@"Database does not have exactly one table"];
                goto LABEL_23;
              }
              goto LABEL_24;
            }
            v24 = NSString;
            id v25 = v16;
            v26 = [v24 stringWithFormat:@"SELECT %@ FROM SQLITE_MASTER WHERE type == 'table'", @"name"];
            id v78 = 0;
            v27 = [v25 runQuery:v26 error:&v78];

            id v28 = v78;
            if (v27)
            {
              id v68 = v25;
              v29 = [v27 next];
              v30 = v29;
              if (v29)
              {
                v67 = v26;
                v31 = [v29 objectForKey:@"name"];
                v32 = v31;
                v33 = v28;
                if (v31)
                {
                  id v34 = v31;
                  id v35 = v14;
                }
                else
                {
                  id v35 = +[FedStatsError errorWithCode:302 underlyingError:v28 description:@"Cannot lookup table name"];
                }
                v39 = v32;

                v26 = v67;
              }
              else
              {
                v33 = v28;
                id v35 = +[FedStatsError errorWithCode:302 underlyingError:v28 description:@"Cannot check query result"];
                v39 = 0;
              }

              id v25 = v68;
            }
            else
            {
              +[FedStatsError errorWithCode:302 underlyingError:v28 description:@"Cannot query database"];
              v33 = v28;
              id v35 = (id)objc_claimAutoreleasedReturnValue();
              v39 = 0;
            }

            id v40 = v35;
            v41 = v39;
            if (!v39)
            {
              if (a7)
              {
                +[FedStatsError errorWithCode:302 underlyingError:v40 description:@"Cannot get table name from database"];
                v36 = 0;
                *a7 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v36 = 0;
              }
              v13 = v70;
              goto LABEL_79;
            }
            v42 = NSString;
            id v43 = v25;
            v44 = [v42 stringWithFormat:@"SELECT COUNT(*) AS %@ FROM PRAGMA_TABLE_XINFO('%@')", @"columnCount", v41];
            id v78 = 0;
            v45 = [v43 runQuery:v44 error:&v78];

            if (!v45)
            {

              v13 = v70;
              goto LABEL_63;
            }
            id v46 = v40;
            v47 = [v45 next];
            v13 = v70;
            if (v47)
            {
              v48 = v47;
              v69 = v41;
              v49 = [v47 objectForKey:@"columnCount"];
              if (v49)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v50 = [v49 unsignedIntegerValue];

                  BOOL v23 = v50 == 2;
                  v41 = v69;
                  v13 = v70;
                  id v40 = v46;
                  if (!v23)
                  {
LABEL_63:
                    if (a7)
                    {
                      v66 = @"Database table does not have exactly two columns";
LABEL_65:
                      +[FedStatsError errorWithCode:302 description:v66];
                      v36 = 0;
                      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_79:

                      id v14 = v40;
                      goto LABEL_25;
                    }
                    goto LABEL_78;
                  }
                  if (!v8) {
                    goto LABEL_48;
                  }
                  v51 = NSString;
                  id v52 = v43;
                  objc_msgSend(v51, "stringWithFormat:", @"SELECT COUNT(*) AS %@ FROM PRAGMA_INDEX_LIST('%@') AS indices, PRAGMA_INDEX_XINFO(indices.name) AS index_info WHERE indices.origin == 'pk' AND index_info.key == 1;",
                    @"indexColumnCount",
                  v53 = v69);
                  id v78 = 0;
                  v54 = [v52 runQuery:v53 error:&v78];

                  if (v54)
                  {
                    v55 = [v54 next];
                    if (v55)
                    {
                      v56 = v55;
                      v57 = [v55 objectForKey:@"indexColumnCount"];
                      if (v57)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v58 = [v57 unsignedIntegerValue];

                          BOOL v23 = v58 == 2;
                          v41 = v69;
                          v13 = v70;
                          id v40 = v46;
                          if (!v23)
                          {
LABEL_76:
                            if (a7)
                            {
                              v66 = @"Database table does not have primary key with the two columns";
                              goto LABEL_65;
                            }
LABEL_78:
                            v36 = 0;
                            goto LABEL_79;
                          }
LABEL_48:
                          id v76 = v40;
                          v59 = getColumnName(v43, (uint64_t)v41, @"TEXT", &v76);
                          id v60 = v76;

                          if (!v59)
                          {
                            if (a7)
                            {
                              +[FedStatsError errorWithCode:302 underlyingError:v60 description:@"Cannot get text-typed column name from table"];
                              v36 = 0;
                              *a7 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              v36 = 0;
                            }
                            goto LABEL_87;
                          }
                          id v75 = v60;
                          v61 = getColumnName(v43, (uint64_t)v41, @"INTEGER", &v75);
                          id v62 = v75;

                          if (v61)
                          {
                            if (v73 == 0x7FFFFFFFFFFFFFFFLL) {
                              uint64_t v63 = 1;
                            }
                            else {
                              uint64_t v63 = v73;
                            }
                            if (v72 == 0x7FFFFFFFFFFFFFFFLL)
                            {
                              id v74 = v62;
                              v64 = getColumnMaxValue(v43, (uint64_t)v41, (uint64_t)v61, &v74);
                              id v65 = v74;

                              if (!v64)
                              {
                                if (a7)
                                {
                                  +[FedStatsError errorWithCode:302 underlyingError:v65 description:@"Cannot get number of rows from database"];
                                  v36 = 0;
                                  *a7 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                else
                                {
                                  v36 = 0;
                                }
                                id v62 = v65;
                                v41 = v69;
                                v13 = v70;
                                goto LABEL_86;
                              }
                              unint64_t v72 = [v64 unsignedIntegerValue];

                              id v62 = v65;
                              v41 = v69;
                              v13 = v70;
                            }
                            v36 = (void *)[[v71 alloc] initWithSQLiteDatabase:v43 tableName:v41 categoryColumnName:v59 indexColumnName:v61 minIndex:v63 maxIndex:v72];
                          }
                          else if (a7)
                          {
                            +[FedStatsError errorWithCode:302 underlyingError:v62 description:@"Cannot get text-typed column name from table"];
                            v36 = 0;
                            *a7 = (id)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v36 = 0;
                          }
LABEL_86:

                          id v60 = v62;
LABEL_87:

                          id v40 = v60;
                          goto LABEL_79;
                        }
                      }

                      v41 = v69;
                      v13 = v70;
LABEL_75:
                      id v40 = v46;
                      goto LABEL_76;
                    }
                  }
                  v13 = v70;
                  goto LABEL_75;
                }
              }

              v41 = v69;
            }
            else
            {
            }
            id v40 = v46;
            goto LABEL_63;
          }
        }
      }
    }

    goto LABEL_21;
  }
  if (a7)
  {
    +[FedStatsError errorWithCode:302 description:@"SQLite categories database requires a path in URL"];
    v36 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
LABEL_26:

  return (FedStatsSQLiteCategoryDatabase *)v36;
}

- (id)encode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = NSString;
    BOOL v8 = [(FedStatsSQLiteCategoryDatabase *)self indexColumnName];
    v9 = [(FedStatsSQLiteCategoryDatabase *)self tableName];
    v10 = [(FedStatsSQLiteCategoryDatabase *)self categoryColumnName];
    v11 = [v7 stringWithFormat:@"SELECT %@ FROM '%@' WHERE %@ == '%@' ORDER BY RANDOM() LIMIT 1", v8, v9, v10, v6];

    id v12 = [(FedStatsSQLiteCategoryDatabase *)self sqliteDB];
    id v20 = 0;
    v13 = [v12 runQuery:v11 error:&v20];
    id v14 = v20;

    if (v13)
    {
      id v15 = [v13 next];
      if (v15)
      {
        id v16 = [(FedStatsSQLiteCategoryDatabase *)self indexColumnName];
        id v17 = [v15 objectForKey:v16];

        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") - -[FedStatsSQLiteCategoryDatabase minIndex](self, "minIndex") + 1);
        }
        else if (a4)
        {
          +[FedStatsError errorWithCode:900 description:@"Database columns are malformed"];
          v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
      }
      else
      {
        v18 = &unk_27000EDE8;
      }
    }
    else if (a4)
    {
      +[FedStatsError errorWithCode:401 underlyingError:v14 description:@"Failed to lookup category in the database"];
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:401 description:@"Input category should be a string"];
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)encodeCategories:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [NSString stringWithFormat:@"'%@'", *(void *)(*((void *)&v36 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v10);
  }

  id v14 = NSString;
  id v15 = [v7 componentsJoinedByString:@","];
  id v16 = [v14 stringWithFormat:@"(%@)", v15];

  id v17 = NSString;
  v18 = [(FedStatsSQLiteCategoryDatabase *)self tableName];
  v19 = [(FedStatsSQLiteCategoryDatabase *)self categoryColumnName];
  id v20 = [v17 stringWithFormat:@"SELECT * FROM '%@' WHERE %@ in %@", v18, v19, v16];

  v21 = [(FedStatsSQLiteCategoryDatabase *)self sqliteDB];
  id v35 = 0;
  uint64_t v22 = [v21 runQuery:v20 error:&v35];
  id v23 = v35;

  if (v22)
  {
    v24 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v25 = [v22 next];
    if (v25)
    {
      v26 = (void *)v25;
      id v33 = v23;
      id v34 = v16;
      do
      {
        v27 = [(FedStatsSQLiteCategoryDatabase *)self indexColumnName];
        id v28 = [v26 objectForKey:v27];

        v29 = [(FedStatsSQLiteCategoryDatabase *)self categoryColumnName];
        v30 = [v26 objectForKey:v29];

        [v24 setObject:v28 forKeyedSubscript:v30];
        uint64_t v31 = [v22 next];

        v26 = (void *)v31;
      }
      while (v31);
      id v23 = v33;
      id v16 = v34;
    }
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:401 underlyingError:v23 description:@"Failed to lookup categories in the database"];
    v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)decode:(unint64_t)a3 error:(id *)a4
{
  id v6 = NSString;
  v7 = [(FedStatsSQLiteCategoryDatabase *)self categoryColumnName];
  id v8 = [(FedStatsSQLiteCategoryDatabase *)self tableName];
  uint64_t v9 = [(FedStatsSQLiteCategoryDatabase *)self indexColumnName];
  uint64_t v10 = [v6 stringWithFormat:@"SELECT %@ FROM '%@' WHERE %@ == %lu ORDER BY RANDOM() LIMIT 1", v7, v8, v9, a3];

  uint64_t v11 = [(FedStatsSQLiteCategoryDatabase *)self sqliteDB];
  uint64_t v18 = 0;
  id v12 = [v11 runQuery:v10 error:&v18];

  if (v12)
  {
    v13 = [v12 next];
    if (v13)
    {
      id v14 = [(FedStatsSQLiteCategoryDatabase *)self categoryColumnName];
      id v15 = [v13 objectForKey:v14];

      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = @"FedStatsCategoricalDataOutOfBounds";
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)categoryDatabaseAt:(id)a3 withCategories:(id)a4 tableName:(id)a5 categoryColumnName:(id)a6 indexColumnName:(id)a7 error:(id *)a8
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a8)
    {
LABEL_23:
      +[FedStatsError errorWithCode:302 description:v34];
      id v35 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_36:
    id v35 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a8)
    {
      goto LABEL_23;
    }
    goto LABEL_36;
  }
  id v38 = v17;
  id v39 = v16;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a8)
          {
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }

          id v35 = 0;
          id v17 = v38;
          id v16 = v39;
          goto LABEL_37;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  id v43 = 0;
  id v23 = +[FedStatsSQLiteDatabase databaseWithURL:v13 mode:119 error:&v43];
  id v24 = v43;
  if (!v23)
  {
    id v17 = v38;
    id v16 = v39;
    if (a8)
    {
      *a8 = +[FedStatsError errorWithCode:302 underlyingError:v24 description:@"Cannot create new database"];
    }

    goto LABEL_36;
  }
  id v17 = v38;
  id v16 = v39;
  id v40 = v15;
  [NSString stringWithFormat:@"CREATE TABLE '%@' ('%@' INTEGER, '%@' TEXT, PRIMARY KEY('%@','%@')) WITHOUT ROWID", v15, v38, v39, v38, v39];
  long long v37 = v42[1] = v24;
  int v25 = objc_msgSend(v23, "execute:error:");
  id v26 = v24;

  uint64_t v41 = v23;
  if (v25)
  {
    v27 = 0;
    uint64_t v28 = 1;
    do
    {
      if (v28 - 1 >= (unint64_t)[v18 count])
      {
        int v33 = 0;
        goto LABEL_34;
      }
      v29 = NSString;
      uint64_t v30 = [v18 objectAtIndex:v28 - 1];
      uint64_t v31 = [v29 stringWithFormat:@"INSERT INTO '%@' VALUES (%lu, '%@')", v40, v28, v30];

      v42[0] = v26;
      LOBYTE(v30) = [v41 execute:v31 error:v42];
      id v32 = v42[0];

      ++v28;
      id v26 = v32;
      v27 = (void *)v31;
    }
    while ((v30 & 1) != 0);
    if (a8)
    {
      *a8 = +[FedStatsError errorWithCode:302 underlyingError:v32 description:@"Cannot insert elements into the table"];
    }
    int v33 = 1;
    id v26 = v32;
    v27 = (void *)v31;
LABEL_34:
    id v17 = v38;

    id v16 = v39;
    id v15 = v40;
  }
  else
  {
    if (a8)
    {
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v33 = 1;
    id v15 = v40;
  }

  if (v33) {
    goto LABEL_36;
  }
  id v35 = +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:](FedStatsSQLiteCategoryDatabase, "databaseWithFileURL:minIndex:maxIndex:checkForPrimaryKey:error:", v13, 1, [v18 count], 1, a8);
LABEL_37:

  return v35;
}

- (FedStatsSQLiteDatabase)sqliteDB
{
  return (FedStatsSQLiteDatabase *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)categoryColumnName
{
  return self->_categoryColumnName;
}

- (NSString)indexColumnName
{
  return self->_indexColumnName;
}

- (unint64_t)minIndex
{
  return self->_minIndex;
}

- (unint64_t)maxIndex
{
  return self->_maxIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexColumnName, 0);
  objc_storeStrong((id *)&self->_categoryColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_sqliteDB, 0);
}

@end