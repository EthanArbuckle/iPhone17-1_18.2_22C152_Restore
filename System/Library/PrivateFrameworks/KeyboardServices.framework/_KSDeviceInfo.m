@interface _KSDeviceInfo
+ (id)ksDecviceWithName:(id)a3 swVersion:(id)a4 model:(id)a5 modelDisplayName:(id)a6;
+ (id)ksDecviceWithiCloudDeviceInfo:(id)a3;
+ (id)ksDeviceWithName:(id)a3 needsUpgrade:(BOOL)a4;
+ (id)ksDeviceWithName:(id)a3 swVersion:(id)a4;
- (BOOL)needsUpdate;
- (NSString)model;
- (NSString)modelDisplayName;
- (NSString)name;
- (NSString)swVersion;
- (void)setModel:(id)a3;
- (void)setModelDisplayName:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setSwVersion:(id)a3;
@end

@implementation _KSDeviceInfo

+ (id)ksDecviceWithiCloudDeviceInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_KSDeviceInfo);
  v5 = [v3 objectForKeyedSubscript:@"name"];
  [(_KSDeviceInfo *)v4 setName:v5];

  v6 = [v3 objectForKeyedSubscript:@"swVersion"];
  [(_KSDeviceInfo *)v4 setSwVersion:v6];

  v7 = [v3 objectForKeyedSubscript:@"model"];
  [(_KSDeviceInfo *)v4 setModel:v7];

  v8 = [v3 objectForKeyedSubscript:@"modelDisplayName"];

  [(_KSDeviceInfo *)v4 setModelDisplayName:v8];
  return v4;
}

+ (id)ksDecviceWithName:(id)a3 swVersion:(id)a4 model:(id)a5 modelDisplayName:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(_KSDeviceInfo);
  [(_KSDeviceInfo *)v11 setName:v10];

  [(_KSDeviceInfo *)v11 setSwVersion:v9];
  [(_KSDeviceInfo *)v11 setModel:v8];
  [(_KSDeviceInfo *)v11 setModelDisplayName:v8];

  return v11;
}

+ (id)ksDeviceWithName:(id)a3 needsUpgrade:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_alloc_init(_KSDeviceInfo);
  [(_KSDeviceInfo *)v6 setName:v5];

  [(_KSDeviceInfo *)v6 setNeedsUpdate:v4];
  return v6;
}

+ (id)ksDeviceWithName:(id)a3 swVersion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(_KSDeviceInfo);
  [(_KSDeviceInfo *)v7 setName:v6];

  [(_KSDeviceInfo *)v7 setSwVersion:v5];
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (void)setSwVersion:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void)setModelDisplayName:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end