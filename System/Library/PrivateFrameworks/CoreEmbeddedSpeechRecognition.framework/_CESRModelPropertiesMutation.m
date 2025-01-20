@interface _CESRModelPropertiesMutation
- (_CESRModelPropertiesMutation)init;
- (_CESRModelPropertiesMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setModelRoot:(id)a3;
- (void)setModelType:(id)a3;
- (void)setModelVersion:(id)a3;
@end

@implementation _CESRModelPropertiesMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelRoot, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if (*(unsigned char *)&self->_mutationFlags)
    {
      if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
      {
        v6 = self->_modelVersion;
      }
      else
      {
        v6 = [(CESRModelProperties *)baseModel modelVersion];
      }
      v7 = v6;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
        v8 = self->_modelType;
      }
      else
      {
        v8 = [(CESRModelProperties *)self->_baseModel modelType];
      }
      v9 = v8;
      if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
      {
        v10 = self->_modelRoot;
      }
      else
      {
        v10 = [(CESRModelProperties *)self->_baseModel modelRoot];
      }
      v11 = v10;
      v5 = [[CESRModelProperties alloc] initWithModelVersion:v7 modelType:v9 modelRoot:v10];

      goto LABEL_16;
    }
    v4 = (CESRModelProperties *)[(CESRModelProperties *)baseModel copy];
  }
  else
  {
    v4 = [[CESRModelProperties alloc] initWithModelVersion:self->_modelVersion modelType:self->_modelType modelRoot:self->_modelRoot];
  }
  v5 = v4;
LABEL_16:

  return v5;
}

- (void)setModelRoot:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setModelType:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setModelVersion:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_CESRModelPropertiesMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CESRModelPropertiesMutation;
  v6 = [(_CESRModelPropertiesMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_CESRModelPropertiesMutation)init
{
  return [(_CESRModelPropertiesMutation *)self initWithBaseModel:0];
}

@end