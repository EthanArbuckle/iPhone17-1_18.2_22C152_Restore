@interface ASUSQLiteQueryResults
- (BOOL)hasRows;
- (NSNumber)firstNumberValue;
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

@implementation ASUSQLiteQueryResults

- (void)enumerateRowsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = sub_100165124((int *)[ASUSQLiteCursor alloc], self->_statement);
  uint64_t v6 = sub_100166A0C((uint64_t)self->_statement);
  v7 = sub_100166A00((uint64_t)self->_statement);
  id v17 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10017011C;
  v13[3] = &unk_100636118;
  uint64_t v16 = v6;
  id v8 = v4;
  id v15 = v8;
  v9 = v5;
  v14 = v9;
  int v10 = sub_10016F230((uint64_t)v7, &v17, v13);
  id v11 = v17;

  if (v10)
  {
    [(ASUSQLiteStatement *)self->_statement reset];
  }
  else
  {
    char v12 = 0;
    (*((void (**)(id, void, id, char *))v8 + 2))(v8, 0, v11, &v12);
  }
}

- (int64_t)firstInt64Value
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100170238;
  v4[3] = &unk_100636050;
  v4[4] = &v5;
  [(ASUSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSNumber)firstNumberValue
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_100170380;
  v9 = sub_100170390;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100170398;
  v4[3] = &unk_100636050;
  v4[4] = &v5;
  [(ASUSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

- (BOOL)hasRows
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001704A8;
  v4[3] = &unk_100636050;
  v4[4] = &v5;
  [(ASUSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
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

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
}

- (void)bindString:(id)a3 atPosition:(int)a4
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
  return [(ASUSQLiteStatement *)self->_statement clearBindings];
}

- (void).cxx_destruct
{
}

@end