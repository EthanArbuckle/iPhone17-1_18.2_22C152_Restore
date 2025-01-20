@interface CPLContainerRelation
+ (BOOL)supportsSecureCoding;
- (BOOL)isKeyAsset;
- (CPLContainerRelation)initWithCoder:(id)a3;
- (NSString)containerIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)proposedScopedIdentifierForItemScopedIdentifier:(id)a3;
- (int64_t)position;
- (void)setContainerIdentifier:(id)a3;
- (void)setKeyAsset:(BOOL)a3;
- (void)setPosition:(int64_t)a3;
@end

@implementation CPLContainerRelation

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLContainerRelation)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLContainerRelation;
  v5 = [(CPLContainerRelation *)&v8 init];
  v6 = v5;
  if (v5) {
    [v5 cplDecodePropertiesFromCoder:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (void)setKeyAsset:(BOOL)a3
{
  self->_keyAsset = a3;
}

- (BOOL)isKeyAsset
{
  return self->_keyAsset;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_keyAsset) {
    v5 = @"keyAsset";
  }
  else {
    v5 = &stru_1F0D5F858;
  }
  return (id)[v3 stringWithFormat:@"<%@ [position: %ld container: %@ %@]>", v4, self->_position, self->_containerIdentifier, v5];
}

- (id)proposedScopedIdentifierForItemScopedIdentifier:(id)a3
{
  uint64_t v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 identifier];
  objc_super v8 = [(CPLContainerRelation *)self containerIdentifier];
  v9 = (void *)[v6 initWithFormat:@"%@-IN-%@", v7, v8];

  v10 = [CPLScopedIdentifier alloc];
  v11 = [v5 scopeIdentifier];

  v12 = [(CPLScopedIdentifier *)v10 initWithScopeIdentifier:v11 identifier:v9];
  return v12;
}

@end