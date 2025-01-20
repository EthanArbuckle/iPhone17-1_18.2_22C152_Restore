@interface MPServerObjectDatabaseMediaAPIImportChildRelation
- (MPIdentifierSet)identifiers;
- (MPIdentifierSet)parentIdentifiers;
- (MPServerObjectDatabaseMediaAPIImportChildRelation)initWithItemIdentifiers:(id)a3 parentIdentifiers:(id)a4 childKey:(id)a5 relativeOrder:(int64_t)a6;
- (NSString)childKey;
- (int64_t)relativeOrder;
- (void)setChildKey:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setParentIdentifiers:(id)a3;
- (void)setRelativeOrder:(int64_t)a3;
@end

@implementation MPServerObjectDatabaseMediaAPIImportChildRelation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentIdentifiers, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (void)setRelativeOrder:(int64_t)a3
{
  self->_relativeOrder = a3;
}

- (int64_t)relativeOrder
{
  return self->_relativeOrder;
}

- (void)setChildKey:(id)a3
{
  self->_childKey = (NSString *)a3;
}

- (NSString)childKey
{
  return self->_childKey;
}

- (void)setParentIdentifiers:(id)a3
{
}

- (MPIdentifierSet)parentIdentifiers
{
  return self->_parentIdentifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (MPIdentifierSet)identifiers
{
  return self->_identifiers;
}

- (MPServerObjectDatabaseMediaAPIImportChildRelation)initWithItemIdentifiers:(id)a3 parentIdentifiers:(id)a4 childKey:(id)a5 relativeOrder:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (NSString *)a5;
  v20.receiver = self;
  v20.super_class = (Class)MPServerObjectDatabaseMediaAPIImportChildRelation;
  v13 = [(MPServerObjectDatabaseMediaAPIImportChildRelation *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_childKey = v12;
    v13->_relativeOrder = a6;
    uint64_t v15 = [v10 copy];
    identifiers = v14->_identifiers;
    v14->_identifiers = (MPIdentifierSet *)v15;

    uint64_t v17 = [v11 copy];
    parentIdentifiers = v14->_parentIdentifiers;
    v14->_parentIdentifiers = (MPIdentifierSet *)v17;
  }
  return v14;
}

@end