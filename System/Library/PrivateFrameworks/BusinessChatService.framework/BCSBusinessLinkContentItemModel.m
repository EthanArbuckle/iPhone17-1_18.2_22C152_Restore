@interface BCSBusinessLinkContentItemModel
+ (BOOL)supportsSecureCoding;
- (BCSBusinessLinkContentItemModel)initWithBusinessLinkContent:(id)a3;
- (BCSBusinessLinkContentItemModel)initWithCoder:(id)a3;
- (NSString)language;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithTitle:(void *)a3 subtitle:(void *)a4 language:(char)a5 isDefault:;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSBusinessLinkContentItemModel

- (BCSBusinessLinkContentItemModel)initWithBusinessLinkContent:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v4 subtitle];
  v7 = [v4 language];
  char v8 = [v4 isDefault];

  v9 = (BCSBusinessLinkContentItemModel *)-[BCSBusinessLinkContentItemModel initWithTitle:subtitle:language:isDefault:](self, v5, v6, v7, v8);
  return v9;
}

- (id)initWithTitle:(void *)a3 subtitle:(void *)a4 language:(char)a5 isDefault:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BCSBusinessLinkContentItemModel;
    a1 = objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      uint64_t v12 = [v9 copy];
      v13 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v12;

      uint64_t v14 = [v10 copy];
      v15 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v14;

      uint64_t v16 = [v11 copy];
      v17 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v16;

      *((unsigned char *)a1 + 32) = a5;
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"BCSBusinessLinkContentItemModelTitleKey"];
  [v5 encodeObject:self->_subtitle forKey:@"BCSBusinessLinkContentItemModelSubtitleKey"];
  [v5 encodeObject:self->_language forKey:@"BCSBusinessLinkContentItemModelLangaugeKey"];
  [v5 encodeBool:self->_isDefault forKey:@"BCSBusinessLinkContentItemModelIsDefaultKey"];
}

- (BCSBusinessLinkContentItemModel)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSBusinessLinkContentItemModelTitleKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSBusinessLinkContentItemModelSubtitleKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BCSBusinessLinkContentItemModelLangaugeKey"];
  char v8 = [v4 decodeBoolForKey:@"BCSBusinessLinkContentItemModelIsDefaultKey"];

  id v9 = (BCSBusinessLinkContentItemModel *)-[BCSBusinessLinkContentItemModel initWithTitle:subtitle:language:isDefault:](self, v5, v6, v7, v8);
  return v9;
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
    v6 = [(BCSBusinessLinkContentItemModel *)self title];
    uint64_t v7 = [v6 copyWithZone:a3];
    char v8 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v7;

    id v9 = [(BCSBusinessLinkContentItemModel *)self subtitle];
    uint64_t v10 = [v9 copyWithZone:a3];
    id v11 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v10;

    uint64_t v12 = [(BCSBusinessLinkContentItemModel *)self language];
    uint64_t v13 = [v12 copyWithZone:a3];
    uint64_t v14 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v13;

    if (self) {
      BOOL isDefault = self->_isDefault;
    }
    else {
      BOOL isDefault = 0;
    }
    *(unsigned char *)(v5 + 32) = isDefault;
  }
  return (id)v5;
}

- (id)succinctDescription
{
  v2 = [(BCSBusinessLinkContentItemModel *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_title withName:@"title"];
  id v5 = (id)[v3 appendObject:self->_subtitle withName:@"subtitle"];
  id v6 = (id)[v3 appendObject:self->_language withName:@"language"];
  id v7 = (id)[v3 appendBool:self->_isDefault withName:@"isDefault" ifEqualTo:1];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BCSBusinessLinkContentItemModel *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end