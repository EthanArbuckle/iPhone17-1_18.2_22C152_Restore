@interface PDDatabaseRow
- (PDDatabaseRow)initWithSQLiteRow:(PDSQLiteRow *)a3;
- (PDSQLiteRow)SQLiteRow;
- (void)setSQLiteRow:(PDSQLiteRow *)a3;
@end

@implementation PDDatabaseRow

- (void).cxx_destruct
{
}

- (void)setSQLiteRow:(PDSQLiteRow *)a3
{
  self->_SQLiteRow = a3;
}

- (PDDatabaseRow)initWithSQLiteRow:(PDSQLiteRow *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDDatabaseRow;
  result = [(PDDatabaseRow *)&v5 init];
  if (result) {
    result->_SQLiteRow = a3;
  }
  return result;
}

- (PDSQLiteRow)SQLiteRow
{
  return self->_SQLiteRow;
}

@end