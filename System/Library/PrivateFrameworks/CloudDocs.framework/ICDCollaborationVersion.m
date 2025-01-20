@interface ICDCollaborationVersion
+ (BOOL)supportsSecureCoding;
- (ICDCollaborationVersion)initWithCoder:(id)a3;
- (ICDCollaborationVersion)initWithCollaborationSignature:(id)a3;
- (NSData)collaborationSignature;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICDCollaborationVersion

- (ICDCollaborationVersion)initWithCollaborationSignature:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDCollaborationVersion;
  v5 = [(ICDCollaborationVersion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "br_md5");
    collaborationSignature = v5->_collaborationSignature;
    v5->_collaborationSignature = (NSData *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ sig:%@>", objc_opt_class(), self->_collaborationSignature];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICDCollaborationVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDCollaborationVersion;
  v5 = [(ICDCollaborationVersion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    collaborationSignature = v5->_collaborationSignature;
    v5->_collaborationSignature = (NSData *)v6;
  }
  return v5;
}

- (NSData)collaborationSignature
{
  return self->_collaborationSignature;
}

- (void).cxx_destruct
{
}

@end