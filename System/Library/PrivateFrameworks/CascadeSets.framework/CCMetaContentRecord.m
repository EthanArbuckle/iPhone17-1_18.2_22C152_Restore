@interface CCMetaContentRecord
+ (id)genSQLCreateStatements;
+ (id)recordFromDatabaseValueRow:(id)a3;
+ (id)tableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemRecord:(id)a3;
- (CCMetaContentRecord)init;
- (CCMetaContentRecord)initWithDatabaseValueRow:(id)a3;
- (NSData)metaContent;
- (NSNumber)instanceHash;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation CCMetaContentRecord

- (CCMetaContentRecord)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (id)recordFromDatabaseValueRow:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDatabaseValueRow:v3];

  return v4;
}

+ (id)genSQLCreateStatements
{
  v5[1] = *MEMORY[0x263EF8340];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer NOT NULL, \"%@\" blob NOT NULL, PRIMARY KEY (\"%@\"));",
    @"metacontent",
    @"instance_hash",
    @"metacontent",
  id v2 = @"instance_hash");
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)tableName
{
  return @"metacontent";
}

- (CCMetaContentRecord)initWithDatabaseValueRow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCMetaContentRecord;
  v5 = [(CCMetaContentRecord *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 numberValueAtColumnIndex:0];
    instanceHash = v5->_instanceHash;
    v5->_instanceHash = (NSNumber *)v6;

    uint64_t v8 = [v4 dataValueAtColumnIndex:1];
    metaContent = v5->_metaContent;
    v5->_metaContent = (NSData *)v8;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCMetaContentRecord;
  id v3 = [(CCMetaContentRecord *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" metaContent length: %lu, instanceHash: %@", -[NSData length](self->_metaContent, "length"), self->_instanceHash];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCMetaContentRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCMetaContentRecord *)self isEqualToItemRecord:v5];

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    instanceHash = self->_instanceHash;
    v7 = [v4 instanceHash];
    if ([(NSNumber *)instanceHash isEqual:v7])
    {
      metaContent = self->_metaContent;
      v9 = [v5 metaContent];
      char v10 = [(NSData *)metaContent isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_instanceHash hash];
  return [(NSData *)self->_metaContent hash] ^ v3;
}

- (NSNumber)instanceHash
{
  return self->_instanceHash;
}

- (NSData)metaContent
{
  return self->_metaContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContent, 0);

  objc_storeStrong((id *)&self->_instanceHash, 0);
}

@end