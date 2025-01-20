@interface GEOSQLiteVirtualTable
- (GEOSQLiteVirtualTable)init;
- (GEOSQLiteVirtualTable)initWithName:(id)a3;
- (NSString)columnDefinitions;
- (NSString)name;
- (sqlite3_module)module;
- (unint64_t)rowCount;
- (void)fetchValueForContext:(sqlite3_context *)a3 row:(unint64_t)a4 column:(unint64_t)a5;
@end

@implementation GEOSQLiteVirtualTable

- (GEOSQLiteVirtualTable)init
{
  result = (GEOSQLiteVirtualTable *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSQLiteVirtualTable)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOSQLiteVirtualTable;
  v5 = [(GEOSQLiteVirtualTable *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (sqlite3_module)module
{
  return (sqlite3_module *)&__GEOSQLiteVirtualTableModule;
}

- (NSString)columnDefinitions
{
  return (NSString *)&stru_1ED51F370;
}

- (unint64_t)rowCount
{
  return 0;
}

- (void)fetchValueForContext:(sqlite3_context *)a3 row:(unint64_t)a4 column:(unint64_t)a5
{
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end