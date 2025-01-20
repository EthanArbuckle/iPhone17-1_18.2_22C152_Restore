@interface BCSBusinessLinkContentItem
- (BOOL)isDefault;
- (NSString)description;
- (NSString)language;
- (NSString)subtitle;
- (NSString)title;
- (id)initWithBusinessLinkContentItemModel:(id *)a1;
@end

@implementation BCSBusinessLinkContentItem

- (id)initWithBusinessLinkContentItemModel:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BCSBusinessLinkContentItem;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = v3;
  if (self) {
    businessLinkContentItemModel = self->_businessLinkContentItemModel;
  }
  else {
    businessLinkContentItemModel = 0;
  }
  id v6 = (id)[v3 appendObject:businessLinkContentItemModel withName:@"businessLinkContentItemModel"];
  objc_super v7 = [v4 build];

  return (NSString *)v7;
}

- (BOOL)isDefault
{
  if (self)
  {
    businessLinkContentItemModel = self->_businessLinkContentItemModel;
    if (businessLinkContentItemModel) {
      LOBYTE(self) = businessLinkContentItemModel->_isDefault;
    }
    else {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (NSString)title
{
  if (self) {
    self = (BCSBusinessLinkContentItem *)self->_businessLinkContentItemModel;
  }
  return [(BCSBusinessLinkContentItem *)self title];
}

- (NSString)subtitle
{
  if (self) {
    self = (BCSBusinessLinkContentItem *)self->_businessLinkContentItemModel;
  }
  return [(BCSBusinessLinkContentItem *)self subtitle];
}

- (NSString)language
{
  if (self) {
    self = (BCSBusinessLinkContentItem *)self->_businessLinkContentItemModel;
  }
  return [(BCSBusinessLinkContentItem *)self language];
}

- (void).cxx_destruct
{
}

@end