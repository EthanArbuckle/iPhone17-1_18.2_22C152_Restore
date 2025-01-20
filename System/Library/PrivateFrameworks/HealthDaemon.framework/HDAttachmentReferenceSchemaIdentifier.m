@interface HDAttachmentReferenceSchemaIdentifier
+ (id)tombstoneSchemaIdentifier;
- (BOOL)isEqual:(id)a3;
- (HDAttachmentReferenceSchemaIdentifier)initWithSchemaIdentifier:(id)a3 schemaVersion:(int64_t)a4 objectIdentifier:(id)a5 attachmentIdentifier:(id)a6;
- (NSString)objectIdentifier;
- (NSString)schemaIdentifier;
- (NSUUID)attachmentIdentifier;
- (int64_t)schemaVersion;
- (unint64_t)hash;
@end

@implementation HDAttachmentReferenceSchemaIdentifier

- (HDAttachmentReferenceSchemaIdentifier)initWithSchemaIdentifier:(id)a3 schemaVersion:(int64_t)a4 objectIdentifier:(id)a5 attachmentIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDAttachmentReferenceSchemaIdentifier;
  v14 = [(HDAttachmentReferenceSchemaIdentifier *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_schemaIdentifier, a3);
    v15->_schemaVersion = a4;
    objc_storeStrong((id *)&v15->_objectIdentifier, a5);
    objc_storeStrong((id *)&v15->_attachmentIdentifier, a6);
  }

  return v15;
}

+ (id)tombstoneSchemaIdentifier
{
  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  v4 = [(HDAttachmentReferenceSchemaIdentifier *)v2 initWithSchemaIdentifier:&stru_1F1728D60 schemaVersion:0 objectIdentifier:&stru_1F1728D60 attachmentIdentifier:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    schemaIdentifier = self->_schemaIdentifier;
    v8 = [v6 schemaIdentifier];
    if (schemaIdentifier == v8)
    {
      int64_t schemaVersion = self->_schemaVersion;
      if (schemaVersion == [v6 schemaVersion]) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v9 = [v6 schemaIdentifier];
      if (v9)
      {
        v3 = (void *)v9;
        v10 = self->_schemaIdentifier;
        id v11 = [v6 schemaIdentifier];
        if (([(NSString *)v10 isEqual:v11] & 1) == 0
          || (int64_t v12 = self->_schemaVersion, v12 != [v6 schemaVersion]))
        {
          char v13 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v35 = v11;
LABEL_9:
        objectIdentifier = self->_objectIdentifier;
        v16 = [v6 objectIdentifier];
        if (objectIdentifier == v16)
        {
          v34 = objectIdentifier;
        }
        else
        {
          uint64_t v17 = [v6 objectIdentifier];
          if (!v17)
          {
            char v13 = 0;
            goto LABEL_26;
          }
          v18 = (void *)v17;
          v19 = self->_objectIdentifier;
          uint64_t v20 = [v6 objectIdentifier];
          v21 = v19;
          v22 = (void *)v20;
          if (([(NSString *)v21 isEqual:v20] & 1) == 0)
          {

            char v13 = 0;
            goto LABEL_27;
          }
          v31 = v22;
          v33 = v18;
          v34 = objectIdentifier;
        }
        attachmentIdentifier = self->_attachmentIdentifier;
        uint64_t v24 = objc_msgSend(v6, "attachmentIdentifier", v31);
        char v13 = attachmentIdentifier == (NSUUID *)v24;
        if (attachmentIdentifier == (NSUUID *)v24)
        {
        }
        else
        {
          v25 = (void *)v24;
          uint64_t v26 = [v6 attachmentIdentifier];
          if (v26)
          {
            v27 = (void *)v26;
            v28 = self->_attachmentIdentifier;
            v29 = [v6 attachmentIdentifier];
            char v13 = [(NSUUID *)v28 isEqual:v29];

            if (v34 == v16)
            {

              goto LABEL_27;
            }
            goto LABEL_25;
          }
        }
        if (v34 != v16)
        {
LABEL_25:
        }
LABEL_26:

LABEL_27:
        id v11 = v35;
        if (schemaIdentifier != v8) {
          goto LABEL_28;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v13 = 0;
    goto LABEL_29;
  }
  char v13 = 0;
LABEL_30:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_schemaIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_objectIdentifier hash] ^ v3;
  return v4 ^ [(NSUUID *)self->_attachmentIdentifier hash];
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSUUID)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);

  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
}

@end