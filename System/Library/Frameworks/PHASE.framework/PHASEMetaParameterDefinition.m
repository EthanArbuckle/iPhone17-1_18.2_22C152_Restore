@interface PHASEMetaParameterDefinition
+ (PHASEMetaParameterDefinition)new;
- (PHASEMetaParameterDefinition)init;
- (PHASEMetaParameterDefinition)initWithValue:(id)a3;
- (id)initInternal;
- (id)value;
@end

@implementation PHASEMetaParameterDefinition

- (PHASEMetaParameterDefinition)init
{
  return 0;
}

+ (PHASEMetaParameterDefinition)new
{
  return 0;
}

- (id)initInternal
{
  return 0;
}

- (PHASEMetaParameterDefinition)initWithValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASEMetaParameterDefinition;
  v6 = [(PHASEDefinition *)&v10 initInternal];
  v7 = (PHASEMetaParameterDefinition *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 2, a3);
    v8 = v7;
  }

  return v7;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end