@interface DNDSIDSRecordMetadata
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (DNDSIDSRecordID)recordID;
- (DNDSIDSRecordMetadata)initWithRecordID:(id)a3 lastModified:(id)a4 deleted:(BOOL)a5;
- (NSDate)lastModified;
- (NSString)description;
- (id)_initWithRecordMetadata:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSIDSRecordMetadata

- (DNDSIDSRecordMetadata)initWithRecordID:(id)a3 lastModified:(id)a4 deleted:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDSIDSRecordMetadata;
  v10 = [(DNDSIDSRecordMetadata *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    recordID = v10->_recordID;
    v10->_recordID = (DNDSIDSRecordID *)v11;

    uint64_t v13 = [v9 copy];
    lastModified = v10->_lastModified;
    v10->_lastModified = (NSDate *)v13;

    v10->_deleted = a5;
  }

  return v10;
}

- (id)_initWithRecordMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordID];
  v6 = [v4 lastModified];
  uint64_t v7 = [v4 isDeleted];

  id v8 = [(DNDSIDSRecordMetadata *)self initWithRecordID:v5 lastModified:v6 deleted:v7];
  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDSIDSRecordID *)self->_recordID hash];
  return [(NSDate *)self->_lastModified hash] ^ v3 ^ self->_deleted;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = (DNDSIDSRecordMetadata *)a3;
  if (self == v7)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = [(DNDSIDSRecordMetadata *)self recordID];
      v10 = [(DNDSIDSRecordMetadata *)v8 recordID];
      if (v9 != v10)
      {
        uint64_t v11 = [(DNDSIDSRecordMetadata *)self recordID];
        if (!v11)
        {
          LOBYTE(v14) = 0;
          goto LABEL_28;
        }
        unint64_t v3 = (void *)v11;
        uint64_t v12 = [(DNDSIDSRecordMetadata *)v8 recordID];
        if (!v12)
        {
          LOBYTE(v14) = 0;
LABEL_27:

          goto LABEL_28;
        }
        id v4 = (void *)v12;
        uint64_t v13 = [(DNDSIDSRecordMetadata *)self recordID];
        v5 = [(DNDSIDSRecordMetadata *)v8 recordID];
        if (![v13 isEqual:v5])
        {
          LOBYTE(v14) = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = v5;
        v27 = v13;
        v28 = v4;
      }
      v15 = [(DNDSIDSRecordMetadata *)self lastModified];
      objc_super v16 = [(DNDSIDSRecordMetadata *)v8 lastModified];
      if (v15 == v16) {
        goto LABEL_16;
      }
      uint64_t v17 = [(DNDSIDSRecordMetadata *)self lastModified];
      if (!v17)
      {

        LOBYTE(v14) = 0;
        goto LABEL_25;
      }
      v5 = (void *)v17;
      uint64_t v18 = [(DNDSIDSRecordMetadata *)v8 lastModified];
      if (!v18)
      {
        LOBYTE(v14) = 0;
        goto LABEL_23;
      }
      v24 = (void *)v18;
      uint64_t v19 = [(DNDSIDSRecordMetadata *)self lastModified];
      uint64_t v20 = [(DNDSIDSRecordMetadata *)v8 lastModified];
      v25 = (void *)v19;
      v21 = (void *)v19;
      id v4 = (void *)v20;
      if ([v21 isEqual:v20])
      {
LABEL_16:
        BOOL v22 = [(DNDSIDSRecordMetadata *)self isDeleted];
        BOOL v14 = v22 ^ [(DNDSIDSRecordMetadata *)v8 isDeleted] ^ 1;
        if (v15 == v16)
        {

LABEL_24:
LABEL_25:
          uint64_t v13 = v27;
          id v4 = v28;
          v5 = v26;
          if (v9 != v10) {
            goto LABEL_26;
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }

LABEL_23:
      goto LABEL_24;
    }
    LOBYTE(v14) = 0;
  }
LABEL_29:

  return v14;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSIDSRecordMetadata *)self recordID];
  v6 = [(DNDSIDSRecordMetadata *)self lastModified];
  BOOL v7 = [(DNDSIDSRecordMetadata *)self isDeleted];
  id v8 = "NO";
  if (v7) {
    id v8 = "YES";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; recordID: %@; lastModified: %@; deleted: %s>",
    v4,
    self,
    v5,
    v6,
  id v9 = v8);

  return (NSString *)v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableIDSRecordMetadata alloc];
  return [(DNDSIDSRecordMetadata *)v4 _initWithRecordMetadata:self];
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v7, "bs_safeDictionaryForKey:", @"recordID");
  id v9 = +[DNDSIDSRecordID newWithDictionaryRepresentation:v8 context:v6];

  v10 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v11 = objc_msgSend(v7, "bs_safeNumberForKey:", @"lastModified");
  [v11 doubleValue];
  uint64_t v12 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");

  uint64_t v13 = objc_msgSend(v7, "bs_safeNumberForKey:", @"deleted");

  uint64_t v14 = [v13 BOOLValue];
  v15 = (void *)[objc_alloc((Class)a1) initWithRecordID:v9 lastModified:v12 deleted:v14];

  return v15;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"recordID";
  uint64_t v4 = [(DNDSIDSRecordID *)self->_recordID dictionaryRepresentationWithContext:a3];
  v11[0] = v4;
  v10[1] = @"lastModified";
  v5 = NSNumber;
  [(NSDate *)self->_lastModified timeIntervalSinceReferenceDate];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v11[1] = v6;
  v10[2] = @"deleted";
  id v7 = [NSNumber numberWithBool:self->_deleted];
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (DNDSIDSRecordID)recordID
{
  return self->_recordID;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end