@interface BCSCallToActionItem
+ (BOOL)supportsSecureCoding;
- (BCSCallToActionItem)initWithCallToAction:(id)a3;
- (BCSCallToActionItem)initWithCoder:(id)a3;
- (BCSCallToActionItem)initWithTitle:(id)a3 subtitle:(id)a4 language:(id)a5 body:(id)a6 isDefault:(BOOL)a7;
- (BOOL)isDefault;
- (NSString)body;
- (NSString)language;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSCallToActionItem

- (BCSCallToActionItem)initWithCallToAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v4 subtitle];
  v7 = [v4 language];
  v8 = [v4 body];
  uint64_t v9 = [v4 isDefault];

  v10 = [(BCSCallToActionItem *)self initWithTitle:v5 subtitle:v6 language:v7 body:v8 isDefault:v9];
  return v10;
}

- (BCSCallToActionItem)initWithTitle:(id)a3 subtitle:(id)a4 language:(id)a5 body:(id)a6 isDefault:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)BCSCallToActionItem;
  v16 = [(BCSCallToActionItem *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    title = v16->_title;
    v16->_title = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    language = v16->_language;
    v16->_language = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    body = v16->_body;
    v16->_body = (NSString *)v23;

    v16->_isDefault = a7;
  }

  return v16;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)BCSCallToActionItem;
  id v4 = [(BCSCallToActionItem *)&v11 description];
  v5 = [(BCSCallToActionItem *)self title];
  v6 = [(BCSCallToActionItem *)self subtitle];
  v7 = [(BCSCallToActionItem *)self language];
  v8 = [(BCSCallToActionItem *)self body];
  uint64_t v9 = [v3 stringWithFormat:@"%@ - title:%@ - subtitle:%@ - language:%@ - body:%@ - isDefault:%d", v4, v5, v6, v7, v8, -[BCSCallToActionItem isDefault](self, "isDefault")];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"BCSCallToActionTitleKey"];
  [v5 encodeObject:self->_subtitle forKey:@"BCSCallToActionSubtitleKey"];
  [v5 encodeObject:self->_language forKey:@"BCSCallToActionLangaugeKey"];
  [v5 encodeObject:self->_body forKey:@"BCSCallToActionBodyKey"];
  [v5 encodeBool:self->_isDefault forKey:@"BCSCallToActionIsDefaultKey"];
}

- (BCSCallToActionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSCallToActionTitleKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSCallToActionSubtitleKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSCallToActionLangaugeKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSCallToActionBodyKey"];
  uint64_t v9 = [v4 decodeBoolForKey:@"BCSCallToActionIsDefaultKey"];

  v10 = [(BCSCallToActionItem *)self initWithTitle:v5 subtitle:v6 language:v7 body:v8 isDefault:v9];
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = [(BCSCallToActionItem *)self title];
    uint64_t v7 = [v6 copyWithZone:a3];
    v8 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v7;

    uint64_t v9 = [(BCSCallToActionItem *)self subtitle];
    uint64_t v10 = [v9 copyWithZone:a3];
    objc_super v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(BCSCallToActionItem *)self language];
    uint64_t v13 = [v12 copyWithZone:a3];
    id v14 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v13;

    id v15 = [(BCSCallToActionItem *)self body];
    uint64_t v16 = [v15 copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v16;

    *(unsigned char *)(v5 + 8) = [(BCSCallToActionItem *)self isDefault];
  }
  return (id)v5;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

@end