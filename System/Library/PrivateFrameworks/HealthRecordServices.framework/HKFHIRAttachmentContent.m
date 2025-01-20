@interface HKFHIRAttachmentContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFHIRAttachmentContent)initWithCoder:(id)a3;
- (HKFHIRAttachmentContent)initWithContent:(id)a3 contentType:(id)a4;
- (NSData)content;
- (NSString)contentType;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRAttachmentContent

- (HKFHIRAttachmentContent)initWithContent:(id)a3 contentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFHIRAttachmentContent;
  v8 = [(HKFHIRAttachmentContent *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    content = v8->_content;
    v8->_content = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    contentType = v8->_contentType;
    v8->_contentType = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (HKFHIRAttachmentContent *)a3;
  if (self == v6)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      content = self->_content;
      uint64_t v9 = [(HKFHIRAttachmentContent *)v7 content];
      if (content == v9) {
        goto LABEL_9;
      }
      uint64_t v10 = [(HKFHIRAttachmentContent *)v7 content];
      if (!v10)
      {
        char v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v3 = (void *)v10;
      uint64_t v11 = self->_content;
      v4 = [(HKFHIRAttachmentContent *)v7 content];
      if ([(NSData *)v11 isEqual:v4])
      {
LABEL_9:
        contentType = self->_contentType;
        uint64_t v14 = [(HKFHIRAttachmentContent *)v7 contentType];
        if (contentType == (NSString *)v14)
        {

          char v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          uint64_t v16 = [(HKFHIRAttachmentContent *)v7 contentType];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_contentType;
            v19 = [(HKFHIRAttachmentContent *)v7 contentType];
            char v12 = [(NSString *)v18 isEqualToString:v19];
          }
          else
          {

            char v12 = 0;
          }
        }
        if (content == v9) {
          goto LABEL_17;
        }
      }
      else
      {
        char v12 = 0;
      }

      goto LABEL_17;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_content hash];
  return [(NSString *)self->_contentType hash] ^ v3;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p, attachment contentType %@ items>", v5, self, self->_contentType];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFHIRAttachmentContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Content"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContentType"];

  id v7 = [(HKFHIRAttachmentContent *)self initWithContent:v5 contentType:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  content = self->_content;
  id v5 = a3;
  [v5 encodeObject:content forKey:@"Content"];
  [v5 encodeObject:self->_contentType forKey:@"ContentType"];
}

- (NSData)content
{
  return self->_content;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end