@interface CCContentRecord
+ (id)genSQLCreateStatements;
+ (id)recordFromDatabaseValueRow:(id)a3;
+ (id)tableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemRecord:(id)a3;
- (CCContentRecord)init;
- (CCContentRecord)initWithDatabaseValueRow:(id)a3;
- (NSData)content;
- (NSNumber)contentHash;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation CCContentRecord

- (CCContentRecord)init
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
    @"content",
    @"content_hash",
    @"content",
  id v2 = @"content_hash");
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)tableName
{
  return @"content";
}

- (CCContentRecord)initWithDatabaseValueRow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCContentRecord;
  v5 = [(CCContentRecord *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 numberValueAtColumnIndex:0];
    contentHash = v5->_contentHash;
    v5->_contentHash = (NSNumber *)v6;

    uint64_t v8 = [v4 dataValueAtColumnIndex:1];
    content = v5->_content;
    v5->_content = (NSData *)v8;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCContentRecord;
  id v3 = [(CCContentRecord *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" contentHash: %@, content length: %lu", self->_contentHash, -[NSData length](self->_content, "length")];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCContentRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCContentRecord *)self isEqualToItemRecord:v5];

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    contentHash = self->_contentHash;
    v7 = [v4 contentHash];
    if ([(NSNumber *)contentHash isEqual:v7])
    {
      content = self->_content;
      v9 = [v5 content];
      char v10 = [(NSData *)content isEqual:v9];
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
  uint64_t v3 = [(NSNumber *)self->_contentHash hash];
  return [(NSData *)self->_content hash] ^ v3;
}

- (NSNumber)contentHash
{
  return self->_contentHash;
}

- (NSData)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_contentHash, 0);
}

@end