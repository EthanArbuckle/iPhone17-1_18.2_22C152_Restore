@interface IDSGroupStableKeyMaterialCollection
- (IDSGroupStableKeyMaterialCollection)initWithStableKeyMaterials:(id)a3;
- (NSArray)stableKeyMaterials;
- (id)description;
@end

@implementation IDSGroupStableKeyMaterialCollection

- (IDSGroupStableKeyMaterialCollection)initWithStableKeyMaterials:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSGroupStableKeyMaterialCollection;
  v6 = [(IDSGroupStableKeyMaterialCollection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stableKeyMaterials, a3);
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(IDSGroupStableKeyMaterialCollection *)self stableKeyMaterials];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p SKMCount: %lu>", v3, self, [v4 count]);

  return v5;
}

- (NSArray)stableKeyMaterials
{
  return self->_stableKeyMaterials;
}

- (void).cxx_destruct
{
}

@end