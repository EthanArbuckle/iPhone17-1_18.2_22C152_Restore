@interface ADIDRecord
- (ADIDRecord)init;
- (ADIDRecord)initWithID:(id)a3;
- (BOOL)dirty;
- (BOOL)isEqual:(id)a3;
- (NSData)encryptedID;
- (NSString)ID;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setDirty:(BOOL)a3;
- (void)setEncryptedID:(id)a3;
- (void)setID:(id)a3;
@end

@implementation ADIDRecord

- (ADIDRecord)initWithID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADIDRecord;
  v5 = [(ADIDRecord *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    ID = v5->_ID;
    v5->_ID = (NSString *)v6;

    v5->_dirty = 1;
  }

  return v5;
}

- (NSString)ID
{
  return self->_ID;
}

- (ADIDRecord)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADIDRecord;
  v2 = [(ADIDRecord *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    ID = v2->_ID;
    v2->_ID = (NSString *)v4;

    v2->_dirty = 1;
  }
  return v2;
}

- (void)setID:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_ID, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_ID, a3);
    self->_dirty = 1;
  }
}

- (NSData)encryptedID
{
  encryptedID = self->_encryptedID;
  if (!encryptedID)
  {
    ADEncryptString(self->_ID);
    uint64_t v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_encryptedID;
    self->_encryptedID = v4;

    encryptedID = self->_encryptedID;
  }
  return encryptedID;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_ID forKeyedSubscript:@"kADiAdIDRecord_iAdIDKey"];
  return v3;
}

- (id)description
{
  return self->_ID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ADIDRecord *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    objc_super v7 = [(ADIDRecord *)self ID];
    v8 = [(ADIDRecord *)v6 ID];

    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
LABEL_5:
    char v9 = 0;
  }
LABEL_7:

  return v9;
}

- (void)setEncryptedID:(id)a3
{
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end