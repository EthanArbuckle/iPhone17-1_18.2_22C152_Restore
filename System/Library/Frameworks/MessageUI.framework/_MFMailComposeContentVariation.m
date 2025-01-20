@interface _MFMailComposeContentVariation
+ (BOOL)supportsSecureCoding;
- (BOOL)bodyIsHTML;
- (NSArray)attachmentIdentifiers;
- (NSString)body;
- (NSString)name;
- (_MFMailComposeContentVariation)initWithCoder:(id)a3;
- (_MFMailComposeContentVariation)initWithName:(id)a3;
- (id)description;
- (void)addAttachmentIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachmentIdentifiers:(id)a3;
- (void)setBody:(id)a3;
- (void)setBodyIsHTML:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation _MFMailComposeContentVariation

- (_MFMailComposeContentVariation)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MFMailComposeContentVariation;
  v5 = [(_MFMailComposeContentVariation *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)addAttachmentIdentifier:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_MFMailComposeContentVariation.m" lineNumber:31 description:@"The actual type of the identifier is required to be a string for NSSecureCoding conformance."];
  }
  attachmentIdentifiers = self->_attachmentIdentifiers;
  if (!attachmentIdentifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_attachmentIdentifiers;
    self->_attachmentIdentifiers = v6;

    attachmentIdentifiers = self->_attachmentIdentifiers;
  }
  [(NSMutableArray *)attachmentIdentifiers addObject:v9];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@:%p; name = %@>",
               self,
               self,
               self->_name);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_MFMailComposeContentVariation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_MFMailComposeContentVariation;
  v5 = [(_MFMailComposeContentVariation *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    if ([v4 containsValueForKey:@"body"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
      body = v5->_body;
      v5->_body = (NSString *)v8;

      v5->_bodyIsHTML = [v4 decodeBoolForKey:@"bodyIsHTML"];
    }
    objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"attachmentIdentifiers"];
    attachmentIdentifiers = v5->_attachmentIdentifiers;
    v5->_attachmentIdentifiers = (NSMutableArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_name forKey:@"name"];
  body = self->_body;
  if (body)
  {
    [v6 encodeObject:body forKey:@"body"];
    [v6 encodeBool:self->_bodyIsHTML forKey:@"bodyIsHTML"];
  }
  attachmentIdentifiers = self->_attachmentIdentifiers;
  if (attachmentIdentifiers) {
    [v6 encodeObject:attachmentIdentifiers forKey:@"attachmentIdentifiers"];
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (BOOL)bodyIsHTML
{
  return self->_bodyIsHTML;
}

- (void)setBodyIsHTML:(BOOL)a3
{
  self->_bodyIsHTML = a3;
}

- (NSArray)attachmentIdentifiers
{
  return &self->_attachmentIdentifiers->super;
}

- (void)setAttachmentIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_attachmentIdentifiers, 0);
}

@end