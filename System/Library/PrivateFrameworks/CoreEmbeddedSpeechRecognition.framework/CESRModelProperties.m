@interface CESRModelProperties
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CESRModelProperties)initWithCoder:(id)a3;
- (CESRModelProperties)initWithModelVersion:(id)a3 modelType:(id)a4 modelRoot:(id)a5;
- (NSString)modelRoot;
- (NSString)modelType;
- (NSString)modelVersion;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CESRModelProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelRoot, 0);
  objc_storeStrong((id *)&self->_modelType, 0);

  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (NSString)modelRoot
{
  return self->_modelRoot;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)encodeWithCoder:(id)a3
{
  modelVersion = self->_modelVersion;
  id v5 = a3;
  [v5 encodeObject:modelVersion forKey:@"CESRModelProperties::modelVersion"];
  [v5 encodeObject:self->_modelType forKey:@"CESRModelProperties::modelType"];
  [v5 encodeObject:self->_modelRoot forKey:@"CESRModelProperties::modelRoot"];
}

- (CESRModelProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CESRModelProperties::modelVersion"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CESRModelProperties::modelType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CESRModelProperties::modelRoot"];

  v8 = [(CESRModelProperties *)self initWithModelVersion:v5 modelType:v6 modelRoot:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CESRModelProperties *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(CESRModelProperties *)v5 modelVersion];
      modelVersion = self->_modelVersion;
      if (modelVersion == v6 || [(NSString *)modelVersion isEqual:v6])
      {
        v8 = [(CESRModelProperties *)v5 modelType];
        modelType = self->_modelType;
        if (modelType == v8 || [(NSString *)modelType isEqual:v8])
        {
          v10 = [(CESRModelProperties *)v5 modelRoot];
          modelRoot = self->_modelRoot;
          BOOL v12 = modelRoot == v10 || [(NSString *)modelRoot isEqual:v10];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelVersion hash];
  NSUInteger v4 = [(NSString *)self->_modelType hash] ^ v3;
  return v4 ^ [(NSString *)self->_modelRoot hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = [NSString alloc];
  v19.receiver = self;
  v19.super_class = (Class)CESRModelProperties;
  id v5 = [(CESRModelProperties *)&v19 description];
  id v6 = [NSString alloc];
  v7 = [(NSString *)self->_modelVersion description];
  v8 = (void *)[v6 initWithFormat:@"modelVersion = %@", v7];
  v20[0] = v8;
  id v9 = [NSString alloc];
  v10 = [(NSString *)self->_modelType description];
  v11 = (void *)[v9 initWithFormat:@"modelType = %@", v10];
  v20[1] = v11;
  id v12 = [NSString alloc];
  v13 = [(NSString *)self->_modelRoot description];
  v14 = (void *)[v12 initWithFormat:@"modelRoot = %@", v13];
  v20[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v16 = [v15 componentsJoinedByString:@", "];
  v17 = (void *)[v4 initWithFormat:@"%@ {%@}", v5, v16];

  return v17;
}

- (id)description
{
  return [(CESRModelProperties *)self _descriptionWithIndent:0];
}

- (CESRModelProperties)initWithModelVersion:(id)a3 modelType:(id)a4 modelRoot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CESRModelProperties;
  v11 = [(CESRModelProperties *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    modelVersion = v11->_modelVersion;
    v11->_modelVersion = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    modelType = v11->_modelType;
    v11->_modelType = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    modelRoot = v11->_modelRoot;
    v11->_modelRoot = (NSString *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _CESRModelPropertiesMutation *))a3;
  if (v4)
  {
    id v5 = [[_CESRModelPropertiesMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_CESRModelPropertiesMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(CESRModelProperties *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _CESRModelPropertiesMutation *))a3;
  id v4 = objc_alloc_init(_CESRModelPropertiesMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_CESRModelPropertiesMutation *)v4 generate];

  return v5;
}

@end