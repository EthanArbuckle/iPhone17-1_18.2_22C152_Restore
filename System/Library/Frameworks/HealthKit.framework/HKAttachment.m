@interface HKAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKAttachment)initWithCoder:(id)a3;
- (HKAttachment)initWithIdentifier:(id)a3 name:(id)a4 typeIdentifier:(id)a5 size:(int64_t)a6 creationDate:(id)a7 metadata:(id)a8;
- (NSDate)creationDate;
- (NSDictionary)metadata;
- (NSInteger)size;
- (NSString)name;
- (NSUUID)identifier;
- (UTType)contentType;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAttachment

- (HKAttachment)initWithIdentifier:(id)a3 name:(id)a4 typeIdentifier:(id)a5 size:(int64_t)a6 creationDate:(id)a7 metadata:(id)a8
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKAttachment;
  v19 = [(HKAttachment *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_name, a4);
    uint64_t v21 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v16];
    contentType = v20->_contentType;
    v20->_contentType = (UTType *)v21;

    v20->_size = a6;
    objc_storeStrong((id *)&v20->_creationDate, a7);
    objc_storeStrong((id *)&v20->_metadata, a8);
  }

  return v20;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HKAttachment *)a3;
  if (self == v5)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      identifier = self->_identifier;
      v8 = [(HKAttachment *)v6 identifier];
      if (![(NSUUID *)identifier isEqual:v8])
      {
        LOBYTE(v15) = 1;
LABEL_29:

        char v14 = v15 ^ 1;
        goto LABEL_30;
      }
      name = self->_name;
      v10 = [(HKAttachment *)v6 name];
      if (name != v10)
      {
        uint64_t v11 = [(HKAttachment *)v6 name];
        if (!v11)
        {
          LOBYTE(v15) = 1;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        v12 = self->_name;
        v13 = [(HKAttachment *)v6 name];
        if (![(NSString *)v12 isEqualToString:v13])
        {
          LOBYTE(v15) = 1;
LABEL_27:

          goto LABEL_28;
        }
        v28 = v13;
      }
      contentType = self->_contentType;
      id v17 = [(HKAttachment *)v6 contentType];
      if (![(UTType *)contentType isEqual:v17]
        || (int64_t size = self->_size, size != [(HKAttachment *)v6 size]))
      {

        LOBYTE(v15) = 1;
        goto LABEL_26;
      }
      creationDate = self->_creationDate;
      uint64_t v27 = [(HKAttachment *)v6 creationDate];
      if (-[NSDate isEqualToDate:](creationDate, "isEqualToDate:"))
      {
        metadata = self->_metadata;
        uint64_t v21 = metadata;
        if (!metadata)
        {
          uint64_t v22 = [(HKAttachment *)v6 metadata];
          if (!v22)
          {
            v26 = 0;
            LOBYTE(v15) = 0;
            id v24 = (void *)v27;
LABEL_24:

            goto LABEL_25;
          }
          v26 = (void *)v22;
          uint64_t v21 = self->_metadata;
        }
        v23 = [(HKAttachment *)v6 metadata];
        int v15 = ![(NSDictionary *)v21 isEqualToDictionary:v23];

        id v24 = (void *)v27;
        if (!metadata) {
          goto LABEL_24;
        }
      }
      else
      {
        LOBYTE(v15) = 1;
        id v24 = (void *)v27;
      }
LABEL_25:

LABEL_26:
      v13 = v28;
      if (name != v10) {
        goto LABEL_27;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v14 = 0;
  }
LABEL_30:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HKAttachment allocWithZone:a3];
  identifier = self->_identifier;
  name = self->_name;
  v7 = [(UTType *)self->_contentType identifier];
  v8 = [(HKAttachment *)v4 initWithIdentifier:identifier name:name typeIdentifier:v7 size:self->_size creationDate:self->_creationDate metadata:self->_metadata];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"Identifier"];
  [v6 encodeObject:self->_name forKey:@"Name"];
  v5 = [(UTType *)self->_contentType identifier];
  [v6 encodeObject:v5 forKey:@"TypeIdentifier"];

  [v6 encodeInteger:self->_size forKey:@"Size"];
  [v6 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v6 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (HKAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TypeIdentifier"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"Size"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
  v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Metadata"];

  v12 = 0;
  if (v5 && v6 && v7 && v8 >= 1 && v9)
  {
    self = [(HKAttachment *)self initWithIdentifier:v5 name:v6 typeIdentifier:v7 size:v8 creationDate:v9 metadata:v11];
    v12 = self;
  }

  return v12;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 24, 1);
}

- (NSInteger)size
{
  return self->_size;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end