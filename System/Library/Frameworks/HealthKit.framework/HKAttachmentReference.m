@interface HKAttachmentReference
+ (BOOL)supportsSecureCoding;
- (HKAttachment)attachment;
- (HKAttachmentReference)initWithCoder:(id)a3;
- (NSDate)creationDate;
- (NSDictionary)metadata;
- (NSString)objectIdentifier;
- (NSUUID)identifier;
- (id)_initWithIdentifier:(id)a3 objectIdentifier:(id)a4 attachment:(id)a5 creationDate:(id)a6 metadata:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKAttachmentReference

- (id)_initWithIdentifier:(id)a3 objectIdentifier:(id)a4 attachment:(id)a5 creationDate:(id)a6 metadata:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKAttachmentReference;
  v17 = [(HKAttachmentReference *)&v21 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HKAttachmentReference allocWithZone:a3];
  identifier = self->_identifier;
  objectIdentifier = self->_objectIdentifier;
  attachment = self->_attachment;
  creationDate = self->_creationDate;
  metadata = self->_metadata;

  return [(HKAttachmentReference *)v4 _initWithIdentifier:identifier objectIdentifier:objectIdentifier attachment:attachment creationDate:creationDate metadata:metadata];
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
  [v5 encodeObject:self->_objectIdentifier forKey:@"ObjectIdentifier"];
  [v5 encodeObject:self->_attachment forKey:@"Attachment"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
}

- (HKAttachmentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ObjectIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Attachment"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
  v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"Metadata"];

  v11 = [(HKAttachmentReference *)self _initWithIdentifier:v5 objectIdentifier:v6 attachment:v7 creationDate:v8 metadata:v10];
  return v11;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)objectIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HKAttachment)attachment
{
  return (HKAttachment *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end