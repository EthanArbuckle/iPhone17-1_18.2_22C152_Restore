@interface MSAttachmentItem
+ (BOOL)supportsSecureCoding;
- (MSAttachmentItem)initWithCoder:(id)a3;
- (MSAttachmentItem)initWithContentID:(id)a3 uttype:(id)a4 data:(id)a5 additionalMarkup:(id)a6;
- (NSData)data;
- (NSString)additionalMarkup;
- (NSString)contentID;
- (UTType)uttype;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSAttachmentItem

- (MSAttachmentItem)initWithContentID:(id)a3 uttype:(id)a4 data:(id)a5 additionalMarkup:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MSAttachmentItem;
  v14 = [(MSAttachmentItem *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    contentID = v14->_contentID;
    v14->_contentID = (NSString *)v15;

    objc_storeStrong((id *)&v14->_uttype, a4);
    uint64_t v17 = [v12 copy];
    data = v14->_data;
    v14->_data = (NSData *)v17;

    uint64_t v19 = [v13 copy];
    additionalMarkup = v14->_additionalMarkup;
    v14->_additionalMarkup = (NSString *)v19;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(MSAttachmentItem *)self contentID];
  [v8 encodeObject:v4 forKey:@"EFPropertyKey_contentID"];

  v5 = [(MSAttachmentItem *)self uttype];
  [v8 encodeObject:v5 forKey:@"EFPropertyKey_uttype"];

  v6 = [(MSAttachmentItem *)self data];
  [v8 encodeObject:v6 forKey:@"EFPropertyKey_data"];

  v7 = [(MSAttachmentItem *)self additionalMarkup];
  [v8 encodeObject:v7 forKey:@"EFPropertyKey_additionalMarkup"];
}

- (MSAttachmentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSAttachmentItem;
  v5 = [(MSAttachmentItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_contentID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_uttype"];
    uttype = v5->_uttype;
    v5->_uttype = (UTType *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_data"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_additionalMarkup"];
    additionalMarkup = v5->_additionalMarkup;
    v5->_additionalMarkup = (NSString *)v12;
  }
  return v5;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (UTType)uttype
{
  return self->_uttype;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)additionalMarkup
{
  return self->_additionalMarkup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalMarkup, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uttype, 0);

  objc_storeStrong((id *)&self->_contentID, 0);
}

@end