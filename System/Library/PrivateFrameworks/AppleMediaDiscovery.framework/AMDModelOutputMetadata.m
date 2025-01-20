@interface AMDModelOutputMetadata
- (AMDModelOutputMetadata)initWithDictionary:(id)a3;
- (BOOL)isValid;
- (int64_t)dataType;
- (int64_t)getDataType;
- (void)setDataType:(int64_t)a3;
@end

@implementation AMDModelOutputMetadata

- (AMDModelOutputMetadata)initWithDictionary:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0;
  v8.receiver = v3;
  v8.super_class = (Class)AMDModelOutputMetadata;
  v10 = [(AMDModelOutputMetadata *)&v8 init];
  objc_storeStrong((id *)&v10, v10);
  id v6 = (id)[location[0] objectForKey:@"data_type"];
  int64_t v4 = +[AMDModelInputMetadata getDataTypeFromString:](AMDModelInputMetadata, "getDataTypeFromString:");
  [(AMDModelOutputMetadata *)v10 setDataType:v4];

  v7 = v10;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v7;
}

- (BOOL)isValid
{
  return [(AMDModelOutputMetadata *)self dataType] != 0;
}

- (int64_t)getDataType
{
  return [(AMDModelOutputMetadata *)self dataType];
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

@end