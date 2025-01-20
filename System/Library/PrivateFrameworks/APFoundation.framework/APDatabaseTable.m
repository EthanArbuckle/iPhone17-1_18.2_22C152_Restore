@interface APDatabaseTable
- (APDatabaseManager)manager;
- (APDatabaseTable)initWithDatabaseManager:(id)a3;
- (BOOL)_tableExists;
- (Class)rowClass;
- (NSString)tableName;
- (id)selectAll;
@end

@implementation APDatabaseTable

- (APDatabaseTable)initWithDatabaseManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDatabaseTable;
  v5 = [(APDatabaseTable *)&v9 init];
  v6 = v5;
  if (v5 && (objc_storeWeak((id *)&v5->_manager, v4), ![(APDatabaseTable *)v6 _tableExists])) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (APDatabaseManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (APDatabaseManager *)WeakRetained;
}

- (NSString)tableName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (Class)rowClass
{
  APSimulateCrash(5, @"Error: Path 'rowClass' to be implemented for each subclass.", 0);
  return (Class)objc_opt_class();
}

- (id)selectAll
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(APDatabaseTable *)self manager];
  if (v3)
  {
    id v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v4 stringWithFormat:@"SELECT rowid, * FROM %@", v6];

    v8 = [v3 executeSelectQuery:v7 forTable:self withParameters:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    objc_super v9 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v13 = (id)objc_opt_class();
      id v10 = v13;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to select all.", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)_tableExists
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(APDatabaseTable *)self manager];
  if (v3)
  {
    id v4 = [APDatabaseColumn alloc];
    v5 = [(APDatabaseTable *)self tableName];
    v6 = [(APDatabaseColumn *)v4 initWithName:@"name" forColumnType:3 withValue:v5];

    v12 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v8 = [v3 executeSelectStringsQuery:@"SELECT name FROM sqlite_master WHERE type='table' AND name=?" withParameters:v7];

    BOOL v9 = [v8 count] != 0;
  }
  else
  {
    v6 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v10 = v14;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to select all.", buf, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end