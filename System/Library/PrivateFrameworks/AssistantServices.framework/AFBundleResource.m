@interface AFBundleResource
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFBundleResource)init;
- (AFBundleResource)initWithBuilder:(id)a3;
- (AFBundleResource)initWithCoder:(id)a3;
- (AFBundleResource)initWithName:(id)a3 extension:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)extension;
- (NSString)name;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFBundleResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)extension
{
  return self->_extension;
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"AFBundleResource::name"];
  [v5 encodeObject:self->_extension forKey:@"AFBundleResource::extension"];
}

- (AFBundleResource)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBundleResource::name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBundleResource::extension"];

  v7 = [(AFBundleResource *)self initWithName:v5 extension:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFBundleResource *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFBundleResource *)v5 name];
      name = self->_name;
      if (name == v6 || [(NSString *)name isEqual:v6])
      {
        v8 = [(AFBundleResource *)v5 extension];
        extension = self->_extension;
        BOOL v10 = extension == v8 || [(NSString *)extension isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_extension hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFBundleResource;
  id v5 = [(AFBundleResource *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {name = %@, extension = %@}", v5, self->_name, self->_extension];

  return v6;
}

- (id)description
{
  return [(AFBundleResource *)self _descriptionWithIndent:0];
}

- (AFBundleResource)initWithName:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__AFBundleResource_initWithName_extension___block_invoke;
  v12[3] = &unk_1E592A820;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(AFBundleResource *)self initWithBuilder:v12];

  return v10;
}

void __43__AFBundleResource_initWithName_extension___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setName:v3];
  [v4 setExtension:*(void *)(a1 + 40)];
}

- (AFBundleResource)init
{
  return [(AFBundleResource *)self initWithBuilder:0];
}

- (AFBundleResource)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFBundleResourceMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFBundleResource;
  id v5 = [(AFBundleResource *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFBundleResourceMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFBundleResourceMutation *)v7 isDirty])
    {
      id v8 = [(_AFBundleResourceMutation *)v7 getName];
      uint64_t v9 = [v8 copy];
      name = v6->_name;
      v6->_name = (NSString *)v9;

      v11 = [(_AFBundleResourceMutation *)v7 getExtension];
      uint64_t v12 = [v11 copy];
      extension = v6->_extension;
      v6->_extension = (NSString *)v12;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFBundleResourceMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFBundleResourceMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFBundleResourceMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFBundleResource);
      id v7 = [(_AFBundleResourceMutation *)v5 getName];
      uint64_t v8 = [v7 copy];
      name = v6->_name;
      v6->_name = (NSString *)v8;

      BOOL v10 = [(_AFBundleResourceMutation *)v5 getExtension];
      uint64_t v11 = [v10 copy];
      extension = v6->_extension;
      v6->_extension = (NSString *)v11;
    }
    else
    {
      id v6 = (AFBundleResource *)[(AFBundleResource *)self copy];
    }
  }
  else
  {
    id v6 = (AFBundleResource *)[(AFBundleResource *)self copy];
  }

  return v6;
}

@end