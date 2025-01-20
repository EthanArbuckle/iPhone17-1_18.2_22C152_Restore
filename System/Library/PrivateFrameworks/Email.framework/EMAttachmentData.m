@interface EMAttachmentData
+ (BOOL)supportsSecureCoding;
+ (id)attachmentWithURL:(id)a3 displayName:(id)a4;
- (EMAttachmentData)initWithCoder:(id)a3;
- (EMAttachmentData)initWithURL:(id)a3 displayName:(id)a4;
- (NSString)description;
- (NSString)displayName;
- (NSString)ef_publicDescription;
- (NSURL)url;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMAttachmentData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)attachmentWithURL:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithURL:v6 displayName:v7];

  return v8;
}

- (EMAttachmentData)initWithURL:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMAttachmentData;
  v9 = [(EMAttachmentData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p> (%@, %@)", objc_opt_class(), self, self->_url, self->_displayName];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_url hash];
  return 33 * v3 + [(NSString *)self->_displayName hash] + 1089;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(EMAttachmentData *)self url];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_url"];

  v5 = [(EMAttachmentData *)self displayName];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_displayName"];
}

- (EMAttachmentData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMAttachmentData;
  v5 = [(EMAttachmentData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;
  }
  return v5;
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  url = self->_url;
  uint64_t v6 = [MEMORY[0x1E4F60E00] fullyOrPartiallyRedactedStringForString:self->_displayName];
  id v7 = [v3 stringWithFormat:@"<%@: %p> (%@, %@)", v4, self, url, v6];

  return (NSString *)v7;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end