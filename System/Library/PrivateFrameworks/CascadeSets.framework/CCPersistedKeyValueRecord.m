@interface CCPersistedKeyValueRecord
+ (id)genSQLCreateStatements;
+ (id)recordFromDatabaseValueRow:(id)a3;
+ (id)tableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetadataRecord:(id)a3;
- (CCPersistedKeyValueRecord)init;
- (CCPersistedKeyValueRecord)initWithDatabaseValueRow:(id)a3;
- (NSData)dataValue;
- (NSNumber)integerValue;
- (NSString)description;
- (NSString)key;
- (NSString)stringValue;
- (unint64_t)hash;
@end

@implementation CCPersistedKeyValueRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_integerValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDatabaseValueRow:v3];

  return v4;
}

- (CCPersistedKeyValueRecord)initWithDatabaseValueRow:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CCPersistedKeyValueRecord;
  v5 = [(CCPersistedKeyValueRecord *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringValueAtColumnIndex:0];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 stringValueAtColumnIndex:1];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v8;

    uint64_t v10 = [v4 numberValueAtColumnIndex:2];
    integerValue = v5->_integerValue;
    v5->_integerValue = (NSNumber *)v10;

    uint64_t v12 = [v4 dataValueAtColumnIndex:3];
    dataValue = v5->_dataValue;
    v5->_dataValue = (NSData *)v12;
  }
  return v5;
}

- (NSNumber)integerValue
{
  return self->_integerValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (CCPersistedKeyValueRecord)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (id)genSQLCreateStatements
{
  v5[1] = *MEMORY[0x263EF8340];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" varchar PRIMARY KEY, \"%@\" varchar NULLABLE, \"%@\" integer NULLABLE, \"%@\" blob NULLABLE, CHECK ((CASE WHEN \"%@\" IS NULL THEN 0 ELSE 1 END + CASE WHEN \"%@\" IS NULL THEN 0 ELSE 1 END + CASE WHEN \"%@\" IS NULL THEN 0 ELSE 1 END) = 1));",
    @"keyvalue",
    @"key",
    @"string_value",
    @"integer_value",
    @"data_value",
    @"string_value",
    @"integer_value",
  id v2 = @"data_value");
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)tableName
{
  return @"keyvalue";
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCPersistedKeyValueRecord;
  id v3 = [(CCPersistedKeyValueRecord *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" key: %@, stringValue: %@ integerValue: %@ dataValue: %@", self->_key, self->_stringValue, self->_integerValue, self->_dataValue];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCPersistedKeyValueRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCPersistedKeyValueRecord *)self isEqualToMetadataRecord:v5];

  return v6;
}

- (BOOL)isEqualToMetadataRecord:(id)a3
{
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    char v12 = 0;
    goto LABEL_43;
  }
  key = self->_key;
  v9 = key;
  if (!key)
  {
    uint64_t v10 = [v6 key];
    if (!v10)
    {
      v34 = 0;
      int v11 = 0;
      goto LABEL_10;
    }
    v34 = (void *)v10;
    v9 = self->_key;
  }
  id v3 = [v7 key];
  if (([(NSString *)v9 isEqual:v3] & 1) == 0)
  {

    char v12 = 0;
    goto LABEL_41;
  }
  int v11 = 1;
LABEL_10:
  stringValue = self->_stringValue;
  v14 = stringValue;
  if (!stringValue)
  {
    uint64_t v15 = [v7 stringValue];
    if (!v15)
    {
      v32 = 0;
      int v16 = 0;
      goto LABEL_17;
    }
    v32 = (void *)v15;
    v14 = self->_stringValue;
  }
  id v4 = [v7 stringValue];
  if (([(NSString *)v14 isEqual:v4] & 1) == 0)
  {

    char v12 = 0;
    goto LABEL_38;
  }
  int v16 = 1;
LABEL_17:
  integerValue = self->_integerValue;
  v18 = integerValue;
  if (!integerValue)
  {
    uint64_t v19 = [v7 integerValue];
    if (!v19)
    {
      int v30 = 0;
      int v31 = v11;
      v28 = 0;
LABEL_24:
      dataValue = self->_dataValue;
      v21 = dataValue;
      if (!dataValue)
      {
        uint64_t v22 = [v7 dataValue];
        if (!v22)
        {
          v25 = 0;
          char v12 = 1;
          goto LABEL_33;
        }
        v27 = (void *)v22;
        v21 = self->_dataValue;
      }
      v29 = v4;
      int v23 = v16;
      v24 = [v7 dataValue];
      char v12 = [(NSData *)v21 isEqual:v24];

      int v16 = v23;
      if (dataValue)
      {
        if (!v30)
        {
          int v11 = v31;
          id v4 = v29;
          goto LABEL_35;
        }
        int v11 = v31;
        id v4 = v29;
        goto LABEL_34;
      }
      id v4 = v29;
      v25 = v27;
LABEL_33:

      int v11 = v31;
      if ((v30 & 1) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    v28 = (void *)v19;
    v18 = self->_integerValue;
  }
  v33 = [v7 integerValue];
  if (-[NSNumber isEqual:](v18, "isEqual:"))
  {
    int v30 = 1;
    int v31 = v11;
    goto LABEL_24;
  }
  char v12 = 0;
LABEL_34:

LABEL_35:
  if (integerValue)
  {
    if (!v16) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }

  if (v16) {
LABEL_37:
  }

LABEL_38:
  if (stringValue)
  {
    if (!v11) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }

  if (v11) {
LABEL_40:
  }

LABEL_41:
  if (!key) {

  }
LABEL_43:
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_stringValue hash] ^ v3;
  uint64_t v5 = [(NSNumber *)self->_integerValue hash];
  return v4 ^ v5 ^ [(NSData *)self->_dataValue hash];
}

- (NSString)key
{
  return self->_key;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

@end