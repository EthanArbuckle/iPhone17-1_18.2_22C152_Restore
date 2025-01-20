@interface InputFeatureDefinition
- (AMDFeatureProvider)featureProvider;
- (BOOL)isValid;
- (InputFeatureDefinition)initWithDictionary:(id)a3;
- (NSArray)featureValues;
- (NSArray)shape;
- (NSNumber)size;
- (NSString)columnName;
- (NSString)featureId;
- (NSString)featureType;
- (NSString)mapOp;
- (NSString)remapDictionaryId;
- (void)setColumnName:(id)a3;
- (void)setFeatureId:(id)a3;
- (void)setFeatureProvider:(id)a3;
- (void)setFeatureType:(id)a3;
- (void)setFeatureValues:(id)a3;
- (void)setMapOp:(id)a3;
- (void)setRemapDictionaryId:(id)a3;
- (void)setShape:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation InputFeatureDefinition

- (InputFeatureDefinition)initWithDictionary:(id)a3
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v19;
  v19 = 0;
  v17.receiver = v3;
  v17.super_class = (Class)InputFeatureDefinition;
  v19 = [(InputFeatureDefinition *)&v17 init];
  objc_storeStrong((id *)&v19, v19);
  id v5 = (id)[location[0] objectForKey:@"feature_id"];
  -[InputFeatureDefinition setFeatureId:](v19, "setFeatureId:");

  id v6 = (id)[location[0] objectForKey:@"map_op"];
  -[InputFeatureDefinition setMapOp:](v19, "setMapOp:");

  id v7 = (id)[location[0] objectForKey:@"size"];
  -[InputFeatureDefinition setSize:](v19, "setSize:");

  id v8 = (id)[location[0] objectForKey:@"shape"];
  -[InputFeatureDefinition setShape:](v19, "setShape:");

  id v9 = (id)[location[0] objectForKey:@"remap_dictionary_id"];
  -[InputFeatureDefinition setRemapDictionaryId:](v19, "setRemapDictionaryId:");

  id v10 = (id)[location[0] objectForKey:@"value"];
  -[InputFeatureDefinition setFeatureValues:](v19, "setFeatureValues:");

  id v11 = (id)[location[0] objectForKey:@"feature_type"];
  -[InputFeatureDefinition setFeatureType:](v19, "setFeatureType:");

  id v12 = (id)[location[0] objectForKey:@"column"];
  -[InputFeatureDefinition setColumnName:](v19, "setColumnName:");

  id v16 = (id)[location[0] objectForKey:@"feature_domain"];
  id v15 = (id)[location[0] objectForKey:@"feature_source"];
  id v13 = +[AMDFeatureProvider getProviderForSource:v15 WithDomain:v16];
  -[InputFeatureDefinition setFeatureProvider:](v19, "setFeatureProvider:");

  v14 = v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v14;
}

- (BOOL)isValid
{
  v4 = [(InputFeatureDefinition *)self featureId];
  char v8 = 0;
  char v6 = 0;
  BOOL v5 = 0;
  if (v4)
  {
    id v9 = [(InputFeatureDefinition *)self size];
    char v8 = 1;
    BOOL v3 = 1;
    if (!v9)
    {
      id v7 = [(InputFeatureDefinition *)self shape];
      char v6 = 1;
      BOOL v3 = v7 != 0;
    }
    BOOL v5 = v3;
  }
  if (v6) {

  }
  if (v8) {
  return v5;
  }
}

- (NSString)columnName
{
  return self->_columnName;
}

- (void)setColumnName:(id)a3
{
}

- (NSArray)featureValues
{
  return self->_featureValues;
}

- (void)setFeatureValues:(id)a3
{
}

- (NSString)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(id)a3
{
}

- (NSString)featureType
{
  return self->_featureType;
}

- (void)setFeatureType:(id)a3
{
}

- (NSString)mapOp
{
  return self->_mapOp;
}

- (void)setMapOp:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
}

- (NSString)remapDictionaryId
{
  return self->_remapDictionaryId;
}

- (void)setRemapDictionaryId:(id)a3
{
}

- (AMDFeatureProvider)featureProvider
{
  return self->_featureProvider;
}

- (void)setFeatureProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end