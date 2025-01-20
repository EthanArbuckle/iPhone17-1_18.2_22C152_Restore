@interface CCInstanceRecord
+ (id)genSQLCreateStatements;
+ (id)recordFromDatabaseValueRow:(id)a3;
+ (id)tableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemRecord:(id)a3;
- (CCInstanceRecord)init;
- (CCInstanceRecord)initWithDatabaseValueRow:(id)a3;
- (NSNumber)modified;
- (NSNumber)provenanceRowId;
- (NSNumber)sourceItemIdHash;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation CCInstanceRecord

- (CCInstanceRecord)init
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
  v6[2] = *MEMORY[0x263EF8340];
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE TABLE IF NOT EXISTS \"%@\" (\"%@\" integer NOT NULL, \"%@\" integer NOT NULL, \"%@\" integer NOT NULL, PRIMARY KEY (\"%@\") FOREIGN KEY (\"%@\") REFERENCES \"%@\" (\"%@\") ON UPDATE CASCADE ON DELETE CASCADE);",
    @"instance",
    @"source_item_id_hash",
    @"provenance_row_id",
    @"modified",
    @"source_item_id_hash",
    @"provenance_row_id",
    @"provenance",
  id v2 = @"provenance_row_id");
  v6[0] = v2;
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX \"%@\" ON \"%@\" (\"%@\" ASC);",
    @"idx_instance_modified",
    @"instance",
  id v3 = @"modified");
  v6[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)tableName
{
  return @"instance";
}

- (CCInstanceRecord)initWithDatabaseValueRow:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCInstanceRecord;
  v5 = [(CCInstanceRecord *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 numberValueAtColumnIndex:0];
    sourceItemIdHash = v5->_sourceItemIdHash;
    v5->_sourceItemIdHash = (NSNumber *)v6;

    uint64_t v8 = [v4 numberValueAtColumnIndex:1];
    provenanceRowId = v5->_provenanceRowId;
    v5->_provenanceRowId = (NSNumber *)v8;

    uint64_t v10 = [v4 numberValueAtColumnIndex:2];
    modified = v5->_modified;
    v5->_modified = (NSNumber *)v10;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CCInstanceRecord;
  id v3 = [(CCInstanceRecord *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@"sourceItemIdHash: %@, provenanceRowId: %@, modified: %@", self->_sourceItemIdHash, self->_provenanceRowId, self->_modified];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCInstanceRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCInstanceRecord *)self isEqualToItemRecord:v5];

  return v6;
}

- (BOOL)isEqualToItemRecord:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sourceItemIdHash = self->_sourceItemIdHash;
    v7 = [v4 sourceItemIdHash];
    if ([(NSNumber *)sourceItemIdHash isEqual:v7])
    {
      provenanceRowId = self->_provenanceRowId;
      v9 = [v5 provenanceRowId];
      if ([(NSNumber *)provenanceRowId isEqual:v9])
      {
        modified = self->_modified;
        v11 = [v5 modified];
        char v12 = [(NSNumber *)modified isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_sourceItemIdHash hash];
  uint64_t v4 = [(NSNumber *)self->_provenanceRowId hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_modified hash];
}

- (NSNumber)sourceItemIdHash
{
  return self->_sourceItemIdHash;
}

- (NSNumber)provenanceRowId
{
  return self->_provenanceRowId;
}

- (NSNumber)modified
{
  return self->_modified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_provenanceRowId, 0);

  objc_storeStrong((id *)&self->_sourceItemIdHash, 0);
}

@end