@interface CNContactSection
- (NSString)identifier;
- (NSString)sortKey;
- (NSString)title;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIdentifier:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSortKey:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CNContactSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(CNContactSection *)self title];
  [v4 setTitle:v5];

  uint64_t v6 = [(CNContactSection *)self range];
  objc_msgSend(v4, "setRange:", v6, v7);
  v8 = [(CNContactSection *)self identifier];
  [v4 setIdentifier:v8];

  v9 = [(CNContactSection *)self sortKey];
  [v4 setSortKey:v9];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (void)setTitle:(id)a3
{
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setSortKey:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F5A3A8];
  title = self->_title;
  identifier = self->_identifier;
  uint64_t v6 = NSStringFromRange(self->_range);
  uint64_t v7 = objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, @"title", title, @"identifier", identifier, @"range", v6, 0);

  return v7;
}

@end