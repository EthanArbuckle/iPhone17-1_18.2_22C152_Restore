@interface SQLiteQueryResults
- (BOOL)hasRows;
- (NSNumber)firstNumberValue;
- (SQLiteQueryResults)initWithStatement:(id)a3;
- (int)clearBindings;
- (int64_t)firstInt64Value;
- (void)bindArray:(id)a3 atPosition:(int)a4;
- (void)bindData:(id)a3 atPosition:(int)a4;
- (void)bindDataCopy:(id)a3 atPosition:(int)a4;
- (void)bindDate:(id)a3 atPosition:(int)a4;
- (void)bindDictionary:(id)a3 atPosition:(int)a4;
- (void)bindDouble:(double)a3 atPosition:(int)a4;
- (void)bindFloat:(float)a3 atPosition:(int)a4;
- (void)bindInt64:(int64_t)a3 atPosition:(int)a4;
- (void)bindInt:(int)a3 atPosition:(int)a4;
- (void)bindNullAtPosition:(int)a3;
- (void)bindNumber:(id)a3 atPosition:(int)a4;
- (void)bindString:(id)a3 atPosition:(int)a4;
- (void)bindStringCopy:(id)a3 atPosition:(int)a4;
- (void)bindURL:(id)a3 atPosition:(int)a4;
- (void)bindUUID:(id)a3 atPosition:(int)a4;
- (void)enumerateRowsUsingBlock:(id)a3;
@end

@implementation SQLiteQueryResults

- (SQLiteQueryResults)initWithStatement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteQueryResults;
  v6 = [(SQLiteQueryResults *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statement, a3);
  }

  return v7;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [[SQLiteCursor alloc] initWithStatement:self->_statement];
  v6 = [(SQLiteStatement *)self->_statement sqlite3_stmt];
  v7 = [(SQLiteStatement *)self->_statement connection];
  id v17 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021814;
  v13[3] = &unk_100359F80;
  v16 = v6;
  id v8 = v4;
  id v15 = v8;
  objc_super v9 = v5;
  v14 = v9;
  unsigned int v10 = [v7 executeWithError:&v17 usingBlock:v13];
  id v11 = v17;

  if (v10)
  {
    [(SQLiteStatement *)self->_statement reset];
  }
  else
  {
    char v12 = 0;
    (*((void (**)(id, void, id, char *))v8 + 2))(v8, 0, v11, &v12);
  }
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
}

- (void).cxx_destruct
{
}

- (int64_t)firstInt64Value
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100081D0C;
  v4[3] = &unk_100359F58;
  v4[4] = &v5;
  [(SQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSNumber)firstNumberValue
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_100081E54;
  objc_super v9 = sub_100081E64;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100081E6C;
  v4[3] = &unk_100359F58;
  v4[4] = &v5;
  [(SQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (BOOL)hasRows
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100081F7C;
  v4[3] = &unk_100359F58;
  v4[4] = &v5;
  [(SQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)bindArray:(id)a3 atPosition:(int)a4
{
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindDate:(id)a3 atPosition:(int)a4
{
}

- (void)bindDictionary:(id)a3 atPosition:(int)a4
{
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
}

- (void)bindNullAtPosition:(int)a3
{
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindUUID:(id)a3 atPosition:(int)a4
{
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
}

- (int)clearBindings
{
  return [(SQLiteStatement *)self->_statement clearBindings];
}

@end