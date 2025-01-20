@interface MSRichLink
+ (BOOL)supportsSecureCoding;
- (LPLinkMetadata)_linkMetadata;
- (MSRichLink)init;
- (MSRichLink)initWithCoder:(id)a3;
- (MSRichLink)initWithURL:(id)a3;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setURL:(id)a3;
- (void)set_linkMetadata:(id)a3;
@end

@implementation MSRichLink

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSRichLink)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSRichLink;
  return [(MSRichLink *)&v3 init];
}

- (MSRichLink)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSRichLink;
  v6 = [(MSRichLink *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URL, a3);
  }

  return v7;
}

- (MSRichLink)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSRichLink;
  id v5 = [(MSRichLink *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkMetadata"];
    linkMetadata = v5->_linkMetadata;
    v5->_linkMetadata = (LPLinkMetadata *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  linkMetadata = self->_linkMetadata;
  id v5 = a3;
  [v5 encodeObject:linkMetadata forKey:@"linkMetadata"];
  [v5 encodeObject:self->_URL forKey:@"URL"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[MSRichLink allocWithZone:a3] init];
  id v5 = (void *)[(NSURL *)self->_URL copy];
  [(MSRichLink *)v4 setURL:v5];

  uint64_t v6 = (void *)[(LPLinkMetadata *)self->_linkMetadata copy];
  [(MSRichLink *)v4 set_linkMetadata:v6];

  return v4;
}

- (LPLinkMetadata)_linkMetadata
{
  return self->_linkMetadata;
}

- (void)set_linkMetadata:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_linkMetadata, 0);
}

@end