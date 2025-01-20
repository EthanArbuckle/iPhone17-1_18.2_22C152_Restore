@interface CRKFetchSupportedDevicePropertiesResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchSupportedDevicePropertiesResultObject)initWithCoder:(id)a3;
- (NSArray)liveProperties;
- (NSArray)staticProperties;
- (void)encodeWithCoder:(id)a3;
- (void)setLiveProperties:(id)a3;
- (void)setStaticProperties:(id)a3;
@end

@implementation CRKFetchSupportedDevicePropertiesResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchSupportedDevicePropertiesResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKFetchSupportedDevicePropertiesResultObject;
  v5 = [(CATTaskResultObject *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"staticProperties"];
    staticProperties = v5->_staticProperties;
    v5->_staticProperties = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"liveProperties"];
    liveProperties = v5->_liveProperties;
    v5->_liveProperties = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchSupportedDevicePropertiesResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchSupportedDevicePropertiesResultObject *)self staticProperties];
  [v4 encodeObject:v5 forKey:@"staticProperties"];

  v6 = [(CRKFetchSupportedDevicePropertiesResultObject *)self liveProperties];
  [v4 encodeObject:v6 forKey:@"liveProperties"];
}

- (NSArray)staticProperties
{
  return self->_staticProperties;
}

- (void)setStaticProperties:(id)a3
{
}

- (NSArray)liveProperties
{
  return self->_liveProperties;
}

- (void)setLiveProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveProperties, 0);

  objc_storeStrong((id *)&self->_staticProperties, 0);
}

@end