@interface INSDeviceInfo
+ (id)newWithBuilder:(id)a3;
- (INSDeviceInfo)initWithAceVersion:(id)a3;
- (NSString)aceVersion;
- (NSString)mutableAceVersion;
- (void)setAceVersion:(id)a3;
- (void)setMutableAceVersion:(id)a3;
@end

@implementation INSDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAceVersion, 0);

  objc_storeStrong((id *)&self->_aceVersion, 0);
}

- (void)setMutableAceVersion:(id)a3
{
}

- (NSString)mutableAceVersion
{
  return self->_mutableAceVersion;
}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (void)setAceVersion:(id)a3
{
  self->_mutableAceVersion = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (INSDeviceInfo)initWithAceVersion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INSDeviceInfo;
  v6 = [(INSDeviceInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_aceVersion, a3);
  }

  return v7;
}

+ (id)newWithBuilder:(id)a3
{
  v4 = (void (**)(id, INSDeviceInfo *))a3;
  id v5 = objc_alloc_init(INSDeviceInfo);
  if (v4)
  {
    v4[2](v4, v5);
    id v6 = objc_alloc((Class)a1);
    v7 = [(INSDeviceInfo *)v5 mutableAceVersion];
    v8 = (void *)[v6 initWithAceVersion:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end