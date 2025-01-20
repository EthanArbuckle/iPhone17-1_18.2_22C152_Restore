@interface HDAttachmentReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDAttachmentReference)initWithCoder:(id)a3;
- (HDAttachmentReference)initWithIdentifier:(id)a3 schemaIdentifier:(id)a4 creationDate:(id)a5 options:(int64_t)a6 metadata:(id)a7;
- (HDAttachmentReference)initWithIdentifier:(id)a3 schemaIdentifier:(id)a4 creationDate:(id)a5 options:(int64_t)a6 metadata:(id)a7 type:(int64_t)a8 cloudStatus:(int64_t)a9;
- (HDAttachmentReference)referenceWithObjectIdentifier:(id)a3;
- (NSDate)creationDate;
- (NSDictionary)metadata;
- (NSString)objectIdentifier;
- (NSString)schemaIdentifier;
- (NSUUID)attachmentIdentifier;
- (NSUUID)identifier;
- (id)hkAttachmentReferenceWithAttachment:(id)a3;
- (int64_t)cloudStatus;
- (int64_t)options;
- (int64_t)schemaVersion;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDAttachmentReference

- (HDAttachmentReference)initWithIdentifier:(id)a3 schemaIdentifier:(id)a4 creationDate:(id)a5 options:(int64_t)a6 metadata:(id)a7
{
  return [(HDAttachmentReference *)self initWithIdentifier:a3 schemaIdentifier:a4 creationDate:a5 options:a6 metadata:a7 type:0 cloudStatus:0];
}

- (HDAttachmentReference)initWithIdentifier:(id)a3 schemaIdentifier:(id)a4 creationDate:(id)a5 options:(int64_t)a6 metadata:(id)a7 type:(int64_t)a8 cloudStatus:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDAttachmentReference;
  v20 = [(HDAttachmentReference *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    uint64_t v22 = [v17 schemaIdentifier];
    schemaIdentifier = v21->_schemaIdentifier;
    v21->_schemaIdentifier = (NSString *)v22;

    v21->_schemaVersion = [v17 schemaVersion];
    uint64_t v24 = [v17 objectIdentifier];
    objectIdentifier = v21->_objectIdentifier;
    v21->_objectIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 attachmentIdentifier];
    attachmentIdentifier = v21->_attachmentIdentifier;
    v21->_attachmentIdentifier = (NSUUID *)v26;

    objc_storeStrong((id *)&v21->_creationDate, a5);
    v21->_options = a6;
    objc_storeStrong((id *)&v21->_metadata, a7);
    v21->_type = a8;
    v21->_cloudStatus = a9;
  }

  return v21;
}

- (HDAttachmentReference)referenceWithObjectIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[HDAttachmentReferenceSchemaIdentifier alloc] initWithSchemaIdentifier:self->_schemaIdentifier schemaVersion:self->_schemaVersion objectIdentifier:v4 attachmentIdentifier:self->_attachmentIdentifier];

  v6 = [HDAttachmentReference alloc];
  v7 = [MEMORY[0x1E4F29128] UUID];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  v9 = [(HDAttachmentReference *)v6 initWithIdentifier:v7 schemaIdentifier:v5 creationDate:v8 options:self->_options metadata:self->_metadata type:self->_type cloudStatus:0];

  return v9;
}

