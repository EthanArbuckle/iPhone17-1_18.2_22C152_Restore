@interface AADevice
- (AADevice)initWithDictionary:(id)a3;
- (NSString)model;
- (NSString)modelDisplayName;
- (NSString)modelLargePhotoURL1x;
- (NSString)modelLargePhotoURL2x;
- (NSString)modelLargePhotoURL3x;
- (NSString)modelSmallPhotoURL1x;
- (NSString)modelSmallPhotoURL2x;
- (NSString)modelSmallPhotoURL3x;
- (NSString)name;
- (NSString)osVersion;
- (NSString)swVersion;
@end

@implementation AADevice

- (AADevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(AADevice *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"osVersion"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"swVersion"];
    swVersion = v5->_swVersion;
    v5->_swVersion = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:@"modelSmallPhotoURL3x"];
    modelSmallPhotoURL3x = v5->_modelSmallPhotoURL3x;
    v5->_modelSmallPhotoURL3x = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:@"modelSmallPhotoURL2x"];
    modelSmallPhotoURL2x = v5->_modelSmallPhotoURL2x;
    v5->_modelSmallPhotoURL2x = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"modelSmallPhotoURL1x"];
    modelSmallPhotoURL1x = v5->_modelSmallPhotoURL1x;
    v5->_modelSmallPhotoURL1x = (NSString *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:@"modelLargePhotoURL3x"];
    modelLargePhotoURL3x = v5->_modelLargePhotoURL3x;
    v5->_modelLargePhotoURL3x = (NSString *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:@"modelLargePhotoURL2x"];
    modelLargePhotoURL2x = v5->_modelLargePhotoURL2x;
    v5->_modelLargePhotoURL2x = (NSString *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:@"modelLargePhotoURL1x"];
    modelLargePhotoURL1x = v5->_modelLargePhotoURL1x;
    v5->_modelLargePhotoURL1x = (NSString *)v24;

    uint64_t v26 = [v4 objectForKeyedSubscript:@"modelDisplayName"];
    modelDisplayName = v5->_modelDisplayName;
    v5->_modelDisplayName = (NSString *)v26;
  }
  return v5;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (NSString)modelSmallPhotoURL3x
{
  return self->_modelSmallPhotoURL3x;
}

- (NSString)modelSmallPhotoURL2x
{
  return self->_modelSmallPhotoURL2x;
}

- (NSString)modelSmallPhotoURL1x
{
  return self->_modelSmallPhotoURL1x;
}

- (NSString)modelLargePhotoURL3x
{
  return self->_modelLargePhotoURL3x;
}

- (NSString)modelLargePhotoURL2x
{
  return self->_modelLargePhotoURL2x;
}

- (NSString)modelLargePhotoURL1x
{
  return self->_modelLargePhotoURL1x;
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL3x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL3x, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end