@interface CKSQLiteCompiledStatementDecoder
- (BOOL)ck_isDecodingForCKSQLiteDatabase;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (CKSQLiteCompiledStatementDecoder)initWithStatement:(id)a3;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)decodeObjectForKey:(id)a3;
- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)fillProperties;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
@end

@implementation CKSQLiteCompiledStatementDecoder

- (CKSQLiteCompiledStatementDecoder)initWithStatement:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKSQLiteCompiledStatementDecoder;
  v6 = [(CKSQLiteCompiledStatementDecoder *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statement, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    propertyValues = v7->_propertyValues;
    v7->_propertyValues = v8;
  }
  return v7;
}

- (BOOL)ck_isDecodingForCKSQLiteDatabase
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  char v8 = objc_msgSend_BOOLValue(v4, v5, v6, v7);

  return v8;
}

- (double)decodeDoubleForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  objc_msgSend_doubleValue(v4, v5, v6, v7);
  double v9 = v8;

  return v9;
}

- (float)decodeFloatForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  objc_msgSend_floatValue(v4, v5, v6, v7);
  float v9 = v8;

  return v9;
}

- (int)decodeIntForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  int v8 = objc_msgSend_intValue(v4, v5, v6, v7);

  return v8;
}

- (int)decodeInt32ForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  int v8 = objc_msgSend_longValue(v4, v5, v6, v7);

  return v8;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  v4 = objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
  int64_t v8 = objc_msgSend_longLongValue(v4, v5, v6, v7);

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  return (id)objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a3, v3);
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  return (id)objc_msgSend_objectForKey_(self->_propertyValues, a2, (uint64_t)a4, (uint64_t)a4);
}

- (id)fillProperties
{
  objc_msgSend_removeAllObjects(self->_propertyValues, a2, v2, v3);
  statement = self->_statement;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B012928;
  v9[3] = &unk_1E54603C8;
  v9[4] = self;
  objc_msgSend_enumerateResultColumnsWithBlock_(statement, v6, (uint64_t)v9, v7);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyValues, 0);

  objc_storeStrong((id *)&self->_statement, 0);
}

@end