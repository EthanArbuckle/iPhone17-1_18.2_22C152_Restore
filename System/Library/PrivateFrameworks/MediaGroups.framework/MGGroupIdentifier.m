@interface MGGroupIdentifier
+ (BOOL)supportsSecureCoding;
+ (MGGroupIdentifier)groupIdentifierWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MGGroupIdentifier)initWithCoder:(id)a3;
- (MGGroupIdentifier)initWithURLComponents:(id)a3;
- (NSString)description;
- (NSString)normalized;
- (NSURLComponents)components;
- (id)data;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MGGroupIdentifier

- (MGGroupIdentifier)initWithURLComponents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MGGroupIdentifier;
  v5 = [(MGGroupIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    components = v5->_components;
    v5->_components = (NSURLComponents *)v6;
  }
  return v5;
}

- (MGGroupIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.MediaGroups.normalized"];

  if (v5)
  {
    uint64_t v6 = (MGGroupIdentifier *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v5];
    v7 = [(MGGroupIdentifier *)self initWithURLComponents:v6];
    self = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)normalized
{
  v2 = [(MGGroupIdentifier *)self components];
  v3 = [v2 URL];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

+ (MGGroupIdentifier)groupIdentifierWithUUID:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F08BA0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setScheme:@"mg-entity"];
  id v7 = objc_alloc(MEMORY[0x263F08BD0]);
  v8 = [v5 UUIDString];

  objc_super v9 = (void *)[v7 initWithName:@"gi" value:v8];
  v13[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v6 setQueryItems:v10];

  v11 = (void *)[objc_alloc((Class)a1) initWithURLComponents:v6];
  return (MGGroupIdentifier *)v11;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(MGGroupIdentifier *)self normalized];
  id v7 = [v3 stringWithFormat:@"<%@: %p, %@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)data
{
  v2 = [(MGGroupIdentifier *)self normalized];
  v3 = [v2 dataUsingEncoding:4];

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(MGGroupIdentifier *)self normalized];
  id v6 = [v4 normalized];

  int64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (unint64_t)hash
{
  v2 = [(MGGroupIdentifier *)self normalized];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MGGroupIdentifier *)a3;
  if (self == v4)
  {
    char v11 = 1;
    id v5 = self;
  }
  else
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v5];
      if (v6)
      {
        int64_t v7 = [[MGGroupIdentifier alloc] initWithURLComponents:v6];

        id v5 = v7;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(MGGroupIdentifier *)self components];
      objc_super v9 = [(MGGroupIdentifier *)v5 components];
      char v10 = [v8 isEqual:v9];

      if (v10)
      {
        char v11 = 1;
      }
      else
      {
        v12 = MGGroupIdentifierCopyApplyingHashing(v5);
        v13 = [(MGGroupIdentifier *)self components];
        v14 = [v12 components];
        char v15 = [v13 isEqual:v14];

        if (v15)
        {
          char v11 = 1;
        }
        else
        {
          v16 = MGGroupIdentifierCopyApplyingHashing(self);

          v17 = [v16 components];
          v18 = [(MGGroupIdentifier *)v5 components];
          char v11 = [v17 isEqual:v18];

          v12 = v16;
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MGGroupIdentifier *)self normalized];
  [v4 encodeObject:v5 forKey:@"com.apple.MediaGroups.normalized"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURLComponents)components
{
  return self->_components;
}

- (void).cxx_destruct
{
}

@end