- (id)hkAttachmentReferenceWithAttachment:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F2AC10];
  id v5 = a3;
  id v6 = [v4 alloc];
  identifier = self->_identifier;
  objectIdentifier = self->_objectIdentifier;
  v9 = [v5 hkAttachment];

  v10 = (void *)[v6 _initWithIdentifier:identifier objectIdentifier:objectIdentifier attachment:v9 creationDate:self->_creationDate metadata:self->_metadata];

  return v10;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HDAttachmentReference *)a3;
  if (self == v5)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      identifier = self->_identifier;
      v8 = [(HDAttachmentReference *)v6 identifier];
      if (![(NSUUID *)identifier isEqual:v8])
      {
        BOOL v14 = 0;
LABEL_36:

        goto LABEL_37;
      }
      schemaIdentifier = self->_schemaIdentifier;
      v10 = [(HDAttachmentReference *)v6 schemaIdentifier];
      if (schemaIdentifier != v10)
      {
        uint64_t v11 = [(HDAttachmentReference *)v6 schemaIdentifier];
        if (!v11)
        {
          BOOL v14 = 0;
          goto LABEL_35;
        }
        v12 = (void *)v11;
        v13 = self->_schemaIdentifier;
        v3 = [(HDAttachmentReference *)v6 schemaIdentifier];
        if (![(NSString *)v13 isEqualToString:v3])
        {
          BOOL v14 = 0;
LABEL_34:

          goto LABEL_35;
        }
        v43 = v12;
      }
      objectIdentifier = self->_objectIdentifier;
      id v16 = [(HDAttachmentReference *)v6 objectIdentifier];
      if (objectIdentifier == v16)
      {
        v42 = v3;
      }
      else
      {
        uint64_t v17 = [(HDAttachmentReference *)v6 objectIdentifier];
        if (!v17)
        {
          BOOL v14 = 0;
          v12 = v43;
          goto LABEL_33;
        }
        v41 = (void *)v17;
        id v18 = self->_objectIdentifier;
        uint64_t v19 = [(HDAttachmentReference *)v6 objectIdentifier];
        v20 = v18;
        v21 = (void *)v19;
        if (![(NSString *)v20 isEqualToString:v19])
        {

          BOOL v14 = 0;
          v12 = v43;
          if (schemaIdentifier == v10) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        v39 = v21;
        v42 = v3;
      }
      attachmentIdentifier = self->_attachmentIdentifier;
      v23 = [(HDAttachmentReference *)v6 attachmentIdentifier];
      if (![(NSUUID *)attachmentIdentifier isEqual:v23])
      {

        BOOL v14 = 0;
LABEL_31:
        if (objectIdentifier == v16)
        {

          v3 = v42;
          v12 = v43;
          if (schemaIdentifier == v10) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }

        v3 = v42;
        v12 = v43;
LABEL_33:

        if (schemaIdentifier != v10) {
          goto LABEL_34;
        }
LABEL_35:

        goto LABEL_36;
      }
      creationDate = self->_creationDate;
      v40 = [(HDAttachmentReference *)v6 creationDate];
      if (-[NSDate isEqualToDate:](creationDate, "isEqualToDate:")
        && (int64_t options = self->_options, options == [(HDAttachmentReference *)v6 options]))
      {
        metadata = self->_metadata;
        v27 = metadata;
        if (metadata) {
          goto LABEL_23;
        }
        uint64_t v28 = [(HDAttachmentReference *)v6 metadata];
        if (v28)
        {
          uint64_t v35 = v28;
          v27 = self->_metadata;
LABEL_23:
          v37 = metadata;
          objc_super v29 = v27;
          v38 = [(HDAttachmentReference *)v6 metadata];
          if (-[NSDictionary isEqualToDictionary:](v29, "isEqualToDictionary:")
            && (int64_t type = self->_type, type == [(HDAttachmentReference *)v6 type]))
          {
            int64_t cloudStatus = self->_cloudStatus;
            BOOL v14 = cloudStatus == [(HDAttachmentReference *)v6 cloudStatus];
          }
          else
          {
            BOOL v14 = 0;
          }

          if (!v37) {
          goto LABEL_30;
          }
        }
        int64_t v33 = self->_type;
        if (v33 == [(HDAttachmentReference *)v6 type])
        {
          int64_t v34 = self->_cloudStatus;
          BOOL v14 = v34 == [(HDAttachmentReference *)v6 cloudStatus];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
LABEL_30:

      goto LABEL_31;
    }
    BOOL v14 = 0;
  }
LABEL_37:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_schemaIdentifier forKey:@"SchemaIdentifier"];
  [v5 encodeInteger:self->_schemaVersion forKey:@"SchemaVersion"];
  [v5 encodeObject:self->_objectIdentifier forKey:@"ObjectIdentifier"];
  [v5 encodeObject:self->_attachmentIdentifier forKey:@"AttachmentIdentifier"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeInteger:self->_options forKey:@"Options"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
  [v5 encodeInteger:self->_type forKey:@"Type"];
  [v5 encodeInteger:self->_cloudStatus forKey:@"CloudStatus"];
}

- (HDAttachmentReference)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SchemaIdentifier"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"SchemaVersion"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ObjectIdentifier"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AttachmentIdentifier"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"Options"];
  v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureAttachmentCodingClasses");
  uint64_t v11 = [v3 decodeObjectOfClasses:v10 forKey:@"Metadata"];

  uint64_t v12 = [v3 decodeIntegerForKey:@"Type"];
  uint64_t v13 = [v3 decodeIntegerForKey:@"CloudStatus"];

  BOOL v14 = 0;
  if (v4 && v5 && v6 && v7 && v8)
  {
    v15 = [[HDAttachmentReferenceSchemaIdentifier alloc] initWithSchemaIdentifier:v5 schemaVersion:v18 objectIdentifier:v6 attachmentIdentifier:v7];
    id v16 = [(HDAttachmentReference *)self initWithIdentifier:v4 schemaIdentifier:v15 creationDate:v8 options:v9 metadata:v11 type:v12 cloudStatus:v13];

    BOOL v14 = v16;
  }
  else
  {
    id v16 = self;
  }

  return v14;
}

- (NSUUID)identifier
{
  return self->_identifier;
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

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)options
{
  return self->_options;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)cloudStatus
{
  return self->_cloudStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end