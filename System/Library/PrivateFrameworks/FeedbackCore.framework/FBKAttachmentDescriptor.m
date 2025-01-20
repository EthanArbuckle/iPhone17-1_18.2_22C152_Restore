@interface FBKAttachmentDescriptor
+ (BOOL)supportsSecureCoding;
- (FBKAttachmentDescriptor)initWithCoder:(id)a3;
- (FBKAttachmentDescriptor)initWithDescription:(id)a3 URL:(id)a4;
- (FBKAttachmentDescriptor)initWithDescription:(id)a3 diagnosticExtensionIdentifier:(id)a4;
- (NSString)diagnosticExtensionIdentifier;
- (NSString)localizedDescription;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticExtensionIdentifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation FBKAttachmentDescriptor

- (FBKAttachmentDescriptor)initWithDescription:(id)a3 diagnosticExtensionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FBKAttachmentDescriptor;
  v8 = [(FBKAttachmentDescriptor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(FBKAttachmentDescriptor *)v8 setLocalizedDescription:v6];
    [(FBKAttachmentDescriptor *)v9 setDiagnosticExtensionIdentifier:v7];
  }

  return v9;
}

- (FBKAttachmentDescriptor)initWithDescription:(id)a3 URL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FBKAttachmentDescriptor;
  v8 = [(FBKAttachmentDescriptor *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(FBKAttachmentDescriptor *)v8 setLocalizedDescription:v6];
    [(FBKAttachmentDescriptor *)v9 setUrl:v7];
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_diagnosticExtensionIdentifier forKey:@"diagnosticExtensionIdentifier"];
  [v5 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
}

- (FBKAttachmentDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FBKAttachmentDescriptor;
  id v5 = [(FBKAttachmentDescriptor *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diagnosticExtensionIdentifier"];
    diagnosticExtensionIdentifier = v5->_diagnosticExtensionIdentifier;
    v5->_diagnosticExtensionIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;
  }
  return v5;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)diagnosticExtensionIdentifier
{
  return self->_diagnosticExtensionIdentifier;
}

- (void)setDiagnosticExtensionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

@end