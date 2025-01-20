@interface SGReminderMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReminderMetadata:(id)a3;
- (NSString)sourceUniqueIdentifier;
- (SGRecordId)recordId;
- (SGReminderMetadata)initWithCoder:(id)a3;
- (SGReminderMetadata)initWithRecordId:(id)a3 sourceUniqueIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGReminderMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_recordId, 0);
}

- (NSString)sourceUniqueIdentifier
{
  return self->_sourceUniqueIdentifier;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (BOOL)isEqualToReminderMetadata:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  recordId = self->_recordId;
  v7 = (SGRecordId *)*((id *)v4 + 1);
  if (recordId == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = recordId;
    BOOL v10 = [(SGRecordId *)v9 isEqual:v8];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_sourceUniqueIdentifier;
  v13 = v12;
  if (v12 == (NSString *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSString isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGReminderMetadata *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGReminderMetadata *)self isEqualToReminderMetadata:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    id v6 = [(SGRecordId *)self->_recordId copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_sourceUniqueIdentifier copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;
  }
  return v5;
}

- (SGReminderMetadata)initWithCoder:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGReminderMetadata;
  id v6 = [(SGReminderMetadata *)&v15 init];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"recordId"];

    if (v8)
    {
      v9 = v8;
      recordId = v6->_recordId;
      v6->_recordId = v9;
    }
    else
    {
      recordId = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(recordId, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGReminderMetadata.m", 54, @"nonnull property %s *%s was null when decoded", "SGRecordId", "recordId");
    }

    char v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v5 decodeObjectOfClasses:v11 forKey:@"sourceUniqueIdentifier"];
    sourceUniqueIdentifier = v6->_sourceUniqueIdentifier;
    v6->_sourceUniqueIdentifier = (NSString *)v12;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  recordId = self->_recordId;
  id v5 = a3;
  [v5 encodeObject:recordId forKey:@"recordId"];
  [v5 encodeObject:self->_sourceUniqueIdentifier forKey:@"sourceUniqueIdentifier"];
}

- (unint64_t)hash
{
  unint64_t v3 = [(SGRecordId *)self->_recordId hash];
  return [(NSString *)self->_sourceUniqueIdentifier hash] - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGReminderMetadata recordId: %@ sourceUniqueIdentifier: %@>", self->_recordId, self->_sourceUniqueIdentifier];

  return v2;
}

- (SGReminderMetadata)initWithRecordId:(id)a3 sourceUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGReminderMetadata;
  v9 = [(SGReminderMetadata *)&v12 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordId, a3);
    objc_storeStrong((id *)&v10->_sourceUniqueIdentifier, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end