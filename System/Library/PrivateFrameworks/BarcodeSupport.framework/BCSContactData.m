@interface BCSContactData
+ (BOOL)supportsSecureCoding;
- (BCSContactData)initWithCoder:(id)a3;
- (BCSContactData)initWithContact:(id)a3;
- (CNContact)contact;
- (NSString)extraPreviewText;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSContactData

- (BCSContactData)initWithContact:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSContactData;
  v5 = [(BCSContactData *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v6;

    v8 = v5;
  }

  return v5;
}

- (int64_t)type
{
  return 2;
}

- (NSString)extraPreviewText
{
  return 0;
}

- (BCSContactData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", getCNContactClass(), @"contact");

  uint64_t v6 = [(BCSContactData *)self initWithContact:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
}

@end