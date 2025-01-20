@interface CBSBLBookItem
- (NSString)author;
- (NSString)identifier;
- (NSString)legacyUniqueIdentifier;
- (NSString)path;
- (NSString)storeIdentifier;
- (NSString)title;
- (id)description;
- (int64_t)type;
- (void)setAuthor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLegacyUniqueIdentifier:(id)a3;
- (void)setPath:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CBSBLBookItem

- (id)description
{
  v3 = [(CBSBLBookItem *)self title];
  v4 = [(CBSBLBookItem *)self author];
  v5 = [(CBSBLBookItem *)self path];
  v6 = [(CBSBLBookItem *)self storeIdentifier];
  v7 = [(CBSBLBookItem *)self identifier];
  v8 = [(CBSBLBookItem *)self legacyUniqueIdentifier];
  [(CBSBLBookItem *)self type];
  v9 = NSStringFromCRKBookType();
  v10 = +[NSString stringWithFormat:@"Title: %@\nAuthor: %@\nPath: %@\nStore Identifier: %@\n Identifier: %@\nLegacy Identifier: %@\nType: %@", v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)legacyUniqueIdentifier
{
  return self->_legacyUniqueIdentifier;
}

- (void)setLegacyUniqueIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_author, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end