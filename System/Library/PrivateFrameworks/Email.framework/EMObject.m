@interface EMObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EMObject)initWithCoder:(id)a3;
- (EMObject)initWithObjectID:(id)a3;
- (EMObjectID)objectID;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (unint64_t)hash;
- (void)_commonInitWithObjectID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setObjectID:(id)a3;
@end

@implementation EMObject

- (void).cxx_destruct
{
}

- (EMObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMObject;
  v5 = [(EMObject *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_objectID"];
    [(EMObject *)v5 _commonInitWithObjectID:v6];
  }
  return v5;
}

- (EMObject)initWithObjectID:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMObject;
  v5 = [(EMObject *)&v7 init];
  if (v5)
  {
    if (!v4) {
      id v4 = [[EMObjectID alloc] initAsEphemeralID:1];
    }
    [(EMObject *)v5 _commonInitWithObjectID:v4];
  }

  return v5;
}

- (void)_commonInitWithObjectID:(id)a3
{
  id v6 = a3;
  id v4 = (EMObjectID *)[v6 copy];
  objectID = self->_objectID;
  self->_objectID = v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMObject *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(EMObject *)self objectID];
      objc_super v7 = [(EMObject *)v5 objectID];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(EMObject *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (EMObjectID)objectID
{
  return self->_objectID;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(EMObject *)self objectID];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_objectID"];
}

- (NSString)ef_publicDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EMObject *)self objectID];
  id v6 = [v5 stringHash];
  objc_super v7 = objc_msgSend(v6, "ef_publicDescription");
  char v8 = [v3 stringWithFormat:@"<%@: %p: %@>", v4, self, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EMObject *)self objectID];
  id v6 = [v3 stringWithFormat:@"<%@: %p>\n\tObjectID: %@", v4, self, v5];

  return (NSString *)v6;
}

- (void)setObjectID:(id)a3
{
}

@end