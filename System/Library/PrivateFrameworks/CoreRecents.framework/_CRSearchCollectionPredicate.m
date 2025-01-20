@interface _CRSearchCollectionPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)collection;
- (NSString)key;
- (_CRSearchCollectionPredicate)initWithCoder:(id)a3;
- (_CRSearchCollectionPredicate)initWithKey:(id)a3 collection:(id)a4;
- (id)asNSPredicate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CRSearchCollectionPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_collection forKey:@"collection"];
}

- (_CRSearchCollectionPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"collection"];

  v7 = [(_CRSearchCollectionPredicate *)self initWithKey:v5 collection:v6];
  return v7;
}

- (_CRSearchCollectionPredicate)initWithKey:(id)a3 collection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CRSearchCollectionPredicate;
  v8 = [(CRSearchPredicate *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    key = v8->_key;
    v8->_key = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    collection = v8->_collection;
    v8->_collection = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (id)asNSPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", self->_key, self->_collection];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CRSearchCollectionPredicate *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (key = self->_key, (unint64_t)key | (unint64_t)v4->_key)
      && !-[NSString isEqual:](key, "isEqual:")
      || (collection = self->_collection, (unint64_t)collection | (unint64_t)v4->_collection)
      && !-[NSArray isEqual:](collection, "isEqual:"))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_key];
  return [MEMORY[0x1E4F5A418] arrayHash:self->_collection] - v3 + 32 * v3 + 16337;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)collection
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end